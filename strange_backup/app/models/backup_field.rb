# encoding: utf-8
class BackupField < ActiveRecord::Base
  
  belongs_to :backup
  belongs_to :backup_part
  
  default_scope :order => "created_at DESC"
  
end
