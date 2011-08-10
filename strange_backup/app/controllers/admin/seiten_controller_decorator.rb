# encoding: utf-8
Admin::SeitenController.class_eval do
  
  before_filter :make_backup, :only => [:update]
  
  
  def make_backup
    if @old_seite = Seite.find_by_slug(params[:id]) || Seite.find_by_name(params[:id]) || Seite.find(params[:id])
      
      @backup = Backup.create!(:name => @old_seite.name, :titel => @old_seite.titel, :headline => @old_seite.headline, :position => @old_seite.position, :entwurf => @old_seite.entwurf, :in_footer => @old_seite.in_footer, :in_header => @old_seite.in_header, :in_main_nav => @old_seite.in_main_nav, :system_seite => @old_seite.system_seite, :weiterleitung => @old_seite.weiterleitung, :system_name => @old_seite.system_name, :meta_description => @old_seite.meta_description, :meta_keywords => @old_seite.meta_keywords, :elternseite_id => @old_seite.elternseite_id, :externer_link => @old_seite.externer_link, :tiefe => @old_seite.tiefe, :seite_id => @old_seite.id)
      
      @old_seite.abschnitte.each do |abs|
        if SafedAbschnitt.where(:abschnitt_id => abs.id).count > 0
          xxx = SafedAbschnitt.where(:abschnitt_id => abs.id).last
          if xxx.name == abs.name && xxx.system_stuff == abs.system_stuff && xxx.stuff_typ == abs.stuff_typ && xxx.stuff_param == abs.stuff_param
            if abs.text
              unless abs.text.inhalt == xxx.inhalt
                sabs = SafedAbschnitt.create(:name => abs.name, :abschnitt_id => abs.id, :system_stuff => abs.system_stuff, :stuff_typ => abs.stuff_typ, :stuff_param => abs.stuff_param, :inhalt => abs.text.inhalt)
                babs = BackupsSafedAbschnitt.create!(:backup_id => @backup.id, :safed_abschnitt_id => sabs.id, :position => abs.position)
              else
                babs = BackupsSafedAbschnitt.create!(:backup_id => @backup.id, :safed_abschnitt_id => xxx.id, :position => abs.position)
              end
            else
              babs = BackupsSafedAbschnitt.create!(:backup_id => @backup.id, :safed_abschnitt_id => xxx.id, :position => abs.position)
            end
          else
            if abs.text && abs.text.inhalt
              sabs = SafedAbschnitt.create!(:name => abs.name, :abschnitt_id => abs.id, :system_stuff => abs.system_stuff, :stuff_typ => abs.stuff_typ, :stuff_param => abs.stuff_param, :inhalt => abs.text.inhalt)
            else
              sabs = SafedAbschnitt.create!(:name => abs.name, :abschnitt_id => abs.id, :system_stuff => abs.system_stuff, :stuff_typ => abs.stuff_typ, :stuff_param => abs.stuff_param)
            end
            babs = BackupsSafedAbschnitt.create!(:backup_id => @backup.id, :safed_abschnitt_id => sabs.id, :position => abs.position)
          end
        else
          if abs.text && abs.text.inhalt
            sabs = SafedAbschnitt.create!(:name => abs.name, :abschnitt_id => abs.id, :system_stuff => abs.system_stuff, :stuff_typ => abs.stuff_typ, :stuff_param => abs.stuff_param, :inhalt => abs.text.inhalt)
          else
            sabs = SafedAbschnitt.create!(:name => abs.name, :abschnitt_id => abs.id, :system_stuff => abs.system_stuff, :stuff_typ => abs.stuff_typ, :stuff_param => abs.stuff_param)
          end
          babs = BackupsSafedAbschnitt.create!(:backup_id => @backup.id, :safed_abschnitt_id => sabs.id, :position => abs.position)
        end
      end
      
    end 
  end
  
end