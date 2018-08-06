class Type < ActiveRecord::Base
  has_many :dish_lists
  has_many :recipes, :through => :dish_lists
  has_many :meals, :through => :dish_lists
end
