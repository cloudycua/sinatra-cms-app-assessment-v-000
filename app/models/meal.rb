class Meal < ActiveRecord::Base
  has_many :dish_lists
  has_many :recipes, :through => :dish_lists
  has_many :types, :through => :dish_lists
end
