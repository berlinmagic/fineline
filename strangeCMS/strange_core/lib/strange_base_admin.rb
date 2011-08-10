# encoding: utf-8
module StrangeBaseAdmin
  module InstanceMethods
    
    # can be used in views as well as controllers.
    # e.g. <% title = 'This is a custom title for this view' %>
    attr_writer :title

    def title
      title_string = @title.blank? ? accurate_title : @title
      if title_string.blank?
        default_title
      else
        if Strangecms::Config[:always_put_site_name_in_title]
          [default_title, title_string].join(' - ')
        else
          title_string
        end
      end
    end

    protected

    def default_title
      Strangecms::Config[:site_name]
    end

    # this is a hook for subclasses to provide title
    def accurate_title
      nil
    end

    def render_404(exception = nil)
      respond_to do |type|
        type.html { render :status => :not_found, :file    => "#{Rails.root}/public/404.html", :layout => nil}
        type.all  { render :status => :not_found, :nothing => true }
      end
    end

    private

    def redirect_back_or_default(default)
      redirect_to(session["user_return_to"] || default)
      session["user_return_to"] = nil
    end

    def instantiate_controller_and_action_names
      @current_action = action_name
      @current_controller = controller_name
    end

    def set_user_language
      locale = session[:locale] || Strangecms::Config[:default_locale]
      locale = I18n.default_locale unless locale && I18n.available_locales.include?(locale.to_sym)
      I18n.locale = locale.to_sym
    end
  end

  def self.included(receiver)
    #receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
    receiver.send :layout, 'admin'
    receiver.send :helper, 'hook'
    #receiver.send :before_filter, 'instantiate_controller_and_action_names'
    #receiver.send :before_filter, 'set_user_language'
    receiver.send :helper_method, 'title'
    receiver.send :helper_method, 'title='
  end
end