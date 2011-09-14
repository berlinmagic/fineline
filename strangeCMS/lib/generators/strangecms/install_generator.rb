# encoding: utf-8
require 'rails/generators/migration'
module Strangecms
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration
      include Thor::Actions
      desc "Creates a CMS basic structure."
      
      def initial_desc
        puts('   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *')
        puts('   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .')
        puts('   .   .   .   .   .   .   .   .   .    s t r a n g e C M S    .   .   .   .   .   .   .   .   .   .   .')
        puts('   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .')
        puts('   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *')
      end
      
      puts('INFO: Suche nach standard index.html')
      
      def kill_index_html
        if File.exists?( File.join(Rails.root, 'public', 'index.html') )
          File.delete( File.join(Rails.root, 'public', 'index.html') )
          puts('INFO: standard index.html .. wurde gelöscht')
        else
          puts('INFO: keine standard index.html vorhanden')
        end
        if File.exist?( File.join(Rails.root, 'db', 'seeds.rb') )
          File.delete( File.join(Rails.root, 'db', 'seeds.rb') )
        end
      end

      def install_core
        # => generate("strange_core:install")
        install_strange_modul( 'StrangeCore' )
        # => generate("strange_sites:install")
        install_strange_modul( 'StrangeSites' )
        strange_mirror_assets( 'StrangeSites' )
        # => generate("strange_user:install")
        install_strange_modul( 'StrangeUser' )
        # => Strangecms::CmsModul::FineModul.fine_modules.each do |modul|
        # =>   if modul.installable?
        # =>       generate("#{modul.gem_name}:install") if modul.core?
        # =>   end
        # => end
        generate("strange_themes:install")
      end
      
      def add_devise_routes
        puts("INFO: erstelle Devise-Route")
        route "devise_for :users"
      end
      
      def edit_app_config_file
        # => application "config.asset_host = 'http://example.com'"
        application "config.time_zone = 'Berlin'"
        application "config.i18n.default_locale = :de"
      end
      
      def install_fine_modules
        Strangecms::CmsModul::FineModul.fine_modules.each do |modul|
          if modul.installable?
              # => generate("#{modul.gem_name}:install") unless modul.core?
              install_strange_modul( modul.modul_name )
          end
        end
      end
      
      # => def install_themes
      # =>   generate("strange_themes:install")
      # => end
      
      def install_db_sample_data
        if yes?("fineline - Beispiel-Daten intallieren?")
          Strangecms::CmsModul::FineModul.fine_modules.each do |modul|
            # => if modul.sample_seed?
                strange_sample_seed( modul.modul_name )
            # => end
          end
        end
      end
      
      def install_development_db
        if yes?("fineline - Development-DB erstellen?")
          puts("INFO: erstelle DB-Migration")
          rake("db:migrate")
          puts("INFO: erstelle DB-Beispieldaten")
          rake("db:seed")
        end
      end
      
      def migrate_db_prod
        puts("INFO: erstelle production DB-Migration")
        # => rake("db:migrate RAILS_ENV=production")
        rake("db:migrate", :env => "production")
      end
      
      def seed_db_prod
        puts("INFO: erstelle production DB-Beispieldaten")
        # => rake("db:seed RAILS_ENV=production")
        rake("db:seed", :env => "production")
      end
      
      def end_desc
        puts('========================================================================================================')
        puts('-    -    -    -    -    -    -    -      s t r a n g e  C M S      -    -    -    -    -    -    -    -')
        puts('--------------------------------------------------------------------------------------------------------')
        puts('   .   .   .   .   Installation abgschlossen,  "rails s"  startet Ihr neues CMS!   .   .   .   .   .   .')
        puts('========================================================================================================')
      end
      
      private
        
        def install_strange_modul( modul )
          if !!defined?modul.constantize::Engine
            Dir.glob( File.join(File.expand_path("#{ the_path( modul ) }/db/templates", __FILE__), "create*.*") ) do |file|
              puts("#{ modul }:: erstelle Migration .. (#{File.basename(file.to_s)})")
              migration_template "#{file}", "db/migrate/#{File.basename(file.to_s)}"
            end
            # migrate Updates
            Dir.glob( File.join(File.expand_path("#{ the_path( modul ) }/db/templates", __FILE__), "update*.*") ) do |file|
              puts("#{ modul }:: erstelle Migration update .. (#{File.basename(file.to_s)})")
              migration_template "#{file}", "db/migrate/#{File.basename(file.to_s)}"
            end
            # DB-Seed
            Dir.glob( File.join(File.expand_path("#{ the_path( modul ) }/db/templates", __FILE__), "system_seed*.*") ) do |file|
              if File.exist?("db/seeds.rb")
                puts("#{ modul }:: erweitere System-Seed .. (#{File.basename(file.to_s)})")
                append_to_file "#{Rails.root}/db/seeds.rb",  File.read( "#{ the_path( modul ) }/db/templates/#{File.basename(file.to_s)}" )
              else
                puts("#{ modul }:: erstelle System-Seed .. (#{File.basename(file.to_s)})")
                create_file "#{Rails.root}/db/seeds.rb",  File.read( "#{ the_path( modul ) }/db/templates/#{File.basename(file.to_s)}" )
              end
            end
          end
        end
        
        def strange_sample_seed( modul )
          if !!defined?modul.constantize::Engine
            Dir.glob( File.join(File.expand_path("#{ the_path( modul ) }/db/templates", __FILE__), "sample_seed*.*") ) do |file|
              puts("#{ modul }:: erstelle Sample-Seed (#{File.basename(file.to_s)})")
              if File.exist?("db/seeds.rb")
                append_to_file "#{Rails.root}/db/seeds.rb",  File.read( "#{ the_path( modul ) }/db/templates/#{File.basename(file.to_s)}" )
              else
                create_file "#{Rails.root}/db/seeds.rb",  File.read( "#{ the_path( modul ) }/db/templates/#{File.basename(file.to_s)}" )
              end
            end
          end
        end

        def strange_mirror_assets( modul )
          if !!defined?modul.constantize::Engine
            source = File.join("#{ the_path( modul ) }", 'public')
            destination = File.join(Rails.root, 'public')
            puts("#{ modul }:: Spiegle Daten in public-Ordner")
            Strangecms::FileUtilz.mirror_files(source, destination)
          end
        end
        
        def the_path( modul )
          modul.constantize::Engine.config.root
        end
        
        def self.next_migration_number(path)
          @prev_migration_nr ? @prev_migration_nr += 1 : @prev_migration_nr = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
          @prev_migration_nr.to_s
        end
      
    end
  end
end