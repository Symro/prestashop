<?php
if (!defined('_PS_VERSION_'))
    exit;
class wg24displayfrom{
 

    public  function wg24_administration_form() {
        global $cookie;
        $wg24_administration_fields = wg24allfields::wg24_administration_all_fields();
        $this->wg24_fields_data = $wg24_administration_fields[0];
        $this->wg24_get_tabs = $wg24_administration_fields[1];
        $this->_html .= '
            
<div class="wrapper">
            <div class="wg24-theme-administration-body-bg">
          <div id="wg24-popup-theme_patterns-save" class="wg24-pupup-message">
		<div class="for-button-save">Theme pattern Uploaded Successfully</div>
	</div>
         <div id="wg24-popup-save" class="wg24-pupup-message">
		<div class="for-button-save">Updated Theme Setting </div>
	</div>
        <form id="for_form" method="post" action="" enctype="multipart/form-data" >
                <div class="administration-heder-box">
                    <h1>Welcome To 24WebGroup Theme Editor  ' . $this->version . '</h1>
                    <div class="social-link">
                        <a  href="https://twitter.com/24webgroup/" class="flow-us_twitter"></a>
                        <a href="" class="theme-name"><h2>'.$this->ThemeName.'</h2></a>
                        <a href="http://themeforest.net/user/24webgroup" class="flow-is-themeforest"></a>
                    </div>

                </div>
                <div id="tabs">
                    <!-- ADDITIONAL -->
                    <ul class="tabs-product">
                        ' . $this->wg24_get_tabs . ' 
                    <button type="submit" class="save-button save-button-bg top-button"> Save settings</button>
                    </ul>
                    <div class="admin_tabs_description">   
                        ' . $this->wg24_fields_data . ' 
                    </div>
                </div>
                <div class="admin-footer-box">
                    <button type="submit" class="save-button save-button-bg "> Save settings</button>
                </div>
            </div>
          </form>
        </div>';
        return $this->_html;
    }
    
      
}?>