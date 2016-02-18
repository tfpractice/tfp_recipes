require 'unitwise'

class Ingredient < ActiveRecord::Base

  belongs_to :recipe

  def unit_quantity
  	q = read_attribute(:quantity)
  	u = read_attribute(:quantity_unit)
  	Unitwise(q, u)
    # .convert_to(self.quantity_unit)
  end
end
