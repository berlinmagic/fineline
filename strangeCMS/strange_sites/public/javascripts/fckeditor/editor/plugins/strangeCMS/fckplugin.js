var strImg_w 	= 	FCKConfig.StrangeCMS_ImageBrowserWindowWidth 	|| 	880 ;
var strImg_h 	= 	FCKConfig.StrangeCMS_ImageBrowserWindowHeight 	||	600 ;
var strLnk_w 	= 	FCKConfig.StrangeCMS_LinkBrowserWindowWidth 	||	550 ;
var strLnk_h 	= 	FCKConfig.StrangeCMS_LinkBrowserWindowHeight 	||	550 ;
var strFile_w 	= 	FCKConfig.StrangeCMS_FileBrowserWindowWidth 	||	450 ;
var strFile_h 	= 	FCKConfig.StrangeCMS_FileBrowserWindowHeight 	||	250 ;
var strFlash_w 	= 	FCKConfig.StrangeCMS_FlashBrowserWindowWidth 	||	550 ;
var strFlash_h 	= 	FCKConfig.StrangeCMS_FlashBrowserWindowHeight 	||	500 ;

//Image Dialog
// Register the related command.
FCKCommands.RegisterCommand( 'strangeImage', new FCKDialogCommand( 'strangeImage', FCKLang.EuImgDialogTitle, FCKPlugins.Items['strangeCMS'].Path + 'fck_image.html', strImg_w , strImg_h ) ) ;

// Create the toolbar button.
var oStrangeImageItem = new FCKToolbarButton( 'strangeImage', FCKLang.EuInsertImageLbl, FCKLang.EuInsertImage, null, false, true, 37) ;

FCKToolbarItems.RegisterItem( 'strangeImage', oStrangeImageItem ) ;


//Flash Dialog
// Register the related command.
FCKCommands.RegisterCommand( 'strangeFlash', new FCKDialogCommand( 'strangeFlash', FCKLang.EuImgDialogTitle, FCKPlugins.Items['strangeCMS'].Path + 'fck_flash.html', strFlash_w , strFlash_w ) ) ;

// Create the toolbar button.
var oStrangeImageItem = new FCKToolbarButton( 'strangeFlash', FCKLang.EuInsertImageLbl, FCKLang.EuInsertImage, null, false, true, 38) ;

FCKToolbarItems.RegisterItem( 'strangeFlash', oStrangeImageItem ) ;




//External Link Dialog
// Register the related command.
FCKCommands.RegisterCommand( 'strangeLink', new FCKDialogCommand( 'strangeLink', FCKLang.EuLinkDialogTitle, FCKPlugins.Items['strangeCMS'].Path + 'fck_link.html', strLnk_w, strLnk_h ) ) ;

// Create the toolbar button.
var oEasyLinkItem = new FCKToolbarButton( 'strangeLink', FCKLang.EuInsertLinkLbl, FCKLang.EuInsertLink, null, false, true, 34) ;

FCKToolbarItems.RegisterItem( 'strangeLink', oEasyLinkItem ) ;



//File Dialog
// Register the related command.
FCKCommands.RegisterCommand( 'strangeFile', new FCKDialogCommand( 'strangeFile', FCKLang.EuFileDialogTitle, FCKPlugins.Items['strangeCMS'].Path + 'fck_file.html', strFile_w, strFile_h ) ) ;

// Create the toolbar button.
var oEasyFileItem = new FCKToolbarButton( 'strangeFile', FCKLang.EuFileInsertFileLbl, FCKLang.EuFileInsertFile, null, false, true) ;
oEasyFileItem.IconPath = FCKPlugins.Items['strangeCMS'].Path + 'file.gif' ;

FCKToolbarItems.RegisterItem( 'strangeFile', oEasyFileItem ) ;



// Context menu for Image and Link
// Define the context menu "listener".
var oMyContextMenuListener = { 
	// We will use our own menus only if the default ones have been removed from the config, so if someone uses just the 
	// image dialog then we don' mess with the links (for example)
	EnableImageMenu : (FCKConfig.ContextMenu.IndexOf('Image') == -1) ,
 
	EnableLinkMenu : (FCKConfig.ContextMenu.IndexOf('Link') == -1) ,

// This is the standard function called right before sowing the context menu.
	AddItems : function( menu, tag, tagName )
	{
		if ( this.EnableImageMenu && tagName == 'IMG' && !tag.getAttribute( '_fckfakelement' ) )
		{
			menu.AddSeparator() ;
			menu.AddItem( 'strangeImage', FCKLang.EuMenuImageProperties, 37 ) ;
		}

		if ( this.EnableLinkMenu && FCK.GetNamedCommandState( 'Unlink' ) != FCK_TRISTATE_DISABLED )
		{
			menu.AddSeparator() ;
			menu.AddItem( 'strangeLink'	, FCKLang.EuMenuEditLink		, 34 ) ;
			menu.AddItem( 'Unlink'	, FCKLang.EuMenuRemoveLink	, 35 ) ; //calls the default one
		}
	}

}

// Register our context menu listener.
FCK.ContextMenu.RegisterListener( oMyContextMenuListener ) ;