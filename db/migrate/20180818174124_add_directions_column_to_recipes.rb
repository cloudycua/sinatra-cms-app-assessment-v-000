class AddDirectionsColumnToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :directions, :text
  end
end
