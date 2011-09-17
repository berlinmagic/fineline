# encoding: utf-8
class GallerienController< ApplicationController
  
  include FinestyleHelp
  include StrangeSitesHelp
  
  # => caches_action :index
  # => caches_action :show_pic
  # => caches_action :show
  # => caches_action :xxl_index
  # => caches_action :show_by_date
  # => caches_action :show_by_tag
  # => caches_action :show_by_kategorie
  
  before_filter :load_stuff
  
  def pic_bg_form
    
  end
  
  def index
    # => news = News.aktiv
    @bilder     = Bild.page(params[:page]).per( Strangecms::Gallerie::Config[:pics_per_page_4line].to_i )
    @xxl_url    = "#{ @page_uri }/xxl/page/#{ @lpage }"
    render :template => 'base/seite'
  end
  
  def xxl_index
    @xxl_view = true
    @bilder = Bild.page(params[:page]).per( Strangecms::Gallerie::Config[:pics_per_page_2line].to_i )
    @smal_url    = "#{ @page_uri }/page/#{ @spage }"
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
    @this_pics  = get_date_pics( params )
    @page_url   = @page_uri+'/by_date'+"/#{params[:year]}"+"#{'/'+params[:month] if params[:month]}"+"#{'/'+params[:day] if params[:day]}"
    @xxl_url    = "#{ @page_uri }/xxl_date/#{params[:year]}#{'/'+params[:month] if params[:month]}#{'/'+params[:day] if params[:day]}/page/#{ @lpage }"
    @page_count = fine_num_pagez( @this_pics, @per_page4 )
    @bilder     = paginated_objs( @this_pics, @per_page4 )
    render 'gallerien/show_by'
  end
  def xxl_by_date
    @xxl_view = true
    @this_pics  = get_date_pics( params )
    @page_url   = @page_uri+'/xxl_date'+"/#{params[:year]}"+"#{'/'+params[:month] if params[:month]}"+"#{'/'+params[:day] if params[:day]}"
    @smal_url   = @page_uri+'/by_date'+"/#{params[:year]}"+"#{'/'+params[:month] if params[:month]}"+"#{'/'+params[:day] if params[:day]}/page/#{ @spage }"
    @page_count = fine_num_pagez( @this_pics, @per_page2 )
    @bilder     = paginated_objs( @this_pics, @per_page2 )
    render 'gallerien/show_by'
  end
  
  def show_by_tag
    @this_pics    = get_tag_pics
    @page_url     = @page_uri + '/by_tag' + @tag.slug
    @xxl_url      = "#{ @page_uri }/xxl_tag/#{ @tag.slug }/page/#{ @lpage }"
    @page_count   = fine_num_pagez( @this_pics, @per_page4 )
    @bilder       = paginated_objs( @this_pics, @per_page4 )
    render 'gallerien/show_by'
  end
  def xxl_by_tag
    @xxl_view = true
    @this_pics    = get_tag_pics
    @page_url     = @page_uri + '/xxl_tag' + @tag.slug
    @smal_url      = "#{ @page_uri }/by_tag/#{ @tag.slug }/page/#{ @spage }"
    @page_count   = fine_num_pagez( @this_pics, @per_page2 )
    @bilder       = paginated_objs( @this_pics, @per_page2 )
    render 'gallerien/show_by'
  end
  
  def show_by_kategorie
    @this_pics    = get_kat_pics
    @page_count   = fine_num_pagez( @this_pics, @per_page4 )
    @page_url     = @page_uri + '/by_kategorie' + @kategorie.slug
    @xxl_url      = "#{ @page_uri }/xxl_kategorie/#{ @kategorie.slug }/page/#{ @lpage }"
    @bilder       = paginated_objs( @this_pics, @per_page4 )
    render 'gallerien/show_by'
  end
  def xxl_by_kategorie
    @xxl_view = true
    @this_pics    = get_kat_pics
    @page_count   = fine_num_pagez( @this_pics, @per_page2 )
    @page_url     = @page_uri + '/xxl_kategorie' + @kategorie.slug
    @smal_url     = "#{ @page_uri }/by_kategorie/#{ @kategorie.slug }/page/#{ @spage }"
    @bilder       = paginated_objs( @this_pics, @per_page2 )
    render 'gallerien/show_by'
  end
  
  
  def fineline_accurate_title
    portfolio = Seite.where('system_name = ?', 'gallerie').first
    if @bild
      this_title = @bild.name
    elsif params[:year]
      this_title = "#{portfolio.titel} - #{ params[:day] + '.' if params[:day] }#{ params[:month] + '.' if params[:month] }#{params[:year]}"
    elsif params[:tag]
      this_title = "#{portfolio.titel} - by tag - #{params[:tag]}"
    elsif params[:kategorie]
      this_title = "#{portfolio.titel} - by kategorie - #{params[:kategorie]}"
    else
      this_title = "#{portfolio.titel}"
    end
    this_title
  end
  
  private
  
    def load_stuff
      @seite        =   Seite.where("system_name = ?", 'gallerie').first
      @page_uri     =   Bild.first.gallerie_slug if Bild.all.count > 0
      @page         =   params[:page] ? params[:page].to_i : 1
      @per_page2    =   Strangecms::Gallerie::Config[:pics_per_page_2line].to_i || 4
      @per_page3    =   Strangecms::Gallerie::Config[:pics_per_page_3line].to_i || 9
      @per_page4    =   Strangecms::Gallerie::Config[:pics_per_page_4line].to_i || 16
      @lpage        =   fine_num_number( ( (@page * @per_page4) - (@per_page4 - 1) ), @per_page2 )
      @spage        =   fine_num_number( ( (@page * @per_page2) - (@per_page2 - 1) ), @per_page4 )
    end
    
    def get_date_pics( paras )
      date_pics = []
      if paras[:day]
        date_pics = Bild.nach_jahr(paras[:year]).nach_monat(paras[:month]).nach_tag(paras[:day])
      elsif params[:month]
        date_pics = Bild.nach_jahr(paras[:year]).nach_monat(paras[:month])
      else      
        date_pics = Bild.nach_jahr(paras[:year])
      end
      date_pics
    end
    
    def get_tag_pics
      tag = Tag.find_by_name(params[:tag]) || Tag.find_by_slug(params[:tag]) || Tag.find_by_slug('/'+params[:tag])
      this_pics = []
      Tagging.where(:target_type => 'Bild', :tag_id => tag.id).each do |tagging|
          this_pics << Bild.find(tagging.target_id)
      end
      this_pics
    end
    
    def get_kat_pics
      @kategorie = Kategorie.find_by_name(params[:kategorie]) || Kategorie.find_by_slug(params[:kategorie]) || Kategorie.find_by_slug('/'+params[:kategorie])
      this_pics = []
      Kat.where(:target_type => 'Bild', :kategorie_id => @kategorie.id).each do |tagging|
          this_pics << Bild.find(tagging.target_id)
      end
      this_pics
    end
    
    def paginated_objs( objects, per_page )
      if objects.count > per_page
          @fineline_array_paginated = true
          p_objects = objects.fine_paginated( @page, per_page ) 
      else
          p_objects = objects
      end
      p_objects
    end
  
end