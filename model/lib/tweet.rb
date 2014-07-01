require 'active_record'

class Tweet < ActiveRecord::Base
  attr_accessor :twitter_id, :text, :created_at

  belongs_to :user
end
