# encoding: utf-8
class Admin::HpicsController < Admin::BaseController
  
  include FinestyleHelp
  
  before_filter :load_data
  
  cache_sweeper :header_sweeper
  
  def index
    @hpics = Hpic.all
    
  end
  
  def nested_index
    @hpics = Hpic.all
  end
  
  def new
    @hpic = Hpic.new
  end
  
  def crop
    @hpic = Hpic.find(params[:id])
    if params[:header_hpic_id]
      @header = @header_hpic.header
    elsif params[:header_id]
      @header_hpic = HeaderHpic.where( 'hpic_id = ? AND header_id = ?', @hpic.id, @header.id ).first
    end
    render :layout => 'fineline_admin_blank'
  end
  
  def blowup
    @hpic = Hpic.find(params[:id])
    @extend = true
    if params[:header_hpic_id]
      @header = @header_hpic.header
    elsif params[:header_id]
      @header_hpic = HeaderHpic.where( 'hpic_id = ? AND header_id = ?', @hpic.id, @header.id ).first
    end
    @hpic.this_fade = @header_hpic.fadeit
    @header_hpic.extendit ? @header_hpic.extendit = false : @header_hpic.extendit = true
    @header_hpic.save
    respond_to do |format|
      format.html { render :action => :crop, :layout => 'fineline_admin_blank', :notice => t('hpic_was_blownup') }
      format.js {  }
    end
  end
  
  def cropit
    @hpic = Hpic.find(params[:id])
    if params[:header_hpic_id]
      @header = @header_hpic.header
    elsif params[:header_id]
      @header_hpic = HeaderHpic.where( 'hpic_id = ? AND header_id = ?', @hpic.id, @header.id ).first
    end
    @header_hpic.cropping = params[:hpic][:bild_cropping]
    @header_hpic.h_ratio = params[:hpic][:h_ratio]
    @header_hpic.fadeit = params[:fadeit]
    @header_hpic.save
    if @hpic.bild_cropping.blank? && @hpic.h_ratio.blank? || @hpic.h_ratio == params[:hpic][:h_ratio]
      @hpic.bild_cropping = params[:hpic][:bild_cropping]
      @hpic.h_ratio = params[:hpic][:h_ratio]
      @hpic.save
    end
    expire_cell_state(HeaderCell, :fader, "headers/#{@header.id}")
    expire_cell_state(HeaderCell, :fader_js, "headers/#{@header.id}") 
    expire_action :controller => 'admin/headers', :action => "index"
    expire_action :controller => 'admin/headers', :action => "show", :id => @header_hpic.header.id
    redirect_to(admin_header_path(@header), :notice => t('hpic_was_croped'))
  end
  
  def edit
    @hpic = Hpic.find(params[:id])
  end
  
  def destroy
    @hpic = Hpic.find(params[:id])
    @hpic.destroy
    expire_action :controller => 'admin/headers', :action => "index"
    expire_action :controller => 'admin/headers', :action => "show", :id => @hpic.header.id
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
            expire_action :controller => 'admin/headers', :action => "index"
            expire_action :controller => 'admin/headers', :action => "show", :id => @header.id
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
          expire_action :controller => 'admin/headers', :action => "index"
          expire_action :controller => 'admin/headers', :action => "show", :id => @header.id
          @headerhpic = HeaderHpic.create! :header_id => @header.id, :hpic_id => @hpic.id
        end
        if params[:hpic][:bild].present?
          format.html { redirect_to( crop_admin_header_hpic_hpic_path(@headerhpic,@hpic) ) }
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
    @headerhpic = HeaderHpic.create! :header_id => @header.id, :hpic_id => @hpic.id
    expire_action :controller => 'admin/headers', :action => "index"
    expire_action :controller => 'admin/headers', :action => "show", :id => @header.id
    redirect_to( crop_admin_header_hpic_hpic_path( @headerhpic, @hpic ) )
  end
  
  def available

    @available_hpics = Hpic.all
    # => @available_hpics.delete_if { |hpic| @header.hpics.include?(hpic) }
    respond_to do |format|
      format.html { render :template => 'admin/hpics/index' }
      format.js {render :layout => false}
    end
    
  end
  
  def remove
    if @header_hpic
      @header = @header_hpic.header
      @header_hpic.destroy
      expire_action :controller => 'admin/headers', :action => "index"
      expire_action :controller => 'admin/headers', :action => "show", :id => @header_hpic.header.id
    elsif @header
      @killa = HeaderHpic.where("hpic_id = ? AND header_id = ?", params[:id], @header.id).first
      @killa.destroy
      expire_action :controller => 'admin/headers', :action => "index"
      expire_action :controller => 'admin/headers', :action => "show", :id => @header.id
    end
    respond_to do |format|
      format.html { redirect_to admin_header_path(@header) }
      format.js  { render :nothing => true }
    end
  end

  
  private
    
    def load_data
      @aktivio = 'seiten'
      @sub_aktivio = 'headers'
      if params[:header_id]
        @header = Header.find_by_id(params[:header_id])
      end
      if params[:header_hpic_id]
        @header_hpic = HeaderHpic.find(params[:header_hpic_id])
      end
    end
    
    def render_js_for_destroy
      render :partial => "/admin_shared/destroy"
      flash.notice = nil
    end
end