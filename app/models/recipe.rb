class Recipe < ActiveRecord::Base
  has_many :ingredient_lists
  has_many :vegetables, :through => :ingredient_lists
  has_many :meats, :through => :ingredient_lists
  has_many :dish_lists
  has_many :meals, :through => :dish_lists
  has_many :types, :through => :dish_lists
  belongs_to :user
end
