# encoding: utf-8
class NewsController < ApplicationController
  
  include FinestyleHelp
  
  before_filter :load_news_site
  
  caches_action :index
  caches_action :show
  caches_action :show_news
  caches_action :show_news_by_date
  caches_action :show_news_by_tag
  caches_action :show_news_by_kategorie

  def index
    # => @news = News.aktiv
    @news = News.aktiv.page(params[:page]).per(Strangecms::Newz::Config[:news_per_page])
    render :template => 'base/seite'
  end
  
  def show
    if params[:id] && params[:id] =~ /^\d/
      @news = News.find(params[:id])
    else      
      @news = News.find_by_slug('/'+params[:id])
    end
  end
  
  def show_news
    if params[:id] && params[:id] =~ /^\d/
      @news = News.find(params[:id])
    elsif params[:slug]
      @news = News.find_by_slug('/'+params[:slug])
    else      
      @news = News.find_by_slug('/'+params[:id])
    end
    render 'news/show'
  end
  
  def show_news_by_date
    if params[:day]
      @date_news = News.aktiv.nach_jahr(params[:year]).nach_monat(params[:month]).nach_tag(params[:day])
    elsif params[:month]
       @date_news = News.aktiv.nach_jahr(params[:year]).nach_monat(params[:month])
    else      
      @date_news = News.aktiv.nach_jahr(params[:year])
    end
    @page = params[:page] ? params[:page].to_i : 1
    per_page = Strangecms::Newz::Config[:news_per_page]
    
    @page_url = News.first.news_site_slug+'/by_date'+"/#{params[:year]}"+"#{'/'+params[:month] if params[:month]}"+"#{'/'+params[:day] if params[:day]}"
    
    @page_count = @date_news.count / per_page + 1
    
    if @date_news.count > per_page
        @fineline_array_paginated = true
        @news = @date_news.fine_paginated(@page, per_page)
    else
        @news = @date_news
    end
    
    render 'news/show_by'
  end
  
  
  def show_news_by_tag
    @tag = Tag.find_by_name(params[:tag]) || Tag.find_by_slug(params[:tag]) || Tag.find_by_slug('/'+params[:tag])
    @tag_news = []
    Tagging.where(:target_type => 'News', :tag_id => @tag.id).each do |tagging|
        @tag_news << News.find(tagging.target_id)
    end
    @page = params[:page] ? params[:page].to_i : 1
    per_page = Strangecms::Newz::Config[:news_per_page]
    @page_count = @tag_news.count / per_page + 1 
    @page_url = News.first.news_site_slug + '/by_tag' + @tag.slug
    if @tag_news.count > per_page
        @fineline_array_paginated = true
        @news = @tag_news.fine_paginated(@page, per_page) 
    else
        @news = @tag_news
    end
    render 'news/show_by'
  end
  
  def show_news_by_kategorie
    @kategorie = Kategorie.find_by_name(params[:kategorie]) || Kategorie.find_by_slug(params[:kategorie]) || Kategorie.find_by_slug('/'+params[:kategorie])
    @kat_news = []
    Kat.where(:target_type => 'News', :kategorie_id => @kategorie.id).each do |tagging|
        @kat_news << News.find(tagging.target_id)
    end
    @page = params[:page] ? params[:page].to_i : 1
    per_page = Strangecms::Newz::Config[:news_per_page]
    @page_count = @kat_news.count / per_page + 1 
    @page_url = News.first.news_site_slug + '/by_kategorie' + @kategorie.slug
    if @kat_news.count > per_page
        @fineline_array_paginated = true
        @news = @kat_news.fine_paginated(@page, per_page) 
    else
        @news = @kat_news
    end
    render 'news/show_by'
  end
  
  private
  
  def load_news_site
    @seite = Seite.where("system_name = ? AND deleted = ?", 'news_site', false).first
  end
  

end
