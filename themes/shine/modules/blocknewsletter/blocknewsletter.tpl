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
<!-- Block Newsletter module-->         
<div class="footer-column-last" id="newsletter_block_left" >
    <h4>{l s='Sign up for emails' mod='blocknewsletter'}</h4>
    <div class="newsletter">
        <form id="newsletter-validate-detail" action="{$link->getPageLink('index')|escape:'html':'UTF-8'}" method="post">
            <div id="container_form_news">
        <div id="container_form_news2">
            <div class="form-group{if isset($msg) && $msg } {if $nw_error}form-error{else}form-ok{/if}{/if}" >
                <input class="inputNew form-control grey newsletter-input input-text required-entry validate-email" id="newsletter-input" type="text" name="email" size="18" value="{if isset($msg) && $msg}{$msg}{elseif isset($value) && $value}{$value}{else}{l s='Enter your e-mail address' mod='blocknewsletter'}{/if}" />
                <button type="submit" name="submitNewsletter" class="btn btn-default  button subscribe">
                    <span>{l s='Submit' mod='blocknewsletter'}</span>
                </button>
                <input type="hidden" name="action" value="0" />
            </div>
              </div>
      </div>
        </form>    
    </div>              

                
         
                
                
    <!-- /Block Newsletter module-->
    {strip}
        {if isset($msg) && $msg}
            {addJsDef msg_newsl=$msg|@addcslashes:'\''}
        {/if}
        {if isset($nw_error)}
            {addJsDef nw_error=$nw_error}
        {/if}
        {addJsDefL name=placeholder_blocknewsletter}{l s='Enter your e-mail' mod='blocknewsletter' js=1}{/addJsDefL}
        {if isset($msg) && $msg}
            {addJsDefL name=alert_blocknewsletter}{l s='Newsletter : %1$s' sprintf=$msg js=1 mod="blocknewsletter"}{/addJsDefL}
        {/if}
    {/strip}







    <div class="social">
        <h4>{l s='Follow Us' mod='blocknewsletter'}</h4>
        <ul class="link">
            {if $webgroup24.wg24_face_b_icon_url_shine !=''}
                  <li class="fb">   <a  href="{$webgroup24.wg24_face_b_icon_url_shine}" title="{l s='Facebook' mod='blocknewsletter'}" onclick="target='_blank'"></a>
                {/if}
                {if $webgroup24.wg24_twitt_icon_url_shine !=''}
                  <li class="tw">    <a  href="{$webgroup24.wg24_twitt_icon_url_shine}" title="{l s='Twitter' mod='blocknewsletter'}"  onclick="target='_blank'" ></a>
                {/if}
                {if $webgroup24.wg24_google_icon_url_shine !=''}
                   <li class="googleplus">   <a  href="{$webgroup24.wg24_google_icon_url_shine}" title="{l s='Google' mod='blocknewsletter'}" onclick="target='_blank'" ></a>
                {/if}
                {if $webgroup24.wg24_rss_icon_url_shine !=''}
                   <li class="rss">   <a  href="{$webgroup24.wg24_rss_icon_url_shine}" title="{l s='Rss' mod='blocknewsletter'}" onclick="target='_blank'"></a>
                {/if}
                 {if $webgroup24.wg24_pinterest_icon_url_shine !=''}
                     <li class="pintrest"> <a  href="{$webgroup24.wg24_pinterest_icon_url_shine}" title="{l s='Pinterest'}" onclick="target='_blank'"></a>
                {/if}
                {if $webgroup24.wg24_linkedin_icon_url_shine !=''}
                    <li class="linkedin">  <a  href="{$webgroup24.wg24_linkedin_icon_url_shine}" title="{l s='Skype' mod='blocknewsletter'}" onclick="target='_blank'" ></a>
                {/if}
                {if $webgroup24.wg24_youtu_icon_url_shine !=''}
                     <li class="youtube"> <a  href="{$webgroup24.wg24_youtu_icon_url_shine}" title="{l s='Youtube' mod='blocknewsletter'}" onclick="target='_blank'" ></a>
                {/if}
        </ul>
    </div>

</div>

