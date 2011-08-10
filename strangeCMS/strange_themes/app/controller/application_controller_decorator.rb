# encoding: utf-8
ApplicationController.class_eval do

  before_filter :set_theme_for_app
  
  layout proc { |controller| controller.request.xhr? ? false : 'fineline' }
  
  def page_helper_methods
    set_theme_for_app
  end
  
  private
  
  def set_theme_for_app
    if Strangecms::Config[:theme] && Strangecms::Config[:theme] != ''
       theme Strangecms::Config[:theme]
     else
       theme 'default'
     end
  end

end
