# encoding: utf-8
class StylezConfiguration < Configuration
  
  BORDER_STYLEZ = %w[none solid inset outset]
  BORDER_WIDTHS = %w[0 1 2 3 4 5 10 15]
  ICON_COLOR = %w[hell dunkel]
  ICON_SIZE = %w[18 24 32 48]
  BUTTON_BG_STYLEZ = %w[farbe verlauf transparent]
  BUTTON_STYLEZ = %w[eckig gerunded rund]
  FONTS_ALTS = ["serif", "sans-serif", "cursive", "fantasy", "monospace"]
  FONT_WEIGHTS = ['normal', 'bold']
  FONT_STYLES = ['normal', 'italic']
  FONT_SIZES = (8..42).to_a
  LINE_HEIGHTS = [18, 20, 22, 24, 26, 28, 30, 40, 42, 50]
  FONTZ = {
      'Trebuchet' => '"Trebuchet MS", Arial, sans-serif',
      'Arial' => 'Arial, Helvetica, sans-serif',
      'Times' => '"Times New Roman", Times, serif',
      'Courier' => '"Courier New", Courier, monospace',
      'Georgia' => 'Georgia, "Times New Roman", Times, serif',
      'Verdana' => 'Verdana, Arial, Helvetica, sans-serif',
      'ArialBlack' => '"Arial Black", Impact,  Arial, sans-serif',
      'Impact' => 'Impact, "Arial Black", Arial, sans-serif',
      'ComicSans' => '"Comic Sans MS", fantasy'
      
    }
  FONTZ_TYPES = [
      'Trebuchet',
      'Arial',
      'Times',
      'Courier',
      'Georgia',
      'Verdana',
      'ArialBlack',
      'Impact',
      'ComicSans',
      'Google_one',
      'Google_two',
      'Google_three'
    ]
  
  ### F O N T Z :
  preference :front_body_font_family, :string, :default => FONTZ_TYPES[0]
  preference :front_body_font_style, :string, :default => FONT_STYLES[0]
  preference :front_body_font_weight, :string, :default => FONT_WEIGHTS[0]
  preference :front_body_font_size, :string, :default => 13
  preference :front_body_font_color, :string, :default => 444444
  preference :front_body_line_height, :string, :default => 20
  
  preference :front_pre_font_family, :string, :default => FONTZ_TYPES[3]
  preference :front_pre_font_style, :string, :default => FONT_STYLES[0]
  preference :front_pre_font_weight, :string, :default => FONT_WEIGHTS[0]
  preference :front_pre_font_size, :string, :default => 13
  preference :front_pre_font_color, :string, :default => 444444
  preference :front_pre_line_height, :string, :default => 20
  
  preference :front_p_font_family, :string, :default => FONTZ_TYPES[0]
  preference :front_p_font_style, :string, :default => FONT_STYLES[0]
  preference :front_p_font_weight, :string, :default => FONT_WEIGHTS[0]
  preference :front_p_font_size, :string, :default => 13
  preference :front_p_font_color, :string, :default => 444444
  preference :front_p_line_height, :string, :default => 20
  
  preference :front_h1_font_family, :string, :default => FONTZ_TYPES[0]
  preference :front_h1_font_style, :string, :default => FONT_STYLES[1]
  preference :front_h1_font_weight, :string, :default => FONT_WEIGHTS[0]
  preference :front_h1_font_size, :string, :default => 15
  preference :front_h1_font_color, :string, :default => 444444
  preference :front_h1_line_height, :string, :default => 20
  
  preference :front_h2_font_family, :string, :default => FONTZ_TYPES[0]
  preference :front_h2_font_style, :string, :default => FONT_STYLES[1]
  preference :front_h2_font_weight, :string, :default => FONT_WEIGHTS[0]
  preference :front_h2_font_size, :string, :default => 15
  preference :front_h2_font_color, :string, :default => 444444
  preference :front_h2_line_height, :string, :default => 20
  
  preference :front_h3_font_family, :string, :default => FONTZ_TYPES[0]
  preference :front_h3_font_style, :string, :default => FONT_STYLES[0]
  preference :front_h3_font_weight, :string, :default => FONT_WEIGHTS[0]
  preference :front_h3_font_size, :string, :default => 14
  preference :front_h3_font_color, :string, :default => 444444
  preference :front_h3_line_height, :string, :default => 20
  
  preference :front_h4_font_family, :string, :default => FONTZ_TYPES[0]
  preference :front_h4_font_style, :string, :default => FONT_STYLES[0]
  preference :front_h4_font_weight, :string, :default => FONT_WEIGHTS[0]
  preference :front_h4_font_size, :string, :default => 14
  preference :front_h4_font_color, :string, :default => 444444
  preference :front_h4_line_height, :string, :default => 20
  
  preference :front_h5_font_family, :string, :default => FONTZ_TYPES[0]
  preference :front_h5_font_style, :string, :default => FONT_STYLES[0]
  preference :front_h5_font_weight, :string, :default => FONT_WEIGHTS[0]
  preference :front_h5_font_size, :string, :default => 13
  preference :front_h5_font_color, :string, :default => 444444
  preference :front_h5_line_height, :string, :default => 20
  
  preference :front_h6_font_family, :string, :default => FONTZ_TYPES[0]
  preference :front_h6_font_style, :string, :default => FONT_STYLES[0]
  preference :front_h6_font_weight, :string, :default => FONT_WEIGHTS[0]
  preference :front_h6_font_size, :string, :default => 13
  preference :front_h6_font_color, :string, :default => 444444
  preference :front_h6_line_height, :string, :default => 20
  
  # => front H1-Icon
  preference :front_headline_icon_size, :integer, :default => ICON_SIZE[1]
  preference :front_headline_icon_color, :string, :default => ICON_COLOR[1]
  preference :front_headline_icon_blur, :integer, :default => 50
  preference :front_headline_font_color, :string, :default => 666666
  preference :front_headline_font_style, :string, :default => FONT_STYLES[1]
  preference :front_headline_font_weight, :string, :default => FONT_WEIGHTS[0]
  preference :front_headline_font_size, :string, :default => 15
  preference :front_headline_font_family, :string, :default => FONTZ_TYPES[0]
  
  # => Google Webfonts
  preference :google_font_one, :string, :default => 'Tangerine:700,400'
  preference :google_font_two, :string, :default => 'Julee'
  preference :google_font_three, :string, :default => 'Montez'
  preference :google_font_default_one, :string, :default => 'cursive'
  preference :google_font_default_two, :string, :default => 'cursive'
  preference :google_font_default_three, :string, :default => 'cursive'
  
  
  
  
  
  
  # => Buttons
  
  # => System - edit - crop - delete
  preference :front_systemButton_border_radius, :integer, :default => 3
  preference :front_systemButton_border_color, :string, :default => 'cccccc'
  preference :front_systemButton_border_width, :integer, :default => 1
  preference :front_systemButton_border_style, :string, :default => BORDER_STYLEZ[1]
  preference :front_systemButton_icon_size, :integer, :default => ICON_SIZE[1]
  preference :front_systemButton_icon_color, :string, :default => ICON_COLOR[1]
  preference :front_systemButton_icon_blur, :integer, :default => 50
  preference :front_systemButton_style, :string, :default => BUTTON_STYLEZ[1]
  preference :front_systemButton_bg_style, :string, :default => BUTTON_BG_STYLEZ[0]
  preference :front_systemButton_bg_color1, :string, :default => 336699
  preference :front_systemButton_bg_color2, :string, :default => 336699
  preference :front_systemButton_box_shadow, :string, :default => 'inset 1px 1px 1px 0px rgba(255,255,255,.4)'
  
  preference :front_systemButton_bg_style_hover, :string, :default => BUTTON_BG_STYLEZ[0]
  preference :front_systemButton_bg_color1_hover, :string, :default => 336699
  preference :front_systemButton_bg_color2_hover, :string, :default => 336699
  preference :front_systemButton_border_color_hover, :string, :default => 'cccccc'
  preference :front_systemButton_border_style_hover, :string, :default => BORDER_STYLEZ[1]
  preference :front_systemButton_box_shadow_hover, :string, :default => 'inset 1px 1px 1px 0px rgba(255,255,255,.4)'
  
  preference :front_systemButton_bg_style_active, :string, :default => BUTTON_BG_STYLEZ[0]
  preference :front_systemButton_bg_color1_active, :string, :default => 336699
  preference :front_systemButton_bg_color2_active, :string, :default => 336699
  preference :front_systemButton_border_color_active, :string, :default => 'cccccc'
  preference :front_systemButton_border_style_active, :string, :default => BORDER_STYLEZ[1]
  preference :front_systemButton_box_shadow_active, :string, :default => 'inset 1px 1px 1px 0px rgba(255,255,255,.4)'
  
  
  # => LightBox_Nav
  preference :front_lightboxNav_border_radius, :integer, :default => 3
  preference :front_lightboxNav_border_color, :string, :default => 'cccccc'
  preference :front_lightboxNav_border_width, :integer, :default => 1
  preference :front_lightboxNav_border_style, :string, :default => BORDER_STYLEZ[1]
  preference :front_lightboxNav_icon_size, :integer, :default => ICON_SIZE[2]
  preference :front_lightboxNav_icon_color, :string, :default => ICON_COLOR[0]
  preference :front_lightboxNav_icon_blur, :integer, :default => 50
  preference :front_lightboxNav_style, :string, :default => BUTTON_STYLEZ[2]
  preference :front_lightboxNav_bg_style, :string, :default => BUTTON_BG_STYLEZ[0]
  preference :front_lightboxNav_bg_color1, :string, :default => 336699
  preference :front_lightboxNav_bg_color2, :string, :default => 336699
  preference :front_lightboxNav_box_shadow, :string, :default => 'inset 1px 1px 1px 0px rgba(255,255,255,.4)'
  
  preference :front_lightboxNav_bg_style_hover, :string, :default => BUTTON_BG_STYLEZ[0]
  preference :front_lightboxNav_bg_color1_hover, :string, :default => 336699
  preference :front_lightboxNav_bg_color2_hover, :string, :default => 336699
  preference :front_lightboxNav_border_color_hover, :string, :default => 'cccccc'
  preference :front_lightboxNav_border_style_hover, :string, :default => BORDER_STYLEZ[1]
  preference :front_lightboxNav_box_shadow_hover, :string, :default => 'inset 1px 1px 1px 0px rgba(255,255,255,.4)'

  preference :front_lightboxNav_bg_style_active, :string, :default => BUTTON_BG_STYLEZ[0]
  preference :front_lightboxNav_bg_color1_active, :string, :default => 336699
  preference :front_lightboxNav_bg_color2_active, :string, :default => 336699
  preference :front_lightboxNav_border_color_active, :string, :default => 'cccccc'
  preference :front_lightboxNav_border_style_active, :string, :default => BORDER_STYLEZ[1]
  preference :front_lightboxNav_box_shadow_active, :string, :default => 'inset 1px 1px 1px 0px rgba(255,255,255,.4)'
  
  



# =>  Pagination - Box:
  preference :front_finePagination_border_radius, :integer, :default => 3
  preference :front_finePagination_border_color, :string, :default => 'cccccc'
  preference :front_finePagination_border_width, :integer, :default => 1
  preference :front_finePagination_border_style, :string, :default => BORDER_STYLEZ[1]
  preference :front_finePagination_padding_top, :string, :default => '10'
  preference :front_finePagination_padding_right, :string, :default => '20'
  preference :front_finePagination_padding_bottom, :string, :default => '10'
  preference :front_finePagination_padding_left, :string, :default => '20'
  preference :front_finePagination_opacity, :integer, :default => 100
  preference :front_finePagination_style, :string, :default => BUTTON_STYLEZ[1]
  preference :front_finePagination_bg_style, :string, :default => BUTTON_BG_STYLEZ[0]
  preference :front_finePagination_bg_color1, :string, :default => 336699
  preference :front_finePagination_bg_color2, :string, :default => 336699
  preference :front_finePagination_box_shadow, :string, :default => 'inset 1px 1px 1px 0px rgba(255,255,255,.4)'
# => Hover
  preference :front_finePagination_opacity_hover, :integer, :default => 100
  preference :front_finePagination_border_color_hover, :string, :default => 'cccccc'
  preference :front_finePagination_bg_style_hover, :string, :default => BUTTON_BG_STYLEZ[0]
  preference :front_finePagination_bg_color1_hover, :string, :default => 336699
  preference :front_finePagination_bg_color2_hover, :string, :default => 336699
  preference :front_finePagination_box_shadow_hover, :string, :default => 'inset 1px 1px 1px 0px rgba(255,255,255,.4)'
# => Active
  preference :front_finePagination_opacity_active, :integer, :default => 100
  preference :front_finePagination_border_color_active, :string, :default => 'cccccc'
  preference :front_finePagination_bg_style_active, :string, :default => BUTTON_BG_STYLEZ[0]
  preference :front_finePagination_bg_color1_active, :string, :default => 336699
  preference :front_finePagination_bg_color2_active, :string, :default => 336699
  preference :front_finePagination_box_shadow_active, :string, :default => 'inset 1px 1px 1px 0px rgba(255,255,255,.4)'
  
  


# => Pagination - Navigation:
  preference :front_PaginationNavButton_border_radius, :integer, :default => 3
  preference :front_PaginationNavButton_border_color, :string, :default => 'cccccc'
  preference :front_PaginationNavButton_border_width, :integer, :default => 1
  preference :front_PaginationNavButton_border_style, :string, :default => BORDER_STYLEZ[1]
  preference :front_PaginationNavButton_icon_size, :integer, :default => ICON_SIZE[1]
  preference :front_PaginationNavButton_icon_color, :string, :default => ICON_COLOR[1]
  preference :front_PaginationNavButton_icon_blur, :integer, :default => 50
  preference :front_PaginationNavButton_style, :string, :default => BUTTON_STYLEZ[1]
  preference :front_PaginationNavButton_bg_style, :string, :default => BUTTON_BG_STYLEZ[0]
  preference :front_PaginationNavButton_bg_color1, :string, :default => 336699
  preference :front_PaginationNavButton_bg_color2, :string, :default => 336699
  preference :front_PaginationNavButton_box_shadow, :string, :default => 'inset 1px 1px 1px 0px rgba(255,255,255,.4)'
# => Hover
  preference :front_PaginationNavButton_bg_style_hover, :string, :default => BUTTON_BG_STYLEZ[0]
  preference :front_PaginationNavButton_bg_color1_hover, :string, :default => 336699
  preference :front_PaginationNavButton_bg_color2_hover, :string, :default => 336699
  preference :front_PaginationNavButton_border_color_hover, :string, :default => 'cccccc'
  preference :front_PaginationNavButton_border_style_hover, :string, :default => BORDER_STYLEZ[1]
  preference :front_PaginationNavButton_box_shadow_hover, :string, :default => 'inset 1px 1px 1px 0px rgba(255,255,255,.4)'
# => Active
  preference :front_PaginationNavButton_bg_style_active, :string, :default => BUTTON_BG_STYLEZ[0]
  preference :front_PaginationNavButton_bg_color1_active, :string, :default => 336699
  preference :front_PaginationNavButton_bg_color2_active, :string, :default => 336699
  preference :front_PaginationNavButton_border_color_active, :string, :default => 'cccccc'
  preference :front_PaginationNavButton_border_style_active, :string, :default => BORDER_STYLEZ[1]
  preference :front_PaginationNavButton_box_shadow_active, :string, :default => 'inset 1px 1px 1px 0px rgba(255,255,255,.4)'
  
  
  
# => Pagination - view_changer:
  preference :front_PaginationViewButton_border_radius, :integer, :default => 3
  preference :front_PaginationViewButton_border_color, :string, :default => 'cccccc'
  preference :front_PaginationViewButton_border_width, :integer, :default => 1
  preference :front_PaginationViewButton_border_style, :string, :default => BORDER_STYLEZ[1]
  preference :front_PaginationViewButton_icon_size, :integer, :default => ICON_SIZE[1]
  preference :front_PaginationViewButton_icon_color, :string, :default => ICON_COLOR[1]
  preference :front_PaginationViewButton_icon_blur, :integer, :default => 50
  preference :front_PaginationViewButton_style, :string, :default => BUTTON_STYLEZ[1]
  preference :front_PaginationViewButton_bg_style, :string, :default => BUTTON_BG_STYLEZ[0]
  preference :front_PaginationViewButton_bg_color1, :string, :default => 336699
  preference :front_PaginationViewButton_bg_color2, :string, :default => 336699
  preference :front_PaginationViewButton_box_shadow, :string, :default => 'inset 1px 1px 1px 0px rgba(255,255,255,.4)'
# => Hover
  preference :front_PaginationViewButton_bg_style_hover, :string, :default => BUTTON_BG_STYLEZ[0]
  preference :front_PaginationViewButton_bg_color1_hover, :string, :default => 336699
  preference :front_PaginationViewButton_bg_color2_hover, :string, :default => 336699
  preference :front_PaginationViewButton_border_color_hover, :string, :default => 'cccccc'
  preference :front_PaginationViewButton_border_style_hover, :string, :default => BORDER_STYLEZ[1]
  preference :front_PaginationViewButton_box_shadow_hover, :string, :default => 'inset 1px 1px 1px 0px rgba(255,255,255,.4)'
# => Active
  preference :front_PaginationViewButton_bg_style_active, :string, :default => BUTTON_BG_STYLEZ[0]
  preference :front_PaginationViewButton_bg_color1_active, :string, :default => 336699
  preference :front_PaginationViewButton_bg_color2_active, :string, :default => 336699
  preference :front_PaginationViewButton_border_color_active, :string, :default => 'cccccc'
  preference :front_PaginationViewButton_border_style_active, :string, :default => BORDER_STYLEZ[1]
  preference :front_PaginationViewButton_box_shadow_active, :string, :default => 'inset 1px 1px 1px 0px rgba(255,255,255,.4)'
  
  
  
  
  
  
  # => System - edit - crop - delete
  preference :front__border_radius, :integer, :default => 3
  preference :front__border_color, :string, :default => 'cccccc'
  preference :front__border_width, :integer, :default => 1
  preference :front__border_style, :string, :default => BORDER_STYLEZ[1]
  preference :front__icon_size, :integer, :default => ICON_SIZE[1]
  preference :front__icon_color, :string, :default => ICON_COLOR[1]
  preference :front__icon_blur, :integer, :default => 50
  preference :front__style, :string, :default => BUTTON_STYLEZ[1]
  preference :front__bg_style, :string, :default => BUTTON_BG_STYLEZ[0]
  preference :front__bg_color1, :string, :default => 336699
  preference :front__bg_color2, :string, :default => 336699
  preference :front__box_shadow, :string, :default => 'inset 1px 1px 1px 0px rgba(255,255,255,.4)'
  
  preference :front__bg_style_hover, :string, :default => BUTTON_BG_STYLEZ[0]
  preference :front__bg_color1_hover, :string, :default => 336699
  preference :front__bg_color2_hover, :string, :default => 336699
  preference :front__border_color_hover, :string, :default => 'cccccc'
  preference :front__border_style_hover, :string, :default => BORDER_STYLEZ[1]
  preference :front__box_shadow_hover, :string, :default => 'inset 1px 1px 1px 0px rgba(255,255,255,.4)'
  
  preference :front__bg_style_active, :string, :default => BUTTON_BG_STYLEZ[0]
  preference :front__bg_color1_active, :string, :default => 336699
  preference :front__bg_color2_active, :string, :default => 336699
  preference :front__border_color_active, :string, :default => 'cccccc'
  preference :front__border_style_active, :string, :default => BORDER_STYLEZ[1]
  preference :front__box_shadow_active, :string, :default => 'inset 1px 1px 1px 0px rgba(255,255,255,.4)'
  
  
  
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
