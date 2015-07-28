local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local valorViagem = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)				end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)				end
function onCreatureSay(player, type, msg)
	npcHandler:setMessage(MESSAGE_GREET, "Olá |PLAYERNAME|. Eu posso te levar para a sua {guilda}.")
	npcHandler:onCreatureSay(player, type, msg)
end
function onThink()							npcHandler:onThink()							end

function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if isInArray({"travel", "viagem", "viajar", "guilda"}, msg) then
		local acessoLiberado = false
		if Npc():getName() == "Albert" or player:pegarReputacao() >= Reputacao.viagem.acessoLiberado then
			acessoLiberado = true
		end
		if acessoLiberado then
			valorViagem[cid] = 0
			npcHandler:say("Muito bem! Você tem certeza que deseja ir?", cid)
		else
			valorViagem[cid] = Reputacao.viagem.valor
			npcHandler:say("Você não possui reputação necessária com a sua guilda para viajar gratuitamente. Será cobrada uma taxa de " .. valorViagem[cid] .. " gp. Você deseja ir?", cid)
		end
		npcHandler.topic[cid] = 1
	elseif isInArray({"yes", "sim"}, msg) and npcHandler.topic[cid] == 1 then
		if not player:removeMoney(valorViagem[cid]) then
			npcHandler:say("Você não possui dinheiro suficiente.", cid)
			npcHandler.topic[cid] = 0
		else
			npcHandler:unGreet(cid)
			local vocacao = player:getVocation():getId()
			local posicao
			if isInArray(Vocacoes.sorcerer, vocacao) then
				posicao = {x = 597, y = 972, z = 7}
			elseif isInArray(Vocacoes.druid, vocacao) then
				posicao = {x = 539, y = 949, z = 7}
			elseif isInArray(Vocacoes.paladin, vocacao) then
				posicao = {x = 450, y = 957, z = 7}
			elseif isInArray(Vocacoes.knight, vocacao) then
				posicao = {x = 658, y = 907, z = 7}
			end
			player:teleportarJogador(posicao, true)
		end
	end
end

npcHandler:setMessage(MESSAGE_WALKAWAY, "Até breve!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Até breve, |PLAYERNAME|!")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
