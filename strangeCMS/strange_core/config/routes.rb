Rails.application.routes.draw do
  namespace :admin do
    resources :settings do 
      collection do
        get  :info
      end
    end
    
    match 'reorder_stuff' => 'base#reorder_stuff'
  end
  
  match 'system/locale/set' => 'locale#set'
  
end
