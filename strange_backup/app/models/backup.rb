# encoding: utf-8
class Backup < ActiveRecord::Base
  
  has_many :backups_safed_abschnitte
  has_many :safed_abschnitte, :through => :backups_safed_abschnitte
  belongs_to :seite
  
  
  SEITE_BACKUP_FIELDS   =   []
  SEITE_BACKUP_FIELDS   <<  'name'          # => if config_param
  SEITE_BACKUP_FIELDS   <<  'no_headline'          # => if config_param
  SEITE_BACKUP_FIELDS   <<  'use_headline'          # => if config_param
  SEITE_BACKUP_FIELDS   <<  'meta_description'          # => if config_param
  SEITE_BACKUP_FIELDS   <<  'meta_keywords'          # => if config_param
  SEITE_BACKUP_FIELDS   <<  'weiterleitung'          # => if config_param
  SEITE_BACKUP_FIELDS   <<  'externer_link'          # => if config_param
  SEITE_BACKUP_FIELDS   <<  'typ'          # => if config_param
  SEITE_BACKUP_FIELDS   <<  'status'          # => if config_param
  SEITE_BACKUP_FIELDS   <<  'stil'          # => if config_param
  SEITE_BACKUP_FIELDS   <<  'template'          # => if config_param
  SEITE_BACKUP_FIELDS   <<  'in_header'          # => if config_param
  SEITE_BACKUP_FIELDS   <<  'in_main_nav'          # => if config_param
  SEITE_BACKUP_FIELDS   <<  'in_footer'          # => if config_param
  SEITE_BACKUP_FIELDS   <<  'protected'          # => if config_param
  SEITE_BACKUP_FIELDS   <<  'gruppe_id'          # => if config_param
  SEITE_BACKUP_FIELDS   <<  'verteiler'          # => if config_param
  SEITE_BACKUP_FIELDS   <<  'deleted'          # => if config_param
  SEITE_BACKUP_FIELDS   <<  'entwurf'          # => if config_param
  SEITE_BACKUP_FIELDS   <<  'breadcrumps'          # => if config_param
  SEITE_BACKUP_FIELDS   <<  'elternseite_id'          # => if config_param
  
  ABSCHNITT_BACKUP_FIELDS = %w[name inhalt]
  
  
  
  default_scope :order => "created_at DESC"
  
  belongs_to :target, :polymorphic => true
  
  belongs_to :user
  
  has_many :backup_parts, :dependent => :destroy
  
  has_many :backup_fields, :dependent => :destroy
  
end
