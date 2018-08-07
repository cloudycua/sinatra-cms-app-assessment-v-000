class RecipesController < ApplicationController

  get '/recipes' do
    if logged_in?
      @recipes = Recipe.all
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

      if !params[:meat][:name].empty?
        @meat = params[:meat]
        Meat.create(:name => @meat[:name])
      end

      if !params[:vegetable][:name].empty?
        @vegetable = params[:vegetable]
        Vegetable.create(:name => @vegetable[:name])
      end

      if !params[:meal][:name].empty?
        @meal = params[:meal]
        Meal.create(:name => @meal[:name])
      end

      if !params[:type][:name].empty?
        @type = params[:type]
        Type.create(:name => @type[:name])
      end

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
