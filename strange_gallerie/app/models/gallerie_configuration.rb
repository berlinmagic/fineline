# encoding: utf-8
class GallerieConfiguration < Configuration
  
  WATERMARKS    =   %w(image text)
  WM_TILES      =   [1, 4, 9, 16]
  FONTSIZE      =   (12..30).to_a
  
  PIC_FORMATS   =   %w(line2 line4)   # => %w(line2 line3 line4)
  
  PIC_SHOWS     =   %w(lightbox seite)
  PIC_DETAIL    =   %w(full std)
  
  # => standard, hochformat, querformat, panorama, spezial
  
  preference :aktiv,                  :boolean,   :default => true
  
  preference :pics_per_page_4line,    :integer,   :default => 16
  preference :pics_per_page_3line,    :integer,   :default => 9
  preference :pics_per_page_2line,    :integer,   :default => 4
  
  preference :use_watermarks,         :boolean,   :default => true
  preference :lightbox_watermark,     :boolean,   :default => true
  preference :show_watermark,         :boolean,   :default => true
  
  preference :index_watermark_4line,  :boolean,   :default => false
  preference :index_watermark_3line,  :boolean,   :default => false
  preference :index_watermark_2line,  :boolean,   :default => true
  
  preference :watermark_type,         :string,    :default => WATERMARKS[1]
  
  preference :watermark_tile,         :integer,   :default => WM_TILES[1]
  
  preference :watermark_text,         :string,    :default => 'fineline-CMS'
  
  preference :watermark_font_size,    :integer,   :default => 18
  preference :watermark_font_color,   :string,    :default => 'f3f2f2'
  preference :watermark_rotate,       :integer,   :default => 13
  preference :watermark_blur,         :integer,   :default => 42
  
  preference :watermark_datei,        :integer
  
  
  
  
  
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
