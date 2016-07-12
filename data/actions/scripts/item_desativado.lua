function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local actionId = item:getActionId()
	if actionId == 2500 then
		return player:sendCancelMessage("You cannot use this object.")
	elseif actionId == 2501 then
		return player:sendTextMessage(MESSAGE_INFO_DESCR, "Essa porta está trancada.")
	elseif actionId == 2502 then
		return player:sendTextMessage(MESSAGE_INFO_DESCR, "Esse portão está trancado.")
	end
end