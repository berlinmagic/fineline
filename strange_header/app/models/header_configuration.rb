# encoding: utf-8
class HeaderConfiguration < Configuration
  
  HEADER_STYLEZ = %w[fader slider s3_slider]
  
  preference :aktiv, :boolean, :default => true
  
  # => preference :form_stil, :string, :default => FORM_STYLEZ[0]
  
  preference :generell_show_header, :boolean, :default => true
  
  
  
end
