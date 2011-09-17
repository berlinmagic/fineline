# encoding: utf-8
module StrangeSitesHelp
  module InstanceMethods
    
    def strange_m_keywords
      if @meta_keywords
        @meta_keywords
      else
        Strangecms::Config[:m_keywords]
      end
    end

    def strange_m_description
      if @meta_description
        @meta_description
      else
        Strangecms::Config[:m_description]
      end
    end
    
    def fine_num_pagez( objects, per_page )
      page_count = objects.count / per_page
      page_count = page_count + 1 if ( page_count * per_page ) < objects.count
      page_count
    end
    
    def fine_num_number( count, per_page )
      page_count = count / per_page
      page_count = page_count + 1 if ( page_count * per_page ) < count
      page_count
    end
    
    # => rescue_from ActionController::RoutingError, :with => :route_not_found
    # => rescue_from ActionController::MethodNotAllowed, :with => :invalid_method
    # => rescue_from AbstractController::ActionNotFound, :with => :abstract_method
    # => rescue_from ActiveRecord::RecordNotFound, :with => :not_found
    
    private
    
      def route_not_found
        render :text => 'What the fuck are you looking for ?', :status => :not_found
      end

      def invalid_method
        message = "Now, did your mom tell you to #{request.request_method.to_s.upcase} that ?"
        render :text => message, :status => :method_not_allowed
      end

      def abstract_method
        message = "Now, did your mom tell you to #{request.request_method.to_s.upcase} that ?"
        redirect_to( root_url, :notice => message ) 
      end

      def not_found
        message = I18n.t("ERROR__not_found")
        redirect_to( root_url, :alert => message ) 
      end
    
  end

  def self.included(receiver)
    #receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
    receiver.send :helper, 'base'
    receiver.send :helper, 'strange_site'
    receiver.send :helper, 'strange_site_link'
    receiver.send :helper_method, 'strange_m_keywords'
    receiver.send :helper_method, 'strange_m_description'
    receiver.send :helper_method, 'fine_num_pagez'
    receiver.send :helper_method, 'fine_num_number'
  end
  
end