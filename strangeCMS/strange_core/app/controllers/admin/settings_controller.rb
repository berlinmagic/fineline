# encoding: utf-8
class Admin::SettingsController < Admin::BaseController
  before_filter :load_strange_setting_names
  

  def index
    @u_aktiv = 'settings'
  end
  
  def show
    @name = params[:name] || params[:id]
    if @setting_names.include?(@name)
      @u_aktiv = @name
      if @name == 'user'
        @owners = User.where(:crew => 'owner')
      end
      render "admin/settings/#{@name}"
    else
      flash.now[:alert] = I18n.t('strange_preferences.parameter_error')
      render :index
    end
  end
  
  def info
  end
  
  def edit
    @name = params[:name] || params[:id]
    if @setting_names.include?(@name)
      @u_aktiv = @name
      render :template => "admin/settings/#{@name}_edit"
    else
      flash.now[:alert] = I18n.t('strange_preferences.parameter_error')
      render :index
    end
  end
  
  def update
    @name = params[:name] || params[:id]
    @params = params
    if @setting_names.include?(@name)
      @u_aktiv = @name
      respond_to do |format|
        if Strangecms::Config.set(params[:preferences])
          Strangecms::Preferences::MailSettings.init if (@name == 'mail') || (@name == 'cms')
          FileUtils.touch "#{Rails.root}/tmp/restart.txt" if (@name == 'optik')
          flash.now[:notice] = I18n.t('strange_preferences.settings_updated')
          format.html { render :template => "admin/settings/#{@name}" }
        else
          flash.now[:alert] = I18n.t('strange_preferences.updated_error')
          format.html { render :template => "admin/settings/#{@name}" }
        end
      end
    else
      flash.now[:alert] = I18n.t('strange_preferences.parameter_error')
      render :index
    end
  end
  
  def load_strange_setting_names
    # @setting_names = ["cms", "account", "kontakt", "mail", "optik", "user"]
    @setting_names = ["cms", "account", "mail", "optik", "user"]
    @aktivio = 'settings'
  end
  
  
  
end
