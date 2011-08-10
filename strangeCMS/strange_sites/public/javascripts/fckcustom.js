FCKRelativePath = '';
FCKConfig.ImageBrowserURL	= '/strange_finder' ;
FCKConfig.FlashBrowserURL 	= '/strange_finder' ;
FCKConfig.LinkBrowserURL 	= '/strange_finder' ;
FCKConfig.LinkUploadURL 	= FCKRelativePath + '/fckeditor/command?Command=FileUpload&Type=Dateien&CurrentFolder=/';
FCKConfig.AnhangUploadURL 	= FCKRelativePath + '/fckeditor/command?Command=FileUpload&Type=Dateien&CurrentFolder=/';
FCKConfig.ImageUploadURL 	= FCKRelativePath + '/fckeditor/command?Command=FileUpload&Type=Bilder&CurrentFolder=/';
FCKConfig.FlashUploadURL	= FCKRelativePath + '/fckeditor/command?Command=FileUpload&Type=Filme&CurrentFolder=/';
// FCKConfig.LinkBrowserURL = FCKConfig.BasePath + 'filemanager/browser/default/browser.html?Connector='+FCKRelativePath+'/fckeditor/command';
// FCKConfig.ImageBrowserURL = FCKConfig.BasePath + 'filemanager/browser/default/browser.html?Type=Image&Connector='+FCKRelativePath+'/fckeditor/command';
// FCKConfig.FlashBrowserURL = FCKConfig.BasePath + 'filemanager/browser/default/browser.html?Type=Flash&Connector='+FCKRelativePath+'/fckeditor/command';
// FCKConfig.LinkUploadURL = FCKRelativePath+'/fckeditor/upload';
// FCKConfig.ImageUploadURL = FCKRelativePath+'/fckeditor/upload?Type=Image';
// FCKConfig.FlashUploadURL = FCKRelativePath+'/fckeditor/upload?Type=Flash';
FCKConfig.ImageBrowserWindowWidth = 900 ;
FCKConfig.ImageBrowserWindowHeight = 450 ;


FCKConfig.StrangeCMS_YouTubeToolbarColor1 	= 'f4f2f2' ;
FCKConfig.StrangeCMS_YouTubeToolbarColor2 	= '0063b8' ;
FCKConfig.StrangeCMS_YouTubeDefaultWidth 	= 400 ;
FCKConfig.StrangeCMS_YouTubeDefaultHeight 	= 300 ;


//	strangeCMS - Fenster
FCKConfig.StrangeCMS_ImageBrowserWindowWidth 	= 880 ;
FCKConfig.StrangeCMS_ImageBrowserWindowHeight 	= 550 ;
FCKConfig.StrangeCMS_LinkBrowserWindowWidth 	= 720 ;
FCKConfig.StrangeCMS_LinkBrowserWindowHeight 	= 550 ;
FCKConfig.StrangeCMS_FileBrowserWindowWidth 	= 350 ;
FCKConfig.StrangeCMS_FileBrowserWindowHeight 	= 215 ;
FCKConfig.StrangeCMS_gMapsBrowserWindowWidth 	= 800 ;
FCKConfig.StrangeCMS_gMapsBrowserWindowHeight 	= 550 ;

// :::::::::::::::::::::::::::::::::::  F C K - P L U G I N s  :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: //
FCKConfig.Plugins.Add( 'googlemaps', 'de,en,es,fr,it,nl,no,zh') ;
FCKConfig.GoogleMaps_Width 		= 710 ;
FCKConfig.GoogleMaps_Height 	= 400 ;
FCKConfig.GoogleMaps_CenterLat 	= 52.61639 ;
FCKConfig.GoogleMaps_CenterLon 	= 13.35938 ;
FCKConfig.GoogleMaps_Zoom 		= 9 ;

FCKConfig.Plugins.Add( 'imgmap', 'de,en,es') ;
FCKConfig.Plugins.Add( 'snippets','en') ;
FCKConfig.Plugins.Add( 'tableoneclick' ) ;
FCKConfig.Plugins.Add( 'tablesort', 'de,en' ) ;

FCKConfig.Plugins.Add( 'strangeCMS', 'de,en' ) ;
/*----------------------------------------------------
// FCKConfig.Plugins.Add( 'easyUpload', 'de,en' ) ;
// FCKConfig.Plugins.Add( 'modxsitelink', 'en,nl' ) ;
// FCKConfig.Plugins.Add( 'cmscontent', 'de,en' ) ;
// ajaxAutoSave plugin 
FCKConfig.Plugins.Add( 'ajaxAutoSave','en') ;
// --- config settings for the ajaxAutoSave plugin ---
// URL to post to
FCKConfig.ajaxAutoSaveTargetUrl = '/system/safe_text' ;
// Enable / Disable Plugin onBeforeUpdate Action 
FCKConfig.ajaxAutoSaveBeforeUpdateEnabled = true ;
// RefreshTime
FCKConfig.ajaxAutoSaveRefreshTime = 30 ;
// Sensitivity to key strokes
FCKConfig.ajaxAutoSaveSensitivity = 2 ;

// :::::::::::::::::::::::::::::::::::  F C K - P L U G I N s  :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: //   */

//	FCKConfig.BackgroundBlockerColor = '#777 url("/images/back.png") repeat' ;
//	FCKConfig.BackgroundBlockerOpacity = 0.75 ;
FCKConfig.BackgroundBlockerColor = '#000' ;
FCKConfig.BackgroundBlockerOpacity = 0.70 ;

FCKConfig.SkinPath = FCKConfig.BasePath + 'skins/strange/';



FCKConfig.ToolbarSets["Basic"] = [
        ['Bold','Italic','Underline','StrikeThrough'],
        ['easyImage', 'easyLink', 'Unlink']
] ;


FCKConfig.ToolbarSets["Strange"] = [
	
	['FontFormat','Bold','Italic','Underline','StrikeThrough','JustifyLeft','JustifyCenter','JustifyRight','JustifyFull','UnorderedList','OrderedList','Indent','Outdent','strangeLink','Unlink','strangeImage','strangeFlash','googlemaps','Snippets','TableOC','SpecialChar','strangeFile'],
	['Source','ShowBlocks']
	 // No comma for the last row.
] ;

FCKConfig.ToolbarSets["StrangeAdmin"] = [
	
	['FontFormat','Bold','Italic','Underline','StrikeThrough','JustifyLeft','JustifyCenter','JustifyRight','JustifyFull','UnorderedList','OrderedList','Indent','Outdent','strangeLink','Unlink','strangeImage','strangeFlash','googlemaps','Snippets','TableOC','SpecialChar','strangeFile'],
	['Source','ShowBlocks']
	 // No comma for the last row.
] ;

FCKConfig.ToolbarSets["StrangeOld"] = [
	
	['FontFormat','Bold','Italic','Underline','StrikeThrough','JustifyLeft','JustifyCenter','JustifyRight','JustifyFull','UnorderedList','OrderedList','Indent','Outdent','strangeLink','Unlink','strangeImage','Flash','googlemaps','Templates','Table','SpecialChar','Source','ShowBlocks'],
	['RemoveFormat','TableOC','easyFile','Snippets']
	 // No comma for the last row.
] ;

// Only inline elements are valid.
FCKConfig.RemoveFormatTags = 'b,big,code,del,dfn,em,font,i,ins,kbd,q,samp,small,span,strike,strong,sub,sup,tt,u,var' ;

// Attributes that will be removed
FCKConfig.RemoveAttributes = 'class,style,lang,width,height,align,hspace,valign' ;

FCKConfig.FillEmptyBlocks	= true ;

FCKConfig.EnterMode = 'p' ;			// p | div | br
FCKConfig.ShiftEnterMode = 'br' ;	// p | div | br

FCKConfig.SpellerPagesServerScript = FCKRelativePath+'/fckeditor/check_spelling';
FCKConfig.AllowQueryStringDebug = false;
FCKConfig.SpellChecker = 'WSC' ;	// 'WSC' | 'SpellerPages' | 'ieSpell'
FCKConfig.ContextMenu = ['Generic','Anchor','Flash','Select','Textarea','Checkbox','Radio','TextField','HiddenField','ImageButton','Button','BulletedList','NumberedList','Table','Form'] ;
FCKConfig.ShowBorders	= true ;
FCKConfig.AutoGrowMax = 600 ;
// FCKConfig.ToolbarLocation = 'Out:seiten_top_banner' ;
FCKConfig.DefaultLanguage		= 'de' ;
FCKConfig.ForcePasteAsPlainText	= true ;

FCKConfig.EditorAreaCSS = '/stylesheets/fck_styles.css' ;
FCKConfig.BodyClass = 'edit' ;
FCKConfig.BodyId = 'edit' ;
FCKConfig.CustomStyles =
{
	'Red Title'	: { Element : 'h3', Styles : { 'color' : 'Red' } },
	'o_box' : { Element : 'div', Attributes : { 'class' : 'o_box' } }
};
// FCKConfig.FontNames		= 'StrangeBreath;Arial;Comic Sans MS;Courier New;Tahoma;Times New Roman;Verdana' ;
FCKConfig.FontNames		= 'Verdana;Arial;Comic Sans MS;Courier New;Tahoma' ;
// FCKConfig.FontSizes		= '12px;13px;15px;18px;smaller;larger;xx-small;x-small;small;medium;large;x-large;xx-large' ;
FCKConfig.FontSizes		= '12px;13px;15px;18px' ;
FCKConfig.StylesXmlPath		= FCKConfig.EditorPath + 'fckstyles.xml' ;
FCKConfig.TemplatesXmlPath	= FCKConfig.EditorPath + 'fcktemplates.xml' ;
// FCKConfig.FontFormats	= 'p;h1;h2;h3;h4;h5;h6;pre;address;div' ;
FCKConfig.FontFormats	= 'p;h1;h2;h3;h4;div' ;
FCKConfig.FontColors = '000000,993300,333300,003300,003366,000080,333399,333333,800000,FF6600,808000,808080,008080,0000FF,666699,808080,FF0000,FF9900,99CC00,339966,33CCCC,3366FF,800080,999999,FF00FF,FFCC00,FFFF00,00FF00,00FFFF,00CCFF,993366,C0C0C0,FF99CC,FFCC99,FFFF99,CCFFCC,CCFFFF,99CCFF,CC99FF,FFFFFF' ;
