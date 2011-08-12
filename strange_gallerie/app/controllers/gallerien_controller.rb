# encoding: utf-8
class GallerienController< ApplicationController
 
 def pic_bg_form
   
 end
 
 def index
   # => @news = News.aktiv
   @seite = Seite.where('system_name = ?', 'gallerie').first
   @bilder = Bild.page(params[:page]).per(4)
   render :template => 'base/seite'
 end
 
 def show_pic
   
   @bild = Bild.find(params[:id])
   
   render :layout => false
   
 end
  
end