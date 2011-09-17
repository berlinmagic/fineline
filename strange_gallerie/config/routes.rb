Rails.application.routes.draw do
  
  match 'site_pic_bg_form' => 'gallerien#pic_bg_form'
  
  match '/system/gallerie/lightbox/:id' => 'gallerien#show_pic'
  
  strange_gallerie
  
  namespace :admin do
    
      namespace :settings do
        resources :gallerien do
          collection do
            get :edit
            put :update
            post :new_pref_pic
            post :update_pref_pic
          end
        end
      end
      
        resources :gallerien do
            collection do
              get :ueberblick
            end
            resources :bild_kategorien do
              member do
                get :select
                post :select
                delete :remove
              end
              collection do
                post :available
                #get  :selected
                get :available
              end
            end
            resources :bilder do
              member do
                get :select
                delete :remove
              end
              collection do
                post :available
                #get  :selected
                get :available
              end
            end
        end
        
        resources :bild_kategorien do
          resources :bilder do
            member do
              get :select
              delete :remove
            end
            collection do
              post :available
              #get  :selected
              get :available
            end
          end
        end
        
        resources :bilder do
          #resources :tags do
          #  member do
          #    get :select_bild_tags
          #    #delete :remove
          #  end
          #  collection do
          #    post :available_bild_tags
          #    #get  :selected
          #    get :available_bild_tags
          #  end
          #end
          
          strange_tag_admin_routes
          strange_kategorie_admin_routes
          
          member do
            get :zuschneiden
            post :new_tag
          end
        end
    
        #resources :tags do
        #  resources :bilder do
        #    collection do
        #      post :selected
        #      get  :selected
        #    end
        #    member do
        #      delete :remove
        #    end
        #  end
        #end
    
        match 'gallerie_settings' => 'gallerie_settings#index'
        match 'gallerie_settings_edit' => 'gallerie_settings#edit'
        match 'gallerie_settings_update' => 'gallerie_settings#update'
  end
  
end
