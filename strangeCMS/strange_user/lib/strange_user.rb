
require 'strange_core'
    
  require "devise"
  require "devise_invitable"

  # => require 'cancan'
  
  require 'strangecms/user/config'
  require 'strangecms/preferences/user_settings'
  
  require 'strange_user_hooks'
  
  require 'strange_user/version'
  
  require 'strange_user_helper'

module StrangeUser
  class Engine < Rails::Engine
    
    
    #config.autoload_paths += %W(#{config.root}/lib)
    
    
    
    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
        Rails.env.production? ? require(c) : load(c)
      end
    end
    
    #initializer 'user_helper.helper' do |app|
    #  ActionView::Base.send :include, UserHelper
    #end
    
    config.to_prepare &method(:activate).to_proc

  end
end