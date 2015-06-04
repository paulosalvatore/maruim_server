local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local player = Player(cid)
if player:isPromoted() then
	npcHandler:setMessage(MESSAGE_GREET, "Saudações |PLAYERNAME|. Está precisando de ajuda em algo?")
else
	npcHandler:setMessage(MESSAGE_GREET, "Olá jovem aprendiz. Se está preparado para melhorar suas habilidades, eu posso {promover} a sua vocação.")
end
local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	if isInArray({"promover", "promoção", "promocao", "promotion", "promot"}, msg) and player:isPromoted() == false then
		local reputacaoNecessaria = 1
		if player:getLevel() < 20 then
			npcHandler:say("Você precisa ter pelo menos nível 20 para receber uma promoção.", cid)
		elseif player:getReputacao() < reputacaoNecessaria then
			npcHandler:say("Você não possui reputação suficiente. Volte quando tiver pelo menos reputação " .. reputacaoNecessaria .. " com a sua vocação.", cid)
		else
			npcHandler:say("Parabéns! Você foi promovido.", cid)
			player:setVocation(Vocation(player:getVocation():getPromotion():getId()))
		end
	end
end

npcHandler:addModule(FocusModule:new())
