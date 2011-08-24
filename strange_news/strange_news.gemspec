# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "strange_news/version"

Gem::Specification.new do |s|
  s.name        = "strange_news"
  s.version     = StrangeNews::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Austin Strange"]
  s.email       = ["austin@orangenwerk.com"]
  s.homepage    = "http://orangenwerk.com"
  s.summary     = %q{StrangeCMS site functionality}
  s.description = %q{strangeCMS the easy one!}

  s.rubyforge_project = "strange_news"

  s.files        = Dir['app/**/*', 'config/**/*', 'lib/**/*', 'public/**/*']
  s.require_path = 'lib'
  s.requirements << 'none'
  
  s.add_dependency('strangecms',  ">= 0.1.15")
  s.add_dependency('strange_categories',  ">= 0.0.3")
  
end
