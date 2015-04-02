
<!-- {if $webgroup24.wg24_home_b_off_bann_shine=="show"}
<section class="offer-banner">
<div class="offer-banner-section">
    {$i=1}
    {foreach from=$wg24homeadvertising_slides item=slide}
     <div class="{if $i==4}col-last {else}col {/if}">

      <a href="{$slide.url|escape:'html':'UTF-8'}" title="{$slide.legend|escape:'html':'UTF-8'}">
        <img src="{$link->getMediaLink("`$smarty.const._MODULE_DIR_`wg24homeadvertising/images/`$slide.image|escape:'htmlall':'UTF-8'`")}"
                    alt="{$slide.legend|escape:'htmlall':'UTF-8'}"/>
    </a>

   </div>
   {$i=$i+1}
{/foreach}
    </div>
</section>
{/if}
     -->