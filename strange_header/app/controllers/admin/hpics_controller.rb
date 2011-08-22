# encoding: utf-8
class Admin::HpicsController < Admin::BaseController
  
  before_filter :load_data
  
  def index
    @hpics = Hpic.all
    @aktivio = 'seiten'
    @sub_aktivio = 'headers'
  end
  
  def new
    @hpic = Hpic.new
  end
  
  def crop
    
    @hpic = Hpic.find(params[:id])
    render :layout => 'fineline_admin_blank'
  end
  
  def edit
    @hpic = Hpic.find(params[:id])
  end
  
  def destroy
    @hpic = Hpic.find(params[:id])
    @hpic.destroy
    respond_to do |format|
      format.html { redirect_to admin_headers_path }
      format.js  { render :nothing => true }
    end
  end
  
  def update
    @hpic = Hpic.find(params[:id])
    respond_to do |format|
      if @hpic.update_attributes(params[:hpic])
        if params[:hpic][:bild].present?
          render :action => 'crop'
        else
          if @header
            format.html { redirect_to(admin_header_path(@header), :notice => t('hpic_was_updated')) }
            format.xml  { head :ok }
          else
            format.html { redirect_to(admin_headers_path, :notice => t('hpic_was_updated')) }
            format.xml  { head :ok }
          end
        end
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @hpic.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def create
    @hpic = Hpic.new(params[:hpic])
    respond_to do |format|
      if @hpic.save
        if @header
          @header.hpics << @hpic
        end
        if params[:hpic][:bild].present?
          format.html { redirect_to( crop_admin_header_hpic_path(@header,@hpic) ) }
        else
            format.html { redirect_to(admin_header_path(@header), :notice => t('hpic_was_created')) }
            format.xml  { render :xml => @hpic, :status => :created, :location => @hpic }
        end
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @hpic.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  
    # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => #
  
  def reorder
    params[:hpic].each_with_index do |id, index|
      Hpic.update_all(['position=?', index+1], ['hpic_id=?', id])
    end
  end
  
  
  def selected
    @hpics = @header.hpics
    respond_to do |format|
      format.html { render 'index.html.erb' }
    end
  end
  
  def select
    @header = Header.find_by_id(params[:header_id])
    @hpic = Hpic.find(params[:id])
    @header.hpics << @hpic
    @header.save
    @hpics = @header.hpics
    render :layout => false
  end
  
  def available

    @available_hpics = Hpic.all
    @available_hpics.delete_if { |hpic| @header.hpics.include?(hpic) }
    respond_to do |format|
      format.html
      format.js {render :layout => false}
    end

  end
  
  def remove
    @killa = HeaderHpic.where("hpic_id = ? AND header_id = ?", params[:id], @header.id)
    @killa.each do |kill|
      kill.destroy
    end
    @hpics = @header.hpics
    respond_to do |format|
      format.html { redirect_to admin_headers_path }
      format.js  { render :nothing => true }
    end
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