require 'RMagick'

module Dragonfly 
  module Processing 
    class FadeProcessor 
      include Dragonfly::RMagick::Utils 
      include Dragonfly::Configurable 
      configurable_attr :use_filesystem, true 
      def add_fade(temp_object, opts={}) 
        
        steps = opts[:steps] || 20
        step = Magick::TransparentOpacity / steps.to_f
        
        rmagick_image(temp_object) do |image|

          rows = image.rows
          cols = image.columns
          
          
          rows.times { |y|
              pixels = image.get_pixels(0, y, cols, 1)
              pixels.each_with_index do |p,x|
                if (x + 1) < steps
                  p.opacity = (steps - x) * step
                elsif (cols - x) < steps
                  p.opacity = (steps - (cols - x)) * step
                end
              end
              pic.store_pixels(0, y, cols, 1, pixels)
              image = pic
          }
          
        end 
      end 
    end 
  end 
end

