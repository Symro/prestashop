<?php
if (!defined('_PS_VERSION_'))
    exit;
include_once(dirname(__FILE__) . '/admin/wg24allfields.php');
include_once(dirname(__FILE__) . '/admin/wg24adminheader.php');
include_once(dirname(__FILE__) . '/admin/wg24displayfrom.php');
include_once(dirname(__FILE__) . '/admin/wg24installation.php');
include_once(dirname(__FILE__) . '/admin/wg24deletedata.php');
class Wg24ThemeAdministration extends Module {
    public $wg24_t_title  = "shine";
    public $wg24_a_title  = "wg24";
    public $ThemeName  = "Shine Theme";
    public $wg24values = array();
    public $theme_pattern, $wg24_fields_data, $wg24_get_tabs;
    public function __construct() {
        $this->name = 'wg24themeadministration';
        $this->author = '24WebGroup';
        $this->tab = 'front_office_features';
        $this->version = '1.1.0';
        $this->need_instance = 0;
        parent::__construct();
        $this->secure_key = Tools::encrypt($this->name);
        $this->displayName = $this->l('24WebGroup Theme Editor');
         $this->confirmUninstall = $this->l('Are you sure you want to uninstall on this module?');
        $this->description = $this->l('Shine Theme Editor By 24WebGroup');
          $this->wg24_all_t_Patern();
          $this->wg24_Theme_values();
      
    }
    public function install() {
        if (!parent::install() || !wg24installation::wg24_installValues() ||!$this->registerHook('rightColumn') ||!$this->registerHook('header') || !$this->registerHook('top') || !$this->registerHook('footer') || !$this->registerHook('leftColumn')  || !$this->registerHook('home')        
        )
            return false;
        return true;
    }
    public function uninstall() {
        if (!parent::uninstall())
            return false;
        wg24deletedata::wg24_administration_value_delete();
        return true;
    }

  public function wg24_administration_save_values($id) {
        return Configuration::get($id);
    }
      public function getContent() {
         $this->_html = '';
         global $cookie;
        require_once '../init.php';
        wg24adminheader::wg24_add_administration_css_js_data();
        wg24displayfrom::wg24_administration_form();
        return $this->_html;
    }
      public function wg24_Theme_values() {
        $theme_pattern = $this->theme_pattern;
        $languages = Language::getLanguages(false);
        $administration_image_pathe = __PS_BASE_URI__ . 'modules/wg24themeadministration/img/';
         $theme_image_pathe = __PS_BASE_URI__ . 'themes/shine/img/';
        $wg24_get_values = array();
        /************************************    ***********************************/
        $wg24_get_values[] = array("name" => 'General theme settings',
            "type" => "tabs_title");
        $wg24_get_values[] = array("name" => "Layout",
            "type" => "content-title");
        $wg24_get_values[] = array("name" => 'Responsive Design',
            "dsc" => 'You can show or hide Responsive desing in your shop',
            "id" =>$this->wg24_a_title. '_responsive_designe_'.$this->wg24_t_title,
            "wg24" => "show",
            "switch_value" => array(1, 2),
            "values" => array('Show', 'Hide'),
            "type" => "switcherbutton");
         $wg24_get_values[] = array("name" => 'Facebook Like Box',
            "dsc" => 'You can show or hide Responsive desing in your shop',
            "id" =>$this->wg24_a_title. '_facebook_lik_box_'.$this->wg24_t_title,
            "wg24" => "show",
            "switch_value" => array(3, 4),
            "values" => array('Show', 'Hide'),
            "type" => "switcherbutton");
         $wg24_get_values[] = array("name" => 'Facebook Like Box',
            "dsc" => 'You can show or hide Responsive desing in your shop',
            "id" =>$this->wg24_a_title. '_facebook_l_r_b_'.$this->wg24_t_title,
            "wg24" => "show",
            "switch_value" => array(5, 6),
            "values" => array('Left', 'Right'),
            "type" => "switcherbutton");
         $wg24_get_values[] = array("name" => 'Quick view button in product boxes',
            "dsc" => 'You can show or hide Quick view button in product boxes.',
            "id" => $this->wg24_a_title  . "_pro_box_quic_".$this->wg24_t_title,
            "wg24" => "show",
            "switch_value" => array(7,8),
            "values" => array('Show', 'Hide'),
            "type" => "switcherbutton");
         $wg24_get_values[] = array("name" => 'Rating in product boxes',
            "dsc" => 'You can show or hide Rating in product boxes.',
            "id" => $this->wg24_a_title  . "_pro_box_rating_".$this->wg24_t_title,
            "wg24" => "show",
            "switch_value" => array(9, 10),
            "values" => array('Show', 'Hide'),
            "type" => "switcherbutton"); 
          $wg24_get_values[] = array("name" => 'Hover Color product in product boxes',
            "dsc" => 'You can show or hide hover product in product boxes.',
            "id" => $this->wg24_a_title  . "_pro_hover_img_".$this->wg24_t_title,
            "wg24" => "show",
            "switch_value" => array(11,12),
            "values" => array('Show', 'Hide'),
            "type" => "switcherbutton"); 
         $wg24_get_values[] = array("name" => 'Show scroll to top button',
            "dsc" => 'You can show or hide Show scroll to top button.',
             "id" => $this->wg24_a_title  . "_scrol_top_to_".$this->wg24_t_title,
            "wg24" => "show",
            "switch_value" => array(13,14),
            "values" => array('Show', 'Hide'),
            "type" => "switcherbutton");
        $wg24_get_values[] = array("name" => 'Sale & New badges style',
            "dsc" => 'You can change to sell and new icon button style.',
            "id" =>$this->wg24_a_title.'_p_new_sale_'.$this->wg24_t_title,
            "wg24" => "default",
            "values" => array('default' => 'default', 'rounded_rectangle' => 'Rounded Rectangle'),
            "type" => "select");
        $wg24_get_values[] = array("name" => 'Home Big slider bottom service Message',
            "dsc" => "You can use this text for your shop on home page service  section.",
              "id" =>$this->wg24_a_title.'_home_slid_b_ser_ms_text_'.$this->wg24_t_title,
            "lang" => true,
            "wg24" =>'<div class="messages-3" id="store-messages">
        <div class="message"><i class="icon-refresh"></i> <span><strong>Return & Exchange</strong> in 3 working days </span> </div>
        <div class="message"><i class="icon-truck"></i><span><strong>FREE SHIPPING</strong> order over $99</span> </div>
		<div class="phone"><i class="icon-phone"></i><span><strong>Need help?</strong> +1 800 123 1234</span> </div>
     
      </div>',
            "type" => "textarea");
        
        
        $wg24_get_values[] = array("name" => 'Home bottom features-box custom block',
            "dsc" => 'You can show or hide features-box custom block',
            "id" => $this->wg24_a_title  . '_home_b_f_c_block_s_'.$this->wg24_t_title,
            "wg24" => "show",
            "switch_value" => array(15,16),
            "values" => array('Show', 'Hide'),
            "type" => "switcherbutton");
        $wg24_get_values[] = array("name" => 'Home bottom features-box custom block Content',
            "dsc" => 'Custom Block on home page Bottom banner',
            "id" => $this->wg24_a_title  . "_home_b_c_content_".$this->wg24_t_title,
            "lang" => true,
            "wg24" =>'  <div class="store-img-box">
    <ul>
      <li>
        <div class="feature-box">
          <div class="icon-reponsive"></div>
          <div class="content">Responsive Theme<span>Lorem Ipsum is simply dummy text of the printing and typesetting industry. </span> </div>
        </div>
      </li>
      <li>
        <div class="feature-box">
          <div class="icon-admin"></div>
          <div class="content">Powerful Admin Panel <span>Lorem Ipsum is simply dummy text of the printing and typesetting industry. </span></div>
        </div>
      </li>
      
      <li class="last">
        <div class="feature-box">
          <div class="icon-support"></div>
          <div class="content">Premium Support <span>Lorem Ipsum is simply dummy text of the printing and typesetting industry.</span> </div>
        </div>
      </li>
    </ul>
  </div>',
            "type" => "textarea");
        
        $wg24_get_values[] = array("name" => 'Home bottom offter banner ',
            "dsc" => 'You can show or hide Home bottom offter banner ',
            "id" => $this->wg24_a_title  . '_home_b_off_bann_'.$this->wg24_t_title,
            "wg24" => "show",
            "switch_value" => array(17,18),
            "values" => array('Show', 'Hide'),
            "type" => "switcherbutton");
        
        /********************** start category page  *******************************/
        $wg24_get_values[] = array("name" => "Category page",
            "type" => "content-title");
        $wg24_get_values[] = array("name" => 'Sidebar',
            "dsc" => 'You can show or hide sidebar',
           "id" => $this->wg24_a_title  . "_c_not_sidebar_des_".$this->wg24_t_title,
            "wg24" => "show",
            "switch_value" => array(19,20),
            "values" => array('Show', 'Hide'),
            "type" => "switcherbutton");
        $wg24_get_values[] = array("name" => 'Category Page Subcategory',
            "dsc" => 'You can show or hide Subcategory on Category page',
            "id" => $this->wg24_a_title  . "_c_sub_categor_".$this->wg24_t_title,
            "wg24" => "hide",
            "switch_value" => array(21,22),
            "values" => array('Show', 'Hide'),
            "type" => "switcherbutton");
        $wg24_get_values[] = array("name" => "Category Page view mode",
            "dsc" => "If you want to change catalog page default view style.",
           "id" => $this->wg24_a_title  . "_c_list_grid_".$this->wg24_t_title,
            "wg24" => "grid_view",
            "type" => "images",
            "values" => array(
                  'grid_view' => $administration_image_pathe . 'grid_view.png',
                'list_view' => $administration_image_pathe . 'list_view.png'
            )
        );
        
        /********************* product page  *****************************************/
        $wg24_get_values[] = array("name" => "Product page",
            "type" => "content-title");
         $wg24_get_values[] = array("name" => 'sidebar',
            "dsc" => 'You can show sidebar or without sidebar',
            "id" => $this->wg24_a_title  . '_p_without_sidebar_'.$this->wg24_t_title,
            "wg24" => "show",
            "switch_value" => array(23,24),
            "values" => array('Show', 'Hide'),
            "type" => "switcherbutton");
        $wg24_get_values[] = array("name" => 'Sidebar custom content',
            "dsc" => 'Custom HTML design to show on product page on sidebar.',
            "id" => $this->wg24_a_title  . '_product_custom_block_'.$this->wg24_t_title,
            "lang" => true,
            "wg24" => ' <div class="block block-product-additional">
        <div class="block-title"><strong><span>Product custom block</span></strong></div>
        <div class="block-content">
            <p style="text-align: center; line-height:19px">Custom blocks help you define additional product information. You can use these to showcase promotions, offers, additional detail etc.</p>
            <img alt="" src="'.$theme_image_pathe.'shine/custom-block.png"  width="248"  height="308"></div>
    </div>
                ',
            "type" => "textarea");
        $wg24_get_values[] = array("name" => 'Custom tab',
            "dsc" => 'You can show or hide custom tab page on product',
            "id" => $this->wg24_a_title.'_p_tab_contorl_'.$this->wg24_t_title,
            "wg24" => "show",
            "switch_value" => array(25,26),
            "values" => array('Show', 'Hide'),
            "type" => "switcherbutton");
        $wg24_get_values[] = array("name" => 'Tab title',
            "dsc" => 'Custom HTML tab title design to show on product page.',
            "id" => $this->wg24_a_title.'_p_tab_title_'.$this->wg24_t_title,
            "lang" => true,
            "wg24" => 'Custom tab',
            "type" => "text");
        $wg24_get_values[] = array("name" => 'Tab content',
            "dsc" => 'Custom HTML design to show on product page.',
             "id" => $this->wg24_a_title.'_p_tab_content_'.$this->wg24_t_title,
            "lang" => true,
            "wg24" =>"<p><strong>Lorem Ipsum</strong><span>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></p>",
            "type" => "textarea");
       
       
        /***************************************  Start color  **********************************  */
        $wg24_get_values[] = array("name" => 'Theme colors',
            "type" => "tabs_title");
        $wg24_get_values[] = array("name" => 'Load color skin',
            "dsc" => 'You can Load color scheme.',
             "id" => $this->wg24_a_title.'_col_skin_'.$this->wg24_t_title,
            "wg24" => "default",
            "values" => array('default' => 'Default Skin', 'style1' => 'Style-1',  'style2' => 'Style-2','customeskin' => 'Custom Skin'),
            "type" => "select");
        $wg24_get_values[] = array("name" => "Main",
            "type" => "content-title");
        $wg24_get_values[] = array("name" => 'Body Background Color',
            "dsc" => 'Default color: #FFFFFF. If you want to change this color.',
           "id" => $this->wg24_a_title.'_col_body_bg_'.$this->wg24_t_title,
            "wg24" => "#FFFFFF",
            "type" => "color");
          $wg24_get_values[] = array("name" => 'Body Top border color',
            "dsc" => 'Default color: #000000. If you want to change this color.',
            "id" => $this->wg24_a_title.'_col_body_top_bor_'.$this->wg24_t_title,
            "wg24" => "#000000",
            "type" => "color");
        
        $wg24_get_values[] = array("name" => 'Body font color',
            "dsc" => 'Default color: #333333. If you want to change this color.',
            "id" => $this->wg24_a_title.'_col_body_font_'.$this->wg24_t_title,
            "wg24" => "#333333",
            "type" => "color");
        $wg24_get_values[] = array("name" => 'Link color',
            "dsc" => 'Default color: #282828. If you want to change this color.',
            "id" => $this->wg24_a_title.'_col_link_font_'.$this->wg24_t_title,
            "wg24" => "#282828",
            "type" => "color");
        $wg24_get_values[] = array("name" => 'Link hover color ',
            "dsc" => 'Default color: #333333. If you want to change this color.',
             "id" => $this->wg24_a_title.'_col_link_h_font_'.$this->wg24_t_title,
            "wg24" => "#333333",
            "type" => "color");
        $wg24_get_values[] = array("name" => 'Headers color ',
            "dsc" => 'Default color: #111111. If you want to change this color.',
           "id" => $this->wg24_a_title.'_heading_col_'.$this->wg24_t_title,
            "wg24" => "#111111",
            "type" => "color");
        $wg24_get_values[] = array("name" => 'Headers border color ',
            "dsc" => 'Default color:  #000000. If you want to change this color.',
            "id" => $this->wg24_a_title.'_heading_bord_col_'.$this->wg24_t_title,
            "wg24" => " #000000",
            "type" => "color");
         $wg24_get_values[] = array("name" => 'Headers Select border color ',
            "dsc" => 'Default color:  #CF3341. If you want to change this color.',
            "id" => $this->wg24_a_title.'_heading_sel_b_col_'.$this->wg24_t_title,
            "wg24" => " #CF3341",
            "type" => "color");
        /* $wg24_get_values[] = array("name" => 'Content BG Color',
            "dsc" => 'Default color:  #FFFFFF. If you want to change this color.',
            "id" => $this->wg24_a_title.'_content_bg_col_'.$this->wg24_t_title,
            "wg24" => " #FFFFFF",
            "type" => "color"); */
        
        $wg24_get_values[] = array("name" => 'Input fields background',
            "dsc" => 'Default color: #F0F0F0. If you want to change this color.',
            "id" => $this->wg24_a_title.'_input_bg_col_'.$this->wg24_t_title,
            "wg24" => "#F0F0F0",
            "type" => "color");
        $wg24_get_values[] = array("name" => 'Input fields text',
            "dsc" => 'Default color: #AAAAAA. If you want to change this color.',
            "id" => $this->wg24_a_title.'_input_text_col_'.$this->wg24_t_title,
            "wg24" => "#222222",
            "type" => "color");
        $wg24_get_values[] = array("name" => 'Input fields border',
            "dsc" => 'Default color: #F0F0F0. If you want to change this color.',
           "id" => $this->wg24_a_title.'_input_bord_col_'.$this->wg24_t_title,
            "wg24" => "#F0F0F0",
            "type" => "color");
        $wg24_get_values[] = array("name" => 'Extra border color',
            "dsc" => 'Default color: #E5E5E5. (1px border used in many places in theme).',
            "id" => $this->wg24_a_title.'_main_bord_col_'.$this->wg24_t_title,
            "wg24" => "#E5E5E5",
            "type" => "color");
        
        $wg24_get_values[] = array("name" => 'Category dscription box background ',
            "dsc" => 'Default color: #FFFFFF. If you want to change this color.',
            "id" => $this->wg24_a_title.'_c_d_bg_col_'.$this->wg24_t_title,
            "wg24" => "#FFFFFF",
            "type" => "color");
        $wg24_get_values[] = array("name" => 'Category dscription box border color',
            "dsc" => 'Default color: #D6D4D4. If you want to change this color.',
           "id" => $this->wg24_a_title.'_c_d_bg_b_col_'.$this->wg24_t_title,
            "wg24" => "#D6D4D4",
            "type" => "color");
        $wg24_get_values[] = array("name" => 'Category dscription  color',
            "dsc" => 'Default color: #333333. If you want to change this color.',
           "id" => $this->wg24_a_title.'_c_d_bg_t_col_'.$this->wg24_t_title,
            "wg24" => "#333333",
            "type" => "color");
        
       /***************************************  header background color  ********************************************************/ 
        
        
        $wg24_get_values[] = array("name" => "Header",
            "type" => "content-title");
        $wg24_get_values[] = array("name" => 'Header background color',
            "dsc" => 'Default color: #FFFFFF. If you want to change this color.',
            "id" => $this->wg24_a_title.'_h_m_bg_col_'.$this->wg24_t_title,
            "wg24" => "#FFFFFF",
            "type" => "color");
        $wg24_get_values[] = array("name" => 'Header menu link color',
            "dsc" => 'Default color: #333333. If you want to change this color.',
            "id" => $this->wg24_a_title.'_h_m_link_col_'.$this->wg24_t_title,
            "wg24" => "#333333",
            "type" => "color");
        $wg24_get_values[] = array("name" => 'Header menu link hover color',
            "dsc" => 'Default color: #333333. If you want to change this color.',
            "id" => $this->wg24_a_title.'_h_m_link_h_col_'.$this->wg24_t_title,
            "wg24" => "#333333",
            "type" => "color");
        $wg24_get_values[] = array("name" => 'Header menu link right border color',
            "dsc" => 'Default color: #CACACA. If you want to change this color.',
             "id" => $this->wg24_a_title.'_h_m_link_b_col_'.$this->wg24_t_title,
            "wg24" => "#CACACA",
            "type" => "color");
        $wg24_get_values[] = array("name" => 'Header menu currency links color',
            "dsc" => 'Default color: #333333. If you want to change this color.',
             "id" => $this->wg24_a_title.'_h_cur_lan_link_'.$this->wg24_t_title,
            "wg24" => "#333333",
            "type" => "color");
         $wg24_get_values[] = array("name" => 'Header menu currency links hover color',
            "dsc" => 'Default color: #CF3341. If you want to change this color.',
             "id" => $this->wg24_a_title.'_h_cur_lan_link_'.$this->wg24_t_title,
            "wg24" => "#CF3341",
            "type" => "color");
         $wg24_get_values[] = array("name" => 'Header menu cart text color',
            "dsc" => 'Default color: #333333. If you want to change this color.',
             "id" => $this->wg24_a_title.'_h_cart_text_'.$this->wg24_t_title,
            "wg24" => "#333333",
            "type" => "color");
         $wg24_get_values[] = array("name" => 'Search bar background color',
            "dsc" => 'Default color: #000000. If you want to change this color.',
             "id" => $this->wg24_a_title.'_sear_bar_bg_c_'.$this->wg24_t_title,
            "wg24" => "#000000",
            "type" => "color");
          $wg24_get_values[] = array("name" => 'Search button BG color',
            "dsc" => 'Default color: #CF3341. If you want to change this color.',
             "id" => $this->wg24_a_title.'_sear_bar_b_bg_c_'.$this->wg24_t_title,
            "wg24" => "#CF3341",
            "type" => "color");
 /*************************        main menu      *******************************/        
        
        $wg24_get_values[] = array("name" => "Main menu",
            "type" => "content-title");
        $wg24_get_values[] = array("name" => 'Main menu BG color',
            "dsc" => 'Default color: #FFFFFF. If you want to change this color.',
           "id" => $this->wg24_a_title.'_min_m_bg_col_'.$this->wg24_t_title,
            "wg24" => "#FFFFFF",
            "type" => "color");
         $wg24_get_values[] = array("name" => 'Main menu  box-shadow color',
            "dsc" => 'Default color: #CCCCCC. If you want to change this color.',
            "id" => $this->wg24_a_title.'_min_m_2le_shdow_col_'.$this->wg24_t_title,
            "wg24" => "#CCCCCC",
            "type" => "color");
        $wg24_get_values[] = array("name" => 'Main menu border top color',
            "dsc" => 'Default color: #E5E5E5. If you want to change this color.',
           "id" => $this->wg24_a_title.'_min_m_bor_t_col_'.$this->wg24_t_title,
            "wg24" => "#E5E5E5",
            "type" => "color");
         $wg24_get_values[] = array("name" => 'Main menu border bottom color',
            "dsc" => 'Default color: #222222. If you want to change this color.',
           "id" => $this->wg24_a_title.'_min_m_bor_b_col_'.$this->wg24_t_title,
            "wg24" => "#222222",
            "type" => "color");
          $wg24_get_values[] = array("name" => 'Main menu border right color',
            "dsc" => 'Default color: #D0D5DA. If you want to change this color.',
           "id" => $this->wg24_a_title.'_min_m_bor_b_r_col_'.$this->wg24_t_title,
            "wg24" => "#D0D5DA",
            "type" => "color");
         $wg24_get_values[] = array("name" => 'Main menu links color',
            "dsc" => 'Default color: #000000. If you want to change this color.',
           "id" => $this->wg24_a_title.'_min_m_links_col_'.$this->wg24_t_title,
            "wg24" => "#000000",
            "type" => "color");
        $wg24_get_values[] = array("name" => 'Main menu links Hover color',
            "dsc" => 'Default color: #333333. If you want to change this color.',
            "id" => $this->wg24_a_title.'_min_m_h_links_col_'.$this->wg24_t_title,
            "wg24" => "#333333",
            "type" => "color");
         $wg24_get_values[] = array("name" => 'Menu hover BG color',
            "dsc" => 'Default color: #EAEAEA. If you want to change this color.',
           "id" => $this->wg24_a_title.'_min_m_h_bg_col_'.$this->wg24_t_title,
            "wg24" => "#EAEAEA",
            "type" => "color");
          $wg24_get_values[] = array("name" => 'Menu Active BG color',
            "dsc" => 'Default color: #CF3341. If you want to change this color.',
           "id" => $this->wg24_a_title.'_min_m_a_bg_col_'.$this->wg24_t_title,
            "wg24" => "#CF3341",
            "type" => "color");
        $wg24_get_values[] = array("name" => 'Main menu links Active color',
            "dsc" => 'Default color: #FFFFFF. If you want to change this color.',
            "id" => $this->wg24_a_title.'_min_m_a_links_col_'.$this->wg24_t_title,
            "wg24" => "#FFFFFF",
            "type" => "color");
        $wg24_get_values[] = array("name" => 'Main menu 2 level background',
            "dsc" => 'Default color: #FFFFFF. If you want to change this color.',
            "id" => $this->wg24_a_title.'_min_m_2le_bg_col_'.$this->wg24_t_title,
            "wg24" => "#FFFFFF",
            "type" => "color");
        $wg24_get_values[] = array("name" => 'Main menu 2 level border color',
            "dsc" => 'Default color: #FFFFFF. If you want to change this color.',
            "id" => $this->wg24_a_title.'_min_m_2le_b_col_'.$this->wg24_t_title,
            "wg24" => "#FFFFFF",
            "type" => "color");
        $wg24_get_values[] = array("name" => 'Main menu 3 level background',
            "dsc" => 'Default color: #FFFFFF. If you want to change this color.',
            "id" => $this->wg24_a_title.'_min_m_3le_bg_col_'.$this->wg24_t_title,
            "wg24" => "#FFFFFF",
            "type" => "color");
        $wg24_get_values[] = array("name" => 'Main menu 3 level border color',
        "dsc" => 'Default color: #FFFFFF. If you want to change this color.',
        "id" => $this->wg24_a_title.'_min_m_3le_b_col_'.$this->wg24_t_title,
        "wg24" => "#FFFFFF",
        "type" => "color");
        $wg24_get_values[] = array("name" => 'Main menu sublinks color',
            "dsc" => 'Default color: #333333. If you want to change this color.',
           "id" => $this->wg24_a_title.'_min_m_sub_link_col_'.$this->wg24_t_title,
            "wg24" => "#333333",
            "type" => "color");
        $wg24_get_values[] = array("name" => 'Main menu sublinks Hover color',
            "dsc" => 'Default color: #FFFFFF. If you want to change this color.',
             "id" => $this->wg24_a_title.'_min_m_sub_lin_h_col_'.$this->wg24_t_title,
            "wg24" => "#CF3341",
            "type" => "color");
        
       /*******************************************  Slider     *****************************************/ 
           $wg24_get_values[] = array("name" => "Home slider ",
            "type" => "content-title");
         $wg24_get_values[] = array("name" => 'Home slider Headding Color',
            "dsc" => 'Default color: #FFFFFF. If you want to change this color.',
             "id" => $this->wg24_a_title.'_m_s_headding_col_'.$this->wg24_t_title,
            "wg24" => "#FFFFFF",
            "type" => "color");
        $wg24_get_values[] = array("name" => 'Home slider Description Color',
            "dsc" => 'Default color: #F8F8F8. If you want to change this color.',
             "id" => $this->wg24_a_title.'_m_s_dsc_col_'.$this->wg24_t_title,
            "wg24" => "#F8F8F8",
            "type" => "color");
         $wg24_get_values[] = array("name" => 'Home slider button border Color',
            "dsc" => 'Default color: #FFFFFF. If you want to change this color.',
             "id" => $this->wg24_a_title.'_m_s_b_bor_col_'.$this->wg24_t_title,
            "wg24" => "#FFFFFF",
            "type" => "color");
         $wg24_get_values[] = array("name" => 'Home slider button hover BG Color',
            "dsc" => 'Default color: #CF3341. If you want to change this color.',
             "id" => $this->wg24_a_title.'_m_s_b_h_bg_col_'.$this->wg24_t_title,
            "wg24" => "#CF3341",
            "type" => "color");
         $wg24_get_values[] = array("name" => 'Home slider button text  Color',
            "dsc" => 'Default color: #FFFFFF. If you want to change this color.',
             "id" => $this->wg24_a_title.'_m_s_b_text_col_'.$this->wg24_t_title,
            "wg24" => "#FFFFFF",
            "type" => "color");
        
        
        
  /***************************************   Product box           **********************************/
        $wg24_get_values[] = array("name" => "PRODUCT ",
            "type" => "content-title");
        $wg24_get_values[] = array("name" => 'Product box background color',
            "dsc" => 'Default color: #FFFFFF. If you want to change this color.',
            "id" => $this->wg24_a_title.'_p_box_bg_col_'.$this->wg24_t_title,
            "wg24" => "#FFFFFF",
            "type" => "color");
         $wg24_get_values[] = array("name" => 'Product box image border color',
            "dsc" => 'Default color: #EAEAEA. If you want to change this color.',
             "id" => $this->wg24_a_title.'_p_box_img_b_col_'.$this->wg24_t_title,
            "wg24" => "#EAEAEA",
            "type" => "color");
          $wg24_get_values[] = array("name" => 'Product image background color',
            "dsc" => 'Default color: #EEEEEE. If you want to change this color.',
           "id" => $this->wg24_a_title.'_p_box_img_bg_col_'.$this->wg24_t_title,
            "wg24" => "#EEEEEE",
            "type" => "color");
        $wg24_get_values[] = array("name" => 'Product box img hover BG color',
            "dsc" => 'Default color: #EEEEEE. If you want to change this color.',
            "id" => $this->wg24_a_title.'_p_box_im_h_bg_col_'.$this->wg24_t_title,
            "wg24" => "#EEEEEE",
            "type" => "color");
        
          $wg24_get_values[] = array("name" => 'Product box new icon bg color',
            "dsc" => 'Default color: #41BEA6. If you want to change this color.',
            "id" => $this->wg24_a_title.'_p_box_new_bg_col_'.$this->wg24_t_title,
            "wg24" => "#41BEA6",
            "type" => "color");
           $wg24_get_values[] = array("name" => 'Product box sale icon bg color',
            "dsc" => 'Default color: #DD4B39. If you want to change this color.',
            "id" => $this->wg24_a_title.'_p_box_sale_bg_col_'.$this->wg24_t_title,
            "wg24" => "#DD4B39",
            "type" => "color");
         $wg24_get_values[] = array("name" => 'Product box sale & new icon text color',
            "dsc" => 'Default color: #FFFFFF. If you want to change this color.',
            "id" => $this->wg24_a_title.'_p_box_s_n_text_col_'.$this->wg24_t_title,
            "wg24" => "#FFFFFF",
            "type" => "color");
         $wg24_get_values[] = array("name" => 'Product bottom hover background color',
            "dsc" => 'Default color: #FFFFFF. If you want to change this color.',
           "id" => $this->wg24_a_title.'_p_box_bot_h_bg_col_'.$this->wg24_t_title,
            "wg24" => "#FFFFFF",
            "type" => "color");
        $wg24_get_values[] = array("name" => 'Product name color',
            "dsc" => 'Default color: #282828. If you want to change this color.',
            "id" => $this->wg24_a_title.'_p_box_name_col_'.$this->wg24_t_title,
            "wg24" => "#282828",
            "type" => "color");
        $wg24_get_values[] = array("name" => 'Product name hover color',
            "dsc" => 'Default color: #CF3341. If you want to change this color.',
            "id" => $this->wg24_a_title.'_p_box_name_h_col_'.$this->wg24_t_title,
            "wg24" => "#CF3341",
            "type" => "color");
        
        $wg24_get_values[] = array("name" => 'Price color',
            "dsc" => 'Default color: #000000. If you want to change this color.',
            "id" => $this->wg24_a_title.'_p_box_price_col_'.$this->wg24_t_title,
            "wg24" => "#000000",
            "type" => "color");
        $wg24_get_values[] = array("name" => 'Old Price color ',
            "dsc" => 'Default color: #777777  . If you want to change this color.',
            "id" => $this->wg24_a_title.'_p_box_old_col_'.$this->wg24_t_title,
            "wg24" => "#777777",
            "type" => "color");
        $wg24_get_values[] = array("name" => 'Product ratting on color ',
            "dsc" => 'Default color: #CF3341. If you want to change this color.',
            "id" => $this->wg24_a_title.'_p_box_rat_on_col_'.$this->wg24_t_title,
            "wg24" => "#CF3341",
            "type" => "color");
         $wg24_get_values[] = array("name" => 'Product ratting off color ',
            "dsc" => 'Default color: #777676. If you want to change this color.',
            "id" => $this->wg24_a_title.'_p_box_rat_off_col_'.$this->wg24_t_title,
            "wg24" => "#777676",
            "type" => "color");
      /******************************  button   *******************************************/   
        
 $wg24_get_values[] = array("name" => "Buttons",
            "type" => "content-title");
        $wg24_get_values[] = array("name" => 'Button  BG Color',
            "dsc" => 'Default color: #222222. If you want to change this color.',
             "id" => $this->wg24_a_title.'_golbal_button_col_'.$this->wg24_t_title,
            "wg24" => "#222222",
            "type" => "color");
        $wg24_get_values[] = array("name" => 'Button Hover BG color',
            "dsc" => 'Default color: #CF3341. If you want to change this color.',
             "id" => $this->wg24_a_title.'_golbal_button_h_col_'.$this->wg24_t_title,
            "wg24" => "#CF3341",
            "type" => "color");
        
        $wg24_get_values[] = array("name" => 'Button link color',
            "dsc" => 'Default color: #FFFFFF. If you want to change this color.',
           "id" => $this->wg24_a_title.'_golbal_button_link_col_'.$this->wg24_t_title,
            "wg24" => "#FFFFFF",
            "type" => "color");
        
    /************************  our-features-box  **************************/    
        
        $wg24_get_values[] = array("name" => "Home bottom features-box",
            "type" => "content-title");
        $wg24_get_values[] = array("name" => 'Box BG color',
            "dsc" => 'Default color:#000000. If you want to change this color.',
            "id" => $this->wg24_a_title.'_hom_fea_box_bg_colo_'.$this->wg24_t_title,
            "wg24" => "#000000",
            "type" => "color");
        $wg24_get_values[] = array("name" => 'Box icon BG color',
            "dsc" => 'Default color:#CF3341. If you want to change this color.',
             "id" => $this->wg24_a_title.'_ho_fea_b_ic_bg_colo__'.$this->wg24_t_title,
            "wg24" => "#CF3341",
            "type" => "color");
          $wg24_get_values[] = array("name" => 'Box icon and Headding  color',
            "dsc" => 'Default color:#FFFFFF. If you want to change this color.',
             "id" => $this->wg24_a_title.'_ho_fea_b_ic_h_t_col_'.$this->wg24_t_title,
            "wg24" => "#FFFFFF",
            "type" => "color");
           $wg24_get_values[] = array("name" => 'Box description  color',
            "dsc" => 'Default color:#999999. If you want to change this color.',
             "id" => $this->wg24_a_title.'_ho_fea_b_ic_dsc_col_'.$this->wg24_t_title,
            "wg24" => "#999999",
            "type" => "color");
 /*********************************   footer   ************************************************/   
          
        $wg24_get_values[] = array("name" => "FOOTER",
            "type" => "content-title");
        $wg24_get_values[] = array("name" => 'Footer  background  color',
            "dsc" => 'Default color: #FFFFFF. If you want to change this color.',
           "id" => $this->wg24_a_title.'_footer_bg_col_'.$this->wg24_t_title,
            "wg24" => "#FFFFFF",
            "type" => "color");
        $wg24_get_values[] = array("name" => 'Footer Headers color',
            "dsc" => 'Default color: #333333. If you want to change this color.',
            "id" => $this->wg24_a_title.'_f_heading_col_'.$this->wg24_t_title,
            "wg24" => "#333333",
            "type" => "color");
        $wg24_get_values[] = array("name" => 'Footer links color ',
            "dsc" => 'Default color:#222222. If you want to change this color.',
            "id" => $this->wg24_a_title.'_f_link_col_'.$this->wg24_t_title,
            "wg24" => "#222222",
            "type" => "color");
        $wg24_get_values[] = array("name" => 'Footer links hover color',
            "dsc" => 'Default color:#CF3341. If you want to change this color.',
             "id" => $this->wg24_a_title.'_f_link_h_col_'.$this->wg24_t_title,
            "wg24" => "#CF3341",
            "type" => "color");
         $wg24_get_values[] = array("name" => 'Footer  Follow Us icon BG color',
            "dsc" => 'Default color:#D6D6D6. If you want to change this color.',
             "id" => $this->wg24_a_title.'_follow_us_bg_colo_'.$this->wg24_t_title,
            "wg24" => "#D6D6D6",
            "type" => "color");
         $wg24_get_values[] = array("name" => 'Footer  Twitter color',
            "dsc" => 'Default color:#333333. If you want to change this color.',
             "id" => $this->wg24_a_title.'_twitter_colo_'.$this->wg24_t_title,
            "wg24" => "#333333",
            "type" => "color");
         $wg24_get_values[] = array("name" => 'Footer  address color',
            "dsc" => 'Default color:#999999. If you want to change this color.',
             "id" => $this->wg24_a_title.'_address_colo_'.$this->wg24_t_title,
            "wg24" => "#999999",
            "type" => "color");
        $wg24_get_values[] = array("name" => 'Footer Bottom  background  color',
            "dsc" => 'Default color: #F8F8F8. If you want to change this color.',
           "id" => $this->wg24_a_title.'_footer_bot_bg_col_'.$this->wg24_t_title,
            "wg24" => "#F8F8F8",
            "type" => "color");
        $wg24_get_values[] = array("name" => 'Footer powered by text color',
            "dsc" => 'Default color:#999999. If you want to change this color.',
            "id" => $this->wg24_a_title.'_f_powered_col_'.$this->wg24_t_title,
            "wg24" => "#999999",
            "type" => "color");
        
        /*********************************** theme becakgorund **********************************  */
        $wg24_get_values[] = array("name" => 'Theme backgrounds',
            "type" => "tabs_title");
        $wg24_get_values[] = array("name" => 'Background Images',
            "dsc" => 'If you want to change main body background image.',
            "id" => $this->wg24_a_title."_bg_img_".$this->wg24_t_title,
            "wg24" => "hide",
            "switch_value" => array(27,28),
            "values" => array('Show', 'Hide'),
            "type" => "switcherbutton");
        $wg24_get_values[] = array("name" => 'Upload Custom Pattern',
            "dsc" => 'You can upload your custom pattern from here.',
            "id" => $this->wg24_a_title."_bg_cust_patten_".$this->wg24_t_title,
            "wg24" => '',
            "type" => "upload");
        $wg24_get_values[] = array("name" => "Background Patterns",
           "id" => $this->wg24_a_title."_bg_patten_".$this->wg24_t_title,
            "wg24" => "",
            "type" => "tiles",
            "values" => $theme_pattern,
        );
        $wg24_get_values[] = array("name" => "Baackground Attachment",
            "dsc" => "You can set shorthand properties for the background.",
            "id" => $this->wg24_a_title."_bg_attached_".$this->wg24_t_title,
            "wg24" => "scroll",
            "values" => array('scroll' => 'Scroll', 'fixed' => 'Fixed', 'inherit' => 'Inherit'),
            "type" => "select");
        $wg24_get_values[] = array("name" => "Baackground Repeat",
            "dsc" => "You can set shorthand properties for the background",
            "id" => $this->wg24_a_title."_bg_repeter_".$this->wg24_t_title,
            "wg24" => "repeat",
            "values" => array('repeat' => 'Repeat', 'repeat-x' => 'Repeat-x', 'repeat-y' => 'Repeat-y', 'no-repeat' => 'No-repeat', 'inherit' => 'Inherit'),
            "type" => "select");
        $wg24_get_values[] = array("name" => "Backgorund Position",
            "dsc" => "You can set shorthand properties for the background",
            "id" => $this->wg24_a_title."_bg_positin_".$this->wg24_t_title,
            "wg24" => "scroll",
            "values" => array('left top' => 'Left top', 'left center' => 'Left center', 'left bottom' => 'Left bottom',
                'right top' => 'Right top', 'right center' => 'Right center', 'right bottom' => 'Right bottom',
                'center top' => 'Center top', 'center center' => 'Center center', 'center bottom' => 'Center bottom'),
            "type" => "select");
        /***********************  Font **********************************  */
        $wg24_get_values[] = array("name" => 'Fonts',
            "type" => "tabs_title");
         $wg24_get_values[] = array("name" => "Body font",
            "type" => "content-title");
        $wg24_get_values[] = array("name" => 'Select font source',
            "dsc" => 'If you want to Select font source  system/google.',
           "id" => $this->wg24_a_title."_body_select_font_".$this->wg24_t_title,
            "wg24" => "show",
            "switch_value" => array(29,30),
            "values" => array('Google', 'System'),
            "type" => "switcherbutton");
        $wg24_get_values[] = array("name" => "Body Font to system",
            "dsc" => "You can change heading font style.",
            "id" => $this->wg24_a_title."_body_sy_font_".$this->wg24_t_title,
            "wg24" => array('face' => 'Source+Sans+Pro,sans-serif'),
            "section" => "system",
            "type" => "typography");
        $wg24_get_values[] = array("name" => "Body Font to google",
            "dsc" => "You can change body font style.",
            "id" => $this->wg24_a_title."_body_google_font_".$this->wg24_t_title,
            "wg24" => array('face' => 'Source Sans Pro'),
            "section" => "google",
            "type" => "typography");
         $wg24_get_values[] = array("name" => 'Font size',
            "dsc" => '',
             "id" => $this->wg24_a_title."_body_size_font_".$this->wg24_t_title,
            "wg24" => "14",
            "values" => array('12' => '12', '13' => '13', '14' => '14', '15' => '15', '16' => '16', '17' => '17', '18' => '18', '19' => '19', '20' => '20', '21' => '21', '22' => '22', '23' => '23', '24' => '24', '25' => '25'),
            "type" => "select");
        $wg24_get_values[] = array("name" => "Headers font",
            "type" => "content-title");
        $wg24_get_values[] = array("name" => 'Select font source',
            "dsc" => 'If you want to Select font source system/google.',
             "id" => $this->wg24_a_title."_heders_select_font_".$this->wg24_t_title,
            "wg24" => "show",
            "switch_value" => array(31,32),
            "values" => array('Google','System'),
            "type" => "switcherbutton");
        $wg24_get_values[] = array("name" => "Heading Font to system",
            "dsc" => "You can change heading font style.",
             "id" => $this->wg24_a_title."_heders_sys_font_".$this->wg24_t_title,
            "wg24" => array('face' => 'Source+Sans+Pro,sans-serif'),
            "section" => "system",
            "type" => "typography");
        $wg24_get_values[] = array("name" => "Heading Font to google",
            "dsc" => "You can change heading font style.",
            "id" => $this->wg24_a_title."_heders_gol_font_".$this->wg24_t_title,
            "wg24" => array('face' => 'Source Sans Pro'),
            "section" => "google",
            "type" => "typography");
        
        $wg24_get_values[] = array("name" => 'Text transform',
            "dsc" => '',
            "id" => $this->wg24_a_title."_heders_transfrom_font_".$this->wg24_t_title,
            "wg24" => "uppercase",
            "values" => array('uppercase' => 'uppercase', 'lowercase' => 'lowercase', 'inherit' => 'inherit', 'capitalize' => 'capitalize', 'none' => 'none'),
            "type" => "select");
        $wg24_get_values[] = array("name" => 'Product headers Font size',
            "dsc" => '',
            "id" => $this->wg24_a_title."_heders_p_size_font_".$this->wg24_t_title,
            "wg24" => "15",
            "values" => array('12' => '12', '13' => '13', '14' => '14', '15' => '15', '16' => '16', '17' => '17', '18' => '18', '19' => '19', '20' => '20', '21' => '21', '22' => '22', '23' => '23', '24' => '24', '25' => '25','26' => '26'),
            "type" => "select");
        $wg24_get_values[] = array("name" => 'Page headers Font size',
            "dsc" => '',
            "id" => $this->wg24_a_title."_heders_pag_size_font_".$this->wg24_t_title,
            "wg24" => "28",
            "values" => array('12' => '12', '13' => '13', '14' => '14', '15' => '15', '16' => '16', '17' => '17', '18' => '18', '19' => '19', '20' => '20', '21' => '21', '22' => '22', '23' => '23', '24' => '24', '25' => '25','26' => '26','27' => '27','28' => '28'),
            "type" => "select");
        $wg24_get_values[] = array("name" => 'Left/Right sidebar block headers Font size',
            "dsc" => '',
            "id" => $this->wg24_a_title."_heders_l_r_size_font_".$this->wg24_t_title,
            "wg24" => "16",
            "values" => array('12' => '12', '13' => '13', '14' => '14', '15' => '15', '16' => '16', '17' => '17', '18' => '18', '19' => '19', '20' => '20', '21' => '21', '22' => '22', '23' => '23', '24' => '24', '25' => '25','26' => '26'),
            "type" => "select");
        $wg24_get_values[] = array("name" => 'Footer headers Font size',
            "dsc" => '',
            "id" => $this->wg24_a_title."_fot_heders_size_font_".$this->wg24_t_title,
            "wg24" => "13",
            "values" => array('12' => '12', '13' => '13', '14' => '14', '15' => '15', '16' => '16', '17' => '17', '18' => '18', '19' => '19', '20' => '20', '21' => '21', '22' => '22', '23' => '23', '24' => '24', '25' => '25','26' => '26'),
            "type" => "select");
        /************************** Main menu **********************************  */
        $wg24_get_values[] = array("name" => 'Main Menu',
            "type" => "tabs_title");
        
          $wg24_get_values[] = array("name" => 'Company Information link into Header top link',
            "dsc" => 'Custom HTML design to show on product page on sidebar.',
            "id" => $this->wg24_a_title  . '_com_top_link_'.$this->wg24_t_title,
            "lang" => true,
            "wg24" => '<div class="click-nav">
                    <ul class="no-js">
                        <li> <a class="clicker">Company <span class="caret"></span> </a>
                          <ul class="link">
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">Customer Service</a></li>
                            <li><a href="#">Privacy Policy</a></li>
                            <li><a title="Contact Us" href="#"><span>Contact Us</span></a></li>
                            <li><a title="Site Map" href="#"><span>Site Map</span></a></li>
                            <li><a title="Search Terms" href="#"><span>Search Terms</span></a></li>
                            <li class=" last"><a title="Advanced Search" href="#"><span>Advanced Search</span></a></li>
                          </ul>
                        </li>
                    </ul>
                    </div>',
            "type" => "textarea");
        $wg24_get_values[] = array("name" => 'Show Custom HTML  Menu into Main menu',
            "dsc" => 'Show custom menu into main menu',
           "id" => $this->wg24_a_title."_main_cus_m_".$this->wg24_t_title,
            "wg24" => "show",
            "switch_value" => array(33, 34),
            "values" => array('Show', 'Hide'),
            "type" => "switcherbutton");
        $wg24_get_values[] = array("name" => 'Show Custom HTML block  into Main menu',
            "dsc" => 'Custom HTML design to show on main menu.',
            "id" => $this->wg24_a_title  . '_cus_html_m_m_'.$this->wg24_t_title,
            "lang" => true,
            "wg24" => '  <a class="level-top" href="#"><span>Custom</span></a>
        <div style="display: none; left: 0px;" class="level0-wrapper">
          <div class="header-nav-dropdown-wrapper clearer">
            <div class="grid12-3">
              <h4 class="heading">HTML5 + CSS3</h4>
              <div class="ccs3-html5-box"><em class="icon-html5">&nbsp;</em> <em class="icon-css3">&nbsp;</em></div>
              <p>Our designed to deliver almost everything you want to do online without requiring additional plugins.CSS3 has been split into "modules".</p>
            </div>
            <div class="grid12-3">
              <h4 class="heading">Responsive Design</h4>
              <a href="http://www.magik.com//">
              <div class="icon-custom-reponsive"></div>
              </a>
              <p>Responsive design is a Web design to provide an optimal navigation with a minimum of resizing, and scrolling across a wide range of devices.</p>
            </div>
            <div class="grid12-3">
              <h4 class="heading">Google Fonts</h4>
              <a href="http://www.magik.com//">
              <div class="icon-custom-google-font"></div>
              </a>
              <p>Our font delivery service is built upon a reliable, global network of servers. Our flexible solution provides multiple implementation options.</p>
            </div>
            <div class="grid12-3">
              <h4 class="heading">Smart Product Grid</h4>
              <a href="http://www.magik.com//">
              <div class="icon-custom-grid"></div>
              </a>
              <p>Smart Product Grid is uses maximum available width of the screen to display content. It can be displayed on any screen or any devices.</p>
            </div>
            <br>
          </div>
        </div>',
            "type" => "textarea");
        /******************** Main menu **********************************  */
        $wg24_get_values[] = array("name" => 'Footer',
            "type" => "tabs_title");
        $wg24_get_values[] = array("name" => "Facebook Like Box",
            "type" => "content-title");
        $wg24_get_values[] = array("name" => 'Facebook Page URL',
            "dsc" => "Put your facebook page url on this box.",
             "id" => $this->wg24_a_title."_face_b_page_url_".$this->wg24_t_title,
            "wg24" => "themeforest",
            "type" => "block_text");
        $wg24_get_values[] = array("name" => "Twitter Feed Box",
            "type" => "content-title");
        $wg24_get_values[] = array("name" => 'Twitter ID',
            "dsc" => "Put your Twitter username.",
             "id" => $this->wg24_a_title."_twit_id_".$this->wg24_t_title,
            "wg24" => "24webgroup",
            "type" => "text");
        $wg24_get_values[] = array("name" => 'Tweets to show',
            "dsc" => "Tweets count",
            "id" => $this->wg24_a_title  . "_count_twitter_".$this->wg24_t_title,
            "wg24" => "3",
            "type" => "block_text");
        $wg24_get_values[] = array("name" => 'Consumer key',
            "dsc" => "Put your Consumer key.",
            "id" => $this->wg24_a_title  . "_twit_consu_key_".$this->wg24_t_title,
            "wg24" => "b9XpzI3Yq1s6Y9xtbKdlnA",
            "type" => "block_text");
        $wg24_get_values[] = array("name" => 'Consumer secret',
            "dsc" => "Put your Consumer secret.",
            "id" => $this->wg24_a_title  . "_twit_consu_secrt_".$this->wg24_t_title,
            "wg24" => "mrst4y7MhV49yoFNnha3DzdxPGgNrGQ9f7zSIGGkJ7I",
            "type" => "block_text");
        $wg24_get_values[] = array("name" => 'Access token',
            "dsc" => "Put your Access token.",
            "id" => $this->wg24_a_title  . "_twit_uconsu_token_".$this->wg24_t_title,
            "wg24" => "1695668072-gEIQdYw9hfqnSdvpLGuZAaFqNCNofYMBUZBnNwX",
            "type" => "block_text");
        $wg24_get_values[] = array("name" => 'Access token secret',
            "dsc" => "Put your Access token secret.",
           "id" => $this->wg24_a_title  . "twit_uconsu_secret_".$this->wg24_t_title,
            "wg24" => "8fr1Y6bxWdeiUB3M8CsXzHmTFONT1sFdcUh3pFSAIOhqj",
            "type" => "block_text");
        /********************  start footer custom column  *****************/
         $wg24_get_values[] = array("name" => "Footer Contact Information",
            "type" => "content-title");
        $wg24_get_values[] = array("name" => 'contact info page on Footer ',
            "dsc" => "You can use this text box for showing footer contact info.",
            "id" => $this->wg24_a_title  . "_footer_cont_info_".$this->wg24_t_title,
            "lang" => true,
            "wg24" =>'<i class="icon-location-arrow"></i> 123 Main Street, Anytown, CA 12345  USA <i class="icon-mobile-phone"></i><span> +(408) 394-7557</span>        <i class="icon-envelope"></i><span> abc@magikcommerce.com</span>',
            "type" => "textarea");

        /**************** Start Social icon link  **********************************  */
        $wg24_get_values[] = array("name" => 'Social icons',
            "type" => "content-title");
        $wg24_get_values[] = array("name" => 'Facebook URL',
            "dsc" => "put your facebook url.",
             "id" => $this->wg24_a_title  . "_face_b_icon_url_".$this->wg24_t_title,
            "wg24" => "http://demo.com",
            "type" => "block_text");
        $wg24_get_values[] = array("name" => 'Twitter URL',
            "dsc" => "Put your Twitter url.",
             "id" => $this->wg24_a_title  . "_twitt_icon_url_".$this->wg24_t_title,
            "wg24" => "http://demo.com",
            "type" => "block_text");
         $wg24_get_values[] = array("name" => 'Youtube URL',
            "dsc" => "Put your youtube url.",
            "id" => $this->wg24_a_title  . "_youtu_icon_url_".$this->wg24_t_title,
            "wg24" => "http://demo.com",
            "type" => "block_text");
        $wg24_get_values[] = array("name" => 'Linkedin URL',
            "dsc" => "Put your Linkedin url.",
           "id" => $this->wg24_a_title  . "_linkedin_icon_url_".$this->wg24_t_title,
            "wg24" => "http://demo.com",
            "type" => "block_text");
        $wg24_get_values[] = array("name" => 'Google URL',
            "dsc" => "Put your google url.",
            "id" => $this->wg24_a_title  . "_google_icon_url_".$this->wg24_t_title,
            "wg24" => "http://demo.com",
            "type" => "block_text");
          $wg24_get_values[] = array("name" => 'Pinterest URL',
            "dsc" => "Put your pinterest url.",
             "id" => $this->wg24_a_title  . "_pinterest_icon_url_".$this->wg24_t_title,
            "wg24" => "http://demo.com",
            "type" => "block_text");
       $wg24_get_values[] = array("name" => 'Rss URL',
            "dsc" => "Put your rss url.",
            "id" => $this->wg24_a_title  . "_rss_icon_url_".$this->wg24_t_title,
            "wg24" => "http://demo.com",
            "type" => "block_text");
       
        /***********************  footer additional links      ***********************************/
         $wg24_get_values[] = array("name" => 'Powered by',
            "type" => "content-title");
        $wg24_get_values[] = array("name" => 'Copyright text',
            "dsc" => "You can use this text box for showing copyright text page on footer.",
             "id" => $this->wg24_a_title  . "_footer_copy_text_".$this->wg24_t_title,
            "wg24" => ' &copy;2014 Shine Demo Store. All Rights Reserved. ',
             "lang" => true,
            "type" => "text");

        /*********************  payment box *************************/
        $wg24_get_values[] = array("name" => 'Payment Icons links',
            "type" => "content-title");
        $wg24_get_values[] = array("name" => 'PayPal URL',
            "dsc" => "Put your PayPal url.",
            "id" => $this->wg24_a_title  . "_fot_paypla_id_".$this->wg24_t_title,
            "wg24" => 'http://paypal.com',
            "type" => "block_text");
        $wg24_get_values[] = array("name" => 'VisaElectron URL',
            "dsc" => "Put your VisaElectron url.",
           "id" => $this->wg24_a_title  . "_fot_visaelectron_id_".$this->wg24_t_title,
            "wg24" => 'http://maestrocard.com//',
            "type" => "block_text");
         $wg24_get_values[] = array("name" => 'Discover URL',
            "dsc" => "Put your Discover url.",
            "id" => $this->wg24_a_title  . "_fot_discover_id_".$this->wg24_t_title,
            "wg24" => 'https://www.discover.com/',
            "type" => "block_text");
         $wg24_get_values[] = array("name" => 'Visa URL',
            "dsc" => "Put your Visa url.",
            "id" => $this->wg24_a_title  . "_fot_visa_id_".$this->wg24_t_title,
            "wg24" => 'http://www.visa.com/',
            "type" => "block_text");
         $wg24_get_values[] = array("name" => 'MasterCard URL',
            "dsc" => "Put your MasterCard url.",
             "id" => $this->wg24_a_title  . "_fot_mastercard_id_".$this->wg24_t_title,
            "wg24" => 'http://www.mastercard.com',
            "type" => "block_text");
        $wg24_get_values[] = array("name" => 'Maestro URL',
            "dsc" => "Put your Maestro url.",
             "id" => $this->wg24_a_title  . "_fot_maestro_id_".$this->wg24_t_title,
            "wg24" => 'http://yourlink.com',
            "type" => "block_text");
         $wg24_get_values[] = array("name" => 'AmericanExpress URL',
            "dsc" => "Put your AmericanExpress url.",
            "id" => $this->wg24_a_title  . "_fot_americanexpress_id_".$this->wg24_t_title,
            "wg24" => 'https://www.americanexpress.com/',
            "type" => "block_text");
          /*********************  payment box *************************/
        $wg24_get_values[] = array("name" => 'Upload Custom Payment icon',
            "type" => "content-title");
         
         $wg24_get_values[] = array("name" => 'Custom Payment icon 1',
            "dsc" => 'You can upload your custom payment icon.',
            "id" => $this->wg24_a_title  . "_fot_paycon_1_".$this->wg24_t_title,
            "wg24" => '',
            "type" => "upload");
         $wg24_get_values[] = array("name" => 'Custom Payment icon link 1',
            "dsc" => "Put your Custom Payment icon link 1 url.",
            "id" => $this->wg24_a_title  . "_fot_cus_pay1_id_".$this->wg24_t_title,
            "wg24" => 'https://www.demo.com/',
            "type" => "block_text");
         $wg24_get_values[] = array("name" => 'Custom Payment icon link 2',
            "dsc" => 'You can upload your custom payment icon.',
            "id" => $this->wg24_a_title  . "_fot_paycon_2_".$this->wg24_t_title,
            "wg24" => '',
            "type" => "upload");
         $wg24_get_values[] = array("name" => 'Custom Payment icon link 2',
            "dsc" => "Put your Custom Payment icon link 1 url.",
            "id" => $this->wg24_a_title  . "_fot_cus_pay2_id_".$this->wg24_t_title,
            "wg24" => 'https://www.demo.com/',
            "type" => "block_text");
       
        /*********************************************  Custome code  **********************************  */
        $wg24_get_values[] = array("name" => ' Custom code',
            "type" => "tabs_title");
        $wg24_get_values[] = array("name" => 'Add Tracking Code',
            "dsc" => 'You can add Google Analytics code/ another  tracking code on this  box.',
             "id" => $this->wg24_a_title."_thme_track_codes_".$this->wg24_t_title,
            "wg24" => "",
            "type" => "textarea");
        $wg24_get_values[] = array("name" => 'Add Custom CSS',
            "dsc" => 'Add custom css to show in your theme.',
             "id" => $this->wg24_a_title."_them_custom_css_".$this->wg24_t_title,
            "wg24" => '',
            "type" => "textarea");
        $wg24_get_values[] = array("name" => 'Add Custom  JS',
            "dsc" => 'Add custom js to show in your theme.',
             "id" => $this->wg24_a_title."_them_custom_js_".$this->wg24_t_title,
            "wg24" => '',
            "type" => "textarea");
        $this->wg24values = $wg24_get_values;
    }
    
      
    public function wg24_all_t_Patern() {
        $get_paterns = array();
        $get_paterns_links = __PS_BASE_URI__ . 'modules/wg24themeadministration/theme_patterns/';
        $get_paterns_path = _PS_MODULE_DIR_ . 'wg24themeadministration/theme_patterns/';
        if (is_dir($get_paterns_path)) {
            if ($image_dir = opendir($get_paterns_path)) {
                while (($patern_name = readdir($image_dir)) !== false) {
                    if (stristr($patern_name,".png") !== false ||  stristr($patern_name, ".jpg") !== false || stristr($patern_name, ".gif") !== false || stristr($patern_name, ".jpeg") !== false) {
                        $get_paterns[] = $get_paterns_links . $patern_name;
                    }
                }
            }
        }

        $this->theme_pattern = $get_paterns;
    }
     public function hookTop() {
             
        global $smarty;
        $wg24themeadministration = array();
        foreach ($this->wg24values as $wg24_fields_data){
            if ($wg24_fields_data['type'] == 'typography') {
                foreach ($wg24_fields_data as $values) {
                    if (is_array($values)) {
                        foreach ($values as $key => $typographydata) {
                            $wg24themeadministration[$wg24_fields_data['id'] . '_' . $key] = Configuration::get($wg24_fields_data['id'] . '_' . $key);
                        }
                    }
                }
            }
            if (isset($wg24_fields_data['id'])){
                $wg24themeadministration[$wg24_fields_data['id']] = Configuration::get($wg24_fields_data['id']);
            }
            $languages = Language::getLanguages(false);
            if (isset($wg24_fields_data['lang']) && $wg24_fields_data['lang'] == true){

                foreach ($languages as $langua) {
                    $wg24themeadministration[$wg24_fields_data['id'] . '_' . $langua['id_lang']] = Configuration::get($wg24_fields_data['id'] . '_' . $langua['id_lang']);
                }
                $wg24themeadministration[$wg24_fields_data['id']] = Configuration::get($wg24_fields_data['id'] . '_' . (int)Context::getContext()->language->id);
    }
    
    }
       $smarty->assign('webgroup24', $wg24themeadministration);
    
        
    }
  public function hookrightColumn() {
        return $this->hookTop();
    }
    public function hookHeader() {
        return $this->hookTop();
    }
     public function hookHome() {
        return $this->hookTop();
    }
   public function hookfooter() {
        return $this->hookTop();
    }
   
   public function hookleftColumn() {
        return $this->hookTop();
    }
    
}?>