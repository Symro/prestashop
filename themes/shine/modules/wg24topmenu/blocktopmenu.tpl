
<nav>
  <div class="nav-inner">
      {if $MENU != ''}
    <ul id="nav">
            <li id="nav-home" class="{if $page_name=="index"} sfHoverForce {/if} first homelink">
                <a href="{$base_uri}"><span>{l s='Home' mod='wg24topmenu'}</span></a>
            </li>
            {$MENU}
     {if $webgroup24.wg24_main_cus_m_shine=="show"}       
      <li class="nav-custom-link level0 level-top parent">
        {$webgroup24.wg24_cus_html_m_m_shine|html_entity_decode}
      </li>
     {/if}
    </ul>
  {/if}
          
 

  {hook h="displayNav"}   
 </div>
</nav>


{if $MENU != ''}		
  <div class="hidden-desktop" id="menu">
    <ul class="navmenu">
      <li>
        <div class="menutop">
          <div class="toggle"> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span></div>
          <h2>{l s='Categories' mod='wg24topmenu'}</h2>
        </div>
        <ul style="display:none;" class="submenu">
          <li>
            <ul class="topnav">
                   <li class="level1 nav-6-1 first"> <a href="{$base_uri}"><span>{l s='Home' mod='wg24topmenu'}</span></a></li>
                    {$MENU}
            </ul>
          </li>
        </ul>
      </li>
    </ul>
    <!--navmenu-->
  </div>
     <script type="text/javascript">
jQuery(document).ready(function() {
jQuery('.toggle').click(function() {
if (jQuery('.submenu').is(":hidden"))
{
jQuery('.submenu').slideDown("fast");
} else {
jQuery('.submenu').slideUp("fast");
}
return false;
});
});


</script>   
  
 {/if}

 <div id="header">
 <div class="top-cart-contain">
      <div class="mini-cart"> 

 

