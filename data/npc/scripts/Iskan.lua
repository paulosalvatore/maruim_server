local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)				end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)				end
function onCreatureSay(player, type, msg)
	local fraseNpc = "Olá |PLAYERNAME|."
	local storageValue = player:getStorageValue(Storage.tartaruga)

	if storageValue <= 0 then
		fraseNpc = fraseNpc .. " Que bons ventos o trazem por aqui? Talvez você queira saber algumas informações sobre minha {tartaruga}."
	elseif storageValue == 1 then
		fraseNpc = fraseNpc .. " Por acaso você trouxe os 10 fish fins que eu te pedi?"
	elseif storageValue == 2 then
		fraseNpc = fraseNpc .. " Você poderá viajar de volta para a {tartaruga} quando quiser."
	end

	npcHandler:setMessage(MESSAGE_GREET, fraseNpc)
	npcHandler:onCreatureSay(player, type, msg)
end
function onThink()							npcHandler:onThink()							end

function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	local storageValue = player:getStorageValue(Storage.tartaruga)
	if storageValue <= 0 and isInArray({"tartaruga"}, msg) and npcHandler.topic[cid] == 0 then
		npcHandler:say("Então você está interessado? Muito bem! Minha tartaruga é um animal muito bem treinado para transportar viajantes pelo lago. Porém, ela só transporta aqueles que possuem a minha {autorização}.", cid)
		npcHandler.topic[cid] = 1
	elseif storageValue <= 0 and isInArray({"autorizacao", "autorização"}, msg) and npcHandler.topic[cid] == 1 then
		npcHandler:say("Para conseguir a minha autorização, você deve me trazer 10 fish fins. Você pode conseguí-los matando aquelas criaturas nojentas que habitam as profundezas dessas águas.", cid)
		player:setStorageValue(Storage.tartaruga, 1)
	elseif storageValue == 1 and isInArray({"yes", "sim", "fish fin", "fish fins"}, msg) and npcHandler.topic[cid] == 0 then
		if not player:removeItem(5895, 10) then
			npcHandler:say("Volte aqui quando tiver as 10 fish fins!", cid)
		else
			npcHandler:say("Muito obrigado! Agora você poderá viajar pela {tartaruga} quando quiser. Sempre que quiser voltar para ela, fale comigo.", cid)
			player:setStorageValue(Storage.tartaruga, 2)
		end
	elseif storageValue == 2 and isInArray({"tartaruga"}, msg) then
		npcHandler:say("Deseja voltar para a tartaruga?", cid)
		npcHandler.topic[cid] = 1
	elseif storageValue == 2 and isInArray({"yes", "sim"}, msg) and npcHandler.topic[cid] == 1 then
		npcHandler:unGreet(cid)
		player:teleportarJogador({x = 911, y = 1792, z = 7}, true)
	end
end

npcHandler:setMessage(MESSAGE_WALKAWAY, "Até mais!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Boa sorte em sua jornada, |PLAYERNAME|!")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
