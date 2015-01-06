local breakChance = 60
local rustyItems = {
    [9808] = {2464, 2483, {2465, 50}, {2463, 30}},
    [9809] = {2464, 2483, 2465, {2463, 50}, {2476, 30}, {8891, 20}, {2487, 10}},
    [9810] = {2464, 2483, 2465, 2463, 2476, {8891, 40}, {2487, 20}, {2466, 3}},
    [9811] = {2468, 2648, 2478, {2647, 40}, {2477, 20}},
    [9812] = {2468, 2648, 2478, {2647, 40}, {2477, 20}, {2488, 10}},
    [9813] = {2478, 2647, {2477, 40}, {2488, 20}, {2470, 3}}
}
function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	if rustyItems[itemEx.itemid] ~= nil then
		local broke = 0
		local novoItem = 0
		if math.random(100) <= breakChance then
			broke = 1
		else
			local rustyItem = rustyItems[itemEx.itemid][math.random(#rustyItems[itemEx.itemid])]
			if type(rustyItem) == "table" then
				if math.random(100) <= rustyItem[2] then
					novoItem = rustyItem[1]
				else
					broke = 1
				end
			else
				novoItem = rustyItem
			end
		end
		if broke == 1 then
			itemEx:remove(1)
			player:sendTextMessage(MESSAGE_INFO_DESCR, "You broke it.")
			toPosition:sendMagicEffect(CONST_ME_POFF)
		else
			itemEx:transform(novoItem)
			player:sendTextMessage(MESSAGE_INFO_DESCR, "You removed the rust, revealing a "..getItemName(novoItem))
			toPosition:sendMagicEffect(CONST_ME_BLOCKHIT)
		end
		item:remove(1)
		return true
	end
	return false
end