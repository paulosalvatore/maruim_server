atualizarNpcsBanco = false

frases = {
	["correio"] = {
		["greet"] = "Ol� |PLAYERNAME|. Seja bem-vindo aos correios.",
		["trade"] = "Deseja mandar algum presente?"
	}
}

comerciantes = {
	["Freenya Irin"] = { -- Vendedor de Utilidades - Civitaten
		["itens"] = {
			["c"] = {"utilidades"}
		}
	},
	["Jack"] = { -- Comprador de Produtos "Raros" de Criaturas - Maruim Island
		["itens"] = {
			["v"] = {2235, 5878, 5896, 5897, 5902, 8971, 9676, 11113, 12471}
		}
	},
	["Jane"] = { -- Comprador de Produtos "Comuns" de Criaturas - Maruim Island
		["itens"] = {
			["v"] = {2230, 2813, 2817, 3086, 3119, 8859, 10606, 10609, 11214, 12382, 12435, 12437, 12441, 12495, 13159}
		}
	},
	["Kalfafiny Niduril"] = { -- Vendedor de Utilidades - �tt�
		["itens"] = {
			["c"] = {"utilidades"}
		}
	},
	["Maurice"] = { -- Comprador de Produtos de Criaturas - Civitaten
		["itens"] = {
			["v"] = {5678, 5899, 11189}
		}
	},
	["Mood Neva"] = { -- Carteiro - Civitaten
		["itens"] = {
			["c"] = {"correio"}
		},
		["frases"] = frases["correio"]
	},
	["Phaos Thourasa"] = { -- Vendedor de Utilidades - Maruim Island
		["itens"] = {
			["c"] = {"utilidades", 2050}
		}
	},
	["Seynos Malia"] = { -- Peixeiro - Maruim Island (Parte Baixa da Ilha)
		["itens"] = {
			["c"] = {2667},
			["v"] = {2669, 7158, 7159, 7963, 13546}
		},
		["frases"] = {
			["trade"] = "Tenho diversos bons itens para aventureiros, haha, d� uma olhada!"
		}
	}
}

destinos = {
	["maruim_island"] = {
		nome = "Maruim Island",
		posicao = {x = 633, y = 939, z = 6},
		custo = 30,
		levelNecessario = 0
	},
	["mugulu"] = {
		nome = "Mugulu",
		posicao = {x = 738, y = 1800, z = 6},
		custo = 100,
		levelNecessario = 0
	},
	["civitaten_tapete"] = {
		nome = "Civitaten",
		posicao = {x = 928, y = 1900, z = 2},
		custo = 100,
		levelNecessario = 0
	},
	["civitaten_barco"] = {
		nome = "Civitaten",
		posicao = {x = 882, y = 1940, z = 6},
		custo = 60,
		levelNecessario = 0
	},
	["udecoat"] = {
		nome = "Udecoat",
		posicao = {x = 921, y = 1774, z = 8},
		custo = 100,
		levelNecessario = 0
	},
	["otto"] = {
		nome = "�tt�",
		posicao = {x = 834, y = 1258, z = 6},
		custo = 60,
		levelNecessario = 0,
		palavrasChave = {"otto", "�tt�"}
	},
	["pundera"] = {
		nome = "Pundera",
		posicao = {x = 875, y = 1523, z = 7},
		custo = 100,
		levelNecessario = 0
	},
	["hyalakur_tapete"] = {
		nome = "Hyalakur",
		posicao = {x = 1084, y = 1592, z = 7},
		custo = 100,
		levelNecessario = 0
	},
	["hyalakur_barco"] = {
		nome = "Hyalakur",
		posicao = {x = 1102, y = 1512, z = 6},
		custo = 60,
		levelNecessario = 0
	},
	["lorn"] = {
		nome = "Lorn",
		posicao = {x = 1329, y = 1713, z = 6},
		custo = 100,
		levelNecessario = 0
	},
	["kyo"] = {
		nome = "Kyo",
		posicao = {x = 1397, y = 1871, z = 6},
		custo = 100,
		levelNecessario = 0
	},
	["algatar"] = {
		nome = "Algatar",
		posicao = {x = 1139, y = 1996, z = 6},
		custo = 100,
		levelNecessario = 0
	},
	["khazad_dum"] = {
		nome = "Khazad-d�m",
		posicao = {x = 1513, y = 1753, z = 8},
		custo = 100,
		levelNecessario = 0,
		palavrasChave = {"khazad d�m", "khazad dum"}
	},
	["dragon_mugulu"] = {
		nome = "Mugulu",
		posicao = {x = 789, y = 1739, z = 7},
		custo = 100,
		levelNecessario = 0
	},
	["mugulu_dragon"] = {
		nome = "Ilha dos Drag�es",
		posicao = {x = 704, y = 1241, z = 7},
		custo = 100,
		levelNecessario = 0,
		palavrasChave = {"ilha dos dragoes"}
	},
	["maruim_island_parte_alta_baixa"] = {
		nome = "Parte Baixa da Ilha",
		posicao = {x = 601, y = 1085, z = 7},
		custo = 10,
		levelNecessario = 0
	},
	["maruim_island_parte_baixa_alta"] = {
		nome = "Parte Alta da Ilha",
		posicao = {x = 587, y = 1018, z = 7},
		custo = 10,
		levelNecessario = 0
	}
}

barqueiros = {
	["maruim_island"] = {
		destinos = {
			"civitaten_barco",
			"hyalakur_barco",
			"otto"
		},
		tipoViagem = "navio"
	},
	["algatar"] = {
		destinos = {
			"kyo",
			"hyalakur_barco",
			"civitaten_barco",
			"mugulu"
		},
		tipoViagem = "navio"
	},
	["mugulu"] = {
		destinos = {
			"otto",
			"algatar",
			"civitaten_barco"
		},
		tipoViagem = "navio"
	},
	["kyo"] = {
		destinos = {
			"algatar",
			"hyalakur_barco",
			"civitaten_barco"
		},
		tipoViagem = "navio"
	},
	["otto"] = {
		destinos = {
			"mugulu",
			"hyalakur_barco",
			"civitaten_barco",
			"maruim_island"
		},
		tipoViagem = "navio"
	},
	["hyalakur_barco"] = {
		destinos = {
			"civitaten_barco",
			"otto",
			"algatar",
			"kyo",
			"maruim_island"
		},
		tipoViagem = "navio"
	},
	["civitaten_barco"] = {
		destinos = {
			"hyalakur_barco",
			"mugulu",
			"algatar",
			"otto",
			"kyo",
			"maruim_island"
		},
		tipoViagem = "navio"
	},
	["pundera"] = {
		destinos = {
			"udecoat",
			"civitaten_tapete",
			"hyalakur_tapete"
		},
		tipoViagem = "tapete"
	},
	["udecoat"] = {
		destinos = {
			"pundera",
			"civitaten_tapete",
			"hyalakur_tapete",
			"lorn"
		},
		tipoViagem = "tapete"
	},
	["hyalakur_tapete"] = {
		destinos = {
			"civitaten_tapete",
			"pundera",
			"udecoat",
			"lorn",
			"khazad_dum"
		},
		tipoViagem = "tapete"
	},
	["khazad_dum_tapete"] = {
		destinos = {
			"lorn",
			"hyalakur_tapete"
		},
		tipoViagem = "tapete"
	},
	["civitaten_tapete"] = {
		destinos = {
			"hyalakur_tapete",
			"udecoat",
			"lorn",
			"pundera"
		},
		tipoViagem = "tapete"
	},
	["lorn"] = {
		destinos = {
			"civitaten_tapete",
			"udecoat",
			"hyalakur_tapete",
			"khazad_dum"
		},
		tipoViagem = "tapete"
	},
	["maruim_island_parte_alta"] = {
		destinos = {"maruim_island_parte_alta_baixa"},
		tipoViagem = "barco"
	},
	["maruim_island_parte_baixa"] = {
		destinos = {"maruim_island_parte_baixa_alta"},
		tipoViagem = "barco"
	},
	["mugulu_dragon"] = {
		destinos = {"mugulu_dragon"},
		tipoViagem = "barco"
	},
	["dragon_mugulu"] = {
		destinos = {"dragon_mugulu"},
		tipoViagem = "barco"
	}
}

relacionarBarqueiros = {
	["Palter Dilventan"] = "maruim_island",
	["Eteringe Genon"] = "algatar",
	["Ghariva Titodimoon"] = "mugulu",
	["Zairda Soron"] = "kyo",
	["Akheria Sudayth"] = "otto",
	["Mado Arbells"] = "hyalakur_barco",
	["Pewarthor Daellits"] = "civitaten_barco",
	["Zerillion Darica"] = "pundera",
	["Haless Amonius"] = "udecoat",
	["Vuwulo Retulon"] = "hyalakur_tapete",
	["Airotear Greli"] = "khazad_dum_tapete",
	["Pheanak Livertin"] = "civitaten_tapete",
	["Yendsos Anian"] = "lorn",
	["Rafter Demarm"] = "maruim_island_parte_alta",
	["Rafter Bous"] = "maruim_island_parte_baixa",
	["Rafter Smar"] = "mugulu_dragon",
	["Rafter Pras"] = "dragon_mugulu"
}

tempoBlessWoodenStake = 24*60*60

function atualizarNpcBanco(npc, tipo, informacoes)
	local npcNome = npc:getName()
	local npcId
	local resultId = db.storeQuery("SELECT `id` FROM `z_npcs` WHERE `nome` = " .. db.escapeString(npcNome))

	if resultId == false then
		db.query("INSERT INTO `z_npcs` (`nome`) VALUES (" .. db.escapeString(npcNome) .. ")")
		npcId = db.lastInsertId()
		print(npcNome .. " -> foi adicionado ao banco de dados.")
	else
		npcId = result.getDataInt(resultId, "id")
	end

	if tipo then
		if tipo == "comerciante" then
			local itemId = informacoes[1]
			local itemValor = informacoes[2]
			local itemSubTipo = informacoes[3]
			local acao = informacoes[4]
			local resultItemId = db.storeQuery("SELECT `id` FROM `z_npcs_itens` WHERE (`npc` = " .. db.escapeString(npcId) .. " and `item` = " .. db.escapeString(itemId) .. " and `acao` = " .. db.escapeString(acao) .. ")")
			if resultItemId == false then
				db.query("INSERT INTO `z_npcs_itens` (`npc`, `item`, `valor`, `subtipo`, `acao`) VALUES (" .. db.escapeString(npcId) .. ", " .. db.escapeString(itemId) .. ", " .. db.escapeString(itemValor) .. ", " .. db.escapeString(itemSubTipo) .. ", " .. db.escapeString(acao) .. ")")
			else
				local dbItemId = result.getDataInt(resultId, "id")
				db.query("UPDATE `z_npcs_itens` SET `item` = " .. db.escapeString(itemId) .. ", `valor` = " .. db.escapeString(itemValor) .. ", `subtipo` = " .. db.escapeString(itemSubTipo) .. ", `acao` = " .. db.escapeString(acao) .. " WHERE `id` = " .. db.escapeString(dbItemId))
			end
		end
	end
	result.free(resultId)
end

function atualizarNpcs()
	db.query("TRUNCATE TABLE `z_npcs_posicoes`")
	local npcs = {}
	local resultId = db.storeQuery("SELECT `id`, `nome` FROM `z_npcs`")

	if resultId ~= false then
		local proximoResultado = true
		while proximoResultado do
			local npcId = result.getDataInt(resultId, "id")
			local npcNome = result.getDataString(resultId, "nome")
			table.insert(npcs, {npcId, npcNome})
			if not result.next(resultId) then
				proximoResultado = false
			end
		end
		result.free(resultId)
	end

	for i = 1, #npcs do
		local npcId = npcs[i][1]
		local npcNome = npcs[i][2]
		local npcPosicoes = {}

		local npc = Npc(npcNome)
		while npc ~= nil do
			local outfit = npc:getOutfit()
			local posicao = npc:getPosition()
			db.query("UPDATE `z_npcs` SET `lookBody` = " .. db.escapeString(outfit.lookBody) .. ", `lookFeet` = " .. db.escapeString(outfit.lookFeet) .. ", `lookHead` = " .. db.escapeString(outfit.lookHead) .. ", `lookLegs` = " .. db.escapeString(outfit.lookLegs) .. ", `lookType` = " .. db.escapeString(outfit.lookType) .. ", `lookAddons` = " .. db.escapeString(outfit.lookAddons) .. ", `lookMount` = " .. db.escapeString(outfit.lookMount) .. "  WHERE `id` = " .. db.escapeString(npcId))
			db.query("INSERT INTO `z_npcs_posicoes` (`npc`, `posx`, `posy`, `posz`) VALUES (" .. db.escapeString(npcId) .. ", " .. db.escapeString(posicao.x) .. ", " .. db.escapeString(posicao.y) .. ", " .. db.escapeString(posicao.z) .. ")")
			print(npcNome .. " -> atualizado com sucesso.")
			if npcNome ~= "Jefrey" then
				table.insert(npcPosicoes, posicao)
				npc:remove(1)
				npc = Npc(npcNome)
			else
				npc = nil
			end
		end

		for i = 1, #npcPosicoes do
			local npc = Game.createNpc(npcNome, npcPosicoes[i])
			npc:setMasterPos(npcPosicoes[i])
		end
	end
end

if atualizarNpcsBanco then
	db.query("TRUNCATE TABLE `z_npcs`")
	db.query("TRUNCATE TABLE `z_npcs_itens`")
end
