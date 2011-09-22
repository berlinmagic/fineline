# encoding: utf-8
class NewzConfiguration < Configuration
  
  preference :aktiv, :boolean, :default => true
  
  
  preference :news_per_page, :integer, :default => 7
  
  
  preference :always_crop_pix, :boolean, :default => true
  
  
  preference :preview_pic_width, :integer, :default => 300
  preference :preview_pic_height, :integer, :default => 90
  
  
  preference :preview_pic_max_width, :integer, :default => 300
  preference :preview_pic_max_height, :integer, :default => 150
  
  
  preference :news_pic_width, :integer, :default => 700
  preference :news_pic_height, :integer, :default => 210
  
  preference :news_pic_max_width, :integer, :default => 700
  preference :news_pic_max_height, :integer, :default => 350

end
