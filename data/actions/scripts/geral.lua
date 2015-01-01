local efeitos = {
	["fire"] = CONST_ME_HITBYFIRE,
	["hit"] = CONST_ME_BLOCKHIT
}
local fire_source = {1786, 1788, 1790, 1792, 1481, 1482, 1483, 1484, 6356, 6358, 6360, 6362}
local items = {
	-- [item_id] = {
		-- [itemEx_id] = {
			-- itensPlayer = {{id, quantidade ou {min, max}}},
			-- itensGame = {{id, quantidade {min, max}, posicao}},
			-- removerItem = id,
			-- removerItemEx = id,
			-- transformar = {id, quantidade ou {min, max}},
			-- efeito = {efeito, posicao},
			-- criatura = {nome_criatura, chance}
		-- },
	-- }
	[6277] = {
		["fire_source"] = {
			itensPlayer = {{6278, 1}},
			itensGame = {},
			removerItem = 1,
			removerItemEx = 0,
			transformar = {},
			efeito = {"fire"},
			criatura = {}
		},
		[6574] = {
			itensPlayer = {},
			itensGame = {},
			removerItem = 0,
			removerItemEx = 0,
			transformar = {8846, 1},
			efeito = {"hit"},
			criatura = {}
		},
		[2561] = {
			itensPlayer = {},
			itensGame = {},
			removerItem = 0,
			removerItemEx = 0,
			transformar = {8848, 1},
			efeito = {"hit"},
			criatura = {}
		},
	},
	[8846] = {
		["fire_source"] = {
			itensPlayer = {{8847, 1}},
			itensGame = {},
			removerItem = 1,
			removerItemEx = 0,
			transformar = {},
			efeito = {"fire"},
			criatura = {}
		}
	},
	[8848] = {
		["fire_source"] = {
			itensPlayer = {{2561, 1}, {2687, 12}},
			itensGame = {},
			removerItem = 0,
			removerItemEx = 0,
			transformar = {},
			efeito = {"fire"},
			criatura = {}
		}
	},
	[9112] = {
		[9114] = {
			itensPlayer = {{9113, 1}},
			itensGame = {},
			removerItem = 1,
			removerItemEx = 1,
			transformar = {},
			efeito = {"hit"},
			criatura = {}
		}
	},
	[5467] = {
		[5469] = {
			itensPlayer = {},
			itensGame = {},
			removerItem = 1,
			removerItemEx = 0,
			transformar = {5513, 1},
			efeito = {"hit"},
			criatura = {}
		},
		[5470] = {
			itensPlayer = {},
			itensGame = {},
			removerItem = 1,
			removerItemEx = 0,
			transformar = {5514, 1},
			efeito = {"hit"},
			criatura = {}
		},
		[2694] = {
			itensPlayer = {},
			itensGame = {},
			removerItem = 1,
			removerItemEx = 0,
			transformar = {13939, 1},
			efeito = {"hit"},
			criatura = {}
		}
	},
	[2566] = {
		[2674] = {
			itensPlayer = {{6279, 1}},
			removerItensPlayer = {{6278, 1}},
			checarQuantidade = {6278, 1},
			removerItemEx = 1,
		},
		[2677] = {
			itensPlayer = {{6279, 1}},
			removerItensPlayer = {{6278, 1}},
			checarQuantidade = {6278, 1},
			removerItemEx = 1,
		},
		[2679] = {
			itensPlayer = {{6279, 1}},
			removerItensPlayer = {{6278, 1}},
			checarQuantidade = {6278, 1},
			removerItemEx = 1,
		},
		[2680] = {
			itensPlayer = {{6279, 1}},
			removerItensPlayer = {{6278, 1}},
			checarQuantidade = {6278, 1},
			removerItemEx = 1,
		}
	},
	[4006] = {
		["default"] = {
			itensPlayer = {{2675, {1, 8}}},
			transformar = {4008, 1},
			efeito = {"hit"},
			criatura = {"Squirrel", 1000}
		}
	},
	[5157] = {
		["default"] = {
			itensPlayer = {{5097, {1, 8}}},
			transformar = {5156, 1},
			efeito = {"hit"},
			criatura = {"Squirrel", 1000}
		}
	},
	[12014] = {
		["default"] = {
			transformar = {12016, 1, "item"}
		}
	},
	[12015] = {
		["default"] = {
			transformar = {12017, 1, "item"}
		}
	},
	[12016] = {
		["default"] = {
			transformar = {12014, 1, "item"}
		}
	},
	[12017] = {
		["default"] = {
			transformar = {12015, 1, "item"}
		}
	}
}
function onUse(player, item, fromPosition, itemEx, toPosition)
	if items[item.itemid] then
		i = items[item.itemid]
		if((isInArray(fire_source, itemEx.itemid)) and (i["fire_source"])) or (i[itemEx.itemid]) or (i["default"]) then
			if i["default"] then
				i = i["default"]
			elseif (isInArray(fire_source, itemEx.itemid)) and (i["fire_source"]) then
				i = i["fire_source"]
			else
				i = i[itemEx.itemid]
			end
			if type(i["checarQuantidade"]) == "table" and player:getItemCount(i["checarQuantidade"][1]) < i["checarQuantidade"][2] then
				return false
			end
			if i["removerItem"] ~= nil and i["removerItem"] == 1 then
				Item(item.uid):remove(1)
			end
			if i["itensPlayer"] ~= nil then
				for c,v in pairs(i["itensPlayer"]) do
					itemPlayerAdicionar  = v[1]
					quantidadePlayerAdicionar  = v[2]
					if type(quantidadePlayerAdicionar) == "table" then
						quantidadePlayerAdicionar = math.random(quantidadePlayerAdicionar[1], quantidadePlayerAdicionar[2])
					end
					player:addItem(itemPlayerAdicionar, quantidadePlayerAdicionar)
				end
			end
			if i["removerItensPlayer"] ~= nil then
				for c,v in pairs(i["removerItensPlayer"]) do
					player:getItemById(v[1], 0):remove(v[2])
				end
			end
			if i["itensGame"] ~= nil then
				for c,v in pairs(i["itensGame"]) do
					local itemGameAdicionar = v[1]
					local quantidadeGameAdicionar = v[2]
					local posicaoGameAdicionar = nil
					if type(quantidadeGameAdicionar) == "table" then
						quantidadeGameAdicionar = math.random(quantidadeGameAdicionar[1], quantidadeGameAdicionar[2])
					end
					if (v[3]) and (v[3] ~= "to") then
						if v[3] == "from" then
							posicaoGameAdicionar = fromPosition
						elseif v[3] == "player" then
							posicaoGameAdicionar = getPlayerPosition(cid)
						end
					end
					if posicaoGameAdicionar == nil then
						posicaoGameAdicionar = toPosition
					end
					Game.createItem(itemGameAdicionar, quantidadeGameAdicionar, posicaoGameAdicionar)
				end
			end
			if i["transformar"] ~= nil and table.getn(i["transformar"]) >= 2 then
				local itemTransformar = i["transformar"][1]
				local quantidadeTransformar = i["transformar"][2]
				if type(quantidadeTransformar) == "table" then
					quantidadeTransformar = math.random(quantidadeTransformar[1], quantidadeTransformar[2])
				end
				local transformar = Item(itemEx.uid)
				if i["transformar"][3] ~= nil and i["transformar"][3] == "item" then
					transformar = Item(item.uid)
				end
				transformar:transform(itemTransformar, quantidadeTransformar)
				transformar:decay()
			end
			if i["removerItemEx"] == 1 then
				Item(itemEx.uid):remove(1)
			end
			if i["efeito"] ~= nil and table.getn(i["efeito"]) > 0 then
				local efeito = i["efeito"]
				local posicao_efeito = nil
				if (efeito[2]) and (efeito[2] ~= "to") then
					if efeito[2] == "from" then
						posicao_efeito = fromPosition
					elseif efeito[2] == "player" then
						posicao_efeito = getPlayerPosition(cid)
					end
				end
				if posicao_efeito == nil then
					posicao_efeito = toPosition
				end
				posicao_efeito:sendMagicEffect(efeitos[efeito[1]])
			end
			if i["criatura"] ~= nil and table.getn(i["criatura"]) > 0 then
				local chance = 10000
				if (i["criatura"][2]) and (type(i["criatura"][2]) == "number") and (i["criatura"][2] >= 1) and (i["criatura"][2] <= 10000) then
					chance = i["criatura"][2]
				end
				if math.random(1, 10000) <= chance then
					Game.createMonster(i["criatura"][1], toPosition)
				end
			end
			return true
		end
	end
	return false
end