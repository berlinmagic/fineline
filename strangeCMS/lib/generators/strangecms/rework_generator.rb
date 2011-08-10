# encoding: utf-8
module Strangecms
  module Generators
    require 'fileutils'
    class ReworkGenerator < Rails::Generators::Base
      desc "Kill old & creates new CMS basic structure."
      
      def remove_old_cms_files
        
        ### =>  TODO::: per RAke Datenbank löschen zwecks sql db's !  ###
        
        if File.directory?( File.join(StrangeThemes.config.themes_path) )
          FileUtils.remove_entry_secure( File.join(StrangeThemes.config.themes_path) )
          puts('altes Theme-Verzeíchniss wurde gelöscht')
        end
        if File.directory?( File.join(Rails.root, 'db') )
          FileUtils.remove_entry_secure( File.join(Rails.root, 'db') )
          puts('Datenbank-Verzeíchniss wurde gelöscht')
        end
        if File.directory?( File.join(Rails.root, 'public/stylesheets') )
          FileUtils.remove_entry_secure( File.join(Rails.root, 'public/stylesheets') )
          puts('Style-Verzeíchniss wurde gelöscht')
        end
        if File.directory?( File.join(Rails.root, 'public/images') )
          FileUtils.remove_entry_secure( File.join(Rails.root, 'public/images') )
          puts('Bild-Verzeíchniss wurde gelöscht')
        end
        if File.directory?( File.join(Rails.root, 'public/javascripts') )
          FileUtils.remove_entry_secure( File.join(Rails.root, 'public/javascripts') )
          puts('Javascript-Verzeíchniss wurde gelöscht')
        end
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
        rake("db:migrate")
      end
      
      def seed_db
        rake("db:seed")
      end
      
    end
  end
end