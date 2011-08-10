# encoding: utf-8
class Admin::KategorienController < Admin::BaseController
  
  before_filter :get_navi_werte
  
  def base
    @kategorien   =   Kategorie.all
    @tags         =   Tag.all
    @wertelisten  =   Werteliste.all
    render :template => 'admin/lists/base'
  end

  
  def index
    @kategorien = Kategorie.all
    @u_aktiv = 'kategorien'
  end
  
  def new
    @u_aktiv = "kt_new"
    @kategorie = Kategorie.new
  end
  
  def edit
    @u_aktiv = "edit"
    @kategorie = Kategorie.find(params[:id])
  end
  
  def show
    @kategorie = Kategorie.find(params[:id])
  end
  
  def create
    @kategorie = Kategorie.new(params[:kategorie])
    if @kategorie.save
      redirect_to(admin_kategorien_path, :notice => t('kategorie_was_created')) 
    else
      render :action => "new"
    end
  end
  
  def update
    @kategorie = Kategorie.find(params[:id])
    if @kategorie.update_attributes(params[:kategorie])
      redirect_to(admin_kategorien_path, :notice => t('kategorie_was_updated'))
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @kategorie = Kategorie.find(params[:id])
    @kategorie.destroy
    redirect_to(admin_kategorien_path)
  end
  
  
  # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => #
  # =>  =>  =>  Für verschiedene Models:
  # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => #
  
  def new_kategorie
    @data = find_data
    if params[:new_kat_name] && params[:new_kat_desc]
      @kategorie = Kategorie.new( :name => params[:new_kat_name], :beschreibung => params[:new_kat_desc] )
    elsif params[:new_kat_name]
      @kategorie = Kategorie.new( :name => params[:new_kat_name] )
    end
    if @kategorie && @kategorie.save
      @data.kategorien << @kategorie
    else 
      if @existing_kategorie = Kategorie.find_by_name(params[:kategorie][:name].to_s)
        @data.kategorien << @existing_kategorie
      end
    end
    @available_kategorien = get_available
  end
  
  def available_kategorien
    @data = find_data
    @available_kategorien = get_available
  end
  
  def available_kats
    @data = find_data
    @available_data = get_available
    render :template => 'admin/kategorien/available_kats_lb'
  end

  def select_kategorie
    @data = find_data
    @kategorie = Kategorie.find(params[:id])
    @data.kategorien << @kategorie
    @data.save
    @available_kategorien = get_available
  end
  
  def remove_kategorie
    @data = find_data
    @killa = Kat.where("target_id = ? AND target_type = ? AND kategorie_id = ?", @objekt_id, @objekt_type, params[:id])
    @killa.each do |kill|
      kill.destroy
    end
    @available_kategorien = get_available
  end
  
  private
    def get_navi_werte
      @aktivio = 'module'
      @sub_aktivio = 'listen'
      @u_sub_aktivio = 'kategorie'
    end
    
    def find_data
      params.each do |name, value|
        if name =~ /(.+)_id$/
          @objekt_type = $1.classify
          @objekt_id = value
          return $1.classify.constantize.find(value)
        end
      end
      nil
    end
    
    def get_available
      data      = find_data
      sub_data  = data.kategorien
      available_kategorien = Kategorie.all
      available_kategorien.delete_if { |thing| sub_data.include?(thing) }
      return available_kategorien
    end
      
end