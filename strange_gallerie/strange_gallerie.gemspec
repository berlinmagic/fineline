# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "strange_gallerie/version"

Gem::Specification.new do |s|
  s.name        = "strange_gallerie"
  s.version     = StrangeGallerie::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Austin Strange"]
  s.email       = ["austin@orangenwerk.com"]
  s.homepage    = "http://orangenwerk.com"
  s.summary     = %q{StrangeCMS site functionality}
  s.description = %q{strangeCMS the easy one!}

  s.rubyforge_project = "strange_gallerie"

  s.files        = Dir['app/**/*', 'config/**/*', 'lib/**/*', 'public/**/*']
  s.require_path = 'lib'
  s.requirements << 'none'
  
  s.add_dependency('strangecms',  ">= 0.0.9")
  s.add_dependency('strange_categories',  ">= 0.0.3")
  
  s.add_dependency('exifr',  ">= 1.0.5")
  
end
