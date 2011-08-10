# encoding: utf-8
module Strangecms
  module Generators
    require 'fileutils'
    class ReviewGenerator < Rails::Generators::Base
      desc "Kill old & creates new CMS basic structure."
      
      puts('     .     .     .     .     .     ')
      def remove_old_cms_files
        puts('Suche altes "default" Theme-Verzeíchniss')
        if File.directory?( File.join(StrangeThemes.config.themes_path, 'default') )
          puts('... Verzeichniss "default" gefunden ... wird gelöscht')
          FileUtils.remove_entry_secure( File.join(StrangeThemes.config.themes_path, 'default') )
          puts('> altes Theme-Verzeíchniss wurde gelöscht')
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
      
      def mirror_assets
        source = File.join("#{StrangeSites::Engine.config.root}", "/public")
        destination = File.join(Rails.root, 'public')
        # => puts("INFO: Mirroring assets from #{source} to #{destination}")
        puts("INFO: Spiegle _Sites-Daten in public-Ordner")
        Strangecms::FileUtilz.mirror_files(source, destination)
      end
      
      
      
      def install_themes
        puts('Initialisiere neues "default" Theme-Verzeíchniss')
        
        generate("strange_themes:install")
        
        puts('     .     .     .     .     .     ')
        puts('     .     .     .     .     .     ')
        puts('     .  Theme aktualisiert!  .     ')
        puts('     .     .     .     .     .     ')
      end
      
      
      
    end
  end
end