# ActiveSupport.on_load(:action_view) { include Devise::Controllers::UrlHelpers }

module StrangeThemes
  class Railtie < ::Rails::Railtie
    config.strange_themes = ActiveSupport::OrderedOptions.new

    config.to_prepare do
      StrangeThemes::Railtie.config.strange_themes.each do |key, value|
        StrangeThemes.config.send "#{key}=".to_sym, value
      end
      
      # Adding theme stylesheets path to sass, automatically. 
      StrangeThemes.add_themes_path_to_sass if StrangeThemes.config.use_sass?
      
    end


    def self.activate
      
      Dir.glob(File.join(File.dirname(__FILE__), "../../app/**/*_decorator*.rb")) do |c|
        Rails.env == "production" ? require(c) : load(c)
      end
      
    end
    
    config.to_prepare &method(:activate).to_proc
    
    rake_tasks do
      load "tasks/strange_themes.rake"
    end
  end
end