# encoding: utf-8
class Admin::HeadersController < Admin::BaseController
  
  include FinestyleHelp
  
  before_filter :get_navi_werte
  
  def index
    if Header.all.count > 1
      @headers = Header.all
      @u_aktiv = "index"
      render :template => 'admin/headers/index'
    else
      @u_aktiv = "show"
      @header = Header.find_by_name('Standard_Header')
      render :template => 'admin/headers/show'
    end
  end
  
  def new
    @u_aktiv = "new"
    @header = Header.new
  end
  
  def edit
    @u_aktiv = "edit"
    @header = Header.find(params[:id])
  end
  
  def show
    @u_aktiv = "show"
    if params[:id]
      @header = Header.find(params[:id])
    else
      @header = Header.find_by_name('Standard_Header')
    end
  end
  
  def create
    @header = Header.new(params[:header])
    respond_to do |format|
      if @header.save
        format.html { redirect_to(admin_headers_path, :notice => t('header_was_created')) }
        format.xml  { render :xml => @header, :status => :created, :location => @header }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @header.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def update
    @header = Header.find(params[:id])
    respond_to do |format|
      if @header.update_attributes(params[:header])
        format.html { redirect_to(admin_headers_path, :notice => t('header_was_updated')) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @header.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def change_header
    @new_header = Header.find_by_id(params[:id])
    redirect_to admin_header_path(@new_header)
  end
  
  def add_site
    @header = Header.find(params[:form][:header])
    if params[:form][:seite] && !params[:form][:seite].blank?
      if @seite = Seite.find(params[:form][:seite])
        @header.seiten << @seite
      end
    end
    redirect_to admin_header_path(@header)
  end
  
  def destroy
    @header = Header.find(params[:id])
    @header.destroy
    redirect_to admin_headers_path
  end
  
  def remove_site
    @seite = Seite.find(params[:seite_id])
    @header = Header.find(params[:id])

    @killa = HeaderSeite.where("seite_id = ? AND header_id = ?", @seite.id, @header.id)
    @killa.each do |kill|
      kill.destroy
    end
    redirect_to admin_header_path(@header), :notice => t('header_seite_was_deleted', :name => @seite.name)
  end
  
  def get_navi_werte
    @aktivio = 'seiten'
    @sub_aktivio = 'headers'
  end
  
end