{*
* 2007-2014 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2014 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
<!DOCTYPE HTML>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7 " lang="{$lang_iso}"><![endif]-->
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8 ie7" lang="{$lang_iso}"><![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9 ie8" lang="{$lang_iso}"><![endif]-->
<!--[if gt IE 8]> <html class="no-js ie9" lang="{$lang_iso}"><![endif]-->
<html lang="{$lang_iso}">
	<head>
		<meta charset="utf-8" />
		<title>{$meta_title|escape:'html':'UTF-8'}</title>
{if isset($meta_description) AND $meta_description}
		<meta name="description" content="{$meta_description|escape:'html':'UTF-8'}" />
{/if}
{if isset($meta_keywords) AND $meta_keywords}
		<meta name="keywords" content="{$meta_keywords|escape:'html':'UTF-8'}" />
{/if}

		<meta name="generator" content="PrestaShop" />
		<meta name="robots" content="{if isset($nobots)}no{/if}index,{if isset($nofollow) && $nofollow}no{/if}follow" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes" /> 
		<link rel="icon" type="image/vnd.microsoft.icon" href="{$favicon_url}?{$img_update_time}" />
		<link rel="shortcut icon" type="image/x-icon" href="{$favicon_url}?{$img_update_time}" />
{if isset($css_files)}
	{foreach from=$css_files key=css_uri item=media}
		<link rel="stylesheet" href="{$css_uri}" type="text/css" media="{$media}" />
	{/foreach}
{/if}
<link rel="stylesheet" type="text/css" href="{$css_dir}shine/default.css" media="all">
<link type="text/css" rel="stylesheet" href="{$css_dir}shine/font-awesome.css">
<link type="text/css" rel="stylesheet" href="{$css_dir}shine/slider.css">
  {if $webgroup24.wg24_responsive_designe_shine=="show"}
<link type="text/css" rel="stylesheet" href="{$css_dir}shine/responsive.css">
{/if}

{if isset($js_defer) && !$js_defer && isset($js_files) && isset($js_def)}
  {$js_def}
  {foreach from=$js_files item=js_uri}
  <script type="text/javascript" src="{$js_uri|escape:'html':'UTF-8'}"></script>
  {/foreach}
{/if}

<script type="text/javascript" src="{$js_dir}shine/slider-banner.js"></script>
<script type="text/javascript" src="{$js_dir}shine/jquery.bxslider.min.js"></script>
<script type="text/javascript" src="{$js_dir}shine/jquery.accordion.source.js"></script>
<script type="text/javascript" src="{$js_dir}shine/jquery.flexslider.js"></script>
<script type="text/javascript" src="{$js_dir}shine/jquery.jcarousel.min.js"></script>
<script type="text/javascript" src="{$js_dir}shine/custom.js"></script>
<script type="text/javascript" src="{$js_dir}shine/superfish.js"></script>

 {if $webgroup24.wg24_body_select_font_shine=="show"}
     <link href='http{if Tools::usingSecureMode()}s{/if}://fonts.googleapis.com/css?family={$webgroup24.wg24_body_google_font_shine_face}:200,200italic,300,300italic,400,400italic,600,600italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
{else}
    <link href='http{if Tools::usingSecureMode()}s{/if}://fonts.googleapis.com/css?family={$webgroup24.wg24_body_sy_font_shine_face}:200,200italic,300,300italic,400,400italic,600,600italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
{/if}
{if $webgroup24.wg24_heders_select_font_shine=="show"}
     <link href='http{if Tools::usingSecureMode()}s{/if}://fonts.googleapis.com/css?family={$webgroup24.wg24_heders_gol_font_shine_face}:200,200italic,300,300italic,400,400italic,600,600italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
{else}
 <link href='http{if Tools::usingSecureMode()}s{/if}://fonts.googleapis.com/css?family={$webgroup24.wg24_heders_sys_font_shine_face}:200,200italic,300,300italic,400,400italic,600,600italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'> 
{/if}
{$HOOK_HEADER}	

        <style type="text/css">
        
        {if $webgroup24.wg24_pro_box_quic_shine=="hide"}
            .quick-view{ display:none !important;}
          {/if}
          {if $webgroup24.wg24_pro_box_rating_shine=="hide"}
            .item-content .rating{ display:none !important;}
          {/if}
         {if $webgroup24.wg24_pro_hover_img_shine=="hide"}
          .products-grid-home .item:hover .item-inner .item-img .item-img-info a.product-image:before { background:none !important; opacity: 0; }
         {/if}
         {if $webgroup24.wg24_scrol_top_to_shine=="hide"}
          .toTop{ background:none !important; opacity: 0; }
         {/if}
        
         {if $webgroup24.wg24_p_new_sale_shine=="rounded_rectangle"}
            .new-label,.sale-label {
                padding: 8px 15px 12px !important;
                top: 4px !important;
                transform: rotate(0deg) !important;
                 -webkit-border-radius: 100%;
                -moz-border-radius:100%;
                -ms-border-radius: 100%;
                -o-border-radius:100%;
                border-radius: 100%;
            }
          {/if}
          {if $webgroup24.wg24_c_not_sidebar_des_shine=="hide"}  
           .col-main { width: 1240px; }
           .category-image img{ width:132% !important;}
           .content_scene_cat .cat_desc { width: 97.4% !important; }
           
           .products-grid .item{   margin-right: 10px !important; }
           
            .products-list .product-shop {
                width: 998px !important;
            }
          {/if}
           {if $webgroup24.wg24_p_without_sidebar_shine=="hide"}
               .product-view .product-shop{ width:770px; }
               .product-collateral,.addtional-info,.tabcontent,.product-tabs{ width:1210px; }
           {/if}
          
        body{
                {if $webgroup24.wg24_col_skin_shine=="customeskin"}
                    color:{$webgroup24.wg24_col_body_font_shine};
                {/if}

                font-family:{if $webgroup24.wg24_body_select_font_shine=="show"}{$webgroup24.wg24_body_google_font_shine_face}{else}{$webgroup24.wg24_body_sy_font_shine_face}{/if};
                font-size:{$webgroup24.wg24_body_size_font_shine}px;

                {if $webgroup24.wg24_bg_img_shine=="show"}
                    {if $webgroup24.wg24_bg_cust_patten_shine}
                        background: url("{$webgroup24.wg24_bg_cust_patten_shine}") {$webgroup24.wg24_bg_repeter_shine} {$webgroup24.wg24_bg_attached_shine} {$webgroup24.wg24_bg_positin_shine} {$webgroup24.wg24_col_body_bg_shine};
                    {else}
                        background: url("{$webgroup24.wg24_bg_patten_shine}") {$webgroup24.wg24_bg_repeter_shine} {$webgroup24.wg24_bg_attached_shine} {$webgroup24.wg24_bg_positin_shine} {$webgroup24.wg24_col_body_bg_shine};
                    {/if}
                {else}
                  
                {/if}
                {if $webgroup24.wg24_col_body_bg_shine}
                    {if $webgroup24.wg24_col_skin_shine=="customeskin"}
                        background-color:{$webgroup24.wg24_col_body_bg_shine}; 
                    {/if}
                {/if} 
            }    
          /****       all header fontfamily and transfrom              ***/ 
         h1, h2, h3, h4, h5, h6,footer h4, .block .block-title,.cart-collaterals .col2-set h3,.cart-collaterals .col2-set h3,.related-block .block-title,.up-sell-slider .block-title,.page-title h1, .page-title h2,.side-nav-categories .block-title, .slide-title,.cart .discount h2,.cart .shipping h2, #compare_shipping h3,.block-title h2,.magik-producttabs .magik-pdt-container .magik-pdt-nav .pdt-nav > li{
                font-family:{if $webgroup24.wg24_heders_select_font_shine=="show"}{$webgroup24.wg24_heders_gol_font_shine_face}{else}{$webgroup24.wg24_heders_sys_font_shine_face}{/if};
                text-transform: {$webgroup24.wg24_heders_transfrom_font_shine};
            }    
           
           /****************** heading size  *******************************/
          .magik-producttabs .magik-pdt-container .magik-pdt-nav .pdt-nav > li{ font-size:{$webgroup24.wg24_heders_p_size_font_shine}px; }
          .page-title h1, .page-title h2{ font-size:{$webgroup24.wg24_heders_pag_size_font_shine}px; }
          .block .block-title,.side-nav-categories .block-title,.popular-block .block-title{ font-size:{$webgroup24.wg24_heders_l_r_size_font_shine}px; }
         footer h4,.social h4{ font-size:{$webgroup24.wg24_fot_heders_size_font_shine}px; }
        
        </style>     
        
          {if $webgroup24.wg24_col_skin_shine=="customeskin"}
            <style type="text/css">  
                body { border-top: 3px solid {$webgroup24.wg24_col_body_top_bor_shine};}
                /******  link color  *****/
                
                .product-tabs a,.tab-box a,label,.data-table thead th, .data-table thead td, .data-table tfoot th, .data-table tfoot td, .cart .totals table th, .cart .totals table td{  color:{$webgroup24.wg24_col_body_font_shine}; }
                .cart .totals table th, .cart .totals table td{ color:{$webgroup24.wg24_col_body_font_shine} !important;  }
                .data-table .total-price .price, .cart .totals table tfoot td .price, .compare-table .price,.price,.login_page .content .form-list label,.login_page .std label, .one-page-checkout .std label,.comments_advices a,#product_comments_block_extra .comments_note span, #product_comments_block_extra .star_content,#pQuantityAvailable span{ color:{$webgroup24.wg24_col_body_font_shine} }
                
                  a, .tweet_text a{
                    color:{$webgroup24.wg24_col_link_font_shine};
                }
                /***** link hover color ********/
               a:hover, a:focus, .tweet_text a:hover{  color:{$webgroup24.wg24_col_link_h_font_shine}; }
               /**** heading color ****/
                #nav .nav-custom-link .header-nav-dropdown-wrapper h4.heading,h1, h2, h3, h4, h5, h6,footer h4, .block .block-title,.cart-collaterals .col2-set h3,.cart-collaterals .col2-set h3,.related-block .block-title,.up-sell-slider .block-title,.page-title h1, .page-title h2,.side-nav-categories .block-title, .slide-title,.cart .discount h2,.cart .shipping h2, #compare_shipping h3,.block-title h2,.magik-producttabs .magik-pdt-container .magik-pdt-nav .pdt-nav > li,.magik-producttabs .magik-pdt-container .magik-pdt-nav .pdt-nav > li.tab-nav-actived, .magik-producttabs .magik-pdt-container .magik-pdt-nav .pdt-nav > li:hover,.crosssel h2{
                color:{$webgroup24.wg24_heading_col_shine};
               } 
               /** header bottom border color ****/
              .magik-producttabs .magik-pdt-container .magik-pdt-nav .pdt-nav > li,.cart .page-title,.login_page .page-title h2,.side-nav-categories .block-title,.block .block-title,.popular-block .block-title {
               border-bottom: 1px solid {$webgroup24.wg24_heading_bord_col_shine};
              }
              /** header active color **/
             .magik-producttabs .magik-pdt-container .magik-pdt-nav .pdt-nav > li.tab-nav-actived, .magik-producttabs .magik-pdt-container .magik-pdt-nav .pdt-nav > li:hover{  
               border-bottom: 1px solid {$webgroup24.wg24_heading_sel_b_col_shine};
             } 
             
             /*********************   content bg color   **********/
            /*****   input field  ****/
            
            input.input-text, select, textarea,.form-list input.input-text,.login_page .std input[type="text"], .login_page .std input[type="password"], .login_page .std input[type="tel"], .login_page .std textarea, .login_page .std input[type="email"], .one-page-checkout .std input[type="email"], .one-page-checkout .std input[type="text"], .one-page-checkout .std input[type="password"], .one-page-checkout .std input[type="tel"], .one-page-checkout .std textarea {
                background-color: {$webgroup24.wg24_input_bg_col_shine};
                border: 1px solid {$webgroup24.wg24_input_bord_col_shine};
                color: {$webgroup24.wg24_input_text_col_shine};

            }
            /***  extra border color  *****/
            .service-section { border-bottom: 1px solid {$webgroup24.wg24_main_bord_col_shine}; } 
            .brand-logo,footer {
                border-top: 1px solid {$webgroup24.wg24_main_bord_col_shine};
            }
            .up-sell-slider .block-title,.related-block .block-title,.crosssel h2,.cart-collaterals .col2-set h3 {
                    border-bottom: 1px solid {$webgroup24.wg24_main_bord_col_shine};
             }
             .related-block,.popular-block{ border: 1px solid {$webgroup24.wg24_main_bord_col_shine}; }
          /***   category dsc  ****/
            .content_scene_cat .cat_desc {
               background-color: {$webgroup24.wg24_c_d_bg_col_shine};
                            border: 1px solid {$webgroup24.wg24_c_d_bg_b_col_shine};
                            color: {$webgroup24.wg24_c_d_bg_t_col_shine};

            }
           /*****   header    *****/
            header {
                background-color:{$webgroup24.wg24_h_m_bg_col_shine};

            }
            .toplinks ul.links li a {
            border-right: 0 solid {$webgroup24.wg24_h_m_link_b_col_shine};
            color:{$webgroup24.wg24_h_m_link_col_shine};
            }
            .toplinks .links li .click-nav ul .clicker{ color:{$webgroup24.wg24_h_m_link_col_shine}; }
            
            .toplinks ul.links li a:hover,.toplinks .links li .click-nav ul li a:hover{  color:{$webgroup24.wg24_h_m_link_h_col_shine}; }
            /*****  currency color    *******************/
            ul.currencies_list li a {
               color:{$webgroup24.wg24_h_m_link_h_col_shine}; 
            }
            ul.currencies_list li a:hover, ul.currencies_list li.selected a{
             color:{$webgroup24.wg24_h_cur_lan_link_shine}; 
            }
            .shopping_cart > a:first-child{
            color:{$webgroup24.wg24_h_cart_text_shine};
            }
           /***********************   search   ****/
            .search-section {
                background-color:{$webgroup24.wg24_sear_bar_bg_c_shine};

            }
            .button-common {
                background-color:{$webgroup24.wg24_sear_bar_b_bg_c_shine};
            }
          /*****************   main menu  ******/
            nav {
                border-bottom: 1px solid {$webgroup24.wg24_min_m_bor_b_col_shine};
                border-top: 1px solid {$webgroup24.wg24_min_m_bor_t_col_shine};
                box-shadow: 0 3px 3px {$webgroup24.wg24_min_m_2le_shdow_col_shine};
               background-color:{$webgroup24.wg24_min_m_bg_col_shine};
            }
            #nav > li a {
            color: {$webgroup24.wg24_min_m_links_col_shine};
            }   
            #nav > li.over, #nav > li:hover {
             background-color: {$webgroup24.wg24_min_m_h_bg_col_shine};
                color: {$webgroup24.wg24_min_m_h_links_col_shine};
                }
            #nav > li.over > a, #nav > li:hover > a{  color: {$webgroup24.wg24_min_m_h_links_col_shine}; }
            #nav > li.sfHoverForce{  background-color: {$webgroup24.wg24_min_m_a_bg_col_shine};  }
            #nav > li.sfHoverForce a{
                color: {$webgroup24.wg24_min_m_a_links_col_shine};
            }
            #nav > li > a > span {
                border-right: 1px solid {$webgroup24.wg24_min_m_bor_b_r_col_shine};
            }
            .form-language,.shopping_cart > a:first-child {
                border-left: 1px solid {$webgroup24.wg24_min_m_bor_b_r_col_shine};
            }
            /**************   2nd lavel   *****************/
            #nav ul{
                background:{$webgroup24.wg24_min_m_2le_bg_col_shine};
                border: 1px solid {$webgroup24.wg24_min_m_2le_b_col_shine};
                box-shadow: 5px 0 5px -5px {$webgroup24.wg24_min_m_2le_shdow_col_shine}, 0 5px 5px -5px {$webgroup24.wg24_min_m_2le_shdow_col_shine}, -5px 0 5px -5px {$webgroup24.wg24_min_m_2le_shdow_col_shine};
            }
            #nav ul li a{  background:{$webgroup24.wg24_min_m_2le_bg_col_shine}; color:{$webgroup24.wg24_min_m_sub_link_col_shine};}
            #nav ul ul{
                background:{$webgroup24.wg24_min_m_3le_bg_col_shine};
                border: 1px solid {$webgroup24.wg24_min_m_3le_b_col_shine};
                box-shadow: 5px 0 5px -5px {$webgroup24.wg24_min_m_2le_shdow_col_shine}, 0 5px 5px -5px {$webgroup24.wg24_min_m_2le_shdow_col_shine}, -5px 0 5px -5px {$webgroup24.wg24_min_m_2le_shdow_col_shine};
            }
            #nav ul ul li a{  background:{$webgroup24.wg24_min_m_3le_bg_col_shine};  color:{$webgroup24.wg24_min_m_sub_link_col_shine}; }
             #nav ul ul li a:hover,#nav ul li a:hover{ color:{$webgroup24.wg24_min_m_sub_lin_h_col_shine}; }
          
            #nav .level0-wrapper, #nav.classic .parent > ul {
                 color:{$webgroup24.wg24_min_m_sub_link_col_shine};
                background:{$webgroup24.wg24_min_m_2le_bg_col_shine};
                } 
             /***************  slider  ******************************/
             .banner-slider-container .iosSlider .slider .item h2{ color:{$webgroup24.wg24_m_s_headding_col_shine}; }
             .banner-slider-container .iosSlider .slider .item h5{ color:{$webgroup24.wg24_m_s_dsc_col_shine}; }
            .banner-slider-container .iosSlider .slider .item .btn-shop {
                border: 2px solid {$webgroup24.wg24_m_s_b_bor_col_shine}; 
                color: {$webgroup24.wg24_m_s_b_text_col_shine}; 
            }
            .banner-slider-container .iosSlider .slider .item .btn-shop:hover{  background:{$webgroup24.wg24_m_s_b_h_bg_col_shine}; border: 2px solid {$webgroup24.wg24_m_s_b_bor_col_shine}; } 
            
            
            
            /*****************   product box   **************************/
            .products-grid-home .item{  background:{$webgroup24.wg24_p_box_bg_col_shine}; }
            .products-grid-home .item .item-inner .item-img{  border: 1px solid {$webgroup24.wg24_p_box_img_b_col_shine}; }
            .products-grid-home .item:hover .item-inner .item-img .item-img-info a.product-image:before {
                background:{$webgroup24.wg24_p_box_im_h_bg_col_shine};
            }
           .products-grid-home .item .item-inner .item-img .item-img-info a.product-image:before{  background:{$webgroup24.wg24_p_box_img_bg_col_shine}; }
            .products-grid-home .item:hover .item-inner .item-info .info-inner {
                background:{$webgroup24.wg24_p_box_bot_h_bg_col_shine};
            }
            /*** *   new sale *****/
            .new-label { background:{$webgroup24.wg24_p_box_new_bg_col_shine}; }
            .sale-label { background:{$webgroup24.wg24_p_box_sale_bg_col_shine}; }
            .new-label,.sale-label{  color: {$webgroup24.wg24_p_box_s_n_text_col_shine};  }
            /********************   item tile  ************************/
            .products-grid-home  .item .item-inner .item-info .info-inner .item-title a{  color: {$webgroup24.wg24_p_box_name_col_shine}; }
            .products-grid-home  .item .item-inner .item-info .info-inner .item-title a:hover{  color: {$webgroup24.wg24_p_box_name_h_col_shine}; }
            .special-price .price{  color: {$webgroup24.wg24_p_box_name_h_col_shine};  }
            .old-price .price,.price-percent-reduction{  color: {$webgroup24.wg24_p_box_old_col_shine} !important;  }
            /*** produt box ratting   *****/
            #product_comments_block_extra div.star_on:after, .item-content .star_content div.star_on:after, .products-list .star_content div.star_on:after{ color:{$webgroup24.wg24_p_box_rat_on_col_shine} !important; }
            #product_comments_block_extra div.star:after, .item-content .star_content div.star:after, .products-list .star_content div.star:after{  color:{$webgroup24.wg24_p_box_rat_off_col_shine}; }
            /**************   button color  *************************/
            .buttons-set button.button,.cart-table a.remove-item,.product-view .product-shop .add-to-box .btn-cart,button.button,a.button,#toTop{ background:{$webgroup24.wg24_golbal_button_col_shine}; color: {$webgroup24.wg24_golbal_button_link_col_shine};}
            .cart-table a.remove-item:hover,.product-view .product-shop .add-to-box .btn-cart:hover,button.button:hover,a.button:hover,.button:hover, .button:focus, .btn:hover, .btn:focus, .button-inverse, .button-vote:hover, .sidebar .button:hover, .sidebar .button:focus, .sidebar .btn:hover, .sidebar .btn:focus, .form-list .bootstrap-select.btn-group .btn:hover .caret, .form-list .bootstrap-select.btn-group .btn:focus .caret, .buttons-set .back-link a:hover, .buttons-set .back-link a:focus, .scrolltop, .button-tabs li a:hover, .button-tabs li a:focus{ background:{$webgroup24.wg24_golbal_button_h_col_shine}; color: {$webgroup24.wg24_golbal_button_link_col_shine};  }
            
            .newsletter button.button span{ color: {$webgroup24.wg24_golbal_button_link_col_shine}; }
            .newsletter button.button:hover span{ color: {$webgroup24.wg24_golbal_button_link_col_shine};  }
                #toTop:hover {
                background-color:{$webgroup24.wg24_golbal_button_h_col_shine};
              color: {$webgroup24.wg24_golbal_button_link_col_shine} !important;
                }
              .flex-direction-nav .flex-prev:hover, .flex-direction-nav .flex-prev:focus, 
.flex-direction-nav .flex-next:hover, .flex-direction-nav .flex-next:focus{  background-color:{$webgroup24.wg24_golbal_button_h_col_shine} !important; }  
                
                
              .products-list .actions .add-to-links a.link-wishlist:hover, .products-list .actions .add-to-links a.link-compare:hover{  background:{$webgroup24.wg24_golbal_button_h_col_shine} !important; color: {$webgroup24.wg24_golbal_button_link_col_shine};  }  
             button.button.btn-proceed-checkout,.products-list .product-shop .btn-cart:hover{ background:{$webgroup24.wg24_golbal_button_h_col_shine}; color: {$webgroup24.wg24_golbal_button_link_col_shine}; }
            button.button.btn-proceed-checkout:hover{ background:{$webgroup24.wg24_golbal_button_col_shine}; color: {$webgroup24.wg24_golbal_button_link_col_shine}; }
             .btn, .button-inverse, .button-vote, .sidebar .button, .sidebar .btn, .dropdown .dropdown-menu .button, .buttons-set .back-link a, .scrolltop, .button-tabs li a{ background:{$webgroup24.wg24_golbal_button_col_shine};}
            .products-list .product-shop .btn-cart{ background:{$webgroup24.wg24_golbal_button_col_shine}; color: {$webgroup24.wg24_golbal_button_link_col_shine}; }
             .pager .button:hover, .pager .current .button, .toolbar .button:hover, .toolbar a.button-active, .toolbar span.button-active, .toolbar .btn:hover,.toolbar .button-list:hover, .toolbar .button-list:focus, .toolbar a.button-active{  background-color:{$webgroup24.wg24_golbal_button_h_col_shine};}
            button.subscribe{  background-color:{$webgroup24.wg24_golbal_button_h_col_shine}; }
              button.subscribe:hover{  background:{$webgroup24.wg24_golbal_button_col_shine}; }
              .comments_advices a:before { background:{$webgroup24.wg24_golbal_button_h_col_shine};  }
              
                    .tab-box a.activeLink {
                                 border-bottom: 2px solid {$webgroup24.wg24_golbal_button_h_col_shine};
                               }
                     .product-tabs li:hover, .product-tabs li:hover a{  border-bottom: 1px solid {$webgroup24.wg24_golbal_button_h_col_shine};  }          
              #reduction_percent, #reduction_amount{ background:{$webgroup24.wg24_golbal_button_h_col_shine};    border: 1px solid {$webgroup24.wg24_golbal_button_h_col_shine}; }
              .product-view .product-shop .price{ color:{$webgroup24.wg24_golbal_button_h_col_shine} !important; }
              .our_price_display{ color:{$webgroup24.wg24_golbal_button_col_shine}; }
            
            /********   order step  *****/
                ul#order_step li { background-color:{$webgroup24.wg24_golbal_button_col_shine};}
                ul.step li.step_current,ul.step li.step_current_end { background:#DA5555  !important;}
                ul#order_step li.step_current:after,ul#order_step li.step_current_end:after { border-left-color: #DA5555  !important; }
                ul#order_step li.step_done { background: none repeat scroll 0 0 #DA5555  !important; }
                ul#order_step li:before,ul#order_step li:after{ border:19px solid {$webgroup24.wg24_golbal_button_h_col_shine}; }
                ul#order_step li.step_done:after { border-left-color: #DA5555  !important; }
                ul#order_step li:after { border-left-color:{$webgroup24.wg24_golbal_button_col_shine} }
               /********************  Home bottom features-box   ************************************/
                .our-features-box{ background-color:{$webgroup24.wg24_hom_fea_box_bg_colo_shine};  }    
                .icon-reponsive,.icon-admin,.icon-support{  background-color:{$webgroup24.wg24_ho_fea_b_ic_bg_colo__shine};   }
               .icon-reponsive,.store-img-box .feature-box,.icon-admin,.icon-support{ color:{$webgroup24.wg24_ho_fea_b_ic_h_t_col_shine};  }
            .store-img-box .feature-box span{ color:{$webgroup24.wg24_ho_fea_b_ic_dsc_col_shine};   }
            /******************  footer *****************************/
            footer{ background-color:{$webgroup24.wg24_footer_bg_col_shine}; }
            footer h4,.social h4{ color:{$webgroup24.wg24_f_heading_col_shine};  }
            footer .footer-column a{  color:{$webgroup24.wg24_f_link_col_shine}; }
            footer .footer-column a:hover{  color:{$webgroup24.wg24_f_link_h_col_shine}; }
           .social .fb a,.social .tw a, .tweet-icon span,.social .googleplus a,.social .rss a,.social .pintrest a,.social .linkedin a,.social .youtube a,.email-friend a:before,.product-view .product-shop .add-to-links .link-wishlist:before,.product-view .product-shop .add-to-links .link-compare:before,#usefull_link_block li.print a:before{ background-color:{$webgroup24.wg24_follow_us_bg_colo_shine}; }   
             .social .fb a:hover,.social .tw a:hover, .tweet-icon span:hover,.social .googleplus a:hover,.social .rss a:hover,.social .pintrest a:hover,.social .linkedin a:hover,.social .youtube a:hover{ background-color:{$webgroup24.wg24_golbal_button_h_col_shine} !important; }    
             .tweet_text{ color:{$webgroup24.wg24_twitter_colo_shine};    }
            address{ color:{$webgroup24.wg24_address_colo_shine};   }
            .footer-bottom{ background-color:{$webgroup24.wg24_footer_bot_bg_col_shine}; }
            footer .coppyright{ color:{$webgroup24.wg24_f_powered_col_shine}; }
            
            </style>    
        {/if} 
        {if $webgroup24.wg24_col_skin_shine=="default"}
        {elseif $webgroup24.wg24_col_skin_shine=="customeskin"}  
        {else}
            <link rel="stylesheet" type="text/css" href="{$css_dir}shine/{$webgroup24.wg24_col_skin_shine}.css" media="all" />
        {/if}
        
        
        
        
        


</head>
<body{if isset($page_name)} id="{$page_name|escape:'html':'UTF-8'}"{/if} class="{if isset($page_name)}{$page_name|escape:'html':'UTF-8'}{/if}{if isset($body_classes) && $body_classes|@count} {implode value=$body_classes separator=' '}{/if}{if $hide_left_column} hide-left-column{/if}{if $hide_right_column} hide-right-column{/if}{if $content_only} content_only{/if} lang_{$lang_iso}">
{if !$content_only}
    {if isset($restricted_country_mode) && $restricted_country_mode}
            <div id="restricted-country">
                    <p>{l s='You cannot place a new order from your country.'} <span class="bold">{$geolocation_country}</span></p>
            </div>
    {/if}
    {if $webgroup24.wg24_facebook_lik_box_shine=="show"}
                    <div class=" {if $webgroup24.wg24_facebook_l_r_b_shine=="show"} fb_left {else} fb_right {/if}       hidden-phone">
                        <div id="fb_icon"></div>
                        <div class="fb_box">
                            <div class="fb-like-box" data-href="https://www.facebook.com/{$webgroup24.wg24_face_b_page_url_shine}" data-width="250"  data-show-border="false"  data-height="260" data-show-faces="true" data-colorscheme="light" data-stream="false" data-border-color="#fafafa" data-header="false"></div>       
                             <div id="fb-root"></div>
            <script type="text/javascript">(function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));
            </script>
                            <script type="text/javascript">    
                            $(function(){        
                            $(".fb_right").hover(function(){            
                            $(".fb_right").stop(true, false).animate({ right: "0" }, 800, 'easeOutQuint' );        
                            },
                            function(){            
                            $(".fb_right").stop(true, false).animate({ right: "-252" }, 800, 'easeInQuint' );        
                            },1000);    
                            });
                            $(function(){        
                            $(".fb_left").hover(function(){            
                            $(".fb_left").stop(true, false).animate({ left: "0" }, 800, 'easeOutQuint' );        
                            },
                            function(){            
                            $(".fb_left").stop(true, false).animate({ left: "-258" }, 800, 'easeInQuint' );        
                            },1000);    
                            });  
                            </script>
                        </div>
                    </div>

    {/if}

  {if isset($HOOK_TOP)}{$HOOK_TOP}{/if}  
  
  <div id="center_column" >
  
   {if $page_name !='index'}    
   <section class="main-container  {if $page_name=='category' || $page_name=='best-sales' || $page_name=='new-products' || $page_name=='prices-drop' || $page_name=='search' || $page_name=='manufacturer' || $page_name=='supplier'}  {if $webgroup24.wg24_c_not_sidebar_des_shine=="show"} col2-left-layout  {else} {/if}   {/if}">
        <article class="main-container-inner">
    {/if}
            {if $page_name !='index' && $page_name !='pagenotfound'}
                {include file="$tpl_dir./breadcrumb.tpl"}
            {/if}
  
  
  
{/if}

