<?php
if (!defined('_PS_VERSION_'))
	exit;
class wg24headerpermanentlinks extends Module
{
	public function __construct()
	{
        $this->name = 'wg24headerpermanentlinks';
        $this->author = '24WebGroup';
        $this->tab = 'front_office_features';
        $this->version = '1.1.0';
        $this->need_instance = 0;
        parent::__construct();
        $this->secure_key = Tools::encrypt($this->name);
        $this->displayName = $this->l('24WebGroup Header Permanent Links');
        $this->confirmUninstall = $this->l('Are you sure you want to uninstall on this module?');
        $this->description = $this->l('Header Permanent Links module show page on header By 24WebGroup');
	}

	public function install()
	{
		return (parent::install() AND $this->registerHook('header') AND $this->registerHook('top') );
	}
	public function hookTop($params)
	{
		if (!$this->active)
			return;
		$this->smarty->assign(array(
			'isLogged' => $this->context->customer->isLogged(),
			'order_rules' => Configuration::get('PS_ORDER_PROCESS_TYPE') ? 'order-opc' : 'order'
		));
		return $this->display(__FILE__, 'wg24headerpermanentlinks.tpl');
	}


}


