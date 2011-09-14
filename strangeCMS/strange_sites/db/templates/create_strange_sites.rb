class CreateStrangeSites < ActiveRecord::Migration
  
  def self.up
    create_table :seiten do |t|
      
      t.string        :name                                     # => Name der Seite & Link-name
      
      t.boolean       :use_titel,       :default => false       # => abweichenden Titel verwenden (= nicht Namen) ?
      t.text          :titel                                    # => Browser-Titel
      
      t.boolean       :use_headline,    :default => false       # => abweichende Überschrift verwenden (= nicht Namen) ?
      t.text          :headline                                 # => Überschrift der Seite
      t.boolean       :no_headline,     :default => false       # => abweichende Überschrift verwenden (= nicht Namen) ?
      
      t.string        :slug                                     # => Domain der Seite (zB: '/kontakt' oder '/')
      t.string        :full_slug                                # => Domain der Seite (zB: '/ueber_uns/kontakt')
      t.string        :std_slug                                 # => StandardDomain der Seite (Falls zB: '/start' für Startseite weil slug ='/')
      
      t.string        :system_name                              # => Um System-Seiten finden zu können
      t.boolean       :system_seite,    :default => false       # => System-Seite können nur von Seiten-Admins gelöscht werden
      t.boolean       :system_only,     :default => false       # => Seite wird nur vom System genutzt (zB: Fehlerseiten)
      t.boolean       :modul_seite,     :default => false       # => Seite wird nur vom System genutzt (zB: Fehlerseiten)
      t.string        :modul_name                               # => Um System-Seiten finden zu können
      
      t.text          :meta_description                         # => Google-Beschreibung
      t.text          :meta_keywords                            # => Google-Keywords
      
      t.boolean       :weiterleitung,   :default => false       # => Seite ist eine Weiterleitung
      t.string        :externer_link,   :default => ''          # => Url der weiterleitung wenn Aktiv
      
      t.string        :typ                                      # => wird noch nicht verwendet ( zB: Verteilerseite )
      t.string        :status                                   # => wird noch nicht verwendet ( zB: Fehlerseite )
      t.string        :stil                                     # => wird noch nicht verwendet
      t.string        :template                                 # => wird noch nicht verwendet
      
      t.boolean       :in_header,       :default => false       # => Seite im Header Anzeigen ?
      t.boolean       :in_main_nav,     :default => true        # => Seite im Haupt-/Subnavigation Anzeigen ?
      t.boolean       :in_footer,       :default => true        # => Seite im Footer Anzeigen ?
      
      t.boolean       :protected_stuff,       :default => false       # => Seite nur für angemeldete Nutzer sichtbar
      #t.string        :user_crew                                # => nötiger User-Rang 
      t.references    :gruppe                                   # => Rechte-Modul .. Gruppe / Rang aufwärts
      
      t.boolean       :verteiler,       :default => false       # => Seite nur Verteiler
      
      t.boolean       :deleted,         :default => false       # => Seite ist im Papierkorb
      t.datetime      :deleted_at                               # => Wann gelöscht
      t.boolean       :entwurf,         :default => false       # => Seite ist im Entwurf-Stadium (evtl. nur für den Ersteller sichtbar ?)
      
      t.boolean       :breadcrumps,     :default => true       # => Breadcrumps auf der Seite anzeigen ? 
      
      t.integer       :position                                 # => Sortierung
      t.integer       :tiefe                                    # => Level der Seite
      
      t.integer       :elternseite_id                           # => Über- / Eltern-Seite
      t.integer       :hauptseite_id                            # => oberste Über- / Eltern-Seite
      
      t.integer       :autor_id                                 # => Wer hat die Seite erstellt
      t.integer       :last_autor_id                            # => Wer hat die Seite zuletzt geändert
      
      t.timestamps
    end
    add_index :seiten, :name,           :unique => true
    add_index :seiten, :slug,           :unique => true
    add_index :seiten, :std_slug,       :unique => true
    add_index :seiten, :full_slug,      :unique => true
    add_index :seiten, :position
    add_index :seiten, :elternseite_id
    
    
    
    create_table :abschnitte do |t|
      t.string      :name,              :default => ''          # => Name / Anker-Name des Abschnitts
      t.string      :slug                                       # => Anker-Url des Abschnitts (zB: '#einleitung')
      
      t.integer     :position                                   # => Sortierung
      
      t.references  :seite                                      # => Seite
      
      t.boolean     :system_stuff,      :default => false       # => System-Abschnitte können nur von Seiten-Admins gelöscht & verändert werden
      t.boolean     :protected_stuff,         :default => false       # => Geschützt durch Autor
      t.references  :gruppe                                     # => Rechte-Modul .. Gruppe / Rang aufwärts
      
      t.string      :stuff_typ                                  # => Art des Inhalts (zB: 'Trennlinie' / 'Text')
      t.string      :stuff_param                                # => zusätzlicher Inhalts Parameter
      
      t.string      :modul                                      # => Falls Modul Abschnitt, Modul-Name
      t.string      :modul_typ                                  # => Modul - Typ-Parameter
      t.string      :modul_id                                   # => Modul - ID-Parameter
      
      t.text        :inhalt,            :default => ''          # => Text - Inhalt
      
      t.timestamps
    end
    add_index :abschnitte, :seite_id
    
  end

  def self.down
    drop_table :seiten
    drop_table :abschnitte
  end
  
  
end