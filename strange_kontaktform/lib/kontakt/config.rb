module Strangecms::Kontakt
  class Config < Strangecms::Config
    class << self
      def instance
        return nil unless ActiveRecord::Base.connection.tables.include?('configurations')
        KontaktConfiguration.find_or_create_by_name("Kontakt configuration")
      end
    end
  end
end