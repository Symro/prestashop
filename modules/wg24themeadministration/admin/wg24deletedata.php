<?php
if (!defined('_PS_VERSION_'))
    exit;
class wg24deletedata{
 
     public function wg24_administration_value_delete() {
        $wg24values = $this->wg24values;
        foreach ($wg24values as $wg24_value_result){
            $wg24data = $wg24_value_result['wg24'];
            if (isset($wg24data)) {
                if (is_array($wg24data)) {
                    foreach ($wg24data as $key => $wg24_output_data) {
                        Configuration::deleteByName($wg24_value_result['id'] . '_' . $key);
                    }
                } else {
                    $languages = Language::getLanguages(false);
                    if (isset($wg24_value_result['lang']) && $wg24_value_result['lang'] == true) {
                        foreach ($languages as $langua) {
                            Configuration::deleteByName($wg24_value_result['id'] . '_' . $langua['id_lang']);
                        }
                    } else {
                        Configuration::deleteByName($wg24_value_result['id']);
                    }
                }
    }
}
    }

      
}?>