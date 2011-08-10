# encoding: utf-8
class Admin::UserSettingsController < Admin::BaseController
  # => before_filter :authorized_admin
  
  def index
    @aktivio = 'settings'
    @u_aktiv = 'user_settings'
  end
  
  def show
    @aktivio = 'settings'
    @u_aktiv = 'user_settings'
  end
  
  def edit

  end
  
  def update
      respond_to do |format|
        if Strangecms::User::Config.set(params[:preferences])
          Strangecms::Preferences::UserSettings.init
          format.html { redirect_to admin_user_settings_path, :notice => I18n.t('strange_preferences.settings_updated') }
        else
          format.html { redirect_to admin_user_settings_path, :notice => I18n.t('strange_preferences.updated_error') }
        end
      end
  end

  
  
  
end
