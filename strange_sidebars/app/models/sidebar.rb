# encoding: utf-8
class Sidebar < ActiveRecord::Base
  
  
  has_many :seiten_sidebars, :class_name => "seiten_sidebar"
  has_many :seiten, :through => :seiten_sidebars
  
  has_many :seiten_sidebars, :class_name => "seiten_sidebar"
  has_many :no_seiten, :class_name => "seite", :through => :seiten_sidebars

  default_scope   :order => "position ASC"

end