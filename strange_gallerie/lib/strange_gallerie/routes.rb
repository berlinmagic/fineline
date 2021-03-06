# encoding: utf-8
module StrangeGallerie
  module Routes
    def strange_gallerie
      
      if Seite.table_exists?
        
        if Seite.where('system_name = ?', 'gallerie').count > 0
        
          resources :gallerien, :path => Seite.where('system_name = ?', 'gallerie').first.link do
            collection do
              
              
              get 'xxl/page/:page', :action => :xxl_index
              get 'xxl', :action => :xxl_index
              
              get 'page/:page', :action => :index
              
              get 'by_tag/:tag', :action => :show_by_tag
              get 'by_tag/:tag/page/:page', :action => :show_by_tag
              get 'xxl_tag/:tag', :action => :xxl_by_tag
              get 'xxl_tag/:tag/page/:page', :action => :xxl_by_tag
              
              get 'by_kategorie/:kategorie', :action => :show_by_kategorie
              get 'by_kategorie/:kategorie/page/:page', :action => :show_by_kategorie
              get 'xxl_kategorie/:kategorie', :action => :xxl_by_kategorie
              get 'xxl_kategorie/:kategorie/page/:page', :action => :xxl_by_kategorie
              
              get 'by_date/:year/page/:page', :action => :show_by_date
              get 'by_date/:year(/:month)/page/:page', :action => :show_by_date
              get 'by_date/:year(/:month(/:day))/page/:page', :action => :show_by_date
              get 'by_date/:year(/:month(/:day))', :action => :show_by_date
              get 'xxl_date/:year/page/:page', :action => :xxl_by_date
              get 'xxl_date/:year(/:month)/page/:page', :action => :xxl_by_date
              get 'xxl_date/:year(/:month(/:day))/page/:page', :action => :xxl_by_date
              get 'xxl_date/:year(/:month(/:day))', :action => :xxl_by_date
            end
          end
        
        end
      
      end
      
    end
  end
end
module ActionDispatch::Routing
  class Mapper #:nodoc:
    include StrangeGallerie::Routes
  end
end

