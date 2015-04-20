local storage = {
	[2901] = {
		storage = 2900,
		valor = 2,
		mensagemErro = "Sua entrada não é permitida nesse local."
	},
}
function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return
	end
	if storage[item.actionid] ~= nil and getPlayerStorageValue(player, storage[item.actionid].storage) ~= storage[item.actionid].valor then
		player:sendCancelMessage(storage[item.actionid].mensagemErro)
	else
		return
	end
	player:teleportTo(fromPosition, true)
	return true
end