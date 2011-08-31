# encoding: utf-8
### =>  Code von Spree übernommen   (https://github.com/spree/spree)  <= ###
module Strangecms
  module Preferences
    # This class handle mail settings using preferences feature available in spree core.
    class CmsSettings

      class << self

        # When loading from config/initializers/spree.rb the logger
        # variable is not available yet, so defining it here.
        def logger
          RAILS_DEFAULT_LOGGER
        end

        def init
          # Set mail server settings from preferences
          begin
            logger.info "INFO: Loading CMS-Settings"

            Rails.application.config.time_zone = "#{ Strangecms::Config[:time_zone].blank? ? 'Berlin' : Strangecms::Config[:time_zone] }"
            
            Rails.application.config.i18n.default_locale = Strangecms::Config[:default_locale]
            
            Rails.application.config.encoding = "utf-8" 
            
            Time.zone = "#{ Strangecms::Config[:time_zone].to_s }"
            
            # => Encoding.default_external = Encoding::UTF_8
            # => Encoding.default_internal = Encoding::UTF_8
            # => Encoding.default_external = "UTF-8"
            
            
          rescue
            logger.error "========================================================================="
            logger.error "   ! ! ! ERROR: Something went wrong while loading CMS-Settings ! ! !"
            logger.error "   Verify you created a default configuration in admin/configurations"
            logger.error "========================================================================="
          end
        end 
      end
    end
  end
end