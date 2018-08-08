class RecipesController < ApplicationController

  get '/recipes' do
    if logged_in?
      erb :'/recipes/index'
    else
      redirect to 'login', locals: {message: "Please login:"}
    end
  end

  get '/recipes/new' do
    if logged_in?
      erb :'/recipes/new'
    else
      redirect to 'login', locals: {message: "Please login:"}
    end
  end

  post '/recipes' do
    if logged_in?
      @recipe = Recipe.create(params["recipe"])
      if !params["ingredient"]["name"].empty?
        @ingredient = Ingredient.create(params[:ingredient])
        RecipeIngredient.create(:ingredient_id => @ingredient.id, :recipe_id => @recipe.id)
      end
#      if !params["ingredient1"]["name"].empty?
#        @ingredient2 = Ingredient.create(params[:ingredient2])
#        RecipeIngredient.create(:ingredient_id => @ingredient2.id, :recipe_id => @recipe.id)
#      end
#      if !params["ingredient1"]["name"].empty?
#        @ingredient3 = Ingredient.create(params[:ingredient3])
#        RecipeIngredient.create(:ingredient_id => @ingredient3.id, :recipe_id => @recipe.id)
#      end
      @recipe.save
      binding.pry
      redirect "/recipes/#{@recipe.id}"
    else
      redirect to 'login', locals: {message: "Please login:"}
    end
  end

  get '/recipes/:id' do
    if logged_in?
      @recipe = Recipe.find_by_id(params[:id])
      erb :'/recipes/show'
    else
      redirect to 'login', locals: {message: "Please login:"}
    end
  end

  get '/recipes/:id/edit' do
    if logged_in?
      @recipe = Recipe.find_by_id(params[:id])
      erb :'/recipes/edit'
    else
      redirect to 'login', locals: {message: "Please login:"}
    end
  end



end
