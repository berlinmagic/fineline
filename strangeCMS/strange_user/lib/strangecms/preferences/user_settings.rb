# encoding: utf-8
### =>  Code von Spree übernommen   (https://github.com/spree/spree)  <= ###
module Strangecms
  module Preferences
    # This class handle mail settings using preferences feature available in spree core.
    class UserSettings
      
      class << self

        # When loading from config/initializers/spree.rb the logger
        # variable is not available yet, so defining it here.
        def logger
          RAILS_DEFAULT_LOGGER
        end

        def init
          # Set mail server settings from preferences
          begin
            logger.info "INFO: Loading user preferences"

              Devise.mailer_sender = Strangecms::User::Config[:mailer_sender]
              
              Devise.timeout_in = perform_my_timer(Strangecms::User::Config[:timeout_in], Strangecms::User::Config[:timeout_in_period])
              
              Devise.invite_for = perform_my_timer(Strangecms::User::Config[:invite_for], Strangecms::User::Config[:invite_for_period])
              Devise.confirm_within = perform_my_timer(Strangecms::User::Config[:confirm_within], Strangecms::User::Config[:confirm_within_period])
              Devise.remember_for = perform_my_timer(Strangecms::User::Config[:remember_for], Strangecms::User::Config[:remember_for_period])
              
              Devise.maximum_attempts = Strangecms::User::Config[:maximum_attempts]
              
              Devise.lock_strategy = Strangecms::User::Config[:lock_strategy]
              Devise.unlock_strategy = Strangecms::User::Config[:unlock_strategy]
              
              Devise.unlock_in = perform_my_timer(Strangecms::User::Config[:unlock_in], Strangecms::User::Config[:unlock_in_period])


            
          rescue
            logger.error "========================================================================="
            logger.error "      ERROR: Something went wrong while loading user preferences"
            logger.error "   Verify you created a default configuration in admin/configurations"
            logger.error "========================================================================="
          end
        end 
        
        def perform_my_timer(time, period)
          if period == 'minutes'
            time.minutes
          elsif period == 'hours'
      	    time.hours
      	  elsif period == 'days'
      	    time.days
      	  elsif period == 'weeks'
      	    time.weeks
      	  else
      	    time
      	  end
        end
      
      end
      
      
      
      
    end
  end
end