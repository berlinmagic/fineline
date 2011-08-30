Rails.application.routes.draw do
  
  namespace :admin do
    
    match 'change_header' => 'headers#change_header'
    match 'add_header_site' => 'headers#add_site'
    resources :headers do
      resources :hpics do
        member do
          get :crop
          get :blowup
          put :cropit
          get :select
          delete :remove
        end
        collection do
          post :available
          get  :selected
          get :available
        end
      end
    end
    
    resources :header_hpics do
      resources :hpics do
        member do
          get :blowup
          get :crop
          put :cropit
          delete :remove
        end
      end
    end
        
    resources :hpics
    
    resources :seiten do
      resources :headers do
        member do
          post :remove_site
          get :remove_site
          delete :remove_site
        end
      end
    end
          
    
  end
  
end
