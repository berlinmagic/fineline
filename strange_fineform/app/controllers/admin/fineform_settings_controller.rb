# encoding: utf-8
class Admin::FineformSettingsController < Admin::BaseController
  
  before_filter :get_navi_werte
  
  def index
    
  end
  
  def edit
    
  end
  
  def update
      respond_to do |format|
        if Strangecms::Fineform::Config.set(params[:preferences])
          flash.now[:notice] = I18n.t('strange_preferences.settings_updated')
          format.html { render :template => "admin/fineform_settings/index" }
        else
          flash.now[:alert] = I18n.t('strange_preferences.updated_error')
          format.html { render :template => "admin/fineform_settings/index" }
        end
      end
  end
  
  
  private
  
    def get_navi_werte
      @aktivio = 'settings'
      @u_aktiv = 'fineform_settings'
    end
  
end
