class CreateIngredientLists < ActiveRecord::Migration
  def change
    create_table :ingredient_lists do |t|
      t.integer :recipe_id
      t.integer :meat_id
      t.integer :vegetable_id
    end
  end
end
