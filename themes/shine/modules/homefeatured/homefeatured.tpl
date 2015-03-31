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
<section class="main-col">
  <article>
    <div class="producttabs">
      <div id="magik_producttabs1" class="magik-producttabs">
        <!--<h3></h3>-->
        <div class="magik-pdt-container">
          <!--Begin Tab Nav -->
          <div class="magik-pdt-nav">
            <ul class="pdt-nav">
              <li class="item-nav1 tab-loaded tab-nav-actived" data-type="order" data-catid="" data-orderby="best_sales" data-href="pdt_best_sales"> <span class="title-navi">{l s='Featured products' mod='homefeatured'} </span> </li>
              <li class="item-nav2" data-type="order" data-catid="" data-orderby="new_arrivals" data-href="pdt_new_arrivals"> <span class="title-navi">{l s='New Arrivals' mod='homefeatured'} </span> </li>
            </ul>
          </div>
          <!-- End Tab Nav -->
          <!--Begin Tab Content -->
          <div class="magik-pdt-content wide-5">
            <div class="pdt-content is-loaded pdt_best_sales tab-content-actived">
              <div class="pdt-list products-grid-home zoomOut play">
                {counter name=active_ul assign=active_ul}
                {if isset($products) && $products}
                {include file="$tpl_dir./product-list.tpl" class='homefeatured tab-pane' id='homefeatured' active=$active_ul}
                {else}
                <ul id="homefeatured" class="homefeatured tab-pane{if isset($active_ul) && $active_ul == 1} active{/if}">
                <li class="alert alert-info">{l s='No featured products at this time.' mod='homefeatured'}</li>
                </ul>
                {/if}        
                        
              </div>
            </div>
          
                               
                        