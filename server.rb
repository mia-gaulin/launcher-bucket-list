require 'sinatra'
require 'csv'

get '/launcher-bucket-list' do
  @bucket_list = CSV.readlines("bucket_list.csv", headers: true)
  erb :index
end

get '/' do
  redirect '/launcher-bucket-list'
end

post '/launcher-bucket-list' do
  item = params["goal"]

  unless item.strip.empty?
    CSV.open("bucket_list.csv", "a") do |file|
      file << [item]
    end
  end
  redirect '/launcher-bucket-list'
end
