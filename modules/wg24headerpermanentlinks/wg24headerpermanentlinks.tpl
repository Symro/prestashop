   <ul class="links">
            <li class="first" ><a href="{$link->getPageLink('my-account', true)}" title="{l s='my account' mod='wg24headerpermanentlinks'}" class="top-link-my-acconut">{l s='my account' mod='wg24headerpermanentlinks'}</a></li>
            <li ><a href="{$base_dir_ssl}modules/blockwishlist/mywishlist.php" title="{l s='My Wishlist' mod='wg24headerpermanentlinks'}" class="top-link-my-wishlist">{l s='My Wishlist' mod='wg24headerpermanentlinks'}</a></li>
            
 {if $products} 
                <a href="{$link->getPageLink('products-comparison')}" title="{l s='Comparer' mod='wg24headerpermanentlinks'}" class="top-link-my-comparer">{l s='Comparer' mod='wg24headerpermanentlinks'}</a>
            {/if}
            <li ><a href="{$link->getPageLink($order_rules, true)}" title="{l s='Your Shopping Cart' mod='wg24headerpermanentlinks'}" class="top-link-checkout">{l s='Checkout' mod='wg24headerpermanentlinks'}</a></li>
  {if $isLogged}
    <li class=" last" ><a href="{$link->getPageLink('index', true, NULL, "mylogout")}" class="top-link-log-out" title="{l s='Log me out' mod='wg24headerpermanentlinks'}">{l s='Log out' mod='wg24headerpermanentlinks'}</a></li>
{else}
    <li class=" last" ><a href="{$link->getPageLink('my-account', true)}" class="top-link-log-out" title="{l s='Log In' mod='wg24headerpermanentlinks'}" >
            {l s='Log In' mod='wg24headerpermanentlinks'}</a></li>
       {/if}
        </ul>
    </div>