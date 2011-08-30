require 'RMagick' 
module Dragonfly 
  module Processing 
    class WatermarkProcessor 
      include Dragonfly::RMagick::Utils 
      include Dragonfly::Configurable 
      configurable_attr :use_filesystem, true 
      def add_watermark(temp_object, opts={}) 
        path = opts[:path]
        src = Magick::Image.read(path).first 
        
        rmagick_image(temp_object) do |image| 
          
          src.opacity = Magick::MaxRGB / 2
          
          bg    = Magick::Image.read("xc:none") { self.size = "#{src.columns * 3}x#{src.rows * 3}" }.first
          mark  = bg.composite(src, Magick::CenterGravity, Magick::OverCompositeOp)
          
          image.composite_tiled mark
          
          # => image.composite(src, Magick::CenterGravity, Magick::OverCompositeOp)
          
        end 
      end 
    end 
  end 
end