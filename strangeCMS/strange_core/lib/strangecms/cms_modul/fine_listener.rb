module Strangecms
  module CmsModul
    require 'singleton'
    # Listener class used for views hooks.
    class FineListener
      include Singleton
    
      attr_accessor :fine_modules, :fine_installable_modules
      
      def initialize
        #@fine_modules = []
        #@fine_installable_modules = []
      end
      
      def self.installable?
        false
      end
      
      def self.updatable?
        false
      end
      
      def self.core?
        false
      end
      
      def self.theme?
        false
      end
      
      def self.mirror_views?
        false
      end
      
      def self.mirror_theme?
        false
      end
      
      def self.mirror_public?
        true
      end
      
      def self.sample_seed?
        false
      end
      
      def self.modul_name
        "#{ self.to_s.gsub(/Modul$/, '') }"
      end
      
      def self.gem_name
        "#{ self.to_s.gsub(/Modul$/, '').underscore }"
      end
      
      def self.version
        # => if self.to_s.gsub(/Modul$/, '').constantize.respond_to?('VERSION')  const_defined
        if self.to_s.gsub(/Modul$/, '').constantize.const_defined?('VERSION')  
          self.to_s.gsub(/Modul$/, '').constantize::VERSION.to_s
        else
          Strangecms.version
        end
      end
      
      # Replace contents of hook_name using supplied render args or string returned from block
      def self.install(wert=true)
          if wert
            def self.installable?
              true
            end
          end
      end
      
      def self.update(wert=true)
          if wert
            def self.updatable?
              true
            end
          end
      end
      
      def self.core(wert=true)
          if wert
            def self.core?
              true
            end
          end
      end
      
      def self.theme(wert=true)
          if wert
            def self.theme?
              true
            end
          end
      end
      
      def self.sample_seed(wert=true)
          if wert
            def self.sample_seed?
              true
            end
          end
      end
      
      def self.mirror_theme(wert=true)
          if wert
            def self.mirror_theme?
              true
            end
          end
      end
      
      def self.mirror_public(wert=true)
          if wert
            def self.mirror_public?
              true
            end
          end
      end
      
      def self.mirror_views(wert=true)
          if wert
            def self.mirror_views?
              true
            end
          end
      end
      
    end
  end
end