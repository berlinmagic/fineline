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
        rake("db:migrate")
      end
      
      def seed_db
        rake("db:seed")
      end
      
    end
  end
end