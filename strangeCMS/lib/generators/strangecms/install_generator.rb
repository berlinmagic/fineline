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
      end
      
      def install_fine_modules
        
        generate("strange_categories:install")      if !!defined?StrangeCategories
        
        generate("strange_kontaktform:install")     if !!defined?StrangeKontaktform
        
        generate("strange_header:install")          if !!defined?StrangeHeader
        
        generate("strange_gallerie:install")        if !!defined?StrangeGallerie
        
        generate("strange_backup:install")          if !!defined?StrangeBackup
        
        generate("strange_fineform:install")        if !!defined?StrangeFineform
        
        generate("strange_sidebars:install")        if !!defined?StrangeSidebars
        
        generate("strange_news:install")            if !!defined?StrangeNews
        
        generate("strange_newsletter:install")      if !!defined?StrangeNewsletter
        
        generate("strange_comments:install")        if !!defined?StrangeComments
        
        generate("strange_stylez:install")          if !!defined?StrangeStylez
        
      end
      
      def install_themes
        generate("strange_themes:install")
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