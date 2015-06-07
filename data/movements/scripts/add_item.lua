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
	},
	[21430] = {
		[21247] = {
			transform = {21431, 1},
			transformMoveItem = {21446, 1},
			efeito = "fire",
			chanceSucesso = 9000
		}
	}
}
function onAddItem(moveItem, tileItem, position)
	if config[tileItem.itemid][moveItem.itemid] ~= nil then
		local i = config[tileItem.itemid][moveItem.itemid]
		local chance = math.random(1, 10000)
		local chanceSucesso = 10000
		if i.chanceSucesso ~= nil then
			chanceSucesso = i.chanceSucesso
		end
		if chance <= chanceSucesso then
			if i.transformMoveItem ~= nil then
				Game.createItem(i.transformMoveItem[1], i.transformMoveItem[2], position)
			end
		end
		Item(moveItem.uid):remove(1)
		Item(tileItem.uid):transform(i.transform[1], i.transform[2])
		Item(tileItem.uid):decay()
		if i.efeito ~= nil then
			position:sendMagicEffect(efeitos[i.efeito])
		end
	end
	return true
end