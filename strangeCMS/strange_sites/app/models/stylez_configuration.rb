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
  

end
