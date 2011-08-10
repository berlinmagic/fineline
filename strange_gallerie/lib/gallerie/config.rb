module Strangecms::Gallerie
  class Config < Strangecms::Config
    class << self
      def instance
        return nil unless ActiveRecord::Base.connection.tables.include?('configurations')
        GallerieConfiguration.find_or_create_by_name("Gallerie configuration")
      end
    end
  end
end