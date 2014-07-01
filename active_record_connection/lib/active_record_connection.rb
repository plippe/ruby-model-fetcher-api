require 'active_record'
require 'sqlite3'

class ActiveRecordConnection
  def self.connect(path)    
    ActiveRecord::Base.establish_connection(
      adapter:  'sqlite3',
      database: path,
      pool: 5,
      timeout: 5000
    )
  end
end
