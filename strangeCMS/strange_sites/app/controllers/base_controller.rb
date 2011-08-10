# encoding: utf-8
class BaseController < ApplicationController
  
  skip_before_filter :verify_authenticity_token, :only => ['elfinder']
  
  layout proc { |controller| controller.request.xhr? ? false : 'fineline' }
  
  def elfinder_old
    h, r = ElFinder::Connector.new(
      :root => File.join(Rails.public_path, 'uploads'),
      :url => '/uploads',
      :extractors => {
         'application/zip' => ['unzip', '-qq', '-o'], # Each argument will be shellescaped (also true for archivers)
         'application/x-gzip' => ['tar', '-xzf'],
       },
       :archivers => {
         'application/zip' => ['.zip', 'zip', '-qr9'], # Note first argument is archive extension
         'application/x-gzip' => ['.tgz', 'tar', '-czf'],
         }

    ).run(params)
    headers.merge!(h)
    render (r.empty? ? {:nothing => true} : {:text => r.to_json}), :layout => false
  end
  
  def elfinder
    h, r = ElFinder::Connector.new(
      :root => File.join(Rails.public_path, 'uploads'),
      :url => '/uploads'
    ).run(params)

    headers.merge!(h)
    render (r.empty? ? {:nothing => true} : {:text => r.to_json}), :layout => false
  end
  
  def finder
    @aktivio = 'elFinder'
  end
  
  def strange_finder
    render :template => 'base/strange_finder', :layout => false
  end
  
  def link_collection
    @public_dir = root_url
    @pages = Seite.sitemap
    render :template => 'base/link_collection', :layout => false
  end
  
  def linkz
    @public_dir = root_url
    @pages = Seite.sitemap
    render :template => 'base/linkz', :layout => false
  end
  
  def sitemap
    @public_dir = root_url
    @pages = Seite.sitemap
    respond_to do |format|
      format.html {  }
      format.xml { render :layout => false }
      format.text do
        @nav = _build_custom_hash
        render :layout => false
      end
    end
  end
  
  
  def show_seite
      if params[:system_name]
        if @seite = Seite.find( Seite.where(:system_name => params[:system_name]).first().id )
          @title = @seite.titel
          respond_to do |format|
            format.html { render 'base/seite'}
            format.xml  { render :xml => @seite }
          end
        else
         render_seiten_error
        end
      elsif params[:id]
        if @seite = Seite.find(params[:id])
          @title = @seite.titel
          respond_to do |format|
            format.html { render 'base/seite'}
            format.xml  { render :xml => @seite }
          end
        else
         render_seiten_error
        end
      elsif params[:slug]
        if @seite = Seite.find_by_slug(params[:slug]) || Seite.find_by_slug('/'+params[:slug]) || Seite.find_by_name(params[:slug])
          @title = @seite.titel
          respond_to do |format|
            format.html { render 'base/seite'}
            format.xml  { render :xml => @seite }
          end
        else
         render_seiten_error
        end
      elsif params[:slug1]
        this_full_slug = "/#{params[:slug1]}#{ '/' + params[:slug2] if params[:slug2] }#{ '/' + params[:slug3] if params[:slug3] }#{ '/' + params[:slug4] if params[:slug4] }"
        this_name = params[:slug1]
        this_name = params[:slug2] if params[:slug2]
        this_name = params[:slug3] if params[:slug3]
        this_name = params[:slug4] if params[:slug4]
        this_slug = "/#{this_name}"
        
        if @seite = Seite.find_by_full_slug(this_full_slug) || Seite.find_by_slug(this_slug) || Seite.find_by_std_slug(this_slug) || Seite.find_by_name(this_name)
          @title = @seite.titel
          respond_to do |format|
            format.html { render 'base/seite'}
            format.xml  { render :xml => @seite }
          end
        else
         render_seiten_error
        end
        
      else
       render_seiten_error
      end
    
  end
  
  def render_seiten_error
    # => render :text => 'What the fuck are you looking for ... Bastard?', :status => :not_found
    redirect_to(root_path, :flash => { :error => 'Seite wurde nicht gefunden!' })
  end
  
  
  def safe_text
    
  end
  
  
  private
  
  def _build_custom_hash
    nav = Hash.new
    Seite.sitemap.each do |taxon|
      tinfo = Hash.new
      tinfo['name'] = taxon.name
      tinfo['depth'] = taxon.slug.split('/').size
      tinfo['link'] = taxon.slug.split('/').drop(1).join('/')
      tinfo['updated'] = taxon.updated_at
      nav[tinfo['link']] = tinfo
    end
    nav
  end
  

end