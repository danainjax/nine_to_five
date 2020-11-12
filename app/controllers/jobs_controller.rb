class JobsController < ApplicationController

    get '/jobs/new' do #loads new form
        if logged_in?
            erb :new
        else 
            erb :'users/login'
        end
      end
    
    
      get "/jobs" do
        @jobs = Job.all
        if logged_in?
            erb :index
        else
            erb :'users/login'
        end
      end
    
      get '/jobs/:id' do  #loads show page
        if logged_in?
        # binding.pry
            @job = Job.find_by_id(params[:id])
            erb :show
        else
            erb :'users/login'
        end
      end
    
      post '/jobs' do  #creates a job
        @job = Job.create(params)
        redirect to "/jobs/#{@job.id}"
      end
    
      get '/jobs/:id/edit' do #loads edit form
        @job = Job.find_by_id(params[:id])
        erb :edit
      end
    
    
      patch '/jobs/:id' do  #updates a job
        @job = Job.find_by_id(params[:id])
        @job.title = params[:title]
        @job.company = params[:company]
        @job.description = params[:description]
        @job.save
        redirect to "/jobs/#{@job.id}"
      end
    
      delete '/jobs/:id' do #destroy action
        @job = Job.find_by_id(params[:id])
        @job.delete
        redirect to '/jobs'
      end
    
end