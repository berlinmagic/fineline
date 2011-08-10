# encoding: utf-8
class KontaktFormulareController < ApplicationController


  # GET /kontakt_formulare/new
  # GET /kontakt_formulare/new.xml
  def new
    @kontakt_formular = KontaktFormular.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @kontakt_formular }
      format.js
    end
  end



  # POST /kontakt_formulare
  # POST /kontakt_formulare.xml
  def create
    @kontakt_formular = KontaktFormular.new(params[:kontakt_formular])
    @kontakt_formular.user_ip = request.remote_ip
    @kontakt_formular.neu = true

    respond_to do |format|
      if @kontakt_formular.save
        KontaktMailer.kontakt_mail(@kontakt_formular).deliver
        KontaktMailer.thankyou_mail(@kontakt_formular).deliver
        format.html { redirect_to( root_path, :notice => 'Kontakt formular was successfully created.') }
        format.xml  { render :xml => @kontakt_formular, :status => :created, :location => @kontakt_formular }
        format.js { render 'success' }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @kontakt_formular.errors, :status => :unprocessable_entity }
        format.js 
      end
    end
  end

end
