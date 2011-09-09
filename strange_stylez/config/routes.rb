# encoding: utf-8
Rails.application.routes.draw do
  
  namespace :admin do
    
    resources :fine_styles do
      
      collection do
        match '/init/:init' => 'fine_styles#initiate'
        post :initiate
      end
    end
    
    scope "/settings" do
      resources :stylez_settings, :path => 'stylez-modul' do 
        collection do
          get :edit
          put :update
        end
      end
    end # settings - scope
    
  end # admin - namespace
  
end
