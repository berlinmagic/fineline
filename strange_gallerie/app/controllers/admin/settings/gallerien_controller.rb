# encoding: utf-8
class Admin::Settings::GallerienController < Admin::BaseController
  
  
  def index
    @aktivio = 'settings'
    @u_aktiv = 'gallerie_settings'
    render :template => 'admin/settings/gallerien/index'
  end
  
  def edit
    @aktivio = 'settings'
    @u_aktiv = 'gallerie_settings'
    render :template => 'admin/settings/gallerien/edit'
  end

  
  def update

        if Strangecms::Gallerie::Config.set(params[:preferences])
          flash.now[:notice] = I18n.t('strange_preferences.settings_updated')
          render :index
        else
          flash.now[:alert] = I18n.t('strange_preferences.updated_error')
          render :edit
        end

  end
  

  
end
