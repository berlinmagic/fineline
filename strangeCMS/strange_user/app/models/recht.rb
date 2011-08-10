# encoding: utf-8
class Recht < ActiveRecord::Base
  
  attr_accessible :show, :new, :edit_own, :edit_crew, :edit_all, :del_own, :del_crew, :del_all, :modify, :gruppe_id, :rechte_modul_id
  #attr_protected :evil_master, :strange_id
  
  belongs_to  :gruppe
  belongs_to  :rechte_modul
  
  belongs_to  :user
  
end