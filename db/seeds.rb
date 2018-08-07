recipe_list = {
  "Sweet and Sour Pork" => {},
  "Chicken Katsu-Don" => {},
  "Beef and Broccoli" => {}
}

recipe_list.each do |name, recipe_hash|
  i = Recipe.new
  i.name = name
  i.save
end

meat_list = {
  "Beef" => {},
  "Chicken" => {},
  "Pork" => {}
}

meat_list.each do |name, recipe_hash|
  i = Meat.new
  i.name = name
  i.save
end

vegetable_list = {
  "Carrot" => {},
  "Onion" => {},
  "Scallion" => {},
  "Nori" => {},
  "Broccoli" => {}
}

vegetable_list.each do |name, recipe_hash|
  i = Vegetable.new
  i.name = name
  i.save
end

meal_list = {
  "Breakfast" => {},
  "Lunch" => {},
  "Dinner" => {},
  "Snack" => {},
  "Dessert" => {}
}

meal_list.each do |name, recipe_hash|
  i = Meal.new
  i.name = name
  i.save
end

type_list = {
  "Main" => {},
  "Side" => {},
  "Dessert" => {}
}

type_list.each do |name, recipe_hash|
  i = Type.new
  i.name = name
  i.save
end

ingredient_list.each do |
