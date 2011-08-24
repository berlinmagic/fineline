require 'RMagick'

module Dragonfly 
  module Processing 
    class EXtendProcessor 
      include Dragonfly::RMagick::Utils 
      include Dragonfly::Configurable 
      configurable_attr :use_filesystem, true 
      def add_extend(temp_object, opts={}) 
        rmagick_image(temp_object) do |image| 
          img.extent do
            self.width = "2500"
            self.height = "1000"
             self.shadow_color = "none"
             self.pointsize = 12
          end
        end 
      end 
    end 
  end 
end

