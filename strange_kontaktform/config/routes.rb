Rails.application.routes.draw do

  resources :kontakt_formulare, :only => [:new, :create]
  
  namespace :admin do
    resources :kontakt_formulare do
      member do
        get 'antwort'
      end
    end
    match 'posteingang' => 'kontakt_formulare#post_eingang'
    match 'posteingang_neu' => 'kontakt_formulare#neue_mails'
    match 'postausgang' => 'kontakt_formulare#post_ausgang'
    match 'site_pic_K_form' => 'seiten#pic_K_form'
    
    match 'emails' => 'kontakt_formulare#emails'
    
    match 'kontakt_settings' => 'kontaktform_settings#index'
    match 'kontakt_settings_edit' => 'kontaktform_settings#edit'
    match 'kontakt_settings_update' => 'kontaktform_settings#update'
  end
  
end
