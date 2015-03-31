<?php
include_once('../../config/config.inc.php');
include_once('../../init.php');
include_once(dirname(__FILE__) . '/wg24themeadministration.php');
$wg24themeadministration = new wg24themeadministration();
$onclick_btn = $_POST['type'];
if ($onclick_btn == 'wg24administrationvalue') {
    $post_data = $_POST['data'];
    parse_str($post_data, $data);
    foreach ($data as $id => $result) {
        if (is_array($result)) {
            foreach ($result as $key => $result_value) {
                Configuration::updateValue($id . "_" . $key, $result_value, true, 0, 0);
            }
        } else {
            Configuration::updateValue($id, htmlspecialchars($result), true, 0, 0);
        }
    }
}
elseif ($onclick_btn == 'pattern_upload') {
    $post_data = $_POST['data']; 
    $file_name = $_FILES[$post_data];
    $file_name['name'] = preg_replace('/[^a-zA-Z0-9._\-]/', '', $file_name['name']);
    move_uploaded_file($file_name['tmp_name'], 'img/upload/' . $file_name['name']);    
    echo  __PS_BASE_URI__ . 'modules/wg24themeadministration/img/upload/' . $file_name['name'];
}elseif ($onclick_btn == 'pattern_reset"') {
    Configuration::deleteByName($_POST['data']);
}
die();
?>
        



