# encoding: utf-8
class StrangeHeaderModul < Strangecms::CmsModul::FineListener
  
  install true
  
  update
  
  # => mirror_views true        =>  default:  false     ...     Spiegle Modul-views-Ordner
  # => mirror_theme true        =>  default:  false     ...     Spiegle Modul-public-Ordner in Default-Theme
  # => mirror_public true       =>  default:  true      ...     Spiegle Modul-public-Ordner in App-public-Ordner
  
  mirror_public true
  
end
