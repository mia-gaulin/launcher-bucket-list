require "rspec"
require "capybara/rspec"
require "csv"

require_relative "../server"

Capybara.app = Sinatra::Application

RSpec.configure do |config|
  config.before(:suite) do
    CSV.open('bucket_list.csv', 'w') { |file| file.puts(["goal"]) }
  end

  config.after(:each) do
    CSV.open('bucket_list.csv', 'w') { |file| file.puts(["goal"]) }
  end
end
