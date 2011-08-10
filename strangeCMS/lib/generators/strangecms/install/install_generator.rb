# encoding: utf-8
module Strangecms
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "Creates a CMS basic structure."
      
      def initial_desc
        puts('   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *')
        puts('   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .')
        puts('   .   .   .   .   .   .   .   .   .   .   .    s t r a n g e C M S    .   .   .   .   .   .   .   .   .   .   .   .   .')
        puts('   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .')
        puts('   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *')
      end

      def install_core
        generate("strange_core:install")
      end
      
      def install_sites
        generate("strange_sites:install")
      end
      
      def install_user
        generate("strange_user:install")
      end
      
      if !!defined?StrangeCategories
        def install_categories
          generate("strange_categories:install")
        end
      end
      
      if !!defined?StrangeKontaktform
        def install_kform
          generate("strange_kontaktform:install")
        end
      end
      
      if !!defined?StrangeHeader
        def install_header
          generate("strange_header:install")
        end
      end
      
      if !!defined?StrangeTags
        def install_tags
          generate("strange_tags:install")
        end
      end
      
      if !!defined?StrangeGallerie
        def install_gallerie
          generate("strange_gallerie:install")
        end
      end
      
      if !!defined?StrangeBackup
        def install_backup
          generate("strange_backup:install")
        end
      end
      
      if !!defined?StrangeFineform
        def install_fineform
          generate("strange_fineform:install")
        end
      end
      
      if !!defined?StrangeSidebars
        def install_sidebars
          generate("strange_sidebars:install")
        end
      end
      
      if !!defined?StrangeNews
        def install_news
          generate("strange_news:install")
        end
      end
      
      if !!defined?StrangeNewsletter
        def install_newsletter
          generate("strange_newsletter:install")
        end
      end
      
      if !!defined?StrangeComments
        def install_comments
          generate("strange_comments:install")
        end
      end
      
      if !!defined?StrangeStylez
        def install_stylez
          generate("strange_stylez:install")
        end
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
        puts('   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *')
        puts('   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .')
        puts('   .   .   .   .   .   .   .   .   .   .   .    s t r a n g e C M S    .   .   .   .   .   .   .   .   .   .   .   .   .')
        puts('   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .')
        puts('   .   .   .   .   .   .   Installation abgschlossen,  "rails s"  startet Ihr neues CMS!   .   .   .   .   .   .   .   .')
        puts('   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .')
        puts('   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *')
      end
      
    end
  end
end