module StrangeCore
  class Engine < Rails::Engine
    
    
    config.autoload_paths += %W(#{config.root}/lib)
    
    
    # TODO - register state monitor observer?

    def self.activate
    
      Strangecms::ThemeSupport::HookListener.subclasses.each do |hook_class|
        Strangecms::ThemeSupport::Hook.add_listener(hook_class)
      end
      
      Dir.glob(File.join(File.dirname(__FILE__), "../../app/**/*_decorator*.rb")) do |c|
        Rails.env.production? ? require(c) : load(c)
      end
    
    end

    config.to_prepare &method(:activate).to_proc
    
    # => # filter sensitive information during logging
    # => initializer "strange.app.configurator" do |app|
    # =>   app.config.time_zone = "#{ Strangecms::Config[:time_zone].blank? ? 'Berlin' : Strangecms::Config[:time_zone] }"
    # =>   app.config.i18n.default_locale = Strangecms::Config[:default_locale]
    # =>   app.config.encoding = "utf-8"
    # => end

  end
end