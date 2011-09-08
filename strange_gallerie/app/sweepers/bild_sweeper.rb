class BildSweeper < ActionController::Caching::Sweeper
  observe Bild

  
  # If our sweeper detects that a Product was created call this
  def after_create(record)
    expire_cache_for(record)
  end
  
  # If our sweeper detects that a Product was updated call this
  def after_update(record)
    expire_cache_for(record)
  end
  
  # If our sweeper detects that a Product was deleted call this
  def after_destroy(record)
    expire_cache_for(record)
  end
  
  private
  def expire_cache_for(record)
    
      # Expire the index page now that we added a new record
      expire_page(:controller => 'admin/bilder', :action => 'index')
      
      # Expire Actions
      expire_action :controller => 'admin/bilder', :action => "index"
      expire_action :controller => 'admin/bilder', :action => "show", :id => record.id
      
      expire_page("#{ Bild.all.first.gallerie_slug.gsub(/^\//, '') }")

      expire_fragment( "#{ root_url.to_s.gsub(/http:\/\//, '') }#{ Bild.all.first.gallerie_slug.gsub(/^\//, '') }?part=inhalt" )
      
      expire_fragment( %r{"#{ root_url.to_s.gsub(/http:\/\//, '') }#{ Bild.all.first.gallerie_slug.gsub(/^\//, '') }/xxl/page/*\?part=inhalt*.*"} )
      expire_fragment( %r{"#{ root_url.to_s.gsub(/http:\/\//, '') }#{ Bild.all.first.gallerie_slug.gsub(/^\//, '') }/page/*\?part=inhalt*.*"} )

  end
  
end