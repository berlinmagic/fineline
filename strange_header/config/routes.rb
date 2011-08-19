Rails.application.routes.draw do
  
  namespace :admin do
    
    match 'change_header' => 'headers#change_header'
    match 'add_header_site' => 'headers#add_site'
    resources :headers do
      resources :hpics do
        member do
          get :crop
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
    resources :hpics
    
  end
  
end
