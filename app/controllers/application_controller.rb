class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  helper_method :current_or_guest_user
  protect_from_forgery with: :exception

  def current_or_guest_user
    if current_user
      if session[:guest_user_id] && session[:guest_user_id] != current_user.id
        #logging_in
        # reload guest_user to prevent caching problems before destruction
        guest_user(with_retry = false).reload.try(:destroy)
        session[:guest_user_id] = nil
      end
      current_user
    else
      guest_user
    end
  end

  def guest_user(with_retry = true)
    # Cache the value the first time it's gotten.
    @cached_guest_user ||= User.find(session[:guest_user_id] ||= create_guest_user.id)

  rescue ActiveRecord::RecordNotFound # if session[:guest_user_id] invalid
    session[:guest_user_id] = nil
    guest_user if with_retry
  end

  private
  def create_guest_user
    u = User.create(:username => "guest_#{rand(1000)}", :email => "guest_#{rand(100)}@example.com", password: "Guest1234", :admin => false)
    u.save!(:validate => false)
    session[:guest_user_id] = u.id
    u
  end




  # ____FINAL_END____
end
