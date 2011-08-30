require 'RMagick' 
module Dragonfly 
  module Processing 
    class TiledTextWatermarkProcessor 
      include Dragonfly::RMagick::Utils 
      include Dragonfly::Configurable 
      configurable_attr :use_filesystem, true 
      def add_tiled_text(temp_object, opts={}) 
        text    =   opts[:text]   ||  'fineline-CMS'
        color   =   opts[:color]  ||  336699
        width   =   opts[:width]  ||  150
        height  =   opts[:height] ||  50
        
        rmagick_image(temp_object) do |image|
          
          wm = Magick::Image.read("xc:none") { self.size = "#{width}x#{height}" }.first

          # Draw "RMagick" in semi-transparent text on the transparent image.
          gc = Magick::Draw.new
          gc.fill "##{color}33"
          gc.font_weight Magick::BoldWeight
          gc.font_size 18
          gc.rotate 15
          gc.gravity Magick::CenterGravity
          gc.text 0, 0, "#{text}"
          gc.draw wm
          # Read the background image.

          # Composite the tile image over the background image.
          image.composite_tiled! wm
          
        end 
      end 
    end 
  end 
end