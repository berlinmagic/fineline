# encoding: utf-8
Admin::BaseController.class_eval do
  
  include StrangeUserHelper
  
  before_filter :authorized_admin
  
end
