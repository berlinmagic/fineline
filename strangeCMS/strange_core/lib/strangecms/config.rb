##### This code comes vom Spree .. http://spreecommerce.com #####
module Strangecms
  require 'singleton'
  # Singleton class to access the configuration object (AppConfiguration.first by default) and its preferences.
  #
  # Usage:
  #   Spree::Config[:foo]                  # Returns the +foo+ preference
  #   Spree::Config[]                      # Returns a Hash with all the application preferences
  #   Spree::Config.instance               # Returns the configuration object (AppConfiguration.first)
  #   Spree::Config.set(preferences_hash)  # Set the application preferences as especified in +preference_hash+
  #   Spree::Config.searcher/searcher=     # get/set the default product search implementation
  class Config
    include Singleton
    include Strangecms::PreferenceAccess

    class << self
      def instance
        return @configuration if @configuration
        return nil unless ActiveRecord::Base.connection.tables.include?('configurations')
        @configuration ||= AppConfiguration.find_or_create_by_name("Default configuration")
        @configuration
      end
      
    end
  end
end