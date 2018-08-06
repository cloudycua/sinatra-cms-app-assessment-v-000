# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180806185642) do

  create_table "dish_lists", force: :cascade do |t|
    t.integer "recipe_id"
    t.integer "meal_id"
    t.integer "type_id"
  end

  create_table "ingredient_lists", force: :cascade do |t|
    t.integer "recipe_id"
    t.integer "meat_id"
    t.integer "vegetable_id"
  end

  create_table "meals", force: :cascade do |t|
    t.string "name"
  end

  create_table "meats", force: :cascade do |t|
    t.string "name"
  end

  create_table "recipes", force: :cascade do |t|
    t.string  "name"
    t.integer "user_id"
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
  end

  create_table "vegetables", force: :cascade do |t|
    t.string "name"
  end

end