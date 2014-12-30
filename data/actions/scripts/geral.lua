local efeitos = {
	["fire"] = CONST_ME_HITBYFIRE,
	["hit"] = CONST_ME_BLOCKHIT
}

local fire_source = {1786, 1788, 1790, 1792, 1481, 1482, 1483, 1484, 6356, 6358, 6360, 6362}
local items = {
	-- [item_id] = {
		-- [itemEx_id] = {
			-- itensPlayer = {{id, quantidade {min, max}}},
			-- itensGame = {{id, quantidade {min, max}, posicao}},
			-- removerItem = id,
			-- removerItemEx = id,
			-- transformar = {id, quantidade {min, max}},
			-- efeito = {efeito, posicao},
			-- criatura = {nome_criatura, chance}
		-- },
	-- }
	[6277] = {
		["fire_source"] = {
			itensPlayer = {{6278, 1}},
			itensGame = {},
			removerItem = 0,
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
			removerItem = 0,
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
			removerItem = 0,
			removerItemEx = 1,
			transformar = {},
			efeito = {"hit"},
			criatura = {}
		}
	}
}
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(items[item.itemid]) then
		i = items[item.itemid]
		if(((isInArray(fire_source, itemEx.itemid)) and (i["fire_source"])) or (i[itemEx.itemid])) then
			if((i["default"])) then
				i = i["default"]
			elseif((isInArray(fire_source, itemEx.itemid)) and (i["fire_source"])) then
				i = i["fire_source"]
			else
				i = i[itemEx.itemid]
			end
			if(i["removerItem"] == 1) then
				Item(item.uid):remove(1)
			end
			for c,v in pairs(i["itensPlayer"]) do
				itemPlayerAdicionar  = v[1]
				quantidadePlayerAdicionar  = v[2]
				if(type(quantidadePlayerAdicionar) == "table") then
					quantidadePlayerAdicionar = math.random(quantidadePlayerAdicionar[1], quantidadePlayerAdicionar[2])
				end
				Player(cid):addItem(itemPlayerAdicionar, quantidadePlayerAdicionar)
			end
			for c,v in pairs(i["itensGame"]) do
				local itemGameAdicionar = v[1]
				local quantidadeGameAdicionar = v[2]
				local posicaoGameAdicionar = nil
				if(type(quantidadeGameAdicionar) == "table") then
					quantidadeGameAdicionar = math.random(quantidadeGameAdicionar[1], quantidadeGameAdicionar[2])
				end
				if((v[3]) and (v[3] ~= "to")) then
					if(v[3] == "from") then
						posicaoGameAdicionar = fromPosition
					elseif(v[3] == "player") then
						posicaoGameAdicionar = getPlayerPosition(cid)
					end
				end
				if(posicaoGameAdicionar == nil) then
					posicaoGameAdicionar = toPosition
				end
				Game.createItem(itemGameAdicionar, quantidadeGameAdicionar, posicaoGameAdicionar)
			end
			if(table.getn(i["transformar"]) == 2) then
				local itemTransformar = i["transformar"][1]
				local quantidadeTransformar = i["transformar"][2]
				if(type(quantidadeTransformar) == "table") then
					quantidadeTransformar = math.random(quantidadeTransformar[1], quantidadeTransformar[2])
				end
				Item(itemEx.uid):transform(itemTransformar, quantidadeTransformar)
			end
			if(i["removerItemEx"] == 1) then
				Item(itemEx.uid):remove(1)
			end
			if(table.getn(i["efeito"]) > 0) then
				local efeito = i["efeito"]
				local posicao_efeito = nil
				if((efeito[2]) and (efeito[2] ~= "to")) then
					if(efeito[2] == "from") then
						posicao_efeito = fromPosition
					elseif(efeito[2] == "player") then
						posicao_efeito = getPlayerPosition(cid)
					end
				end
				if(posicao_efeito == nil) then
					posicao_efeito = toPosition
				end
				posicao_efeito:sendMagicEffect(efeitos[efeito[1]])
			end
			if(table.getn(i["criatura"]) > 0) then
				local chance = 100
				if((i["criatura"][2]) and (type(i["criatura"][2]) == "number") and (i["criatura"][2] >= 1) and (i["criatura"][2] <= 100)) then
					chance = i["criatura"][2]
				end
				if(math.random(1, 100) <= chance) then
					Game.createMonster(i["criatura"][1], toPosition)
				end
			end
			return true
		end
	end
	return false
end