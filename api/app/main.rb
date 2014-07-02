require 'sinatra'

require 'models/tweet'

require_relative "controllers/userscontroller.rb"
require_relative "controllers/tweetscontroller.rb"

def load_yaml(file)
  path_current = File.dirname(__FILE__)
  path_resources = "#{path_current}/../../resources"
  YAML.load(File.read("#{path_resources}/#{file}"))
end

ActiveRecord::Base.establish_connection load_yaml("database.yml")

page_size = 100
page_number = 0

get "/users" do
  p = params[:p].to_i || page_number
  UsersController.index p, page_size
end

get "/users/:id" do |id|
  UsersController.show id
end

get "/users/:id/tweets" do |id|
  p = params[:p].to_i || page_number
  UsersController.tweets id, p, page_size
end

get '/tweets' do
  p = params[:p].to_i || page_number
  TweetsController.index p, page_size
end

get '/tweets/:id' do |id| 
  TweetsController.show id 
end
