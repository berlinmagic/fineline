# encoding: utf-8
class Admin::FinemailsController < Admin::BaseController
  
  before_filter :get_navi_werte
  
  helper :finemails
  
  def index
    @finemails = Finemail.mail.order(sort_column + ' ' + sort_direction)
    @u_aktiv = 'fineforms_fields'
    @mail_view == 'mail_in'
  end
  
  def show
    @finemail = Finemail.find(params[:id])
  end
  
  def destroy
    @finemail = Finemail.find(params[:id])
    @finemail.destroy
    redirect_to(admin_finemails_path)
  end
  
  private
    def get_navi_werte
      @aktivio = 'finemail'
      @sub_aktivio = 'finemail'
      @u_sub_aktivio = 'finemail'
    end
    
    def sort_column  
      # => Product.column_names.include?(params[:sort]) ? params[:sort] : "name"  
      %w[absender typ sended].include?(params[:sort]) ? params[:sort] : "sended"

    end  

    def sort_direction  
      %w[asc desc].include?(params[:direction]) ?  params[:direction] : "desc"
    end
    
      
  
end

