/**
 * @license Copyright (c) 2003-2021, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';

    config.syntaxhightlight_lang = "cshap";
    config.syntaxhightlight_hideControls = true;
    config.language = "vi";
    config.filebrowserBrowseUrl = '/Assets/admin/js/Plugins/ckfinder/ckfinder.html';
    config.filebrowserImageBrowseUrl = '/Assets/admin/js/Plugins/ckfinder.html?Type=Images';
    config.filebrowserFlashBrowseUrl = '/Assets/admin/js/Plugins/ckfinder.html?Type=Flash';
    config.filebrowserUploadUrl = '/Assets/admin/js/Plugins/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Files';
    config.filebrowserImageUploadUrl = '/Anh';
    config.filebrowserFlashUploadUrl = '/Assets/admin/js/Plugins/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Flash';
    CKFinder.setupCKEditor(null, '/Assets/admin/js/Plugins/ckfinder');
};
