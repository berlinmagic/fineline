# encoding: utf-8
class KontaktFormular < ActiveRecord::Base
  
  MAIL_TYPES = ['mail_in', 'mail_out', 'new_mails', 'old_mails']
  
  scope :eingang, :conditions => {:antwort_auf => nil}
  scope :ausgang, :conditions => ["antwort_auf != ?", '']
  scope :neu, :conditions => {:neu => true}
  scope :gelesen, :conditions => {:neu => false}
  
  #   default_scope :order => "created_at DESC"
  
  validates :anrede, :presence => true if Strangecms::Kontakt::Config[:anrede] && Strangecms::Kontakt::Config[:validate_anrede]
  
  validates :titel, :presence => true if Strangecms::Kontakt::Config[:titel] && Strangecms::Kontakt::Config[:validate_titel]
  
  validates :name, :presence => true if Strangecms::Kontakt::Config[:name] && Strangecms::Kontakt::Config[:validate_name]
  
  validates :email, :presence => true, 
                    :length => {:maximum => 254},  # => :length => {:minimum => 3, :maximum => 254}
                    :email => true
                    
  validates :inhalt,  :presence => true, 
                      :length => {:minimum => 3, :maximum => 5000}
  
  validates :user_ip, :presence => true
  
  
end
