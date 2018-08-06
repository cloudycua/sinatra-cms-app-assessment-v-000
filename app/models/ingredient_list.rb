class IngredientList < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :meat
  belongs_to :vegetable
end
