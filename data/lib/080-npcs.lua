destinos = {
	["ilha_inicial"] = {
		nome = "Ilha Inicial",
		posicao = {x = 586, y = 920, z = 7},
		custo = 100,
		levelNecessario = 502
	},
	["ilha_testes"] = {
		nome = "Ilha de Testes",
		posicao = {x = 856, y = 2091, z = 7},
		custo = 100
	}
}
barqueiros = {
	["Barqueiro"] = {
		destinos = {
			"ilha_inicial",
			"ilha_testes"
		},
		tipo_viagem = "navio"
	},
	["Barqueiro2"] = {
		destinos = {
			"ilha_inicial",
			"ilha_testes"
		},
		tipo_viagem = "tapete"
	}
}