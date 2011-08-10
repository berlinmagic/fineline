# encoding: utf-8
class Admin::KontaktformSettingsController < Admin::BaseController
  
  def index
    @aktivio = 'settings'
    @u_aktiv = 'kontakt_settings'
  end
  
  def edit
    @aktivio = 'settings'
    @u_aktiv = 'kontakt_settings'
  end
  
  def update
      respond_to do |format|
        if Strangecms::Kontakt::Config.set(params[:preferences])
          flash.now[:notice] = I18n.t('strange_preferences.settings_updated')
          format.html { render :template => "admin/kontaktform_settings/index" }
        else
          flash.now[:alert] = I18n.t('strange_preferences.updated_error')
          format.html { render :template => "admin/kontaktform_settings/index" }
        end
      end
  end
  
end
