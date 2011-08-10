/* 
 *  MODx site link
 *  ------------
 *  By Magnatron
 *  
 *	Use this FCKEditor PlugIn to enable easy linking to document-tree items.
 *	1. Just drop the complete folder, you found this script in, into the assets/plugins/fckeditor/plugins folder
 *	2. Add the following line to fckconfig.js: 
 *			FCKConfig.Plugins.Add( 'modxsitelink', 'en,nl' ) ;
 *	3. Add 'MODxSitelink' to the ToolbarSet of your choice.
 *	
 *	        
 */

function Modxsitelink(){
	this.Execute = function(){
		// Check for selection
		var sSelected = FCKBrowserInfo.IsGecko ? FCK.EditorWindow.getSelection() : FCK.EditorDocument.selection.createRange().text;
		if(String(sSelected)==""){
			alert(FCKLang.MODxSitelinkNonSelected);
			return false;
		}
		
		// Store default document-tree function
		top.menu.defaultTreeAction = top.menu.treeAction;
		// Replace document-tree function
		top.menu.treeAction = function(id, name){
			try {
				top.main.setInternalLink(id, name);
			} catch(oException) {
				alert(FCKLang["MODxSitelinkUnableToLink"]+'\n\n'+oException);
				top.main.setInternalLink = null;
				top.menu.treeAction = top.menu.defaultTreeAction;
			}
		}
		
		// Create link-inserting function with this editor
		top.main.setInternalLink = function(id, name){
			var oLink = FCK.Selection.MoveToAncestorNode( 'A' ) ;
			if ( oLink ) FCK.Selection.SelectNode( oLink ) ;
			var sSelected = FCKBrowserInfo.IsGecko ? FCK.EditorWindow.getSelection() : FCK.EditorDocument.selection.createRange().text;
			// Insert MODx internal-link HTML
			FCK.InsertHtml( "<a href=\"[~" + id + "~]\">"+sSelected+"</a>" );
			
			// Clean up added/changed functions 
			top.main.setInternalLink = null;
			top.menu.treeAction = top.menu.defaultTreeAction;
			
			// Finish
			return true;
		}
		
		// Alert instructions
		alert( FCKLang.MODxSitelinkExplain	);
	}
	// No idea what this is for but it removes a javascript error...
	this.GetState = function(){return true};
} 


// Register the related commands.
FCKCommands.RegisterCommand( 'MODxSitelink', new Modxsitelink() );
// Create the "MODxSitelink" toolbar button object.
var oMODxSitelinkItem = new FCKToolbarButton( 'MODxSitelink', FCKLang["MODxSitelinkBtn"], null, null, false, true ); 
// Add the icon
oMODxSitelinkItem.IconPath = FCKConfig.PluginsPath + 'modxsitelink/modxsitelink.gif'; 
// Register 'MODxSitelink' as the name that is used in the toolbar config.
FCKToolbarItems.RegisterItem( 'MODxSitelink', oMODxSitelinkItem );
