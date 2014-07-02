require "models/tweet"

class TweetsController  
  def self.index(page_number, page_size)
    tweets = Tweet
      .all
      .order(:id)
      .limit(page_size)
      .offset(page_size * page_number)
      
    tweets.to_json
  end
  
  def self.show(id)
    tweet = Tweet.find_by :id => id
    tweet.to_json
  end
end
