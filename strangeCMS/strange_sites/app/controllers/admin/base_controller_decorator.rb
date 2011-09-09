# encoding: utf-8
Admin::BaseController.class_eval do
  
  before_filter :admin_params_loader
  
  include StrangeSitesHelp
  include FinestyleHelp
  
  def dashboard
    @aktivio = 'dashboard'
  end
  
  def module
    @aktivio = 'module'
    @sub_aktivio = 'module'
  end
  
  def edit_text
    @text = Text.find(params[:id])
    render 'admin/seiten/text_edit'
  end
  
  def update_text
    @text = Text.find(params[:text][:id])

    respond_to do |format|
      if @text.update_attributes(params[:text])
        format.html { redirect_to( edit_admin_seite_url @text.abschnitt.seite, :notice => 'Text was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit_text" }
        format.xml  { render :xml => @text.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def admin_params_loader
    @in_admin = true
  end
  
end
