# encoding: utf-8
class SeitenController < ApplicationController
  
  include FinestyleHelp
  
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
    unless admin_check
      redirect_to(root_path, :flash => { :error => I18n.t('admin_rechte_erforderlich') })
    else
      render :template => 'seiten/form'
    end
  end

  def new
    @seite = Seite.new
    @aktion = 'new'
    unless admin_check
      redirect_to(root_path, :flash => { :error => I18n.t('admin_rechte_erforderlich') })
    else
      render :template => 'seiten/form'
    end
  end
  
  def create
    @seite = Seite.new(params[:seite])
    unless admin_check
      redirect_to(root_path, :flash => { :error => I18n.t('admin_rechte_erforderlich') })
    else
      respond_to do |format|
        if @seite.save
          @aktion = 'update'
          format.html { redirect_to( "#{@seite.link}", :notice => I18n.t('seite_wurde_erstellt', :name => @seite.name) ) }
          format.xml  { render :xml => @seite, :status => :created, :location => @seite }
        else
          @aktion = 'new'
          format.html { render :template => 'seiten/form' }
          format.xml  { render :xml => @seite.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  def update
    @aktion = 'edit'
    @seite = Seite.find_by_slug(params[:id]) || Seite.find_by_name(params[:id]) || Seite.find_by_std_slug(params[:id]) || Seite.find(params[:id]) || Seite.find_by_id(params[:id])
    unless admin_check
      redirect_to(root_path, :flash => { :error => I18n.t('admin_rechte_erforderlich') })
    else
      respond_to do |format|
        if @seite.update_attributes(params[:seite])
          format.html { redirect_to( "#{@seite.link}", :notice => I18n.t('seite_wurde_geaendert', :name => @seite.name) ) }
          format.xml  { head :ok }
        else
          format.html { render :template => 'seiten/form' }
          format.xml  { render :xml => @seite.errors, :status => :unprocessable_entity }
        end
      end
    end
  end
  


end
