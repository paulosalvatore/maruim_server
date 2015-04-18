local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then return false end
	local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
	local shopWindow = {}
	local moeda = 12401
	local t = {
		[2195] = {price = 15},
		[2493] = {price = 25},
		[2361] = {price = 30},
		[8851] = {price = 20},
		[8925] = {price = 30},
		[2640] = {price = 50},
		[2494] = {price = 100},
		[9932] = {price = 50},
		[2472] = {price = 70},
		[8931] = {price = 100}
	}
	local onBuy = function(cid, item, subType, amount, ignoreCap, inBackpacks)
	if t[item] and not doPlayerRemoveItem(cid, moeda, t[item].price) then
		selfSay("Você não tem "..t[item].price.." "..getItemName(moeda), cid)
	else
		doPlayerAddItem(cid, item)
		selfSay("Aqui está seu item!", cid)
	end
	return true
end
if(msgcontains(msg, 'trade') or msgcontains(msg, 'TRADE')) then
	for var, ret in pairs(t) do
		table.insert(shopWindow, {id = var, subType = 0, buy = ret.price, sell = 0, name = getItemName(var)})
	end
	openShopWindow(cid, shopWindow, onBuy, onSell)
	end
	return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback) 
npcHandler:addModule(FocusModule:new())