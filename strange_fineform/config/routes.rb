Rails.application.routes.draw do
  
  match 'site_pic_fineform' => 'fineforms#pic_fineform'
  
  resources :finemails
  
  namespace :admin do
    
    match 'reorder_werte' => 'wertelisten#reorder_werte'
    match 'reorder_fineformfields' => 'fineforms#reorder_fields'
    match 'reorder_fineformsetfields' => 'fineforms#reorder_set_fields'
    match 'reorder_fineformfieldsets' => 'fineforms#reorder_fieldsets'
    
    match 'fineform_settings' => 'fineform_settings#index'
    match 'fineform_settings_edit' => 'fineform_settings#edit'
    match 'fineform_settings_update' => 'fineform_settings#update'
    
    resources :fineforms do
      member do
        post :new_field
        post :new_fieldset_field
      end
      resources :fineform_fields do
        member do
          delete :remove
        end
      end
      resources :fineform_fieldsets do
        member do
          delete :remove
        end
      end
      
    end
    
    resources :fineform_fields
    
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
    
    resources :finemails
  end
  
  resources :finemails do
    collection do
      put :create_form_part
      post :create_form_part
      put :update
      post :update
    end
  end
  
end
