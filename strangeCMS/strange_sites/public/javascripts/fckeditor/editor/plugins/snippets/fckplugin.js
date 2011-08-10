/*
 * FCKeditor - The text editor for internet
 * Copyright (C) 2003-2005 Frederico Caldeira Knabben
 * 
 * Licensed under the terms of the GNU Lesser General Public License:
 * 		http://www.opensource.org/licenses/lgpl-license.php
 * 
 * For further information visit:
 * 		http://www.fckeditor.net/
 * 
 * "Support Open Source software. What about a donation today?"
 * 
 * File Name: fckplugin.js
 * 	Plugin to insert code fragments.
 * 
 * File Authors:
 * 		GreggP (greggp@pobox.com)
 */

FCKConfig.SnippetsXmlPath = FCKConfig.PluginsPath + "snippets/snippets.xml"
FCKCommands.RegisterCommand( 
							'Snippets',
							new FCKDialogCommand( 'Snippets', FCKLang.SnippetsTitle,
												 FCKPlugins.Items['snippets'].Path + 'SnippetsBrowse.html', 380, 450 ) ) ;
var oSnippets = new FCKToolbarButton( 'Snippets', FCKLang.SnippetsBtn ) ;
oSnippets.IconPath = FCKPlugins.Items['snippets'].Path + 'Snippets.gif' ;
FCKToolbarItems.RegisterItem( 'Snippets', oSnippets ) ;




