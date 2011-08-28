# encoding: utf-8
ApplicationController.class_eval do

  include StrangeSitesHelp
  
  # => caches_action :render_page_if_exists
  
  # => before_filter :check_site_status
  
  # => before_filter :render_page_if_exists
  
  # => rescue_from ActionController::RoutingError, :with => :render_page_if_exists
  
  #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #
  # Checks if page is not beeing overriden by static one that starts with /
  # Using request.path allows us to override dynamic pages including
  # the home page, product and taxon pages.
  def render_page_if_exists
    # If we don't know if page exists we assume it's and we query DB.
    # But we realy don't want to query DB on each page we're sure doesn't exist!
    return if Rails.cache.fetch('page_not_exist/'+request.path)
    if @seite = Seite.find_by_slug(request.path)
        title = @seite.titel
        page_helper_methods
        if Strangecms::Config[:invite_only_site]
          redirect_to '/users/sign_in' unless current_user || request.path == '/users/sign_in'
        else
          render :template => 'base/seite'
        end
        
    else
      Rails.cache.write('page_not_exist/'+request.path, true)
      render :text => 'What the fuck are you looking for ?', :status => :not_found
      return(nil)
    end
  end
  
  def route_not_foundet
    # If we don't know if page exists we assume it's and we query DB.
    # But we realy don't want to query DB on each page we're sure doesn't exist!

    if @seite = Seite.find_by_slug(request.path)
        @title = @seite.titel
        render :template => 'base/seite'
    else
      render :text => 'What the fuck are you looking for ?', :status => :not_found
    end
  end
  
  def check_site_status
    if Strangecms::Config[:invite_only_site]
      redirect_to '/users/sign_in' unless current_user || request.path == '/users/sign_in'
      return
    end
  end
  
  def page_helper_methods
  
  end
  
  def title=(title)
    @title = title
  end
  
  def title
    title_string = @title.blank? ? fineline_accurate_title : @title
    if title_string.blank?
      default_title
    else
      if Strangecms::Config[:always_put_site_name_in_title]
        if Strangecms::Config[:put_site_name_bevore_title]
          "#{fineline_default_title}#{fineline_title_seperator}#{title_string}"
        else
          "#{title_string}#{fineline_title_seperator}#{fineline_default_title}"
        end
      else
        title_string
      end
    end
  end
  
  protected
  
    def fineline_default_title
      Strangecms::Config[:site_name]
    end
  
    def fineline_accurate_title
      return nil
    end
    
    def fineline_title_seperator
      Strangecms::Config[:title_seperator]
    end

end
