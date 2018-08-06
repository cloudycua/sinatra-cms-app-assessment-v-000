class CreateDishLists < ActiveRecord::Migration
  def change
    create_table :dish_lists do |t|
      t.integer :recipe_id
      t.integer :meal_id
      t.integer :type_id
    end
  end
end
