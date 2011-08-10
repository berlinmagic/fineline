# encoding: utf-8
class Admin::UsersController < Admin::BaseController

  def index
    
    if current_user.evil_master
      @users = User.all
    elsif current_user.site_admin
      @users = User.no_master
    else 
     @users = User.standard
    end
    @aktivio = 'user'
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @seiten }
      format.js { render :index }
      
    end
  end
  
  def new
    @user = User.new
  end


  def create
    @user = User.invite!(params[:user])
    current_inviter = current_user
    if @user.errors.empty?
      set_flash_message :notice, :send_instructions, :email => self.resource.email
      redirect_to after_sign_in_path_for(resource_name)
    else
      render :new
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def bild_upload
    @user = User.find(params[:id])
  end
  
  def pic_up
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    render :action => 'crop'
  end
  
  def croped
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    redirect_to admin_user_path(@user)
  end
  
  def crop
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
      
  end
  
  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user])
        if params[:user][:bild].present?
          render :action => 'crop'
        else
          redirect_to(admin_users_path, :notice => t('user_was_updated')) 
        end
      else
        render :action => "edit" 
      end
    end
  end
  
  def show
    @user = User.find(params[:id])
    
  end

end
