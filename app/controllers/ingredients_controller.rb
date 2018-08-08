class IngredientsController < ApplicationController

  get '/ingredients' do
    if logged_in?
      @ingredients = Ingredient.all
      @recipes = Recipe.all
      erb :'/ingredients/index'
    else
      redirect to 'login', locals: {message: "Please login:"}
    end
  end

  get '/ingredients/:id' do
    if logged_in?
      @ingredient = Ingredient.find_by_id(params[:id])
      @recipes = Recipe.find(:ingredients, *args)
      erb :'/ingredients/show'
    else
      redirect to 'login', locals: {message: "Please login:"}
    end
  end

end
