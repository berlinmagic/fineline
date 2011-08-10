# encoding: utf-8
class News < ActiveRecord::Base
  
  #****************************************************************************************************************************************************
  # =>                     S C O P E S
  #****************************************************************************************************************************************************
  
  scope :aktiv, where("entwurf = ? AND datum <= ?", false, Time.now)
  
  scope :nach_jahr, lambda { |jahr| where("news.jahr = ?", jahr) }
  scope :nach_monat, lambda { |monat| where("news.monat = ?", monat) }
  scope :nach_tag, lambda { |tag| where("news.tag = ?", tag) }
  
  default_scope :order => "datum DESC"
  
  #****************************************************************************************************************************************************
  # =>                     A S S O Z I A T I O N S
  #****************************************************************************************************************************************************
  
  has_many :taggings, :as => :target
  has_many :tags, :through => :taggings, :as => :target, :uniq => true
  
  has_many :kats, :as => :target
  has_many :kategorien, :through => :kats, :as => :target, :uniq => true
  
  has_many :kommentare, :as => :target, :dependent => :destroy
  
  has_many                        :news_abschnitte, :dependent => :destroy
  accepts_nested_attributes_for   :news_abschnitte, :allow_destroy => true
  
  # => belongs_to :user
  # => belongs_to :autor, :class_name => 'User', :foreign_key => "autor"
  
  image_accessor      :file
  validates_property  :mime_type, :of => :file, :in => %w(image/jpeg image/png image/gif)
  
  #****************************************************************************************************************************************************
  # =>                    F E L D E R
  #****************************************************************************************************************************************************
  
  
  
  #****************************************************************************************************************************************************
  # =>                     V A L I D A T I O N S
  #****************************************************************************************************************************************************
  
  validates_presence_of     :headline,  :slug
  validates_uniqueness_of   :headline,  :slug
  
  validates_exclusion_of    :headline,  :in => %w(page by_date by_tag), :message => I18n.t("Keine_standard_Newsnamen_verwenden")
  
  
  
  
  def description
    "NEWS: #{self.datum.strftime('%d.%m.%Y')} - #{self.headline}"
  end
  
  def schreiber
    if self.autor && xhelp = User.find(self.autor)
      xx_help = "#{xhelp.vorname} #{xhelp.name}"
    elsif self.user_id && xhelp = User.find(self.user_id)
      xx_help = "#{xhelp.vorname} #{xhelp.name}"
    else
      xx_help = I18n.t("Autor_Unbekannt")
    end
    xx_help
  end
  
  def news_site_slug
    if Seite.where("system_name = ? AND deleted = ?", 'news_site', false).count > 0
      Seite.where("system_name = ? AND deleted = ?", 'news_site', false).first.link
    end
  end
  
  before_validation :felder_fuellen
  
  private

    def felder_fuellen
      self.headline     = self.headline.to_s.strip
      self.slug         = self.headline.to_url
      self.jahr         = self.datum.year
      self.monat        = self.datum.month
      self.tag          = self.datum.day
      self.firstletter  = self.headline.strip[0..0].upcase
    end


end
