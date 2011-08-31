Rails.application.routes.draw do

  resources :seiten
  match '/sitemap' => 'base#sitemap'
  
  # elFinder Routes
  match 'strange_finder' => 'base#strange_finder'
  match 'elfinder' => 'base#elfinder'
  
  # Linkz für FCK-Editor
  match "/system/link_collection" => 'base#link_collection'
  match "/system/linkz" => 'base#linkz'
  match '/system/safe_text' => 'base#safe_text'
  match 'fckeditor/check_spelling' => 'fckeditor#check_spelling'
  match 'fckeditor/command' => 'fckeditor#command'
  match 'fckeditor/upload' => 'fckeditor#upload'
  
  # STD - Seiten
  match '/kontakt' => 'base#show_seite',  :system_name => "kontakt"
  match '/impressum' => 'base#show_seite',  :system_name => "impressum"

  namespace :admin do

    resources :seiten do
      member do
        post 'restore'
        get 'restore'
        post 'kill'
        get 'kill'
      end
    end
    match 'site_pic_K_form' => 'seiten#pic_K_form'
    match 'text_edit' => 'base#edit_text'
    match 'text_update' => 'base#update_text'
    
    match 'module' => 'base#module'
    
    root :to => "base#dashboard"
    scope "/system" do
      match '/seiten_sorting' => "seiten#sortable_sites"
    end
  end
  
  scope "/system" do
    match '/finestyle.:format' => "base#finestyle", :to_style => 'seite'
    match '/admin_finestyle.:format' => "base#finestyle", :to_style => 'admin'
    match '/editor_finestyle.:format' => "base#finestyle", :to_style => 'fck'
    
    match '/finescript.:format' => "base#finescript", :to_script => 'seite'
    match '/admin_finescript.:format' => "base#finescript", :to_script => 'admin'
    
    match '/expire_finestyles' => "base#expire_finestyles"
    match '/expire_finescripts' => "base#expire_finescripts"
    
    match '/grid_test' => "base#grid_test"
    match 'nestesd_seiten_reorder' => 'admin/seiten#reorder_nested_stuff'
  end
  
  match 'reorder_seiten' => 'admin/seiten#reorder'
  match 'reorder_abschnitte' => 'admin/seiten#abschnitt_reorder'
  
  # => root :to => "base#start"
  root :to => 'base#show_seite',  :system_name => "start"
  
  match '/:slug' => 'base#show_seite'
  
  match '/:slug1(/:slug2(/:slug3(/:slug4)))' => 'base#show_seite', :constraints => StrangeSitesRouterPass.new
  
  # => match '/:slug1(/:slug2(/:slug3(/:slug4(/:slug5(/:slug6(/:slug7))))))' => 'base#show_seite', :constraints => StrangeSitesRouterPass.new
  
end
