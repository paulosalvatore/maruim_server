local config = {
	[901] = {1, 5},
	[902] = {2, 6},
	[903] = {3, 7},
	[904] = {4, 8}
}
function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return
	end
	if config[item.actionid] ~= nil then
		if not isInArray(config[item.actionid], player:getVocation():getId()) then
			player:sendCancelMessage("Você precisa ser um " .. Vocation(config[item.actionid][1]):getName() .. " para entrar neste local.")
		else
			return
		end
	end
	player:teleportTo(fromPosition, true)
	return true
end