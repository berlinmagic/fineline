# encoding: utf-8
class Admin::BilderController < Admin::BaseController
  
  before_filter :get_navi_werte
  before_filter :load_data
  
  cache_sweeper :bild_sweeper
  
  helper :bilder
  
  def index
    @bilder = Bild.all
    @u_aktiv = 'bilder'
  end
  
  def new
    @u_aktiv = "new"
    @bild = Bild.new
  end
  
  def edit
    @u_aktiv = "edit"
    @bild = Bild.find(params[:id])
  end
  
  def show
    @bild = Bild.find(params[:id])
    @pic_box = []
    Bild.all.each do |pic|
      @pic_box << pic.id
    end
    @prev_pic = @pic_box[ ( @pic_box.index(@bild.id) - 1 ) < 0 ? ( @pic_box.size - 1 ) : ( @pic_box.index(@bild.id) - 1 ) ]
    @next_pic = @pic_box[ ( @pic_box.index(@bild.id) + 1 ) > ( @pic_box.size - 1 ) ? 0 : ( @pic_box.index(@bild.id) + 1 ) ]
    
  end
  
  def create
    @bild = Bild.new(params[:bild])
    if @bild.save
      if params[:bild][:file].present?
        redirect_to( zuschneiden_admin_bild_path(@bild) )
      else
        redirect_to(admin_bilder_path, :notice => t('bild_was_created')) 
      end
    else
      render :action => "new"
    end
  end
  
  def update
    @bild = Bild.find(params[:id])
    
    if @bild.update_attributes(params[:bild])
      if params[:bild][:file].present?
        redirect_to( zuschneiden_admin_bild_path(@bild) )
      else
        redirect_to(admin_bilder_path, :notice => t('bild_was_updated')) 
      end
    else
      render :action => "edit"
    end
  end
  
  def zuschneiden
    @bild = Bild.find(params[:id])
  end
  
  def destroy
    if @gallerie
      @bild = BilderGallerie.where(:gallerie_id => @gallerie.id, :bild_id => params[:id]).first
    elsif @bild_kategorie
      @bild = BilderBildKategorie.where(:bild_kategorie_id => @bild_kategorie.id, :bild_id => params[:id]).first
    else
      @bild = Bild.find(params[:id])
    end
    @bild.destroy
    respond_to do |format|
      format.html { redirect_to admin_bilder_path }
      format.js { render :inline => "window.location = '/admin/bilder/'" }
    end
  end
  
  def select
    @bild = Bild.find(params[:id])
    if @gallerie
      @data_helpa = @gallerie
      @klasse = 'gallerie'
    elsif @bild_kategorie
      @data_helpa = @bild_kategorie
      @klasse = 'bild_kategorie'
    end
    @data_helpa.bilder << @bild
    @data_helpa.save
    @bilder = @data_helpa.bilder
    @available_bilder = Bild.all
    @available_bilder.delete_if { |bild| @bilder.include?(bild) }
    
    render :layout => false
  end
  
  def new_tag
    @bild = Bild.find(params[:id])
    tag_name = params[:new_tag_name]
    @tag = Tag.new(:name => tag_name)
    if @tag.save
      @bild.tags << @tag
    end
    @tags = @bild.tags
    @available_tags = Tag.all
    @available_tags.delete_if { |tag| @bild.tags.include?(tag) }
    respond_to do |format|
      format.html { redirect_to admin_bild_path(@bild) }
      format.js { render :template => "admin/bilder/new_tag" }
    end
    
    
  end
  
  def selected
    if @tag
      @pix = []
      Tagging.where(:target_type => 'Bild', :tag_id => @tag.id).each do |tg|
        @pix << Bild.find(tg.target_id)
      end
      @bilder = @pix.uniq
    elsif @gallerie
      @bilder = @gallerie.bilder
      
    elsif @bild_kategorie
      @bilder = @bild_kategorie.bilder
      
    end
    render :template => 'admin/bilder/index'
  end

  def available
    @available_bilder = Bild.all
    if @gallerie
      @available_bilder.delete_if { |bild| @gallerie.bilder.include?(bild) }
    elsif @bild_kategorie
      @available_bilder.delete_if { |bild| @bild_kategorie.bilder.include?(bild) }
    end
  end
  
  def remove
    @bild = Bild.find(params[:id])
    if @gallerie
      @killa = BilderGallerie.where("bild_id = ? AND gallerie_id = ?", params[:id], params[:gallerie_id])
    elsif @bild_kategorie
      @killa = BilderBildKategorie.where("bild_id = ? AND bild_kategorie_id = ?", params[:id], params[:bild_kategorie_id]) 
    elsif @tag
      @killa = Tagging.where("target_id = ? AND tag_id = ? AND target_type = ?", params[:id], params[:tag_id], 'Bild')
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
      @aktivio = 'bilder'
      @sub_aktivio = 'gallerie'
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