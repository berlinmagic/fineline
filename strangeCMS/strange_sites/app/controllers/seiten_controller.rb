# encoding: utf-8
class SeitenController < ApplicationController
  def index
    redirect_to root_url 
  end

  def show
    @seite = Seite.find_by_slug(params[:id]) || Seite.find_by_name(params[:id]) || Seite.find_by_std_slug(params[:id]) || Seite.find(params[:id])
    @title = @seite.titel
    
    respond_to do |format|
      format.html { render 'base/seite'}# show.html.erb
      format.xml  { render :xml => @seite }
    end
  end

  def edit
    @seite = Seite.find_by_slug(params[:id]) || Seite.find_by_name(params[:id]) || Seite.find_by_std_slug(params[:id]) || Seite.find_by_id(params[:id])
    @aktion = 'edit'
    render :template => 'seiten/form'
  end

  def new
    @seite = Seite.new
    @aktion = 'new'
    render :template => 'seiten/form'
  end
  
  def create
    @seite = Seite.new(params[:seite])
    @go_on = false
    if params[:commit] == I18n.t('speichern_und_beenden')
      @go_on = false
    end
    if params[:commit] == I18n.t('speichern_und_weiter')
      @go_on = true
    end
    respond_to do |format|
      if @seite.save
        @aktion = 'update'
        format.html { 
          if @go_on
            render :template => 'seiten/form'
          else
            redirect_to( "#{@seite.link}", :notice => I18n.t('seite_wurde_erstellt', :name => @seite.name) )
          end }
        format.xml  { render :xml => @seite, :status => :created, :location => @seite }
      else
        @aktion = 'new'
        format.html { render :template => 'seiten/form' }
        format.xml  { render :xml => @seite.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @aktion = 'edit'
    @seite = Seite.find_by_slug(params[:id]) || Seite.find_by_name(params[:id]) || Seite.find_by_std_slug(params[:id]) || Seite.find(params[:id]) || Seite.find_by_id(params[:id])
    @go_on = false
    if params[:commit] == I18n.t('speichern_und_beenden')
      @go_on = false
    end
    if params[:commit] == I18n.t('speichern_und_weiter')
      @go_on = true
    end
    respond_to do |format|
      if @seite.update_attributes(params[:seite])
        
        format.html { 
          if @go_on
            render :template => 'seiten/form'
          else
            redirect_to( "#{@seite.link}", :notice => I18n.t('seite_wurde_geaendert', :name => @seite.name) )
          end }
        format.xml  { head :ok }
      else
        format.html { render :template => 'seiten/form' }
        format.xml  { render :xml => @seite.errors, :status => :unprocessable_entity }
      end
    end
  end
  


end
