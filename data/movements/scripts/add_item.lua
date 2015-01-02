local config = {
	-- [id] = {
		-- [id] = {
			-- transform = {id, quantidade},
			-- efeito = efeito
		-- }
	-- },
	[6279] = {
		[2048] = {
			transform = {6280, 1}
		}
	},
	[1410] = {
		[2744] = {
			transform = {1414, 1}
		},
		[2745] = {
			transform = {1413, 1}
		},
		[2746] = {
			transform = {1412, 1}
		}
	},
	[2096] = {
		[2048] = {
			transform = {2097, 1}
		}
	},
	[2229] = {
		[2047] = {
			transform = {5813, 1},
			efeito = "hit"
		},
		[2048] = {
			transform = {5812, 1},
			efeito = "hit"
		}
	}
}
function onAddItem(moveItem, tileItem, position)
	local itemConfig = config[tileItem.itemid][moveItem.itemid]
	if itemConfig ~= nil then
		Item(moveItem.uid):remove(1)
		Item(tileItem.uid):transform(itemConfig.transform[1], itemConfig.transform[2])
		Item(tileItem.uid):decay()
		if itemConfig.efeito ~= nil then
			position:sendMagicEffect(efeitos[itemConfig.efeito])
		end
	end
	return true
end