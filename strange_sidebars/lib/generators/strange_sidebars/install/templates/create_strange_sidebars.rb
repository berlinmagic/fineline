class CreateStrangeSidebars < ActiveRecord::Migration
  
  def self.up
    
    create_table :sidebars do |t|
      t.string      :name                                       # => Name of Sidebar
      t.string      :headline                                   # => Headline of the Sidebox
      t.text        :inhalt                                     # => Content / Text of the Box
      
      t.string      :stil                                       # => maybe other colors, etc.
      t.string      :typ                                        # => ..
      t.string      :param                                      # => ..
      t.string      :stuff_type                                 # => polymorphic stuff
      t.integer     :stuff_id                                   # => polymorphic stuff

      t.string      :modul                                      # => Modul ?
      
      t.integer     :position                                   # => sort
      
      t.date        :datum                                      # => Box with date ?
      t.datetime    :start                                      # => visible from ..
      t.datetime    :ende                                       # => visible till ..
      
      t.string      :file_uid                                   # => file / pic
      t.string      :file_cropping                              # => cropping of pic
      
      t.integer     :autor                                      # => box-autor
      
      t.boolean     :protected_stuff,   :default => false       # => box protected only visible for ?
      t.references  :gruppe                                     # => this group can see protected boxes
      
      t.datetime    :deleted_at                                 # => box deleted at (in trash)
      
      t.boolean     :system_stuff,      :default => false       # => system-box? ... user can´t delete
      
      t.boolean     :multi_site,        :default => false       # => show box on all sites (except seiten_without_sidebars)
      
      t.timestamps
    end
   
   create_table :seiten_sidebars do |t|
      t.references  :seite
      t.references  :sidebar
      t.integer     :position
      t.timestamps
    end
    
    create_table :seiten_without_sidebars do |t|
        t.references  :seite
        t.references  :sidebar
        t.timestamps
      end
    
  end

  def self.down
    drop_table :sidebars
    drop_table :seiten_sidebars
    drop_table :seiten_without_sidebars
  end
  
  
end