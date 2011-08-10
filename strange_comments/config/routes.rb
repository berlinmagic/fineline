Rails.application.routes.draw do
  
  namespace :admin do
    resources :kommentare
    
    match 'settings/kommentare' => 'kommentar_settings#index'
    match 'settings/kommentare/edit' => 'kommentar_settings#edit'
    match 'settings/kommentare/update' => 'kommentar_settings#update'
  end
  
  resources :kommentare
  
end
