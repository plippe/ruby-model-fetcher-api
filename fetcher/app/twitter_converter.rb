require "twitter"

require "models/user"
require "models/tweet"

class TwitterConverter
  def self.toUser(obj)
    if obj.is_a?(Twitter::User)
      User.new(
        :twitter_id => obj.id,
        :name => obj.name,
        :screen_name => obj.screen_name,
        :description => obj.description,
        :language => obj.lang,
        :created_at => obj.created_at)
    else
      Nil
    end
  end

  def self.toTweet(obj)
    if obj.is_a?(Twitter::Tweet)
      Tweet.new(
        :twitter_id => obj.id,
        :text => obj.text, 
        :language => obj.lang,
        :created_at => obj.created_at)
    else
      Nil
    end
  end
end
