class UsersController < ApplicationController

    # get '/account' do
    #     # binding.pry
    #     # @user = User.find(session[:user_id])
    #     # @user(session)
    #     erb  :'/users/account'
    # end

    #users can sign up
    #users can delete account
    get '/signup' do
        erb :'/users/signup'
    end 

    post '/signup' do
        user = User.new(params)
        #    binding.pry
            if User.find_by(username: user.username)
                @error = "Account with that username already exists"
                erb :'/users/signup'
            elsif user.username.empty? || user.password == nil
                @error = "Username and password cannot be blank"
                erb :'/users/signup'
            else
                user.save
                session[:user_id] = user.id
                redirect '/jobs'
            end
    end

    
end
