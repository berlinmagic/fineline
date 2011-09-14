# encoding: utf-8
version = File.read(File.expand_path("../../CMS_VERSION", __FILE__)).strip

Gem::Specification.new do |s|
  s.name        = "strange_user"
  s.version     = version
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Austin Strange"]
  s.email       = ["austin@orangenwerk.com"]
  s.homepage    = "http://orangenwerk.com"
  s.summary     = %q{strangeCMS user-modul}
  s.description = %q{strangeCMS .. from orangenwerk.com}

  s.rubyforge_project = "strange_user"

  s.files        = Dir['app/**/*', 'config/**/*', 'db/**/*', 'lib/**/*']
  s.require_paths = ["lib"]
  s.requirements << 'none'
  
  s.add_dependency('strange_core',  version)
  
  s.add_dependency('devise', '= 1.4.2')
  s.add_dependency('devise_invitable', '= 0.5.4')
  # => s.add_dependency('cancan', '= 1.4.1')

end
