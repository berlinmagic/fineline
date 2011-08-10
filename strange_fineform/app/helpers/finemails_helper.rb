# encoding: utf-8
module FinemailsHelper
  
  def sortable(column, title = nil, view = nil)
    title ||= column.titleize
    view ||= 'mail_in'  
    css_class = (column == sort_column) ? "current #{sort_direction}" : nil  
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"  
    link_to(title, {:sort => column, :direction => direction, :view => view}, {:class => css_class} ) 
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