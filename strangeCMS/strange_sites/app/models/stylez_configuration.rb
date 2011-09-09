# encoding: utf-8
class StylezConfiguration < Configuration
  
  BORDER_STYLEZ = %w[none solid inset outset]
  ICON_COLOR = %w[hell dunkel]
  ICON_SIZE = %w[18 24 32 48]
  BUTTON_BG_STYLEZ = %w[farbe verlauf]
  BUTTON_STYLEZ = %w[eckig gerunded rund]
  FONTS_ALTS = ["serif", "sans-serif", "cursive", "fantasy", "monospace"]
  FONTZ = {
      'Trebuchet' => '"Trebuchet MS", Arial, sans-serif',
      'Arial' => 'Arial, Helvetica, sans-serif',
      'Times' => '"Times New Roman", Times, serif',
      'Courier' => '"Courier New", Courier, monospace',
      'Georgia' => 'Georgia, "Times New Roman", Times, serif',
      'Verdana' => 'Verdana, Arial, Helvetica, sans-serif'
    }
  FONTZ_TYPES = [
      'Trebuchet',
      'Arial',
      'Times',
      'Courier',
      'Georgia',
      'Verdana',
      'Google_one',
      'Google_two',
      'Google_three'
    ]
  
  ### F O N T Z :
  preference :front_body_font_family, :string, :default => FONTZ_TYPES[0]
  
  
  preference :google_font_one, :string, :default => 'Tangerine:700,400'
  preference :google_font_two, :string, :default => 'Julee'
  preference :google_font_three, :string, :default => 'Montez'
  
  preference :google_font_default_one, :string, :default => 'cursive'
  preference :google_font_default_two, :string, :default => 'cursive'
  preference :google_font_default_three, :string, :default => 'cursive'
  
  
  
  
  
  
  # => Buttons
  
  preference :button_border_radius, :integer, :default => 3
  preference :button_border_color, :string, :default => '#cccccc'
  preference :button_border_width, :integer, :default => 1
  preference :button_border_style, :string, :default => BORDER_STYLEZ[1]

  
  
  # => front H1-Icon
  preference :front_headline_icon_size, :integer, :default => ICON_SIZE[1]
  preference :front_headline_icon_color, :string, :default => ICON_COLOR[1]
  preference :front_headline_icon_blur, :integer, :default => 50
  preference :front_headline_color, :string, :default => 666666
  
  
  
  # => front Button
  preference :front_finelineButton_icon_size, :integer, :default => ICON_SIZE[1]
  preference :front_finelineButton_icon_color, :string, :default => ICON_COLOR[1]
  preference :front_finelineButton_icon_blur, :integer, :default => 50
  
  preference :front_finelineButton_style, :string, :default => BUTTON_STYLEZ[1]
  
  preference :front_finelineButton_bg_style, :string, :default => BUTTON_BG_STYLEZ[0]
  preference :front_finelineButton_bg_color1, :string, :default => 336699
  preference :front_finelineButton_bg_color2, :string, :default => 336699
  
  preference :front_finelineButton_bg_style_hover, :string, :default => BUTTON_BG_STYLEZ[0]
  preference :front_finelineButton_bg_color1_hover, :string, :default => 336699
  preference :front_finelineButton_bg_color2_hover, :string, :default => 336699
  
  preference :front_finelineButton_bg_style_active, :string, :default => BUTTON_BG_STYLEZ[0]
  preference :front_finelineButton_bg_color1_active, :string, :default => 336699
  preference :front_finelineButton_bg_color2_active, :string, :default => 336699
  
  
  
  
  # ==================================================  ADMIN ===================================================================== #
  # => admin H1-Icon
  preference :admin_headline_icon_size, :integer, :default => ICON_SIZE[1]
  preference :admin_headline_icon_color, :string, :default => ICON_COLOR[1]
  preference :admin_headline_icon_blur, :integer, :default => 50
  preference :admin_headline_color, :string, :default => 666666
  
  # => admin Button
  preference :admin_finelineButton_icon_size, :integer, :default => ICON_SIZE[1]
  preference :admin_finelineButton_icon_color, :string, :default => ICON_COLOR[1]
  preference :admin_finelineButton_icon_blur, :integer, :default => 50

  preference :admin_finelineButton_style, :string, :default => BUTTON_STYLEZ[1]

  preference :admin_finelineButton_bg_style, :string, :default => BUTTON_BG_STYLEZ[0]
  preference :admin_finelineButton_bg_color1, :string, :default => 336699
  preference :admin_finelineButton_bg_color2, :string, :default => 336699

  preference :admin_finelineButton_bg_style_hover, :string, :default => BUTTON_BG_STYLEZ[0]
  preference :admin_finelineButton_bg_color1_hover, :string, :default => 336699
  preference :admin_finelineButton_bg_color2_hover, :string, :default => 336699

  preference :admin_finelineButton_bg_style_active, :string, :default => BUTTON_BG_STYLEZ[0]
  preference :admin_finelineButton_bg_color1_active, :string, :default => 336699
  preference :admin_finelineButton_bg_color2_active, :string, :default => 336699

end
