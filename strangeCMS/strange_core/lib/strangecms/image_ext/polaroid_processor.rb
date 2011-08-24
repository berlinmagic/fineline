require 'RMagick'

module Dragonfly 
  module Processing 
    class PalaroidProcessor 
      include Dragonfly::RMagick::Utils 
      include Dragonfly::Configurable 
      configurable_attr :use_filesystem, true 
      def add_polaroid(temp_object, opts={}) 
        rmagick_image(temp_object) do |image| 
          img.polaroid do
             self.shadow_color = "gray40"
             self.pointsize = 12
          end
        end 
      end 
    end 
  end 
end

