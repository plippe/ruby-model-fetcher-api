Gem::Specification.new do |s|
  s.name        = "models"
  s.version     = "0.0.1"
  s.summary     = "Models to use in app"
  s.authors     = ["Philippe Vinchon"]

  s.files       = ["lib/models/user.rb", "lib/models/tweet.rb"]
  
  s.add_dependency("activerecord", "= 4.1.2")
  s.add_dependency("protected_attributes", "= 1.0.8")
end
