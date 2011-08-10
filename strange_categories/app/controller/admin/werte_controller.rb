# encoding: utf-8
class Admin::WerteController < Admin::BaseController
  
  before_filter :get_navi_werte
  
  def index
    @werte = Wert.all
    @u_aktiv = 'werte'
  end
  
  def new
    @u_aktiv = "new"
    @wert = Wert.new
  end
  
  def edit
    @u_aktiv = "edit"
    @wert = Wert.find(params[:id])
  end
  
  def show
    @wert = Wert.find(params[:id])
  end
  
  def create
    @wert = Wert.new(params[:wert])
    if @wert.save
      redirect_to(admin_werte_path, :notice => t('wert_was_created')) 
    else
      render :action => "new"
    end
  end
  
  def update
    @wert = Wert.find(params[:id])
    if @wert.update_attributes(params[:wert])
      if @wert.werteliste
        redirect_to(admin_werteliste_path(@wert.werteliste), :notice => t('wert_was_updated'))
      else
        redirect_to(admin_werte_path, :notice => t('wert_was_updated'))
      end
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @wert = Wert.find(params[:id])
    @wert.destroy
    redirect_to(admin_werte_path)
  end
  
  def remove
    @wert = Wert.find(params[:id])
    @wert.destroy
    render :nothing => true
  end
  
  private
    def get_navi_werte
      @aktivio = 'module'
      @sub_aktivio = 'wert'
      @u_sub_aktivio = 'wert'
    end
  
end

