<?php
include_once(dirname(__FILE__) . '/../config/yunapbx.php');
include_once(dirname(__FILE__) . '/../include/db_utils.inc.php');
include_once(dirname(__FILE__) . '/../include/smarty_utils.inc.php');
include_once(dirname(__FILE__) . '/../include/admin_utils.inc.php');

function Extensions_FC_DirectedPickup_Modify() {
    $db = DB::getInstance();
    
    $session = &$_SESSION['Extensions_FC_DirectedPickup_Modify'];
    $smarty = smarty_init(dirname(__FILE__) . '/templates');

    //myprint($_REQUEST);

    if ($_REQUEST['PK_Extension']) {
        $pk_ext = $_REQUEST['PK_Extension'];
        //Preexisted Members
        $query = " SELECT
						FK_Ext_Member, ConnectionID, FK_Ext_Group
					FROM
						FC_DirectedPickup_Members
					WHERE
						FK_Extension = '" . $mysqli->escape_string($pk_ext) . "' ORDER BY FK_Ext_Member, FK_Ext_Group";
        $result = $db->query($query) or die(print_r($db->errorInfo(), true));
        $Members = array();
        while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
            $Members[] = $row;
        }

        //Preexisted Admins
        $query = " SELECT
						FK_Ext_Admin, ConnectionID, FK_Ext_Group
					FROM
						FC_DirectedPickup_Admins
					WHERE
						FK_Extension = '" . $mysqli->escape_string($pk_ext) . "' ORDER BY FK_Ext_Admin, FK_Ext_Group";
        $result = $db->query($query) or die(print_r($db->errorInfo(), true));
        $Admins = array();
        while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
            $Admins[] = $row;
        }

        //Preexisted ConnectionIDs
        $query = " SELECT DISTINCT
						ConnectionID
					FROM
						FC_DirectedPickup_Admins
					ORDER BY ConnectionID";
        $result = $db->query($query) or die(print_r($db->errorInfo(), true));
        $IDs = array();
        while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
            $IDs[] = $row['ConnectionID'];
        }
    }

    $Rows = @data_rows($Admins, $Members, $IDs);

    // Init message (Message)
    $Message = (isset($_REQUEST['msg'])?$_REQUEST['msg']:"");

    // Groups
    $query = "SELECT PK_Group, Name FROM Groups";
    $result = $db->query($query) or die(print_r($db->errorInfo(), true));
    $Groups = array();
    while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
        $Groups[] = $row;
    }

    // Init Available Accounts (Accounts)
    $query = "
		SELECT
			Extensions.PK_Extension,
			Extension,
			CONCAT(IFNULL(Ext_SipPhones.FirstName,''),IFNULL(Ext_Virtual.FirstName,'')) AS FirstName,
			CONCAT(IFNULL(Ext_SipPhones.LastName ,''),IFNULL(Ext_Virtual.LastName,''))  AS LastName
		FROM
			Extensions
			LEFT JOIN Ext_SipPhones ON Ext_SipPhones.PK_Extension = Extensions.PK_Extension
			LEFT JOIN Ext_Virtual   ON Ext_Virtual.PK_Extension   = Extensions.PK_Extension
		WHERE
			Extensions.Type IN ('Virtual', 'SipPhone')
		ORDER BY Extension
	";
    $result = $db->query($query) or die(print_r($db->errorInfo(), true));
    $Accounts = array();
    while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
        $Accounts[] = $row;
    }

    if (@$_REQUEST['submit'] == 'save') {
        $Extension = formdata_from_post();
        $Errors = formdata_validate($Extension);

        if (count($Errors) == 0) {
            if ($Extension['PK_Extension'] != '') {
                $msg = 'MODIFY_FC_DIRECTEDPICKUP_EXTENSION';
            } else {
                $msg = 'ADD_FC_DIRECTEDPICKUP_EXTENSION';
            }
            $id = @formdata_save($Extension);

            header("Location: Extensions_List.php?hilight={$id}&msg={$msg}");
            die();
        }
    } elseif (@$_REQUEST['PK_Extension'] != "") {
        $Extension = formdata_from_db($_REQUEST['PK_Extension']);
    } else {
        $Extension = formdata_from_default();
    }

    $smarty->assign('Groups', $Groups);
    $smarty->assign('Accounts', $Accounts);
    $smarty->assign('Rows', $Rows);

    $smarty->assign('FC_DirectedPickup', $Extension);
    $smarty->assign('Errors', $Errors);

    return $smarty->fetch('Extensions_FC_DirectedPickup_Modify.tpl');
}

function data_rows($master, $slave, $IDs) {
    foreach ($IDs as $id) {
        for ($i = 0; $i < count($master); $i++) {
            if ($master[$i]['ConnectionID'] == $id) {
                if ($master[$i]['FK_Ext_Admin'] != 0) {
                    $data[$id]['master']['pk_ext'][] = $master[$i]['FK_Ext_Admin'];
                } else {
                    $data[$id]['master']['pk_group'][] = $master[$i]['FK_Ext_Group'];
                }
            }
        }
        for ($i = 0; $i < count($slave); $i++) {
            if ($slave[$i]['ConnectionID'] == $id) {
                if ($slave[$i]['FK_Ext_Member'] != 0) {
                    $data[$id]['slave']['pk_ext'][] = $slave[$i]['FK_Ext_Member'];
                } else {
                    $data[$id]['slave']['pk_group'][] = $slave[$i]['FK_Ext_Group'];
                }
            }
        }
    }
    return $data;
}

function formdata_from_db($id) {
    $db = DB::getInstance();
    $query = "
		SELECT
			*
		FROM
			FC_DirectedPickup
			INNER JOIN Extensions ON Extensions.PK_Extension = FC_DirectedPickup.FK_Extension
		WHERE
			FC_DirectedPickup.FK_Extension = '$id'
		LIMIT 1
	";
    $result = $db->query($query) or die(print_r($db->errorInfo(), true));
    $data = $result->fetch(PDO::FETCH_ASSOC);

    return $data;
}

function formdata_from_default() {
    $data = array();
    return $data;
}

function formdata_from_post() {
    return $_REQUEST;
}

function formdata_save($data) {
    $db = DB::getInstance();
    //myprint($data);
    if ($data['PK_Extension'] == "") {
        $query = "INSERT INTO
						Extensions(Feature, Type, Extension)
					VALUES
						(1, 'FC_DirectedPickup', '" . $mysqli->real_escape_string($data['Extension']) . "')";
        $db->query($query) or die(print_r($db->errorInfo(), true));
        $data['PK_Extension'] = $db->lastInsertId();

        $query = "INSERT INTO FC_DirectedPickup(FK_Extension) VALUES({$data['PK_Extension']})";
        $db->query($query) or die(print_r($db->errorInfo(), true));
    }

    // Update 'FC_DirectedPickup_Admins'
    $query = "DELETE FROM
					FC_DirectedPickup_Admins
		      WHERE
					FK_Extension = " . $mysqli->real_escape_string($data['PK_Extension']) . " ";
    $db->query($query) or die(print_r($db->errorInfo(), true));

    foreach (array_keys($data['Admin']) as $connectionId) {
        $ExtOrGroup = array_keys($data['Admin'][$connectionId]);
        foreach ($data['Admin'][$connectionId] as $pks) {
            foreach ($pks as $pk_ext) {
                if ($ExtOrGroup[0] == "Extension") {
                    $FK_Ext_Admin = $pk_ext;
                    $FK_Ext_Group = 0;
                } else if ($ExtOrGroup[0] == "Group") {
                    $FK_Ext_Admin = 0;
                    $FK_Ext_Group = $pk_ext;
                } else {
                    die("Error Extension/Group category.");
                }

                $query = "
					INSERT INTO
						FC_DirectedPickup_Admins (FK_Extension, ConnectionID, FK_Ext_Admin, FK_Ext_Group)
					VALUES
						({$data['PK_Extension']}, {$connectionId}, {$FK_Ext_Admin}, {$FK_Ext_Group} )";
                $db->query($query) or die(print_r($db->errorInfo(), true));
            }
        }
    }


    // Update 'FC_DirectedPickup_Members'
    $query = " DELETE FROM
					FC_DirectedPickup_Members
			   WHERE
					FK_Extension = " . $mysqli->real_escape_string($data['PK_Extension']) . " ";
    $db->query($query) or die(print_r($db->errorInfo(), true));

    foreach (array_keys($data['Member']) as $connectionId) {
        $ExtOrGroup = array_keys($data['Member'][$connectionId]);
        foreach ($data['Member'][$connectionId] as $pks) {
            foreach ($pks as $pk_ext) {
                if ($ExtOrGroup[0] == "Extension") {
                    $FK_Ext_Member = $pk_ext;
                    $FK_Ext_Group = 0;
                } else {
                    $FK_Ext_Member = 0;
                    $FK_Ext_Group = $pk_ext;
                }
                $query = "
					INSERT INTO
						FC_DirectedPickup_Members (FK_Extension, ConnectionID, FK_Ext_Member, FK_Ext_Group)
					VALUES
						({$data['PK_Extension']}, {$connectionId}, {$FK_Ext_Member}, {$FK_Ext_Group} )";
                $db->query($query) or die(print_r($db->errorInfo(), true));
            }
        }
    }
    return $data['PK_Extension'];
}

function formdata_validate($data) {
    $db = DB::getInstance();
    $errors = array();

    if ($data['PK_Extension'] == '') {
        $create_new = true;
    }

    if ($create_new) {
        // Check if extension is empty
        if ($data['Extension'] == "") {
            $errors['Extension']['Invalid'] = true;
            // Check if Extension is numeric
        } elseif (intval($data['Extension']) . "" != $data['Extension']) {
            $errors['Extension']['Invalid'] = true;
            // Check if extension is proper length
        } elseif (strlen($data['Extension']) < 1 || strlen($data['Extension']) > 2) {
            $errors['Extension']['Invalid'] = true;
            // Check if extension in unique
        } else {
            $query = "SELECT Extension FROM Extensions WHERE Extension = '{$data['Extension']}' LIMIT 1";
            $result = $db->query($query) or die(print_r($db->errorInfo(), true));
            if ($result->num_rows > 0) {
                $errors['Extension']['Duplicate'] = true;
            }
        }
    }
    return $errors;
}

admin_run('Extensions_FC_DirectedPickup_Modify', 'Admin.tpl');
