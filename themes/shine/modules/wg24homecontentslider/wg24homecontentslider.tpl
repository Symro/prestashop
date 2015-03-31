{if $page_name =='index'}
   {if isset($wg24homecontentslider_slides)}
<section>
<div class="slider-intro">
  <div class="banner-slider-wrapper">
      <div class="banner-slider-holder">
        <div class="banner-slider-container boxed-slider">
          <div class="container">
            <div class="iosSlider">
              <div class="slider">
                  {foreach from=$wg24homecontentslider_slides item=slide}
                 <div class="item">
                <a href="{$slide.url|escape:'html':'UTF-8'}" title="{$slide.legend|escape:'html':'UTF-8'}">
                       <img src="{$link->getMediaLink("`$smarty.const._MODULE_DIR_`wg24homecontentslider/images/`$slide.image|escape:'htmlall':'UTF-8'`")}"
                            alt="{$slide.legend|escape:'htmlall':'UTF-8'}"/>
               </a>
              <div class="slide-container slide-skin">
                    <h2>{$slide.title|escape:'html':'UTF-8'}</h2>
                 {if isset($slide.description) && trim($slide.description) != ''}
                             {$slide.description}
                   {/if}
               </div>
            </div>
            {/foreach} 
              </div>
              <div style="cursor: pointer;" class="next"><i class="icon-next"></i></div>
              <div style="cursor: pointer;" class="prev unselectable"><i class="icon-prev"></i></div>
            </div>
          </div>
        </div>
      </div>


</div>
</div>
</section>                          
        
  
    {/if}
    <!-- /Module HomeSlider -->
{/if}

{if $webgroup24.wg24_home_slid_b_ser_ms_text_shine !=""}
<section class="service-section">
{$webgroup24.wg24_home_slid_b_ser_ms_text_shine|html_entity_decode}
</section>
{/if}   