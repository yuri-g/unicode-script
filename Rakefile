$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require 'unicode_script/version'
require "rspec/core/rake_task"


task :default => [:build, :install]

RSpec::Core::RakeTask.new
task :test => :spec


task :build do
  system 'gem build unicode-script.gemspec'
end

task :install do
  system "gem install --local ./unicode-script-#{UnicodeScript::Version::STRING}.gem"
end
