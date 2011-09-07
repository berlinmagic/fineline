module Strangecms
  module CmsModul
    module FineModul

      @@fine_module_classes = []
      @@fine_modules = nil

      class << self
        # Adds a listener class.
        # Automatically called when a class inherits from Spree::ThemeSupport::HookListener.
        def add_listener(klass)
          raise "Hooks must include Singleton module." unless klass.included_modules.include?(Singleton)
          @@fine_module_classes << klass
          clear_fine_module_instances
        end

        # Returns all the listerners instances.
        def fine_modules
          # => @@fine_modules ||= @@fine_module_classes.uniq.collect {|listener| listener.instance}
          Strangecms::CmsModul::FineListener.subclasses.each do |theme_class|
            theme_class
          end
        end

        # Clears all the listeners.
        def clear_gemed_theme
          @@fine_module_classes = []
          clear_fine_module_instances
        end
        
        # Clears all the listeners instances.
        def clear_fine_module_instances
          @@fine_modules = nil
        end
    
      end
      
    end
    
  end
end