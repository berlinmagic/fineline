# encoding: utf-8
class SeitenSidebar < ActiveRecord::Base
  
  belongs_to :sidebar
  belongs_to :seite

  default_scope   :order => "position ASC"

end