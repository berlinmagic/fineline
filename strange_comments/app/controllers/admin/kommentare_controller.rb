# encoding: utf-8
class Admin::KommentareController < Admin::BaseController
  
  before_filter :get_navi_werte
  before_filter :load_data
  
  def index
    @kommentare = Kommentar.all
    @u_aktiv = 'bilder'
  end
  
  def new
    @u_aktiv = "new"
    @kommentar = Kommentar.new
  end
  
  def edit
    @u_aktiv = "edit"
    @kommentar = Kommentar.find(params[:id])
  end
  
  def show
    @kommentar = Kommentar.find(params[:id])

  end
  
  def create
    @kommentar = Kommentar.new(params[:kommentar])
    @kommentar.user_id = current_user.id
    @kommentar.user_ip = request.remote_ip
    if @kommentar.save
      
      if params[:kommentar][:back_url]
        redirect_to(params[:kommentar][:back_url], :notice => t('Kommentar_was_created'))
      else
        redirect_to(admin_kommentare_path, :notice => t('Kommentar_was_created')) 
      end

    else
      render :action => "new"
    end
  end
  
  def update
    @kommentar = Kommentar.find(params[:id])
    if @kommentar.update_attributes(params[:kommentar])
        redirect_to(admin_kommentare_path, :notice => t('Kommentar_was_updated')) 

    else
      render :action => "edit"
    end
  end
  

  

  
  private
    def get_navi_werte
      @aktivio = 'module'
      @sub_aktivio = 'kommentare'
      @u_sub_aktivio = 'bild'
    end
    
    def load_data
      if params[:gallerie_id]
        @gallerie = Gallerie.find_by_id(params[:gallerie_id])
      elsif params[:bild_kategorie_id]
        @bild_kategorie = BildKategorie.find_by_id(params[:bild_kategorie_id])
      elsif params[:tag_id]
        @tag = Tag.find(params[:tag_id])
      end
    end
    
    def render_js_for_destroy
      render :partial => "/admin/shared/destroy_item"
    end
  
  
end