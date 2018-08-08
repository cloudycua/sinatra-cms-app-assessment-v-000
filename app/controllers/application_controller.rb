require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "recipes_secret"
  end

  get '/' do
    @ingredients = []
    Recipe.all.each do |r|
      r.ingredients.each do |i|
        if !@ingredients.include?(i)
          @ingredients << i
        end
      end
    end
    erb :index
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
  end

end
