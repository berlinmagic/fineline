# encoding: utf-8
Rails.application.routes.draw do
  
  namespace :admin do
    # => resources :news
    
    resources :news do
      
      strange_tag_admin_routes
      
      strange_kategorie_admin_routes
      
      member do
        get :zuschneiden
        post :new_tag
      end
    end
    
    
    # => match 'settings/news' => 'news_settings#index'
    # => match 'settings/news/edit' => 'gallerie_settings#edit'
    # => match 'settings/news/update' => 'gallerie_settings#update'
    
    
    scope "/settings" do
      resources :news_settings, :path => 'news-modul' do 
        collection do
          get :edit
          put :update
        end
      end
        
      # => match 'news' => 'news_settings#index'
      # => match 'news/edit' => 'news_settings#edit'
    end
  end
  
  # => scope "/system" do
  # =>   resources :news do
  # =>     get 'page/:page', :action => :index, :on => :collection
  # =>   end
  # => end
  
  strange_newz
  
  # => scope "/:news_path(/:news_slug_1(/:news_slug_2(/:news_slug_3)))", :constraints => StrangeNewsMoreRouterPass.new do
  # =>     get 'page/:page' => 'news#index'
  # => end
  
  # resources :news, :only => [:index, :show]
  
  # => match '/:news_path/:slug' => 'news#show_news', :constraints => StrangeNewsRouterPass.new
  
  match '/:news_path(/:news_slug_1(/:news_slug_2(/:news_slug_3)))/:slug' => 'news#show_news', :constraints => StrangeNewsRouterPass.new
  #match '/:news_path(/:news_slug_1(/:news_slug_2(/:news_slug_3)))/by_date/:year(/:month(/:day))' => 'news#show_news_by_date', :constraints => StrangeNewsMoreRouterPass.new
  #match '/:news_path(/:news_slug_1(/:news_slug_2(/:news_slug_3)))/by_tag/:tag' => 'news#show_news_by_tag', :constraints => StrangeNewsMoreRouterPass.new do
  #    get 'page/:page' => 'news#index'
  #end
  
  # => match '/:news_path(/:news_slug_1(/:news_slug_2(/:news_slug_3)))?/page/:page' => 'news#show_per_page' # => , :constraints => StrangeNewsRouterPass.new
  
end
