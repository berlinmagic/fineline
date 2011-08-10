# encoding: utf-8
class Admin::FineformsController < Admin::BaseController
  
  skip_before_filter :verify_authenticity_token, :only => [:reorder_fields, :reorder_set_fields, :reorder_fieldsets]
  
  before_filter :get_navi_werte
  
  def index
    @fineforms = Fineform.all
    @u_aktiv = 'fineforms'
  end
  
  def new
    @u_aktiv = "ff_new"
    @fineform = Fineform.new
  end
  
  def edit
    @u_aktiv = "edit"
    @fineform = Fineform.find(params[:id])
  end
  
  def show
    @fineform = Fineform.find(params[:id])
  end
  
  def create
    @fineform = Fineform.new(params[:fineform])
    if @fineform.save
      redirect_to(admin_fineforms_path, :notice => t('fineform_was_created')) 
    else
      render :action => "new"
    end
  end
  
  def update
    @fineform = Fineform.find(params[:id])
    if @fineform.update_attributes(params[:fineform])
      redirect_to(admin_fineforms_path, :notice => t('fineform_was_updated'))
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @fineform = Fineform.find(params[:id])
    @fineform.destroy
    redirect_to(admin_fineforms_path)
  end
  
  def new_field
    @fineform = Fineform.find(params[:id])
    @feld = FineformField.new(params[:field])
    @feld.save
  end
  
  def new_fieldset_field
    @fineform = Fineform.find(params[:id])
    @fineform_fieldset = FineformFieldset.find(params[:fineform_fieldset])
    @feld = FineformField.new(params[:field])
    @feld.save
  end
  
  def reorder_fields
    params[:fineform_field].each_with_index do |id, index|
      FineformField.update_all(['position=?', index+1], ['id=?', id])
    end
    render :nothing => true
  end
  
  def reorder_set_fields
    params[:fineform_field].each_with_index do |id, index|
      FineformField.update_all(['position=?', index+1], ['id=?', id])
    end
    render :nothing => true
  end
  
  def reorder_fieldsets
    params[:fineform_fieldset].each_with_index do |id, index|
      FineformFieldset.update_all(['position=?', index+1], ['id=?', id])
    end
    render :nothing => true
  end
  
  private
    def get_navi_werte
      @aktivio = 'module'
      @sub_aktivio = 'fineform'
      @u_sub_aktivio = 'fineform'
    end
  
end

