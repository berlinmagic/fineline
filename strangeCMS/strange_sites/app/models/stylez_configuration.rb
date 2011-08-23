# encoding: utf-8
class StylezConfiguration < Configuration
  
  BORDER_STYLEZ = %w[none solid inset outset]
  
  # => Buttons
  
  preference :button_border_radius, :integer, :default => 3
  preference :button_border_color, :string, :default => '#cccccc'
  preference :button_border_width, :integer, :default => 1
  preference :button_border_style, :string, :default => BORDER_STYLEZ[1]
  
  
  
  
  preference :seiten_style, :string, :default => 'style'
  preference :admin_style, :string, :default => 'admin'
  
  
  preference :site_width, :integer, :default => 950
  
  preference :full_site_width, :integer, :default => 960
  
  preference :sidebar_width, :integer, :default => 210
  
  preference :content_width, :integer, :default => 710
  

end
