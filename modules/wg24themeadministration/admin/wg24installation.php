<?php
if (!defined('_PS_VERSION_'))
    exit;
class wg24installation{
 
    public function wg24_installValues() {
        $wg24values = $this->wg24values;
        foreach ($wg24values as $wg24_value_result){
            $wg24data = $wg24_value_result['wg24'];
            if (isset($wg24data)) {
                if (is_array($wg24data)) {
                    foreach ($wg24data as $key => $wg24_output_data) {
                        Configuration::updateValue($wg24_value_result['id'] . "_" . $key, htmlspecialchars($wg24_output_data));
                    }
                } else {
                    $languages = Language::getLanguages(false);
                    if (isset($wg24_value_result['lang']) && $wg24_value_result['lang'] == true) {
                        foreach ($languages as $langua) {
                            Configuration::updateValue($wg24_value_result['id'] . '_' . $langua['id_lang'], htmlspecialchars($wg24_value_result['wg24']));
                        }
                    } else {
                        Configuration::updateValue($wg24_value_result['id'], htmlspecialchars($wg24_value_result['wg24']));
                    }
                }
        }
        }
        return true;
    }

      
}?>