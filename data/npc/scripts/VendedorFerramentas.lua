local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)                  npcHandler:onCreatureAppear(cid)                        end
function onCreatureDisappear(cid)               npcHandler:onCreatureDisappear(cid)                     end
function onCreatureSay(cid, type, msg)          npcHandler:onCreatureSay(cid, type, msg)                end
function onThink()                              npcHandler:onThink()                                    end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	elseif isInArray(SHOP_TRADEREQUEST, msg) then
		local items = {
			{name = "war hammer", id = 2391, buy = 1},
			{name = "thunder hammer", id = 2421, buy = 1},
			{name = "hammer of prophecy", id = 7450, buy = 1, sell = 1}
		}
		openShopWindow(cid, items,
			function(cid, itemid, subType, amount, ignoreCap, inBackpacks)
				customCallbackOnBuy(cid, itemid, subType, amount, ignoreCap, inBackpacks, items, false)
			end,
			function(cid, itemid, subType, amount, ignoreCap, inBackpacks)
				customCallbackOnSell(cid, itemid, subType, amount, ignoreCap, inBackpacks, items)
			end
		)
		npcHandler:say(NpcHandler.messages.MESSAGE_SENDTRADE, cid)
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())