require 'rails_helper'

RSpec.describe "recipes/show", type: :view do
  before(:each) do
    @recipe = assign(:recipe, Recipe.create!(
      :title => "Title",
      :description => "MyText",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
