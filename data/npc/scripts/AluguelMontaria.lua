local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()							npcHandler:onThink()						end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end


	if isInArray({"transport", "transporte", "transportar"}, msg) then
		npcHandler:say("Podemos te levar até Hyalakur para um de nossos treinadores por 125 gold coins. Está interessado?", cid)
		npcHandler.topic[cid] = 1
	elseif isInArray({"rent", "horses", "aluguel", "alugar", "cavalos"}, msg) then
		npcHandler:say("Você deseja alugar um cavalo por um dia pelo preço de 500 gold coins?", cid)
		npcHandler.topic[cid] = 2
	elseif isInArray({"yes", "sim"}, msg) and npcHandler.topic[cid] > 0 then
		local player = Player(cid)
		if npcHandler.topic[cid] == 1 then
			if player:isPzLocked() then
				npcHandler:say("Primeiro livre-se dessas manchas de sangue!", cid)
				return true
			end

			if not player:removeMoney(125) then
				npcHandler:say("Você não possui dinheiro suficiente.", cid)
				return true
			end

			local npcName = Npc():getName()

			local destino
			if npcName == "Ethan" then
				destino = {x = 1084, y = 1646, z = 7}
			elseif npcName == "Bess" then
				destino = {x = 907, y = 1896, z = 7}
			end

			player:teleportarJogador(destino)
			npcHandler:say("Faça uma boa viagem", cid)
		elseif npcHandler.topic[cid] == 2 then
			if player:getStorageValue(Storage.aluguelMontaria) >= os.time() then
				npcHandler:say("Você já possui um cavalo.", cid)
				return true
			end

			if not player:removeMoney(500) then
				npcHandler:say("Você não possui dinheiro suficiente para alugar um cavalo!", cid)
				return true
			end

			local mountId = {22, 25, 26}
			player:addMount(mountId[math.random(#mountId)])
			player:setStorageValue(Storage.aluguelMontaria, os.time() + 86400)
			npcHandler:say("Vou te dar um dos nossos cavalos mais experientes. Tome conta dele! Tome cuidado com os locais perigosos.", cid)
		end
		npcHandler.topic[cid] = 0
	elseif isInArray({"no", "não"}, msg) and npcHandler.topic[cid] > 0 then
		npcHandler:say("Tudo bem então.", cid)
		npcHandler.topic[cid] = 0
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Saudações, |PLAYERNAME|. Eu acho que você está aqui por causa dos {cavalos}.")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
