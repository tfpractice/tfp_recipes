require 'rails_helper'

RSpec.describe Recipe, type: :model do
let(:user) { create(:user) }
let(:recipe) { build_stubbed(:recipe, user: user) }

describe 'attributes' do
  it 'has a title' do
  	expect(recipe.title).to be_a_kind_of(String)
  end
  it 'has a description' do
  	expect(recipe.description).to be_a_kind_of(String)
  end
  it 'belongs to a user' do
  	expect(recipe.user).to be_a_kind_of(User)
  end
end
end
