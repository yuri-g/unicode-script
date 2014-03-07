require File.expand_path("../lib/unicode_script/version", __FILE__)

Gem::Specification.new do |s|
    s.name = 'unicode-script'
    s.version = UnicodeScript::Version::STRING
    s.date = '2014-03-07'
    s.summary = 'Unicode script detector'
    s.description = 'Small utility that allows you to detect scripts (languages) in unicode text'
    s.authors = ["yuri-gg"]
    s.files = Dir['{bin,lib,test,spec}/**/*']
    s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
    s.email = 'yuri.goncharenko@gmail.com'
    s.homepage = 'https://github.com/yuri-g/unicode-script'
    s.license = 'MIT'
    s.add_development_dependency 'rake'
    s.add_development_dependency 'rspec'
end