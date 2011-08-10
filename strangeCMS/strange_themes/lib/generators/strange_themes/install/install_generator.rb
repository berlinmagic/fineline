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
      # =>     puts("INFO: Spiegle _Core-views in default-Theme-view-Ordner")
      # =>     Strangecms::FileUtilz.mirror_files( 
      # =>           File.join("#{StrangeCore::Engine.config.root}", "app", "views"), 
      # =>           File.join("#{StrangeThemes.config.themes_path}", "default", "views") 
      # =>           )
      # =>   end
      # => end
      
      if !!defined?StrangeSites
        def create_default_sites_theme
          # => puts("INFO: Spiegle _Sites-views in default-Theme-view-Ordner")
          # => Strangecms::FileUtilz.mirror_files( 
          # =>       File.join("#{StrangeSites::Engine.config.root}", "app", "views"), 
          # =>       File.join("#{StrangeThemes.config.themes_path}", "default", "views") 
          # =>       )
          # => puts("INFO: Spiegle _Sites-Daten in default-Theme-public-Ordner")
          # => Strangecms::FileUtilz.mirror_files( 
          # =>       File.join("#{StrangeSites::Engine.config.root}", "/public"), 
          # =>       File.join("#{StrangeThemes.config.themes_path}", '/default')
          # =>       )
          puts("INFO: Spiegle _Sites-Daten in App-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeSites::Engine.config.root}", "/public"), 
                File.join("#{Rails.root}", '/public')
                )
        end
      end
      
      # => if !!defined?StrangeUser
      # =>   def create_default_user_theme
      # =>     puts("INFO: Spiegle _User-views in default-Theme-view-Ordner")
      # =>     Strangecms::FileUtilz.mirror_files( 
      # =>           File.join("#{StrangeUser::Engine.config.root}", "app", "views"), 
      # =>           File.join("#{StrangeThemes.config.themes_path}", "default", "views") 
      # =>           )
      # =>   end
      # => end
      
      
      if !!defined?StrangeCategories
        def create_default_categories_theme
          puts("Categories :::::> Spiegle Dateien in Public-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeCategories::Engine.config.root}", "/public"), 
                File.join("#{Rails.root}", '/public')
                )
        end
      end
      
      
      if !!defined?StrangeKontaktform
        def create_default_kontaktform_theme
          puts("Kontaktform :::::> Spiegle Dateien in Public-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeKontaktform::Engine.config.root}", "/public"), 
                File.join("#{Rails.root}", '/public')
                )
        end
      end
      
      if !!defined?StrangeHeader
        def create_default_header_theme
          puts("Header :::::> Spiegle Dateien in Public-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeHeader::Engine.config.root}", "/public"), 
                File.join("#{Rails.root}", '/public')
                )
        end
      end
      
      if !!defined?StrangeTags
        def create_default_tags_theme
          puts("Tags :::::> Spiegle Dateien in Public-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeTags::Engine.config.root}", "/public"), 
                File.join("#{Rails.root}", '/public')
                )
        end
      end
      
      if !!defined?StrangeGallerie
        def create_default_gallerie_theme
          puts("Gallerie :::::> Spiegle Dateien in Public-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeGallerie::Engine.config.root}", "/public"), 
                File.join("#{Rails.root}", '/public')
                )
        end
      end
      
      if !!defined?StrangeBackup
        def create_default_backup_theme
          puts("BackUp :::::> Spiegle Dateien in Public-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeBackup::Engine.config.root}", "/public"), 
                File.join("#{Rails.root}", '/public')
                )
        end
      end
      
      if !!defined?StrangeFineform
        def create_default_fineform_theme
          puts("Fineform :::::> Spiegle Dateien in Public-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeFineform::Engine.config.root}", "/public"), 
                File.join("#{Rails.root}", '/public')
                )
        end
      end
      
      if !!defined?StrangeSidebars
        def create_default_sidebars_theme
          puts("Sidebars :::::> Spiegle Dateien in Public-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeSidebars::Engine.config.root}", "/public"), 
                File.join("#{Rails.root}", '/public')
                )
        end
      end
      
      if !!defined?StrangeNews
        def create_default_news_theme
          puts("News :::::> Spiegle Dateien in Public-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeNews::Engine.config.root}", "/public"), 
                File.join("#{Rails.root}", '/public')
                )
        end
      end
      
      if !!defined?StrangeNewsletter
        def create_default_newsletter_theme
          puts("Newsletter :::::> Spiegle Dateien in Public-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeNewsletter::Engine.config.root}", "/public"), 
                File.join("#{Rails.root}", '/public')
                )
        end
      end
      
      if !!defined?StrangeComments
        def create_default_comments_theme
          puts("Comments :::::> Spiegle Dateien in Public-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeComments::Engine.config.root}", "/public"), 
                File.join("#{Rails.root}", '/public')
                )
        end
      end
      
      if !!defined?StrangeMobilview
        def create_default_mobilview_theme
          puts("Mobilview :::::> Spiegle Dateien in Public-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeMobilview::Engine.config.root}", "/public"), 
                File.join("#{Rails.root}", '/public')
                )
        end
      end
      
      if !!defined?StrangeStylez
        def create_default_stylez_theme
          puts("StrangeStylez :::::> Spiegle Dateien in Public-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeStylez::Engine.config.root}", "/public"), 
                File.join("#{Rails.root}", '/public')
                )
        end
      end
      
      
      
    end
  end
end