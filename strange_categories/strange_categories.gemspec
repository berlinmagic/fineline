# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "strange_categories/version"

Gem::Specification.new do |s|
  s.name        = "strange_categories"
  s.version     = StrangeCategories::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Austin Strange"]
  s.email       = ["austin@2strange.net"]
  s.homepage    = ""
  s.summary     = %q{StrangeCMS site functionality}
  s.description = %q{strangeCMS the easy one!}

  s.rubyforge_project = "strange_categories"

  s.files        = Dir['app/**/*', 'config/**/*', 'lib/**/*', 'public/**/*']
  s.require_path = 'lib'
  s.requirements << 'none'
  
  s.add_dependency('strangecms',  ">= 0.1.4")
end
