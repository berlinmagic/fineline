Rails.application.routes.draw do
  
  # => your routes
  namespace :admin do
    # => your Admin-routes
    namespace :settings do
      # => your Settings-routes
    end
  end
  namespace :system do
    # => your system-routes
  end
  
end
