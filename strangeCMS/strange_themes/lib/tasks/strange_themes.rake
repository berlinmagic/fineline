namespace :themes do
  desc "Creates the cached theme folder"
  task :create_cache => :environment do
    for theme in StrangeThemes.available_themes
      theme_name = File.basename(theme)
      theme_dir = StrangeThemes.config.themes_dir
      theme_base = "#{Rails.public_path}/#{theme_dir}/#{theme_name}"
      puts "Creating #{theme_base}"
  
      FileUtils.mkdir_p "#{theme_base}"      
      FileUtils.cp_r "#{theme}/images", "#{theme_base}/images", :verbose => true
      FileUtils.cp_r "#{theme}/stylesheets", "#{theme_base}/stylesheets", :verbose => true
      FileUtils.cp_r "#{theme}/javascripts", "#{theme_base}/javascripts", :verbose => true
    end
  end
  desc "Removes the cached (public) theme folders"
  task :remove_cache => :environment do
    theme_dir = StrangeThemes.config.themes_dir
    puts "Removing #{Rails.public_path}/#{theme_dir}"
    FileUtils.rm_r "#{Rails.public_path}/#{theme_dir}", :force => true
  end
  desc "Updates the cached (public) theme folders"
  task :update_cache => [:remove_cache, :create_cache]
end
