<?php
include_once(dirname(__FILE__) . '/../config/yunapbx.php');
include_once(dirname(__FILE__) . '/../include/db_utils.inc.php');
include_once(dirname(__FILE__) . '/../include/smarty_utils.inc.php');
include_once(dirname(__FILE__) . '/../include/admin_utils.inc.php');
include_once(dirname(__FILE__) . '/../include/asterisk_utils.inc.php');

function MOH_Groups_Delete() {
    $db = DB::getInstance();
    global $conf;
    
    $smarty = smarty_init(dirname(__FILE__) . '/templates');
    $path = $conf['dirs']['moh'];

    $PK_Group = $_REQUEST['PK_Group'];

    // In confirmed, do the actual delete
    if (@$_REQUEST['submit'] == 'delete_confirm') {

        //delete files from database
        $query = "DELETE FROM Moh_Files  WHERE FK_Group = $PK_Group";
        $db->query($query) or die(print_r($db->errorInfo(), true));

        //delete files from hdd
        $handle = @opendir($path . "/group_" . str_pad($PK_Group, 10, "0", STR_PAD_LEFT) . "/");
        if ($handle) {
            while (false !== ($file = readdir($handle))) {
                if ($file != "." && $file != "..") {
                    @unlink($path . "/group_" . str_pad($PK_Group, 10, "0", STR_PAD_LEFT) . "/" . $file);
                }
            }
            closedir($handle);
            @rmdir($path . "/group_" . str_pad($PK_Group, 10, "0", STR_PAD_LEFT));
        }

        //delete directories from database
        $query = "DELETE FROM Moh_Groups WHERE PK_Group = '$PK_Group'";
        $db->query($query) or die(print_r($db->errorInfo(), true));

        asterisk_UpdateConf('musiconhold.conf');
        asterisk_Reload();

        header('Location: MOH_Groups_List.php');
        die();
    }

    $query = "SELECT PK_Group, Name FROM Moh_Groups WHERE PK_Group =  $PK_Group;";
    $result = $db->query($query) or die(print_r($db->errorInfo(), true));
    $Group = $result->fetch(PDO::FETCH_ASSOC);

    $smarty->assign('Group', $Group);

    return $smarty->fetch('MOH_Groups_Delete.tpl');
}

admin_run('MOH_Groups_Delete', 'Admin.tpl');
