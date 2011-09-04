# encoding: utf-8
class SidebarConfiguration < Configuration
  
  SIDEBAR_STYLEZ = %w[box list]
  
  preference :aktiv, :boolean, :default => true
  
  # => preference :form_stil, :string, :default => FORM_STYLEZ[0]
  
  # => preference :generell_show_header, :boolean, :default => true
  
  
  
end
