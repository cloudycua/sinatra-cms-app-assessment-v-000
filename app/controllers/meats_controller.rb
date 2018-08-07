class MeatsController < ApplicationController

  get '/meats' do
    if logged_in?
      @meats = Meat.all
      @recipes = Recipe.all
      erb :'/meats/index'
    else
      redirect to 'login', locals: {message: "Please login:"}
    end
  end

  get '/meats/:id' do
    if logged_in?
      @meat = Meat.find(params[:id])
      erb :'/meats/show'
    else
      redirect to 'login', locals: {message: "Please login:"}
    end
  end

end
