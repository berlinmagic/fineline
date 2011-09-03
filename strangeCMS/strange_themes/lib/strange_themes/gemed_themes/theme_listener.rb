module StrangeThemes
  module GemedThemes
    require 'singleton'
    # Listener class used for views hooks.
    class ThemeListener
      include Singleton
    
      attr_accessor :theme_gems

      def initialize
        @theme_gems = []
      end
      
    end
  end
end