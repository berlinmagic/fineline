module Strangecms::Sidebar
  class Config < Strangecms::Config
    class << self
      def instance
        return nil unless ActiveRecord::Base.connection.tables.include?('configurations')
        SidebarConfiguration.find_or_create_by_name("Sidebar configuration")
      end
    end
  end
end