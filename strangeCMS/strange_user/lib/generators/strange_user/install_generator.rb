# encoding: utf-8
require 'rails/generators/migration'

module StrangeUser
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
        puts("INFO: erstelle _User-Migration")
        migration_template "create_strange_user.rb", "db/migrate/create_strange_user.rb"
        # => migration_template "create_something_else.rb", "db/migrate/create_something_else.rb"
      end
      
      def seed_sites
        if File.exist?("db/seeds.rb")
          append_to_file "db/seeds.rb",  File.read( "#{self.class.source_root}/seed_strange_user.rb" )
        else
          create_file "db/seeds.rb",  File.read( "#{self.class.source_root}/seed_strange_user.rb" )
        end
      end
      
      def add_devise_routes
        puts("INFO: erstelle Devise-Route")
        route "devise_for :users"
      end

    end
  end
end