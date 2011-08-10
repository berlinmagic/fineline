# encoding: utf-8
class Admin::HeaderPicsController < Admin::BaseController
  
  before_filter :load_data
  
  def index
    @header_pics = HeaderPic.all
    @aktivio = 'seiten'
    @sub_aktivio = 'headers'
  end
  
  def new
    @header_pic = HeaderPic.new
  end
  
  def crop
    @header_pic = HeaderPic.find(params[:id])
  end
  
  def edit
    @header_pic = HeaderPic.find(params[:id])
  end
  
  def destroy
    @header_pic = HeaderPic.find(params[:id])
    @header_pic.destroy
    render :nothing => true
  end
  
  def update
    @header_pic = HeaderPic.find(params[:id])
    respond_to do |format|
      if @header_pic.update_attributes(params[:header_pic])
        if params[:header_pic][:bild].present?
          render :action => 'crop'
        else
          if @header
            format.html { redirect_to(admin_header_path(@header), :notice => t('header_pic_was_updated')) }
            format.xml  { head :ok }
          else
            format.html { redirect_to(admin_headers_path, :notice => t('header_pic_was_updated')) }
            format.xml  { head :ok }
          end
        end
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @header_pic.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def create
    @header_pic = HeaderPic.new(params[:header_pic])
    respond_to do |format|
      if @header_pic.save
        if params[:header_pic][:bild].present?
          format.html { redirect_to( crop_admin_header_header_pic_path(@header,@header_pic) ) }
        else
            format.html { redirect_to(admin_header_path(@header), :notice => t('header_pic_was_created')) }
            format.xml  { render :xml => @header_pic, :status => :created, :location => @header_pic }
        end
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @header_pic.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  
    # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => #
  
  def reorder
    params[:header_pic].each_with_index do |id, index|
      HeaderPic.update_all(['position=?', index+1], ['header_pic_id=?', id])
    end
  end
  
  
  def selected
    @header_pics = @header.header_pics
    respond_to do |format|
      format.html { render 'index.html.erb' }
    end
  end
  
  def select
    @header = Header.find_by_id(params[:header_id])
    @header_pic = HeaderPic.find(params[:id])
    @header.header_pics << @header_pic
    @header.save
    @header_pics = @header.header_pics
    render :layout => false
  end
  
  def available

    @available_header_pics = HeaderPic.all
    @available_header_pics.delete_if { |header_pic| @header.header_pics.include?(header_pic) }
    respond_to do |format|
      format.html
      format.js {render :layout => false}
    end

  end
  
  def remove
    @killa = HeaderPic.where("id = ?", params[:id])
    @killa.each do |kill|
      kill.destroy
    end
    @header_pics = @header.header_pics
    render_js_for_destroy
  end

  
  private
    
    def load_data
      if params[:header_id]
        @header = Header.find_by_id(params[:header_id])
      end
    end
    
    def render_js_for_destroy
      render :partial => "/admin_shared/destroy"
      flash.notice = nil
    end
end