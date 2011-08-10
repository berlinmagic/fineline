# encoding: utf-8
class Admin::FineformFieldsetsController < Admin::BaseController
  
  before_filter :get_navi_werte
  
  def index
    @fineform_fieldsetsets = FineformFieldsetset.all
    @u_aktiv = 'fineforms_fieldsets'
  end
  
  def new
    @u_aktiv = "fffs_new"
    @fineform_fieldset = FineformFieldset.new
  end
  
  def edit
    @u_aktiv = "edit"
    @fineform_fieldset = FineformFieldset.find(params[:id])
  end
  
  def show
    @fineform_fieldset = FineformFieldset.find(params[:id])
  end
  
  def create
    @fineform_fieldset = FineformFieldset.new(params[:fineform_fieldset])
    if @fineform_fieldset.save
      if @fineform
        redirect_to(admin_fineform_path(@fineform), :notice => t('fineform_fieldset_was_created'))
      else
        redirect_to(admin_fineforms_path, :notice => t('fineform_fieldset_was_created'))
      end
    else
      render :action => "new"
    end
  end
  
  def update
    @fineform_fieldset = FineformFieldset.find(params[:id])
    if @fineform_fieldset.update_attributes(params[:fineform_fieldset])
      if @fineform
        redirect_to(admin_fineform_path(@fineform), :notice => t('fineform_fieldset_was_updated'))
      else
        redirect_to(admin_fineforms_path, :notice => t('fineform_fieldset_was_updated'))
      end
    else
      render :action => "edit"
    end
  end
  
  def remove
    @wert = FineformFieldset.find(params[:id])
    @wert.destroy
    render :nothing => true
  end
  
  def destroy
    @fineform_fieldset = FineformFieldset.find(params[:id])
    @fineform_fieldset.destroy
    render :nothing => true
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

