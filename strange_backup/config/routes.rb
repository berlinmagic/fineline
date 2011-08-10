Rails.application.routes.draw do
  
  namespace :admin do
    
    match 'kill_all_backups' => 'backups#kill_all'
    
    resources :backups
    resources :seiten do
      resources :backups
    end
  end
  
  resources :seiten do
    resources :backups
  end
  resources :backups do
    member do
      post 'wiederherstellen'
      get 'wiederherstellen'
    end
  end
  
end
