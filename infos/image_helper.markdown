# ImageHelper


## Image Watermark
	
	:add_watermark, :path => *path*, :tile => *1/4/9/16*
	
	ie: $ > image_tag @bild.file.thumb( @bild.file_cropping ).thumb("#{700}x#{600}").encode(:png).process(
					:add_watermark, 
						:path 		=> "#{datei.file.path}", 
						:tile 		=> Strangecms::Gallerie::Config[:watermark_tile].to_i
					).url
usage:

	path:			Path to Pic 		[absolute!]
	tile:			1 / 4 / 9 / 16 		[put 1 / 4 / 9 / 16 watermark(s) on pic)]


## Text Watermark	
	:add_tiled_text, 	:text => *text*, :text => *color*, :opacity => *blur*, :rotate => *deg*, 
						:font_size => *size*, :tile => *times*
	
	ie: $ > image_tag @bild.file.thumb( @bild.file_cropping ).thumb("#{700}x#{600}").encode(:png).process(
					:add_tiled_text,
					 	:text 		=> Strangecms::Gallerie::Config[:watermark_text].to_s,
						:color 		=> Strangecms::Gallerie::Config[:watermark_font_color],
						:opacity 	=> Strangecms::Gallerie::Config[:watermark_blur],
						:rotate 	=> Strangecms::Gallerie::Config[:watermark_rotate],
						:font_size 	=> Strangecms::Gallerie::Config[:watermark_font_size],
						:tile 		=> Strangecms::Gallerie::Config[:watermark_tile]
					).url
usage:

	text:			string				'fineline CMS'			text to display
	color:			hex					000000 - ffffff			color of font
	opacity:		hex					00 - ff					blur of font
	rotate:			deg					-360 - 360°				rotate font x degree
	font_size:		px					12 - 30					font size in pixel
	tile:			1/4/9/16			1						show watermark *tile* times



	
	