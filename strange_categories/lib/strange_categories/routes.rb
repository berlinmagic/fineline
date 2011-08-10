module StrangeCategories
  module Routes
    def strange_tag_admin_routes
      resources :tags do
        member do
          post    :select_data_tags
          get     :select_data_tags
          delete  :remove_data_tag
        end
        collection do
          post    :available_data_tags
          get     :available_data_tags
          post    :new_data_tag
        end
      end
    end
    
    def strange_tag_routes
      resources :tags do
        member do
          post    :select_data_tags
          get     :select_data_tags
          delete  :remove_data_tag
        end
        collection do
          post    :available_data_tags
          get     :available_data_tags
          post    :new_data_tag
        end
      end
    end
    
    def strange_kategorie_admin_routes
      resources :kategorien do
        member do
          post    :select_kategorie
          get     :select_kategorie
          delete  :remove_kategorie
        end
        collection do
          post    :available_kategorien
          get     :available_kategorien
          get     :available_kats
          post    :new_kategorie
        end
      end
    end
    
  end
end
module ActionDispatch::Routing
  class Mapper #:nodoc:
    include StrangeCategories::Routes
  end
end

