class HeaderSweeper < ActionController::Caching::Sweeper
  observe Header, HeaderHpic

  
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
    if record.class.to_s == 'HeaderHpic'
      # Expire Actions
      expire_action :controller => 'admin/headers', :action => "show", :id => record.header.id
      # Expire a fragment
      expire_fragment(:controller => 'admin/headers', :action => 'show', :id => record.header.id, :part => "hhpic_#{record.id}")
      # Expire Cells
      # => expire_cell_state :header, :fader, :id => record.header.id
      # => expire_cell_state :header, :fader_js, :id => record.header.id
      expire_cell_state(HeaderCell, :fader, record.header.id)
      expire_cell_state(HeaderCell, :fader_js, record.header.id)
    else
      # Expire the index page now that we added a new record
      expire_page(:controller => 'admin/headers', :action => 'index')
      
      # Expire Actions
      expire_action :controller => 'admin/headers', :action => "index"
      expire_action :controller => 'admin/headers', :action => "show", :id => record.id
      
      # Expire Cells
      expire_cell_state(HeaderCell, :fader, record.id)
      expire_cell_state(HeaderCell, :fader_js, record.id)
    end
  end
  
end