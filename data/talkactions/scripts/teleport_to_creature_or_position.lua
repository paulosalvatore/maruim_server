function onSay(player, words, param)
	if not player:getGroup():getAccess() then
		return true
	end

	local target = Creature(param)
	if target == nil then
		local split = param:split(",")
		if	split[1] == nil or split[2] == nil or split[3] == nil then
			player:sendCancelMessage("Insufficient parameters.")
			return false
		else
			if not player:teleportarJogador(Position(split[1], split[2], split[3])) then
				player:sendCancelMessage("Position not found.")
			end
			return false
		end

		player:sendCancelMessage("Creature not found.")
		return false
	end

	player:teleportTo(target:getPosition())
	return false
end
