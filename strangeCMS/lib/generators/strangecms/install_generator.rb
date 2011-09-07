# encoding: utf-8
module Strangecms
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "Creates a CMS basic structure."
      
      def initial_desc
        puts('   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *')
        puts('   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .')
        puts('   .   .   .   .   .   .   .   .   .    s t r a n g e C M S    .   .   .   .   .   .   .   .   .   .   .')
        puts('   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .')
        puts('   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *')
      end

      def install_core
        generate("strange_core:install")
        generate("strange_sites:install")
        generate("strange_user:install")
        # => Strangecms::CmsModul::FineModul.fine_modules.each do |modul|
        # =>   if modul.installable?
        # =>       generate("#{modul.gem_name}:install") if modul.core?
        # =>   end
        # => end
        generate("strange_themes:install")
      end
      
      def install_fine_modules
        Strangecms::CmsModul::FineModul.fine_modules.each do |modul|
          if modul.installable?
              generate("#{modul.gem_name}:install") unless modul.core?
          end
        end
      end
      
      # => def install_themes
      # =>   generate("strange_themes:install")
      # => end
      
      
      def migrate_db
        puts("INFO: erstelle DB-Migration")
        rake("db:migrate")
      end
      
      def migrate_db_prod
        puts("INFO: erstelle production DB-Migration")
        # => rake("db:migrate RAILS_ENV=production")
        rake("db:migrate", :env => "production")
      end
      
      def seed_db
        puts("INFO: erstelle DB-Beispieldaten")
        rake("db:seed")
      end
      
      def seed_db_prod
        puts("INFO: erstelle production DB-Beispieldaten")
        # => rake("db:seed RAILS_ENV=production")
        rake("db:seed", :env => "production")
      end
      
      def end_desc
        puts('   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *')
        puts('   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .')
        puts('   .   .   .   .   .   .   .   .   .    s t r a n g e C M S    .   .   .   .   .   .   .   .   .   .   .')
        puts('   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .')
        puts('   .   .   .   .   Installation abgschlossen,  "rails s"  startet Ihr neues CMS!   .   .   .   .   .   .')
        puts('   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .')
        puts('   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *')
      end
      
    end
  end
end