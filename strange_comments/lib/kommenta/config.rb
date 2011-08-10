module Strangecms::Kommenta
  class Config < Strangecms::Config
    class << self
      def instance
        return nil unless ActiveRecord::Base.connection.tables.include?('configurations')
        KommentaConfiguration.find_or_create_by_name("Kommenta configuration")
      end
    end
  end
end