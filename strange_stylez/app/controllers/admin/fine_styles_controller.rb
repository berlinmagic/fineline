# encoding: utf-8
class Admin::FineStylesController < Admin::BaseController

  before_filter :get_navi_werte
  
  
  def index
    @fine_stylez = FineStyle.all
    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
  def initiate
    initor = params[:init]
    path = params[:path]
    # => initor.constantize.init
    
    # vor 3.1.0
    #Rails.application.load_seed
    
    # ab 3.1.0
    Rails.application.load( File.join( StrangeStylez::Engine.config.root, 'lib', 'default_theme_seed.rb' ) )
    
    redirect_to admin_fine_styles_path
  end
  
  def show
    @fine_style = FineStyle.find(params[:id])
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  
  private
    def get_navi_werte
      @aktivio = 'stylez'
      @sub_aktivio = 'stylez'
      #@u_sub_aktivio = 'news'
    end
end
