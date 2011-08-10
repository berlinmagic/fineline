# encoding: utf-8
class Admin::TagsController < Admin::BaseController
  
  before_filter :get_navi_werte
  
  before_filter :load_data
  
  skip_before_filter :verify_authenticity_token, :only => :remove_data_tag
  
  def index
    @tags = Tag.all
    @u_aktiv = 'tags'
  end
  
  def new
    @tag = Tag.new
    @u_aktiv = "tg_new"
  end
  
  def create
    @tag = Tag.new(params[:tag])
    if @tag.save
      redirect_to(admin_tags_path, :notice => t('tag_was_created')) 
    else
      render :action => "new"
    end
  end
  
  def update
    @tag = Tag.find(params[:id])
    if @tag.update_attributes(params[:tag])
      redirect_to(admin_tags_path, :notice => t('tag_was_updated')) 
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to(admin_tags_path)
  end
  
  # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => #
  # =>  =>  =>  Für verschiedene Models:
  # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => #
  
  def new_data_tag
    tag_name = params[:new_tag_name]
    @tag = Tag.new(:name => tag_name)
    if @tag.save
      @data.tags << @tag
    else 
      if @existing_Tag = Tag.find_by_name(params[:new_tag_name].to_s.strip.downcase.titleize)
        @data.tags << @existing_Tag
      end
    end
    @tags = @data.tags
    @available_tags = Tag.all
    @available_tags.delete_if { |tag| @tags.include?(tag) }
  end
  
  def available_data_tags
    @available_tags = Tag.all
    @available_tags.delete_if { |tag| @data.tags.include?(tag) }
  end

  def select_data_tags
    @tag = Tag.find(params[:id])
    @data.tags << @tag
    @data.save
    @tags = @data.tags
    @available_tags = Tag.all
    @available_tags.delete_if { |tag| @tags.include?(tag) }
  end
  
  def remove_data_tag
    @killa = Tagging.where("target_id = ? AND target_type = ? AND tag_id = ?", @objekt_id, @objekt_type, params[:id])
    @killa.each do |kill|
      kill.destroy
    end
    @tags = @data.tags
    @available_tags = Tag.all
    @available_tags.delete_if { |tag| @tags.include?(tag) }
    # => render :nothing => true
  end
  
  def load_data
    @id_muster = /\w+_id/
    params.each do |key,value|
        if @id_muster.match(key)
          @objekt_type = key.gsub('_id', '').classify
          @objekt_id = value
          @data = @objekt_type.constantize.find(@objekt_id)
        end
    end
  end
  
  private
  
    def get_navi_werte
      @aktivio = 'module'
      @sub_aktivio = 'listen'
      @u_sub_aktivio = 'tags'
    end
    
    
    
  
end