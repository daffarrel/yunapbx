<?php
include_once(dirname(__FILE__) . '/../config/yunapbx.php');
include_once(dirname(__FILE__) . '/../include/db_utils.inc.php');
include_once(dirname(__FILE__) . '/../include/smarty_utils.inc.php');
include_once(dirname(__FILE__) . '/../include/admin_utils.inc.php');

function SoundEntries_Delete() {
    $db = DB::getInstance();
    $smarty = smarty_init(dirname(__FILE__) . '/templates');

    $PK_SoundEntries = $_REQUEST['PK_SoundEntries'];

    // In confirmed, do the actual delete
    if (@$_REQUEST['submit'] == 'delete_confirm') {

        // Delete Sound Entry
        $query = "DELETE FROM SoundEntries WHERE PK_SoundEntry IN ($PK_SoundEntries)";
        $db->query($query) or die(print_r($db->errorInfo(), true));

        // Delete Sound Files from Disk
        $query = "SELECT PK_SoundFile,Filename FROM SoundFiles WHERE FK_SoundEntry IN ($PK_SoundEntries)";
        $result = $db->query($query) or die(print_r($db->errorInfo(), true));
        while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
            @unlink($row['Filename']);
        }

        // Delete Sound Files from Disk
        $query = "DELETE FROM SoundFiles WHERE FK_SoundEntry IN ($PK_SoundEntries)";
        $db->query($query) or die(print_r($db->errorInfo(), true));

        header('Location: SoundEntries_List.php?msg=DELETE_ENTRY');
        die();
    }

    // Init Entries Info (SoundEntries)
    $query = "
		SELECT
			PK_SoundEntry        AS _PK_,
			PK_SoundEntry,
			SoundFiles.Name      AS Name,
			SoundFolders.Name    AS Folder,
			SoundLanguages.Name  AS Language,
			SoundPacks.Name      AS Pack,
			SoundEntries.Type    AS Type
		FROM
			SoundEntries
			INNER JOIN SoundFolders   ON FK_SoundFolder   = PK_SoundFolder
			LEFT  JOIN SoundFiles     ON FK_SoundEntry    = PK_SoundEntry
			LEFT  JOIN SoundLanguages ON FK_SoundLanguage = PK_SoundLanguage
			LEFT  JOIN SoundPacks     ON FK_SoundPack     = PK_SoundPack
		WHERE
			PK_SoundEntry IN ($PK_SoundEntries)
		GROUP BY
			PK_SoundEntry
	";
    $result = $db->query($query) or die(print_r($db->errorInfo(), true));

    $SoundEntries = array();
    while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
        $SoundEntries[] = $row;
    }

    $smarty->assign('PK_SoundEntries', $PK_SoundEntries);
    $smarty->assign('SoundEntries', $SoundEntries);

    return $smarty->fetch('SoundEntries_Delete.tpl');
}

admin_run('SoundEntries_Delete', 'Admin.tpl');
?>