Rails.application.routes.draw do
  namespace :admin do
    resources :settings
    
    match 'reorder_stuff' => 'base#reorder_stuff'
  end
  
  match 'system/locale/set' => 'locale#set'
  
end
