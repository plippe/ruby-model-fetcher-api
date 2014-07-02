require 'active_record'
require 'protected_attributes'

class Tweet < ActiveRecord::Base
  include ActiveModel::MassAssignmentSecurity
  
  attr_accessible :twitter_id, :text, :language, :created_at

  validates :twitter_id, :created_at, presence: true
  validates :text, :language, length: { maximum: 250 }

  belongs_to :user
end
