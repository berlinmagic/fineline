Cell::Base.prepend_view_path( File.join("#{StrangeHeader::Engine.config.root}", "app", "cells") )
Cell::Base.prepend_view_path( File.join("#{StrangeHeader::Engine.config.root}", "app", "views") )