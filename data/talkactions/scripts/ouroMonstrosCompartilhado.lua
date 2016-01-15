function onSay(player, words, param)

	local talkaction = "dividirOuro"
	local tempoDelay = 10

	if	delayTalkactions[talkaction] ~= nil and
		delayTalkactions[talkaction][player:getId()] ~= nil and
		delayTalkactions[talkaction][player:getId()] > os.time() then
		player:sendCancelMessage("Você deve aguardar pelo menos " .. tempoDelay .. " segundos para utilizar esse comando novamente.")
		return false
	end

	local party = player:getParty()

	if party then
		local leader = party:getLeader()

		if leader:getId() == player:getId() then
			party:alterarOuroMonstroCompartilhado()
		else
			player:sendCancelMessage("Você deve ser líder da party para realizar esse comando.")
		end

		if delayTalkactions[talkaction] == nil then
			delayTalkactions[talkaction] = {}
		end

		delayTalkactions[talkaction][player:getId()] = os.time() + tempoDelay
	else
		player:sendCancelMessage("Você deve estar em uma party para realizar esse comando.")
	end

	return false
end
