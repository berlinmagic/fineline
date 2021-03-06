# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "strange_newsletter/version"

Gem::Specification.new do |s|
  s.name        = "strange_newsletter"
  s.version     = StrangeNewsletter::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Austin Strange"]
  s.email       = ["austin@orangenwerk.com"]
  s.homepage    = "http://orangenwerk.com"
  s.summary     = %q{StrangeCMS site functionality}
  s.description = %q{strangeCMS the easy one!}

  s.rubyforge_project = "strange_newsletter"

  s.files        = Dir['app/**/*', 'config/**/*', 'db/**/*', 'lib/**/*', 'public/**/*']
  s.require_path = 'lib'
  s.requirements << 'none'
  
  s.add_dependency('strangecms',  ">= 0.0.9")
  s.add_dependency('strange_categories',  ">= 0.0.3")
end
