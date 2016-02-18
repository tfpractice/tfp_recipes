require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  let(:user) { create(:user) }
  let(:recipe) { create(:recipe, user: user) }
  let(:ingredient) { build_stubbed(:ingredient, recipe: recipe)}
  let(:ingredientx) { build_stubbed_list(:ingredient, 5, recipe: recipe)}

describe 'attributes' do
  it 'has a name' do
  	expect(ingredient.name).to be_a_kind_of(String)
  end
   it 'has a quantity' do
  	expect(ingredient.quantity).to be_a_kind_of(Numeric)
  end
end



end
