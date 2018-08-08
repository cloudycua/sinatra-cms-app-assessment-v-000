recipe_list = {
    "Pork Cutlets" => {
    },
    "Chicken Cutlets" => {
    },
    "Chicken and Broccoli" => {
    },
    "Beef and Broccoli" => {
    }
  }

recipe_list.each do |name, recipe_hash|
  r = Recipe.new
  r.name = name
  r.save
end


ingredient_list = {
    "Pork" => {
    },
    "Chicken" => {
    },
    "Broccoli" => {
    },
    "Beef" => {
    }
  }

ingredient_list.each do |name, recipe_hash|
  i = Ingredient.new
  i.name = name
  i.save
end
