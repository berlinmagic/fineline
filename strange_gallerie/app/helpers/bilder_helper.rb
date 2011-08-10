# encoding: utf-8
module BilderHelper
  
  def format_bild(bild, x = nil, y = nil)
    dims = bild_dim(bild)
    x_dims = {}
    if y
      x_factor = x / dims[:bild_breite].to_f
      y_factor = y / dims[:bild_hoehe].to_f
    else
      x_factor = x / dims[:bild_breite].to_f
      y_factor = x / dims[:bild_hoehe].to_f
    end
    if y_factor < x_factor
      x_dims[:breite] = ( y_factor * dims[:bild_breite].to_f ).to_i
      x_dims[:hoehe] = ( y_factor * dims[:bild_hoehe].to_f ).to_i
    else
      x_dims[:breite] = ( x_factor * dims[:bild_breite].to_f ).to_i
      x_dims[:hoehe] = ( x_factor * dims[:bild_hoehe].to_f ).to_i
    end
    return x_dims
  end
  
  def format_thumb(bild, x = nil, y = nil)
    dims = bild_dim(bild)
    x_dims = {}
    if y
      x_factor = x / dims[:thumb_breite].to_f
      y_factor = y / dims[:thumb_hoehe].to_f
    else
      x_factor = x / dims[:thumb_breite].to_f
      y_factor = x / dims[:thumb_hoehe].to_f
    end
    if y_factor < x_factor
      x_dims[:breite] = ( y_factor * dims[:thumb_breite].to_f ).to_i
      x_dims[:hoehe] = ( y_factor * dims[:thumb_hoehe].to_f ).to_i
    else
      x_dims[:breite] = ( x_factor * dims[:thumb_breite].to_f ).to_i
      x_dims[:hoehe] = ( x_factor * dims[:thumb_hoehe].to_f ).to_i
    end
    return x_dims
  end
  
  def bild_dim(bild)
    if bild && bild.stil && bild.stil != ''
			if bild.stil == 'standard_format'
				stil = Strangecms::Gallerie::Config[:standard_format]
			else
				stil = bild.stil
			end
			@dim = {}
			if stil == 'hochformat'
				@dim[:bild_breite] = Strangecms::Gallerie::Config[:hochformat_width]
				@dim[:bild_hoehe] = Strangecms::Gallerie::Config[:hochformat_height]
				@dim[:thumb_breite] = Strangecms::Gallerie::Config[:hochformat_thumb_width]
				@dim[:thumb_hoehe] = Strangecms::Gallerie::Config[:hochformat_thumb_height]
			elsif stil == 'querformat'
				@dim[:bild_breite] = Strangecms::Gallerie::Config[:querformat_width]
				@dim[:bild_hoehe] = Strangecms::Gallerie::Config[:querformat_height]
				@dim[:thumb_breite] = Strangecms::Gallerie::Config[:querformat_thumb_width]
				@dim[:thumb_hoehe] = Strangecms::Gallerie::Config[:querformat_thumb_height]
			elsif stil == 'panorama'
				@dim[:bild_breite] = Strangecms::Gallerie::Config[:panorama_width]
				@dim[:bild_hoehe] = Strangecms::Gallerie::Config[:panorama_height]
				@dim[:thumb_breite] = Strangecms::Gallerie::Config[:panorama_thumb_width]
				@dim[:thumb_hoehe] = Strangecms::Gallerie::Config[:panorama_thumb_height]
			elsif stil == 'spezial'
			  x_fact = Strangecms::Gallerie::Config[:spezial_width].to_f / bild.file_width
        y_fact = Strangecms::Gallerie::Config[:spezial_height].to_f / bild.file_height
        x_fact_t = Strangecms::Gallerie::Config[:spezial_thumb_width].to_f / bild.file_width
        y_fact_t = Strangecms::Gallerie::Config[:spezial_thumb_height].to_f / bild.file_height
        if y_fact < x_fact
          @dim[:bild_breite] = (y_fact * bild.file_width).to_i
				  @dim[:bild_hoehe] = (y_fact * bild.file_height).to_i
				else
				  @dim[:bild_breite] = (x_fact * bild.file_width).to_i
				  @dim[:bild_hoehe] = (x_fact * bild.file_height).to_i
				end
				if y_fact_t < x_fact_t
          @dim[:thumb_breite] = (y_fact_t * bild.file_width).to_i
				  @dim[:thumb_hoehe] = (y_fact_t * bild.file_height).to_i
				else
				  @dim[:thumb_breite] = (x_fact_t * bild.file_width).to_i
				  @dim[:thumb_hoehe] = (x_fact_t * bild.file_height).to_i
				end
			else
				@dim[:bild_breite] = Strangecms::Gallerie::Config[:default_width]
				@dim[:bild_hoehe] = Strangecms::Gallerie::Config[:default_height]
				@dim[:thumb_breite] = Strangecms::Gallerie::Config[:default_thumb_width]
				@dim[:thumb_hoehe] = Strangecms::Gallerie::Config[:default_thumb_height]
			end
		else
			@dim[:bild_breite] = Strangecms::Gallerie::Config[:default_width]
			@dim[:bild_hoehe] = Strangecms::Gallerie::Config[:default_height]
			@dim[:thumb_breite] = Strangecms::Gallerie::Config[:default_thumb_width]
			@dim[:thumb_hoehe] = Strangecms::Gallerie::Config[:default_thumb_height]
		end
		return @dim
	end
	
  
end
