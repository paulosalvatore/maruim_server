local config = {
	-- [item_id] = {moveItem = item_id, transform = {itemid, quantidade}, type = "get ou tile", efeito = "efeito da tabela efeitos"}
	[6279] = {moveItem = 2048, transform = {6280, 1}, type = "tile"},
	[2744] = {moveItem = 1410, transform = {1414, 1}, type = "get"},
	[2745] = {moveItem = 1410, transform = {1413, 1}, type = "get"},
	[2746] = {moveItem = 1410, transform = {1412, 1}, type = "get"}
}
function onAddItem(moveItem, tileItem, position)
	local item_config = config[tileItem.itemid] or config[moveItem.itemid]
	if item_config ~= nil then
		if item_config.type == "tile" then
			if item_config.moveItem == moveItem.itemid then
				Item(tileItem.uid):transform(item_config.transform[1], item_config.transform[2])
				Item(tileItem.uid):decay()
				Item(moveItem.uid):remove(1)
			end
		elseif item_config.type == "get" then
			local tile = Tile(position)
			if #tile:getItems() == 2 then
				local tileItem = tile:getItemById(item_config.moveItem)
				if tileItem ~= nil then
					tileItem:transform(item_config.transform[1], item_config.transform[2])
					tileItem:decay()
					Item(moveItem.uid):remove(1)
					if item_config.efeito ~= nil then
						position:sendMagicEffect(efeitos[item_config.efeito])
					end
				end
			end
		end
	end
	return true
end