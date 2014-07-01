require 'rubygems'
require 'active_record_connection'

require_relative 'user.rb'
require_relative 'tweet.rb'

ActiveRecordConnection.connect

puts User.all
puts Tweet.all
