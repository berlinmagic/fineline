# encoding: utf-8
version = File.read(File.expand_path("../../CMS_VERSION", __FILE__)).strip

Gem::Specification.new do |s|
  s.name        = "strange_core"
  s.version     = version
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Austin Strange"]
  s.email       = ["austin@orangenwerk.com"]
  s.homepage    = "http://orangenwerk.com"
  s.summary     = %q{strangeCMS cms-core}
  s.description = %q{strangeCMS .. from orangenwerk.com}
  
  s.rubyforge_project = "strange_core"
  
  s.files        = Dir['app/**/*', 'config/**/*', 'lib/**/*']
  s.require_paths = ["lib"]
  s.requirements << 'none'
  
  s.add_dependency('rack-cache')
  s.add_dependency('dragonfly', '~> 0.9.5')
  s.add_dependency('rmagick', '~> 2.13.1')
  
  s.add_dependency('dragonfly-rmagick', '~> 0.0.33')
  
  s.add_dependency('cells', '~> 3.6.5')
  
end
