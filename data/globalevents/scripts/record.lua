function onRecord(current, old)
	local resultId = db.storeQuery("SELECT `config` FROM `server_config` WHERE `config` = 'players_record_time'")
	if resultId == false then
		db.query("INSERT INTO `server_config` (`config`, `value`) VALUES ('players_record_time', " .. db.escapeString(os.time()) .. ")")
	else
		db.query("UPDATE `server_config` SET `value` = " .. db.escapeString(os.time()) .. " WHERE `config` = 'players_record_time'")
	end
	local player = "players"
	if current == 1 then
		player = "player"
	end
	addEvent(broadcastMessage, 150, "New record: " .. current .. " " .. player .. " are logged in.", MESSAGE_STATUS_DEFAULT)
	return true
end