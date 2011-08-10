/*
 * FCKeditor - The text editor for Internet - http://www.fckeditor.net
 * Copyright (C) 2003-2010 Frederico Caldeira Knabben
 *
 * == BEGIN LICENSE ==
 *
 * Licensed under the terms of any of the following licenses at your
 * choice:
 *
 *  - GNU General Public License Version 2 or later (the "GPL")
 *    http://www.gnu.org/licenses/gpl.html
 *
 *  - GNU Lesser General Public License Version 2.1 or later (the "LGPL")
 *    http://www.gnu.org/licenses/lgpl.html
 *
 *  - Mozilla Public License Version 1.1 or later (the "MPL")
 *    http://www.mozilla.org/MPL/MPL-1.1.html
 *
 * == END LICENSE ==
 *
 * Scripts related to the Flash dialog window (see fck_flash.html).
 */

var dialog		= window.parent ;
var oEditor		= dialog.InnerDialogLoaded() ;
var FCK			= oEditor.FCK ;
var FCKLang		= oEditor.FCKLang ;
var FCKConfig	= oEditor.FCKConfig ;
var FCKTools	= oEditor.FCKTools ;

//#### Dialog Tabs

// Set the dialog tabs.
dialog.AddTab( 'Info', oEditor.FCKLang.DlgInfoTab ) ;
dialog.AddTab( 'Youtube', oEditor.FCKLang.iStrangeFlashYouTubeTab ) ;

if ( FCKConfig.FlashUpload )
	dialog.AddTab( 'Upload', FCKLang.DlgLnkUpload ) ;

if ( !FCKConfig.FlashDlgHideAdvanced )
	dialog.AddTab( 'Advanced', oEditor.FCKLang.DlgAdvancedTag ) ;

// Function called when a dialog tag is selected.
function OnDialogTabChange( tabCode )
{
	ShowE('divInfo'		, ( tabCode == 'Info' ) ) ;
	ShowE('divYoutube'	, ( tabCode == 'Youtube' ) ) ;
	ShowE('divUpload'	, ( tabCode == 'Upload' ) ) ;
	ShowE('divAdvanced'	, ( tabCode == 'Advanced' ) ) ;
}

// Get the selected flash embed (if available).
var oFakeImage = dialog.Selection.GetSelectedElement() ;
var oEmbed ;

if ( oFakeImage )
{
	if ( oFakeImage.tagName == 'IMG' && oFakeImage.getAttribute('_fckflash') )
		oEmbed = FCK.GetRealElement( oFakeImage ) ;
	else
		oFakeImage = null ;
}

dialog.SetOkButton( true ) ;

window.onload = function()
{
	// Translate the dialog box texts.
	oEditor.FCKLanguageManager.TranslatePage(document) ;

	// Load the selected element information (if any).
	LoadSelection() ;

	// Show/Hide the "Browse Server" button.
	// GetE('tdBrowse').style.display = FCKConfig.FlashBrowser	? '' : 'none' ;

	// Set the actual uploader URL.
	if ( FCKConfig.FlashUpload )
		GetE('frmUpload').action = FCKConfig.FlashUploadURL ;

	dialog.SetAutoSize( true ) ;

	// Activate the "OK" button.
	dialog.SetOkButton( true ) ;

	SelectField( 'txtUrl' ) ;
}

function LoadSelection()
{
	if ( ! oEmbed ) return ;

	GetE('txtUrl').value    = GetAttribute( oEmbed, 'src', '' ) ;
	GetE('txtWidth').value  = GetAttribute( oEmbed, 'width', '' ) ;
	GetE('txtHeight').value = GetAttribute( oEmbed, 'height', '' ) ;

	// Get Advances Attributes
	GetE('txtAttId').value		= oEmbed.id ;
	GetE('chkAutoPlay').checked	= GetAttribute( oEmbed, 'play', 'true' ) == 'true' ;
	GetE('chkLoop').checked		= GetAttribute( oEmbed, 'loop', 'true' ) == 'true' ;
	GetE('chkMenu').checked		= GetAttribute( oEmbed, 'menu', 'true' ) == 'true' ;
	GetE('cmbScale').value		= GetAttribute( oEmbed, 'scale', '' ).toLowerCase() ;

	GetE('txtAttTitle').value		= oEmbed.title ;

	if ( oEditor.FCKBrowserInfo.IsIE )
	{
		GetE('txtAttClasses').value = oEmbed.getAttribute('className') || '' ;
		GetE('txtAttStyle').value = oEmbed.style.cssText ;
	}
	else
	{
		GetE('txtAttClasses').value = oEmbed.getAttribute('class',2) || '' ;
		GetE('txtAttStyle').value = oEmbed.getAttribute('style',2) || '' ;
	}

	UpdatePreview() ;
}

//#### The OK button was hit.
function Ok()
{
	if ( GetE('txtUrl').value.length == 0 )
	{
		
		if ( GetE('youTubeUrl').value.length != 0 )
		{
			var ytMovie = GetYouTubeElement( GetE('youTubeUrl').value, GetE('youTubeWidth').value, GetE('youTubeHeight').value );
			//oEditor.FCKEmbedAndObjectProcessor.RefreshView( oFakeImage, e ) ;
			FCK.InsertElement( ytMovie ) ;

			return true ;
			
		}
		else
		{
			dialog.SetSelectedTab( 'Info' ) ;
			GetE('txtUrl').focus() ;

			alert( oEditor.FCKLang.DlgAlertUrl ) ;

			return false ;
		}
		
	}

	oEditor.FCKUndo.SaveUndoStep() ;
	
	/*
	if ( !oEmbed )
	{
		oEmbed		= FCK.EditorDocument.createElement( 'EMBED' ) ;
		oFakeImage  = null ;
	}
	UpdateEmbed( oEmbed ) ;

	if ( !oFakeImage )
	{
		oFakeImage	= oEditor.FCKDocumentProcessor_CreateFakeImage( 'FCK__Flash', oEmbed ) ;
		oFakeImage.setAttribute( '_fckflash', 'true', 0 ) ;
		oFakeImage	= FCK.InsertElement( oFakeImage ) ;
	}

	oEditor.FCKEmbedAndObjectProcessor.RefreshView( oFakeImage, oEmbed ) ;
	
	*/
	var flowMovie = GetFlowPlayElement( GetE('txtUrl').value, GetE('txtWidth').value, GetE('txtHeight').value );
	FCK.InsertElement( flowMovie ) ;

	return true ;
}

function UpdateEmbed( e )
{
	SetAttribute( e, 'type'			, 'application/x-shockwave-flash' ) ;
	SetAttribute( e, 'pluginspage'	, 'http://www.macromedia.com/go/getflashplayer' ) ;

	SetAttribute( e, 'src', GetE('txtUrl').value ) ;
	SetAttribute( e, "width" , GetE('txtWidth').value ) ;
	SetAttribute( e, "height", GetE('txtHeight').value ) ;

	// Advances Attributes

	SetAttribute( e, 'id'	, GetE('txtAttId').value ) ;
	SetAttribute( e, 'scale', GetE('cmbScale').value ) ;

	SetAttribute( e, 'play', GetE('chkAutoPlay').checked ? 'true' : 'false' ) ;
	SetAttribute( e, 'loop', GetE('chkLoop').checked ? 'true' : 'false' ) ;
	SetAttribute( e, 'menu', GetE('chkMenu').checked ? 'true' : 'false' ) ;

	SetAttribute( e, 'title'	, GetE('txtAttTitle').value ) ;

	if ( oEditor.FCKBrowserInfo.IsIE )
	{
		SetAttribute( e, 'className', GetE('txtAttClasses').value ) ;
		e.style.cssText = GetE('txtAttStyle').value ;
	}
	else
	{
		SetAttribute( e, 'class', GetE('txtAttClasses').value ) ;
		SetAttribute( e, 'style', GetE('txtAttStyle').value ) ;
	}
}

var ePreview ;

function SetPreviewElement( previewEl )
{
	ePreview = previewEl ;

	if ( GetE('txtUrl').value.length > 0 )
		UpdatePreview() ;
}

function GetYouTubeElement( yt_url, yt_w, yt_h )
{
	var youTube_url		= yt_url ;
	var youTube_width	= yt_w || FCKConfig.StrangeCMS_YouTubeDefaultWidth 	|| 400 ;
	var youTube_height	= yt_h || FCKConfig.StrangeCMS_YouTubeDefaultHeight || 310 ;
	var youTube_color1	= FCKConfig.StrangeCMS_YouTubeToolbarColor1 || 'f4f2f2' ;
	var youTube_color2	= FCKConfig.StrangeCMS_YouTubeToolbarColor2 || '0063b8' ;
	var oDoc			= ePreview.ownerDocument || ePreview.document ;
	var e				= oDoc.createElement( 'object' ) ;
	var p1				= oDoc.createElement( 'param' ) ;
	var p2				= oDoc.createElement( 'param' ) ;
	var p3				= oDoc.createElement( 'param' ) ;
	var eo				= oDoc.createElement( 'embed' ) ;
	var youTube_box		= oDoc.createElement( 'div' ) ;
	var youTube_inbox	= oDoc.createElement( 'div' ) ;
	
	SetAttribute( e, 'width', youTube_width ) ;
	SetAttribute( e, 'height', youTube_height ) ;
	SetAttribute( p1, 'name',  "movie" ) ;
	SetAttribute( p1, 'value', "http://www.youtube-nocookie.com/v/"+ youTube_url +"?fs=1&amp;hl=de_DE&amp;color1=0x"+youTube_color1+"&amp;color2=0x"+youTube_color2 ) ;
	SetAttribute( p2, 'name',  "allowFullScreen" ) ;
	SetAttribute( p2, 'value', "true" ) ;
	SetAttribute( p3, 'name',  "allowscriptaccess" ) ;
	SetAttribute( p3, 'value', "always" ) ;
	SetAttribute( eo, 'src', "http://www.youtube-nocookie.com/v/"+ youTube_url +"?fs=1&amp;hl=de_DE&amp;color1=0x"+youTube_color1+"&amp;color2=0x"+youTube_color2 ) ;
	SetAttribute( eo, 'type', 'application/x-shockwave-flash' ) ;
	SetAttribute( eo, 'allowscriptaccess', 'always' ) ;
	SetAttribute( eo, 'allowfullscreen', 'true' ) ;
	SetAttribute( eo, 'width', youTube_width ) ;
	SetAttribute( eo, 'height', youTube_height ) ;
	SetAttribute( youTube_box, 'class', 'flash_player_box' ) ;
	SetAttribute( youTube_inbox, 'class', 'flash_player' ) ;
	SetAttribute( youTube_inbox, 'style', 'width:'+youTube_width+'px;height:'+youTube_height+'px;' ) ;
	
	e.appendChild( p1 ) ;
	e.appendChild( p2 ) ;
	e.appendChild( p3 ) ;
	e.appendChild( eo ) ;
	youTube_inbox.appendChild( e ) ;
	youTube_box.appendChild( youTube_inbox ) ;
	
	return youTube_box ;	
}

function GetFlowPlayElement( yt_url, yt_w, yt_h )
{
	var oDoc		= ePreview.ownerDocument || ePreview.document ;
	var timestamp 	= Number(new Date()) ;
	var video_div	= oDoc.createElement( 'div' ) ;
	var flow_scr	= oDoc.createElement( 'script' ) ;
	var flow_lib	= oDoc.createElement( 'script' ) ;
	var flow_id		= 'strange_player_'+timestamp ;
	// var flow_txt 	= document.createTextNode('flowplayer("'+flow_id+'", {src: "/javascripts/flowplayer/flowplayer-3.2.7.swf"}, {clip:[{url: "'+yt_url+'",autoPlay:false,title: "Swimming on ice at Lapland",details: {date: "03/24/2008",creator: "John Doe",subject: ["culture", "traveling", "scandinavia"]}}]});');
	var flow_txt 	= document.createTextNode('flowplayer("'+flow_id+'", {src: "/javascripts/flowplayer/flowplayer-3.2.7.swf"}, { clip: { url: "'+yt_url+'", autoPlay: false, autoBuffering: true } });');
	var flow_w		= yt_w	|| FCKConfig.StrangeCMS_YouTubeDefaultWidth 	|| 400 ;
	var flow_h		= yt_h 	|| FCKConfig.StrangeCMS_YouTubeDefaultHeight 	|| 310 ;
	var flow_clr	= oDoc.createElement( 'div' ) ;
	var flow_box	= oDoc.createElement( 'div' ) ;

	SetAttribute( video_div, 'id', flow_id ) ;
	// SetAttribute( video_div, 'href', yt_url ) ;
	SetAttribute( video_div, 'style', 'width:'+flow_w+'px;height:'+flow_h+'px;' ) ;
	SetAttribute( video_div, 'class', 'flash_player' ) ;
	SetAttribute( flow_box, 'class', 'flash_player_box' ) ;
	SetAttribute( flow_lib, 'type', "text/javascript" ) ;
	SetAttribute( flow_lib, 'src', "/javascripts/flowplayer/flowplayer-3.2.6.min.js" ) ;
	SetAttribute( flow_clr, 'class', 'clearfix' ) ;
	SetAttribute( flow_box, 'style', 'float:left;' ) ;
	
	flow_scr.appendChild( flow_txt ) ;
	// flow_box.appendChild( flow_lib ) ;
	flow_box.appendChild( video_div ) ;
	flow_box.appendChild( flow_scr ) ;
	// flow_box.appendChild( flow_clr ) ;
	
	return flow_box ;
}

function UpdatePreview()
{
	if ( !ePreview )
		return ;

	while ( ePreview.firstChild )
		ePreview.removeChild( ePreview.firstChild ) ;

	if ( GetE('txtUrl').value.length == 0 )
	{
		if ( GetE('youTubeUrl').value.length != 0 )
		{
			var ytMovie = GetYouTubeElement( GetE('youTubeUrl').value, GetE('youTubeWidth').value, GetE('youTubeHeight').value );			
			ePreview.appendChild( ytMovie ) ;
			
		}
		else
		{
			ePreview.innerHTML = '&nbsp;' ;
		}
		
	}
		
	else
	{
		if ( GetE('youTubeUrl').value.length != 0 )
		{
			var ytMovie = GetYouTubeElement( GetE('youTubeUrl').value, GetE('youTubeWidth').value, GetE('youTubeHeight').value );
			ePreview.appendChild( ytMovie ) ;
		}
		else
		{	
			var flowMovie = GetFlowPlayElement( GetE('txtUrl').value, GetE('txtWidth').value, GetE('txtHeight').value );
			ePreview.appendChild( flowMovie ) ;
		}
		
	}
}

// <embed id="ePreview" src="fck_flash/claims.swf" width="100%" height="100%" style="visibility:hidden" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer">

function BrowseServer()
{
	OpenFileBrowser( FCKConfig.FlashBrowserURL, FCKConfig.FlashBrowserWindowWidth, FCKConfig.FlashBrowserWindowHeight ) ;
}

function SetUrl( url, width, height )
{
	GetE('txtUrl').value = url ;

	if ( width )
		GetE('txtWidth').value = width ;

	if ( height )
		GetE('txtHeight').value = height ;

	UpdatePreview() ;

	dialog.SetSelectedTab( 'Info' ) ;
}

function OnUploadCompleted( errorNumber, fileUrl, fileName, customMsg )
{
	// Remove animation
	window.parent.Throbber.Hide() ;
	GetE( 'divUpload' ).style.display  = '' ;

	switch ( errorNumber )
	{
		case 0 :	// No errors
			alert( 'Your file has been successfully uploaded' ) ;
			break ;
		case 1 :	// Custom error
			alert( customMsg ) ;
			return ;
		case 101 :	// Custom warning
			alert( customMsg ) ;
			break ;
		case 201 :
			alert( 'A file with the same name is already available. The uploaded file has been renamed to "' + fileName + '"' ) ;
			break ;
		case 202 :
			alert( 'Invalid file type' ) ;
			return ;
		case 203 :
			alert( "Security error. You probably don't have enough permissions to upload. Please check your server." ) ;
			return ;
		case 500 :
			alert( 'The connector is disabled' ) ;
			break ;
		default :
			alert( 'Error on file upload. Error number: ' + errorNumber ) ;
			return ;
	}

	SetUrl( fileUrl ) ;
	GetE('frmUpload').reset() ;
}

var oUploadAllowedExtRegex	= new RegExp( FCKConfig.FlashUploadAllowedExtensions, 'i' ) ;
var oUploadDeniedExtRegex	= new RegExp( FCKConfig.FlashUploadDeniedExtensions, 'i' ) ;

function CheckUpload()
{
	var sFile = GetE('txtUploadFile').value ;

	if ( sFile.length == 0 )
	{
		alert( 'Please select a file to upload' ) ;
		return false ;
	}

	if ( ( FCKConfig.FlashUploadAllowedExtensions.length > 0 && !oUploadAllowedExtRegex.test( sFile ) ) ||
		( FCKConfig.FlashUploadDeniedExtensions.length > 0 && oUploadDeniedExtRegex.test( sFile ) ) )
	{
		OnUploadCompleted( 202 ) ;
		return false ;
	}

	// Show animation
	window.parent.Throbber.Show( 100 ) ;
	GetE( 'divUpload' ).style.display  = 'none' ;

	return true ;
}
