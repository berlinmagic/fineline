module Strangecms::Newz
  class Config < Strangecms::Config
    class << self
      def instance
        return nil unless ActiveRecord::Base.connection.tables.include?('configurations')
        NewzConfiguration.find_or_create_by_name("Newz configuration")
      end
    end
  end
end