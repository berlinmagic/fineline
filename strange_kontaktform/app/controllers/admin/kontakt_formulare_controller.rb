# encoding: utf-8
class Admin::KontaktFormulareController < Admin::BaseController
  
  
  def index
    @kontakt_formulare = KontaktFormular.eingang.order(sort_column + ' ' + sort_direction)
    @aktivio = 'kontakt_formular'
    @u_aktiv = 'All'
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @kontakt_formulare }
    end
  end
  
  def post_eingang
    @kontakt_formulare = KontaktFormular.eingang
    @aktivio = 'kontakt_formular'
    @u_aktiv = 'Posteingang'
    respond_to do |format|
      format.html { render 'admin/kontakt_formulare/index'}
      format.xml  { render :xml => @kontakt_formulare }
    end
  end
  
  def neue_mails
    @kontakt_formulare = KontaktFormular.neu
    @aktivio = 'kontakt_formular'
    @u_aktiv = 'posteingang_neu'
    @mail_view = 'new_mails'
    respond_to do |format|
      format.html { render 'admin/kontakt_formulare/index'}
      format.xml  { render :xml => @kontakt_formulare }
    end
  end
  
  def post_ausgang
    @kontakt_formulare = KontaktFormular.ausgang
    @aktivio = 'kontakt_formular'
    @u_aktiv = 'Postausgang'
    @mail_view = 'mail_out'
    respond_to do |format|
      format.html { render 'admin/kontakt_formulare/index'}
      format.xml  { render :xml => @kontakt_formulare }
    end
  end
  
  def emails
    @mail_view = params[:view]
    unless KontaktFormular::MAIL_TYPES.include?(@mail_view)
      @mail_view = 'mail_in'
    end
    
    if @mail_view == 'mail_in'
      @u_aktiv = 'Posteingang'
      @kontakt_formulare = KontaktFormular.eingang.order(sort_column + ' ' + sort_direction)
    elsif @mail_view == 'mail_out'
      @kontakt_formulare = KontaktFormular.ausgang.order(sort_column + ' ' + sort_direction)
      @u_aktiv = 'Postausgang'
    elsif @mail_view == 'new_mails'
      @kontakt_formulare = KontaktFormular.neu.order(sort_column + ' ' + sort_direction)
      @u_aktiv = 'posteingang_neu'
    elsif @mail_view == 'old_mails'
      @kontakt_formulare = KontaktFormular.gelesen.order(sort_column + ' ' + sort_direction)
      @u_aktiv = 'posteingang_alt'
    else
      @kontakt_formulare = KontaktFormular.all.order(sort_column + ' ' + sort_direction)
      @u_aktiv = 'All'
    end
  
    @aktivio = 'kontakt_formular'
    render 'admin/kontakt_formulare/index'
  end

  # GET /kontakt_formulare/1
  # GET /kontakt_formulare/1.xml
  def show
    @kontakt_formular = KontaktFormular.find(params[:id])
    @aktivio = 'kontakt_formular'
    @kontakt_formular.neu = false
    @kontakt_formular.save
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @kontakt_formular }
    end
  end

  # GET /kontakt_formulare/new
  # GET /kontakt_formulare/new.xml
  def new
    @kontakt_formular = KontaktFormular.new
    @aktivio = 'kontakt_formular'
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @kontakt_formular }
    end
  end
  
  def antwort
    @kontakt_formular = KontaktFormular.new
    @aktivio = 'kontakt_formular'
    @old_formular = KontaktFormular.find(params[:id])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @kontakt_formular }
    end
  end

  # GET /kontakt_formulare/1/edit
  def edit
    @kontakt_formular = KontaktFormular.find(params[:id])
  end

  # POST /kontakt_formulare
  # POST /kontakt_formulare.xml
  def create
    @kontakt_formular = KontaktFormular.new(params[:kontakt_formular])
    
    @kontakt_formular.user_ip = request.remote_ip
    respond_to do |format|
      if @kontakt_formular.save
        KontaktMailer.antwort_mail(@kontakt_formular).deliver
        @old_formular = KontaktFormular.find_by_id(params[:kontakt_formular][:antwort_auf])
        @old_formular.beantwortet = true
        @old_formular.save
        format.html { redirect_to(admin_kontakt_formulare_path, :notice => 'Kontakt formular was successfully created.') }
        format.xml  { render :xml => @kontakt_formular, :status => :created, :location => @kontakt_formular }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @kontakt_formular.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /kontakt_formulare/1
  # PUT /kontakt_formulare/1.xml
  def update
    @kontakt_formular = KontaktFormular.find(params[:id])

    respond_to do |format|
      if @kontakt_formular.update_attributes(params[:kontakt_formular])
        format.html { redirect_to(@kontakt_formular, :notice => 'Kontakt formular was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @kontakt_formular.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /kontakt_formulare/1
  # DELETE /kontakt_formulare/1.xml
  def destroy
    @kontakt_formular = KontaktFormular.find(params[:id])
    @kontakt_formular.destroy

    respond_to do |format|
      format.html { redirect_to(kontakt_formulare_url) }
      format.xml  { head :ok }
    end
  end
  
  
  private
  
    def sort_column  
      # => Product.column_names.include?(params[:sort]) ? params[:sort] : "name"  
      %w[email betreff created_at].include?(params[:sort]) ? params[:sort] : "created_at"
       
    end  
    
    def sort_direction  
      %w[asc desc].include?(params[:direction]) ?  params[:direction] : "desc"
    end

end
