# encoding: utf-8
module StrangeSiteHelper
  
  def admin_title
    base_title = "#{Strangecms::Config[:site_name]} - Admin-Area"
    @title.nil? ? base_title : "#{base_title} | #{@title}"
  end
  
  # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => #
  
  def abschnitt_admin_toolz(this, options = {})
    options.assert_valid_keys(:edit, :safe, :delete, :protect)
    options.reverse_merge! :edit    =>    nil   unless    options.key? :edit
    options.reverse_merge! :safe    =>    nil   unless    options.key? :safe
    options.reverse_merge! :delete  =>    nil   unless    options.key? :delete
    options.reverse_merge! :protect =>    nil   unless    options.key? :protect
    abschnitt_text = "<div class='deleted_abschnitt'><strong>X</strong> Gelöscht!</div>
		<div class='abschnitt_admin_toolz'>"
    if options[:safe]
        if site_master
        
            abschnitt_text += this.hidden_field( :system_stuff, :value => this.object.system_stuff, :class => 'system_abschnitt' )
                
            abschnitt_text += finelineButton(		:icon => 36, 
                                                :blur => 50, 
                                                :color => 'hell', 
                                                :size => 18, 
                                                :class => "system admin_system_stuff_link#{' hidden' if this.object.system_stuff}", 
                                                :url => '#', 
                                                :tooltip => t("strange_sites.links.protect_abschnitt")  )
            abschnitt_text += finelineButton(		:icon => 37, 
                                                :blur => 50, 
                                                :color => 'hell', 
                                                :size => 18, 
                                                :class => "system admin_system_stuff_unlink#{' hidden' unless this.object.system_stuff}", 
                                                :url => '#', 
                                                :tooltip => t("strange_sites.links.unprotect_abschnitt")  )
        end
    end
    if this.object.system_stuff
        if site_master
            if options[:edit]
                abschnitt_text += finelineButton(		:icon => 30, 
            								                        :blur => 50, 
            								                        :color => 'hell', 
            								                        :size => 18, 
            								                        :class => "system Pagez__toggle_remote_link", 
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
                                              :blur => 50, 
                                              :color => 'hell', 
                                              :size => 18, 
                                              :class => "system Pagez__toggle_remote_link", 
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