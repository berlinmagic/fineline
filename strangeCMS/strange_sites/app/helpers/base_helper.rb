# encoding: utf-8
module BaseHelper
  
  def yeah_baby_yeah
    'Unsere IconSets:'
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
    size = opt_pix.include?(options[:size]) ? options[:size] : 18
    aktion = ( options[:aktion] && options[:icon] <= 25 && options[:icon] >= 1 && akt_pix.include?(size) ) ? true : false
    icon = options[:icon] <= 90 && options[:icon] >= 1 ? options[:icon] : 1
    size2 = aktion ? ( size + size / 4 ) : size
    color = %w(dunkel hell).include?(options[:color]) ? options[:color] : 'dunkel'
    top = size * (icon - 1)
    opac = 1.0
    if options[:blur]
      if options[:blur] > 1
        opac = opac * "0.#{options[:blur]}".to_f
      else
        opac = opac * "#{options[:blur]}".to_f
      end
    end
    raw( "<div class='#{ color }' style='background: transparent url(/images/fineline/iconsets/stripe_#{size}x#{size2}.png) 
        -#{ color == 'dunkel' ? size2 : 0 }px -#{top}px no-repeat; width: #{size2}px; height: #{size}px; display:block; opacity: #{ opac.to_s };'></div>" )
  end
  
  
  def finelineButton(options = {})
    options.assert_valid_keys(  :icon,  :blur,  :color,   :size,  :aktion, :tooltip, :title, :url, :class )
    options.reverse_merge! :url     => nil    unless options.key? :url
    options.reverse_merge! :title   => nil    unless options.key? :title
    options.reverse_merge! :tooltip => true   unless options.key? :tooltip
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
        "<#{ url ? 'a href="' + url + '"' : 'div' } class='flb#{size} finelineButton#{' '+options[:class] if options[:class]}'>#{ 
                finelineIcon(     :icon => options[:icon], 
                                  :blur => options[:blur], 
                                  :color => options[:color], 
                                  :size => options[:size], 
                                  :aktion => options[:aktion]   ) 
            }</#{ url ? 'a' : 'div' }>" 
        )
    
  end
  
end
