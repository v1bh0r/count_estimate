$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "count_estimate/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "count_estimate"
  s.version     = CountEstimate::VERSION
  s.authors     = ["Vibhor Mahajan"]
  s.email       = ["vibhor.mahajan@gmail.com"]
  s.homepage    = "https://github.com/vibhor86/count_estimate"
  s.summary     = "Estimates number of rows returned by a query"
  s.description = "Adds a method count_estimate to ActiveRecord::Relation based on https://wiki.postgresql.org/wiki/Count_estimate"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_development_dependency "rails"
  s.add_development_dependency "rspec"
  s.add_development_dependency "rake"
  s.add_development_dependency "railties"
end
