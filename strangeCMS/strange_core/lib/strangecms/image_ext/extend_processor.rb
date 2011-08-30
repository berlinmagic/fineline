require 'RMagick'

module Dragonfly 
  module Processing 
    class ExtendProcessor 
      include Dragonfly::RMagick::Utils 
      include Dragonfly::Configurable 
      configurable_attr :use_filesystem, true 
      def blowup(temp_object, opts={}) 

        rmagick_image(temp_object) do |image| 
          width   =   opts[:width]  || 2000
          height  =   opts[:height] || 1000
          x_off   =   (width - image.columns) / -2
          y_off   =   (height - image.rows) / -2
          
          image.extent(width, height, x_off, y_off)
          
        end 
      end 
    end 
  end 
end

