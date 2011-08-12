# encoding: utf-8
class GallerieConfiguration < Configuration
  
  PIC_SHOWS     =   %w(lightbox show_pic)
  PIC_DETAIL    =   %w(full std)
  
  # => standard, hochformat, querformat, panorama, spezial
  
  preference :hochformat_width, :integer, :default => 600
  preference :hochformat_height, :integer, :default => 800
  preference :hochformat_thumb_width, :integer, :default => 150
  preference :hochformat_thumb_height, :integer, :default => 200
  
  preference :querformat_width, :integer, :default => 800
  preference :querformat_height, :integer, :default => 600
  preference :querformat_thumb_width, :integer, :default => 200
  preference :querformat_thumb_height, :integer, :default => 150
  
  preference :panorama_width, :integer, :default => 1200
  preference :panorama_height, :integer, :default => 540
  preference :panorama_thumb_width, :integer, :default => 200
  preference :panorama_thumb_height, :integer, :default => 90
  
  preference :spezial_width, :integer, :default => 800
  preference :spezial_height, :integer, :default => 800
  preference :spezial_thumb_width, :integer, :default => 200
  preference :spezial_thumb_height, :integer, :default => 200
  
  preference :default_width, :integer, :default => 800
  preference :default_height, :integer, :default => 600
  preference :default_thumb_width, :integer, :default => 200
  preference :default_thumb_height, :integer, :default => 150
  
  preference :standard_format, :string, :default => 'querformat'
  
  preference :pic_show, :string, :default => PIC_SHOWS[0]
  
  preference :pic_detail, :string, :default => PIC_DETAIL[0]
  

end
