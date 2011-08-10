# encoding: utf-8
class NewzConfiguration < Configuration
  
  preference :aktiv, :boolean, :default => true
  
  
  preference :news_per_page, :integer, :default => 7
  
  
  preference :always_crop_pix, :boolean, :default => true
  
  
  preference :preview_pic_width, :integer, :default => 317
  preference :preview_pic_height, :integer, :default => 95
  
  
  preference :preview_pic_max_width, :integer, :default => 317
  preference :preview_pic_max_height, :integer, :default => 205
  
  
  preference :news_pic_width, :integer, :default => 725
  preference :news_pic_height, :integer, :default => 218
  
  preference :news_pic_max_width, :integer, :default => 725
  preference :news_pic_max_height, :integer, :default => 330

end
