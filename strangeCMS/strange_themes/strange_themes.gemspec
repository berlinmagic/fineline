# encoding: utf-8
version = File.read(File.expand_path("../../CMS_VERSION", __FILE__)).strip

Gem::Specification.new do |s|
  s.name        = "strange_themes"
  s.version     = version
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Austin Strange"]
  s.email       = ["austin@orangenwerk.com"]
  s.homepage    = "http://orangenwerk.com"
  s.summary     = %q{strangeCMS themes-modul}
  s.description = %q{strangeCMS .. from orangenwerk.com}

  s.rubyforge_project = "strange_themes"

  s.files        = Dir['app/**/*', 'lib/**/*']
  s.require_paths = ["lib"]
  s.requirements << 'none'
  
  s.add_dependency('strange_core', version)
  
end
