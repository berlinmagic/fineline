# encoding: utf-8
class Admin::KommentarSettingsController < Admin::BaseController
  
  def index
    @aktivio = 'settings'
    @u_aktiv = 'kommentar_settings'
    render :template => 'admin/kommentar_settings/index'
  end
  
  def edit
    @aktivio = 'settings'
    @u_aktiv = 'kommentar_settings'
    render :template => 'admin/kommentar_settings/edit'
  end

  
  def update

        if Strangecms::Kommenta::Config.set(params[:preferences])
          
          redirect_to "admin/settings/kommentare/index"
        else
          render :template => "admin/settings/kommentare/edit" 
        end

  end
  
  def create

        if Strangecms::Kommenta::Config.set(params[:preferences])
          
          redirect_to "admin/settings/kommentare/index"
        else
          render :template => "admin/settings/kommentare/edit" 
        end

  end
  
  def set

        if Strangecms::Kommenta::Config.set(params[:preferences])
          
          redirect_to "admin/settings/kommentare/index"
        else
          render :template => "admin/settings/kommentare/edit" 
        end

  end
  
end
