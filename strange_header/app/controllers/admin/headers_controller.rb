# encoding: utf-8
class Admin::HeadersController < Admin::BaseController
  
  def index
    if Header.all.count > 1
      @headers = Header.all
    else
      @aktivio = 'seiten'
      @sub_aktivio = 'headers'
      @header = Header.find_by_name('Standard_Header')
      render :template => 'admin/headers/show'
    end
  end
  
  def new
    @aktivio = 'seiten'
    @sub_aktivio = 'headers'
    @u_aktiv = "new"
    @header = Header.new
  end
  
  def edit
    @aktivio = 'seiten'
    @sub_aktivio = 'headers'
    @u_aktiv = "edit"
    @header = Header.find(params[:id])
  end
  
  def show
    @aktivio = 'seiten'
    @sub_aktivio = 'headers'
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
    @seite = Seite.find(params[:form][:seite])
    @header.seiten << @seite
    redirect_to admin_header_path(@header)
  end
  
  def destroy
    @header = Header.find(params[:id])
    @header.destroy
    redirect_to admin_headers_path
  end
  
  
end