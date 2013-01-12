$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "forum/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "forum"
  s.version     = Forum::VERSION
  s.authors     = ["Noxx"]
  s.email       = ["webmaster@gaming-base.net"]
  s.homepage    = "http://www.gaming-base.net"
  s.summary     = "Forum"
  s.description = "Forum"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.11"
  # s.add_dependency "jquery-rails"
end
