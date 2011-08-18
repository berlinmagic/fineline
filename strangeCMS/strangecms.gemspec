# encoding: utf-8
version = File.read(File.expand_path("../CMS_VERSION",__FILE__)).strip

Gem::Specification.new do |s|
  s.name        = "strangecms"
  s.version     = version
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Austin Strange"]
  s.email       = ["austin@orangenwerk.com"]
  s.homepage    = "http://orangenwerk.com"
  s.summary     = %q{strangeCMS base}
  s.description = %q{strangeCMS .. from orangenwerk.com}
  
  s.rubyforge_project = "strangecms"

  s.files        = Dir['lib/**/*']
  s.require_path = 'lib'
  s.requirements << 'none'
  
  s.add_dependency('rails', '>= 3.0.5')
  
  s.add_dependency('strange_core',  version)
  s.add_dependency('strange_sites',  version)
  s.add_dependency('strange_user',  version)
  s.add_dependency('strange_themes',  version)
  
end
