# encoding: utf-8
class SaeitenWithoutSidebar < ActiveRecord::Base
  
  belongs_to :sidebar
  belongs_to :seite

end