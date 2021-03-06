  require "rails/all"
  
  require "cells"
  
  require 'strangecms'

  #require 'paperclip'
  
  #require 'rack/cache'
  #require 'dragonfly/rails/images'
  
  
  require 'strange_header_hooks'
  require 'strange_header_modul'
  
  require 'header/config'


module StrangeHeader
    class Engine < Rails::Engine
      config.autoload_paths += %W(#{config.root}/lib)
      def self.activate
        Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
          Rails.env == "production" ? require(c) : load(c)
        end
      end
      config.to_prepare &method(:activate).to_proc
    end
end
