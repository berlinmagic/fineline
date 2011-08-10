module Strangecms::Fineform
  class Config < Strangecms::Config
    class << self
      def instance
        return nil unless ActiveRecord::Base.connection.tables.include?('configurations')
        FineformConfiguration.find_or_create_by_name("Fineform configuration")
      end
    end
  end
end