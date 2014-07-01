require 'active_record'

class User < ActiveRecord::Base
  attr_accessor :twitter_id, :name, :screen_name, :description, :image, :created_at
  
  has_many :tweets
end
