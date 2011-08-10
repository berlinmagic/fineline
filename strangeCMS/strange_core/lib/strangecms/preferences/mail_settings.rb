### =>  Code von Spree übernommen   (https://github.com/spree/spree)  <= ###
module Strangecms
  module Preferences
    # This class handle mail settings using preferences feature available in spree core.
    class MailSettings

      class << self

        # When loading from config/initializers/spree.rb the logger
        # variable is not available yet, so defining it here.
        def logger
          RAILS_DEFAULT_LOGGER
        end

        def init
          # Set mail server settings from preferences
          begin
            logger.info "INFO: Loading mail preferences"

            if Strangecms::Config.instance.prefers_enable_mail_delivery?
              mail_server_settings = {
                :address => Strangecms::Config[:mail_host],
                :domain => Strangecms::Config[:mail_domain],
                :port => Strangecms::Config[:mail_port],
              }

              if Strangecms::Config[:mail_auth_type] != 'none'
                mail_server_settings[:authentication] = Strangecms::Config[:mail_auth_type]
                mail_server_settings[:user_name] = Strangecms::Config[:smtp_username]
                mail_server_settings[:password] = Strangecms::Config[:smtp_password]
              end

              # Enable TLS
              if Strangecms::Config[:secure_connection_type] == 'TLS'
                mail_server_settings[:enable_starttls_auto] = true
              end

              logger.info "INFO: Setting mails settings to #{mail_server_settings.inspect}"
              ActionMailer::Base.smtp_settings = mail_server_settings
              logger.info "INFO: Enabling mail delivery"
              ActionMailer::Base.perform_deliveries = true
              ActionMailer::Base.default_url_options = { :host => Strangecms::Config[:site_url] }
              return true
            else
              logger.warn "NOTICE: Mail not enabled"
              ActionMailer::Base.perform_deliveries = false
              return false
            end
          rescue
            logger.error "========================================================================="
            logger.error "ERROR: Something went wrong while loading mail preferences"
            logger.error "       Verify you created a default configuration in admin/configurations"
            logger.error "========================================================================="
          end
        end 
      end
    end
  end
end