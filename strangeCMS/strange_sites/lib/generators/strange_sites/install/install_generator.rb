# encoding: utf-8
require 'rails/generators/migration'

module StrangeSites
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      include Rails::Generators::Migration
      source_root File.expand_path('../templates', __FILE__)
      desc "add the migrations"
      
      puts('INFO: Suche nach standard index.html')
      
      def kill_index_html
        if File.exists?( File.join(Rails.root, 'public', 'index.html') )
          File.delete( File.join(Rails.root, 'public', 'index.html') )
          puts('INFO: standard index.html .. wurde gelöscht')
        else
          puts('INFO: keine standard index.html vorhanden')
        end
      end
      
      def self.next_migration_number(path)
        unless @prev_migration_nr
          @prev_migration_nr = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
        else
          @prev_migration_nr += 1
        end
        @prev_migration_nr.to_s
      end

      def copy_migrations
        puts("INFO: erstelle _Sites-Migration")
        migration_template "create_strange_sites.rb", "db/migrate/create_strange_sites.rb"
        # => migration_template "create_something_else.rb", "db/migrate/create_something_else.rb"
      end
      
      def seed_sites
        if File.exist?("db/seeds.rb")
          append_to_file "db/seeds.rb",  File.read( "#{self.class.source_root}/seed_strange_sites.rb" )
        else
          create_file "db/seeds.rb",  File.read( "#{self.class.source_root}/seed_strange_sites.rb" )
        end
      end
      
      def mirror_assets
        source = File.join(self.class.source_root, '../../../../../public')
        destination = File.join(Rails.root, 'public')
        # => puts("INFO: Mirroring assets from #{source} to #{destination}")
        puts("INFO: Spiegle _Sites-Daten in public-Ordner")
        Strangecms::FileUtilz.mirror_files(source, destination)
      end

    end
  end
end