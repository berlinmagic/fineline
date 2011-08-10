# encoding: utf-8
class Admin::NewsSettingsController < Admin::BaseController
  
  before_filter :get_nav_state
  
  def index
    
    render :template => 'admin/news_settings/index'
    
  end
  
  def edit
    
    render :template => 'admin/news_settings/edit'
    
  end
  
  def update
      respond_to do |format|
        if Strangecms::Newz::Config.set(params[:preferences])
          flash.now[:notice] = I18n.t('strange_preferences.settings_updated')
          format.html { render :template => "admin/news_settings/index" }
        else
          flash.now[:alert] = I18n.t('strange_preferences.updated_error')
          format.html { render :template => "admin/news_settings/edit" }
        end
      end
  end
  
  
  private
    
    def get_nav_state
      @aktivio = 'settings'
      @u_aktiv = 'news_settings'
    end
  
end
