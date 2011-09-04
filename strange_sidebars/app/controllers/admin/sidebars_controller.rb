# encoding: utf-8
class Admin::SidebarsController < Admin::BaseController

  before_filter :get_navi_werte
  
  def index
    @sidebars = Sidebar.all
  end
 
  
  def get_navi_werte
    @aktivio = 'seiten'
    @sub_aktivio = 'sidebars'
  end
  
  def reorder_stuff
    params.each do |key,value|
      unless key == 'authenticity_token'
        if value.kind_of?(Array)
          value.each_with_index do |val,index|
            if thing = key.classify.constantize.find(val)
              thing.position = index
              thing.save
            end
          end
        end
      end
    end
    render :nothing => true
  end
  
end