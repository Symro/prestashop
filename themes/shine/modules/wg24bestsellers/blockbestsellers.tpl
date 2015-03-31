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

<!-- MODULE Block best sellers -->

    
    
  <div class="related-block"  id="best-sellers_block_right">
    <div class="block-title">{l s='Top sellers' mod='wg24bestsellers'}</div>
    <div class="block-content">
        <div class=" jcarousel-skin-tango4" >
            <div class="jcarousel-container jcarousel-container-horizontal" >
                 <a href="#" class="jcarousel-prev-horizontal1" id="bproducts_slider_prev1"></a> <a href="#" class="jcarousel-next-horizontal1" id="bproducts_slider_next1"></a>
                <div class="jcarousel-clip jcarousel-clip-horizontal">
                      {if $best_sellers && $best_sellers|@count > 0}  
                    <ul  id="mycarousel4" class="products-grid last even jcarousel-list jcarousel-list-horizontal">
                        
                     {foreach from=$best_sellers item=product name=myLoop} 
                        
                        <li jcarouselindex="1"  class="jcarousel-item jcarousel-item-horizontal jcarousel-item-1 jcarousel-item-1-horizontal">
                            <div class="inner">
                                <div class="view-first">
                            <div class="product-image1">
                            <a href="#">
                                    {if isset($product.new) && $product.new == 1}
                            <span class="new-box">
                            <span class="new-label">{l s='New' mod='wg24bestsellers'}</span>
                            </span>
                            {/if}
                            {if isset($product.on_sale) && $product.on_sale && isset($product.show_price) && $product.show_price && !$PS_CATALOG_MODE}
                            <span class="sale-box">
                            <span class="sale-label">{l s='Sale' mod='wg24bestsellers'}</span>
                            </span>
                            {/if}
                                    <img src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'home_default')|escape:'html'}"
                            height="230" width="230"
                            alt="{$product.legend|escape:'html':'UTF-8'}"/>
                            </a>
                            </div>
                                </div>
                                <div class="prod_image_detail">
                                    <div class="product-name">
                                        <h4><a href="{$product.link|escape:'html'}" title="{$product.legend|escape:'html':'UTF-8'}">
                                              {$product.name|strip_tags:'UTF-8'|escape:'html':'UTF-8'}<br/>
                             
                                     </a></h4>
                                    </div>
                                        <div class="price-box">
                                        <p class="old-price">
                                            {if ((isset($product.on_sale) && $product.on_sale) || (isset($product.reduction) && $product.reduction)) && $product.price_without_reduction > $product.price && $product.show_price AND !isset($restricted_country_mode) && !$PS_CATALOG_MODE}
                                            <span class="price">
                                            {convertPrice price=$product.price_without_reduction}
                                            </span>
                                            {else}     
                                            {/if}
                                            </p>
                                            <p class="special-price">
                                            {if $product.show_price AND !isset($restricted_country_mode) AND !$PS_CATALOG_MODE}   <span class="price">{if !$priceDisplay}{convertPrice price=$product.price}{else}{convertPrice price=$product.price_tax_exc}{/if}</span>{else}<span style="height:21px;"></span>{/if}
                                            </p>
                                        </div>
                                                <div class="actions">
                                                        {if ($product.id_product_attribute == 0 OR (isset($add_prod_display) AND ($add_prod_display == 1))) AND $product.available_for_order AND !isset($restricted_country_mode) AND $product.minimal_quantity == 1 AND $product.customizable != 2 AND !$PS_CATALOG_MODE}   
                                                <button class="button btn-cart ajax_add_to_cart_button" data-rel="ajax_id_product_{$product.id_product}" onclick='href="{$link->getPageLink('cart')|escape:'html'}?qty=1&amp;id_product={$product.id_product}&amp;token={$static_token}&amp;add"' title="{l s='Add to cart' mod='wg24bestsellers'}"><span>{l s='Add to cart' mod='wg24bestsellers'}</span></button>

                                                {/if}
                                       
                                    </div>
                                </div>
                            </div>
                        </li>
                        
                     {/foreach}   
                        
          <script type="text/rocketscript" data-rocketoptimized="true">
jQuery(document).ready(function($) {

  function mycarousel_initCallback(carousel) {
      $('#bproducts_slider_next1').bind('click', function() {
          carousel.next();
          return false;
      });
      $('#bproducts_slider_prev1').bind('click', function() {
          carousel.prev();
          return false;
      });
  };

    $('#mycarousel4').jcarousel({
      scroll: 1,
      initCallback: mycarousel_initCallback,
      buttonNextHTML: null,
      buttonPrevHTML: null
    });
});
</script>           
                        
                </div>
               {else}
                    <p>{l s='No best sellers at this time' mod='wg24bestsellers'}</p>
                    {/if}        
            </div>
        </div>
    </div>
</div>  
<!-- /MODULE Block best sellers -->
