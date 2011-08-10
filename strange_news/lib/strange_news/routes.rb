# encoding: utf-8
module StrangeNews
  module Routes
    def strange_newz
      
      if Seite.table_exists?
        
        if Seite.where('system_name = ?', 'news_site').count > 0
        
          resources :news, :path => Seite.where('system_name = ?', 'news_site').first.link do
            collection do
              get 'page/:page', :action => :index
              
              get 'by_tag/:tag', :action => :show_news_by_tag
              get 'by_tag/:tag/page/:page', :action => :show_news_by_tag
              
              get 'by_kategorie/:kategorie', :action => :show_news_by_kategorie
              get 'by_kategorie/:kategorie/page/:page', :action => :show_news_by_kategorie
              
              get 'by_date/:year/page/:page', :action => :show_news_by_date
              get 'by_date/:year(/:month)/page/:page', :action => :show_news_by_date
              get 'by_date/:year(/:month(/:day))/page/:page', :action => :show_news_by_date
              get 'by_date/:year(/:month(/:day))', :action => :show_news_by_date
            end
          end
        
        end
      
      end
      
    end
  end
end
module ActionDispatch::Routing
  class Mapper #:nodoc:
    include StrangeNews::Routes
  end
end

