require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret,""
  end

  get "/" do
    erb :welcome
  end

  # get "/login" #create login form that accepts username and password

  post '/login' do # find the user in the database based on their username, if match set the session id to users id and display users data on page
    @user = User.find_by(:username => params[:username])
    # binding.pry
    if @user != nil && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      erb :'/users/account'
    end
  end


end
