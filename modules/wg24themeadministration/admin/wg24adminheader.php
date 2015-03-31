<?php
if (!defined('_PS_VERSION_'))
    exit;
class wg24adminheader{
 
   public function wg24_add_administration_css_js_data() {
        $this->_html = '
 <script type="text/javascript"  src="' . __PS_BASE_URI__ . 'modules/wg24themeadministration/js/custom.js"></script>
 <script type="text/javascript"  src="' . __PS_BASE_URI__ . 'modules/wg24themeadministration/js/demofont.js"></script>
   <script type="text/javascript" src="' . __PS_BASE_URI__ . 'modules/wg24themeadministration/js/jquery-ui.js"></script>    
  <link rel="stylesheet" type="text/css" href="' . __PS_BASE_URI__ . 'modules/wg24themeadministration/css/default.css" media="screen"/>
 <link rel="stylesheet" type="text/css" href="' . __PS_BASE_URI__ . 'modules/wg24themeadministration/css/jquery-ui.css" media="screen"/>
 <script type="text/javascript"  src="' . __PS_BASE_URI__ . 'modules/wg24themeadministration/js/prettify.js"></script>
 <script type="text/javascript"  src="' . __PS_BASE_URI__ . 'modules/wg24themeadministration/js/jquery.maskedinput-1.2.2.js"></script>
<link href="' . __PS_BASE_URI__ . 'modules/wg24themeadministration/css/colorpicker.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"  src="' . __PS_BASE_URI__ . 'modules/wg24themeadministration/js/colorpicker.js"></script>
<script type="text/javascript"  src="' . __PS_BASE_URI__ . 'modules/wg24themeadministration/js/medialibrary-uploader.js"></script>
<script type="text/javascript"  src="' . __PS_BASE_URI__ . 'modules/wg24themeadministration/js/jquery.tipsy.js"></script>
    ';
    }
}?>