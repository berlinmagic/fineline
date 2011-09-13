# encoding: utf-8
module StrangeSiteHelper
  
  def admin_title
    base_title = "#{Strangecms::Config[:site_name]} - Admin-Area"
    @title.nil? ? base_title : "#{base_title} | #{@title}"
  end
  
  # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => #
  
  
  def paginator_wrapper( objects, options = {} )
      options.assert_valid_keys(:on, :mini, :midi, :maxi, :object_type, :params)
      options.reverse_merge! :params    =>    {}   unless    options.key? :params
      options.reverse_merge! :object_type =>  'AR' unless    options.key? :object_type
      options.reverse_merge! :maxi =>         ''   unless      options.key? :maxi
      options.reverse_merge! :midi =>         ''   unless      options.key? :midi
      options.reverse_merge! :mini =>         ''   unless      options.key? :mini
      options.reverse_merge! :on =>           '' unless      options.key? :on
      view_change = ( !options[:mini].blank? || !options[:midi].blank? || !options[:maxi].blank? ) ? true : false
      stuff = '<div class="paginator_wrapper">'
      if view_change
        stuff += '<div class="viewChangeButtons">'
        if !options[:mini].blank?
          stuff += finelineButton(:icon => 80, 
	                                :blur => Strangecms::Stylez::Config[:front_PaginationViewButton_icon_blur], 
                  								:color => Strangecms::Stylez::Config[:front_PaginationViewButton_icon_color], 
                  								:size => Strangecms::Stylez::Config[:front_PaginationViewButton_icon_size], 
                  								:class => "#{'aktiv ' if options[:on] == 'mini' }pagination_view #{ Strangecms::Stylez::Config[:front_PaginationViewButton_style] }", 
                  								:url => options[:mini] )
        end
        if !options[:midi].blank?
          stuff += finelineButton(:icon => 79, 
	                                :blur => Strangecms::Stylez::Config[:front_PaginationViewButton_icon_blur], 
                  								:color => Strangecms::Stylez::Config[:front_PaginationViewButton_icon_color], 
                  								:size => Strangecms::Stylez::Config[:front_PaginationViewButton_icon_size], 
                  								:class => "#{'aktiv ' if options[:on] == 'midi' }pagination_view #{ Strangecms::Stylez::Config[:front_PaginationViewButton_style] }", 
                  								:url => options[:midi] )
        end
        if !options[:maxi].blank?
          stuff += finelineButton(:icon => 78, 
	                                :blur => Strangecms::Stylez::Config[:front_PaginationViewButton_icon_blur], 
                  								:color => Strangecms::Stylez::Config[:front_PaginationViewButton_icon_color], 
                  								:size => Strangecms::Stylez::Config[:front_PaginationViewButton_icon_size], 
                  								:class => "#{'aktiv ' if options[:on] == 'maxi' }pagination_view #{ Strangecms::Stylez::Config[:front_PaginationViewButton_style] }", 
                  								:url => options[:maxi] )
        end
        stuff += '<div class="clearfix"></div></div>'
      end
      stuff += paginate( objects, :params => options[:params] )
      stuff += '</div>'
      raw( stuff )
  end
  
  def abschnitt_admin_toolz(this, options = {})
    options.assert_valid_keys(:edit, :safe, :delete, :protect)
    options.reverse_merge! :edit    =>    nil   unless    options.key? :edit
    options.reverse_merge! :safe    =>    nil   unless    options.key? :safe
    options.reverse_merge! :delete  =>    nil   unless    options.key? :delete
    options.reverse_merge! :protect =>    nil   unless    options.key? :protect
    abschnitt_text = "<div class='deleted_abschnitt'><strong>X</strong> Gelöscht!</div>
		<div class='abschnitt_admin_toolz fineline_system_toolz'>"
    if options[:safe]
        if site_master
        
            abschnitt_text += this.hidden_field( :system_stuff, :value => this.object.system_stuff, :class => 'system_abschnitt' )
                
            abschnitt_text += finelineButton(		:icon => 36, 
                                                :blur => Strangecms::Stylez::Config[:front_systemButton_icon_blur], 
                                								:color => Strangecms::Stylez::Config[:front_systemButton_icon_color], 
                                								:size => Strangecms::Stylez::Config[:front_systemButton_icon_size], 
                                                :class => "system admin_system_stuff_link#{' hidden' if this.object.system_stuff} #{ Strangecms::Stylez::Config[:front_systemButton_style] }", 
                                                :url => '#', 
                                                :tooltip => t("strange_sites.links.protect_abschnitt")  )
            abschnitt_text += finelineButton(		:icon => 37, 
                                                :blur => Strangecms::Stylez::Config[:front_systemButton_icon_blur], 
                                								:color => Strangecms::Stylez::Config[:front_systemButton_icon_color], 
                                								:size => Strangecms::Stylez::Config[:front_systemButton_icon_size],
                                                :class => "system admin_system_stuff_unlink#{' hidden' unless this.object.system_stuff} #{ Strangecms::Stylez::Config[:front_systemButton_style] }", 
                                                :url => '#', 
                                                :tooltip => t("strange_sites.links.unprotect_abschnitt")  )
        end
    end
    if this.object.system_stuff
        if site_master
            if options[:edit]
                abschnitt_text += finelineButton(		:icon => 30, 
            								                        :blur => Strangecms::Stylez::Config[:front_systemButton_icon_blur], 
                                    								:color => Strangecms::Stylez::Config[:front_systemButton_icon_color], 
                                    								:size => Strangecms::Stylez::Config[:front_systemButton_icon_size],
            								                        :class => "system Pagez__toggle_remote_link #{ Strangecms::Stylez::Config[:front_systemButton_style] }", 
            								                        :url => '#', 
            								                        :tooltip => t("strange_sites.links.edit_abschnitt")  )
            end
            if options[:delete]
                abschnitt_text += link_to_remove_fields( dom_id(this.object), this )
            end
        end
    else
      if options[:edit]
          abschnitt_text += finelineButton(		:icon => 30, 
                                              :blur => Strangecms::Stylez::Config[:front_systemButton_icon_blur], 
                              								:color => Strangecms::Stylez::Config[:front_systemButton_icon_color], 
                              								:size => Strangecms::Stylez::Config[:front_systemButton_icon_size], 
                                              :class => "system Pagez__toggle_remote_link #{ Strangecms::Stylez::Config[:front_systemButton_style] }", 
                                              :url => '#', 
                                              :tooltip => t("strange_sites.links.edit_abschnitt")  )
      end
      if options[:delete]
          abschnitt_text += link_to_remove_fields( dom_id(this.object), this )
      end
    end
    
    abschnitt_text += "</div>"
    
    raw(abschnitt_text)
    
  end
  
  
  def abschnitt_anker_field(this)
    this_html   =   '<div class="abschnitt_inhalt_anker_feld"><label>Anker-Name</label>'
    this_html   +=  this.text_field :name, 	:class => 'anker_feld tipped tooltiped', 
										:placeholder => 'Namen eingeben und Anker setzten', 
										:title => Seite.human_attribute_name(:name), 
										:size => '33'
		this_html   +=  '</div>'
		raw(this_html)
  end
  
  def seiten_abschnitt_handler
    raw("<span class='handle'>#{ image_tag '/images/fineline/icons_16/position.png' }</span>")
  end
  
  def seiten_abschnitt_mini_handler
    raw("<span class='handle smallhandle'>#{ image_tag '/images/fineline/icons_16/position_s.png' }</span>")
  end
  
    
  
  # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => #
  
  def geschlechter
    %w[Herr Frau]
  end
  
  def nepp
    raw '<img src="/images/no.png" class="nepp" />'
  end
  
  def jepp
    raw '<img src="/images/ok.png" class="jepp" />'
  end
  
  def harken(f, att)
    @abgeharkt = ''
    @abgeharkt = (f.object.errors[att].count > 0 ? nepp : jepp) if f.object.errors.any?
    @abgeharkt
  end
  
end