local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

local quantidadePocoes = {}

function onCreatureAppear(player)       npcHandler:onCreatureAppear(player)       end
function onCreatureDisappear(player)     npcHandler:onCreatureDisappear(player)       end
function onCreatureSay(player, type, msg)	npcHandler:onCreatureSay(player, type, msg)	end
function onThink()         npcHandler:onThink()           end
function onPlayerEndTrade(cid)				npcHandler:onPlayerEndTrade(cid)			end
function onPlayerCloseChannel(cid)			npcHandler:onPlayerCloseChannel(cid)		end

local function exibirQuantidadePocaoDisponivel(quantidade, marcarNumero)
	local exibirQuantidadePocaoDisponivel = "ão"
	if quantidade > 1 then
		exibirQuantidadePocaoDisponivel = "ões"
	end
	if marcarNumero then
		quantidade = "{" .. quantidade .. "}"
	end
	return quantidade .. " poç" .. exibirQuantidadePocaoDisponivel
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	local ervaId = 5921
	local pocaoId = 8704
	local quantidadeErva = player:getItemCount(ervaId)
	if isInArray({"potion", "pocao", "poção", "pocoes", "poções"}, msg) then
		if quantidadeErva > 0 then
			npcHandler:say("Você pode fazer até " .. exibirQuantidadePocaoDisponivel(quantidadeErva, true) .. ". Você quer fazer uma {quantidade} específica ou deseja fazer {tudo}?", cid)
			npcHandler.topic[cid] = 1
		else
			npcHandler:say("Você não possui ervas disponíveis.", cid)
			npcHandler.topic[cid] = 0
		end
	elseif npcHandler.topic[cid] == 1 then
		if isInArray({"all", "todas", "todos", "tudo"}, msg) then
			quantidadePocoes[cid] = quantidadeErva
		elseif tonumber(msg) ~= nil then
			quantidadePocoes[cid] = tonumber(msg)
		end
		if quantidadePocoes[cid] > 0 then
			npcHandler:say("Você deseja fazer " .. exibirQuantidadePocaoDisponivel(quantidadePocoes[cid]) .. "?", cid)
			npcHandler.topic[cid] = 2
		end
	elseif npcHandler.topic[cid] == 2 then
		if isInArray({"yes", "sim"}, msg) then
			if player:removeItem(ervaId, quantidadePocoes[cid]) then
				player:addItem(pocaoId, quantidadePocoes[cid])
				npcHandler:say("Prontinho! Faça um bom uso!", cid)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("Você não possui ervas suficiente.", cid)
				npcHandler.topic[cid] = 0
			end
		elseif isInArray({"no", "não", "nao"}, msg) then
			npcHandler:say("Tudo bem. Quando quiser fazer {poções} volte a falar comigo!", cid)
			npcHandler.topic[cid] = 1
		end
	end
end

keywordHandler:addKeywords({{'erva'}, {'heaven blossom'}}, StdModule.say, {npcHandler = npcHandler, text = "A heaven blossom é uma erva excelente na criação de {poções} de cura. Você pode coletá-la em diversos locais da Maruim Island, basta selecionar a opção 'use' em cima de uma que esteja brilhando."})
keywordHandler:addKeyword({'quantidade'}, StdModule.say, {npcHandler = npcHandler, text = "Quantas poções deseja fazer?"})

npcHandler:setMessage(MESSAGE_GREET, "Olá |PLAYERNAME|. Eu posso fazer {poções} para você. Basta me trazer uma {erva} chamada {heaven blossom}.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Até logo!")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())