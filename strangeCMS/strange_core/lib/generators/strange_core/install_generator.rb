# encoding: utf-8
require 'rails/generators/migration'

module StrangeCore
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      include Rails::Generators::Migration
      source_root File.expand_path('../templates', __FILE__)
      desc "add the migrations"

      def self.next_migration_number(path)
        @prev_migration_nr ? @prev_migration_nr += 1 : @prev_migration_nr = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
        @prev_migration_nr.to_s
      end

      def copy_migrations
        puts("Core:: erstelle Migration")
        Dir.glob( File.join(File.expand_path('../templates', __FILE__), "create*.*") ) do |file|
          migration_template "#{file}", "db/migrate/#{File.basename(file.to_s)}"
        end
        # migrate Updates
        puts("Core:: create update Migration-Files")
        Dir.glob( File.join(File.expand_path('../templates', __FILE__), "update*.*") ) do |file|
          migration_template "#{file}", "db/migrate/#{File.basename(file.to_s)}"
        end
      end

    end
  end
end