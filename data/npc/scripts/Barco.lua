local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end

local npc = Npc()
local npcName = npc:getName()
local configNpc = barqueiros[relacionarBarqueiros[npcName]]

if configNpc == nil then
	return
end

local destinosNpc = configNpc.destinos
local tipoViagem = configNpc.tipoViagem
local palavrasChave
local mensagemViagem

if tipoViagem == "navio" then
	mensagemViagem = "Icem as velas!"
	palavrasChave = {{"travel"}, {"viagem"}, {"viajar"}, {"destinos"}, {"sail"}, {"navegar"}}
	npcHandler:setMessage(MESSAGE_GREET, "Seja bem-vindo a bordo, |PLAYERNAME|! Para onde gostaria de {navegar} hoje?")
	npcHandler:setMessage(MESSAGE_FAREWELL, "Adeus |PLAYERNAME|. Recomende nós se você estiver satisfeito com nossos serviços!")
elseif tipoViagem == "tapete" then
	palavrasChave = {{"travel"}, {"destinos"}, {"fly"}, {"voar"}}
	mensagemViagem = "Segure-se!"
	npcHandler:setMessage(MESSAGE_GREET, "Saudações, viajante |PLAYERNAME|! Para onde gostaria de {voar} hoje?")
	npcHandler:setMessage(MESSAGE_FAREWELL, "Foi um prazer ajudá-lo, |PLAYERNAME|.")
elseif tipoViagem == "barco" then
	palavrasChave = {{"travel"}, {"destinos"}, {"sail"}, {"velejar"}}
	mensagemViagem = "Lá vamos nós!"
	npcHandler:setMessage(MESSAGE_GREET, "Saudações, |PLAYERNAME|! Para onde gostaria de {velejar} hoje?")
end

local exibirDestinos = ""

for a, b in pairs(destinosNpc) do
	local destino = destinos[b]
	local exibirDestino = "{".. destino.nome .. "}"

	if a > 1 then
		if a < #destinosNpc then
			exibirDestino = ", " .. exibirDestino
		else
			exibirDestino = " ou " .. exibirDestino
		end
	end

	exibirDestinos = exibirDestinos .. exibirDestino

	local levelNecessario = 0

	if destino.levelNecessario ~= nil and type(destino.levelNecessario) == "number" then
		levelNecessario = destino.levelNecessario
	end

	local palavrasChaveViagem = {string.lower(destino.nome)}

	if destino.palavrasChave ~= nil then
		for a, b in pairs(destino.palavrasChave) do palavrasChaveViagem[a] = b end
	end

	for a, b in pairs(palavrasChaveViagem) do
		local travelNode = keywordHandler:addKeyword({b}, StdModule.say, {npcHandler = npcHandler, text = "Você procura por uma passagem para " .. destino.nome .. " por " .. destino.custo .. " gold coins?"})
			travelNode:addChildKeywords({{"yes"}, {"sim"}}, StdModule.travel, {npcHandler = npcHandler, level = levelNecessario, cost = destino.custo, destination = destino.posicao, msg = mensagemViagem})
			travelNode:addChildKeywords({{"no"}, {"não"}, {"nao"}}, StdModule.say, {npcHandler = npcHandler, reset = true, text = "Sem problemas! Nós iremos serví-lo algum dia."})
	end
end

local textoDestino

if #destinosNpc == 1 then
	textoDestino = "Eu posso te levar para " .. exibirDestinos .. "."
else
	textoDestino = "Para onde você deseja ir? " .. exibirDestinos .. "?"
end

keywordHandler:addKeywords(palavrasChave, StdModule.say, {npcHandler = npcHandler, text = textoDestino})

npcHandler:addModule(FocusModule:new())
