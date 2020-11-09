require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/jobs/new' do #loads new form
    erb :new
  end

  get "/" do
    erb :welcome
  end

  get "/jobs" do
    @jobs = Job.all
    erb :index
  end

  get '/jobs/:id' do  #loads show page
    @job = Job.find_by_id(params[:id])
    erb :show
  end

  post '/jobs' do  #creates a job
    @job = Job.create(params)
    redirect to "/jobs/#{@job.id}"
  end

end
