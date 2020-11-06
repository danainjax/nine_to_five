require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

  get "/jobs" do
    erb :jobs
    # Job.all.each do |job|
    #   job.title
    # end
  end

end
