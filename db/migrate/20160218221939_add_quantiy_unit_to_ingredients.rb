class AddQuantiyUnitToIngredients < ActiveRecord::Migration
  def up
    add_column :ingredients, :quantity_unit, :string, default: 'cup'
    change_column_null :ingredients, :quantity_unit, false
  end

  def down
    remove_column :ingredients, :quantity_unit, :string
  end
end
