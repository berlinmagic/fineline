# encoding: utf-8
Admin::TagsController.class_eval do
  
  before_filter :load_bild
  
  helper :bilder
  
  def load_bild
    if params[:bild_id]
      @bild = Bild.find(params[:bild_id])
    end
  end
  
  def available_bild_tags
    @available_tags = Tag.all
    if @bild
      @available_tags.delete_if { |tag| @bild.tags.include?(tag) }
    end
    respond_to do |format|
      format.html { render :template => "admin/bilder/available_tags" }
      format.js { render :template => "admin/bilder/available_tags" }
    end
  end
  
  def select_bild_tags
    @tag = Tag.find(params[:id])
    @data_helpa = @bild
    @data_helpa.tags << @tag
    @data_helpa.save
    @tags = @data_helpa.tags
    @available_tags = Tag.all
    @available_tags.delete_if { |tag| @tags.include?(tag) }
    respond_to do |format|
      format.js { render :template => "admin/bilder/select_tag" }
    end
  end
  
  
end