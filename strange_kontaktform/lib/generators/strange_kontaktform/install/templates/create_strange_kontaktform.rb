class CreateStrangeKontaktform < ActiveRecord::Migration
  
  def self.up
    create_table :kontakt_formulare do |t|
      t.string    :anrede
      t.string    :titel
      t.string    :vorname
      t.string    :name
      t.string    :firma
      t.string    :abteiung_oder_position
      t.string    :email
      t.string    :webseite
      t.string    :strasse
      t.string    :plz
      t.string    :ort
      t.string    :bundesland
      t.string    :land
      t.date      :geburtstag
      t.string    :telefon
      t.string    :telefax
      t.string    :mobil
      t.text      :betreff
      t.text      :inhalt
      
      t.string    :feld1_name
      t.text      :feld1_wert
      t.text      :feld1_typ
      
      t.string    :feld2_name
      t.text      :feld2_wert
      t.text      :feld2_typ
      
      t.string    :feld3_name
      t.text      :feld3_wert
      t.text      :feld3_typ
      
      
      t.string :user_ip
      t.boolean :neu
      t.boolean :beantwortet
      t.integer :antwort_auf

      t.timestamps
    end
  end

  def self.down
    drop_table :kontakt_formulare
  end
  
  
end