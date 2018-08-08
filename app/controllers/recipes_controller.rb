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

  get '/recipes/:id/author' do
    if logged_in?
      @user_id = Recipe.find_by_id(params[:id]).user_id
      @user = User.find_by_id(@user_id)
      erb :'/users/show'
    else
      redirect to 'login', locals: {message: "Please login:"}
    end
  end

  get '/recipes/:id/edit' do
    if logged_in?
      @recipe = Recipe.find_by_id(params[:id])
      if @recipe && @recipe.user == current_user
        erb :'/recipes/edit'
      else
        redirect to 'recipes/:id', locals: {message: "Only the owner of this recipe can modify it."}
      end
    else
      redirect to 'login', locals: {message: "Please login:"}
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
      @recipe.save
      redirect "/recipes/#{@recipe.id}"
    else
      redirect to 'login', locals: {message: "Please login:"}
    end
  end

  delete '/recipes/:id/delete' do
    @recipe = Recipe.find_by_id(params[:id])
    if logged_in? && @recipe && @recipe.user == current_user
      @recipe.delete
      redirect to '/recipes'
    else
      redirect to 'login', locals: {message: "Please login:"}
    end
  end

end
