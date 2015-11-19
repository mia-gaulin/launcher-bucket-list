require "sinatra"
require "pry"
require "csv"

get "/" do
  redirect "/launcher-bucket-list"
end

get "/launcher-bucket-list" do
  @goals = CSV.readlines("bucket_list.csv", headers: true)
  erb :index
end

post "/launcher-bucket-list" do
  goal = params["goal"]

  if goal.strip.length != 0
    CSV.open("bucket_list.csv", "a") do |f|
      f.puts([goal])
    end!!
  end

  redirect "/launcher-bucket-list"
end
