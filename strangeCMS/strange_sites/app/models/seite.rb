# encoding: utf-8
class Seite < ActiveRecord::Base
  
  
  def initialize(*args)
    super(*args)
    last_page = Seite.last
    self.position = last_page ? last_page.position + 1 : 0
  end
  
  # => def to_param
  # =>   "#{std_slug}"
  # => end
  
  #****************************************************************************************************************************************************
  # =>                     S C O P E S
  #****************************************************************************************************************************************************
  scope :header,        :conditions => {:in_header => true}, :order => 'position'
  scope :main,          :conditions => {:elternseite_id => nil}, :order => 'position'
  scope :footer,        :conditions => ["in_footer = ?", true], :order => 'position'
  scope :nav,           :conditions => ["in_main_nav = ?", true], :order => 'position'
  scope :entwurf,       :conditions => {:entwurf => true, :deleted => false}
  scope :aktiv,         :conditions => {:entwurf => false, :deleted => false}
  scope :fineline,      :conditions => {:system_seite => true}
  scope :deleted,       :conditions => {:deleted => true}
  scope :sitemap,       where("system_seite = ? OR entwurf = ? AND deleted = ?", true, false, false)
  scope :systemsite,    lambda { |name| where("system_name = ? AND deleted = ?", name, false) }
  
  default_scope :order => "position ASC"
  
  
  #****************************************************************************************************************************************************
  # =>                     A S S O Z I A T I O N S
  #****************************************************************************************************************************************************
  has_many      :abschnitte,      :dependent => :destroy
  accepts_nested_attributes_for   :abschnitte,              :allow_destroy => true
  
  has_many      :unter_seiten,    :class_name => 'Seite',   :foreign_key => :elternseite_id
  belongs_to    :ueber_seite,     :class_name => 'Seite',   :foreign_key => :elternseite_id
  belongs_to    :hauptseite,      :class_name => 'Seite',   :foreign_key => :hauptseite_id
  
  belongs_to    :gruppe
  belongs_to    :autor,           :class_name => 'User',    :foreign_key => :autor_id
  belongs_to    :last_autor,      :class_name => 'User',    :foreign_key => :last_autor_id
  
  # => accepts_nested_attributes_for :texte, :allow_destroy => true
  # => has_many :texte, :through => :abschnitte
  # => has_many :protokolle
  
  acts_as_list
  
  
  #****************************************************************************************************************************************************
  # =>                    F E L D E R
  #****************************************************************************************************************************************************
  attr_accessible     :name,              :use_titel,           :titel,             :use_headline,            :headline,          :no_headline,
                      :meta_description,  :meta_keywords,       :weiterleitung,     :externer_link,           :typ, 
                      :status,            :stil,                :in_header,         :in_main_nav,             :in_footer, 
                      :protected_stuff,   :gruppe_id,           :verteiler,         :deleted,                 :entwurf, 
                      :breadcrumps,       :elternseite_id,      :system_name,       :slug,                    :system_seite
  
  attr_protected      :full_slug,         :std_slug,            :autor_id,                :position,          
                      :tiefe,             :last_autor_id,       :hauptseite_id
  
  attr_accessor       :this_autor,        :version_id,          :yml_form
  
  
  #****************************************************************************************************************************************************
  # =>                     V A L I D A T I O N S
  #****************************************************************************************************************************************************
  validates_presence_of       :name
  validates_uniqueness_of     :name, :full_slug, :slug, :std_slug, :case_sensitive => false
  validates_exclusion_of      :name,    :in => %w( admin sitemap seiten users login logout system ), 
                                        :message => I18n.t("Keine_standard_Seitennamen_verwenden")
  
  validates_presence_of       :titel, :headline, :unless => "name.nil?"
  validates_uniqueness_of     :titel, :headline, :case_sensitive => false
  
  validates_associated        :abschnitte
  
  
  #****************************************************************************************************************************************************
  # =>                      F I L T E R
  #****************************************************************************************************************************************************
  before_validation   :felder_fuellen, :make_position
  
  # => before_save         :make_position, :update_slug_fields
  
  # => after_create        :relaunch_slug_listener
  after_save          :update_slug_fields
  
  before_destroy      :change_child_sites_if_exists
  
  
  
  #****************************************************************************************************************************************************
  # =>                      F U N K T I O N E N
  #****************************************************************************************************************************************************
  def link
    # => slug_link(self.name)
    if self.weiterleitung && self.externer_link && !self.externer_link.blank?
      self.externer_link
    elsif self.verteiler
      '#'
    else
      if self.ueber_seite
        full_slug.to_slash
      else
        slug.to_slash
      end
    end
  end

  private       # =>  P R I V A T E   -   F U N K T I O N E N       *       *       *       *       *       *       *       *
  
    def make_position
      unless new_record?
        return unless prev_position = Seite.find(self.id).position
        unless self.position.nil?
          if prev_position > self.position
            Seite.update_all("position = position + 1", ["? <= position AND position < ?", self.position, prev_position])
          elsif prev_position < self.position
            Seite.update_all("position = position - 1", ["? < position AND position <= ?", prev_position,  self.position])
          end
        end
      end
    end
  
    def felder_fuellen
      self.name         =   self.name.strip
      self.titel        =   self.name.titleize          unless  self.use_titel
      self.headline     =   self.name.titleize          unless  self.use_headline
      
      self.slug         =   self.name.to_url unless  self.system_seite && self.system_name && self.system_name == 'start'
      self.std_slug     =   self.name.to_url
      
      check_for_parent_site
      
      check_for_autor
      
      # => self.system_name  =   to_underscored(self.name)   unless  self.system_seite && self.system_name && !self.system_name.blank?
      
      StrangeSitesRouterPass.new if self.elternseite_id
    end
  
  
    
    
    def check_for_parent_site
        if self.ueber_seite
            self.full_slug      =   "#{ self.ueber_seite.full_slug }#{ self.std_slug }"
            self.tiefe          =   self.ueber_seite.tiefe + 1
            self.hauptseite_id  =   !self.ueber_seite.hauptseite_id.blank? ? self.ueber_seite.hauptseite_id : self.ueber_seite.id
        else
            self.full_slug      =   self.std_slug
            self.tiefe          =   0
            self.hauptseite_id  =   nil
        end
    end
    
    def check_for_autor
        if new_record?
            self.autor_id       =   self.this_autor     if    self.this_autor && !self.this_autor.blank?
            self.last_autor_id  =   self.this_autor     if    self.this_autor && !self.this_autor.blank?
        else
            self.last_autor_id  =   self.this_autor     if    self.this_autor && !self.this_autor.blank?
        end
        true
    end
    
    def change_child_sites_if_exists
        if self.unter_seiten.count > 0
            self.unter_seiten.each do |site|
                site.elternseite_id   =   self.ueber_seite ? self.ueber_seite.id : nil
                site.full_slug        =   self.ueber_seite ? "#{ self.ueber_seite.full_slug }#{ site.std_slug }" : site.std_slug
                site.tiefe            =   self.ueber_seite ? self.ueber_seite.tiefe + 1 : 0
                site.hauptseite_id    =   self.ueber_seite ? self.ueber_seite.hauptseite_id : nil
                if site.unter_seiten.count > 0
                    site.unter_seiten.each do |u_site|
                        u_site.full_slug        =   "#{ site.std_slug }#{ u_site.std_slug }"
                        u_site.tiefe            =   site.tiefe + 1
                        u_site.hauptseite_id    =   self.ueber_seite ? self.ueber_seite.hauptseite_id : site.id
                        if u_site.unter_seiten.count > 0
                            u_site.unter_seiten.each do |uu_site|
                                uu_site.full_slug        =   "#{ site.std_slug }#{ u_site.std_slug }#{ uu_site.std_slug }"
                                uu_site.tiefe            =   u_site.tiefe + 1
                                uu_site.hauptseite_id    =   self.ueber_seite ? self.ueber_seite.hauptseite_id : site.id
                            end
                        end
                    end
                end
            end
        end
        true
    end
    
    def update_slug_fields
        if self.ueber_seite
            self.full_slug        =   "#{ self.ueber_seite.full_slug }#{ self.std_slug }"
            self.tiefe            =   self.ueber_seite.tiefe + 1
            self.hauptseite_id    =   !self.ueber_seite.hauptseite_id.blank? ? self.ueber_seite.hauptseite_id : self.ueber_seite.id
        else
            self.hauptseite_id    =   nil
        end
        if self.unter_seiten.count > 0
            self.unter_seiten.each do |site|
                site.full_slug        =   "#{ self.full_slug }#{ site.std_slug }"
                site.tiefe            =   self.tiefe + 1
                site.hauptseite_id    =   self.ueber_seite ? self.ueber_seite.hauptseite_id : self.id
                if site.unter_seiten.count > 0
                    site.unter_seiten.each do |u_site|
                        u_site.full_slug        =   "#{ site.std_slug }#{ u_site.std_slug }"
                        u_site.tiefe            =   site.tiefe + 1
                        u_site.hauptseite_id    =   site.hauptseite_id
                        if u_site.unter_seiten.count > 0
                            u_site.unter_seiten.each do |uu_site|
                                uu_site.full_slug        =   "#{ site.std_slug }#{ u_site.std_slug }#{ uu_site.std_slug }"
                                uu_site.tiefe            =   u_site.tiefe + 1
                                uu_site.hauptseite_id    =   site.hauptseite_id
                            end
                        end
                    end
                end
            end
        end
        relaunch_slug_listener
        true
    end
  
    
    
    def relaunch_slug_listener
        StrangeSitesRouterPass.new
        StrangeNewsRouterPass.new
        FileUtils.touch "#{Rails.root}/tmp/restart.txt"
    end
    
  
end
