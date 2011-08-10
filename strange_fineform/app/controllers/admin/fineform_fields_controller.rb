# encoding: utf-8
class Admin::FineformFieldsController < Admin::BaseController
  
  before_filter :get_navi_werte
  
  def index
    @fineform_fields = FineformField.all
    @u_aktiv = 'fineforms_fields'
  end
  
  def new
    @u_aktiv = "ff_new"
    @fineform_field = FineformField.new
  end
  
  def edit
    @u_aktiv = "edit"
    @fineform_field = FineformField.find(params[:id])
  end
  
  def show
    @fineform_field = FineformField.find(params[:id])
  end
  
  def create
    @fineform_field = FineformField.new(params[:fineform_field])
    if @fineform_field.save
      if @fineform
        redirect_to(admin_fineform_path(@fineform), :notice => t('fineform_field_was_created'))
      else
        redirect_to(admin_fineforms_path, :notice => t('fineform_field_was_created'))
      end
    else
      render :action => "new"
    end
  end
  
  def update
    @fineform_field = FineformField.find(params[:id])
    if @fineform_field.update_attributes(params[:fineform_field])
      if @fineform
        redirect_to(admin_fineform_path(@fineform), :notice => t('fineform_field_was_updated'))
      else
        redirect_to(admin_fineforms_path, :notice => t('fineform_field_was_updated'))
      end
    else
      render :action => "edit"
    end
  end
  
  def remove
    @wert = FineformField.find(params[:id])
    @wert.destroy
    render :nothing => true
  end
  
  def destroy
    @fineform_field = FineformField.find(params[:id])
    @fineform_field.destroy
    redirect_to(admin_fineform_fields_path)
  end
  
  private
    def get_navi_werte
      if params[:fineform_id]
        @fineform = Fineform.find(params[:fineform_id])
      end
      @aktivio = 'module'
      @sub_aktivio = 'fineform'
      @u_sub_aktivio = 'fineform'
    end
  
end

