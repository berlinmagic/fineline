module Strangecms::Header
  class Config < Strangecms::Config
    class << self
      def instance
        return nil unless ActiveRecord::Base.connection.tables.include?('configurations')
        HeaderConfiguration.find_or_create_by_name("Header configuration")
      end
    end
  end
end