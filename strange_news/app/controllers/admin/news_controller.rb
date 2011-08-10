# encoding: utf-8
class Admin::NewsController < Admin::BaseController

  before_filter :get_navi_werte
  
  
  def index
    @news = News.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @news }
    end
  end

  def show
    @news = News.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @news }
    end
  end

  def new
    @news = News.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @news }
    end
  end

  def edit
    @news = News.find(params[:id])
  end

  def create
    @news = News.new(params[:news])
    @news.user_id = current_user.id
    @news.autor = current_user.id unless @news.autor && @news.autor != ''
    respond_to do |format|
      if @news.save
        format.html { redirect_to(admin_news_index_path, :notice => 'News was successfully created.') }
        format.xml  { render :xml => admin_news_index_path, :status => :created, :location => @news }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @news.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @news = News.find(params[:id])
    respond_to do |format|
      if @news.update_attributes(params[:news])
        format.html { redirect_to(admin_news_index_path, :notice => 'News was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @news.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @news = News.find(params[:id])
    @news.destroy
    respond_to do |format|
      format.html { redirect_to(news_index_url) }
      format.xml  { head :ok }
    end
  end
  
  def new_tag
    @news = News.find(params[:id])
    tag_name = params[:new_tag_name]
    @tag = Tag.new(:name => tag_name)
    if @tag.save
      @news.tags << @tag
    else 
      if @existing_Tag = Tag.find_by_name(params[:new_tag_name].to_s.strip.downcase.titleize)
        @news.tags << @existing_Tag
      end
    end
    @tags = @news.tags
    @available_tags = Tag.all
    @available_tags.delete_if { |tag| @news.tags.include?(tag) }
    respond_to do |format|
      format.html { redirect_to "#{@news.news_site_slug}"+@news.slug }
      format.js { render :template => "admin/news/new_tag" }
    end
    
    
  end
  
  def remove
    @news = News.find(params[:id])
    if @kategorie
      @killa = Kat.where("target_id = ? AND target_Type = ? AND kategorie_id = ?", params[:id], 'News', params[:kategorie_id]) 
    elsif @tag
      @killa = Tagging.where("target_id = ? AND target_type = ? AND tag_id = ?", params[:id], 'News', params[:tag_id])
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
      @aktivio = 'news'
      @sub_aktivio = 'news'
      #@u_sub_aktivio = 'news'
    end
end
