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
{if isset($products) && $products}
    {*define numbers of product per line in other page for desktop*}

    {if $webgroup24.wg24_c_not_sidebar_des_shine=="hide"}
    {$defalult_class = 4}
{else}
    {$defalult_class = 3}
{/if}


    {if $page_name !='index' && $page_name !='product'}

        {assign var='nbItemsPerLine' value=$defalult_class}
        {assign var='nbItemsPerLineTablet' value=2}
        {assign var='nbItemsPerLineMobile' value=3}
    {else}
        {assign var='nbItemsPerLine' value=5}
        {assign var='nbItemsPerLineTablet' value=3}
        {assign var='nbItemsPerLineMobile' value=2}
    {/if}
    {*define numbers of product per line in other page for tablet*}
    {assign var='nbLi' value=$products|@count}
    {math equation="nbLi/nbItemsPerLine" nbLi=$nbLi nbItemsPerLine=$nbItemsPerLine assign=nbLines}
    {math equation="nbLi/nbItemsPerLineTablet" nbLi=$nbLi nbItemsPerLineTablet=$nbItemsPerLineTablet assign=nbLinesTablet}
    <!-- Products list -->
    <div id="product_list-grid_box">

        <ul  {if isset($id) && $id} id="{$id}"{/if} class="  {if $page_name=='index'} product_list {else} products-grid{/if} {if isset($class) && $class} {$class}{/if}{if isset($active) && $active == 1} active{/if}" id="products-grid" >
            {foreach from=$products item=product name=products}
                {math equation="(total%perLine)" total=$smarty.foreach.products.total perLine=$nbItemsPerLine assign=totModulo}
                {math equation="(total%perLineT)" total=$smarty.foreach.products.total perLineT=$nbItemsPerLineTablet assign=totModuloTablet}
                {math equation="(total%perLineT)" total=$smarty.foreach.products.total perLineT=$nbItemsPerLineMobile assign=totModuloMobile}
            {if $totModulo == 0}{assign var='totModulo' value=$nbItemsPerLine}{/if}
        {if $totModuloTablet == 0}{assign var='totModuloTablet' value=$nbItemsPerLineTablet}{/if}
    {if $totModuloMobile == 0}{assign var='totModuloMobile' value=$nbItemsPerLineMobile}{/if}
    <li style="-webkit-animation-delay:300ms;-moz-animation-delay:300ms;-o-animation-delay:300ms;animation-delay:300ms;" class="ajax_block_product{if $smarty.foreach.products.iteration%$nbItemsPerLine == 0} last {elseif $smarty.foreach.products.iteration%$nbItemsPerLine == 1}   {if $page_name=='index'} wide-first{else} first {/if}      {/if}{if $smarty.foreach.products.iteration > ($smarty.foreach.products.total - $totModulo)} {/if} item item-animate ">
        <div class="item-inner" itemscope itemtype="http://schema.org/Product">
            <div class="item-img">
                <div class="item-img-info" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
                    <a class="product_img_link product-image"	href="{$product.link|escape:'html':'UTF-8'}" title="{$product.name|escape:'html':'UTF-8'}" itemprop="url">
                        <img class="replace-2x img-responsive" src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'home_default')|escape:'html':'UTF-8'}" alt="{if !empty($product.legend)}{$product.legend|escape:'html':'UTF-8'}{else}{$product.name|escape:'html':'UTF-8'}{/if}" title="{if !empty($product.legend)}{$product.legend|escape:'html':'UTF-8'}{else}{$product.name|escape:'html':'UTF-8'}{/if}" {if isset($homeSize)} width="{$homeSize.width}" height="{$homeSize.height}"{/if} itemprop="image" />
                    </a>
                    {if isset($product.new) && $product.new == 1}
                        <span class="new-box">
                            <span class="new-label">{l s='New'}</span>
                        </span>
                    {/if}
                    {if isset($product.on_sale) && $product.on_sale && isset($product.show_price) && $product.show_price && !$PS_CATALOG_MODE}
                        <span class="sale-box">
                            <span class="sale-label">{l s='Sale'}</span>
                        </span>
                    {/if}
                    <div class="item-box-hover">
                        <div class="box-inner">
                            <div class="add_cart">
                                {if ($product.id_product_attribute == 0 || (isset($add_prod_display) && ($add_prod_display == 1))) && $product.available_for_order && !isset($restricted_country_mode) && $product.minimal_quantity <= 1 && $product.customizable != 2 && !$PS_CATALOG_MODE}
                                    {if ($product.allow_oosp || $product.quantity > 0)}
                                        {if isset($static_token)}
                                            <button class="button ajax_add_to_cart_button btn-cart" onclick="href='{$link->getPageLink('cart',false, NULL, "add=1&amp;id_product={$product.id_product|intval}&amp;token={$static_token}", false)|escape:'html':'UTF-8'}'" rel="nofollow" title="{l s='Add to cart'}" data-id-product="{$product.id_product|intval}">
                                                <span>{l s='Add to cart'}</span>
                                            </button>
                                        {else}
                                            <button class="button ajax_add_to_cart_button btn  btn-cart" onclick="href='{$link->getPageLink('cart',false, NULL, 'add=1&amp;id_product={$product.id_product|intval}', false)|escape:'html':'UTF-8'}'" rel="nofollow" title="{l s='Add to cart'}" data-id-product="{$product.id_product|intval}">
                                                <span>{l s='Add to cart'}</span>
                                            </button>
                                        {/if}
                                    {else}
                                        <button class="button ajax_add_to_cart_button btn  btn-cart disabled">
                                            <span>{l s='Add to cart'}</span>
                                        </button>
                                    {/if}
                                {/if}
                            </div>
                            <div class="product-detail-bnt">

                                <!-- {if isset($quick_view) && $quick_view}
                                    <a class="quick-view button detail-bnt" href="{$product.link|escape:'html':'UTF-8'}" rel="{$product.link|escape:'html':'UTF-8'}">
                                        <span>{l s='Quick view'}</span>
                                    </a>
                                {/if} -->
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






{if $page_name !='index'}
    <ol id="products-list" class="products-list" style="display:none;">
        {foreach from=$products item=product name=products}
            <li class="ajax_block_product {if $smarty.foreach.products.first}first {elseif $smarty.foreach.products.last}last {else}{/if}item">


                <div class="product-image">

                    <a class="product_img_link product-image"	href="{$product.link|escape:'html':'UTF-8'}" title="{$product.name|escape:'html':'UTF-8'}" itemprop="url">
                        <img class="small-image" src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'home_default')|escape:'html':'UTF-8'}" alt="{if !empty($product.legend)}{$product.legend|escape:'html':'UTF-8'}{else}{$product.name|escape:'html':'UTF-8'}{/if}" title="{if !empty($product.legend)}{$product.legend|escape:'html':'UTF-8'}{else}{$product.name|escape:'html':'UTF-8'}{/if}"  width="230"  itemprop="image" />
                    </a>
                    {if isset($product.new) && $product.new == 1}
                        <span class="new-box">
                            <span class="new-label">{l s='New'}</span>
                        </span>
                    {/if}
                    {if isset($product.on_sale) && $product.on_sale && isset($product.show_price) && $product.show_price && !$PS_CATALOG_MODE}
                        <span class="sale-box">
                            <span class="sale-label">{l s='Sale'}</span>
                        </span>
                    {/if}
                </div>

                <div class="product-shop">
                    <h2 class="product-name">
                    {if isset($product.pack_quantity) && $product.pack_quantity}{$product.pack_quantity|intval|cat:' x '}{/if}
                    <a href="{$product.link|escape:'html':'UTF-8'}" title="{$product.name|escape:'html':'UTF-8'}" itemprop="url" >
                        {$product.name|truncate:45:'...'|escape:'html':'UTF-8'}
                    </a>
                </h2>
                <div class="ratings">
                    {hook h='displayProductListReviews' product=$product}
                </div>
                <div class="desc std">
                    <p class="product-desc" itemprop="description">
                        {$product.description_short|strip_tags:'UTF-8'|truncate:360:'...'}
                        <a href="{$product.link|escape:'html':'UTF-8'}" title="" class="link-learn">{l s="Learn More"}</a>
                    </p>
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
        <div class="actions">


            {if ($product.id_product_attribute == 0 || (isset($add_prod_display) && ($add_prod_display == 1))) && $product.available_for_order && !isset($restricted_country_mode) && $product.minimal_quantity <= 1 && $product.customizable != 2 && !$PS_CATALOG_MODE}
                {if ($product.allow_oosp || $product.quantity > 0)}
                    {if isset($static_token)}
                        <button class="button ajax_add_to_cart_button btn-cart" onclick="href='{$link->getPageLink('cart',false, NULL, "add=1&amp;id_product={$product.id_product|intval}&amp;token={$static_token}", false)|escape:'html':'UTF-8'}'" rel="nofollow" title="{l s='Add to cart'}" data-id-product="{$product.id_product|intval}">
                            <span>{l s='Add to cart'}</span>
                        </button>
                    {else}
                        <button class="button ajax_add_to_cart_button btn  btn-cart" onclick="href='{$link->getPageLink('cart',false, NULL, 'add=1&amp;id_product={$product.id_product|intval}', false)|escape:'html':'UTF-8'}'" rel="nofollow" title="{l s='Add to cart'}" data-id-product="{$product.id_product|intval}">
                            <span>{l s='Add to cart'}</span>
                        </button>
                    {/if}
                {else}
                    <button class="button ajax_add_to_cart_button btn  btn-cart disabled">
                        <span>{l s='Add to cart'}</span>
                    </button>
                {/if}
            {/if}


            <span class="add-to-links">
                {hook h='displayProductListFunctionalButtons' product=$product}
                {if isset($comparator_max_item) && $comparator_max_item}
                    <a class="button link-compare add_to_compare bt_compare" href="{$product.link|escape:'html':'UTF-8'}" data-id-product="{$product.id_product}"><span>{l s='Add to Compare'}</span></a>

                {/if}
            </span>
        </div>
    </div>
</li>
{/foreach}


</ol>

{/if}
</div>
{addJsDefL name=min_item}{l s='Please select at least one product' js=1}{/addJsDefL}
{addJsDefL name=max_item}{l s='You cannot add more than %d product(s) to the product comparison' sprintf=$comparator_max_item js=1}{/addJsDefL}
{addJsDef comparator_max_item=$comparator_max_item}
{addJsDef comparedProductsIds=$compared_products}

{/if}