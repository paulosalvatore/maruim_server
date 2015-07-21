function onSay(player, words, param)
	if not player:getGroup():getAccess() then
		return true
	end

	local target = Creature(param)
	if target == nil then
		local split = param:split(",")
		if split[1] == nil or split[2] == nil or split[3] == nil then
			player:sendCancelMessage("Parâmetros insuficientes.")
			return false
		else
			-- {x = 1150, y = 1695, z = 5}
			if split[1]:find("x") and split[2]:find("y") and split[3]:find("z") then
				split[1] = split[1]:gsub("{x = ", "")
				split[2] = split[2]:gsub("y = ", "")
				split[3] = split[3]:gsub("}", "")
				split[3] = split[3]:gsub("z = ", "")
			end
			if not player:teleportTo(Position(split[1], split[2], split[3])) then
				player:sendCancelMessage("Posição não encontrada.")
			end
			return false
		end

		player:sendCancelMessage("Criatura não encontrada.")
		return false
	end

	player:teleportTo(target:getPosition())
	return false
end
