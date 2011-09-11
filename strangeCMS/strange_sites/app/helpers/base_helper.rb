# encoding: utf-8
module BaseHelper
  
  def yeah_baby_yeah
    'Unsere IconSets:'
  end
  
  def render_cell_with_javascript(cell, action, options = nil, &block)
    content_for :front_js do
      'render_cell(cell, "#{action}_javascript", options, &block)'
    end
    render_cell cell, action, options, &block
  end
  
  
  def finelineIcon(options = {})
    options.assert_valid_keys(  :icon,  :blur,  :color,   :size,  :aktion )
    options.reverse_merge! :icon    => 1        unless options.key? :icon       # => 1 - 90  /  1 - 25
    options.reverse_merge! :blur    => 1.0      unless options.key? :blur       # => 0.01 - 1.0  /  01 - 100
    options.reverse_merge! :color   => 'dunkel' unless options.key? :color      # => 'dunkel'  /  'hell'
    options.reverse_merge! :size    => 18       unless options.key? :size       # => 18 / 24 / 32* / 48*
    options.reverse_merge! :aktion  => false    unless options.key? :aktion     # => 'std'  /  'aktion'  =>  normal / groß
    opt_pix = [18, 24, 32, 48]
    akt_pix = [32, 48]
    size = opt_pix.include?(options[:size].to_i) ? options[:size].to_i : 18
    aktion = ( options[:aktion] && options[:icon].to_i <= 25 && options[:icon].to_i >= 1 && akt_pix.include?(size) ) ? true : false
    icon = options[:icon] <= 90 && options[:icon].to_i >= 1 ? options[:icon].to_i : 1
    size2 = aktion ? ( size + size / 4 ) : size
    color = %w(dunkel hell).include?(options[:color]) ? options[:color] : 'dunkel'
    top = size * (icon - 1)
    opac = 1.0
    if options[:blur]
      if options[:blur].to_f > 1
        opac = opac * "0.#{options[:blur].to_f}".to_f
      else
        opac = opac * "#{options[:blur].to_f}".to_f
      end
    end
    raw( "<div class='finelineIcon #{ color }' style='background: transparent url(/images/fineline/iconsets/stripe_#{size}x#{size2}.png)         -#{ color == 'dunkel' ? size2 : 0 }px -#{top}px no-repeat; width: #{size2}px; height: #{size}px; opacity: #{ opac.to_s };'></div>" )
  end
  
  
  def finelineButton(options = {})
    options.assert_valid_keys(  :icon,  :blur,  :color,   :size,  :aktion, :tooltip, :title, :url, :class )
    options.reverse_merge! :url     => nil    unless options.key? :url
    options.reverse_merge! :title   => nil    unless options.key? :title
    options.reverse_merge! :tooltip => nil   unless options.key? :tooltip
    options.reverse_merge! :class   => nil    unless options.key? :class
    options.reverse_merge! :icon    => 1      unless options.key? :icon
    options.reverse_merge! :blur    => 1.0    unless options.key? :blur
    options.reverse_merge! :color   => nil    unless options.key? :class
    options.reverse_merge! :size    => 18     unless options.key? :size
    options.reverse_merge! :aktion  => nil    unless options.key? :aktion
    opt_pix = [18, 24, 32, 48]
    url = options[:url]
    size = opt_pix.include?(options[:size]) ? options[:size] : 18
    raw( 
        "<#{ url ? 'a href="' + url + '"' : 'div' } class='flb#{size} finelineButton#{' '+options[:class] if options[:class]}#{' tooltiped' if options[:tooltip] }'#{ ' title="'+ options[:tooltip] +'"' if options[:tooltip] }>#{ 
                finelineIcon(     :icon => options[:icon], 
                                  :blur => options[:blur], 
                                  :color => options[:color], 
                                  :size => options[:size], 
                                  :aktion => options[:aktion]   ) 
            }</#{ url ? 'a' : 'div' }>" 
        )
    
  end
  
  def finelineDelete(helpa, options = {})
    options.assert_valid_keys(:icon,  :blur,  :color,   :size,  :aktion, :url, :caption, :title, :dataType, :success, :stuff, :link_text, :class, :tooltip)
    options.reverse_merge! :url => "#{helpa.class.to_s.pluralize.downcase}/#{helpa.id}" unless options.key? :url
    options.reverse_merge! :link_text => nil unless options.key? :link_text
    options.reverse_merge! :caption => t('are_you_sure')
    options.reverse_merge! :class => '' unless options.key? :class
    options.reverse_merge! :tooltip => t("Destroy") unless options.key? :tooltip
    options.reverse_merge! :title => t('confirm_delete')
    options.reverse_merge! :dataType => 'script'
    options.reverse_merge! :icon    => 1      unless options.key? :icon
    options.reverse_merge! :blur    => 1.0    unless options.key? :blur
    options.reverse_merge! :color   => nil    unless options.key? :class
    options.reverse_merge! :size    => 18     unless options.key? :size
    options.reverse_merge! :aktion  => nil    unless options.key? :aktion
    opt_pix = [18, 24, 32, 48]
    size = opt_pix.include?(options[:size]) ? options[:size] : 18
    options.reverse_merge! :success => "function(r){ jQuery('##{dom_id helpa}').fadeOut('hide'); }"
    link_to_function raw( "<div class='flb#{size} finelineButton#{' '+options[:class] if options[:class]}#{' tooltiped' if options[:tooltip] }'#{ ' title="'+ options[:title] +'"' if options[:title] }>#{ 
                finelineIcon(     :icon => options[:icon], 
                                  :blur => options[:blur], 
                                  :color => options[:color], 
                                  :size => options[:size], 
                                  :aktion => options[:aktion]   ) 
            }</div>" 
        ), "jConfirm('#{options[:caption]}', '#{options[:title]}', function(r) {
      if(r){
        jQuery.ajax({
          type: 'POST',
          url: '#{options[:url]}',
          data: ({_method: 'delete', authenticity_token: AUTH_TOKEN}),
          dataType:'#{options[:dataType]}',
          success: #{options[:success]}
        });
      }
    });", :title => options[:tooltip], :class => 'tooltiped'
  end
  
  def fine_handle(options = {})
    options.assert_valid_keys(  :icon,  :blur,  :color,   :size,  :aktion )
    options.reverse_merge! :icon    => 77        unless options.key? :icon       # => 1 - 90  /  1 - 25
    options.reverse_merge! :blur    => 1.0      unless options.key? :blur       # => 0.01 - 1.0  /  01 - 100
    options.reverse_merge! :color   => 'dunkel' unless options.key? :color      # => 'dunkel'  /  'hell'
    options.reverse_merge! :size    => 32       unless options.key? :size       # => 18 / 24 / 32* / 48*
    options.reverse_merge! :aktion  => false    unless options.key? :aktion     # => 'std'  /  'aktion'  =>  normal / groß
    raw("<span class='fine_handle' style='background-position: #{ options[:color] == 'hell' ? '0 0' : '16px 0'};'></span>")
  end
  
  def help_link_box
    raw("
        <div class='side_box'>
        	<div class='info_sidebar_head'>
        		Hilfe
        	</div>
        	<ul class='sidebar'>
        		<li>#{ link_to raw("#{ t('help_text_link') } <span class='link_help_show#{' hidden' if Strangecms::Config[:show_help] }'>#{t('help_text_link_show')}</span> <span class='link_help_show#{' hidden' unless Strangecms::Config[:show_help] }'>#{t('help_text_link_hide')}</span>"), '#', :class => 'show_system_help' }</li>
        	</ul>
        </div>
    ")
  end
  
end
