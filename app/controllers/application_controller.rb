require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views', 'app/views/users'
    enable :sessions
    set :session_secret,""
  end

  not_found do
    status 404
    erb :failure
  end

  get "/" do
    erb :welcome
  end

  # get "/login" #create login form that accepts username and password

  post '/login' do # find the user in the database based on their username, if match set the session id to users id and display users data on page
    @user = User.find_by(:username => params[:username])
    binding.pry
    if @user != nil && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      erb :'/users/account'
    end
  end
#Helpers
  def logged_in?
    !!current_user
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def require_login
    unless logged_in?
    redirect to '/login'
    end
  end
end
