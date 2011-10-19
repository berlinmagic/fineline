# encoding: utf-8
require 'rails/generators/migration'

module StrangeFineform
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      include Rails::Generators::Migration
      source_root File.expand_path('../templates', __FILE__)
      desc "add the migrations"
      
      def self.next_migration_number(path)
        unless @prev_migration_nr
          @prev_migration_nr = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
        else
          @prev_migration_nr += 1
        end
        @prev_migration_nr.to_s
      end

      def copy_migrations
        puts("INFO: erstelle _Gallerie-Migration")
        migration_template "create_strange_fineform.rb", "db/migrate/create_strange_fineform.rb"
        # => migration_template "create_something_else.rb", "db/migrate/create_something_else.rb"
      end
      
      def seed_wertelisten
        if File.exist?("db/seeds.rb")
          append_to_file "db/seeds.rb",  File.read( "#{self.class.source_root}/seed_strange_fineform.rb" )
        else
          create_file "db/seeds.rb",  File.read( "#{self.class.source_root}/seed_strange_fineform.rb" )
        end
      end
      

    end
  end
end