<?php
include_once(dirname(__FILE__).'/../include/db_utils.inc.php');
include_once(dirname(__FILE__).'/../include/smarty_utils.inc.php');
include_once(dirname(__FILE__).'/../include/admin_utils.inc.php');

function TimeFrames() {
	session_start();
	$session = &$_SESSION['TimeFrames'];
	$smarty  = smarty_init(dirname(__FILE__).'/templates');

	// Init Message
	$Message = $_REQUEST['msg'];
	
	// If requested, create new timeframe
	if (isset($_POST['sumbit'])) {
		$data = $_POST;
		
		if (strlen($data['Name']) < 1 || strlen($data['Name']) > 30) {
			$errors['Name'] = true;
		}
		
		if (count($errors) == 0) {
			$query = "INSERT INTO Timeframes(Name) VALUES('".mysql_real_escape_string($_POST['Name'])."')";
			mysql_query($query) or die(mysql_error().$query);
			
			$PK_Timeframe = mysql_insert_id();
			header("Location: TimeFrames_Modify.php?msg=CREATE_TIMEFRAME&FK_Timeframe={$PK_Timeframe}"); die();
		}
	}
	
	// Init table fields (Timeframes)
	$Timeframes = array();
	$query = "
		SELECT
			PK_Timeframe AS _PK_,
			Name         AS Name
		FROM
			Timeframes
		WHERE
			FK_Extension = 0
		ORDER BY Name
	";
	
	$result = mysql_query($query) or die(mysql_error());
	while ($row = mysql_fetch_assoc($result)) {
		$Timeframes[] = $row;
	}

	$smarty->assign('Timeframes', $Timeframes);
	$smarty->assign('Errors'    , $errors);
	$smarty->assign('Message'   , $Message);

	return $smarty->fetch('TimeFrames.tpl');
}

admin_run('TimeFrames', 'Admin.tpl');