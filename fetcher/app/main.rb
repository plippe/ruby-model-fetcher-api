require "rubygems"
require "active_record"
require "twitter"

require "models/user"
require "models/tweet"
require_relative "twitter_converter.rb"

def process(client)
  def processTweet(obj)
    return if not obj.is_a?(Twitter::Tweet)

    user = User.find_by(:twitter_id => obj.user.id) || TwitterConverter.toUser(obj.user)

    tweet = Tweet.find_by(:twitter_id => obj.id) ||TwitterConverter.toTweet(obj)
    tweet.user = user
    tweet.save
    
    print "."
  end

  while true
    begin
      client.sample do |obj| processTweet(obj) end
    rescue Exception => e
      puts e.message
    end
  end
end

path_current = File.dirname(__FILE__)
path_resources = "#{path_current}/../../resources"

config_db = YAML.load(File.read("#{path_resources}/database.yml"))
ActiveRecord::Base.establish_connection config_db

config_twitter = YAML.load(File.read("#{path_resources}/twitter.yml"))
client = Twitter::Streaming::Client.new config_twitter

process(client)
