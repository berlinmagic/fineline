# encoding: utf-8
module StrangeThemes
  module Generators
    class FullThemeGenerator < Rails::Generators::Base
      desc "Creates a ThemeForRails basic structure."

      def create_themes_folder
        puts("INFO: erstelle Theme-Ordner = [ #{StrangeThemes.config.themes_path} ]")
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

      
      if !!defined?StrangeCore
        def create_default_core_theme
          puts("INFO: Spiegle _Core-views in default-Theme-view-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeCore::Engine.config.root}", "app", "views"), 
                File.join("#{StrangeThemes.config.themes_path}", "default", "views") 
                )
        end
      end
      
      if !!defined?StrangeSites
        def create_default_sites_theme
          puts("INFO: Spiegle _Sites-views in default-Theme-view-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeSites::Engine.config.root}", "app", "views"), 
                File.join("#{StrangeThemes.config.themes_path}", "default", "views") 
                )
          puts("INFO: Spiegle _Sites-Daten in default-Theme-public-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeSites::Engine.config.root}", "/public"), 
                File.join("#{StrangeThemes.config.themes_path}", '/default')
                )
          puts("INFO: Spiegle _Sites-Daten in App-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeSites::Engine.config.root}", "/public"), 
                File.join("#{Rails.root}", '/public')
                )
        end
      end
      
      if !!defined?StrangeUser
        def create_default_user_theme
          puts("INFO: Spiegle _User-views in default-Theme-view-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeUser::Engine.config.root}", "app", "views"), 
                File.join("#{StrangeThemes.config.themes_path}", "default", "views") 
                )
        end
      end
      
      
      if !!defined?StrangeCategories
        def create_default_categories_theme
          puts("Categories:: Spiegle views in default-Theme-view-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeCategories::Engine.config.root}", "app", "views"), 
                File.join("#{StrangeThemes.config.themes_path}", "default", "views") 
                )
          puts("Categories:: Spiegle Dateien in default-Theme-public-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeCategories::Engine.config.root}", "/public"), 
                File.join("#{StrangeThemes.config.themes_path}", '/default')
                )
          puts("Categories:: Spiegle Dateien in App-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeCategories::Engine.config.root}", "/public"), 
                File.join("#{Rails.root}", '/public')
                )
        end
      end
      
      
      if !!defined?StrangeKontaktform
        def create_default_kontaktform_theme
          puts("INFO: Spiegle _Kontaktform-views in default-Theme-view-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeKontaktform::Engine.config.root}", "app", "views"), 
                File.join("#{StrangeThemes.config.themes_path}", "default", "views") 
                )
          puts("INFO: Spiegle _Kontaktform-Daten in default-Theme-public-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeKontaktform::Engine.config.root}", "/public"), 
                File.join("#{StrangeThemes.config.themes_path}", '/default')
                )
          puts("INFO: Spiegle _Kontaktform-Daten in App-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeKontaktform::Engine.config.root}", "/public"), 
                File.join("#{Rails.root}", '/public')
                )
        end
      end
      
      if !!defined?StrangeHeader
        def create_default_header_theme
          puts("INFO: Spiegle _Header-views in default-Theme-view-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeHeader::Engine.config.root}", "app", "views"), 
                File.join("#{StrangeThemes.config.themes_path}", "default", "views") 
                )
          puts("INFO: Spiegle _Header-Daten in default-Theme-public-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeHeader::Engine.config.root}", "/public"), 
                File.join("#{StrangeThemes.config.themes_path}", '/default')
                )
          puts("INFO: Spiegle _Header-Daten in App-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeHeader::Engine.config.root}", "/public"), 
                File.join("#{Rails.root}", '/public')
                )
        end
      end
      
      if !!defined?StrangeTags
        def create_default_tags_theme
          puts("INFO: Spiegle _Tags-views in default-Theme-view-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeTags::Engine.config.root}", "app", "views"), 
                File.join("#{StrangeThemes.config.themes_path}", "default", "views") 
                )
          puts("INFO: Spiegle _Tags-Daten in default-Theme-public-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeTags::Engine.config.root}", "/public"), 
                File.join("#{StrangeThemes.config.themes_path}", '/default')
                )
          puts("INFO: Spiegle _Tags-Daten in App-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeTags::Engine.config.root}", "/public"), 
                File.join("#{Rails.root}", '/public')
                )
        end
      end
      
      if !!defined?StrangeGallerie
        def create_default_gallerie_theme
          puts("INFO: Spiegle _Gallerie-views in default-Theme-view-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeGallerie::Engine.config.root}", "app", "views"), 
                File.join("#{StrangeThemes.config.themes_path}", "default", "views") 
                )
          puts("INFO: Spiegle _Gallerie-Daten in default-Theme-public-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeGallerie::Engine.config.root}", "/public"), 
                File.join("#{StrangeThemes.config.themes_path}", '/default')
                )
          puts("INFO: Spiegle _Gallerie-Daten in App-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeGallerie::Engine.config.root}", "/public"), 
                File.join("#{Rails.root}", '/public')
                )
        end
      end
      
      if !!defined?StrangeBackup
        def create_default_backup_theme
          puts("INFO: Spiegle _BackUp-views in default-Theme-view-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeBackup::Engine.config.root}", "app", "views"), 
                File.join("#{StrangeThemes.config.themes_path}", "default", "views") 
                )
          puts("INFO: Spiegle _BackUp-Daten in default-Theme-public-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeBackup::Engine.config.root}", "/public"), 
                File.join("#{StrangeThemes.config.themes_path}", '/default')
                )
          puts("INFO: Spiegle _BackUp-Daten in App-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeBackup::Engine.config.root}", "/public"), 
                File.join("#{Rails.root}", '/public')
                )
        end
      end
      
      if !!defined?StrangeFineform
        def create_default_fineform_theme
          puts("INFO: Spiegle _Fineform-views in default-Theme-view-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeFineform::Engine.config.root}", "app", "views"), 
                File.join("#{StrangeThemes.config.themes_path}", "default", "views") 
                )
          puts("INFO: Spiegle _Fineform-Daten in default-Theme-public-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeFineform::Engine.config.root}", "/public"), 
                File.join("#{StrangeThemes.config.themes_path}", '/default')
                )
          puts("INFO: Spiegle _Fineform-Daten in App-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeFineform::Engine.config.root}", "/public"), 
                File.join("#{Rails.root}", '/public')
                )
        end
      end
      
      if !!defined?StrangeSidebars
        def create_default_sidebars_theme
          puts("INFO: Spiegle _Sidebars-views in default-Theme-view-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeSidebars::Engine.config.root}", "app", "views"), 
                File.join("#{StrangeThemes.config.themes_path}", "default", "views") 
                )
          puts("INFO: Spiegle _Sidebars-Daten in default-Theme-public-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeSidebars::Engine.config.root}", "/public"), 
                File.join("#{StrangeThemes.config.themes_path}", '/default')
                )
          puts("INFO: Spiegle _Sidebars-Daten in App-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeSidebars::Engine.config.root}", "/public"), 
                File.join("#{Rails.root}", '/public')
                )
        end
      end
      
      if !!defined?StrangeNews
        def create_default_news_theme
          puts("INFO: Spiegle _News-views in default-Theme-view-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeNews::Engine.config.root}", "app", "views"), 
                File.join("#{StrangeThemes.config.themes_path}", "default", "views") 
                )
          puts("INFO: Spiegle _News-Daten in default-Theme-public-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeNews::Engine.config.root}", "/public"), 
                File.join("#{StrangeThemes.config.themes_path}", '/default')
                )
          puts("INFO: Spiegle _News-Daten in App-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeNews::Engine.config.root}", "/public"), 
                File.join("#{Rails.root}", '/public')
                )
        end
      end
      
      
      if !!defined?StrangeNewsletter
        def create_default_newsletter_theme
          puts("INFO: Spiegle StrangeNewsletter-views in default-Theme-view-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeNewsletter::Engine.config.root}", "app", "views"), 
                File.join("#{StrangeThemes.config.themes_path}", "default", "views") 
                )
          puts("INFO: Spiegle StrangeNewsletter-Daten in default-Theme-public-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeNewsletter::Engine.config.root}", "/public"), 
                File.join("#{StrangeThemes.config.themes_path}", '/default')
                )
          puts("INFO: Spiegle StrangeNewsletter-Daten in App-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeNewsletter::Engine.config.root}", "/public"), 
                File.join("#{Rails.root}", '/public')
                )
        end
      end
      
      
      if !!defined?StrangeComments
        def create_default_comments_theme
          puts("INFO: Spiegle StrangeComments-views in default-Theme-view-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeComments::Engine.config.root}", "app", "views"), 
                File.join("#{StrangeThemes.config.themes_path}", "default", "views") 
                )
          puts("INFO: Spiegle StrangeComments-Daten in default-Theme-public-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeComments::Engine.config.root}", "/public"), 
                File.join("#{StrangeThemes.config.themes_path}", '/default')
                )
          puts("INFO: Spiegle StrangeComments-Daten in App-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeComments::Engine.config.root}", "/public"), 
                File.join("#{Rails.root}", '/public')
                )
        end
      end
      
      
      if !!defined?StrangeMobilview
        def create_default_mobilview_theme
          puts("INFO: Spiegle _Mobilview-views in default-Theme-view-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeMobilview::Engine.config.root}", "app", "views"), 
                File.join("#{StrangeThemes.config.themes_path}", "default", "views") 
                )
          puts("INFO: Spiegle _Mobilview-Daten in default-Theme-public-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeMobilview::Engine.config.root}", "/public"), 
                File.join("#{StrangeThemes.config.themes_path}", '/default')
                )
          puts("INFO: Spiegle _Mobilview-Daten in App-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeMobilview::Engine.config.root}", "/public"), 
                File.join("#{Rails.root}", '/public')
                )
        end
      end
      
      
      
    end
  end
end