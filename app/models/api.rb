# require 'net/http'
# require 'open-uri'
# require 'json'
 
# class Api
 
#   URL = "https://jobs.github.com/positions.json"
 
#   def get_jobs
#     uri = URI.parse(URL)
#     response = Net::HTTP.get_response(uri)
#     response.body
#   end
 
# end
 
# jobs = Api.new.get_jobs
# puts jobs