require "rubygems"
require "active_record"
require "twitter"

require "models/user"
require "models/tweet"
require_relative "twitter_converter.rb"

def load_yaml(file)
  path_current = File.dirname(__FILE__)
  path_resources = "#{path_current}/../../resources"
  YAML.load(File.read("#{path_resources}/#{file}"))
end

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

ActiveRecord::Base.establish_connection load_yaml("database.yml")
client = Twitter::Streaming::Client.new load_yaml("twitter.yml")

process(client)
