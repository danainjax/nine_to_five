class UsersController < ApplicationController

        get '/signup' do
            erb :'users/signup'
        end    

        post '/signup' do
           @user = User.new(params)
           if !@user.name.empty? && !@user.password.empty?
            if User.find_by(:name => @user.name)
            redirect '/'
            end
            @user.save
            redirect '/jobs'
           else
            erb :'users/signup'
           end
        end
end