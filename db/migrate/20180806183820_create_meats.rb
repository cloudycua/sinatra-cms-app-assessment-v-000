class CreateMeats < ActiveRecord::Migration
  def change
    create_table :meats do |t|
      t.string :name
    end
  end
end
