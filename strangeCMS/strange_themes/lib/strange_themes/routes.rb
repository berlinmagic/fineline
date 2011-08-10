module StrangeThemes
  module Routes
    def strange_themes
      theme_dir = StrangeThemes.config.themes_dir
      match "#{theme_dir}/:theme/stylesheets/*asset" => 'strange_themes/assets#stylesheets', :as => :base_theme_stylesheet
      match "#{theme_dir}/:theme/javascripts/*asset" => 'strange_themes/assets#javascripts', :as => :base_theme_javascript
      match "#{theme_dir}/:theme/images/*asset" => 'strange_themes/assets#images', :as => :base_theme_image
      # =>  NEW:    safes Production-Bild-Error
      match "/images/*asset" => 'strange_themes/assets#app_images', :as => :base_theme_image if Rails.env.production?
      match "/javascripts/*asset" => 'strange_themes/assets#javascripts', :as => :base_theme_javascript if Rails.env.production?
      match "/stylesheets/*asset" => 'strange_themes/assets#stylesheets', :as => :base_theme_stylesheet if Rails.env.production?
    end
  end
end
module ActionDispatch::Routing
  class Mapper #:nodoc:
    include StrangeThemes::Routes
  end
end

