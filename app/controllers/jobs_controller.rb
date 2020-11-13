class JobsController < ApplicationController

    # before do
    #     require_login
    # end

    get '/jobs/new' do #loads new form
        require_login
        erb :new
    end
    
    
    get "/jobs" do
        @jobs = Job.all
        require_login
        erb :index
    end
    
    get '/jobs/:id' do  #loads show page
        require_login
        # binding.pry
        @job = Job.find_by_id(params[:id])
        erb :show
    end
        
      
    
    post '/jobs' do  #creates a job
        # @job = Job.create(params)
        job = current_user.jobs.build(params)
            if params[:title] == "" || params[:company] == ""
                @error = "*Title and Company fields cannot be blank"
                erb :new
            else
            job.save
            redirect to "/jobs/#{job.id}"
        end
    end
    
    get '/jobs/:id/edit' do #loads edit form
        require_login
            @job = Job.find_by_id(params[:id])
            erb :edit
    end
    
    
    
    patch '/jobs/:id' do  #updates a job
        @job = Job.find_by_id(params[:id])
        @job.title = params[:title]
        @job.company = params[:company]
        @job.location = params[:location]
        @job.description = params[:description]
        @job.key_qualifications = params[:key_qualifications]
        @job.save
        redirect to "/jobs/#{@job.id}"
    end
    
    delete '/jobs/:id' do #destroy action
        require_login
            @job = Job.find_by_id(params[:id])
            @job.delete
            redirect to '/jobs'
    end
      
    
end