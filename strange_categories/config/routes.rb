Rails.application.routes.draw do
  
  namespace :admin do
    resources :tags
    
    resources :kategorien
    
    match 'reorder_werte' => 'wertelisten#reorder_werte'
    
    match 'listen' => 'kategorien#base'
    
    resources :wertelisten do
      member do
        post :new_wert
      end
      resources :werte do
        member do
          delete :remove
        end
      end
    end
    resources :werte
    
  end
  
end
