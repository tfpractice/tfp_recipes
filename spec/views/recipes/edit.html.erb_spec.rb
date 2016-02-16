require 'rails_helper'

RSpec.describe "recipes/edit", type: :view do
  before(:each) do
    @recipe = assign(:recipe, Recipe.create!(
      :title => "MyString",
      :description => "MyText",
      :user => nil
    ))
  end

  it "renders the edit recipe form" do
    render

    assert_select "form[action=?][method=?]", recipe_path(@recipe), "post" do

      assert_select "input#recipe_title[name=?]", "recipe[title]"

      assert_select "textarea#recipe_description[name=?]", "recipe[description]"

      assert_select "input#recipe_user_id[name=?]", "recipe[user_id]"
    end
  end
end
