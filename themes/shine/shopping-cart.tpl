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

{capture name=path}{l s='Your shopping cart'}{/capture}




<div class="cart clearfix">
    <div class="page-title">
        <h2 id="cart_title" class="page-heading">{l s='Shopping-cart summary'}


            {if !isset($empty) && !$PS_CATALOG_MODE}
                <span class="heading-counter">{l s='Your shopping cart contains:'}
                    <span id="summary_products_quantity">{$productNumber} {if $productNumber == 1}{l s='product'}{else}{l s='products'}{/if}</span>
                </span>
            {/if}

        </h2>

    </div>



    {if isset($account_created)}
        <p class="alert alert-success">
            {l s='Your account has been created.'}
        </p>
    {/if}

    {assign var='current_step' value='summary'}
    {include file="$tpl_dir./order-steps.tpl"}
    {include file="$tpl_dir./errors.tpl"}

    {if isset($empty)}
        <p class="alert alert-warning">{l s='Your shopping cart is empty.'}</p>
    {elseif $PS_CATALOG_MODE}
        <p class="alert alert-warning">{l s='This store has not accepted your new order.'}</p>
    {else}
        <p style="display:none" id="emptyCartWarning" class="alert alert-warning">{l s='Your shopping cart is empty.'}</p>
        {if isset($lastProductAdded) AND $lastProductAdded}
            <div class="cart_last_product">
                <div class="cart_last_product_header">
                    <div class="left">{l s='Last product added'}</div>
                </div>
                <a class="cart_last_product_img" href="{$link->getProductLink($lastProductAdded.id_product, $lastProductAdded.link_rewrite, $lastProductAdded.category, null, null, $lastProductAdded.id_shop)|escape:'html':'UTF-8'}">
                    <img src="{$link->getImageLink($lastProductAdded.link_rewrite, $lastProductAdded.id_image, 'small_default')|escape:'html':'UTF-8'}"  width="60" height="60"  alt="{$lastProductAdded.name|escape:'html':'UTF-8'}"/>
                </a>
                <div class="cart_last_product_content">
                    <p class="product-name">
                        <a href="{$link->getProductLink($lastProductAdded.id_product, $lastProductAdded.link_rewrite, $lastProductAdded.category, null, null, null, $lastProductAdded.id_product_attribute)|escape:'html':'UTF-8'}">
                            {$lastProductAdded.name|escape:'html':'UTF-8'}
                        </a>
                    </p>
                    {if isset($lastProductAdded.attributes) && $lastProductAdded.attributes}
                        <small>
                            <a href="{$link->getProductLink($lastProductAdded.id_product, $lastProductAdded.link_rewrite, $lastProductAdded.category, null, null, null, $lastProductAdded.id_product_attribute)|escape:'html':'UTF-8'}">
                                {$lastProductAdded.attributes|escape:'html':'UTF-8'}
                            </a>
                        </small>
                    {/if}
                </div>

            </div>
        {/if}
        {assign var='total_discounts_num' value="{if $total_discounts != 0}1{else}0{/if}"}
        {assign var='use_show_taxes' value="{if $use_taxes && $show_taxes}2{else}0{/if}"}
        {assign var='total_wrapping_taxes_num' value="{if $total_wrapping != 0}1{else}0{/if}"} 



        <div id="order-detail-content" class="table_block table-responsive">
            <table  id="cart_summary" class="table table-bordered data-table cart-table">
                <colgroup>
                    <col width="1">
                    <col>
                    <col>
                    <col width="1">
                    <col>
                    <col width="1">
                    <col width="1">
                    <col width="1">
                </colgroup>          
                <thead>
                    <tr class="first last">
                        <th class=" cart_product" rowspan="1">{l s='Product'}</th>
                        <th rowspan="1" class="cart_description"><span class="nobr">{l s='Description'}</span></th>
                        {if $PS_STOCK_MANAGEMENT}
                            <th  class="a-left cart_avail">{l s='Avail.'}</th>
                        {/if}
                        <th colspan="1" class="a-left e cart_unit">{l s='Unit price'}</th>
                        <th class="a-left cart_quantity" rowspan="1">{l s='Qty'}</th>
                        <th colspan="1" class="a-left cart_total">{l s='Total'}</th> 
                        <th class="a-left cart_delete" rowspan="1">&nbsp;</th>
                    </tr>
                </thead>   
                <tfoot>

                    <tr class="first last">
                        <td class="a-right last" colspan="50">

                            <p class="cart_navigation clearfix">
                                {if !$opc}
                                    <button
                                        onclick="location.href='{if $back}{$link->getPageLink('order', true, NULL, 'step=1&amp;back={$back}')|escape:'html':'UTF-8'}{else}{$link->getPageLink('order', true, NULL, 'step=1')|escape:'html':'UTF-8'}{/if}'"
                                        class="button btn-update standard-checkout button-medium"
                                        title="{l s='Proceed to checkout'}">
                                        <span><span>{l s='Proceed to checkout'}</span></span>
                                    </button>
                                {/if}
                                <button onclick="location.href='{if (isset($smarty.server.HTTP_REFERER) && strstr($smarty.server.HTTP_REFERER, 'order.php')) || isset($smarty.server.HTTP_REFERER) && strstr($smarty.server.HTTP_REFERER, 'order-opc') || !isset($smarty.server.HTTP_REFERER)}{$link->getPageLink('index')}{else}{$smarty.server.HTTP_REFERER|escape:'html':'UTF-8'|secureReferrer}{/if}'"
                                        class="button btn-continue"
                                        title="{l s='Continue shopping'}">
                                    <span><span> {l s='Continue shopping'}</span></span>
                                </button>
                            </p>  
                        </td>
                    </tr>   




                    {if $use_taxes}
                        {if $priceDisplay}
                            <tr class="cart_total_price">
                                <td rowspan="{3+$total_discounts_num+$use_show_taxes+$total_wrapping_taxes_num}" colspan="2" id="cart_voucher" class="cart_voucher">

                                </td>
                                <td colspan="3" class="text-right">{if $display_tax_label}{l s='Total products (tax excl.)'}{else}{l s='Total products'}{/if}</td>
                                <td colspan="2" class="price" id="total_product">{displayPrice price=$total_products}</td>
                            </tr>
                        {else}
                            <tr class="cart_total_price">
                                <td rowspan="{3+$total_discounts_num+$use_show_taxes+$total_wrapping_taxes_num}" colspan="2" id="cart_voucher" class="cart_voucher">

                                </td>
                                <td colspan="3" class="text-right">{if $display_tax_label}{l s='Total products (tax incl.)'}{else}{l s='Total products'}{/if}</td>
                                <td colspan="2" class="price" id="total_product">{displayPrice price=$total_products_wt}</td>
                            </tr>
                        {/if}
                    {else}
                        <tr class="cart_total_price">
                            <td rowspan="{3+$total_discounts_num+$use_show_taxes+$total_wrapping_taxes_num}" colspan="2" id="cart_voucher" class="cart_voucher">

                            </td>
                            <td colspan="3" class="text-right">{l s='Total products'}</td>
                            <td colspan="2" class="price" id="total_product">{displayPrice price=$total_products}</td>
                        </tr>
                    {/if}
                    <tr{if $total_wrapping == 0} style="display: none;"{/if}>
                        <td colspan="3" class="text-right">
                            {if $use_taxes}
                        {if $display_tax_label}{l s='Total gift wrapping (tax incl.):'}{else}{l s='Total gift-wrapping cost:'}{/if}
                    {else}
                        {l s='Total gift-wrapping cost:'}
                    {/if}
                </td>
                <td colspan="2" class="price-discount price" id="total_wrapping">
                    {if $use_taxes}
                        {if $priceDisplay}
                            {displayPrice price=$total_wrapping_tax_exc}
                        {else}
                            {displayPrice price=$total_wrapping}
                        {/if}
                    {else}
                        {displayPrice price=$total_wrapping_tax_exc}
                    {/if}
                </td>
            </tr>
            {if $total_shipping_tax_exc <= 0 && !isset($virtualCart)}
                <tr class="cart_total_delivery" style="{if !isset($carrier->id) || is_null($carrier->id)}display:none;{/if}">
                    <td colspan="3" class="text-right">{l s='Shipping'}</td>
                    <td colspan="2" class="price" id="total_shipping">{l s='Free Shipping!'}</td>
                </tr>
            {else}
                {if $use_taxes && $total_shipping_tax_exc != $total_shipping}
                    {if $priceDisplay}
                        <tr class="cart_total_delivery" {if $total_shipping_tax_exc <= 0} style="display:none;"{/if}>
                            <td colspan="3" class="text-right">{if $display_tax_label}{l s='Total shipping (tax excl.)'}{else}{l s='Total shipping'}{/if}</td>
                            <td colspan="2" class="price" id="total_shipping">{displayPrice price=$total_shipping_tax_exc}</td>
                        </tr>
                    {else}
                        <tr class="cart_total_delivery"{if $total_shipping <= 0} style="display:none;"{/if}>
                            <td colspan="3" class="text-right">{if $display_tax_label}{l s='Total shipping (tax incl.)'}{else}{l s='Total shipping'}{/if}</td>
                            <td colspan="2" class="price" id="total_shipping" >{displayPrice price=$total_shipping}</td>
                        </tr>
                    {/if}
                {else}
                    <tr class="cart_total_delivery"{if $total_shipping_tax_exc <= 0} style="display:none;"{/if}>
                        <td colspan="3" class="text-right">{l s='Total shipping'}</td>
                        <td colspan="2" class="price" id="total_shipping" >{displayPrice price=$total_shipping_tax_exc}</td>
                    </tr>
                {/if}
            {/if}
            <tr class="cart_total_voucher" {if $total_discounts == 0}style="display:none"{/if}>
                <td colspan="3" class="text-right">
                    {if $display_tax_label}
                        {if $use_taxes && $priceDisplay == 0}
                            {l s='Total vouchers (tax incl.):'}
                        {else}
                            {l s='Total vouchers (tax excl.)'}
                        {/if}
                    {else}
                        {l s='Total vouchers'}
                    {/if}
                </td>
                <td colspan="2" class="price-discount price" id="total_discount">
                    {if $use_taxes && $priceDisplay == 0}
                        {assign var='total_discounts_negative' value=$total_discounts * -1}
                    {else}
                        {assign var='total_discounts_negative' value=$total_discounts_tax_exc * -1}
                    {/if}
                    {displayPrice price=$total_discounts_negative}
                </td>
            </tr>
            {if $use_taxes && $show_taxes}
                <tr class="cart_total_price">
                    <td colspan="3" class="text-right">{l s='Total (tax excl.)'}</td>
                    <td colspan="2" class="price" id="total_price_without_tax">{displayPrice price=$total_price_without_tax}</td>
                </tr>
                <tr class="cart_total_tax">
                    <td colspan="3" class="text-right">{l s='Total tax'}</td>
                    <td colspan="2" class="price" id="total_tax">{displayPrice price=$total_tax}</td>
                </tr>
            {/if}
            <tr class="cart_total_price">
                <td colspan="3" class="total_price_container text-right">
                    <span>{l s='Total'}</span>
                </td>
                {if $use_taxes}
                    <td colspan="2" class="price" id="total_price_container">
                        <span id="total_price">{displayPrice price=$total_price}</span>
                    </td>
                {else}
                    <td colspan="2" class="price" id="total_price_container">
                        <span id="total_price">{displayPrice price=$total_price_without_tax}</span>
                    </td>
                {/if}
            </tr>
        </tfoot>
        <tbody>
            {assign var='odd' value=0}
            {assign var='have_non_virtual_products' value=false}
            {foreach $products as $product}
                {if $product.is_virtual == 0}
                    {assign var='have_non_virtual_products' value=true}						
                {/if}
                {assign var='productId' value=$product.id_product}
                {assign var='productAttributeId' value=$product.id_product_attribute}
                {assign var='quantityDisplayed' value=0}
                {assign var='odd' value=($odd+1)%2}
                {assign var='ignoreProductLast' value=isset($customizedDatas.$productId.$productAttributeId) || count($gift_products)}
                {* Display the product line *}
                {include file="$tpl_dir./shopping-cart-product-line.tpl" productLast=$product@last productFirst=$product@first}
                {* Then the customized datas ones*}
                {if isset($customizedDatas.$productId.$productAttributeId)}
                    {foreach $customizedDatas.$productId.$productAttributeId[$product.id_address_delivery] as $id_customization=>$customization}
                        <tr
                            id="product_{$product.id_product}_{$product.id_product_attribute}_{$id_customization}_{$product.id_address_delivery|intval}"
                            class="product_customization_for_{$product.id_product}_{$product.id_product_attribute}_{$product.id_address_delivery|intval}{if $odd} odd{else} even{/if} customization alternate_item {if $product@last && $customization@last && !count($gift_products)}last_item{/if}">
                            <td></td>
                            <td colspan="3">
                                {foreach $customization.datas as $type => $custom_data}
                                    {if $type == $CUSTOMIZE_FILE}
                                        <div class="customizationUploaded">
                                            <ul class="customizationUploaded">
                                                {foreach $custom_data as $picture}
                                                    <li><img src="{$pic_dir}{$picture.value}_small" alt="" class="customizationUploaded" /></li>
                                                    {/foreach}
                                            </ul>
                                        </div>
                                    {elseif $type == $CUSTOMIZE_TEXTFIELD}
                                        <ul class="typedText">
                                            {foreach $custom_data as $textField}
                                                <li>
                                                    {if $textField.name}
                                                        {$textField.name}
                                                    {else}
                                                        {l s='Text #'}{$textField@index+1}
                                                    {/if}
                                                    : {$textField.value}
                                                </li>
                                            {/foreach}
                                        </ul>
                                    {/if}
                                {/foreach}
                            </td>
                            <td class="cart_quantity" colspan="2">
                                {if isset($cannotModify) AND $cannotModify == 1}
                                    <span>{if $quantityDisplayed == 0 AND isset($customizedDatas.$productId.$productAttributeId)}{$customizedDatas.$productId.$productAttributeId|@count}{else}{$product.cart_quantity-$quantityDisplayed}{/if}</span>
                                {else}
                                    <input type="hidden" value="{$customization.quantity}" name="quantity_{$product.id_product}_{$product.id_product_attribute}_{$id_customization}_{$product.id_address_delivery|intval}_hidden"/>
                                    <input type="text" value="{$customization.quantity}" class="cart_quantity_input form-control grey" name="quantity_{$product.id_product}_{$product.id_product_attribute}_{$id_customization}_{$product.id_address_delivery|intval}"/>
                                    <div class="cart_quantity_button clearfix">
                                        {if $product.minimal_quantity < ($customization.quantity -$quantityDisplayed) OR $product.minimal_quantity <= 1}
                                            <a
                                                id="cart_quantity_down_{$product.id_product}_{$product.id_product_attribute}_{$id_customization}_{$product.id_address_delivery|intval}"
                                                class="cart_quantity_down btn btn-default button-minus"
                                                href="{$link->getPageLink('cart', true, NULL, "add=1&amp;id_product={$product.id_product|intval}&amp;ipa={$product.id_product_attribute|intval}&amp;id_address_delivery={$product.id_address_delivery}&amp;id_customization={$id_customization}&amp;op=down&amp;token={$token_cart}")|escape:'html':'UTF-8'}"
                                                rel="nofollow"
                                                title="{l s='Subtract'}">
                                                <span><i class="icon-minus"></i></span>
                                            </a>
                                        {else}
                                            <a
                                                id="cart_quantity_down_{$product.id_product}_{$product.id_product_attribute}_{$id_customization}"
                                                class="cart_quantity_down btn btn-default button-minus disabled"
                                                href="#"
                                                title="{l s='Subtract'}">
                                                <span><i class="icon-minus"></i></span>
                                            </a>
                                        {/if}
                                        <a
                                            id="cart_quantity_up_{$product.id_product}_{$product.id_product_attribute}_{$id_customization}_{$product.id_address_delivery|intval}"
                                            class="cart_quantity_up btn btn-default button-plus"
                                            href="{$link->getPageLink('cart', true, NULL, "add=1&amp;id_product={$product.id_product|intval}&amp;ipa={$product.id_product_attribute|intval}&amp;id_address_delivery={$product.id_address_delivery}&amp;id_customization={$id_customization}&amp;token={$token_cart}")|escape:'html':'UTF-8'}"
                                            rel="nofollow"
                                            title="{l s='Add'}">
                                            <span><i class="icon-plus"></i></span>
                                        </a>
                                    </div>
                                {/if}
                            </td>
                            <td class="cart_delete">
                                {if isset($cannotModify) AND $cannotModify == 1}
                                {else}
                                    <div>
                                        <a
                                            id="{$product.id_product}_{$product.id_product_attribute}_{$id_customization}_{$product.id_address_delivery|intval}"
                                            class="cart_quantity_delete"
                                            href="{$link->getPageLink('cart', true, NULL, "delete=1&amp;id_product={$product.id_product|intval}&amp;ipa={$product.id_product_attribute|intval}&amp;id_customization={$id_customization}&amp;id_address_delivery={$product.id_address_delivery}&amp;token={$token_cart}")|escape:'html':'UTF-8'}"
                                            rel="nofollow"
                                            title="{l s='Delete'}">
                                            <i class="icon-trash"></i>
                                        </a>
                                    </div>
                                {/if}
                            </td>
                        </tr>
                        {assign var='quantityDisplayed' value=$quantityDisplayed+$customization.quantity}
                    {/foreach}

                    {* If it exists also some uncustomized products *}
                {if $product.quantity-$quantityDisplayed > 0}{include file="$tpl_dir./shopping-cart-product-line.tpl" productLast=$product@last productFirst=$product@first}{/if}
            {/if}
        {/foreach}
        {assign var='last_was_odd' value=$product@iteration%2}
        {foreach $gift_products as $product}
            {assign var='productId' value=$product.id_product}
            {assign var='productAttributeId' value=$product.id_product_attribute}
            {assign var='quantityDisplayed' value=0}
            {assign var='odd' value=($product@iteration+$last_was_odd)%2}
            {assign var='ignoreProductLast' value=isset($customizedDatas.$productId.$productAttributeId)}
            {assign var='cannotModify' value=1}
            {* Display the gift product line *}
            {include file="$tpl_dir./shopping-cart-product-line.tpl" productLast=$product@last productFirst=$product@first}
        {/foreach}
    </tbody>
    {if sizeof($discounts)}
        <tbody>
            {foreach $discounts as $discount}
                <tr class="cart_discount {if $discount@last}last_item{elseif $discount@first}first_item{else}item{/if}" id="cart_discount_{$discount.id_discount}">
                    <td class="cart_discount_name" colspan="3">{$discount.name}</td>
                    <td class="cart_discount_price">
                        <span class="price-discount">
                    {if !$priceDisplay}{displayPrice price=$discount.value_real*-1}{else}{displayPrice price=$discount.value_tax_exc*-1}{/if}
                </span>
            </td>
            <td class="cart_discount_delete">1</td>
            <td class="cart_discount_price">
                <span class="price-discount price">{if !$priceDisplay}{displayPrice price=$discount.value_real*-1}{else}{displayPrice price=$discount.value_tax_exc*-1}{/if}</span>
            </td>
            <td class="price_discount_del text-center">
                {if strlen($discount.code)}
                    <a
                        href="{if $opc}{$link->getPageLink('order-opc', true)}{else}{$link->getPageLink('order', true)}{/if}?deleteDiscount={$discount.id_discount}"
                        class="price_discount_delete"
                        title="{l s='Delete'}">
                        <i class="icon-trash"></i>
                    </a>
                {/if}
            </td>
        </tr>
    {/foreach}
</tbody>
{/if}
</table>
</div> <!-- end order-detail-content -->

{if $show_option_allow_separate_package}
    <p>
        <input type="checkbox" name="allow_seperated_package" id="allow_seperated_package" {if $cart->allow_seperated_package}checked="checked"{/if} autocomplete="off"/>
        <label for="allow_seperated_package">{l s='Send available products first'}</label>
    </p>
{/if}

<div class="cart-collaterals">
    <div class="totals col-2">
        <!--      <h3>Shopping Cart Total</h3> -->
        <div class="inner">

            <table id="shopping-cart-totals-table">

                <colgroup>
                    <col>
                    <col width="1">
                </colgroup>
                <tfoot>
                    <tr class="cart_total_price">



                        {if $use_taxes}

                            <td colspan="1" class="a-left" id="total_price_container" style="">
                                <strong>{l s='Grand Total'}</strong>
                            </td>
                            <td class="a-right" style="">
                                <strong><span class="price" id="total_price">{displayPrice price=$total_price}</span></strong>

                            </td>

                        {else}

                            <td colspan="1" class=" a-left" id="total_price_container" style="">

                                <strong>{l s='Grand Total'}</strong>
                            </td>
                            <td class="a-right" style="">
                                <strong><span class="price" id="total_price">{displayPrice price=$total_price}</span></strong>

                            </td>

                        {/if}

                    </tr>



                </tfoot>

            </table>

            <ul class="checkout">

                <li>   

                    {if !$opc}

                        {if Configuration::get('PS_ALLOW_MULTISHIPPING')}
                            <button  onclick="location.href='{if $back}{$link->getPageLink('order', true, NULL, 'step=1&amp;back={$back}')}{else}{$link->getPageLink('order', true, NULL, 'step=1')}{/if}&amp;multi-shipping=1'" class="button btn-proceed-checkout" title="{l s='Proceed to Checkout'}"><span>{l s='Proceed to Checkout'}</span></button>
                        {else}
                            <button  onclick="location.href='{if $back}{$link->getPageLink('order', true, NULL, 'step=1&amp;back={$back}')}{else}{$link->getPageLink('order', true, NULL, 'step=1')}{/if}'" class="button btn-proceed-checkout" title="{l s='Proceed to Checkout'}" ><span>{l s='Proceed to Checkout'}</span></button>

                        {/if} 
                    {/if} 
                </li>

            </ul>




        </div>
    </div>
    <div class="col2-set col-1">
        <div class="shipping">    
            <div id="HOOK_SHOPPING_CART">{$HOOK_SHOPPING_CART}</div>
        </div>


        <div class="discount">
            {if $voucherAllowed}

                {if isset($errors_discount) && $errors_discount}

                    <ul class="error">

                        {foreach $errors_discount as $k=>$error}

                            <li>{$error|escape:'htmlall':'UTF-8'}</li>

                        {/foreach}

                    </ul>

                {/if}
                <h3>{l s='Vouchers'}</h3>
                <form  class="std" action="{if $opc}{$link->getPageLink('order-opc', true)}{else}{$link->getPageLink('order', true)}{/if}" method="post" id="voucher">
                    <label for="coupon_code">{l s='Enter your coupon code if you have one.'}</label>
                    <input type="text" class="input-text" id="discount_name" name="discount_name" value="{if isset($discount_name) && $discount_name}{$discount_name}{/if}" size="35" />
                    <p class="submit"><input type="hidden" name="submitDiscount" />
                        <button   type="submit" name="submitAddDiscount"  class="button coupon" ><span>{l s='Apply Coupon'}</span></button>
                    </p>

                    {if $displayVouchers}

                        <h4 class="title_offers">{l s='Take advantage of our offers:'}</h4>

                        <div id="display_cart_vouchers">

                            {foreach $displayVouchers as $voucher}

                                <span onclick="$('#discount_name').val('{$voucher.name}');return false;" class="voucher_name">{$voucher.name}</span> - {$voucher.description} <br />

                            {/foreach}

                        </div>

                    {/if}
                </form>
            {/if} 
        </div>
    </div>
</div>








{* Define the style if it doesn't exist in the PrestaShop version*}
{* Will be deleted for 1.5 version and more *}
{if !isset($addresses_style)}
    {$addresses_style.company = 'address_company'}
    {$addresses_style.vat_number = 'address_company'}
    {$addresses_style.firstname = 'address_name'}
    {$addresses_style.lastname = 'address_name'}
    {$addresses_style.address1 = 'address_address1'}
    {$addresses_style.address2 = 'address_address2'}
    {$addresses_style.city = 'address_city'}
    {$addresses_style.country = 'address_country'}
    {$addresses_style.phone = 'address_phone'}
    {$addresses_style.phone_mobile = 'address_phone_mobile'}
    {$addresses_style.alias = 'address_title'}
{/if}



{if ((!empty($delivery_option) AND !isset($virtualCart)) OR $delivery->id OR $invoice->id) AND !$opc}
    <div class="order_delivery clearfix row">
        {if !isset($formattedAddresses) || (count($formattedAddresses.invoice) == 0 && count($formattedAddresses.delivery) == 0) || (count($formattedAddresses.invoice.formated) == 0 && count($formattedAddresses.delivery.formated) == 0)}
            {if $delivery->id}
                <div class="col-xs-12 col-sm-6 left"{if !$have_non_virtual_products} style="display: none;"{/if}>
                    <ul id="delivery_address" class="address item box">
                        <li><h3 class="page-subheading">{l s='Delivery address'}&nbsp;<span class="address_alias">({$delivery->alias})</span></h3></li>
                    {if $delivery->company}<li class="address_company">{$delivery->company|escape:'html':'UTF-8'}</li>{/if}
                    <li class="address_name">{$delivery->firstname|escape:'html':'UTF-8'} {$delivery->lastname|escape:'html':'UTF-8'}</li>
                    <li class="address_address1">{$delivery->address1|escape:'html':'UTF-8'}</li>
                {if $delivery->address2}<li class="address_address2">{$delivery->address2|escape:'html':'UTF-8'}</li>{/if}
                <li class="address_city">{$delivery->postcode|escape:'html':'UTF-8'} {$delivery->city|escape:'html':'UTF-8'}</li>
                <li class="address_country">{$delivery->country|escape:'html':'UTF-8'} {if $delivery_state}({$delivery_state|escape:'html':'UTF-8'}){/if}</li>
            </ul>
        </div>
    {/if}
    {if $invoice->id}
        <div class="col-xs-12 col-sm-6">
            <ul id="invoice_address" class="address alternate_item box">
                <li><h3 class="page-subheading">{l s='Invoice address'}&nbsp;<span class="address_alias">({$invoice->alias})</span></h3></li>
            {if $invoice->company}<li class="address_company">{$invoice->company|escape:'html':'UTF-8'}</li>{/if}
            <li class="address_name">{$invoice->firstname|escape:'html':'UTF-8'} {$invoice->lastname|escape:'html':'UTF-8'}</li>
            <li class="address_address1">{$invoice->address1|escape:'html':'UTF-8'}</li>
        {if $invoice->address2}<li class="address_address2">{$invoice->address2|escape:'html':'UTF-8'}</li>{/if}
        <li class="address_city">{$invoice->postcode|escape:'html':'UTF-8'} {$invoice->city|escape:'html':'UTF-8'}</li>
        <li class="address_country">{$invoice->country|escape:'html':'UTF-8'} {if $invoice_state}({$invoice_state|escape:'html':'UTF-8'}){/if}</li>
    </ul>
</div>
{/if}
{else}
    {foreach from=$formattedAddresses key=k item=address}
        <div class="col-xs-12 col-sm-6 left"{if $k == 'delivery' && !$have_non_virtual_products} style="display: none;"{/if}>
            <ul class="address {if $address@last}last_item{elseif $address@first}first_item{/if} {if $address@index % 2}alternate_item{else}item{/if} box">
                <li>
                    <h3 class="page-subheading">
                        {if $k eq 'invoice'}
                            {l s='Invoice address'}
                        {elseif $k eq 'delivery' && $delivery->id}
                            {l s='Delivery address'}
                        {/if}
                        {if isset($address.object.alias)}
                            <span class="address_alias">({$address.object.alias})</span>
                        {/if}
                    </h3>
                </li>
                {foreach $address.ordered as $pattern}
                    {assign var=addressKey value=" "|explode:$pattern}
                    {assign var=addedli value=false}
                    {foreach from=$addressKey item=key name=foo}
                        {if isset($address.formated[$key]) && !empty($address.formated[$key])}
                            {if (!$addedli)}
                                {$addedli = true}
                                <li><span class="{if isset($addresses_style[$key])}{$addresses_style[$key]}{/if}">
                                    {/if}
                                    {$address.formated[$key]|escape:'html':'UTF-8'}
                                {/if}
                                {if ($smarty.foreach.foo.last && $addedli)}
                                </span></li>
                            {/if}
                        {/foreach}
                    {/foreach}
            </ul>
        </div>
    {/foreach}
{/if}
</div>
{/if}


{if !$opc}  
    {hook h='ProductCartNewHook'}     
{/if} 


{if !empty($HOOK_SHOPPING_CART_EXTRA)}
    <div class="clear"></div>
    <div class="cart_navigation_extra">
        <div id="HOOK_SHOPPING_CART_EXTRA">{$HOOK_SHOPPING_CART_EXTRA}</div>
    </div>
{/if}

{strip}
    {addJsDef currencySign=$currencySign|html_entity_decode:2:"UTF-8"}
    {addJsDef currencyRate=$currencyRate|floatval}
    {addJsDef currencyFormat=$currencyFormat|intval}
    {addJsDef currencyBlank=$currencyBlank|intval}
    {addJsDef deliveryAddress=$cart->id_address_delivery|intval}
    {addJsDefL name=txtProduct}{l s='product' js=1}{/addJsDefL}
    {addJsDefL name=txtProducts}{l s='products' js=1}{/addJsDefL}
{/strip}
{/if}






</div>







