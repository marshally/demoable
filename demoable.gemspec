$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "demoable/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "demoable"
  s.version     = Demoable::VERSION
  s.authors     = ["Mark Lohstroh"]
  s.email       = ["mlohstroh@gmail.com"]
  s.homepage    = "https://github.com/thebinaryhood/demoable"
  s.summary     = "A rails engine that locks down application based on the environment for demo purposes"
  s.description = "A rails engine that locks down application based on the environment for demo purposes"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.13"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "timecop"
end
