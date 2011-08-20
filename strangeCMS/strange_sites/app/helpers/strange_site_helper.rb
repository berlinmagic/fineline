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
    if this.object.system_stuff
        if site_master
            if options[:delete]
                abschnitt_text += "<div class='remove_nested_forms'>#{ link_to_remove_fields dom_id(this.object), this }</div>"
            end
            if options[:edit]
                abschnitt_text += "<div class='edit_nested_form'>#{ link_to fineline_button('bearbeiten'), '#', 
    									:class => "Pagez__toggle_remote_link tolltips_edit", 
    									:title => "Abschnitt bearbeiten" }</div>"
            end
        end
    else
      if options[:delete]
          abschnitt_text += "<div class='remove_nested_forms'>#{ link_to_remove_fields dom_id(this.object), this }</div>"
      end
      if options[:edit]
          abschnitt_text += "<div class='edit_nested_form'>
    					#{ link_to fineline_button('bearbeiten'), '#', 
    								:class => "Pagez__toggle_remote_link tooltip", 
    								:title => "Abschnitt bearbeiten" }</div>"
      end
    end
    if options[:safe]
        if site_master
        
            abschnitt_text += "<div class='edit_admin'>
                #{ this.hidden_field :system_stuff, :value => this.object.system_stuff, :class => 'system_abschnitt' }
                #{ link_to fineline_button('system-close'), '#', 
                      :class => "admin_system_stuff_link tooltip #{'hidden' if this.object.system_stuff}", 
                      :title => "Abschnitt sperren" }
                #{ link_to fineline_button('system-open'), '#', 
                      :class => "admin_system_stuff_unlink tooltip #{'hidden' unless this.object.system_stuff}", 
                      :title => "Abschnitt freigeben" }</div>"
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