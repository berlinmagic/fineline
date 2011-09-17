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
  
  
  def new_pref_pic
    @prefs     = params[:prefs]
    @name      = params[:name]
    @key       = params[:key]
    @typ       = params[:typ]
    @back_link = params[:back_link]
    @modul     = params[:modul]
    @datei = Datei.new()
    render :template => 'admin/settings/pref_pic_form'
  end
  
  def edit_pref_pic
    @prefs     = params[:prefs]
    @name      = params[:name]
    @key       = params[:key]
    @typ       = params[:typ]
    @back_link = params[:back_link]
    @modul     = params[:modul]
    render :template => 'admin/settings/pref_pic_form'
  end
  
  def update_pref_pic
    @prefs     = params[:prefs]
    @key       = params[:key]
    @typ       = params[:typ]
    @back_link = params[:back_link]
    @datei = Datei.new( params[:datei] )
    @datei.save
    if !@prefs.blank?
      "Strangecms::#{@prefs.classify.constantize}::Config".classify.constantize.set(@key => @datei.id)
    else
      Strangecms::Config.set(@key => @datei.id)
    end
    redirect_to @back_link
  end
  
end
