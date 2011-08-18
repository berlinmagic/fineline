module StrangeThemes
  class << self

    def config
      @config ||= StrangeThemes::Config.new
      yield(@config) if block_given?
      @config
    end
    
    def available_themes(&block)
      Dir.glob(File.join(config.themes_path, "*"), &block) 
    end
    alias each_theme_dir available_themes
    
    def available_theme_names
      available_themes.map {|theme| File.basename(theme) } 
    end
    
    def add_themes_path_to_sass
      if StrangeThemes.config.sass_is_available?
        each_theme_dir do |dir|
          if File.directory?(dir) # Need to get rid of the '.' and '..'

            sass_dir = "#{dir}/stylesheets/sass"
            css_dir = "#{dir}/stylesheets"

            unless already_configured_in_sass?(sass_dir)
              Sass::Plugin.add_template_location sass_dir, css_dir 
            end
          end
        end 
      else
        raise "Sass is not available. What are you trying to do?"
      end
    end
    
    def already_configured_in_sass?(sass_dir)
      Sass::Plugin.template_location_array.map(&:first).include?(sass_dir)
    end
    
  end
end

require 'active_support/dependencies'
require 'strange_themes/config'
require 'strange_themes/common_methods'
require 'strange_themes/url_helpers'
require 'strange_themes/view_helpers'
require 'strange_themes/assets_controller'
require 'strange_themes/controller_methods'
require 'strange_themes/railtie'
require 'strange_themes/routes'
require 'strange_themes_help'
