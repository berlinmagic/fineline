# encoding: utf-8
Seite.class_eval do

  # => belongs_to :header
  
  has_one :header_seite, :dependent => :destroy
  has_one :header, :through => :header_seite

end