require 'rails_helper'
require 'cancan/matchers'

RSpec.describe User, type: :model do
  let(:user) { build_stubbed(:user) }
  describe 'attributes' do
    it 'has an email address' do
      expect(user.email).to be_a_kind_of(String)
    end
    it 'has an username' do
      expect(user.username).to be_a_kind_of(String)
    end
    it 'has an password' do
      expect(user.password).to be_a_kind_of(String)
    end
    describe 'admin' do
      it 'has an admin' do
        expect(user.attributes).to include("admin")
      end
      it 'defaults admin to false' do
        expect(user.admin).to be false
      end
    end
    describe '#admin?' do
      it 'has and admin? method' do
        expect(user).to respond_to(:admin?)
      end
      context 'when true' do
        let(:admin) { build_stubbed(:user, admin: true) }
        it 'returns true' do
          expect(admin.admin?).to be true
        end
      end
      context 'when false' do
        let(:nonAdmin) { build_stubbed(:user) }
        it 'returns false' do
          expect(nonAdmin.admin?).to be false
        end
      end
    end
    describe 'abilities' do
      let(:ability){ Ability.new(abUser) }
      let(:abUser) { nil }
      context 'when user is admin' do
        let(:abUser) { build_stubbed(:user, admin: true) }
        it 'can manage its own recipes' do
          expect(ability).to be_able_to(:manage, Recipe.new(:user => abUser))
        end
        it 'can manage others recipes' do
          expect(ability).to be_able_to(:manage, Recipe.new(:user => user))
        end
        it 'can manage ingredients through its own recipes ' do
          recipe= build_stubbed(:recipe, user: abUser)
          expect(ability).to be_able_to(:manage, Ingredient.new(:recipe => recipe))
        end
        it 'can manage ingredients through its others recipes ' do
          recipe= build_stubbed(:recipe, user: user)
          expect(ability).to be_able_to(:manage, Ingredient.new(:recipe => recipe))
        end
      end
      context 'when user is not admin' do
        let(:abUser) { build_stubbed(:user) }
        it 'can manage its own recipes' do
          expect(ability).to be_able_to(:manage, Recipe.new(:user => abUser))
        end
        it 'cannot manage others recipes' do
          newUser = build_stubbed(:user)
          expect(ability).not_to be_able_to(:manage, Recipe.new(:user => newUser))
        end
        it 'can manage ingredients through its own recipes ' do
          recipe= build_stubbed(:recipe, user: abUser)
          expect(ability).to be_able_to(:manage, Ingredient.new(:recipe => recipe))
        end
        it 'cannot manage ingredients through others recipes ' do
          recipe = build_stubbed(:recipe, user: user)
          expect(ability).not_to be_able_to(:manage, Ingredient.new(:recipe => recipe))
        end
      end
      context 'when guest' do
        let(:recipes) { build_stubbed_list(:recipe, 5, user: user) }
        it 'can read all recipes' do
          expect(ability).to be_able_to(:read, recipes)
        end
        it 'cannot manage any existing recipes' do
          expect(ability).not_to be_able_to(:manage, recipes)
        end
        it 'cannot manage any new recipes' do
          expect(ability).not_to be_able_to(:manage, Recipe.new())
        end
        it 'cannot manage ingredients through any recipes ' do
          recipe = build_stubbed(:recipe, user: user)
          expect(ability).not_to be_able_to(:manage, Ingredient.new(:recipe => recipe))
        end
      end
    end
  end
end
