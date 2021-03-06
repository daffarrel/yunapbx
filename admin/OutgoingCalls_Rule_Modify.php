<?php
include_once(dirname(__FILE__) . '/../config/yunapbx.php');
include_once(dirname(__FILE__) . '/../include/db_utils.inc.php');
include_once(dirname(__FILE__) . '/../include/smarty_utils.inc.php');
include_once(dirname(__FILE__) . '/../include/admin_utils.inc.php');
include_once(dirname(__FILE__) . "/../include/asterisk_utils.inc.php");

function OutgoingCalls_Rule_Modify() {
    $db = DB::getInstance();
    $smarty = smarty_init(dirname(__FILE__) . '/templates');

    // Init form data (Rule, Errors)
    if (@$_REQUEST['submit'] == 'save') {
        $Rule = formdata_from_post();
        $Errors = formdata_validate($Rule);

        if (count($Errors) == 0) {
            $id = formdata_save($Rule);
            asterisk_UpdateConf('extensions.conf');
            asterisk_Reload();
            if ($Rule['PK_OutgoingRule'] == '') {
                header("Location: OutgoingCalls.php?msg=CREATE_RULE&hilight={$id}");
                die();
            } else {
                header("Location: OutgoingCalls.php?msg=MODIFY_RULE&hilight={$id}");
                die();
            }
        }
    } else {
        if ($_REQUEST['PK_OutgoingRule'] != "") {
            $Rule = formdata_from_db($_REQUEST['PK_OutgoingRule']);
        } else {
            $Rule['Allow'] = '1';
            $Rule['Final'] = '1';
        }
    }

    // SipProviders
    $SipProviders = array();
    $query = "SELECT * FROM SipProviders ORDER BY Name";
    $result = $db->query($query) or die(print_r($db->errorInfo(), true));
    while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
        $SipProviders[] = $row;
    }

    // IaxProviders
    $Dongles = array();
    $query = "SELECT * FROM Dongles ORDER BY Name";
    $result = $db->query($query) or die(print_r($db->errorInfo(), true));
    while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
        $Dongles[] = $row;
    }

    $smarty->assign('SipProviders', $SipProviders);
    $smarty->assign('Dongles', $Dongles);
    $smarty->assign('Rule', $Rule);
    $smarty->assign('Errors', $Errors);

    return $smarty->fetch('OutgoingCalls_Rule_Modify.tpl');
}

function formdata_from_db($id) {
    $db = DB::getInstance();
    $data = $_REQUEST;
    $query = "
		SELECT
			PK_OutgoingRule,
			Name,
			Final,
			BeginWith,
			RestBetweenLow,
			RestBetweenHigh,
			TrimFront,
			PrependDigits,
			ProviderType,
			ProviderID
		FROM
			OutgoingRules
		WHERE
			PK_OutgoingRule = $id
		LIMIT 1
	";
    $result = $db->query($query) or die(print_r($db->errorInfo(), true));
    $data = $result->fetch(PDO::FETCH_ASSOC);

    return $data;
}

function formdata_from_post() {
    return $_POST;
}

function formdata_save($data) {
    $db = DB::getInstance();
    if ($data['PK_OutgoingRule'] == "") {
        $query = "SELECT MAX(RuleOrder) FROM OutgoingRules";
        $result = $db->query($query) or die(print_r($db->errorInfo(), true));
        $row = $result->fetch_row();
        $RuleOrder = $row[0] + 1;

        $query = "INSERT INTO OutgoingRules(RuleOrder) VALUES($RuleOrder)";
        $db->query($query) or die(print_r($db->errorInfo(), true));

        $data['PK_OutgoingRule'] = $db->lastInsertId();
        
        if($data['Allow']) {
            $query = "INSERT INTO Extension_Rules SELECT PK_Extension, " . $data['PK_OutgoingRule'] . " FROM Ext_SipPhones";
            $db->query($query) or die(print_r($db->errorInfo(), true));
        }
    }

    $query = "
		UPDATE
			OutgoingRules
		SET
			Name            = '" . $mysqli->real_escape_string($data['Name']) . "',
			Final           =  " . ($data['Final'] ? '1' : '0') . ",
			BeginWith       = '" . $mysqli->real_escape_string($data['BeginWith']) . "',
			RestBetweenLow  = '" . intval($data['RestBetweenLow']) . "',
			RestBetweenHigh = '" . intval($data['RestBetweenHigh']) . "',
			PrependDigits   = '" . $mysqli->real_escape_string($data['PrependDigits']) . "',
			ProviderType    = '" . $mysqli->real_escape_string($data['ProviderType']) . "',
			TrimFront       = '" . $mysqli->real_escape_string($data['TrimFront']) . "',
			ProviderID      =  " . intval($data['ProviderID']["{$data['ProviderType']}"]) . "
		WHERE
			PK_OutgoingRule = " . $mysqli->real_escape_string($data['PK_OutgoingRule']) . "
		LIMIT 1
	";
    $db->query($query) or die(print_r($db->errorInfo(), true));

    return $data['PK_OutgoingRule'];
}

function formdata_validate($data) {
    $errors = array();
    if ($data['Name'] == "") {
        $errors['Name'] = true;
    }
    if (!preg_match('/^[0-9]+$/', $data['RestBetweenLow'])) {
        $errors['RestBetweenLow'] = true;
    }
    if (!preg_match('/^[0-9]+$/', $data['RestBetweenHigh'])) {
        $errors['RestBetweenHigh'] = true;
    }
    if (!preg_match('/^[0-9]{0,2}$/', $data['TrimFront'])) {
        $errors['TrimFront'] = true;
    }
    if (!preg_match('/^[+]{0,1}[*#0-9]{0,20}$/', $data['PrependDigits'])) {
        $errors['PrependDigits'] = true;
    }
    /* if (!preg_match('/^[*#(|)^0-9]{1,24}$/', $data['BeginWith'])) {
      $errors['BeginWith'] = true;
      } */
    return $errors;
}

admin_run('OutgoingCalls_Rule_Modify', 'Admin.tpl');
?>
