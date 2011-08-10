# encoding: utf-8
class User < ActiveRecord::Base
  
  CREW_ROLES = %w[user author moderator admin owner banned]
  
  USER_TYPIES = %w[herr frau]

  scope :standard, :conditions => {:evil_master => false, :site_admin => false}, :order => 'created_at DESC'
  scope :no_master, :conditions => {:evil_master => false}, :order => 'created_at DESC'
  # => scope :banned, :conditions => ["crew = ?", 'banned'], :order => 'created_at DESC'
  
  belongs_to  :gruppe
  
  has_many :rechte,           :dependent => :destroy
  has_many :rechte_module,    :through => :rechte
  
  
  # Include default devise modules. Others available are:
  devise      :invitable,     :database_authenticatable,    :registerable,        :recoverable,           :rememberable,          :trackable,     
              :validatable,   :token_authenticatable,       :confirmable,         :lockable,              :timeoutable
  
  
  image_accessor      :bild
  validates_property  :mime_type, :of => :bild, :in => %w(image/jpeg image/png image/gif)
  
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible     :anrede, :vorname, :name, :email, :password, :password_confirmation, :remember_me, :site_admin, :crew, :nick_name
  attr_protected      :evil_master, :strange_id
  
  validates_presence_of    :name, :on => :create, :message => I18n.t("Account_name_must_be_unique_and_not_blank")
                        
  validates_uniqueness_of  :email, :case_sensitive => false
  validates_uniqueness_of  :strange_id, :case_sensitive => false
  validates_uniqueness_of  :nick_name, :case_sensitive => false
  
  validates_inclusion_of :anrede, :in => %w(herr frau admin)
  # => validates_inclusion_of :crew, :in => CREW_ROLES
  
  
  
  
  before_create :create_crew_member
  before_save :felder_check
  before_validation :felder_check
  
  
  
  private
    
    def felder_check
      
      # => if self.crew == ''
      # =>   self.crew = 'user'
      # => end
      
      if self.nick_name == ''
        nick = "John_Doe"
        if self.vorname && self.vorname != ''
          nick = self.vorname.titleize + '_' + self.name.titleize
        else
          nick = I18n.t(self.anrede) + '_' + self.name.titleize
        end
        if User.find(:first, :conditions => ["nick_name = ?", nick])
          nick = self.email
        end
        self.nick_name = nick
      end
      
      if self.strange_id == ''
        generate_strange_id
      end
      
    end
    
    def create_crew_member
      if User.all.count == 0
        self.evil_master = true
        # => self.crew = 'admin'
        self.gruppe = Gruppe.where("system_name = ?", 'admin').first
      end
    end

    def generate_strange_id
        record = true
        while record
          random = "ODW-#{Array.new(9){rand(9)}.join}"
          record = User.find(:first, :conditions => ["strange_id = ?", random])
        end
        self.strange_id = random
    end
    
end
