class UsersControllers < ApplicationController

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'users/show'
  end

  get '/signup' do
    if !logged_in?
      erb :'/users/create_user'
    else
      redirect to '/'
    end
  end

  post '/signup' do
    if params[:username] == "" || params[:password] == ""
      erb :'/users/create_user', locals: {message: "Username or password missing."}
    else
      @user = User.create(params)
      session[:user_id] = @user.idea
      redirect '/'
    end
  end

  get '/login' do
    if !logged_in?
      erb :'/users/login'
    else
      redirect to '/'
    end
  end

  post 'login' do
    user = User.find_by(:username => params[:username])
    if user && user.authentication(params[:password])
      session[:user_id] = user.id
      redirect to '/'
    else
      erb :'/users/login', locals: {message: "Invalid Username or Password. Please try again."}
  end

  get '/logout' do
    if logged_in?
      session.destroy
    end
    redirect to '/'
  end

end
