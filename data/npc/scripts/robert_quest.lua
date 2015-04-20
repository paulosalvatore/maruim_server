local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid)       npcHandler:onCreatureAppear(cid)       end
function onCreatureDisappear(cid)     npcHandler:onCreatureDisappear(cid)       end
function onCreatureSay(cid, type, msg)     npcHandler:onCreatureSay(cid, type, msg)     end
function onThink()         npcHandler:onThink()           end
local storage = 2900
function creatureSayCallback(cid, type, msg)
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	local player = Player(cid)
	if not npcHandler:isFocused(cid) then
		if msg == "hi" or msg == "hello" then
			if getPlayerStorageValue(cid, storage) == -1 then
				npcHandler:say({"Olá "..player:getName()..". Minha filha e eu estávamos caminhando pela floresta quando uma criatura a atacou.",
				"Assim que chegamos na cidade procurei por ajuda, mas ninguém conseguiu curá-la.",
				"Ouvi boatos de que apenas um {antídoto} misterioso teria tal poder."}, cid)
				talkState[talkUser] = 1
			elseif getPlayerStorageValue(cid, storage) == 1 then
				npcHandler:say("Você encontrou o antídoto?", cid)
				talkState[talkUser] = 3
			else
				npcHandler:say("Muito obrigado novamente por ter trazido a Miraculum para mim. O antídoto foi produzido com sucesso ", cid)
			end
			npcHandler:addFocus(cid)
		else
			return false
		end
	end
	if (msgcontains(msg, "antidoto") or msgcontains(msg, "antídoto")) and talkState[talkUser] == 1 then
		npcHandler:say({"Minha última esperança é um antídoto criado a partir de uma erva chamada Miraculum.",
		"Tentei procurá-la mas não posso deixar a Julia sozinha, preciso ficar cuidando dela.",
		"Você poderia encontrá-la para mim?"}, cid)
		talkState[talkUser] = 2
	elseif (msgcontains(msg, "yes") or msgcontains(msg, "sim")) then
		if talkState[talkUser] == 1 then
			npcHandler:say("Muito obrigado, volte quando encontrá-la.", cid)
			setPlayerStorageValue(cid, storage, 1)
			talkState[talkUser] = 0
		elseif talkState[talkUser] == 3 then
			if doPlayerRemoveItem(cid, 12430, 1) then
				npcHandler:say("Muito obrigado, vejo que você encontrou a Miraculum. Em agradecimento, falarei com o guarda do castelo para liberar a sua entrada por lá. Boa sorte em sua jornada!", cid)
				setPlayerStorageValue(cid, storage, 2)
			else
				npcHandler:say("Você não possui ela.", cid)
			end
		end
	elseif (msgcontains(msg, "no") and ((talkState[talkUser] == 1) or (talkState[talkUser] == 3))) then
		npcHandler:say("Tudo bem...", cid)
		talkState[talkUser] = 0
	elseif ((msgcontains(msg, "bye")) or (msgcontains(msg, "tchau"))) then
		npcHandler:say("Adeus. Tome cuidado pelo caminho!", cid)
		npcHandler:releaseFocus(cid)
	end
	return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
-- local keywordHandler = KeywordHandler:new()
-- local npcHandler = NpcHandler:new(keywordHandler)
-- NpcSystem.parseParameters(npcHandler)
-- local talkState = {}
-- function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
-- function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
-- function onCreatureSay(cid, type, msg)
	-- isInArray(listaProfissoes, modalWindowId)
	-- local mensagens = {
		-- "Olá |PLAYERNAME|. Minha filha e eu estávamos caminhando pela floresta quando uma criatura a atacou. Assim que chegamos na cidade procurei por ajuda, mas ninguém conseguiu curá-la. Ouvi boatos de que apenas um {antídoto} misterioso teria tal poder.",
		-- "Teste"
	-- }
	-- for a, b in pairs(mensagens) do
		-- mensagens[a] = b:gsub("|PLAYERNAME|", cid:getName())
	-- end
	-- local storageQuest = 2900
	-- local storageValue = cid:getStorageValue(storageQuest)
	-- if(storageValue < 1) then
		-- npcHandler:say(mensagens[1], cid)
	-- end
	-- for a, b in pairs(npcHandler) do
		-- print(a,b)
	-- end
	-- npcHandler:say({"blabla 1",
	-- "blabla 2",
	-- "blalbla 3"}, cid)
	-- print(npcHandler)
	-- npcHandler:onCreatureSay(cid, type, msg)
-- end
-- function onThink() npcHandler:onThink() end

-- function quest(cid, message, keywords, parameters, node)
	-- if(not npcHandler:isFocused(cid)) then
		-- return false
	-- end
	-- local player = Player(cid)
	-- local nomeJogador = player:getName()
	-- local storageQuest = 2900
	-- local storageValue = player:getStorageValue(storageQuest)
	-- if(storageValue == 1) then
		
	-- end
-- if getPlayerItemCount(cid,10934) >= 15 then
-- if doPlayerRemoveItem(cid,10934,15) then
-- npcHandler:say('Pegue seu item!', cid)
-- doPlayerAddItem(cid,10149,1)
-- end
-- else
-- npcHandler:say('Certifique-se de que tem todos os itens!', cid)
-- end
-- end
-- local mensagem1 = 'Minha última esperança é um antídoto criado a partir de uma erva chamada Miraculum. Tentei procurar mas não posso deixar a Julia sozinha, preciso ficar cuidando dela. Você poderia procurá-la para mim?'
-- local mensagemNegar1 = 'Tudo bem, eu entendo, você deve estar cansado.'

-- local node = keywordHandler:addKeyword({'antidoto'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = mensagem1})
-- node:addChildKeyword({'yes'}, quest, {npcHandler = npcHandler, onlyFocus = true, reset = true})
-- node:addChildKeyword({'sim'}, quest, {npcHandler = npcHandler, onlyFocus = true, reset = true})
-- node:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = mensagemNegar1, reset = true})
-- node:addChildKeyword({'não'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = mensagemNegar1, reset = true})
-- node:addChildKeyword({'nao'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = mensagemNegar1, reset = true})

-- local node1 = keywordHandler:addKeyword({'antídoto'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = mensagem1})
-- node1:addChildKeyword({'yes'}, quest, {npcHandler = npcHandler, onlyFocus = true, reset = true})
-- node1:addChildKeyword({'sim'}, quest, {npcHandler = npcHandler, onlyFocus = true, reset = true})
-- node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = mensagemNegar1, reset = true})
-- node1:addChildKeyword({'não'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = mensagemNegar1, reset = true})
-- node1:addChildKeyword({'nao'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = mensagemNegar1, reset = true})

-- npcHandler:addModule(FocusModule:new())