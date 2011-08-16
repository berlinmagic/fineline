# encoding: utf-8
version = File.read(File.expand_path("../../CMS_VERSION", __FILE__)).strip
# => require "strange/version"

Gem::Specification.new do |s|
  s.name        = "strange_core"
  s.version     = version
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Austin Strange"]
  s.email       = ["austin@orangenwerk.com"]
  s.homepage    = "http://orangenwerk.com"
  s.summary     = %q{StrangeCMS core functionality}
  s.description = %q{strangeCMS the easy one!}

  s.rubyforge_project = "strange_core"

  
  s.files        = Dir['app/**/*', 'config/**/*', 'lib/**/*']
  s.require_paths = ["lib"]
  s.requirements << 'none'
  
  s.add_dependency('rails', '>= 3.0.5')

end
