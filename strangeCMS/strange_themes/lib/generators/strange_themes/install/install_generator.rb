# encoding: utf-8
module StrangeThemes
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "Creates a ThemeForRails basic structure."

      def create_themes_folder
        puts("THEME INFO :::::> erstelle Theme-Ordner = [ #{StrangeThemes.config.themes_path} ]")
        empty_directory(StrangeThemes.config.themes_path)
      end
      
      def add_themes_for_rails_routes
        puts("INFO: erstelle Theme-Route")
        route "strange_themes"
      end
      
      
      
      def no_Xsend_header
        puts("INFO: X-Send-Header deaktivieren & serve_static_assets aktivieren !!!")
        gsub_file 'config/environments/production.rb', "config.action_dispatch.x_sendfile_header", "#config.action_dispatch.x_sendfile_header"
        gsub_file 'config/environments/production.rb', "config.serve_static_assets = false", "config.serve_static_assets = true"
      end
      
      
      def create_default_folder
        puts("INFO: erstelle default-Theme in Theme-Ordner")
        empty_directory( File.join( StrangeThemes.config.themes_path, "default") )
        def_dir = File.join( File.expand_path(StrangeThemes.config.themes_path), "default", "views" )
        puts("INFO: erstelle default-Theme-view-Ordner = [ #{def_dir} ]")
        empty_directory( def_dir )
      end

      # => if !!defined?StrangeCore
      # =>   def create_default_core_theme
      # =>     make_modul_views( 'StrangeCore' )
      # =>   end
      # => end
      
      if !!defined?StrangeSites
        def create_default_sites_theme
          # => make_modul_views( 'StrangeSites' )
          # => make_modul_theme_publics( 'StrangeSites' )
          make_modul_publics( 'StrangeSites' )
        end
      end
      
      # => if !!defined?StrangeUser
      # =>   def create_default_user_theme
      # =>     make_modul_views( 'StrangeUser' )
      # =>   end
      # => end
      
      
      def create_modul_themes
        
        make_modul_publics( 'StrangeCategories' )             if !!defined?StrangeCategories
        make_modul_publics( 'StrangeKontaktform' )            if !!defined?StrangeKontaktform
        make_modul_publics( 'StrangeHeader' )                 if !!defined?StrangeHeader
        make_modul_publics( 'StrangeGallerie' )               if !!defined?StrangeGallerie
        make_modul_publics( 'StrangeBackup' )                 if !!defined?StrangeBackup
        make_modul_publics( 'StrangeFineform' )               if !!defined?StrangeFineform
        make_modul_publics( 'StrangeSidebars' )               if !!defined?StrangeSidebars
        make_modul_publics( 'StrangeNews' )                   if !!defined?StrangeNews
        make_modul_publics( 'StrangeNewsletter' )             if !!defined?StrangeNewsletter
        make_modul_publics( 'StrangeComments' )               if !!defined?StrangeComments
        make_modul_publics( 'StrangeMobilview' )              if !!defined?StrangeMobilview
        make_modul_publics( 'StrangeStylez' )                 if !!defined?StrangeStylez
        
      end
      
      
      private
        
        def make_modul_theme(modul)
          puts("#{modul.gsub(/Strange/, '')}:: Spiegle views in default-Theme view-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{modul.classify.constantize::Engine.config.root}", "app", "views"), 
                File.join("#{StrangeThemes.config.themes_path}", "default", "views") 
                )
          puts("#{modul.gsub(/Strange/, '')}:: Spiegle Daten in default-Theme public-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{modul.classify.constantize::Engine.config.root}", "public"), 
                File.join("#{StrangeThemes.config.themes_path}", 'default')
                )
          puts("#{modul.gsub(/Strange/, '')}:: Spiegle Daten in App public-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{modul.classify.constantize::Engine.config.root}", "/public"), 
                File.join("#{Rails.root}", 'public')
                )
        end
        
        def make_modul_views(modul)
          puts("#{modul.gsub(/Strange/, '')}:: Spiegle views in default-Theme view-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{modul.classify.constantize::Engine.config.root}", "app", "views"), 
                File.join("#{StrangeThemes.config.themes_path}", "default", "views") 
                )
        end
        
        def make_modul_publics(modul)
          puts("#{modul.gsub(/Strange/, '')}:: Spiegle Daten in App public-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{modul.classify.constantize::Engine.config.root}", "/public"), 
                File.join("#{Rails.root}", 'public')
                )
        end
        
        def make_modul_theme_publics(modul)
          puts("#{modul.gsub(/Strange/, '')}:: Spiegle Daten in default-Theme public-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{modul.classify.constantize::Engine.config.root}", "public"), 
                File.join("#{StrangeThemes.config.themes_path}", 'default')
                )
        end
      
      
    end
  end
end