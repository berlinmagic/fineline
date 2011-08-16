# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "strange_header/version"

Gem::Specification.new do |s|
  s.name        = "strange_header"
  s.version     = StrangeHeader::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Austin Strange"]
  s.email       = ["austin@orangenwerk.com"]
  s.homepage    = "http://orangenwerk.com"
  s.summary     = %q{StrangeCMS site functionality}
  s.description = %q{strangeCMS the easy one!}

  s.rubyforge_project = "strange_header"

  s.files        = Dir['app/**/*', 'config/**/*', 'lib/**/*', 'public/**/*']
  s.require_path = 'lib'
  s.requirements << 'none'
  
  s.add_dependency('strangecms',  ">= 0.0.2")
  
  #s.add_dependency('paperclip',  ">= 2.3.8")
  
  s.add_dependency('rack-cache')
  s.add_dependency('dragonfly', '~>0.8.2')
  
end
