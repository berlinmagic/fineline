# encoding: utf-8
class Admin::GallerieSettingsController < Admin::BaseController
  
  def index
    @aktivio = 'settings'
    @u_aktiv = 'gallerie_settings'
  end
  
  def edit
    @aktivio = 'settings'
    @u_aktiv = 'gallerie_settings'
  end
  
  def update
      respond_to do |format|
        if Strangecms::Gallerie::Config.set(params[:preferences])
          flash.now[:notice] = I18n.t('strange_preferences.settings_updated')
          format.html { render :template => "admin/gallerie_settings/index" }
        else
          flash.now[:alert] = I18n.t('strange_preferences.updated_error')
          format.html { render :template => "admin/gallerie_settings/index" }
        end
      end
  end
  
end
