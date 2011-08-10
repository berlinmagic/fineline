# encoding: utf-8
Admin::TagsController.class_eval do
  
  before_filter :load_news
  
  def load_news
    if params[:news_id]
      @news = News.find(params[:news_id])
    end
  end
  
  def available_news_tags
    @available_tags = Tag.all
    if @news
      @available_tags.delete_if { |tag| @news.tags.include?(tag) }
    end
    respond_to do |format|
      format.html { render :template => "admin/news/available_tags" }
      format.js { render :template => "admin/news/available_tags" }
    end
  end
  
  def select_news_tags
    @tag = Tag.find(params[:id])
    @data_helpa = @news
    @data_helpa.tags << @tag
    @data_helpa.save
    @tags = @data_helpa.tags
    @available_tags = Tag.all
    @available_tags.delete_if { |tag| @tags.include?(tag) }
    respond_to do |format|
      format.js { render :template => "admin/news/select_tag" }
    end
  end
  
  
end