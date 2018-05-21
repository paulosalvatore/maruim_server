local fire_source = {1786, 1788, 1790, 1792, 1481, 1482, 1483, 1484, 6356, 6358, 6360, 6362}
local fruits = {2673, 2674, 2675, 2677, 2679, 2680, 2681, 2682, 5097, 8840, 12415}
local ice_shrine = {7508, 7509, 7510, 7511}
local fire_shrine = {7504, 7505, 7506, 7507}
local earth_shrine = {7516, 7517, 7518, 7519}
local energy_shrine = {7512, 7513, 7514, 7515}
local ferro = {5866, 5868}
local carvao = {8748, 8749, 8750, 8751}
local config = {
	-- [item_id ou "action" ou "unique"] = {
		-- [target_id ou "fire_source" ou "fruits" ou "sparkling" ou "default"] = {
			-- itensPlayer = {{id, quantidade ou {min, max}}},
			-- removerItensPlayer = {{id, quantidade}},
			-- transformarAleatorio = {{id, quantidade, chance}},
			-- itensGame = {{id, quantidade {min, max}, posicao}},
			-- removerItem = 0 ou 1,
			-- removerTarget = 0 ou 1,
			-- transformar = {id, quantidade ou {min, max}},
			-- efeito = {efeito, posicao},
			-- criatura = {nome_criatura, chance}
			-- tempo = milissegundos,
			-- chanceSucesso = 1% = 100,
			-- chanceNeutra = 1% = 100,
			-- profissao = "nome da profissão",
			-- sons = {"som"},
			-- checarPz = true
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
			removerItem = 1,
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
			removerTarget = 1,
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
				removerTarget = 1,
				efeito = {"hit"},
				tempo = 5*60*1000
			},
			[8573] = {
				itensPlayer = {{7247, 1}},
				removerTarget = 1,
				efeito = {"hit"},
				tempo = 5*60*1000
			}
		}
	},
	[2566] = {
		[2674] = {
			itensPlayer = {{6279, 1}},
			removerItensPlayer = {{6278, 1}},
			removerTarget = 1,
		},
		[2677] = {
			itensPlayer = {{6279, 1}},
			removerItensPlayer = {{6278, 1}},
			removerTarget = 1,
		},
		[2679] = {
			itensPlayer = {{6279, 1}},
			removerItensPlayer = {{6278, 1}},
			removerTarget = 1,
		},
		[2680] = {
			itensPlayer = {{6279, 1}},
			removerItensPlayer = {{6278, 1}},
			removerTarget = 1,
		},
		[2683] = {
			transformar = {2096, 1},
			efeito = {"hit"}
		},
		["sparkling"] = {
			[7261] = {
				itensPlayer = {{7248, 1}},
				removerTarget = 1,
				efeito = {"hit"},
				tempo = 5*60*1000,
				chanceSucesso = 2000,
				chanceNeutra = 4000,
				profissao = "alquimista"
			},
			[4017] = {
				itensPlayer = {{7249, 1}},
				removerTarget = 1,
				efeito = {"hit"},
				tempo = 5*60*1000,
				chanceSucesso = 2000,
				chanceNeutra = 4000,
				profissao = "alquimista"
			},
			[2733] = {
				itensPlayer = {{7245, 1}},
				removerTarget = 1,
				efeito = {"hit"},
				tempo = 5*60*1000,
				chanceSucesso = 2000,
				chanceNeutra = 4000,
				profissao = "alquimista"
			},
			[2720] = {
				itensPlayer = {{2798, 1}},
				removerTarget = 1,
				efeito = {"hit"},
				tempo = 5*60*1000,
				chanceSucesso = 2000,
				chanceNeutra = 4000,
				profissao = "alquimista"
			},
			[4018] = {
				itensPlayer = {{2801, 1}},
				removerTarget = 1,
				efeito = {"hit"},
				tempo = 5*60*1000,
				chanceSucesso = 2000,
				chanceNeutra = 4000,
				profissao = "alquimista"
			}
		}
	},
	[4006] = {
		["default"] = {
			itensPlayer = {{2675, {1, 8}}},
			transformar = {4008, 1, "item"},
			efeito = {"hit"},
			criatura = {"Squirrel", 1000}
		}
	},
	[5157] = {
		["default"] = {
			itensPlayer = {{5097, {1, 8}}},
			transformar = {5156, 1, "item"},
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
			removerTarget = 1,
		},
		[2678] = {
			itensPlayer = {{2006, 1, 14}},
			removerItensPlayer = {{2006, 1, 0}},
			removerTarget = 1,
		},
		[8841] = {
			itensPlayer = {{2006, 1, 5}},
			removerItensPlayer = {{2006, 1, 0}},
			removerTarget = 1,
		}
	},
	[18336] = {
		["default"] = {
			itensPlayer = {{18337, 1}},
			transformar = {18333, 1, "item"},
			efeito = {"hit"},
			chanceSucesso = 2000,
			chanceNeutra = 4000,
			profissao = "ferreiro"
		}
	},
	[5908] = {
		[7441] = {
			transformar = {7442, 1},
			efeito = {"hit"},
			chanceQuebrar = 4000
		},
		[7442] = {
			transformar = {7444, 1},
			efeito = {"hit"},
			chanceQuebrar = 3000
		},
		[7444] = {
			transformar = {7445, 1},
			efeito = {"hit"},
			chanceQuebrar = 2000
		},
		[7445] = {
			transformar = {7446, 1},
			efeito = {"hit"},
			chanceQuebrar = 1000
		},
		[11343] = {
			transformarAleatorio = {{11344, 1, 4500}, {11345, 1, 4500}, {11346, 1, 1000}},
			efeito = {"hit"}
		},
		[7339] = {
			itensPlayer = {{11209, 1}},
			transformar = {7340, 1},
			efeito = {"hit"},
			chanceSucesso = 2000,
			profissao = "alfaiate"
		},
		[2905] = {
			itensPlayer = {{11236, 1}},
			transformar = {2906, 1},
			efeito = {"hit"},
			chanceSucesso = 2000,
			profissao = "alfaiate"
		},
		[2914] = {
			itensPlayer = {{12404, 1}},
			transformar = {2915, 1},
			efeito = {"hit"},
			chanceSucesso = 2000,
			profissao = "alfaiate"
		},
		["sparkling"] = {
			[10803] = {
				itensPlayer = {{13219, 1}},
				removerTarget = 1,
				efeito = {"hit"},
				tempo = 5*60*1000,
				chanceSucesso = 2000,
				chanceNeutra = 4000,
				profissao = "alquimista"
			},
			[10917] = {
				itensPlayer = {{13216, 1}},
				removerTarget = 1,
				efeito = {"hit"},
				tempo = 5*60*1000,
				chanceSucesso = 2000,
				chanceNeutra = 4000,
				profissao = "alquimista"
			},
			[11671] = {
				itensPlayer = {{13222, 1}},
				removerTarget = 1,
				efeito = {"hit"},
				tempo = 5*60*1000,
				chanceSucesso = 2000,
				chanceNeutra = 4000,
				profissao = "alquimista"
			},
			[11672] = {
				itensPlayer = {{13217, 1}},
				removerTarget = 1,
				efeito = {"hit"},
				tempo = 5*60*1000,
				chanceSucesso = 2000,
				chanceNeutra = 4000,
				profissao = "alquimista"
			},
			[11673] = {
				itensPlayer = {{13220, 1}},
				removerTarget = 1,
				efeito = {"hit"},
				tempo = 5*60*1000,
				chanceSucesso = 2000,
				chanceNeutra = 4000,
				profissao = "alquimista"
			},
			[11675] = {
				itensPlayer = {{13221, 1}},
				removerTarget = 1,
				efeito = {"hit"},
				tempo = 5*60*1000,
				chanceSucesso = 2000,
				chanceNeutra = 4000,
				profissao = "alquimista"
			},
			[11676] = {
				itensPlayer = {{13218, 1}},
				removerTarget = 1,
				efeito = {"hit"},
				tempo = {5*60*1000, 10*60*1000},
				chanceSucesso = 2000,
				chanceNeutra = 4000,
				profissao = "alquimista"
			}
		}
	},
	[11339] = {
		["default"] = {
			transformarAleatorio = {{11340, 1, 4500}, {11341, 1, 4500}, {11342, 1, 1000}},
			transformarAleatorioTipo = "item",
			efeito = {"hit"}
		}
	},
	[19948] = {
		[19959] = {
			transformar = {19960, 1},
			removerItem = 1,
			efeito = {"hit"}
		}
	},
	[10317] = {
		["default"] = {
			transformar = {10363, 1, "item"},
			efeito = {"rage_skies", "player"}
		}
	},
	[7286] = {
		[7106] = {
			itensGame = {{7108, 1}}
		}
	},
	[13193] = {
		[13215] = {
			transformar = {13197, 1},
			removerItem = 1,
			efeito = {"hit"}
		},
		[13214] = {
			transformar = {13198, 1},
			removerItem = 1,
			efeito = {"hit"}
		}
	},
	[13194] = {
		[13213] = {
			transformar = {13198, 1},
			removerItem = 1,
			efeito = {"hit"}
		},
		[13215] = {
			transformar = {13196, 1},
			removerItem = 1,
			efeito = {"hit"}
		}
	},
	[13195] = {
		[13214] = {
			transformar = {13196, 1},
			removerItem = 1,
			efeito = {"hit"}
		},
		[13213] = {
			transformar = {13197, 1},
			removerItem = 1,
			efeito = {"hit"}
		}
	},
	[11421] = {
		["sparkling"] = {
			["ferro"] = {
				itensPlayerAleatorio = {{5892, 1, 100}, {5880, 1, 3900}, {2225, {1, 2}, 6000}},
				removerTarget = 1,
				efeito = {"hit"},
				tempo = 3*60*1000,
				chanceSucesso = 2000,
				chanceNeutra = 4000,
				profissao = "ferreiro",
				expProfissao = 10
			},
			["carvao"] = {
				itensPlayer = {{13757, 1}},
				removerTarget = 1,
				efeito = {"hit"},
				tempo = 5*60*1000,
				chanceSucesso = 2000,
				chanceNeutra = 4000,
				profissao = "ferreiro",
				expProfissao = 10
			}
		}
	},
	[2559] = {
		["sparkling"] = {
			["arvores"] = {
				itensPlayerAleatorio = {{5901, 1, 10000}},
				removerTarget = 1,
				efeito = {"hit"},
				tempo = 3*60*1000,
				chanceSucesso = 3000,
				chanceNeutra = 3000,
				profissao = "ferreiro",
				expProfissao = 5
			}
		}
	},
	["sparkling"] = {
		["default"] = {
			checarItem = 2743,
			itensPlayerAleatorio = {{5921, 1, 10000}},
			removerItem = 1,
			efeito = {"hit"},
			tempo = 2*60*1000,
			chanceSucesso = 5000,
			chanceNeutra = 2000,
			-- profissao = "alquimista",
			-- expProfissao = 10
		}
	},
	[13757] = {
		[7131] = {
			transformar = {10037, 1},
			removerItem = 1
		}
	},
	[2146] = {
		["ice_shrine"] = {
			itensPlayer = {{7759, 1}},
			removerItensPlayer = {{21246, 1}},
			efeito = {42},
			removerItem = 1
		},
		["sparkling"] = {
			actionId = 3300,
			adicionarStorage = {3300, 1},
			efeito = {44},
			removerItem = 1
		}
	},
	[2147] = {
		["fire_shrine"] = {
			itensPlayer = {{7760, 1}},
			removerItensPlayer = {{21246, 1}},
			efeito = {7},
			removerItem = 1
		}
	},
	[2149] = {
		["earth_shrine"] = {
			itensPlayer = {{7761, 1}},
			removerItensPlayer = {{21246, 1}},
			efeito = {9},
			removerItem = 1
		},
		["sparkling"] = {
			actionId = 3301,
			adicionarStorage = {3301, 1},
			efeito = {46},
			removerItem = 1
		}
	},
	[2150] = {
		["energy_shrine"] = {
			itensPlayer = {{7762, 1}},
			removerItensPlayer = {{21246, 1}},
			efeito = {"choque_roxo"},
			removerItem = 1
		}
	},
	[21247] = {
		[21430] = {
			itensPlayer = {{21446, 1}},
			transformar = {21431, 1},
			efeito = {"choque_roxo"},
			removerItem = 1
		}
	},
	[2093] = {
		["default"] = {
			efeito = {"smoke", {y = -1}}
		}
	},
	[2099] = {
		["default"] = {
			efeito = {"smoke", {y = -1}}
		}
	},
	[3421] = {
		["default"] = {
			actionId = 2902,
			verificarPosicaoTeleportar = {
				{{y = -1}, {y = 1}, "item", "sul"},
				{{y = 1}, {y = -1}, "item", "norte"}
			},
			efeitoTeleport = "poff",
			checarPz = true
		}
	},
	[14756] = {
		["default"] = {
			verificarPosicaoTeleportar = {
				{{y = -1}, {y = 1}, "item", "sul"},
				{{y = 1}, {y = -1}, "item", "norte"}
			},
			efeitoTeleport = "poff"
		}
	},
	[14768] = {
		["default"] = {
			verificarPosicaoTeleportar = {
				{{x = -1}, {x = 1}, "item", "leste"},
				{{x = 1}, {x = -1}, "item", "oeste"}
			},
			efeitoTeleport = "poff"
		}
	},
	[11754] = {
		["default"] = {
			transformar = {11755, 1, "item"},
			sons = {
				"NO ONE WILL STOP ME THIS TIME!",
				"THE POWER IS MINE!",
				"Mwahaha!"
			}
		}
	},
	[7552] = {
		["default"] = {
			chances = {
				[1000] = {
					transformar = {7553, 1, "item"},
					itensPlayer = {{7632, 1}},
					mensagemPlayer = '"Você encontrou uma bela pérola!"',
					efeito = {"hit"}
				},
				[2000] = {
					transformar = {7553, 1, "item"},
					itensPlayer = {{7633, 1}},
					mensagemPlayer = '"Você encontrou uma bela pérola!"',
					efeito = {"hit"}
				},
				[6000] = {
					transformar = {7553, 1, "item"},
					dano = {"físico", "fixo", -200},
					mensagemPlayer = '"Você esmagou seus dedos!"',
					efeito = {"hit"}
				},
				[10000] = {
					transformar = {7553, 1, "item"},
					mensagemPlayer = '"Parece estar vazia."',
					efeito = {"hit"}
				},
			}
		}
	},
	[10153] = {
		[9802] = {
			chances = {
				[1500] = {
					transformar = {9803, 1},
					itensPlayer = {{10151, 1}},
					mensagemPlayer = '"Você salvou uma parte do golem."',
					efeito = {"hit"}
				},
				[3500] = {
					transformar = {9803, 1},
					criatura = "Rat",
					mensagemPlayer = '"Algo estava preso no golem."'
				},
				[5500] = {
					transformar = {9803, 1},
					dano = {"energia", "cargas", 8, 8000, -35},
					mensagemPlayer = '"Que experiência eletrificante!"',
					efeito = {"hit"}
				},
				[7500] = {
					transformar = {9803, 1},
					itensPlayer = {{8309, {1, 8}}},
					mensagemPlayer = '"Você recuperou algumas sucatas!"',
					efeito = {"hit"}
				},
				[10000] = {
					transformar = {9803, 1},
					mensagemPlayer = '"Você arruinou o que sobrou do golem."',
					efeito = {"poff"}
				}
			}
		}
	},
	[23875] = {
		[5880] = {
			itensGamePlayer = {{12505, 1}},
			removerItem = 1,
			removerTarget = 1,
			efeito = {"green", "player_target"},
			chanceSucesso = 5000,
			profissao = "ferreiro",
			nivelProfissao = 2,
			expProfissao = 40
		},
		[5901] = {
			itensGamePlayer = {{12503, 1}},
			removerItem = 1,
			removerTarget = 1,
			efeito = {"green", "player_target"},
			chanceSucesso = 1000
		},
		[5920] = {
			itensGamePlayer = {{12506, 1}},
			removerItem = 1,
			removerTarget = 1,
			efeito = {"green", "player_target"},
			chanceSucesso = 1000
		},
		[7242] = {
			itensGamePlayer = {{12508, 1}},
			removerItem = 1,
			removerTarget = 1,
			removerItem = 1,
			efeito = {"green", "player_target"},
			chanceSucesso = 1000
		},
		[8860] = {
			itensGamePlayer = {{12501, 1}},
			removerItem = 1,
			removerTarget = 1,
			efeito = {"green", "player_target"},
			chanceSucesso = 1000
		},
		[2193] = {
			itensGamePlayer = {{2354, 1}},
			removerItem = 1,
			removerTarget = 1,
			efeito = {"green", "player_target"},
			chanceSucesso = 5000,
			profissao = "ferreiro",
			expProfissao = 40
		}
	},
	[2225] = {
		["default"] = {
			itensGamePlayer = {{5880, 1}},
			removerItensNecessarios = 1,
			quantidadeItemNecessaria = 3,
			profissao = "ferreiro",
			efeito = {"green", "player_item"},
			expProfissao = 10
		}
	},
	[2327] = {
		[6104] = {
			transformar = {2354, 1, "item"},
			removerTarget = 1,
			efeito = {"green", "player_item"}
		}
	},
	[13559] = {
		["default"] = {
			transformar = {13581, 1, "item"},
			sons = {
				"Mhausheausheu! What a FAIL! Mwahaha!",
				"Hail |PLAYERNAME|! You are wearing old socks!",
				"You are so unpopular even your own shadow refuses to follow you."
			}
		}
	},
	[13028] = {
		["default"] = {
			transformar = {13029, 1, "item"},
			sons = {
				"The world was born from the love",
				"Look after the frozen heart. I've left it with you",
				"Could a dead, frozen heart beat again? It felt like mine was about to.",
				"Hail |PLAYERNAME|!"
			}
		}
	},
	[13030] = {
		["default"] = {
			transformar = {13031, 1, "item"},
			sons = {
				"For zze emperor!",
				"Hail |PLAYERNAME|!!"
			}
		}
	},
	[13032] = {
		["default"] = {
			transformar = {13033, 1, "item"}
		}
	},
	[16105] = {
		["default"] = {
			transformar = {16106, 1, "item"},
			sons = {
				"Where isss my body !? I'll kill you!!!",
				"Hail mighty |PLAYERNAME|",
				"I will petrify thiss moment! Ssstones are forever!"
			}
		}
	},
	[23496] = {
		["default"] = {
			transformar = {23500, 1, "item"}
		}
	},
	[23497] = {
		["default"] = {
			transformar = {23501, 1, "item"}
		}
	},
	[23498] = {
		["default"] = {
			transformar = {23502, 1, "item"}
		}
	},
	[23499] = {
		["default"] = {
			transformar = {23503, 1, "item"}
		}
	},
	[23500] = {
		["default"] = {
			transformar = {23496, 1, "item"}
		}
	},
	[23501] = {
		["default"] = {
			transformar = {23497, 1, "item"}
		}
	},
	[23502] = {
		["default"] = {
			transformar = {23498, 1, "item"}
		}
	},
	[23503] = {
		["default"] = {
			transformar = {23499, 1, "item"}
		}
	},
	[7537] = {
		["default"] = {
			chances = {
				[7000] = {
					transformar = {7536, 1, "item"},
					efeito = {"hit"},
					criatura = {"Spider", 10000}
				},
				[10000] = {
					transformar = {7536, 1, "item"},
					efeito = {"hit"},
					criatura = {"Poison Spider", 10000}
				},
			}
		}
	},
	[7585] = {
		["default"] = {
			chances = {
				[7000] = {
					transformar = {7586, 1, "item"},
					efeito = {"hit"},
					criatura = {"Spider", 10000}
				},
				[10000] = {
					transformar = {7586, 1, "item"},
					efeito = {"hit"},
					criatura = {"Poison Spider", 10000}
				},
			}
		}
	},
	[3743] = {
		["default"] = {
			transformar = {4404, 1, "item"},
		}
	},
	[4404] = {
		["default"] = {
			transformar = {3743, 1, "item"},
		}
	},
	["action"] = {
		[3901] = {
			["default"] = {
				itensPlayer = {{2554, 1}, {2120, 1}},
				removerItem = 1
			}
		}
	},
	["unique"] = {
	}
}

local condition = {}
for a, b in pairs(config) do
	if condition[a] == nil then
		local adicionarCondition = 0
		local dano
		for c, d in pairs(b) do
			if c == "dano" then
				adicionarCondition = a
				dano = d
			elseif type(d) == "table" then
				for e, f in pairs(d) do
					if e == "dano" then
						adicionarCondition = a
						dano = f
					elseif type(f) == "table" then
						for g, h in pairs(f) do
							if g == "dano" then
								adicionarCondition = a
								dano = h
							elseif type(h) == "table" then
								for i, j in pairs(h) do
									if i == "dano" then
										adicionarCondition = a
										dano = j
									end
								end
							end
						end
					end
				end
			end
		end

		if adicionarCondition > 0 then
			if dano[2] == "cargas" then
				condition[adicionarCondition] = createConditionObject(conditionsDamage[dano[1]][1])
				addDamageCondition(condition[adicionarCondition], dano[3], dano[4], dano[5])
			end
		end
	end
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)

	if isInArray(itensMovimentoDesativado, target.actionid) then
		self:sendCancelMessage("Você não pode realizar essa ação.")
		return false
	end

	if config[item.itemid] ~= nil or
	config["action"][item.actionid] ~= nil or
	config["unique"][item.uid] ~= nil or
	(isInArray(sparkling, item.itemid) and config["sparkling"] ~= nil) then
		local i

		if config[item.itemid] ~= nil then
			i = config[item.itemid]
		elseif config["action"][item.actionid] ~= nil then
			i = config["action"][item.actionid]
		elseif config["unique"][item.uid] ~= nil then
			i = config["unique"][item.uid]
		elseif isInArray(sparkling, item.itemid) and config["sparkling"] ~= nil then
			i = config["sparkling"]
		end

		if i == nil then
			return false
		end

		local piso = Tile(toPosition)
		local topItem = 0

		if piso ~= nil and piso:getTopVisibleThing() ~= nil then
			topItem = piso:getTopVisibleThing():getId()
		end

		local adicionarEvento = false
		local cancelarEvento = false

		if i["default"] ~= nil then
			i = i["default"]
			if i.checarItem ~= nil and topItem ~= i.checarItem then
				return false
			elseif i.tempo ~= nil and i.tempo > 0 then
				adicionarEvento = true
			end
		elseif isInArray(sparkling, target.itemid) and #piso:getItems() >= 2 and
		(i["sparkling"][topItem] ~= nil or
		(i["sparkling"]["ferro"] ~= nil and isInArray(ferro, topItem)) or
		(i["sparkling"]["carvao"] ~= nil and isInArray(carvao, topItem)) or
		(i["sparkling"]["arvores"] ~= nil and isInArray(arvores, topItem)) or
		i["sparkling"] ~= nil) then
			if i["sparkling"]["ferro"] ~= nil and isInArray(ferro, topItem) then
				i = i["sparkling"]["ferro"]
			elseif i["sparkling"]["carvao"] ~= nil and isInArray(carvao, topItem) then
				i = i["sparkling"]["carvao"]
			elseif i["sparkling"]["arvores"] ~= nil and isInArray(arvores, topItem) then
				i = i["sparkling"]["arvores"]
				verificarNovoPontoColetaMadeira = true
				gerarNovoPontoColetaMadeira = true
			elseif i["sparkling"][topItem] ~= nil then
				i = i["sparkling"][topItem]
			else
				for a, b in pairs(i["sparkling"]) do
					if type(a) == "number" then
						return false
					end
				end
				i = i["sparkling"]
				cancelarEvento = true
			end
			if not cancelarEvento then
				adicionarEvento = true
			end
		elseif isInArray(fire_source, target.itemid) and i["fire_source"] ~= nil then
			i = i["fire_source"]
		elseif isInArray(fruits, target.itemid) and i["fruits"] ~= nil then
			i = i["fruits"]
		elseif isInArray(ice_shrine, target.itemid) and i["ice_shrine"] ~= nil then
			i = i["ice_shrine"]
		elseif isInArray(fire_shrine, target.itemid) and i["fire_shrine"] ~= nil then
			i = i["fire_shrine"]
		elseif isInArray(earth_shrine, target.itemid) and i["earth_shrine"] ~= nil then
			i = i["earth_shrine"]
		elseif isInArray(energy_shrine, target.itemid) and i["energy_shrine"] ~= nil then
			i = i["energy_shrine"]
		elseif i[target.itemid] ~= nil then
			i = i[target.itemid]
		elseif i["action"] ~= nil and i["action"][item.actionid] ~= nil then
			i = i["action"][item.actionid]
		elseif i["unique"] ~= nil and i["unique"][item.uid] ~= nil then
			i = i["unique"][item.uid]
		else
			return false
		end

		if i == nil then
			return false
		end

		if i.chances ~= nil then
			local chance = math.random(1, 10000)
			local keys = {}

			for key in pairs(i.chances) do
				table.insert(keys, key)
			end

			table.sort(keys)

			for a, b in pairs(keys) do
				if chance <= b then
					i = i.chances[b]
					break
				end
			end
		end

		if i.actionId ~= nil then
			if item.actionid ~= i.actionId and target.actionid ~= i.actionId then
				return false
			end
		end

		if i.checarPz ~= nil then
			if player:isPzLocked() then
				return player:sendCancelMessage("Você não pode entrar nessa área depois de atacar outro jogador.")
			end
		end

		if i.quantidadeItemNecessaria ~= nil and player:getItemCount(item.itemid) < i.quantidadeItemNecessaria then
			return false
		end

		if i.verificarPosicao ~= nil then
			local verificarPosicao

			if(i.verificarPosicao[2] == "item") then
				verificarPosicao = fromPosition
			elseif(i.verificarPosicao[2] == "target") then
				verificarPosicao = toPosition
			end

			if i.verificarPosicao[1].x ~= nil and player:getPosition().x ~= verificarPosicao.x+i.verificarPosicao[1].x then
				return false
			end

			if i.verificarPosicao[1].y ~= nil and player:getPosition().y ~= verificarPosicao.y+i.verificarPosicao[1].y then
				return false
			end

			if i.verificarPosicao[1].z ~= nil and player:getPosition().z ~= verificarPosicao.z+i.verificarPosicao[1].z then
				return false
			end
		end

		if i.adicionarStorage ~= nil then
			if player:getStorageValue(i.adicionarStorage[1]) == i.adicionarStorage[2] then
				return false
			end
			player:setStorageValue(i.adicionarStorage[1], i.adicionarStorage[2])
		end

		local profissaoId = 0
		local profissaoSkill =  0

		if i.profissao ~= nil then
			profissaoId = verificiarProfissaoPorNome(i.profissao)
			profissaoSkill = player:getProfissaoSkill(profissaoId)

			if i.nivelProfissao ~= nil and i.nivelProfissao > 0 and profissaoSkill < i.nivelProfissao then
				return player:sendCancelMessage("Você precisa possuir nível " .. i.nivelProfissao .. " de " .. i.profissao .. " para realizar essa ação.")
			end

			if i.expProfissao ~= nil and i.expProfissao > 0 then
				player:addProfissaoSkillExp(profissaoId, i.expProfissao)
			end
		end

		local chanceSucesso = 10000
		local chanceQuebrar = 0

		if i.chanceSucesso ~= nil then
			chanceSucesso = i.chanceSucesso
		end

		if i.chanceQuebrar ~= nil then
			chanceQuebrar = i.chanceQuebrar
		end

		local efeito

		if i.efeito ~= nil then
			efeito = i.efeito
		end

		if i.profissao ~= nil and verificiarProfissaoPorNome(i.profissao) and chanceSucesso ~= nil and chanceSucesso <= 10000 then
			chanceSucesso = chanceSucesso+player:getProfissaoChanceColetaAdicional(profissaoId)
		end

		local chance = 10000

		if (chanceSucesso ~= nil and chanceSucesso <= 10000) or
		(chanceQuebrar ~= nil and chanceQuebrar <= 10000) or
		(i.transformarAleatorio ~= nil and #i.transformarAleatorio >= 2) then
			chance = math.random(10000)
		else
			chanceSucesso = 10000
		end

		if i.removerItensPlayer ~= nil then
			for c, v in pairs(i.removerItensPlayer) do
				local v3 = -1

				if v[3] ~= nil then
					v3 = v[3]
				end

				if player:getItemCount(v[1], v3) < v[2] then
					return false
				end
			end

			for c, v in pairs(i.removerItensPlayer) do
				local v3 = -1
				if v[3] ~= nil then
					v3 = v[3]
				end
				player:getItemById(v[1], v3):remove(v[2])
			end
		end

		if i.removerItensNecessarios ~= nil and i.removerItensNecessarios == 1 and not player:removeItem(item.itemid, i.quantidadeItemNecessaria) then
			return false
		end

		if i.removerItem ~= nil and i.removerItem == 1 and not item:remove(1) then
			return false
		end

		if i.itensGamePlayer ~= nil then
			if chance <= chanceSucesso then
				for c, v in pairs(i.itensGamePlayer) do
					local itemGamePlayerAdicionar = v[1]
					local quantidadeItemGamePlayerAdicionar = v[2]
					local typeItemGamePlayerAdicionar = v[3] or 1

					if type(quantidadeItemGamePlayerAdicionar) == "table" then
						quantidadeItemGamePlayerAdicionar = math.random(quantidadeItemGamePlayerAdicionar[1], quantidadeItemGamePlayerAdicionar[2])
					end

					if toPosition.x == 65535 then
						player:addItem(itemGamePlayerAdicionar, quantidadeItemGamePlayerAdicionar, true, typeItemGamePlayerAdicionar)
					else
						Game.createItem(itemGamePlayerAdicionar, quantidadeItemGamePlayerAdicionar, toPosition)
					end
				end
			else
				efeito = {"poff"}
			end
		end

		if i.itensPlayer ~= nil then
			if chance <= chanceSucesso then
				for c, v in pairs(i.itensPlayer) do
					local itemPlayerAdicionar = v[1]
					local quantidadeItemPlayerAdicionar = v[2]
					local typeItemPlayerAdicionar = v[3] or 1

					if type(quantidadeItemPlayerAdicionar) == "table" then
						quantidadeItemPlayerAdicionar = math.random(quantidadeItemPlayerAdicionar[1], quantidadeItemPlayerAdicionar[2])
					end

					player:addItem(itemPlayerAdicionar, quantidadeItemPlayerAdicionar, true, typeItemPlayerAdicionar)
				end
			else
				efeito = {"poff"}
			end
		end

		if i.itensPlayerAleatorio ~= nil then
			if chance <= chanceSucesso then
				local chanceItemAleatorio = math.random(10000)
				local chanceItem = 0

				for c, v in pairs(i.itensPlayerAleatorio) do
					chanceItem = chanceItem+v[3]

					if chanceItemAleatorio <= chanceItem then
						local itemAleatorioAdicionar = v[1]
						local quantidadeItemAleatorioAdicionar = v[2]

						if type(quantidadeItemAleatorioAdicionar) == "table" then
							quantidadeItemAleatorioAdicionar = math.random(v[2][1], v[2][2])
						end

						local typeItemAleatorioAdicionar = v[4] or 1
						player:addItem(itemAleatorioAdicionar, quantidadeItemAleatorioAdicionar, true, typeItemAleatorioAdicionar)
						chanceItemAleatorio = 100000
					end
				end
			else
				efeito = {"poff"}
			end
		end

		if i.itensGame ~= nil then
			for c, v in pairs(i.itensGame) do
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
						posicaoGameAdicionar = getPlayerPosition(player)
					end
				end

				if posicaoGameAdicionar == nil then
					posicaoGameAdicionar = toPosition
				end

				local itemGame = Game.createItem(itemGameAdicionar, quantidadeGameAdicionar, posicaoGameAdicionar)
				itemGame:decay()
			end
		end

		if i.transformar ~= nil and #i.transformar >= 2 then
			local transformar = target
			local itemTransformar = i.transformar[1]
			local quantidadeTransformar = i.transformar[2]
			local realizarTransformacao = true

			if type(quantidadeTransformar) == "table" then
				quantidadeTransformar = math.random(quantidadeTransformar[1], quantidadeTransformar[2])
			end

			if i.transformar[3] ~= nil and i.transformar[3] == "item" then
				transformar = item
			end

			if i.chanceNeutra ~= nil and i.chanceNeutra <= 10000 then
				local chanceNeutra = i.chanceNeutra+chanceSucesso

				if (not (chance <= chanceSucesso)) and (chance <= chanceNeutra) then
					efeito = {"poff"}
					realizarTransformacao = false
				elseif (not (chance <= chanceSucesso)) then
					efeito = {"poff"}
				end
			end

			if realizarTransformacao then
				transformar:transform(itemTransformar, quantidadeTransformar)
				transformar:decay()
			end
		end

		if i.transformarAleatorio ~= nil and #i.transformarAleatorio >= 2 then
			local chanceTransformar = 0

			for c, v in pairs(i.transformarAleatorio) do
				chanceTransformar = chanceTransformar+v[3]

				if chance <= chanceTransformar then
					if i.transformarAleatorioTipo == "item" then
						item:transform(v[1], v[2])
					else
						if i.transformarAleatorioTipo == "target" or target then
							target:transform(v[1], v[2])
						else
							item:transform(v[1], v[2])
						end
					end

					break
				end
			end
		end

		if i.removerTarget == 1 then
			if i.chanceNeutra ~= nil and i.chanceNeutra <= 10000 then
				local chanceNeutra = i.chanceNeutra+chanceSucesso

				if (not (chance <= chanceSucesso)) and (chance <= chanceNeutra) then
					adicionarEvento = false

					if verificarNovoPontoColetaMadeira then
						gerarNovoPontoColetaMadeira = false
					end

					efeito = {"poff"}
				elseif (not (chance <= chanceSucesso)) then
					efeito = {"poff"}
					target:remove(1)
				else
					target:remove(1)
				end
			else
				target:remove(1)
			end
		end

		if chanceQuebrar ~= nil and chanceQuebrar <= 10000 and chance <= chanceQuebrar then
			target:remove(1)
		end

		if efeito ~= nil and #efeito > 0 then
			local posicaoEfeito = nil

			if i.efeito[2] and i.efeito[2] ~= "to" then
				if type(i.efeito[2]) == "table" then
					posicaoEfeito = fromPosition+i.efeito[2]
				elseif i.efeito[2] == "from" then
					posicaoEfeito = fromPosition
				elseif i.efeito[2] == "player" then
					posicaoEfeito = player:getPosition()
				elseif i.efeito[2] == "player_item" or i.efeito[2] == "player_target" then
					if i.efeito[2] == "player_item" then
						posicaoEfeito = fromPosition
					elseif i.efeito[2] == "player_target" then
						posicaoEfeito = toPosition
					end

					if toPosition.x == 65535 then
						posicaoEfeito = player:getPosition()
					end
				end
			end

			if posicaoEfeito == nil then
				posicaoEfeito = toPosition
			end

			local exibirEfeito = efeito[1]

			if type(efeito[1]) ~= "number" then
				exibirEfeito = efeitos[efeito[1]]
			end

			posicaoEfeito:sendMagicEffect(exibirEfeito)
		end

		if i.criatura ~= nil then
			local chanceCriatura = 10000
			local criatura = i.criatura

			if type(criatura) == "table" then
				if criatura[2] and type(criatura[2]) == "number" and criatura[2] >= 1 and criatura[2] <= 10000 then
					chanceCriatura = criatura[2]
				end

				criatura = criatura[1]
			end

			if math.random(10000) <= chanceCriatura then
				Game.createMonster(criatura, toPosition)
			end
		end

		if i.teleportar ~= nil then
			local posicaoTeleportar

			if(i.teleportar[2] == "item") then
				posicaoTeleportar = fromPosition
			elseif(i.teleportar[2] == "target") then
				posicaoTeleportar = toPosition
			end

			if i.teleportar[1].x ~= nil then
				posicaoTeleportar.x = posicaoTeleportar.x+i.teleportar[1].x
			end

			if i.teleportar[1].y ~= nil then
				posicaoTeleportar.y = posicaoTeleportar.y+i.teleportar[1].y
			end

			if i.teleportar[1].z ~= nil then
				posicaoTeleportar.z = posicaoTeleportar.z+i.teleportar[1].z
			end

			player:teleportTo(posicaoTeleportar, true)
			local exibirEfeito = "teleport"

			if i.efeitoTeleport ~= nil then
				exibirEfeito = i.efeitoTeleport
			end

			posicaoTeleportar:sendMagicEffect(efeitos[exibirEfeito])
		end

		if i.direcionar ~= nil then
			player:setDirection(direcoes[i.direcionar])
		end

		if i.verificarPosicaoTeleportar ~= nil then
			for a, b in pairs(i.verificarPosicaoTeleportar) do
				local verificarPosicaoTeleportar

				if(b[3] == "item") then
					verificarPosicaoTeleportar = fromPosition
				elseif(b[3] == "target") then
					verificarPosicaoTeleportar = toPosition
				end

				local posicaoTeleportar = verificarPosicaoTeleportar

				if ((b[1].x ~= nil and player:getPosition().x == verificarPosicaoTeleportar.x+b[1].x) or
				(b[1].y ~= nil and player:getPosition().y == verificarPosicaoTeleportar.y+b[1].y) or
				(b[1].z ~= nil and player:getPosition().z == verificarPosicaoTeleportar.z+b[1].z)) then
					if b[2].x ~= nil then
						posicaoTeleportar.x = posicaoTeleportar.x+b[2].x
					end

					if b[2].y ~= nil then
						posicaoTeleportar.y = posicaoTeleportar.y+b[2].y
					end

					if b[2].z ~= nil then
						posicaoTeleportar.z = posicaoTeleportar.z+b[2].z
					end

					player:teleportTo(posicaoTeleportar, true)

					local exibirEfeito = "teleport"

					if i.efeitoTeleport ~= nil then
						exibirEfeito = i.efeitoTeleport
					end

					posicaoTeleportar:sendMagicEffect(efeitos[exibirEfeito])

					if b[4] ~= nil then
						player:setDirection(direcoes[b[4]])
					end
				end
			end
		end

		if i.sons ~= nil and type(i.sons) == "table" and #i.sons > 0 then
			player:say(formatarFrase(i.sons[math.random(1, #i.sons)], player.uid), TALKTYPE_ORANGE_1, false, 0, toPosition)
		end

		if i.mensagemPlayer ~= nil then
			player:sendTextMessage(MESSAGE_INFO_DESCR, i.mensagemPlayer)
		end

		if i.dano ~= nil then
			if i.dano[2] == "fixo" then

				local danoMin = i.dano[3]
				local danoMax = danoMin

				if i.dano[4] ~= nil then
					danoMax = i.dano[4]
				end

				doTargetCombatHealth(0, player, conditionsDamage[i.dano[1]][2], danoMin, danoMax, CONST_ME_NONE)
			elseif i.dano[2] == "cargas" then
				player:addCondition(condition[item.itemid])
			end
		end

		if gerarNovoPontoColetaMadeira then
			gerarPontoColetaMadeira(toPosition.x .. "," .. toPosition.y .. "," .. toPosition.z)
		elseif adicionarEvento then
			local adicionarItemEvento = target.itemid

			if target.itemid == 0 then
				adicionarItemEvento = item.itemid
			end

			addEvent(function(posicao, item)
				Game.createItem(item, 1, posicao)
			end, i.tempo, toPosition, adicionarItemEvento)
		end

		return true
	end

	return false
end