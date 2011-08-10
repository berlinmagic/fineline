  require "rails/all"
  
  require 'strangecms'
  
  require 'strange_core'
  
  require 'strange_sites'
  
  require 'strange_kontaktform_hooks'
  
  require 'kontakt/config'

module StrangeKontaktform
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