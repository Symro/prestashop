<header>
  <div class="header">
    <div class="logo">
        <a class="logo" href="{$base_dir}" title="{$shop_name|escape:'html':'UTF-8'}">
                <img  src="{$logo_url}" alt="{$shop_name|escape:'html':'UTF-8'}"{if $logo_image_width} width="{$logo_image_width}"{/if}{if $logo_image_height} height="{$logo_image_height}"{/if}/>
        </a>
    </div>
    <div class="right">
        <!-- <p class="welcome-msg">
                {if $logged}
                    {l s='Welcome' mod='wg24headerpermanentlinks'} <a href="{$link->getPageLink('my-account', true)}" >({$cookie->customer_lastname})</a>
                {else}
                    {l s='Welcome visitor you can!' mod='wg24headerpermanentlinks'} <a href="{$link->getPageLink('my-account', true)}">{l s='login' mod='wg24headerpermanentlinks'}</a> {l s='or' mod='wg24headerpermanentlinks'} <a href="{$link->getPageLink('my-account', true)}">{l s='create an account' mod='wg24headerpermanentlinks'}</a>
                {/if}

            </p>  -->
      <div class="toplinks">
                <ul class="links">

                <li   class="wishlist"><a href="{$link->getModuleLink('blockwishlist', 'mywishlist', array(), true)|escape:'html':'UTF-8'}" title="{l s='About' mod='wg24headerpermanentlinks'}" class="top-link-my-wishlist">{l s='My Wishlist' mod='wg24headerpermanentlinks'}</a></li>
                <li><a href="{$link->getPageLink('products-comparison')}" title="{l s='Card' mod='wg24headerpermanentlinks'}" class="top-link-my-comparer">{l s='Carte' mod='wg24headerpermanentlinks'}</a></li>
                <li class="check"><a href="{$link->getPageLink($order_rules, true)}" title="{l s='Your Shopping Cart' mod='wg24headerpermanentlinks'}" class="top-link-checkout">{l s='Checkout' mod='wg24headerpermanentlinks'}</a></li>
                <li class="myaccount" ><a href="{$link->getPageLink('my-account', true)}" title="{l s='Account' mod='wg24headerpermanentlinks'}" class="top-link-my-acconut">{l s='Mon compte' mod='wg24headerpermanentlinks'}</a></li>
                </ul>
      </div>
    </div>
  </div>
</header>








