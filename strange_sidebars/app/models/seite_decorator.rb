# encoding: utf-8
Seite.class_eval do

  has_many :seiten_sidebars, :class_name => "seiten_sidebar"
  has_many :sidebars, :through => :seiten_sidebars
  
  has_many :seiten_sidebars, :class_name => "seiten_sidebar"
  has_many :no_sidebars, :class_name => "sidebar", :through => :seiten_sidebars

end