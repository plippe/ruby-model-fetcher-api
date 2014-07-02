require 'active_record'
require 'protected_attributes'

class User < ActiveRecord::Base
  include ActiveModel::MassAssignmentSecurity
  
  attr_accessible :twitter_id, :name, :screen_name, :description, :language, :created_at
  
  validates :twitter_id, :created_at, presence: true
  validates :name, :screen_name, :description, :language, length: { maximum: 250 }
  
  has_many :tweets
end
