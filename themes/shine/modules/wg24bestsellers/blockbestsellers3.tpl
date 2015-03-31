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




<div class="crosssel">
    <h2>{l s='Top sellers' mod='wg24bestsellers'}</h2>
    <div class="category-products">
        {if $best_sellers && $best_sellers|@count > 0} 
              <a href="#" class="jcarousel-prev-horizontal1" id="products_slider_prev1"></a> <a href="#" class="jcarousel-next-horizontal1" id="products_slider_next1"></a>
        <div class="jcarousel-skin-tango5">
            <ul id="crosssell-products-list" class="products-grid first odd">
   {foreach from=$best_sellers item=product name=myLoop} 

                    <li class="ajax_block_product {if $smarty.foreach.myLoop.first}first {elseif $smarty.foreach.myLoop.last}last {else}{/if}item">
                        <div class="item-inner" itemscope itemtype="http://schema.org/Product">
                            <div class="item-img">
                                <div class="item-img-info">
                                    <a class="product_img_link product-image"	href="{$product.link|escape:'html':'UTF-8'}" title="{$product.name|escape:'html':'UTF-8'}" itemprop="url">
                                        <img class="replace-2x img-responsive" src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'home_default')|escape:'html':'UTF-8'}" alt="{if !empty($product.legend)}{$product.legend|escape:'html':'UTF-8'}{else}{$product.name|escape:'html':'UTF-8'}{/if}" title="{if !empty($product.legend)}{$product.legend|escape:'html':'UTF-8'}{else}{$product.name|escape:'html':'UTF-8'}{/if}"  width="230" height="230" itemprop="image" />
                                    </a>
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
                                    <div class="item-box-hover">
                                        <div class="box-inner">
                                            <div class="add_cart">
                                                {if ($product.id_product_attribute == 0 || (isset($add_prod_display) && ($add_prod_display == 1))) && $product.available_for_order && !isset($restricted_country_mode) && $product.minimal_quantity <= 1 && $product.customizable != 2 && !$PS_CATALOG_MODE}
                                                    {if ($product.allow_oosp || $product.quantity > 0)}
                                                        {if isset($static_token)}
                                                            <button class="button ajax_add_to_cart_button btn-cart" onclick="href='{$link->getPageLink('cart',false, NULL, "add=1&amp;id_product={$product.id_product|intval}&amp;token={$static_token}", false)|escape:'html':'UTF-8'}'" rel="nofollow" title="{l s='Add to cart'}" data-id-product="{$product.id_product|intval}">
                                                                <span>{l s='Add to cart' mod='wg24bestsellers'}</span>
                                                            </button>
                                                        {else}
                                                            <button class="button ajax_add_to_cart_button btn  btn-cart" onclick="href='{$link->getPageLink('cart',false, NULL, 'add=1&amp;id_product={$product.id_product|intval}', false)|escape:'html':'UTF-8'}'" rel="nofollow" title="{l s='Add to cart'}" data-id-product="{$product.id_product|intval}">
                                                                <span>{l s='Add to cart' mod='wg24bestsellers'}</span>
                                                            </button>
                                                        {/if}						
                                                    {else}
                                                        <button class="button ajax_add_to_cart_button btn  btn-cart disabled">
                                                            <span>{l s='Add to cart' mod='wg24bestsellers'}</span>
                                                        </button>
                                                    {/if}
                                                {/if}
                                            </div>												  
                                            <div class="product-detail-bnt">

                                                {if isset($quick_view) && $quick_view}
                                                    <a class="quick-view button detail-bnt" href="{$product.link|escape:'html':'UTF-8'}" rel="{$product.link|escape:'html':'UTF-8'}">
                                                        <span>{l s='Quick view' mod='wg24bestsellers'}</span>
                                                    </a>
                                                {/if}
                                            </div>				   
                                        </div>
                                    </div>
                                </div>
                            </div> 
                            <div class="item-info">
                                <div class="info-inner">
                                    <div class="item-title">
                                    {if isset($product.pack_quantity) && $product.pack_quantity}{$product.pack_quantity|intval|cat:' x '}{/if}
                                    <a href="{$product.link|escape:'html':'UTF-8'}" title="{$product.name|escape:'html':'UTF-8'}" itemprop="url" >
                                        {$product.name|truncate:45:'...'|escape:'html':'UTF-8'}
                                    </a>
                                </div>
                                <div class="item-content">
                                    <div class="rating">
                                        <div class="ratings">
                                            {hook h='displayProductListReviews' product=$product}
                                        </div>
                                    </div>

                                    {if (!$PS_CATALOG_MODE AND ((isset($product.show_price) && $product.show_price) || (isset($product.available_for_order) && $product.available_for_order)))}
                                        <div itemprop="offers" itemscope itemtype="http://schema.org/Offer" class="content_price item-price  ">
                                            <div class="price-box">
                                                <meta itemprop="priceCurrency" content="{$priceDisplay}" />
                                                {if isset($product.specific_prices) && $product.specific_prices && isset($product.specific_prices.reduction) && $product.specific_prices.reduction}
                                                    <span class="old-price product-price">
                                                        <span class="price">
                                                            {displayWtPrice p=$product.price_without_reduction}
                                                        </span>
                                                    </span>
                                                    {if $product.specific_prices.reduction_type == 'percentage'}
                                                        <span class="price-percent-reduction">-{$product.specific_prices.reduction * 100}%</span>
                                                    {/if}
                                                {/if}
                                                {if isset($product.show_price) && $product.show_price && !isset($restricted_country_mode)}
                                                    <span itemprop="price" class="price product-price regular-price special-price">
                                                        <span class="price">
                                                    {if !$priceDisplay}{convertPrice price=$product.price}{else}{convertPrice price=$product.price_tax_exc}{/if}
                                                </span>
                                            </span>

                                        {/if}
                                    </div>
                                </div>
                            {/if}
                        </div>
                    </div>
                </div>                 
            </div><!-- .product-container> -->
        </li>
    {/foreach}  


</ul> 

 <script type="text/rocketscript" data-rocketoptimized="true">
jQuery(document).ready(function($) {

  function mycarousel_initCallback(carousel) {
      $('#products_slider_next1').bind('click', function() {
          carousel.next();
          return false;
      });
      $('#products_slider_prev1').bind('click', function() {
          carousel.prev();
          return false;
      });
  };

    $('#crosssell-products-list').jcarousel({
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



<!-- /MODULE Block best sellers -->
