module Strangecms::User
  class Config < Strangecms::Config
    class << self
      def instance
        return nil unless ActiveRecord::Base.connection.tables.include?('configurations')
        UserConfiguration.find_or_create_by_name("User configuration")
      end
    end
  end
end