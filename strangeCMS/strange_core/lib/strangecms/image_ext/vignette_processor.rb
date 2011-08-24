require 'RMagick'

module Dragonfly 
  module Processing 
    class VignetteProcessor 
      include Dragonfly::RMagick::Utils 
      include Dragonfly::Configurable 
      configurable_attr :use_filesystem, true 
      def add_vignette(temp_object, opts={})  
        rmagick_image(temp_object) do |image| 
          image.vignette 
        end 
      end 
    end 
  end 
end