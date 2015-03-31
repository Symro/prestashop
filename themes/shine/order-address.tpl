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





{if !$opc}
    {assign var='current_step' value='address'}
{capture name=path}{l s='Addresses'}{/capture}
{assign var="back_order_page" value="order.php"}
<div class="login_page">
    <div class="page-title">
        <h2>{l s='Addresses'}</h2>
    </div>
    {include file="$tpl_dir./order-steps.tpl"}
    {include file="$tpl_dir./errors.tpl"}
    <form action="{$link->getPageLink($back_order_page, true)|escape:'html':'UTF-8'}" method="post">
    {else}
        {assign var="back_order_page" value="order-opc.php"}

        <ol  class="one-page-checkout">
            <li class="section" id="opc-login">
                <div class="step-title">
                    <span class="number step-num">1</span> <h3 class="one_page_heading">{l s='Addresses'}</h3>
                    <!--<a href="#">Edit</a>-->
                </div>
                <div style="" class="step a-item" >
                    <div id="opc_account" class="opc-main-block">
                        <div id="opc_account-overlay" class="opc-overlay" style="display: none;"></div>
                    {/if}
                    <div class="addresses clearfix">
                        <div class="row">
                            <div class="col-xs-12 col-sm-6">
                                <div class="address_delivery select form-group selector1">
                                    <label for="id_address_delivery">{if $cart->isVirtualCart()}{l s='Choose a billing address:'}{else}{l s='Choose a delivery address:'}{/if}</label>
                                    <select name="id_address_delivery" id="id_address_delivery" class="address_select form-control">
                                        {foreach from=$addresses key=k item=address}
                                            <option value="{$address.id_address|intval}"{if $address.id_address == $cart->id_address_delivery} selected="selected"{/if}>
                                                {$address.alias|escape:'html':'UTF-8'}
                                            </option>
                                        {/foreach}
                                    </select><span class="waitimage"></span>
                                </div>
                                <p class="checkbox addressesAreEquals"{if $cart->isVirtualCart()} style="display:none;"{/if}>
                                    <input type="checkbox" name="same" id="addressesAreEquals" value="1"{if $cart->id_address_invoice == $cart->id_address_delivery || $addresses|@count == 1} checked="checked"{/if} />
                                    <label for="addressesAreEquals">{l s='Use the delivery address as the billing address.'}</label>
                                </p>
                            </div>
                            <div class="col-xs-12 col-sm-6">
                                <div id="address_invoice_form" class="select form-group selector1"{if $cart->id_address_invoice == $cart->id_address_delivery} style="display: none;"{/if}>
                                    {if $addresses|@count > 1}
                                        <label for="id_address_invoice" class="strong">{l s='Choose a billing address:'}</label>
                                        <select name="id_address_invoice" id="id_address_invoice" class="address_select form-control">
                                            {section loop=$addresses step=-1 name=address}
                                                <option value="{$addresses[address].id_address|intval}"{if $addresses[address].id_address == $cart->id_address_invoice && $cart->id_address_delivery != $cart->id_address_invoice} selected="selected"{/if}>
                                                    {$addresses[address].alias|escape:'html':'UTF-8'}
                                                </option>
                                            {/section}
                                        </select><span class="waitimage"></span>
                                    {else}
                                        <a href="{$link->getPageLink('address', true, NULL, "back={$back_order_page}?step=1&select_address=1{if $back}&mod={$back}{/if}")|escape:'html':'UTF-8'}" title="{l s='Add'}" class="button continue">
                                            <span>
                                                {l s='Add a new address'}

                                            </span>
                                        </a>
                                    {/if}
                                </div>
                            </div>
                        </div> <!-- end row -->

                        <div class="clear"></div>
                        <div class="row">
                            <div class="col-xs-12 col-sm-6 left  margin-right20"{if $cart->isVirtualCart()} style="display:none; margin-right: 20px;"{/if}>
                                <ul class="address item box" id="address_delivery">
                                </ul>
                            </div>
                            <div class="col-xs-12 col-sm-6 ">
                                <ul class="address alternate_item{if $cart->isVirtualCart()} full_width{/if} box" id="address_invoice">
                                </ul>
                            </div>
                        </div> <!-- end row -->
                        <p class="address_add submit">
                            <a href="{$link->getPageLink('address', true, NULL, "back={$back_order_page}?step=1{if $back}&mod={$back}{/if}")|escape:'html':'UTF-8'}" title="{l s='Add'}" class="button continue">
                                <span>{l s='Add a new address'}</span>
                            </a>
                        </p>
                        {if !$opc}
                            <div id="ordermsg" class="form-group">
                                <label>{l s='If you would like to add a comment about your order, please write it in the field below.'}</label>
                                <br/>
                                <textarea class="form-control" cols="60" rows="6" name="message">{if isset($oldMessage)}{$oldMessage}{/if}</textarea>
                            </div>
                        {/if}
                    </div> <!-- end addresses -->
                    {if !$opc}
                        <p class="cart_navigation clearfix">
                            <input type="hidden" class="hidden" name="step" value="2" />
                            <input type="hidden" name="back" value="{$back}" />
                            <a href="{$link->getPageLink($back_order_page, true, NULL, "step=0{if $back}&back={$back}{/if}")|escape:'html':'UTF-8'}" title="{l s='Previous'}" class="button continue">

                                {l s='Continue Shopping'}
                            </a>
                            <button type="submit" name="processAddress" class="button proceed-checkout right">
                                <span>{l s='Proceed to checkout'}</span>
                            </button>
                        </p>
                        </form>

                    </div>                           
                {else}
                </div> <!--  end opc_account -->
                </div>
            </li> 
        </ol> 
    {/if}
    {strip}
        {if !$opc}
            {addJsDef orderProcess='order'}
            {addJsDef currencySign=$currencySign|html_entity_decode:2:"UTF-8"}
            {addJsDef currencyRate=$currencyRate|floatval}
            {addJsDef currencyFormat=$currencyFormat|intval}
            {addJsDef currencyBlank=$currencyBlank|intval}
            {addJsDefL name=txtProduct}{l s='product' js=1}{/addJsDefL}
            {addJsDefL name=txtProducts}{l s='products' js=1}{/addJsDefL}
            {addJsDefL name=CloseTxt}{l s='Submit' js=1}{/addJsDefL}
        {/if}
{capture}{if $back}&mod={$back|urlencode}{/if}{/capture}
{capture name=addressUrl}{$link->getPageLink('address', true, NULL, 'back='|cat:$back_order_page|cat:'?step=1'|cat:$smarty.capture.default)|addslashes}{/capture}
{addJsDef addressUrl=$smarty.capture.addressUrl}
{capture}{'&multi-shipping=1'|urlencode}{/capture}
{addJsDef addressMultishippingUrl=$smarty.capture.addressUrl|cat:$smarty.capture.default}
{capture name=addressUrlAdd}{$smarty.capture.addressUrl|cat:'&id_address='}{/capture}
{addJsDef addressUrlAdd=$smarty.capture.addressUrlAdd}
{addJsDef formatedAddressFieldsValuesList=$formatedAddressFieldsValuesList}
{addJsDef opc=$opc|boolval}
{capture}<h3 class="page-subheading">{l s='Your billing address' js=1}</h3>{/capture}
{addJsDefL name=titleInvoice}{$smarty.capture.default|@addcslashes:'\''}{/addJsDefL}
{capture}<h3 class="page-subheading">{l s='Your delivery address' js=1}</h3>{/capture}
{addJsDefL name=titleDelivery}{$smarty.capture.default|@addcslashes:'\''}{/addJsDefL}
{capture}<a class="button btn-update" href="{$smarty.capture.addressUrlAdd}" title="{l s='Update' js=1}"><span>{l s='Update' js=1}</span></a>{/capture}
{addJsDefL name=liUpdate}{$smarty.capture.default|@addcslashes:'\''}{/addJsDefL}
{/strip} 


