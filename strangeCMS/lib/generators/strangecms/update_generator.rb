# encoding: utf-8
module Strangecms
  module Generators
    class UpdateGenerator < Rails::Generators::Base
      desc "Creates a CMS basic structure."
      
      def initial_desc
        puts('   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *')
        puts('   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .')
        puts('   .   .   .   .   .   .   s t r a n g e C M S    system-update    .   .   .   .   .   .   .   .   .   .')
        puts('   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .')
        puts('   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *')
      end

      def update_core
        Strangecms::CmsModul::FineModul.fine_modules.each do |modul|
          if modul.updatable?
              generate("#{modul.gem_name}:update") if modul.core?
          end
        end
      end
      
      def update_fine_modules
        Strangecms::CmsModul::FineModul.fine_modules.each do |modul|
          if modul.updatable?
              generate("#{modul.gem_name}:update") unless modul.core?
          end
        end
     end
      
      def migrate_db
        puts("INFO: erstelle DB-Migration")
        rake("db:migrate")
      end
      
      def migrate_db_prod
        puts("INFO: erstelle production DB-Migration")
        # => rake("db:migrate RAILS_ENV=production")
        rake("db:migrate", :env => "production")
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