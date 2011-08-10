# encoding: utf-8
class Admin::WertelistenController < Admin::BaseController
  
  skip_before_filter :verify_authenticity_token, :only => [:reorder_werte]
  
  before_filter :get_navi_werte
  
  def index
    @wertelisten = Werteliste.all
    @u_aktiv = 'werteliste'
  end
  
  def new
    @u_aktiv = "wl_new"
    @werteliste = Werteliste.new
  end
  
  def edit
    @u_aktiv = "edit"
    @werteliste = Werteliste.find(params[:id])
  end
  
  def show
    @werteliste = Werteliste.find(params[:id])
  end
  
  def create
    @werteliste = Werteliste.new(params[:werteliste])
    if @werteliste.save
      redirect_to(admin_wertelisten_path, :notice => t('werteliste_was_created')) 
    else
      render :action => "new"
    end
  end
  
  def update
    @werteliste = Werteliste.find(params[:id])
    if @werteliste.update_attributes(params[:werteliste])
      redirect_to(admin_wertelisten_path, :notice => t('werteliste_was_updated'))
    else
      render :action => "edit"
    end
  end
  
  def new_wert
    @werteliste = Werteliste.find(params[:id])
    @wert = Wert.new(:inhalt => params[:new_wert], :werteliste_id => params[:id])
    @wert.save
  end
  
  def destroy
    @werteliste = Werteliste.find(params[:id])
    @werteliste.destroy
    redirect_to(admin_wertelisten_path)
  end
  
  def reorder_werte
    params[:wert].each_with_index do |id, index|
      Wert.update_all(['position=?', index+1], ['id=?', id])
    end
    render :nothing => true
  end
  
  def remove_wert
    if @wert = Wert.find(params[:wert])
      @wert.destroy
    end
    render :nothing => true
  end
  
  
  private
    def get_navi_werte
      @aktivio = 'module'
      @sub_aktivio = 'listen'
      @u_sub_aktivio = 'werteliste'
    end
  
end

