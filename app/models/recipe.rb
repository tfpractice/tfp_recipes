class Recipe < ActiveRecord::Base
  belongs_to :user
  mount_uploader :image, ImageUploader
  has_many :ingredients
  has_many :directions, -> { order(position: :asc) }
  accepts_nested_attributes_for :ingredients, allow_destroy: true, reject_if: proc { |attributes| attributes['name'].blank? }
  accepts_nested_attributes_for :directions, allow_destroy: true, reject_if: proc { |attributes| attributes['step'].blank? }


end
