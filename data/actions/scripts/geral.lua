local fire_source = {1786, 1788, 1790, 1792, 1481, 1482, 1483, 1484, 6356, 6358, 6360, 6362}
local fruits = {2673, 2674, 2675, 2677, 2679, 2680, 2681, 2682, 5097, 8840, 12415}
local items = {
	-- [item_id] = {
		-- [itemEx_id] = {
			-- itensPlayer = {{id, quantidade ou {min, max}}},
			-- removerItensPlayer = {{id, quantidade}},
			-- checarQuantidade = {id, quantidade},
			-- itensGame = {{id, quantidade {min, max}, posicao}},
			-- removerItem = 0 ou 1,
			-- removerItemEx = 0 ou 1,
			-- transformar = {id, quantidade ou {min, max}},
			-- efeito = {efeito, posicao},
			-- criatura = {nome_criatura, chance}
		-- },
	-- }
	[6277] = {
		["fire_source"] = {
			itensPlayer = {{6278, 1}},
			removerItem = 1,
			efeito = {"fire"}
		},
		[6574] = {
			transformar = {8846, 1},
			efeito = {"hit"}
		},
		[2561] = {
			transformar = {8848, 1},
			efeito = {"hit"}
		},
	},
	[8846] = {
		["fire_source"] = {
			itensPlayer = {{8847, 1}},
			removerItem = 1,
			efeito = {"fire"}
		}
	},
	[8848] = {
		["fire_source"] = {
			itensPlayer = {{2561, 1}, {2687, 12}},
			efeito = {"fire"}
		}
	},
	[9112] = {
		[9114] = {
			itensPlayer = {{9113, 1}},
			removerItem = 1,
			removerItemEx = 1,
			efeito = {"hit"}
		}
	},
	[5467] = {
		[5469] = {
			removerItem = 1,
			transformar = {5513, 1},
			efeito = {"hit"}
		},
		[5470] = {
			removerItem = 1,
			transformar = {5514, 1},
			efeito = {"hit"}
		},
		[2694] = {
			removerItem = 1,
			transformar = {13939, 1},
			efeito = {"hit"}
		}
	},
	[2565] = {
		["sparkling"] = {
			[4184] = {
				itensPlayer = {{7251, 1}},
				removerItemEx = 1,
				efeito = {"hit"},
				tempo = 5*60*1000
			}
		}
	},
	[2566] = {
		[2674] = {
			itensPlayer = {{6279, 1}},
			removerItensPlayer = {{6278, 1}},
			removerItemEx = 1,
		},
		[2677] = {
			itensPlayer = {{6279, 1}},
			removerItensPlayer = {{6278, 1}},
			removerItemEx = 1,
		},
		[2679] = {
			itensPlayer = {{6279, 1}},
			removerItensPlayer = {{6278, 1}},
			removerItemEx = 1,
		},
		[2680] = {
			itensPlayer = {{6279, 1}},
			removerItensPlayer = {{6278, 1}},
			removerItemEx = 1,
		},
		["sparkling"] = {
			[7261] = {
				itensPlayer = {{7248, 1}},
				removerItemEx = 1,
				efeito = {"hit"},
				tempo = 5*60*1000
			},
			[4017] = {
				itensPlayer = {{7249, 1}},
				removerItemEx = 1,
				efeito = {"hit"},
				tempo = 5*60*1000
			},
			[2733] = {
				itensPlayer = {{7245, 1}},
				removerItemEx = 1,
				efeito = {"hit"},
				tempo = 5*60*1000
			}
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
	},
	[5865] = {
		["fruits"] = {
			itensPlayer = {{2006, 1, 21}},
			removerItensPlayer = {{2006, 1, 0}},
			removerItemEx = 1,
		},
		[8841] = {
			itensPlayer = {{2006, 1, 5}},
			removerItensPlayer = {{2006, 1, 0}},
			removerItemEx = 1,
		}
	}
}
function onUse(player, item, fromPosition, itemEx, toPosition)
	if items[item.itemid] then
		local i = items[item.itemid]
		local adicionar_evento = 0
		if	(i[itemEx.itemid]) or
			(i["default"]) or
			((i["sparkling"][Tile(toPosition):getTopTopItem():getId()] and #Tile(toPosition):getItems() == 2) and (itemEx.itemid == 8046 or itemEx.itemid == 8047)) or
			((isInArray(fire_source, itemEx.itemid)) and (i["fire_source"])) or
			((isInArray(fruits, itemEx.itemid)) and (i["fruits"])) then
			if i["default"] then
				i = i["default"]
			elseif ((i["sparkling"][Tile(toPosition):getTopTopItem():getId()] and #Tile(toPosition):getItems() == 2) and (itemEx.itemid == 8046 or itemEx.itemid == 8047)) then
				i = i["sparkling"][Tile(toPosition):getTopTopItem():getId()]
				adicionar_evento = 1
			elseif (isInArray(fire_source, itemEx.itemid)) and (i["fire_source"]) then
				i = i["fire_source"]
			elseif (isInArray(fruits, itemEx.itemid)) and (i["fruits"]) then
				i = i["fruits"]
			else
				i = i[itemEx.itemid]
			end
			if i["removerItensPlayer"] ~= nil then
				for c,v in pairs(i["removerItensPlayer"]) do
					local v3 = v[3] or -1
					if player:getItemCount(v[1], v3) < v[2] then
						return false
					end
				end
				for c,v in pairs(i["removerItensPlayer"]) do
					local v3 = v[3] or -1
					player:getItemById(v[1], v3, 0):remove(v[2])
				end
			end
			if i["removerItem"] ~= nil and i["removerItem"] == 1 and not item:remove(1) then
				return false
			end
			if i["itensPlayer"] ~= nil then
				for c,v in pairs(i["itensPlayer"]) do
					itemPlayerAdicionar = v[1]
					quantidadeItemPlayerAdicionar = v[2]
					typeItemPlayerAdicionar = v[3] or 1
					if type(quantidadeItemPlayerAdicionar) == "table" then
						quantidadeItemPlayerAdicionar = math.random(quantidadeItemPlayerAdicionar[1], quantidadeItemPlayerAdicionar[2])
					end
					player:addItem(itemPlayerAdicionar, quantidadeItemPlayerAdicionar, true, typeItemPlayerAdicionar)
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
				local transformar = itemEx
				if i["transformar"][3] ~= nil and i["transformar"][3] == "item" then
					transformar = item
				end
				transformar:transform(itemTransformar, quantidadeTransformar)
				transformar:decay()
			end
			if i["removerItemEx"] == 1 then
				itemEx:remove(1)
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
			if adicionar_evento == 1 then
				addEvent(function(posicao, item)
				Game.createItem(item, 1, posicao)
				end, i["tempo"], toPosition, itemEx.itemid)
			end
			return true
		end
	end
	return false
end