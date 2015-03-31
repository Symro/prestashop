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
<article class="col-main">
    <div class="page-title">
        <h2>{l s='Top sellers'} </h2>
    </div>          
    {if $products}         
        <div class="toolbar">
            <div class="sorter">
                <div class="view-mode"> 
                    <span title="Grid" class="button button-active button-grid first"></span>
                    <a href="#" title="List" class="button button-list last">
                    </a> 
                </div>
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
            {include file="./product-list.tpl" products=$products}
        </div>                
        <div class="toolbar">
            <div class="sorter">
                <div class="view-mode"> 
                    <span title="Grid" class="button button-active button-grid first"></span>
                    <a href="#" title="List" class="button button-list last">
                    </a> 
                </div>

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
    {else}
        <p class="alert alert-warning">{l s='No top sellers for the moment.'}</p>
    {/if}
</article>
<!--	///*///======    End Col Main  ========= //*/// -->


  {if $webgroup24.wg24_c_not_sidebar_des_shine=="show"} 
                  <aside class="col-left sidebar"> 
                    {$HOOK_LEFT_COLUMN}
                </div>
        {/if}
        


