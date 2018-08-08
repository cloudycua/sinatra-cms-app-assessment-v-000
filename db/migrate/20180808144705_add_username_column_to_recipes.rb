class AddUsernameColumnToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :username, :text
  end
end
