# encoding: utf-8
class Admin::GallerienController < Admin::BaseController
  
  before_filter :get_navi_werte
  
  helper :bilder
  
  def ueberblick
    @bilder = Bild.all
    
  end
  
  def index
    @gallerien = Gallerie.all
    @u_aktiv = 'gallerie'
  end
  
  def new
    @u_aktiv = "new"
    @gallerie = Gallerie.new
  end
  
  def edit
    @u_aktiv = "edit"
    @gallerie = Gallerie.find(params[:id])
  end
  
  def show
    @gallerie = Gallerie.find(params[:id])
  end
  
  def create
    @gallerie = Gallerie.new(params[:gallerie])
    if @gallerie.save
      redirect_to(admin_gallerien_path, :notice => t('gallerie_was_created')) 
    else
      render :action => "new"
    end
  end
  
  def update
    @gallerie = Gallerie.find(params[:id])
    if @gallerie.update_attributes(params[:gallerie])
      redirect_to(admin_gallerien_path, :notice => t('gallerie_was_updated'))
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @gallerie = Gallerie.find(params[:id])
    @gallerie.destroy
    redirect_to(admin_gallerien_path)
  end
  
  private
    def get_navi_werte
      @aktivio = 'module'
      @sub_aktivio = 'gallerie'
      @u_sub_aktivio = 'gallerie'
    end
  
end