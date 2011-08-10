Rails.application.routes.draw do
  
  namespace :admin do
    resources :users do  # => , :only => [:new, :index, :show]
      member do
        get :bild_upload
        get :crop
        post :pic_up
        put :pic_up
        put :croped
      end
    end
    resources :user_settings
    match 'users' => 'user#index'
    match 'user_settings_update' => 'user_settings#update'
    match 'user_create' => 'user#create'
  end
  
end
