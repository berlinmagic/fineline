  require "rails/all"
  
  require 'exifr'
  
  require 'strangecms'
  
  require 'strange_core'
  
  require 'strange_sites'
  
  require 'strange_gallerie_hooks'
  
  require 'gallerie/config'


module StrangeGallerie
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