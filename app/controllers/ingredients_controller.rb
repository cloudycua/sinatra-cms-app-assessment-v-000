class IngredientsController < ApplicationController

  get '/ingredients' do
    if logged_in?
      @ingredients = Ingredient.all
      erb :'/ingredients/index'
    else
      erb :'/users/login', locals: {message: "Please login first"}
    end
  end

  get '/ingredients/:id' do
    if logged_in?
      @ingredient = Ingredient.find_by_id(params[:id])
      erb :'/ingredients/show'
    else
      erb :'/users/login', locals: {message: "Please login first"}
    end
  end

end
