# encoding: utf-8
class Admin::Settings::HeaderController < Admin::BaseController
  
  def index
    @aktivio = 'settings'
    @u_aktiv = 'header_settings'
    render :template => 'admin/settings/header/index'
  end
  
  def edit
    @aktivio = 'settings'
    @u_aktiv = 'kommentar_settings'
    render :template => 'admin/settings/header/edit'
  end

  
  def update

        if Strangecms::Header::Config.set(params[:preferences])
          
          render :index
        else
          render :edit
        end

  end
  
  
end
