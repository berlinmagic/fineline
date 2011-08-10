# encoding: utf-8
class KommentareController < ApplicationController
  

  before_filter :load_data
  
  def index
    @kommentare = Kommentar.all
    @u_aktiv = 'bilder'
  end
  
  def new
    @u_aktiv = "new"
    @kommentar = Kommentar.new
  end
  
  
  # => def create
  # =>   @kommentar = Kommentar.new(params[:kommentar])
  # =>   @kommentar.user_ip = request.remote_ip
  # =>   if @kommentar.save
  # =>     
  # =>     if params[:kommentar][:back_url]
  # =>       redirect_to(params[:kommentar][:back_url], :notice => t('Kommentar_was_created'))
  # =>     else
  # =>       redirect_to(admin_kommentare_path, :notice => t('Kommentar_was_created')) 
  # =>     end
  # => 
  # =>   else
  # =>     if params[:kommentar][:back_url]
  # =>       redirect_to(params[:kommentar][:back_url], :notice => t('Kommentar_fehlerhaft'))
  # =>     else
  # =>       render :action => "new"
  # =>     end
  # =>     
  # =>   end
  # => end
  
  def create
    @kommentar = Kommentar.new(params[:kommentar])
    @this_target = params[:kommentar][:target_type]
    @this_id = params[:kommentar][:target_id]
    @this_back_url = params[:kommentar][:back_url]
    if params[:kommentar][:target_type] == 'News'
      @this_target_thing = News.find(params[:kommentar][:target_id])
    end
    @kommentar.user_ip = request.remote_ip
    respond_to do |format|
      if @kommentar.save
        
        format.html { 
          if params[:kommentar][:back_url]
            redirect_to(params[:kommentar][:back_url], :notice => t('Kommentar_was_created'))
          else
            redirect_to(admin_kommentare_path, :notice => t('Kommentar_was_created')) 
          end
        }
        format.xml  { render :xml => @kommentar, :status => :created, :location => @kommentar }
        format.js { 
          
          @kommentar = Kommentar.new
          render 'success' 
          }
      else
        format.html { 
          if params[:kommentar][:back_url]
            redirect_to(params[:kommentar][:back_url], :notice => t('Kommentar_fehlerhaft'))
          else
            render :action => "new"
          end
        }
        format.xml  { render :xml => @kommentar.errors, :status => :unprocessable_entity }
        format.js { render :action => "new" }
      end
    end
  end
  
  
  
  def update
    @kommentar = Kommentar.find(params[:id])
    @this_target = @kommentar.target_type
    @this_id = @kommentar.target_id
    @this_back_url = params[:kommentar][:back_url]
    if @kommentar.target_type == 'News'
      @this_target_thing = News.find(@kommentar.target_id)
    end
    if @kommentar.update_attributes(params[:kommentar])
      respond_to do |format|
        format.html { 
          if params[:kommentar][:back_url]
            redirect_to(params[:kommentar][:back_url], :notice => t('Kommentar_was_created'))
          else
            redirect_to(root_path, :notice => t('Kommentar_was_created')) 
          end
        }
        format.xml  { render :xml => @kommentar, :status => :updated, :location => @kommentar}
        format.js { }
      end
    else
      format.html { 
        if params[:kommentar][:back_url]
          redirect_to(params[:kommentar][:back_url], :notice => t('Kommentar_fehlerhaft'))
        else
          render :action => "edit"
        end
      }
      format.xml  { render :xml => @kommentar, :status => :updated, :location => @kommentar}
      format.js { }
    end
  end
  
  
  def destroy
    @kommentar = Kommentar.find(params[:id])
    @kommentar.destroy
    render :nothing => true
  end
  
  def remove
    @kommentar = Kommentar.find(params[:id])
    @kommentar.destroy
    render :nothing => true
  end
  

  

  
  private
    
    def load_data
      if params[:gallerie_id]
        @gallerie = Gallerie.find_by_id(params[:gallerie_id])
      elsif params[:bild_kategorie_id]
        @bild_kategorie = BildKategorie.find_by_id(params[:bild_kategorie_id])
      elsif params[:tag_id]
        @tag = Tag.find(params[:tag_id])
      end
    end
    
    def render_js_for_destroy
      render :partial => "/admin/shared/destroy_item"
    end
  
  
end