# encoding: utf-8
class GallerienController< ApplicationController
 
 def pic_bg_form
   
 end
 
 def show_pic
   
   @bild = Bild.find(params[:id])
   
   render :layout => false
   
 end
  
end