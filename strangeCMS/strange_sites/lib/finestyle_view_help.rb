# encoding: utf-8
module FinestyleHelp
  module InstanceMethods
    
    def finestyler(stuff)
      if request.fullpath.start_with?('/admin/')
        Strangecms::Stylez::Config["admin_#{stuff}"]
      else
        Strangecms::Stylez::Config["admin_#{stuff}"]
      end
    end
    
  end ### =>  End of InstanceMethods

  def self.included(receiver)
    #receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
    receiver.send :helper_method, 'fine_borderRadius'
    receiver.send :helper_method, 'fine3_borderRadius'
    receiver.send :helper_method, 'fineBorderRadius'
    receiver.send :helper_method, 'fine_backgroundGradient'
    receiver.send :helper_method, 'fine_Gradient'
    receiver.send :helper_method, 'fine_boxShadow'
    receiver.send :helper_method, 'fine_textShadow'
    receiver.send :helper_method, 'fine_css_minify'
    receiver.send :helper_method, 'fine_js_minify'
  end
  
end