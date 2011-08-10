# encoding: utf-8
class Gruppe < ActiveRecord::Base
  
  attr_accessible :name, :position, :show, :new, :edit_own, :edit_crew, :edit_all, :del_own, :del_crew, :del_all, :modify, :admin
  attr_protected  :system_stuff, :rang
  
  has_many :users
  
  has_many :rechte,           :dependent => :destroy
  has_many :rechte_module,    :through => :rechte
  
end