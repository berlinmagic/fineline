# encoding: utf-8
class Kommentar < ActiveRecord::Base
  
  has_many :kommentare, :as => :target, :dependent => :destroy
  belongs_to :target, :polymorphic => true
  
  belongs_to :user
  
  attr_accessor :back_url
  
  default_scope :order => "created_at ASC"
  
  before_validation :felder_fuellen
  
  validates_presence_of :inhalt, :user_name, :user_email, :user_ip
  
  validates_format_of     :user_email,
                          :with       => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,
                          :message    => 'email must be valid'
  
  private

    def felder_fuellen
      if self.user_id
        this_user = User.find(self.user_id)
        self.user_name = this_user.name
        self.user_email = this_user.email
        self.user_vorname = this_user.vorname
      end
    end

  
end
