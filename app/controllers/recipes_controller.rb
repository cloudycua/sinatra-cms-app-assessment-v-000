class RecipesController < ApplicationController

  get '/recipes' do
    if logged_in?
      @recipes = Recipe.all
      erb :'/recipes/index'
    else
      erb :'/users/login', locals: {message: "Please login first"}
    end
  end

  get '/recipes/new' do
    if logged_in?
      erb :'/recipes/new'
    else
      erb :'/users/login', locals: {message: "Please login first"}
    end
  end

  post '/recipes' do
    if logged_in?
      if params[:recipe][:name] == ""
        erb :'/recipes/new', locals: {message: "Please resubmit recipe and make sure you include a name for it."}
      else
        @recipe = Recipe.create(params["recipe"])
        @recipe.user_id = current_user.id
        @recipe.username = current_user.username
        if !params["ingredient_1"]["name"].empty?
          @ingredient_1 = Ingredient.create(params[:ingredient_1])
          RecipeIngredient.create(:ingredient_id => @ingredient_1.id, :recipe_id => @recipe.id)
        end
        if !params["ingredient_2"]["name"].empty?
          @ingredient_2 = Ingredient.create(params[:ingredient_2])
          RecipeIngredient.create(:ingredient_id => @ingredient_2.id, :recipe_id => @recipe.id)
        end
        if !params["ingredient_3"]["name"].empty?
          @ingredient_3 = Ingredient.create(params[:ingredient_3])
          RecipeIngredient.create(:ingredient_id => @ingredient_3.id, :recipe_id => @recipe.id)
        end
        @recipe.save
        redirect "/recipes/#{@recipe.id}"
      end
    else
      erb :'/users/login', locals: {message: "Please login first"}
    end
  end

  get '/recipes/:id' do
    if logged_in?
      @recipe = Recipe.find_by_id(params[:id])
      erb :'/recipes/show'
    else
      erb :'/users/login', locals: {message: "Please login first"}
    end
  end

  get '/recipes/:id/author' do
    if logged_in?
      @user_id = Recipe.find_by_id(params[:id]).user_id
      @user = User.find_by_id(@user_id)
      @user.username = "#{@user.username}'s"
      erb :'/users/show'
    else
      erb :'/users/login', locals: {message: "Please login first"}
    end
  end

  get '/recipes/:id/edit' do
    if logged_in?
      @recipe = Recipe.find_by_id(params[:id])
      if @recipe && @recipe.user_id == current_user.id
        erb :'/recipes/edit'
      else
        erb :'/recipes/show', locals: {message: "Only the owner of this recipe can modify it."}
      end
    else
      erb :'/users/login', locals: {message: "Please login first"}
    end
  end

  patch '/recipes/:id' do
    if logged_in?
      @recipe = Recipe.find_by_id(params[:id])
      if params[:recipe][:name] == ""
        params[:recipe][:name] = @recipe.name
      end
      @recipe.update(params[:recipe])
      if !params["ingredient"]["name"].empty?
        @ingredient = Ingredient.create(params[:ingredient])
        RecipeIngredient.create(:ingredient_id => @ingredient.id, :recipe_id => @recipe.id)
      end
      if params[:recipe][:directions] == ""
        params[:recipe][:directions] = @recipe.directions
      end
      @recipe.save
      redirect "/recipes/#{@recipe.id}"
    else
      erb :'/users/login', locals: {message: "Please login first"}
    end
  end

  delete '/recipes/:id/delete' do
    if logged_in?
      @recipe = Recipe.find_by_id(params[:id])
      if @recipe && @recipe.user_id == current_user.id
        @recipe.delete
        redirect to '/recipes'
      else
        erb :'/recipes/show', locals: {message: "Only the owner of this recipe can delete it."}
      end
    else
      erb :'/users/login', locals: {message: "Please login first"}
    end
  end

end
