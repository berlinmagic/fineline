Rails.application.routes.draw do
  namespace :admin do
    resources :settings
  end
  
  match 'system/locale/set' => 'locale#set'
  
end
