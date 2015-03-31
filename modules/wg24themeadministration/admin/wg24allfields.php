<?php
if (!defined('_PS_VERSION_'))
    exit;
class wg24allfields{
 
    public function wg24_administration_all_fields() {
        $wg24values = $this->wg24values;
        $wg24_administration_data = array();
        $wg24_tabs = '';
        $wg24_count_data = 0;
        $wg24_fields_result = '';
        foreach ($wg24values as $wg24_output) {
            $wg24_count_data++;
            if ($wg24_output['type'] != "tabs_title") {
                $tabs_title_class = '';
                if (isset($wg24_output['class'])) {
                    $tabs_title_class = $wg24_output['class'];
                }
                $wg24_fields_result .= '<div class="fieldupload  field-' . $wg24_output['type'] . ' ' . $tabs_title_class . '">';

                if ($wg24_output['type'] != "content-title") {
                    if (isset($wg24_output['name']))
                        $wg24_fields_result .= '<h2 class="tabs_title">' . $wg24_output['name'] . '</h2>';
                }else {
                    $wg24_fields_result .= '<h2 class="content-title">' . $wg24_output['name'] . '</h2>';
                }
                if (isset($wg24_output['sub_name']))
                    $wg24_fields_result .= '<h2>' . $wg24_output['sub_name'] . '</h2>';

                $wg24_fields_result .= '<div class="option">';
                if (!$wg24_output['dsc']):
                    $wg24_fields_result .= '<div class="manage managefull">';
                else:
                    $wg24_fields_result .= '<div class="manage">';
                endif;
            }
            switch ($wg24_output['type']) {
                case 'text':
                    $type_value = '';

                    if (isset($wg24_output['values'])) {
                        $text_option = $wg24_output['values'];
                        if (isset($text_option['cols'])) {
                            $cols = $text_option['cols'];
                        }
                    }
                    $defaultLanguage = (int) (Configuration::get('PS_LANG_DEFAULT'));
                    $divLangName = $wg24_output['id'];

                    if (isset($wg24_output['lang']) && $wg24_output['lang'] == true)
                        $wg_24 = $this->wg24_administration_save_values($wg24_output['id'] . '_' . $defaultLanguage);
                    else
                        $wg_24 = $this->wg24_administration_save_values($wg24_output['id']);
                    if ($wg_24 != "") {
                        $type_value = stripslashes($wg_24);
                    }
                    $languages = Language::getLanguages(false);
                    if (isset($wg24_output['lang']) && $wg24_output['lang'] == true):
                        foreach ($languages as $langua) {
                            $wg_24 = $this->wg24_administration_save_values($wg24_output['id'] . '_' . $langua['id_lang']);
                            if ($wg_24 != "") {
                                $type_value = stripslashes($wg_24);
                            }
                            $wg24_fields_result .='<div id="' . $wg24_output['id'] . '_' . $langua['id_lang'] . '" style="display: ' . ($langua['id_lang'] == $defaultLanguage ? 'block' : 'none') . ';float: left;">';
                            $wg24_fields_result .= '<input class="wg24-input" name="' . $wg24_output['id'] . '_' . $langua['id_lang'] . '" id="' . $wg24_output['id'] . '_' . $langua['id_lang'] . '" value="' . $type_value . '" />';
                            $wg24_fields_result .= '</div>';
                        }

                        $wg24_fields_result .=$this->displayFlags($languages, $defaultLanguage, $divLangName, $wg24_output['id'], true);
                    else:
                        $wg_24 = $this->wg24_administration_save_values($wg24_output['id']);
                        if ($wg_24 != "") {
                            $type_value = stripslashes($wg_24);
                        }
                        $wg24_fields_result .= '<input class="wg24-input" name="' . $wg24_output['id'] . '" id="' . $wg24_output['id'] . '" value="' . $type_value . '" />';
                    endif;
                    break;
                     case 'textarea':
                    $cols = '11';
                    $type_value = '';
                    $defaultLanguage = (int) (Configuration::get('PS_LANG_DEFAULT'));
                    $divLangName = $wg24_output['id'];
                    if (isset($wg24_output['lang']) && $wg24_output['lang'] == true)
                        $wg24 = $this->wg24_administration_save_values($wg24_output['id'] . '_' . $defaultLanguage);
                    else
                        $wg24 = $this->wg24_administration_save_values($wg24_output['id']);
                    if ($wg24 != "") {
                        $type_value = stripslashes($wg24);
                    }
                    $languages = Language::getLanguages(false);
                    if (isset($wg24_output['lang']) && $wg24_output['lang'] == true):
                        foreach ($languages as $langua) {
                            $wg24 = $this->wg24_administration_save_values($wg24_output['id'] . '_' . $langua['id_lang']);
                            if ($wg24 != "") {
                                $type_value = stripslashes($wg24);
                            }
                            $wg24_fields_result .='<div id="' . $wg24_output['id'] . '_' . $langua['id_lang'] . '" style="display: ' . ($langua['id_lang'] == $defaultLanguage ? 'block' : 'none') . ';float: left;">';
                            $wg24_fields_result .= '<textarea class="wg24-input" name="' . $wg24_output['id'] . '_' . $langua['id_lang'] . '" id="' . $wg24_output['id'] . '_' . $langua['id_lang'] . '" cols="' . $cols . '" rows="8">' . $type_value . '</textarea>';
                            $wg24_fields_result .= '</div>';
                        }

                        $wg24_fields_result .=$this->displayFlags($languages, $defaultLanguage, $divLangName, $wg24_output['id'], true);
                    else:
                        $wg24 = $this->wg24_administration_save_values($wg24_output['id']);
                        if ($wg24 != "") {
                            $type_value = stripslashes($wg24);
                        }
                        $wg24_fields_result .= '<textarea class="wg24-input" name="' . $wg24_output['id'] . '" id="' . $wg24_output['id'] . '" cols="' . $cols . '" rows="8">' . $type_value . '</textarea>';
                    endif;
                    break;
                case "radio":
                    $selected_value = $this->wg24_administration_save_values($wg24_output['id']);
                    foreach ($wg24_output['values'] as $option_val => $name) {
                        $checked = '';
                        if ($selected_value = '') {
                            if ($selected_value == $option_val) {
                                $checked = ' checked';
                            }
                        } else {

                            if ($wg24_output['wg24'] == $option_val) {
                                $checked = ' checked';
                            }
                        }
                        $wg24_fields_result .= '<input class="wg24-input of-radio" name="' . $wg24_output['id'] . '" type="radio" value="' . $option_val . '" ' . $checked . ' /><label class="radio">' . $name . '</label><br/>';
                    }
                    break;
                case 'block_text':
                    $type_value = $this->wg24_administration_save_values($wg24_output['id']);
                    $wg24 = $this->wg24_administration_save_values($wg24_output['id']);
                    if ($wg24 != "") {
                        $type_value = stripslashes($wg24);
                    }
                    $wg24_fields_result .= '<input class="wg24-input" name="' . $wg24_output['id'] . '" id="' . $wg24_output['id'] . '" type="' . $wg24_output['type'] . '" value="' . $type_value . '" />';
                    break;
                
                 case 'upload':
                    $wg24_fields_result .= wg24allfields::wg24_add_image($wg24_output['id'], $wg24_output['wg24']);
                    break;
                case 'checkbox':
                    if (!isset($wg24_administration_data[$wg24_output['id']])) {
                        $wg24_administration_data[$wg24_output['id']] = 0;
                    }
                    $get_wg24 = $this->wg24_administration_save_values($wg24_output['id']);
                    $wg24 = $wg24_output['wg24'];
                    $checked = '';
                    if (!empty($get_wg24)) {
                        if ($get_wg24 == '1') {
                            $checked = 'checked="checked"';
                        } else {
                            $checked = '';
                        }
                    } elseif ($wg24 == '1') {
                        $checked = 'checked="checked"';
                    } else {
                        $checked = '';
                    }
                    $wg24_fields_result .= '<input type="hidden" class="' . 'checkbox aq-input" name="' . $wg24_output['id'] . '" id="' . $wg24_output['id'] . '" value="0"/>';
                    $wg24_fields_result .= '<input type="checkbox" class="' . 'checkbox wg24-input" name="' . $wg24_output['id'] . '" id="' . $wg24_output['id'] . '" value="1" ' . $checked . ' />';
                    break;
                case 'color':
                    $type_value = '';
                    $wg24 = $this->wg24_administration_save_values($wg24_output['id']);
                    if ($wg24 != "") {
                        $type_value = stripslashes($wg24);
                    }
                    $wg24_fields_result .= '<div id="' . $wg24_output['id'] . '_picker" class="selectColor"><div style="background-color: ' . $type_value . '"></div></div>';
                    $wg24_fields_result .= '<input class="of-color" name="' . $wg24_output['id'] . '" id="' . $wg24_output['id'] . '" type="text" value="' . $type_value . '" />';
                    break;
                 case 'select':
                    $wg24_fields_result .= '<div class="for-body-selected">';
                    $wg24_fields_result .= '<select class="of-typography of-typography-size select" name="' . $wg24_output['id'] . '" id="' . $wg24_output['id'] . '">';
                    foreach ($wg24_output['values'] as $select_key => $option_val) {
                        $selected_value = $this->wg24_administration_save_values($wg24_output['id']);
                        if ($selected_value != '') {
                            if ($selected_value == $select_key) {
                                $selected_value = ' selected="selected"';
                            }
                        } else {
                            if ($wg24_output['wg24'] == $select_key) {
                                $selected_value = ' selected="selected"';
                            }
                        }
                        $wg24_fields_result .= '<option id="' . $select_key . '" value="' . $select_key . '" ' . $selected_value . ' />' . $option_val . '</option>';
                    }
                    $wg24_fields_result .= '</select></div>';
                    break;
                case 'images':
                    $i = 0;
                    $get_wg24 = $this->wg24_administration_save_values($wg24_output['id']);
                    $wg24 = $wg24_output['wg24'];
                    foreach ($wg24_output['values'] as $key => $option_val) {
                        $i++;
                        if (!empty($get_wg24)) {
                            if ($get_wg24 == $key) {
                                $selected_value = 'add-radio-picture';
                            } else {
                                $selected_value = '';
                            }
                        } elseif ($wg24 == $key) {
                            $selected_value = 'add-radio-picture';
                        } else {
                            $selected_value = '';
                        }
                        $wg24_fields_result .= '<span>';
                        $wg24_fields_result .= '<input type="radio" id="of-radio-img-' . $wg24_output['id'] . $i . '" class="checkbox of-radio-img-radio" value="' . $key . '" name="' . $wg24_output['id'] . '" ' . $selected_value . ' />';
                        $wg24_fields_result .= '<div class="for-radio-picture-label">' . $key . '</div>';
                        $wg24_fields_result .= '<img src="' . $option_val . '" alt="" class="radio-box-picture ' . $selected_value . '" onClick="document.getElementById(\'of-radio-img-' . $wg24_output['id'] . $i . '\').checked = true;" />';
                        $wg24_fields_result .= '</span>';
                    }
                    break;
                case "image":
                    $src = $wg24_output['wg24'];
                    $wg24_fields_result .= '<img src="' . $src . '">';
                    break;
                case 'tabs_title':
                    if ($wg24_count_data >= 2) {
                        $wg24_fields_result .= '</div>';
                    }
                    $wg24_tabs_class = str_replace(' ', '', strtolower($wg24_output['name']));
                    $click_tabs_title = str_replace(' ', '', strtolower($wg24_output['name']));
                    $click_tabs_title = "of-option-" . $click_tabs_title;
                    $wg24_tabs .= '<li class="' . $wg24_tabs_class . ' "><a   title="' . $wg24_output['name'] . '" href="#' . $click_tabs_title . '">' . $wg24_output['name'] . '</a></li>';
                    $wg24_fields_result .= '<div  id="' . $click_tabs_title . '"> <div ><h1>' . $wg24_output['name'] . '</h1></div>' . "\n";
                    break;
                case 'switcherbutton':
                    $get_wg24 = $this->wg24_administration_save_values($wg24_output['id']);
                    $checked = '';
                    if ($get_wg24 != '') {

                        if ($get_wg24 == 'show') {
                            $checked = ' checked';
                        }
                    } else {
                        if ($wg24_output['wg24'] == 'show') {
                            $checked = ' checked';
                        }
                    }
                    $anaselect = ($get_wg24 == "show") ? "selected" : ' ';
                    $disselet = ($get_wg24 == "hide") ? "selected" : ' ';
                    $wg24_fields_result .='<p class="field switch">
                            <input type="radio" id="radio' . $wg24_output['switch_value'][0] . '" name="' . $wg24_output['id'] . '" value="show" ' . $checked . ' />
                            <input type="radio" id="radio' . $wg24_output['switch_value'][1] . '" name="' . $wg24_output['id'] . '" value="hide" />
                            
                            <label for="radio' . $wg24_output['switch_value'][0] . '" class="sw-show ' . $anaselect . '"><span>' . $wg24_output['values'][0] . '</span></label>
                            <label for="radio' . $wg24_output['switch_value'][1] . '" class="sw-hide ' . $disselet . '"><span>' . $wg24_output['values'][1] . '</span></label>
                        </p>';
                    break;
                case 'tiles':
                    $i = 0;
                    $get_wg24 = $this->wg24_administration_save_values($wg24_output['id']);
                    $wg24 = $wg24_output['wg24'];
                    foreach ($wg24_output['values'] as $key => $option_val) {
                        $i++;
                        if (!empty($get_wg24)) {
                            if ($get_wg24 == $option_val) {
                                $selected_value = 'wg24-radio-tile-selected';
                            } else {
                                $selected_value = '';
                            }
                        } elseif ($wg24 == $option_val) {
                            $selected_value = 'wg24-radio-tile-selected';
                        } else {
                            $selected_value = '';
                        }
                        $wg24_fields_result .= '<span>';
                        $wg24_fields_result .= '<input type="radio" id="wg24-radio-tile-' . $wg24_output['id'] . $i . '" class="checkbox wg24-radio-tile-radio" value="' . $option_val . '" name="' . $wg24_output['id'] . '" />';
                        $wg24_fields_result .= '<div class="wg24-radio-tile-img ' . $selected_value . '" onClick="document.getElementById(\'wg24-radio-tile-' . $wg24_output['id'] . $i . '\').checked = true;"><img src="' . $option_val . '" width="50" height="50"></div>';
                        $wg24_fields_result .= '</span>';
                    }

                    break;
                  case 'typography':
                    $get_face = $this->wg24_administration_save_values($wg24_output['id'] . '_face');
                    $typography = $wg24_output['wg24'];
                    if (isset($typography['face'])) {
                        if ($wg24_output['section'] == 'google') {
                            $wg24_fields_result .= '<div id="live_show_googl_font" ><h4>Quick brown fox jumps over the lazy dog</h4></div>';
                        } else {
                            $wg24_fields_result .= '<div id="live_show_system_font"><h4>Quick brown fox jumps over the lazy dog</h4></div>';
                        }
                        $wg24_fields_result .= '<div class="for-body-selected typography-face" original-title="Font family">';
                        $wg24_fields_result .= '<select class="of-typography of-typography-face select" name="' . $wg24_output['id'] . '[face]" id="' . $wg24_output['id'] . '_face">';
                        
                        $json = file_get_contents("https://www.googleapis.com/webfonts/v1/webfonts?key=AIzaSyBGSBS_pzdsUff3dah-mgL-AaHqTWJ8eQo", true);
                        $decode = json_decode($json, true);
                        $google_web_fonts = array();
                        foreach ($decode['items'] as $key => $value) {
                            $item_family = $decode['items'][$key]['family'];
                            $fontvariants = $decode['items'][$key]['variants'];
                            $item_family_trunc = str_replace(' ', '+', $item_family);
                            $google_web_fonts[$item_family_trunc] = $item_family;
                        }
                        $localfonts= array( 
                         'Source+Sans+Pro,sans-serif' => 'Source Sans Pro,sans-serif',    
                        'Open+Sans' => 'Open Sans', 
                       'Arial,Helvetica' => 'Arial, Helvetica',
                       'Geneva' => 'Geneva',
                       'Helvetica,sans-serif' => 'Helvetica, sans-serif',
                       'Times+New+Roman' => 'Times New Roman',  
                       'Times,serif' => 'Times, serif',                       
                       'PT+Sans' => 'PT Sans',
                        'monospace' => 'monospace',    
                       'Georgia,serif' => 'Georgia,Times, serif',  
                       'Verdana' => 'Verdana',
                       'Oswald' => 'Oswald',
                        'Telex'=>'Telex' ,
                       'Iceberg' => 'Iceberg',  
                        'Yanone+Kaffeesatz' => 'Yanone Kaffeesatz ExtraLight',
                       'tahoma'=>'Tahoma, Geneva',
                        'Amethysta' => 'Amethysta',
                       'Courier+New,Courier' => 'Courier New, Courier',      
                        'Gudea'=> 'Gudea',
                        'Duru+Sans' => 'Duru Sans',
                       'Germania+One' => 'Germania One',    
                       'Macondo+Swash+Caps'=>'Macondo Swash Caps',       
                        );
                        if ($wg24_output['section'] == 'google') {
                            $webfont = $google_web_fonts;
                        } else {
                            $webfont=$localfonts;
                        }
                        foreach ($webfont as $key => $fontfamily) {
                            $idfont = trim($key);
                            if (!empty($get_face)) {
                                if ($wg24_output['section'] == 'google') {
                                    if (trim($get_face) == $fontfamily)
                                        $selected_gval = 'selected="selected"';
                                    else
                                        $selected_gval = '';
                                }else {
                                    if (trim($get_face) == $idfont)
                                        $selected_value = 'selected="selected"';
                                    else
                                        $selected_value = '';
                                }
                            }else {
                                if ($wg24_output['section'] == 'google') {
                                    if (trim($typography['face']) == $fontfamily)
                                        $selected_gval = 'selected="selected"';
                                    else
                                        $selected_gval = '';
                                }else {
                                    if (trim($typography['face']) == $idfont)
                                        $selected_value = 'selected="selected"';
                                    else
                                        $selected_value = '';
                                }
                            }
                            if ($wg24_output['section'] == 'google') {
                                $wg24_fields_result .= '<option value="' . $fontfamily . '" ' . $selected_gval . '>' . $fontfamily . '</option>';
                            } else {
                                $wg24_fields_result .= '<option value="' . $key . '" ' . $selected_value . '>' . $fontfamily . '</option>';
                            }
                        }

                        $wg24_fields_result .= '</select>';
                        $wg24_fields_result .= '</div>';
                    }
                    if (isset($typography['color'])) {

                        if (!empty($get_color)) {
                            $selected_value = $get_color;
                        } else {
                            $selected_value = $typography['color'];
                        }

                        $wg24_fields_result .= '<div id="' . $wg24_output['id'] . '_col_add" class="selectColor"><div style="background-color: ' . $selected_value . '"></div></div>';
                        $wg24_fields_result .= '<input  original-title="Font color" name="' . $wg24_output['id'] . '[col_add]" id="' . $wg24_output['id'] . '_col_add" type="text" value="' . $selected_value . '" />';
                    }
                    break;  
                    
            }
            if ($wg24_output['type'] != 'tabs_title') {
                if (!isset($wg24_output['dsc'])) {
                    $explain_value = '';
                } else {
                    $explain_value = '<div class="explain">' . $wg24_output['dsc'] . '</div>';
                }
                $wg24_fields_result .= '</div>' . $explain_value;
                $wg24_fields_result .= '<div class="clear"> </div></div></div>';
            }
        }
        $wg24_fields_result .= '</div>';
        return array($wg24_fields_result, $wg24_tabs);
    }
    
    
private function wg24_add_image($id, $wg24) {
        $add_image_data = '';
        $add_image = $this->wg24_administration_save_values($id);
        if ($add_image != "") {
            $value = $add_image;
        } else {
            $value = $wg24;
        }
        $add_image_data .= '<input class="upload wg24-input" name="' . $id . '" id="' . $id . '_add" value="' . $value . '" />';

        $add_image_data .= '<div class="upload_button_div"><span class="button upload_button" id="' . $id . '">Upload</span>';
        if (!empty($add_image)) {
            $hidden = '';
        } else {
            $hidden = 'hidden';
        }
        $add_image_data .= '<span class="button reset_button ' . $hidden . '" id="reset_' . $id . '" title="' . $id . '">Remove</span>';
        $add_image_data .='</div><div class="clear"></div>';
        if (!empty($add_image)) {
            $add_image_data .= '<div class="screenshot">';
            $add_image_data .= '<a class="wg24-uploaded-image" href="' . $add_image . '">';
            $add_image_data .= '<img class="for-body-picture" id="image_' . $id . '" src="' . $add_image . '" alt="" />';
            $add_image_data .= '</a>';
            $add_image_data .= '</div><div class="clear"></div>';
        }
        return $add_image_data;
    }

      
}?>