# encoding: utf-8
class Admin::BackupsController < Admin::BaseController
  
  before_filter :get_navi_werte
  
  def index
    if @seite
      @backups = @seite.backups
    else
      @backups = Backup.all
    end
  end
  
  def show
    @backup = Backup.find(params[:id])
  end
  
  def destroy
    @backup = Backup.find(params[:id])
    @backup.destroy
    # => redirect_to(admin_backups_path)
    render :nothing => true
  end
  
  def kill_all
    Backup.all.each do |bkp|
      bkp.destroy
    end
  end
  
  
  
  private
    def get_navi_werte
      @aktivio = 'module'
      @sub_aktivio = 'backup'
      #@u_sub_aktivio = 'gallerie'
    end
  
end