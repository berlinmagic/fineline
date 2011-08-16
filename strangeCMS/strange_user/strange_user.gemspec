# encoding: utf-8
version = File.read(File.expand_path("../../CMS_VERSION", __FILE__)).strip

Gem::Specification.new do |s|
  s.name        = "strange_user"
  s.version     = version
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Austin Strange"]
  s.email       = ["austin@orangenwerk.com"]
  s.homepage    = "http://orangenwerk.com"
  s.summary     = %q{StrangeCMS core functionality}
  s.description = %q{strangeCMS the easy one!}

  s.rubyforge_project = "strange_user"

  s.files        = Dir['app/**/*', 'config/**/*', 'lib/**/*']
  s.require_paths = ["lib"]
  s.requirements << 'none'
  
  s.add_dependency('strange_core',  version)
  
  s.add_dependency('devise', '= 1.4.2')
  s.add_dependency('devise_invitable', '= 0.5.4')
  # => s.add_dependency('cancan', '= 1.4.1')
  
  s.add_dependency('rack-cache')
  s.add_dependency('dragonfly', '~>0.8.2')

end
