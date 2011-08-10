# encoding: utf-8
class BackupsController < ApplicationController
  
  
  def index
    redirect_to root_url 
  end
  
  require 'yaml'
  
  def show
    @backup =   Backup.find(params[:id])
    #@backup_seite  =   YAML.load( @backup.yml_objekt )   strange_yaml_site_builder( @backup.yml_objekt )
    #@backup_seite  =  YAML.load( @backup.yml_objekt.to_s )
    # 
    @seite = Seite.find_by_id(@backup.target_id)
    @backup_abschnitte = YAML.load( @backup.yml_nested_1.to_s )
    
    @backup_seite  = Seite.new(YAML.load( @backup.yml_attribute.to_s ))
    
    @changes = YAML.load( @backup.yml_change.to_s )

  end
  
  def wiederherstellen
    @backup = Backup.find(params[:id])
    if @seite = Seite.find(@backup.seite)
      mach_backup(@seite)
    else
      @seite = Seite.new
    end
    @backup = Backup.find(params[:id])
    @seite.send :write_attribute, :name, @backup.name
    @seite.send :write_attribute, :titel, @backup.titel
    @seite.send :write_attribute, :headline, @backup.headline
    @seite.send :write_attribute, :position, @backup.position
    @seite.send :write_attribute, :entwurf, @backup.entwurf
    @seite.send :write_attribute, :in_footer, @backup.in_footer
    @seite.send :write_attribute, :in_header, @backup.in_header
    @seite.send :write_attribute, :in_main_nav, @backup.in_main_nav
    @seite.send :write_attribute, :system_seite, @backup.system_seite
    @seite.send :write_attribute, :weiterleitung, @backup.weiterleitung
    @seite.send :write_attribute, :system_name, @backup.system_name
    @seite.send :write_attribute, :meta_description, @backup.meta_description
    @seite.send :write_attribute, :meta_keywords, @backup.meta_keywords
    @seite.send :write_attribute, :elternseite_id, @backup.elternseite_id
    @seite.send :write_attribute, :externer_link, @backup.externer_link
    @seite.send :write_attribute, :tiefe, @backup.tiefe
    
    #Abschnitt.delete_all(:seite_id => @seite.id)
    @seite.abschnitte.each do |xxx|
      xxx.destroy
    end
      
    @backup.backups_safed_abschnitte.each do |bsabs|
        @abs = bsabs.safed_abschnitt
        @abschnitt = Abschnitt.new('system_stuff' => @abs.system_stuff, 'stuff_typ' => @abs.stuff_typ, 'stuff_param' => @abs.stuff_param, 'position' => bsabs.position)
        if @abs.inhalt && @abs.inhalt != ''
          @abschnitt.build_text('inhalt' => @abs.inhalt)
        end
        @seite.abschnitte << @abschnitt
    end
    
    redirect_to @seite.slug
    
  end
  
  private
  
  def mach_backup(seite = nil)
    if seite
      @old_seite = seite
      
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
  
  def strange_yaml_site_builder(objekt)
    data = YAML::load(objekt)
    attrs = data.ivars
    model = data.class.new
    attrs.each do |k, v|
      if k == 'attributes'
        v.each do |k, v|
          unless (k == "created_at") || (k == "updated_at")
            model.send :write_attribute, k.to_sym , v 
          end
        end
      end
      if k == 'abschnitte'
        v.map do |k|
          xx = k.ivars
          xx.each do |k, v|
            if k == 'attributes'
              abschnitt = Abschnitt.new
              v.each do |k, v|
                unless k == "created_at" || k == "updated_at"
                  abschnitt.send :write_attribute, k.to_sym , v
                end
              end
              model.abschnitte << abschnitt
            end
          end
        end
      end
    end
    return model
  end
  
  def find_this_objekt
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
  
end