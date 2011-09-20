require 'rails/generators'

module Strangecms
  module Generators
    class ThemeGenerator < Rails::Generators::NamedBase
      source_root File.expand_path("../../templates", __FILE__)

      desc "Creates a new theme gem with the name you specify."
      check_class_collision

      def create_root_files
        empty_directory file_name
        empty_directory "#{file_name}/public"
        template "Rakefile.tt", "#{file_name}/Rakefile"
        template "README.md", "#{file_name}/README.md"
        template "gitignore.tt", "#{file_name}/.gitignore"
        template "theme.gemspec.tt", "#{file_name}/#{file_name}.gemspec"
      end

      def create_config_files
        empty_directory "#{file_name}/config"
        template "config/routes.rb", "#{file_name}/config/routes.rb"
        empty_directory "#{file_name}/config/locales"
        template "config/locales/de.yml", "#{file_name}/config/locales/de.yml"
        template "config/locales/en.yml", "#{file_name}/config/locales/en.yml"
      end

      #def install_rake
      #  template "install.rake.tt", "#{file_name}/lib/tasks/install.rake"
      #end

      def create_app_dirs
        empty_directory "#{file_name}/app"
        empty_directory "#{file_name}/#{StrangeThemes.config.themes_dir}"
        empty_directory "#{file_name}/#{StrangeThemes.config.themes_dir}/#{file_name.gsub(/strange_/, '')}"
        empty_directory "#{file_name}/#{StrangeThemes.config.themes_dir}/#{file_name.gsub(/strange_/, '')}/views"
        empty_directory "#{file_name}/app/controllers"
        empty_directory "#{file_name}/app/helpers"
        empty_directory "#{file_name}/app/models"
        empty_directory "#{file_name}/app/views"
      end

      def create_lib_files
        empty_directory "#{file_name}/lib"
        template 'lib/theme.rb.tt', "#{file_name}/lib/#{file_name}.rb"
        template 'lib/version.rb.tt', "#{file_name}/lib/#{file_name}/version.rb"
        
        template 'lib/modul_hooks.rb.tt', "#{file_name}/lib/#{file_name}_hooks.rb"
        template 'lib/modul_theme.rb.tt', "#{file_name}/lib/#{file_name}_theme.rb"
        template 'lib/theme_modul.rb.tt', "#{file_name}/lib/#{file_name}_modul.rb"
        
        template 'lib/theme__initializer.rb.tt', "#{file_name}/lib/theme_#{file_name}_initializer.rb"
        
        # => empty_directory "#{file_name}/lib/generators"
        # => empty_directory "#{file_name}/lib/generators/#{file_name}"
        # => template 'lib/install_generator.rb.tt', "#{file_name}/lib/generators/#{file_name}/install_generator.rb"
        # => template 'lib/update_generator.rb.tt', "#{file_name}/lib/generators/#{file_name}/update_generator.rb"
        # => empty_directory "#{file_name}/lib/generators/#{file_name}/templates"
        # => template 'lib/templates/create_modul.rb.tt', "#{file_name}/lib/generators/#{file_name}/templates/create_#{file_name}.rb"
        # => template 'lib/templates/update_modul.rb.tt', "#{file_name}/lib/generators/#{file_name}/templates/update_#{file_name}.rb"
        # => template 'lib/templates/seed_modul.rb.tt', "#{file_name}/lib/generators/#{file_name}/templates/seed_#{file_name}.rb"
      end


      def update_gemfile
        gem file_name, :path => file_name, :require => file_name
      end
      
      def create_full_theme
        if yes?("Alle relevanten Dateien in neuen Theme-Ordner spiegeln?")
          puts("StrangeSites:: Spiegle views in default-Theme view-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeSites::Engine.config.root}", "app", "views"), 
                File.join("#{file_name}/#{StrangeThemes.config.themes_dir}/#{file_name.gsub(/strange_/, '')}", "views") 
                )
          puts("StrangeSites:: Spiegle views in default-Theme view-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeSites::Engine.config.root}", "public"), 
                File.join("#{file_name}/#{StrangeThemes.config.themes_dir}/#{file_name.gsub(/strange_/, '')}") 
                )
          puts("StrangeCore:: Spiegle views in default-Theme view-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeCore::Engine.config.root}", "app", "views"), 
                File.join("#{file_name}/#{StrangeThemes.config.themes_dir}/#{file_name.gsub(/strange_/, '')}", "views") 
                )
          puts("StrangeUser:: Spiegle views in default-Theme view-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeUser::Engine.config.root}", "app", "views"), 
                File.join("#{file_name}/#{StrangeThemes.config.themes_dir}/#{file_name.gsub(/strange_/, '')}", "views") 
                )
          Strangecms::CmsModul::FineModul.fine_modules.each do |modul|
            unless modul.core?
                copy_modul_data( modul.modul_name )
            end
          end
        end
      end
      
      def create_full_default_theme
        if yes?("Default-Theme-Ordner erstellen und alle relevanten Dateien hinein spiegeln?")
          empty_directory "#{file_name}/#{StrangeThemes.config.themes_dir}/default"
          empty_directory "#{file_name}/#{StrangeThemes.config.themes_dir}/default/views"
          puts("StrangeSites:: Spiegle views in default-Theme view-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeSites::Engine.config.root}", "app", "views"), 
                File.join("#{file_name}/#{StrangeThemes.config.themes_dir}/default", "views") 
                )
          puts("StrangeSites:: Spiegle views in default-Theme view-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeSites::Engine.config.root}", "public"), 
                File.join("#{file_name}/#{StrangeThemes.config.themes_dir}/default") 
                )
          puts("StrangeCore:: Spiegle views in default-Theme view-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeCore::Engine.config.root}", "app", "views"), 
                File.join("#{file_name}/#{StrangeThemes.config.themes_dir}/default", "views") 
                )
          puts("StrangeUser:: Spiegle views in default-Theme view-Ordner")
          Strangecms::FileUtilz.mirror_files( 
                File.join("#{StrangeUser::Engine.config.root}", "app", "views"), 
                File.join("#{file_name}/#{StrangeThemes.config.themes_dir}/default", "views") 
                )
          Strangecms::CmsModul::FineModul.fine_modules.each do |modul|
            unless modul.core?
                copy_modul_default_data( modul.modul_name )
            end
          end
        end
      end

      protected
      
      def copy_modul_data( modul )
        puts("#{modul.gsub(/Strange/, '')}:: Spiegle views in default-Theme view-Ordner")
        Strangecms::FileUtilz.mirror_files( 
              File.join("#{modul.constantize::Engine.config.root}", "app", "views"), 
              File.join("#{file_name}/#{StrangeThemes.config.themes_dir}/#{file_name.gsub(/strange_/, '')}", "views") 
              )
        puts("#{modul.gsub(/Strange/, '')}:: Spiegle Daten in default-Theme public-Ordner")
        Strangecms::FileUtilz.mirror_files( 
              File.join("#{modul.constantize::Engine.config.root}", "public"), 
              File.join("#{file_name}/#{StrangeThemes.config.themes_dir}/#{file_name.gsub(/strange_/, '')}")
              )
      end
      
      def copy_modul_default_data( modul )
        puts("#{modul.gsub(/Strange/, '')}:: Spiegle views in default-Theme view-Ordner")
        Strangecms::FileUtilz.mirror_files( 
              File.join("#{modul.constantize::Engine.config.root}", "app", "views"), 
              File.join("#{file_name}/#{StrangeThemes.config.themes_dir}/default", "views") 
              )
        puts("#{modul.gsub(/Strange/, '')}:: Spiegle Daten in default-Theme public-Ordner")
        Strangecms::FileUtilz.mirror_files( 
              File.join("#{modul.constantize::Engine.config.root}", "public"), 
              File.join("#{file_name}/#{StrangeThemes.config.themes_dir}/default")
              )
      end

      def current_locale
        I18n.locale.to_s
      end

      def extension_dir(join=nil)
        if join
          File.join(file_name, join)
        else
          file_name
        end
      end

    end
  end
end