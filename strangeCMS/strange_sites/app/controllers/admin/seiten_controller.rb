# encoding: utf-8
class Admin::SeitenController < Admin::BaseController
  
  skip_before_filter :verify_authenticity_token, :only => [:reorder, :abschnitt_reorder]

  def index
    if params[:show]
      show = params[:show]
      if show == 'papierkorb'
        @seiten = Seite.deleted
        @u_aktiv = 'papierkorb'
      elsif show == 'entwurf'
        @seiten = Seite.entwurf
        @u_aktiv = 'entwurf'
      else
        @seiten = Seite.aktiv
        @u_aktiv = 'aktiv'
      end
    else
      @seiten = Seite.aktiv.main
      @u_aktiv = 'aktiv'
    end
    @aktivio = 'seiten'
    @sub_aktivio = 'seiten'
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @seiten }
    end
  end


  def show
    @seite = Seite.find_by_name(params[:id]) || Seite.find_by_slug(params[:id]) ||  Seite.find_by_std_slug(params[:id]) || Seite.find(params[:id])
    @title = @seite.titel
    @aktivio = 'seiten'
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @seite }
    end
  end

  def new
    @seite = Seite.new
    @aktivio = 'seiten'
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @seite }
    end
  end

  def edit
    @seite = Seite.find_by_name(params[:id]) || Seite.find_by_slug(params[:id]) ||  Seite.find_by_std_slug(params[:id]) || Seite.find(params[:id])
    @abschnitte = @seite.abschnitte.all
    @site =  @seite.to_yaml.to_s
  end

  def create
    @seite = Seite.new(params[:seite])
    respond_to do |format|
      if @seite.save
        format.html { redirect_to( admin_seiten_path, :notice => I18n.t('seite_wurde_erstellt') ) }
        format.xml  { render :xml => @seite, :status => :created, :location => @seite }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @seite.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @seite = Seite.find_by_name(params[:id]) || Seite.find_by_slug(params[:id]) ||  Seite.find_by_std_slug(params[:id]) || Seite.find(params[:id])


      respond_to do |format|
        if @seite.update_attributes(params[:seite])
            format.html { redirect_to( admin_seiten_path, :notice => I18n.t('seite_wurde_geaendert') ) }
            format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @seite.errors, :status => :unprocessable_entity }
        end
      end

  end

  def destroy
    @seite = Seite.find_by_name(params[:id]) || Seite.find_by_slug(params[:id]) ||  Seite.find_by_std_slug(params[:id]) || Seite.find(params[:id])
    @seite.deleted = true
    @seite.save
    respond_to do |format|
      format.html { redirect_to( admin_seiten_path ) }
      format.xml  { head :ok }
    end
  end
  
  def restore
    @seite = Seite.find_by_name(params[:id]) || Seite.find_by_slug(params[:id]) ||  Seite.find_by_std_slug(params[:id]) || Seite.find(params[:id])
    @seite.deleted = false
    @seite.save
    respond_to do |format|
      format.html { redirect_to( admin_seiten_path ) }
      format.xml  { head :ok }
    end
  end
  
  def kill
    @seite = Seite.find_by_name(params[:id]) || Seite.find_by_slug(params[:id]) ||  Seite.find_by_std_slug(params[:id]) || Seite.find(params[:id])
    unless @seite.system_seite
      @seite.destroy
      respond_to do |format|
        format.html { redirect_to( admin_seiten_path ) }
        format.xml  { head :ok }
      end
    else
      redirect_to( admin_seiten_path, :notice => I18n.t('systemseiten_koennen_nicht_geloescht_werden') )
    end
  end
  
  def pic_K_form
    
  end
  
  
  def reorder
    params[:seite].each_with_index do |id, index|
      Seite.update_all(['position=?', index+1], ['id=?', id])
    end
    render :nothing => true
  end
  
  def abschnitt_reorder
    params[:abschnitt].each_with_index do |id, index|
      Abschnitt.update_all(['position=?', index+1], ['id=?', id])
    end
    render :nothing => true
  end
  
end