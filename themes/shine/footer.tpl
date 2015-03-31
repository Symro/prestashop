{*
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

{if !$content_only}
    {if $page_name !='index'}     
    </article>
</section>   
{/if} 
</div>    


{if $page_name !='index'}  
    {if $webgroup24.wg24_home_slid_b_ser_ms_text_shine !=""}
        <section class="service-section service-section1">
            {$webgroup24.wg24_home_slid_b_ser_ms_text_shine|html_entity_decode}
        </section>
    {/if}   
{/if}  


<footer>
    <div class="inner">
        {$HOOK_FOOTER}
    </div>
    <div class="twitter-box">
                <script type="text/javascript" charset="utf-8" src="{$img_dir}twitteroauth/jquery.tweet.js"></script>   
                <script type="text/javascript">
                    jQuery(document).ready(function($) {
                    $('.tweet_listing').tweet({
                    modpath: '{$img_dir}twitteroauth/',
                    count:{$webgroup24.wg24_count_twitter_shine},
                    username: '{$webgroup24.wg24_twit_id_shine}',
                    loading_text: 'loading twitter feed...'
                });
          
        jQuery('.twitter-box ul.tweet_list').bxSlider({
        mode: 'vertical',
        pager: false,
          auto: true,
        autoStart: true,
         autoHover: false
        });
            });
                </script>
    <div class="tweet_listing" ></div>
    <div class="follow-link">
        <a href="http://twitter.com/{$webgroup24.wg24_twit_id_shine}/">{l s='Follow us on Twitter'}</a>
    </div>
    </div>
    <div class="clear"></div>
    <div style="text-align:center"> 
        <a class="logo" href="{$base_dir}" title="{$shop_name|escape:'html':'UTF-8'}">
            <img  src="{$logo_url}" alt="{$shop_name|escape:'html':'UTF-8'}"{if $logo_image_width} width="{$logo_image_width}"{/if}{if $logo_image_height} height="{$logo_image_height}"{/if}/>
        </a>
    </div>

    {if $webgroup24.wg24_footer_cont_info_shine!=""}       
        <address>
            {$webgroup24.wg24_footer_cont_info_shine|html_entity_decode}
        </address>
    {/if}	

    <div class="footer-bottom">
        <div class="inner">
            <div class="coppyright">

                {$webgroup24.wg24_footer_copy_text_shine|html_entity_decode} 

            </div>
            <div class="bottom_links">
                <ul class="links">
                    {if $webgroup24.wg24_fot_paypla_id_shine !=''}  
                        <li> <a href="{$webgroup24.wg24_fot_paypla_id_shine}" onclick="target='_blank'"><img src="{$img_dir}payment/ppl.png" alt="PayPal"  /></a> </li>
                            {/if}  
                            {if $webgroup24.wg24_fot_visaelectron_id_shine !=''}  
                        <li> <a href="{$webgroup24.wg24_fot_visaelectron_id_shine}" onclick="target='_blank'"><img src="{$img_dir}payment/ve.png" alt="VisaElectron" /></a></li>
                            {/if} 
                            {if $webgroup24.wg24_fot_discover_id_shine !=''}  
                        <li> <a href="{$webgroup24.wg24_fot_discover_id_shine}" onclick="target='_blank'"><img src="{$img_dir}payment/Dscr.png" alt="discover"  /></a></li>
                            {/if} 
                            {if $webgroup24.wg24_fot_visa_id_shine !=''}
                        <li> <a href="{$webgroup24.wg24_fot_visa_id_shine}" onclick="target='_blank'"><img src="{$img_dir}payment/Visa.png" alt="visa"  /></a></li>
                            {/if}  
                            {if $webgroup24.wg24_fot_mastercard_id_shine !=''}
                        <li> <a href="{$webgroup24.wg24_fot_mastercard_id_shine}" onclick="target='_blank'"><img src="{$img_dir}payment/MC.png" alt="mastercard"  /></a></li>
                            {/if} 
                            {if $webgroup24.wg24_fot_maestro_id_shine !=''} 
                        <li><a href="{$webgroup24.wg24_fot_maestro_id_shine}" onclick="target='_blank'"><img src="{$img_dir}payment/Maestro.png" alt="Maestro"  /></a></li>
                            {/if}   
                            {if $webgroup24.wg24_fot_americanexpress_id_shine !=''} 
                        <li><a href="{$webgroup24.wg24_fot_americanexpress_id_shine}" onclick="target='_blank'"><img src="{$img_dir}payment/AmericanExpress.png" alt="americanexpress"  /></a></li>
                            {/if}  
                            {if $webgroup24.wg24_fot_paycon_1_shine !='' && $webgroup24.wg24_fot_cus_pay1_id_shine !=''} 
                        <li><a href="{$webgroup24.wg24_fot_cus_pay1_id_shine}" onclick="target='_blank'"><img src=" {$webgroup24.wg24_fot_paycon_1_shine}" alt=""  /></a></li>
                            {/if}    
                            {if $webgroup24.wg24_fot_paycon_2_shine !='' && $webgroup24.wg24_fot_cus_pay2_id_shine !=''} 
                        <li><a href="{$webgroup24.wg24_fot_cus_pay2_id_shine}" onclick="target='_blank'"><img src="{$webgroup24.wg24_fot_paycon_2_shine}" alt="" /></a></li>
                            {/if}    
                </ul>
            </div>
        </div>
    </div>
{/if}
{include file="$tpl_dir./global.tpl"} 
</footer>

<script type="text/javascript">
        jQuery(document).ready(function($){
        $(".button-grid").click(function(e) {
        $(".category-products ul.products-grid").fadeIn();
        $(".category-products ol.products-list").fadeOut();
        $(this).addClass('button-active');
        $('.button-list').removeClass('button-active');
        e.preventDefault();
        });
        $(".button-list").click(function(e) {
        $(".category-products ul.products-grid").fadeOut();
        $(".category-products ol.products-list").fadeIn();
        $(this).addClass('button-active');
        $('.button-grid').removeClass('button-active');
        e.preventDefault(); });
        })
            {if $webgroup24.wg24_c_list_grid_shine=="grid_view"}
        jQuery(document).ready(function($){
        $(".category-products ul.products-grid").fadeIn();
        $(".category-products ol.products-list").fadeOut();
        $('.button-grid').addClass('button-active');
        $('.button-list').removeClass('button-active');
        });
            {else}
        jQuery(document).ready(function($){
        $(".category-products ul.products-grid").fadeOut();
        $(".category-products ol.products-list").fadeIn();
        $('.button-grid').removeClass('button-active');
        $('.button-list').addClass('button-active');
        });
            {/if}
        </script>
 {if isset($webgroup24.wg24_them_custom_css_shine)}{$webgroup24.wg24_them_custom_css_shine|html_entity_decode}{/if}
{if isset($webgroup24.wg24_them_custom_js_shine)}{$webgroup24.wg24_them_custom_js_shine|html_entity_decode}{/if}
{if isset($webgroup24.wg24_thme_track_codes_shine)}{$webgroup24.wg24_thme_track_codes_shine|html_entity_decode}{/if}    
</body>
</html>
