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

{capture name=path}{l s='Suppliers:'}{/capture}
<article class="col-main">
    <div class="page-title">
        <h2>{l s='Suppliers:'}
            {strip}
                <span class="heading-counter">
                    {if $nbSuppliers == 0}{l s='There are no suppliers.'}
                    {else}
                        {if $nbSuppliers == 1}
                            {l s='There is %d supplier.' sprintf=$nbSuppliers}
                        {else}
                            {l s='There are %d suppliers.' sprintf=$nbSuppliers}
                        {/if}
                    {/if}
                </span>
            {/strip}</h2>
    </div>   


    {if isset($errors) AND $errors}
        {include file="$tpl_dir./errors.tpl"}
    {else}

        {if $nbSuppliers > 0}        
            <div class="toolbar">
                <div class="sorter">
                    {if isset($supplier) && $supplier.nb_products > 0}  
                        <div class="view-mode"> 
                            <span title="Grid" class="button button-active button-grid first"></span>
                            <a href="#" title="List" class="button button-list last">
                            </a> 
                        </div>
                    {/if}
                </div>
                <div id="sort-by">
                    {include file="./product-sort.tpl"}
                </div>
                <div class="pager">
                    <div id="limiter">
                        {include file="./nbr-product-page.tpl"}
                    </div>
                    <div class="pages">
                        {include file="$tpl_dir./pagination.tpl"}
                    </div>
                </div>
            </div> 
            <div class="category-products">   
                {assign var='nbItemsPerLine' value=3}
                {assign var='nbItemsPerLineTablet' value=2}
                {assign var='nbLi' value=$suppliers_list|@count}
                {math equation="nbLi/nbItemsPerLine" nbLi=$nbLi nbItemsPerLine=$nbItemsPerLine assign=nbLines}
                {math equation="nbLi/nbItemsPerLineTablet" nbLi=$nbLi nbItemsPerLineTablet=$nbItemsPerLineTablet assign=nbLinesTablet}
                <ul id="suppliers_list" class="list row">
                    {foreach from=$suppliers_list item=supplier name=supplier}
                        {math equation="(total%perLine)" total=$smarty.foreach.supplier.total perLine=$nbItemsPerLine assign=totModulo}
                        {math equation="(total%perLineT)" total=$smarty.foreach.supplier.total perLineT=$nbItemsPerLineTablet assign=totModuloTablet}
                    {if $totModulo == 0}{assign var='totModulo' value=$nbItemsPerLine}{/if}
                {if $totModuloTablet == 0}{assign var='totModuloTablet' value=$nbItemsPerLineTablet}{/if}
                <li class="{if $smarty.foreach.supplier.iteration%$nbItemsPerLine == 0} last-in-line{elseif $smarty.foreach.supplier.iteration%$nbItemsPerLine == 1} first-in-line{/if} {if $smarty.foreach.supplier.iteration > ($smarty.foreach.supplier.total - $totModulo)}last-line{/if} {if $smarty.foreach.supplier.iteration%$nbItemsPerLineTablet == 0}last-item-of-tablet-line{elseif $smarty.foreach.supplier.iteration%$nbItemsPerLineTablet == 1}first-item-of-tablet-line{/if} {if $smarty.foreach.supplier.iteration > ($smarty.foreach.supplier.total - $totModuloTablet)}last-tablet-line{/if}col-xs-12">
                    <div class="mansup-container">
                        <div class="row"> 
                            <div class="left-side col-xs-12 col-sm-3">
                                <!-- logo -->
                                <div class="logo">
                                    {if $supplier.nb_products > 0}
                                        <a href="{$link->getsupplierLink($supplier.id_supplier, $supplier.link_rewrite)|escape:'html':'UTF-8'}" title="{$supplier.name|escape:'html':'UTF-8'}">
                                        {/if}
                                        <img src="{$img_sup_dir}{$supplier.image|escape:'html':'UTF-8'}-medium_default.jpg" alt="" width="{$mediumSize.width}" height="{$mediumSize.height}" />
                                        {if $supplier.nb_products > 0}
                                        </a>
                                    {/if}
                                </div> <!-- .logo -->
                            </div> <!-- .left-side -->

                            <div class="middle-side col-xs-12 col-sm-5">	
                                <h3>
                                    {if $supplier.nb_products > 0}
                                        <a class="product-name" href="{$link->getsupplierLink($supplier.id_supplier, $supplier.link_rewrite)|escape:'html':'UTF-8'}">
                                        {/if}
                                        {$supplier.name|truncate:60:'...'|escape:'html':'UTF-8'}
                                        {if $supplier.nb_products > 0}
                                        </a>
                                    {/if}
                                </h3>
                                <div class="description">
                                    {$supplier.description|truncate:180:'...'}
                                </div>
                            </div><!-- .middle-side -->

                            <div class="right-side col-xs-12 col-sm-4">
                                <div class="right-side-content">
                                    <p class="product-counter">
                                        {if $supplier.nb_products > 0}
                                            <a href="{$link->getsupplierLink($supplier.id_supplier, $supplier.link_rewrite)|escape:'html':'UTF-8'}">
                                            {/if}
                                    {if $supplier.nb_products == 1}{l s='%d product' sprintf=$supplier.nb_products|intval}{else}{l s='%d products' sprintf=$supplier.nb_products|intval}{/if}
                                    {if $supplier.nb_products > 0}
                                    </a>
                                {/if}
                            </p>
                            {if $supplier.nb_products > 0}
                                <a class="btn btn-default button exclusive-medium" href="{$link->getsupplierLink($supplier.id_supplier, $supplier.link_rewrite)|escape:'html':'UTF-8'}"><span>{l s='View products'} </span></a>
                            {/if}
                        </div>
                    </div><!-- .right-side -->
                </div>
            </div>
        </li>
    {/foreach}
</ul>
</div>                
<div class="toolbar">
    <div class="sorter">
        {if isset($manufacturer) && $manufacturer.nb_products > 0}   
            <div class="view-mode"> 
                <span title="Grid" class="button button-active button-grid first"></span>
                <a href="#" title="List" class="button button-list last">
                </a> 
            </div>
        {/if}

    </div>
    <div id="sort-by">
        {include file="./product-sort.tpl"}

    </div>
    <div class="pager">
        <div id="limiter">
            {include file="./nbr-product-page.tpl"}

        </div>
        <div class="pages">
            {include file="$tpl_dir./pagination.tpl" paginationId='bottom'}

        </div>
    </div>

</div>                 
{/if}
{/if}

</article>
<!--	///*///======    End Col Main  ========= //*/// -->


  {if $webgroup24.wg24_c_not_sidebar_des_shine=="show"} 
                  <aside class="col-left sidebar"> 
                    {$HOOK_LEFT_COLUMN}
                </div>
        {/if}
        












