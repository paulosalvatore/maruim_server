local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local npc = Npc()
local npcName = npc:getName()
local configNpc = barqueiros[npcName]
local destinosNpc = configNpc.destinos

for a, b in pairs(destinosNpc) do
	local destino = destinos[b]
	local levelNecessario = 0
	local destinoNome = string.lower(destino.nome)
	if destino.levelNecessario ~= nil and type(destino.levelNecessario) == "number" then
		levelNecessario = destino.levelNecessario
	end
	local travelNode = keywordHandler:addKeyword({destinoNome}, StdModule.say, {npcHandler = npcHandler, text = 'Você procura por uma passagem para ' .. destinoNome .. ' por ' .. destino.custo .. ' gold coins?'})
		travelNode:addChildKeywords({{'yes'}, {'sim'}}, StdModule.travel, {npcHandler = npcHandler,  level = levelNecessario, cost = destino.custo, destination = destino.posicao})
		travelNode:addChildKeywords({{'no'}, {'não'}, {'nao'}}, StdModule.say, {npcHandler = npcHandler, reset = true, text = 'Sem problemas! Nós iremos serví-lo algum dia.'})
end

npcHandler:addModule(FocusModule:new())