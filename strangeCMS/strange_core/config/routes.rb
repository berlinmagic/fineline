Rails.application.routes.draw do
  namespace :admin do
    resources :settings do 
      collection do
        get  :info
        post :new_pref_pic
        post :update_pref_pic
      end
    end
    
    match 'reorder_stuff' => 'base#reorder_stuff'
  end
  
  match 'system/locale/set' => 'locale#set'
  
end
