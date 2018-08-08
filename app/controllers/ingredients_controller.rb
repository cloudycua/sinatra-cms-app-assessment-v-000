class IngredientsController < ApplicationController

  get '/ingredients' do
    if logged_in?
      @ingredients = Ingredient.all
      erb :'/ingredients/index'
    else
      redirect to 'login', locals: {message: "Please login:"}
    end
  end

  get '/ingredients/:id' do
    if logged_in?
      @ingredient = Ingredient.find_by_id(params[:id])
      erb :'/ingredients/show'
    else
      redirect to 'login', locals: {message: "Please login:"}
    end
  end

end
