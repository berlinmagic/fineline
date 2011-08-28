class SeiteSweeper < ActionController::Caching::Sweeper
  
  observe Seite
  
  # If we create a new article, the public list of articles must be regenerated
  def after_create(seite)
    expire_seite_page
  end
  
  # If we update an existing article, the cached version of that article is stale
  def after_update(seite)
    expire_seite_show(seite.link)
  end
  
  # Deleting a page means we update the public list and blow away the cached article
  def after_destroy(seite)
    expire_public_page
    expire_article_page(seite.link)
  end
  
  
  private
    
    def expire_public_page
      #expire_page(:controller => "content", :action => 'public_content')
    end
    
    def expire_article_page(seite_link)
      expire_action(:controller => "base", :action => "show_seite", :id => seite_link)
    end

end