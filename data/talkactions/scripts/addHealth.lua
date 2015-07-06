function onSay(player, words, param)
	if not player:getGroup():getAccess() then
		return true
	end

	if player:getAccountType() < ACCOUNT_TYPE_GOD then
		return false
	end

	local split = param:split(",")

	local target = Player(split[1])
	if target == nil then
		player:sendCancelMessage("A player with that name is not online.")
		return false
	end

	local quantidade = nil
	if split[2] ~= nil then
		quantidade = tonumber(split[2])
	end

	target:curarJogador(quantidade)

	return false
end
