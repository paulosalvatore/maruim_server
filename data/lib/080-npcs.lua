destinos = {
	["ilha_inicial"] = {
		nome = "Ilha Inicial",
		posicao = {x = 633, y = 939, z = 6},
		custo = 100,
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
		custo = 100,
		levelNecessario = 0
	},
	["udecoat"] = {
		nome = "Udecoat",
		posicao = {x = 921, y = 1774, z = 8},
		custo = 100,
		levelNecessario = 0
	},
	["otto"] = {
		nome = "Ôttô",
		posicao = {x = 834, y = 1258, z = 6},
		custo = 100,
		levelNecessario = 0,
		palavrasChave = {"otto", "ôttô"}
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
		custo = 100,
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
		nome = "Khazad-dûm",
		posicao = {x = 1513, y = 1753, z = 8},
		custo = 100,
		levelNecessario = 0,
		palavrasChave = {"khazad dûm", "khazad dum"}
	},
	["dragon_mugulu"] = {
		nome = "Mugulu",
		posicao = {x = 744, y = 1688, z = 7},
		custo = 100,
		levelNecessario = 0
	},
	["mugulu_dragon"] = {
		nome = "Ilha dos Dragões",
		posicao = {x = 704, y = 1241, z = 7},
		custo = 100,
		levelNecessario = 0
	},
	["ilha_inicial_parte_alta_baixa"] = {
		nome = "Parte Baixa da Ilha",
		posicao = {x = 601, y = 1085, z = 7},
		custo = 100,
		levelNecessario = 0
	},
	["ilha_inicial_parte_baixa_alta"] = {
		nome = "Parte Alta da Ilha",
		posicao = {x = 587, y = 1018, z = 7},
		custo = 100,
		levelNecessario = 0
	}
}
barqueiros = {
	["Palter Dilventan"] = {
		destinos = {
			"civitaten_barco",
			"hyalakur_barco",
			"otto"
		},
		tipoViagem = "navio"
	},
	["Eteringe Genon"] = {
		destinos = {
			"kyo",
			"hyalakur_barco",
			"civitaten_barco",
			"mugulu"
		},
		tipoViagem = "navio"
	},
	["Ghariva Titodimoon"] = {
		destinos = {
			"otto",
			"algatar",
			"civitaten_barco"
		},
		tipoViagem = "navio"
	},
	["Zairda Soron"] = {
		destinos = {
			"algatar",
			"hyalakur_barco",
			"civitaten_barco"
		},
		tipoViagem = "navio"
	},
	["Akheria Sudayth"] = {
		destinos = {
			"mugulu",
			"hyalakur_barco",
			"ilha_inicial"
		},
		tipoViagem = "navio"
	},
	["Mado Arbells"] = {
		destinos = {
			"otto",
			"algatar",
			"kyo",
			"ilha_inicial"
		},
		tipoViagem = "navio"
	},
	["Pewarthor Daellits"] = {
		destinos = {
			"mugulu",
			"algatar",
			"kyo",
			"ilha_inicial"
		},
		tipoViagem = "navio"
	},
	["Zerillion Darica"] = {
		destinos = {
			"udecoat",
			"civitaten_tapete",
			"hyalakur_tapete"
		},
		tipoViagem = "tapete"
	},
	["Haless Amonius"] = {
		destinos = {
			"pundera",
			"civitaten_tapete",
			"hyalakur_tapete",
			"lorn"
		},
		tipoViagem = "tapete"
	},
	["Vuwulo Retulon"] = {
		destinos = {
			"pundera",
			"udecoat",
			"lorn",
			"khazad_dum"
		},
		tipoViagem = "tapete"
	},
	["Airotear Greli"] = {
		destinos = {
			"lorn",
			"hyalakur_tapete"
		},
		tipoViagem = "tapete"
	},
	["Pheanak Livertin"] = {
		destinos = {
			"udecoat",
			"lorn",
			"pundera"
		},
		tipoViagem = "tapete"
	},
	["Yendsos Anian"] = {
		destinos = {
			"civitaten_tapete",
			"lorn",
			"udecoat",
			"hyalakur_tapete"
		},
		tipoViagem = "tapete"
	},
	["Rafter Demarm"] = {
		destinos = {"ilha_inicial_parte_alta_baixa"},
		tipoViagem = "barco"
	},
	["Rafter Bous"] = {
		destinos = {"ilha_inicial_parte_baixa_alta"},
		tipoViagem = "barco"
	}
}
tempoBlessWoodenStake = 24*60*60
atualizarNpcs = false
local limparNpcs = false
if limparNpcs then
	db.query("TRUNCATE TABLE `z_npcs`")
	db.query("TRUNCATE TABLE `z_npcs_itens`")
end
function atualizarNpcBanco(informacoes)
	local npc = informacoes[1]
	local itemId = informacoes[2]
	local itemValor = informacoes[3]
	local itemSubTipo = informacoes[4]
	local acao = informacoes[5]
	local npcNome = npc:getName()
	local npcId
	local resultId = db.storeQuery("SELECT `id` FROM `z_npcs` WHERE `nome` = " .. db.escapeString(npcNome) .. "")
	if resultId == false then
		db.query("INSERT INTO `z_npcs` (`nome`) VALUES (" .. db.escapeString(npcNome) .. ")")
		npcId = db.lastInsertId()
	else
		npcId = result.getDataInt(resultId, "id")
	end
	local resultItemId = db.storeQuery("SELECT `id` FROM `z_npcs_itens` WHERE (`npc` = " .. db.escapeString(npcId) .. " and `item` = " .. db.escapeString(itemId) .. ")")
	if resultItemId == false then
		db.query("INSERT INTO `z_npcs_itens` (`npc`, `item`, `valor`, `subtipo`, `acao`) VALUES (" .. db.escapeString(npcId) .. ", " .. db.escapeString(itemId) .. ", " .. db.escapeString(itemValor) .. ", " .. db.escapeString(itemSubTipo) .. ", " .. db.escapeString(acao) .. ")")
	else
		local dbItemId = result.getDataInt(resultId, "id")
		db.query("UPDATE `z_npcs_itens` SET `item` = " .. db.escapeString(itemId) .. ", `valor` = " .. db.escapeString(itemValor) .. ", `subtipo` = " .. db.escapeString(itemSubTipo) .. ", `acao` = " .. db.escapeString(acao) .. " WHERE `id` = " .. db.escapeString(dbItemId) .. "")
	end
	result.free(resultId)
end
