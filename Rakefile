require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "cinch-lmgtfy"
    gem.summary = %Q{A Cinch plugin for Let Me Google That For You}
    gem.description = %Q{A Cinch plugin for Let Me Google That For You!}
    gem.email = "victor.bergoo@gmail.com"
    gem.homepage = "http://github.com/netfeed/cinch-lmgtfy"
    gem.authors = ["Victor Bergoo"]
    gem.files = ["lib/**/*.rb", "README.rdoc", "LICENSE"]
    gem.add_dependency "cinch"
    gem.add_dependency "json"
    gem.add_dependency "curb"
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end
