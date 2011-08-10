# encoding: utf-8
version = File.read(File.expand_path("../../CMS_VERSION", __FILE__)).strip

Gem::Specification.new do |s|
  s.name        = "strange_sites"
  s.version     = version
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Austin Strange"]
  s.email       = ["austin@2strange.net"]
  s.homepage    = "2strange.net"
  s.summary     = %q{StrangeCMS core functionality}
  s.description = %q{strangeCMS the easy one!}


  s.rubyforge_project = "strange_sites"

  s.files        = Dir['app/**/*', 'config/**/*', 'lib/**/*', 'public/**/*']
  s.require_paths = ["lib"]
  s.requirements << 'none'
  
  s.add_dependency('rails', '>= 3.0.5')
  s.add_dependency('el_finder', '>= 1.0.13')
  s.add_dependency('acts_as_list', '>= 0.1.2')
  
  #s.add_dependency('will_paginate', '~> 3.0.pre4')
  
  s.add_dependency('kaminari', '~> 0.12.4')
  
  s.add_dependency('paperclip',  "= 2.3.8")
  
  s.add_dependency('strange_core', version)
  s.add_dependency('strange_user', version)
end
