require 'RMagick'

module Dragonfly 
  module Processing 
    class WatermarkProcessor 
      include Dragonfly::RMagick::Utils 
      include Dragonfly::Configurable 
      configurable_attr :use_filesystem, true 
      def add_watermark(temp_object, opts={}) 
        path = opts[:path] || "#{Rails.root}/public/images/fineline_logo_klein.png"
        src = Magick::Image.read(path).first 
        rmagick_image(temp_object) do |image| 
          image.composite(src, Magick::CenterGravity, 
Magick::OverCompositeOp) 
        end 
      end 
    end 
  end 
end

