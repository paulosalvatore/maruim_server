local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end

local npc = Npc()
local npcName = npc:getName()
local configNpc = comerciantes[npcName]

if configNpc == nil then
	return
end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

for tipo, itens in pairs(configNpc["itens"]) do
	for chave, item in pairs(itens) do
		local itemId
		local valorItem

		if type(item) == "table" then
			itemId = item[1]
			valorItem = item[2]
		elseif type(item) == "number" then
			itemId = item
			valorItem = valorItens[itemId]
		else
			for c, d in pairs(categoriasItens[item]) do
				table.insert(itens, d)
			end
		end

		if itemId ~= nil then
			local itemType = ItemType(itemId)
			local nomeItem = itemType:getName()

			if tipo == "c" then
				shopModule:addBuyableItem({nomeItem}, itemId, type(valorItem) == "table" and valorItem[1] or valorItem, nomeItem)
			elseif tipo == "v" then
				shopModule:addSellableItem({nomeItem}, itemId, type(valorItem) == "table" and valorItem[2] or valorItem, nomeItem)
			end
		end
	end
end

local frases = configNpc["frases"] or {}

if frases["greet"] == nil then
	frases["greet"] = "Olá |PLAYERNAME|. Seja bem-vindo à minha loja."
end

if frases["trade"] == nil then
	frases["trade"] = "Essa é a lista de mercadorias que eu negocio. Interessado em algo?"
end

if frases["farewell"] == nil then
	frases["farewell"] = "Adeus!"
end

if frases["walkaway"] == nil then
	frases["walkaway"] = "Nos vemos depois!"
end

npcHandler:setMessage(MESSAGE_GREET, frases["greet"])
npcHandler:setMessage(MESSAGE_SENDTRADE, frases["trade"])
npcHandler:setMessage(MESSAGE_FAREWELL, frases["farewell"])
npcHandler:setMessage(MESSAGE_WALKAWAY, frases["walkaway"])

npcHandler:addModule(FocusModule:new())
