local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

function onCreatureAppear(player)       npcHandler:onCreatureAppear(player)       end
function onCreatureDisappear(player)     npcHandler:onCreatureDisappear(player)       end
function onCreatureSay(player, type, msg)
	local reputacao = player:pegarReputacao()
	for a, b in pairs(Reputacao.loja) do
		if reputacao >= b.reputacao then
			local nomeItem = ItemType(a):getName()
			shopModule:addBuyableItem({nomeItem}, a, b.preco, 1, nomeItem)
		end
	end
	local rankReputacao = player:pegarRankReputacao()
	local reputacaoInfo = Reputacao.ranks[rankReputacao]
	local fraseNpc = reputacaoInfo.fraseNpc
	if player:isPromoted() and reputacaoInfo.fraseNpcPromovido ~= nil then
		fraseNpc = reputacaoInfo.fraseNpcPromovido
	end
	npcHandler:setMessage(MESSAGE_GREET, formatarFrase(fraseNpc, player))
	npcHandler:setMessage(MESSAGE_FAREWELL, "Até logo!")
	npcHandler:onCreatureSay(player, type, msg)
end
function onThink()         npcHandler:onThink()           end
function onPlayerEndTrade(cid)				npcHandler:onPlayerEndTrade(cid)			end
function onPlayerCloseChannel(cid)			npcHandler:onPlayerCloseChannel(cid)		end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if isInArray({"task", "tasks", "tarefa", "tarefas"}, msg) then
		player:enviarTasksModalPrincipal()
		player:registerEvent("Tasks")
		npcHandler:setMessage(MESSAGE_FAREWELL, "Veja as tarefas disponíveis, caso precise de mais alguma coisa, volte a falar comigo!")
		npcHandler:unGreet(cid)
	elseif isInArray({"promotion", "promot", "promote", "promover", "promoção", "promocao"}, msg) then
		if player:isPromoted() then
			npcHandler:say("Você já está promovido.", cid)
		elseif player:getLevel() < 20 then
			npcHandler:say("Você precisa ter pelo menos nível 20 para receber uma promoção.", cid)
		elseif player:pegarReputacao() < Reputacao.promocao then
			npcHandler:say("Você precisa ter pelo menos " .. Reputacao.promocao .. " pontos de reputação para receber uma promoção.", cid)
		else
			npcHandler:say("Parabéns! Você foi promovido.", cid)
			player:promote()
		end
	end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())