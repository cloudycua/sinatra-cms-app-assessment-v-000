class Vegetable < ActiveRecord::Base
  has_many :ingredient_lists
end
