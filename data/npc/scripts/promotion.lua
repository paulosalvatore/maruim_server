local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(player)       npcHandler:onCreatureAppear(player)       end
function onCreatureDisappear(player)     npcHandler:onCreatureDisappear(player)       end
function onCreatureSay(player, type, msg)
	if player:isPromoted() then
		npcHandler:setMessage(MESSAGE_GREET, "Saudações |PLAYERNAME|. Está precisando de ajuda em algo?")
	else
		npcHandler:setMessage(MESSAGE_GREET, "Olá jovem aprendiz. Se está preparado para melhorar suas habilidades, eu posso {promover} a sua vocação.")
	end
	npcHandler:onCreatureSay(player, type, msg)
end
function onThink()         npcHandler:onThink()           end
local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if isInArray({"promover", "promoção", "promocao", "promotion", "promot"}, msg) and player:isPromoted() == false then
		if player:getLevel() < 20 then
			npcHandler:say("Você precisa ter pelo menos nível 20 para receber uma promoção.", player)
		elseif player:verificarReputacao() < Reputacao.promocao then
			npcHandler:say("Você não possui reputação suficiente. Volte quando tiver pelo menos reputação " .. Reputacao.promocao .. " com a sua vocação.", player)
		else
			npcHandler:say("Parabéns! Você foi promovido.", player)
			player:promote()
		end
	end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())