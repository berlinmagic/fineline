# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "strange_fineform/version"

Gem::Specification.new do |s|
  s.name        = "strange_fineform"
  s.version     = StrangeFineform::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Austin Strange"]
  s.email       = ["austin@2strange.net"]
  s.homepage    = ""
  s.summary     = %q{StrangeCMS module}
  s.description = %q{module strangeCMS the easy one!}

  s.rubyforge_project = "strange_fineform"

  s.files        = Dir['app/**/*', 'config/**/*', 'lib/**/*', 'public/**/*']
  s.require_path = 'lib'
  s.requirements << 'none'
  
  s.add_dependency('strangecms',  ">= 0.0.9")
  
  s.add_dependency('paperclip',  ">= 2.3.8")
  
  s.add_dependency('remotipart',  "~> 0.4")

end
