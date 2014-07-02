require "models/user"
require "models/tweet"

class UsersController
  @page_size = 100
  
  def self.index(page_number, page_size)
    users = User
      .all
      .order(:id)
      .limit(page_size)
      .offset(page_size * page_number)
      
    users.to_json
  end
  
  def self.show(id)
    user = User.find_by :id => id
    user.to_json
  end
  
  def self.tweets(id, page_number, page_size)
    tweets = Tweet
      .where(:user_id => id)
      .order(:id)
      .limit(page_size)
      .offset(page_size * page_number)
      
    tweets.to_json
  end
end
