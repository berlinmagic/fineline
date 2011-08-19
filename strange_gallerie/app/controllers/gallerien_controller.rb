# encoding: utf-8
class GallerienController< ApplicationController
  
  before_filter :load_stuff
  
  def pic_bg_form
    
  end
  
  def index
    # => news = News.aktiv
    @bilder = Bild.page(params[:page]).per(16)
    render :template => 'base/seite'
  end
  
  def xxl_index
    @xxl_view = true
    @bilder = Bild.page(params[:page]).per(4)
    render :template => 'base/seite'
  end
  
  def show_pic
    @bild = Bild.find(params[:id])
    render :layout => false
  end
  
  def show
    @bild = Bild.find(params[:id])
    @pic_box = []
    Bild.all.each do |pic|
      @pic_box << pic.id
    end
    @prev_pic = @pic_box[ ( @pic_box.index(@bild.id) - 1 ) < 0 ? ( @pic_box.size - 1 ) : ( @pic_box.index(@bild.id) - 1 ) ]
    @next_pic = @pic_box[ ( @pic_box.index(@bild.id) + 1 ) > ( @pic_box.size - 1 ) ? 0 : ( @pic_box.index(@bild.id) + 1 ) ]
    # => render :template => 'base/seite'
  end
  
  def show_by_date
    @date_pics = []
    if params[:day]
      @date_pics = Bild.nach_jahr(params[:year]).nach_monat(params[:month]).nach_tag(params[:day])
    elsif params[:month]
       @date_pics = Bild.nach_jahr(params[:year]).nach_monat(params[:month])
    else      
      @date_pics = Bild.nach_jahr(params[:year])
    end
    @page_url = @page_uri+'/by_date'+"/#{params[:year]}"+"#{'/'+params[:month] if params[:month]}"+"#{'/'+params[:day] if params[:day]}"
    per_page = 16
    @page_count = @date_pics.count / per_page + 1
    if @date_pics.count > per_page
        @fineline_array_paginated = true
        @bilder = @date_pics.fine_paginated(@page, per_page)
    else
        @bilder = @date_pics
    end
    render 'gallerien/show_by'
  end
  
  def show_by_tag
    @tag = Tag.find_by_name(params[:tag]) || Tag.find_by_slug(params[:tag]) || Tag.find_by_slug('/'+params[:tag])
    @tag_pics = []
    Tagging.where(:target_type => 'Bild', :tag_id => @tag.id).each do |tagging|
        @tag_pics << Bild.find(tagging.target_id)
    end
    @page_url = @page_uri + '/by_tag' + @tag.slug
    per_page = 16
    @page_count = @tag_pics.count / per_page + 1 
    if @tag_pics.count > per_page
        @fineline_array_paginated = true
        @bilder = @tag_pics.fine_paginated(@page, per_page) 
    else
        @bilder = @tag_pics
    end
    render 'gallerien/show_by'
  end
  
  def show_by_kategorie
    @kategorie = Kategorie.find_by_name(params[:kategorie]) || Kategorie.find_by_slug(params[:kategorie]) || Kategorie.find_by_slug('/'+params[:kategorie])
    @kat_pics = []
    Kat.where(:target_type => 'Bild', :kategorie_id => @kategorie.id).each do |tagging|
        @kat_pics << Bild.find(tagging.target_id)
    end
    per_page      =   16
    @page_count   =   @kat_pics.count / per_page + 1 
    @page_url     =   @page_uri + '/by_kategorie' + @kategorie.slug
    
    if @kat_pics.count > per_page
      
        @fineline_array_paginated = true
        @bilder   =   @kat_pics.fine_paginated(@page, per_page)
         
    else
        @bilder   =   @kat_pics
    end
    render 'gallerien/show_by'
  end
  
  private
  
    def load_stuff
      @seite      =   Seite.where("system_name = ?", 'gallerie').first
      @page_uri   =   Bild.first.gallerie_slug if Bild.all.count > 0
      @page       =   params[:page] ? params[:page].to_i : 1
    end
  
end