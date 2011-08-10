Rails.application.routes.draw do
  
  namespace :admin do
    
    match 'change_header' => 'headers#change_header'
    resources :headers do
      resources :header_pics do
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
    resources :header_pics
    
  end
  
end
