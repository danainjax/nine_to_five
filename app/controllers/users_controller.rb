class UsersController < ApplicationController

    get '/account' do
        @user = Helper.user(session)
        erb  :'/users/account'
    end

    #users can sign up
    #users can delete account

    get '/signup' do
        erb :'/users/signup'
    end    

    post '/signup' do
        user = User.new(params)
        #    binding.pry
            if user.username.empty? || user.password.empty?
                @error = "Username and password cannot be blank"
                redirect to '/users/signup.erb'
            elsif User.find_by(username: user.username)
                @error = "Account with that username already exists"
                redirect to '/users/signup.erb'
            else
                user.save
                session[:user_id] = user.id
                redirect '/jobs'
            end
    end
end
