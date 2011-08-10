# encoding: utf-8
module StrangeThemesHelp
  module InstanceMethods
    
    def set_theme_for_app
      if Strangecms::Config[:theme] && Strangecms::Config[:theme] != ''
         theme Strangecms::Config[:theme]
       else
         theme 'default'
       end
    end
    
    
  end
  
  def self.included(receiver)
    #receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
    receiver.send :before_filter, 'set_theme_for_app'
    receiver.send :helper_method, 'set_theme_for_app'
  end

end