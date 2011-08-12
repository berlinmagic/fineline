# encoding: utf-8
class GallerienController< ApplicationController
  
  def pic_bg_form
    
  end
  
  def index
    # => news = News.aktiv
    @seite = Seite.where('system_name = ?', 'gallerie').first
    @bilder = Bild.page(params[:page]).per(16)
    render :template => 'base/seite'
  end
  
  def xxl_index
    @xxl_view = true
    @seite = Seite.where('system_name = ?', 'gallerie').first
    @bilder = Bild.page(params[:page]).per(4)
    render :template => 'base/seite'
  end
  
  def show_pic
    @bild = Bild.find(params[:id])
    render :layout => false
  end
  
  def show
    @seite = Seite.where('system_name = ?', 'gallerie').first
    @bild = Bild.find(params[:id])
    @pic_box = []
    Bild.all.each do |pic|
      @pic_box << pic.id
    end
    @prev_pic = @pic_box[ ( @pic_box.index(@bild.id) - 1 ) < 0 ? ( @pic_box.size - 1 ) : ( @pic_box.index(@bild.id) - 1 ) ]
    @next_pic = @pic_box[ ( @pic_box.index(@bild.id) + 1 ) > ( @pic_box.size - 1 ) ? 0 : ( @pic_box.index(@bild.id) + 1 ) ]
    # => render :template => 'base/seite'
  end
   

  
end