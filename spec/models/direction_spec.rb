require 'rails_helper'

RSpec.describe Direction, type: :model do
  let(:user) { create(:user) }
  let(:recipe) { create(:recipe, user: user) }
  let(:direction) { build_stubbed(:direction, recipe: recipe)}

  describe 'attributes' do
    it 'has a step' do
    	expect(direction.step).to be_a_kind_of(String)
    	
    end
    it 'has a position' do
    	expect(direction.position).to be_a_kind_of(Numeric)
    	
    end
    it 'belongs to a recipe' do
    	expect(direction.recipe).to be_a_kind_of(Recipe)
    	
    end

    
  end
end
