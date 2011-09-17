# ImageHelper

	
	:add_watermark, :path => "#{Rails.root}/public/images/logo.png", :tile => true
	
	ie: $ > file.thumb("700x600").encode(:png).process(:add_watermark, :path => "#{Rails.root}/public/images/logo.png", :tile => true).url
	
path:	Path to Pic 	[absolute!]
tile:	1 / 4 / 9 / 16 	[put 1 / 4 / 9 / 16 watermark(s) on pic)]


	
	