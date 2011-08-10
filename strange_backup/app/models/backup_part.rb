# encoding: utf-8
class BackupPart < ActiveRecord::Base
  
  belongs_to :backup
  
  belongs_to :user
  
  belongs_to :target, :polymorphic => true
  
  has_many :backup_fields, :dependent => :destroy
  
  
  default_scope :order => "created_at DESC"
  
end
