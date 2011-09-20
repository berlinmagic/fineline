# encoding: utf-8
class ThemeDefaultInitializer
      
      
      class << self
  
  # => BORDER_STYLEZ = %w[none solid inset outset]
  # => STYLE_SIZES = %w[0 1 2 3 4 5 7 10 15 20 30 40 50]
  # => BORDER_WIDTHS = %w[0 1 2 3 4 5 10 15]
  # => ICON_COLOR = %w[hell dunkel]
  # => ICON_SIZE = %w[18 24 32 48]
  # => BUTTON_BG_STYLEZ = %w[farbe verlauf transparent]
  # => BUTTON_STYLEZ = %w[eckig gerunded rund]
  # => FONTS_ALTS = ["serif", "sans-serif", "cursive", "fantasy", "monospace"]
  # => FONT_WEIGHTS = ['normal', 'bold']
  # => FONT_STYLES = ['normal', 'italic']
  # => FONT_SIZES = (8..42).to_a
  # => LINE_HEIGHTS = [18, 20, 22, 24, 26, 28, 30, 40, 42, 50]
  # => FONTZ = { 'Trebuchet' => '"Trebuchet MS", Arial, sans-serif',
  # =>           'Arial' => 'Arial, Helvetica, sans-serif',
  # =>           'Times' => '"Times New Roman", Times, serif',
  # =>           'Courier' => '"Courier New", Courier, monospace',
  # =>           'Georgia' => 'Georgia, "Times New Roman", Times, serif',
  # =>           'Verdana' => 'Verdana, Arial, Helvetica, sans-serif',
  # =>           'ArialBlack' => '"Arial Black", Impact,  Arial, sans-serif',
  # =>           'Impact' => 'Impact, "Arial Black", Arial, sans-serif',
  # =>           'ComicSans' => '"Comic Sans MS", fantasy'   }
  # => FONTZ_TYPES = ['Trebuchet','Arial','Times','Courier','Georgia','Verdana','ArialBlack','Impact','ComicSans','Google_one','Google_two','Google_three']
        
        def logger
          RAILS_DEFAULT_LOGGER
        end

        def init
          # Set mail server settings from preferences
          begin
            logger.info "INFO: Loading Default-Theme-Settings"
        
            Strangecms::Stylez::Config.set(
                ### F O N T Z :
                :front_body_font_family => 'Trebuchet',
                :front_body_font_style => 'normal',
                :front_body_font_weight => 'normal',
                :front_body_font_size => 13,
                :front_body_font_color => 333333,
                :front_body_line_height => 20,
                :front_body_text_shadow => 'none',

                :front_pre_font_family => 'Trebuchet',
                :front_pre_font_style => 'normal',
                :front_pre_font_weight => 'normal',
                :front_pre_font_size => 13,
                :front_pre_font_color => 444444,
                :front_pre_line_height => 20,
                :front_pre_text_shadow => 'none',

                :front_p_font_family => 'Trebuchet',
                :front_p_font_style => 'normal',
                :front_p_font_weight => 'normal',
                :front_p_font_size => 13,
                :front_p_font_color => 333333,
                :front_p_line_height => 20,
                :front_p_text_shadow => 'none',

                :front_h1_font_family => 'Trebuchet',
                :front_h1_font_style => 'normal',
                :front_h1_font_weight => 'bold',
                :front_h1_font_size => 24,
                :front_h1_font_color => 336699,
                :front_h1_line_height => 30,
                :front_h1_text_shadow => '1px 1px 1px #ccc',

                :front_h2_font_family => 'Trebuchet',
                :front_h2_font_style => 'normal',
                :front_h2_font_weight => 'normal',
                :front_h2_font_size => 24,
                :front_h2_font_color => 336699,
                :front_h2_line_height => 30,
                :front_h2_text_shadow => 'none',

                :front_h3_font_family => 'Trebuchet',
                :front_h3_font_style => 'normal',
                :front_h3_font_weight => 'bold',
                :front_h3_font_size => 18,
                :front_h3_font_color => 336699,
                :front_h3_line_height => 26,
                :front_h3_text_shadow => '1px 1px 1px #fff',

                :front_h4_font_family => 'Trebuchet',
                :front_h4_font_style => 'italic',
                :front_h4_font_weight => 'normal',
                :front_h4_font_size => 18,
                :front_h4_font_color => 444444,
                :front_h4_line_height => 26,
                :front_h4_text_shadow => '1px 1px 1px #fff',

                :front_h5_font_family => 'Georgia',
                :front_h5_font_style => 'italic',
                :front_h5_font_weight => 'normal',
                :front_h5_font_size => 20,
                :front_h5_font_color => 336699,
                :front_h5_line_height => 26,
                :front_h5_text_shadow => '1px 1px 1px #fff',

                :front_h6_font_family => 'Georgia',
                :front_h6_font_style => 'italic',
                :front_h6_font_weight => 'normal',
                :front_h6_font_size => 20,
                :front_h6_font_color => 444444,
                :front_h6_line_height => 26,
                :front_h6_text_shadow => 'none',

                # => front H1-Icon
                :front_headline_icon_size => 32,
                :front_headline_icon_color => 'dunkel',
                :front_headline_icon_blur => 50,
                :front_headline_font_color => 336699,
                :front_headline_font_style => 'normal',
                :front_headline_font_weight => 'normal',
                :front_headline_font_size => 24,
                :front_headline_font_family => 'Trebuchet',
                :front_headline_text_shadow => 'none',

                # => Google Webfonts
                :google_font_one => 'Changa+One',
                :google_font_two => 'Nothing+You+Could+Do',
                :google_font_three => 'Fanwood+Text',
                :google_font_default_one => 'serif',
                :google_font_default_two => 'cursive',
                :google_font_default_three => 'serif',


        # => Buttons
          # => System - edit - crop - delete
                :front_systemButton_border_radius => 1,
                :front_systemButton_border_color => 'cccccc',
                :front_systemButton_border_width => 1,
                :front_systemButton_border_style => 'none',
                :front_systemButton_icon_size => 18,
                :front_systemButton_icon_color => 'hell',
                :front_systemButton_icon_blur => 70,
                :front_systemButton_style => 'eckig',
                :front_systemButton_bg_style => 'farbe',
                :front_systemButton_bg_color1 => '969696',
                :front_systemButton_bg_color2 => '969696',
                :front_systemButton_box_shadow => 'inset 1px 1px 1px 0px rgba(255,255,255,.4)',

                :front_systemButton_bg_style_hover => 'farbe',
                :front_systemButton_bg_color1_hover => 336699,
                :front_systemButton_bg_color2_hover => 336699,
                :front_systemButton_border_color_hover => 'cccccc',
                :front_systemButton_border_style_hover => 'none',
                :front_systemButton_box_shadow_hover => 'inset 1px 1px 1px 0px rgba(255,255,255,.4)',

                :front_systemButton_bg_style_active => 'farbe',
                :front_systemButton_bg_color1_active => '1e466d',
                :front_systemButton_bg_color2_active => '1e466d',
                :front_systemButton_border_color_active => 'cccccc',
                :front_systemButton_border_style_active => 'none',
                :front_systemButton_box_shadow_active => 'inset 1px 1px 1px 0px rgba(255,255,255,.4)',

            # => LightBox_Nav
                :front_lightboxNav_border_radius => 3,
                :front_lightboxNav_border_color => 'ffffff',
                :front_lightboxNav_border_width => 4,
                :front_lightboxNav_border_style => 'solid',
                :front_lightboxNav_icon_size => 32,
                :front_lightboxNav_icon_color => 'hell',
                :front_lightboxNav_icon_blur => 75,
                :front_lightboxNav_style => 'rund',
                :front_lightboxNav_bg_style => 'farbe',
                :front_lightboxNav_bg_color1 => 969696,
                :front_lightboxNav_bg_color2 => 969696,
                :front_lightboxNav_box_shadow => 'inset 1px 1px 1px 0px rgba(255,255,255,.4)',

                :front_lightboxNav_bg_style_hover => 'farbe',
                :front_lightboxNav_bg_color1_hover => 336699,
                :front_lightboxNav_bg_color2_hover => 336699,
                :front_lightboxNav_border_color_hover => 'ffffff',
                :front_lightboxNav_border_style_hover => 'solid',
                :front_lightboxNav_box_shadow_hover => 'inset 1px 1px 1px 0px rgba(255,255,255,.4)',

                :front_lightboxNav_bg_style_active => 'farbe',
                :front_lightboxNav_bg_color1_active => '1e466d',
                :front_lightboxNav_bg_color2_active => '1e466d',
                :front_lightboxNav_border_color_active => 'ffffff',
                :front_lightboxNav_border_style_active => 'solid',
                :front_lightboxNav_box_shadow_active => 'inset 1px 1px 1px 0px rgba(255,255,255,.4)',


            # =>  Pagination - Box:
                :front_finePagination_border_radius => 5,
                :front_finePagination_border_color => 'e5e5e5',
                :front_finePagination_border_width => 1,
                :front_finePagination_border_style => 'solid',
                :front_finePagination_padding_top => '5',
                :front_finePagination_padding_right => '10',
                :front_finePagination_padding_bottom => '5',
                :front_finePagination_padding_left => '10',
                :front_finePagination_opacity => 85,
                :front_finePagination_style => 'gerunded',
                :front_finePagination_bg_style => 'transparent',
                :front_finePagination_bg_color1 => 'efefef',
                :front_finePagination_bg_color2 => 'efefef',
                :front_finePagination_box_shadow => 'none',
              # => Hover
                :front_finePagination_opacity_hover => 100,
                :front_finePagination_border_color_hover => 'cccccc',
                :front_finePagination_bg_style_hover => 'verlauf',
                :front_finePagination_bg_color1_hover => 'efefef',
                :front_finePagination_bg_color2_hover => 'e5e5e5',
                :front_finePagination_box_shadow_hover => 'inset 1px 1px 1px 0px rgba(255,255,255,.4)',
              # => Active
                :front_finePagination_opacity_active => 100,
                :front_finePagination_border_color_active => 'cccccc',
                :front_finePagination_bg_style_active => 'transparent',
                :front_finePagination_bg_color1_active => 'efefef',
                :front_finePagination_bg_color2_active => 'e5e5e5',
                :front_finePagination_box_shadow_active => 'inset 1px 1px 1px 0px rgba(255,255,255,.4)',

              # =>  SidebarHead - Box:
                :front_SidebarHead_border_radius => 5,
                :front_SidebarHead_border_color => 'e5e5e5',
                :front_SidebarHead_border_width => 1,
                :front_SidebarHead_border_style => 'solid',
                :front_SidebarHead_padding_top => '5',
                :front_SidebarHead_padding_right => '10',
                :front_SidebarHead_padding_bottom => '5',
                :front_SidebarHead_padding_left => '30',
                :front_SidebarHead_opacity => 85,
                :front_SidebarHead_style => 'gerunded',
                :front_SidebarHead_bg_style => 'transparent',
                :front_SidebarHead_bg_color1 => 'efefef',
                :front_SidebarHead_bg_color2 => 'efefef',
                :front_SidebarHead_box_shadow => 'none',
                :front_SidebarHead_font_family => 'Changa+One',
                :front_SidebarHead_font_style => 'normal',
                :front_SidebarHead_font_weight => 'normal',
                :front_SidebarHead_font_size => 20,
                :front_SidebarHead_font_color => 444444,
                :front_SidebarHead_line_height => 30,
                :front_SidebarHead_text_shadow => '1px 1px 2px #fff, -1px -1px 1px #fff',
              # => Hover
                :front_SidebarHead_opacity_hover => 100,
                :front_SidebarHead_border_color_hover => 'cccccc',
                :front_SidebarHead_bg_style_hover => 'verlauf',
                :front_SidebarHead_bg_color1_hover => 'efefef',
                :front_SidebarHead_bg_color2_hover => 'e5e5e5',
                :front_SidebarHead_box_shadow_hover => 'inset 1px 1px 1px 0px rgba(255,255,255,.8)',
                :front_SidebarHead_font_color_hover => 444444,
                :front_SidebarHead_text_shadow_hover => '1px 1px 2px #fff, -1px -1px 1px #fff',
              # => Active
                :front_SidebarHead_opacity_active => 85,
                :front_SidebarHead_border_color_active => 'cccccc',
                :front_SidebarHead_bg_style_active => 'verlauf',
                :front_SidebarHead_bg_color1_active => '336699',
                :front_SidebarHead_bg_color2_active => '1e466d',
                :front_SidebarHead_box_shadow_active => '1px 1px 3px #cccccc',
                :front_SidebarHead_font_color_active => 444444,
                :front_SidebarHead_text_shadow_active => '1px 1px 1px #134d77',




              # => Pagination - Navigation:
                :front_PaginationNavButton_border_radius => 1,
                :front_PaginationNavButton_border_color => 'cccccc',
                :front_PaginationNavButton_border_width => 1,
                :front_PaginationNavButton_border_style => 'none',
                :front_PaginationNavButton_icon_size => 24,
                :front_PaginationNavButton_icon_color => 'dunkel',
                :front_PaginationNavButton_icon_blur => 80,
                :front_PaginationNavButton_style => 'eckig',
                :front_PaginationNavButton_bg_style => 'transparent',
                :front_PaginationNavButton_bg_color1 => 'efefef',
                :front_PaginationNavButton_bg_color2 => 'e5e5e5',
                :front_PaginationNavButton_box_shadow => 'none',
              # => Hover
                :front_PaginationNavButton_bg_style_hover => 'farbe',
                :front_PaginationNavButton_bg_color1_hover => 'd6d6d6',
                :front_PaginationNavButton_bg_color2_hover => 'd6d6d6',
                :front_PaginationNavButton_border_color_hover => 'cccccc',
                :front_PaginationNavButton_border_style_hover => 'none',
                :front_PaginationNavButton_box_shadow_hover => 'inset 1px 1px 1px 0px rgba(255,255,255,.4)',
              # => Active
                :front_PaginationNavButton_bg_style_active => 'farbe',
                :front_PaginationNavButton_bg_color1_active => 'c9c9c9',
                :front_PaginationNavButton_bg_color2_active => 'c9c9c9',
                :front_PaginationNavButton_border_color_active => 'cccccc',
                :front_PaginationNavButton_border_style_active => 'none',
                :front_PaginationNavButton_box_shadow_active => 'inset 1px 1px 1px 0px rgba(255,255,255,.4)',



              # => Pagination - view_changer:
                :front_PaginationViewButton_border_radius => 1,
                :front_PaginationViewButton_border_color => 'cccccc',
                :front_PaginationViewButton_border_width => 1,
                :front_PaginationViewButton_border_style => 'none',
                :front_PaginationViewButton_icon_size => 24,
                :front_PaginationViewButton_icon_color => 'dunkel',
                :front_PaginationViewButton_icon_blur => 80,
                :front_PaginationViewButton_style => 'eckig',
                :front_PaginationViewButton_bg_style => 'transparent',
                :front_PaginationViewButton_bg_color1 => 'efefef',
                :front_PaginationViewButton_bg_color2 => 'e5e5e5',
                :front_PaginationViewButton_box_shadow => 'none',
              # => Hover
                :front_PaginationViewButton_bg_style_hover => 'farbe',
                :front_PaginationViewButton_bg_color1_hover => 'd6d6d6',
                :front_PaginationViewButton_bg_color2_hover => 'd6d6d6',
                :front_PaginationViewButton_border_color_hover => 'cccccc',
                :front_PaginationViewButton_border_style_hover => 'none',
                :front_PaginationViewButton_box_shadow_hover => 'inset 1px 1px 1px 0px rgba(255,255,255,.4)',
              # => Active
                :front_PaginationViewButton_bg_style_active => 'farbe',
                :front_PaginationViewButton_bg_color1_active => 'c9c9c9',
                :front_PaginationViewButton_bg_color2_active => 'c9c9c9',
                :front_PaginationViewButton_border_color_active => 'cccccc',
                :front_PaginationViewButton_border_style_active => 'none',
                :front_PaginationViewButton_box_shadow_active => 'inset 1px 1px 1px 0px rgba(255,255,255,.4)',


                # => System - edit - crop - delete
                :front__border_radius => 1,
                :front__border_color => 'cccccc',
                :front__border_width => 1,
                :front__border_style => 'none',
                :front__icon_size => 18,
                :front__icon_color => 'hell',
                :front__icon_blur => 70,
                :front__style => 'eckig',
                :front__bg_style => 'farbe',
                :front__bg_color1 => '969696',
                :front__bg_color2 => '969696',
                :front__box_shadow => 'inset 1px 1px 1px 0px rgba(255,255,255,.4)',

                :front__bg_style_hover => 'farbe',
                :front__bg_color1_hover => 336699,
                :front__bg_color2_hover => 336699,
                :front__border_color_hover => 'cccccc',
                :front__border_style_hover => 'none',
                :front__box_shadow_hover => 'inset 1px 1px 1px 0px rgba(255,255,255,.4)',

                :front__bg_style_active => 'farbe',
                :front__bg_color1_active => 336699,
                :front__bg_color2_active => 336699,
                :front__border_color_active => 'cccccc',
                :front__border_style_active => 'none',
                :front__box_shadow_active => 'inset 1px 1px 1px 0px rgba(255,255,255,.4)',








                # ==================================================  ADMIN ===================================================================== #
                # => admin H1-Icon
                :admin_headline_icon_size => 32,
                :admin_headline_icon_color => 'dunkel',
                :admin_headline_icon_blur => 50,
                :admin_headline_text_shadow => 'none',
                :admin_headline_font_color => 336699,
                :admin_headline_font_style => 'normal',
                :admin_headline_font_weight => 'normal',
                :admin_headline_font_size => 24,
                :admin_headline_font_family => 'Trebuchet',



                # => System - edit - crop - delete
                :admin_systemButton_border_radius => 1,
                :admin_systemButton_border_color => 'cccccc',
                :admin_systemButton_border_width => 1,
                :admin_systemButton_border_style => 'none',
                :admin_systemButton_icon_size => 18,
                :admin_systemButton_icon_color => 'hell',
                :admin_systemButton_icon_blur => 70,
                :admin_systemButton_style => 'eckig',
                :admin_systemButton_bg_style => 'farbe',
                :admin_systemButton_bg_color1 => '969696',
                :admin_systemButton_bg_color2 => '969696',
                :admin_systemButton_box_shadow => 'inset 1px 1px 1px 0px rgba(255,255,255,.4)',

                :admin_systemButton_bg_style_hover => 'farbe',
                :admin_systemButton_bg_color1_hover => 336699,
                :admin_systemButton_bg_color2_hover => 336699,
                :admin_systemButton_border_color_hover => 'cccccc',
                :admin_systemButton_border_style_hover => 'none',
                :admin_systemButton_box_shadow_hover => 'inset 1px 1px 1px 0px rgba(255,255,255,.4)',

                :admin_systemButton_bg_style_active => 'farbe',
                :admin_systemButton_bg_color1_active => 336699,
                :admin_systemButton_bg_color2_active => 336699,
                :admin_systemButton_border_color_active => 'cccccc',
                :admin_systemButton_border_style_active => 'none',
                :admin_systemButton_box_shadow_active => 'inset 1px 1px 1px 0px rgba(255,255,255,.4)',



                # => LightBox_Nav
                :admin_lightboxNav_border_radius => 3,
                :admin_lightboxNav_border_color => 'ffffff',
                :admin_lightboxNav_border_width => 4,
                :admin_lightboxNav_border_style => 'solid',
                :admin_lightboxNav_icon_size => 32,
                :admin_lightboxNav_icon_color => 'hell',
                :admin_lightboxNav_icon_blur => 75,
                :admin_lightboxNav_style => 'rund',
                :admin_lightboxNav_bg_style => 'farbe',
                :admin_lightboxNav_bg_color1 => 969696,
                :admin_lightboxNav_bg_color2 => 969696,
                :admin_lightboxNav_box_shadow => 'inset 1px 1px 1px 0px rgba(255,255,255,.4)',

                :admin_lightboxNav_bg_style_hover => 'farbe',
                :admin_lightboxNav_bg_color1_hover => 336699,
                :admin_lightboxNav_bg_color2_hover => 336699,
                :admin_lightboxNav_border_color_hover => 'ffffff',
                :admin_lightboxNav_border_style_hover => 'solid',
                :admin_lightboxNav_box_shadow_hover => 'inset 1px 1px 1px 0px rgba(255,255,255,.4)',

                :admin_lightboxNav_bg_style_active => 'farbe',
                :admin_lightboxNav_bg_color1_active => 336699,
                :admin_lightboxNav_bg_color2_active => 336699,
                :admin_lightboxNav_border_color_active => 'ffffff',
                :admin_lightboxNav_border_style_active => 'solid',
                :admin_lightboxNav_box_shadow_active  => 'inset 1px 1px 1px 0px rgba(255,255,255,.4)'    )

        rescue
          logger.error "========================================================================="
          logger.error "   ! ! ! ERROR: Something went wrong while loading Theme-Data ! ! !"
          logger.error "========================================================================="
        end
    end 
  end
end

