class SessionsController < ApplicationController


    #users can login
    get '/login' do
        erb :'users/login'
    end

    # post '/login' do
    #     if params["username"].empty? || params["password"].empty?
    #         @error = "Username and password cannot be blank"
    #         erb :'users/login'
    #     else
    #         if user = User.find_by(username: params["username"], password: params["password"])
    #             session[:user_id] = user.id
    #             redirect '/jobs'
    #         else
    #             @error = "Account not found"
    #             erb :'users/login'
    #         end
    #     end
    # end
    
    post '/login' do # find the user in the database based on their username, if match set the session id to users id and display users data on page
        @user = User.find_by(:username => params[:username])
            if params["username"].empty? || params["password"].empty?
                @error = "Username and password cannot be blank"
                erb :'users/login'
        # binding.pry
            elsif @user != nil && @user.authenticate(params[:password])
                session[:user_id] = @user.id
                erb :'/users/account'

            else
                @error = "Account not found"
                erb :'users/login'
            end  
        end
    
 #users can logout
    get '/logout' do
        session.clear
        redirect '/'
    end
end

        

    

