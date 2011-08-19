# encoding: utf-8
class HeaderSeite < ActiveRecord::Base
  
  belongs_to :header
  belongs_to :seite

  default_scope   :order => "created_at DESC"

end
