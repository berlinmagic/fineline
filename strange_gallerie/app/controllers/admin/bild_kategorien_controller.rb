# encoding: utf-8
class Admin::BildKategorienController < Admin::BaseController
  
  before_filter :get_navi_werte
  before_filter :load_data
  
  helper :bilder
  
  def index
    @bild_kategorien = BildKategorie.all
    @u_aktiv = 'bild_kategorien'
  end
  
  def new
    @u_aktiv = "new"
    @bild_kategorie = BildKategorie.new
  end
  
  def edit
    @u_aktiv = "edit"
    @bild_kategorie = BildKategorie.find(params[:id])
  end
  
  def show
    @bild_kategorie = BildKategorie.find(params[:id])
  end
  
  def create
    @bild_kategorie = BildKategorie.new(params[:bild_kategorie])
    if @bild_kategorie.save
      redirect_to(admin_bild_kategorien_path, :notice => t('bild_kategorie_was_created')) 
    else
      render :action => "new"
    end
  end
  
  def update
    @bild_kategorie = BildKategorie.find(params[:id])
    if @bild_kategorie.update_attributes(params[:bild_kategorie])
      redirect_to(admin_bild_kategorien_path, :notice => t('bild_kategorie_was_updated'))
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @bild_kategorie = BildKategorie.find(params[:id])
    @bild_kategorie.destroy
    redirect_to(admin_bild_kategorien_path)
  end
  
  
  def select
    @bild_kategorie = BildKategorie.find(params[:id])
    if @gallerie
      @gallerie.bild_kategorien << @bild_kategorie
      @gallerie.save
      @klasse = 'gallerie'
      @bild_kategorien = @gallerie.bild_kategorien
    elsif @bild
      @bild.bild_kategorien << @bild_kategorie
      @bild.save
      @klasse = 'bild'
      @bild_kategorien = @bild.bild_kategorien
    end
    @available_bild_kategorien = BildKategorie.all
    @available_bild_kategorien.delete_if { |bbk| @bild_kategorien.include?(bbk) }
  end

  def available
    @available_bild_kategorien = BildKategorie.all
    if @gallerie
      @available_bild_kategorien.delete_if { |bild| @gallerie.bild_kategorien.include?(bild) }
    elsif @bild
      @available_bild_kategorien.delete_if { |bild| @bild.bild_kategorien.include?(bild) }
    end
  end
  
  def remove
    @bild_kategorie = BildKategorie.find(params[:id])
    if @gallerie
      @killa = BildKategorienGallerie.where("bild_kategorie_id = ? AND gallerie_id = ?", params[:id], params[:gallerie_id])
    elsif @bild
      @killa = BilderBildKategorie.where("bild_kategorie_id = ? AND bild_id = ?", params[:id], params[:bild_id]) 
    else
      @killa = []
    end
    @killa.each do |kill|
      kill.destroy
    end
    render :nothing => true
  end
  
  private
    def get_navi_werte
      @aktivio = 'module'
      @sub_aktivio = 'gallerie'
      @u_sub_aktivio = 'bild_kategorie'
    end
    
    def load_data
      if params[:gallerie_id]
        @gallerie = Gallerie.find(params[:gallerie_id])
      elsif params[:bild_id]
        @bild = Bild.find(params[:bild_id])
      end
    end
    
  
    
  
  
end