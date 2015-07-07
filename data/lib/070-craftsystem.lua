configProfissoes = {
	nivelMaximoProfissao = 100,
	skill = 1,
	skillExp = 2,
	receitasFabricadas = 3,
	receitasFalhadas = 4,
	pontosProfissao = 5,
	ultimaReceita = 6,
	ingredienteMelhoria = 7,
	receitasInicio = 10,
	ultimasReceitasFalhadas = 500,
	modalInfo = 1,
	modalLista1 = 2,
	modalLista2 = 3,
	modalLista3 = 4,
	pocaoCD = 700,
	pocaoChanceStorage = 19900,
	pocaoProfissaoStorage = 19901,
	pocoes = {
		[21309] = {duracao = 600},
		[21426] = {duracao = 600}
	},
	maxQuantidadeFabricacao = 10
}
profissoes = {
	[20000] = {
		nome = "Ferreiro",
		mesaTrabalho = {2555, 8671},
		mesaTrabalhando = {},
		receitas = {
			-- Materiais
			-- {item = 5889, nivel = 50, nivelJogador = 1, ferramenta = 2321, materiais = {{5880, 1}, {13757, 1}, {12614, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {armadura = {0, 3}}},
			-- {item = 5887, nivel = 50, nivelJogador = 1, ferramenta = 2321, materiais = {{5880, 1}, {13757, 1}, {9678, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {armadura = {0, 3}}},
			-- {item = 5888, nivel = 50, nivelJogador = 1, ferramenta = 2321, materiais = {{5880, 1}, {21585, 1}, {10581, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {armadura = {0, 3}}},

			-- Capacetes
			{item = 2502, nivel = 1, nivelJogador = 10, ferramenta = 2422, materiais = {{9820, 1}, {5880, 2}, {5900, 1}}, fabricarQuantidade = 1, tempo = 3, experiencia = 30, pontos = 2, chanceSucesso = 9000, aprender = 0, atributos = {armadura = {1, 3}}},--155
			-- {item = 3972, nivel = 5, nivelJogador = 1, ferramenta = 2422, materiais = {{9820, 1}, {5898, 10}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {armadura = {0, 3}}},
			{item = 2499, nivel = 15, nivelJogador = 1, ferramenta = 2422, materiais = {{9820, 1}, {7249, 2}, {12399, 3}}, fabricarQuantidade = 1, tempo = 15, experiencia = 350, pontos = 70, chanceSucesso = 2000, maxChanceSucesso = 3500, aprender = 0, atributos = {armadura = {1, 3}}},--190
			-- {item = 2491, nivel = 8, nivelJogador = 1, ferramenta = 2422, materiais = {{2128, 1}, {5887, 2}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {armadura = {0, 3}}},
			-- {item = 2342, nivel = 10, nivelJogador = 1, ferramenta = 2422, materiais = {{9820, 1}, {2348, 10}, {15515, 10}, {9942, 10}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {armadura = {0, 3}}},
			{item = 2497, nivel = 10, nivelJogador = 30, ferramenta = 2422, materiais = {{9820, 1}, {2354, 1}, {5880, 10}}, fabricarQuantidade = 1, tempo = 7, experiencia = 250, pontos = 30, chanceSucesso = 5000, aprender = 0, atributos = {armadura = {1, 3}}},--530
			{item = 15408, nivel = 20, nivelJogador = 100, ferramenta = 2321, materiais = {{9820, 1}, {15423, 3}, {15430, 10}, {5880, 5}}, fabricarQuantidade = 1, tempo = 25, experiencia = 650, pontos = 150, chanceSucesso = 1000, maxChanceSucesso = 3000, aprender = 0, atributos = {armadura = {1, 2}}},--1880
			-- {item = 2475, nivel = 20, nivelJogador = 1, ferramenta = 2422, materiais = {{9820, 1}, {12438, 10}, {5880, 10}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {armadura = {0, 3}}},
			-- {item = 12645, nivel = 65, nivelJogador = 1, ferramenta = 2434, materiais = {{9820, 1}, {5881, 10}, {11333, 5}, {11331, 5}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {armadura = {0, 3}}},
			-- {item = 2506, nivel = 70, nivelJogador = 1, ferramenta = 2434, materiais = {{9820, 1}, {5920, 10}, {5882, 5}, {5889, 3}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {armadura = {0, 3}}},
			{item = 5741, nivel = 15, nivelJogador = 80, ferramenta = 2321, materiais = {{2229, 20}, {6300, 3}}, fabricarQuantidade = 1, tempo = 15, experiencia = 350, pontos = 70, chanceSucesso = 2000, maxChanceSucesso = 4000, aprender = 0, atributos = {armadura = {1, 3}}},--2500
			-- {item = 18403, nivel = 75, nivelJogador = 1, ferramenta = 7450, materiais = {{9820, 1}, {11227, 1}, {18422, 5}, {18423, 2}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {armadura = {0, 3}}},
			-- {item = 2498, nivel = 20, nivelJogador = 1, ferramenta = 2422, materiais = {{9820, 1}, {12640, 10}, {5887, 10}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {armadura = {0, 3}}},
			{item = 11302, nivel = 17, nivelJogador = 80, ferramenta = 2422, materiais = {{9820, 1}, {5876, 10}, {11334, 10}, {5880, 10}}, fabricarQuantidade = 1, tempo = 20, experiencia = 450, pontos = 100, chanceSucesso = 2000, maxChanceSucesso = 5000, aprender = 0, atributos = {armadura = {1, 3}}},--1430
			-- {item = 2493, nivel = 50, nivelJogador = 1, ferramenta = 2421, materiais = {{9820, 1}, {6558, 10}, {6500, 5}, {5888, 3}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {armadura = {0, 3}}},
			-- {item = 2496, nivel = 20, nivelJogador = 1, ferramenta = 2422, materiais = {{9820, 1}, {5954, 10}, {5888, 10}, {9941, 10}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {armadura = {0, 3}}},
			-- {item = 2471, nivel = 50, nivelJogador = 1, ferramenta = 2444, materiais = {{9820, 1}, {15515, 3}, {5904, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {armadura = {0, 3}}},
			-- {item = 5461, nivel = 20, nivelJogador = 1, ferramenta = 2422, materiais = {{9820, 1}, {5895, 10}, {12289, 10}, {5880, 10}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {armadura = {0, 3}}},

			-- Armaduras
			{item = 2503, nivel = 1, nivelJogador = 10, ferramenta = 2422, materiais = {{2463, 1}, {5880, 3}, {5900, 2}}, fabricarQuantidade = 1, tempo = 3, experiencia = 25, pontos = 2, chanceSucesso = 8000, aprender = 0, atributos = {armadura = {1, 3}}},--300
			{item = 2486, nivel = 2, nivelJogador = 20, ferramenta = 2422, materiais = {{2463, 1}, {5911, 5}, {5914, 5}}, fabricarQuantidade = 1, tempo = 5, experiencia = 40, pontos = 3, chanceSucesso = 5000, aprender = 0, atributos = {armadura = {1, 3}}},--400
			{item = 2476, nivel = 5, nivelJogador = 40, ferramenta = 2422, materiais = {{2463, 1}, {5880, 10}}, fabricarQuantidade = 1, tempo = 10, experiencia = 80, pontos = 10, chanceSucesso = 4000, aprender = 0, atributos = {armadura = {1, 3}}},--600
			-- {item = 8891, nivel = 20, nivelJogador = 1, ferramenta = 2422, materiais = {{2463, 1}, {12425, 5}, {5887, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {armadura = {0, 3}}},
			{item = 8877, nivel = 8, nivelJogador = 60, ferramenta = 2422, materiais = {{2463, 1}, {8299, 10}, {5880, 10}}, fabricarQuantidade = 1, tempo = 15, experiencia = 230, pontos = 15, chanceSucesso = 3000, maxChanceSucesso = 5000, aprender = 0, atributos = {armadura = {1, 2}}},--900
			-- {item = 8887, nivel = 20, nivelJogador = 1, ferramenta = 2422, materiais = {{2463, 1}, {13028, 5}, {5880, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {armadura = {0, 3}}},
			{item = 2500, nivel = 15, nivelJogador = 1, ferramenta = 2422, materiais = {{2463, 1}, {7249, 2}, {12399, 5}}, fabricarQuantidade = 1, tempo = 15, experiencia = 350, pontos = 65, chanceSucesso = 1500, maxChanceSucesso = 3000, aprender = 0, atributos = {armadura = {1, 2}}},--300
			-- {item = 2487, nivel = 40, nivelJogador = 1, ferramenta = 2422, materiais = {{2463, 1}, {5887, 2}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {armadura = {0, 3}}},
			{item = 8878, nivel = 8, nivelJogador = 60, ferramenta = 2422, materiais = {{2463, 1}, {8302, 5}, {5880, 10}}, fabricarQuantidade = 1, tempo = 15, experiencia = 230, pontos = 15, chanceSucesso = 3000, maxChanceSucesso = 5000, aprender = 0, atributos = {armadura = {1, 2}}},--900
			-- {item = 8885, nivel = 20, nivelJogador = 1, ferramenta = 2422, materiais = {{2463, 1}, {8301, 5}, {5880, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {armadura = {0, 3}}},
			-- {item = 8886, nivel = 20, nivelJogador = 1, ferramenta = 2422, materiais = {{2463, 1}, {18425, 5}, {5880, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {armadura = {0, 3}}},
			-- {item = 8879, nivel = 20, nivelJogador = 1, ferramenta = 2422, materiais = {{2463, 1}, {8303, 5}, {5880, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {armadura = {0, 3}}},
			{item = 8880, nivel = 9, nivelJogador = 70, ferramenta = 2422, materiais = {{2463, 1}, {7736, 5}, {5880, 10}}, fabricarQuantidade = 1, tempo = 15, experiencia = 225, pontos = 26, chanceSucesso = 2500, maxChanceSucesso = 4500, aprender = 0, atributos = {armadura = {1, 2}}},--750
			-- {item = 11301, nivel = 50, nivelJogador = 1, ferramenta = 2422, materiais = {{2463, 1}, {5876, 5}, {11332, 1}, {5880, 5}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {armadura = {0, 3}}},
			-- {item = 2466, nivel = 50, nivelJogador = 1, ferramenta = 2444, materiais = {{2463, 1}, {15515, 3}, {5904, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {armadura = {0, 3}}},
			-- {item = 8889, nivel = 20, nivelJogador = 1, ferramenta = 2422, materiais = {{2463, 1}, {21446, 5}, {11233, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {armadura = {0, 3}}},
			-- {item = 8881, nivel = 20, nivelJogador = 1, ferramenta = 2422, materiais = {{2463, 1}, {10553, 5}, {5880, 1}, {10574, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {armadura = {0, 3}}},
			-- {item = 12607, nivel = 65, nivelJogador = 1, ferramenta = 2434, materiais = {{2463, 1}, {5881, 10}, {12616, 5}, {12629, 5}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {armadura = {0, 3}}},
			-- {item = 2492, nivel = 70, nivelJogador = 1, ferramenta = 2434, materiais = {{2463, 1}, {5920, 10}, {5882, 5}, {5889, 3}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {armadura = {0, 3}}},
			-- {item = 8882, nivel = 20, nivelJogador = 1, ferramenta = 2422, materiais = {{2463, 1}, {5930, 5}, {5880, 1}, {10574, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {armadura = {0, 3}}},
			-- {item = 18404, nivel = 75, nivelJogador = 1, ferramenta = 7450, materiais = {{2463, 1}, {11227, 1}, {18422, 5}, {18423, 2}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {armadura = {0, 3}}},
			-- {item = 8884, nivel = 20, nivelJogador = 1, ferramenta = 2422, materiais = {{2463, 1}, {10583, 5}, {5880, 1}, {10574, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {armadura = {0, 3}}},
			-- {item = 8888, nivel = 20, nivelJogador = 1, ferramenta = 2422, materiais = {{2463, 1}, {12439, 5}, {7443, 1}, {5887, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {armadura = {0, 3}}},
			-- {item = 8883, nivel = 20, nivelJogador = 1, ferramenta = 2422, materiais = {{2463, 1}, {10582, 5}, {5880, 1}, {10574, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {armadura = {0, 3}}},
			{item = 15407, nivel = 15, nivelJogador = 120, ferramenta = 2321, materiais = {{2463, 1}, {15455, 20}, {15430, 10}, {5880, 10}}, fabricarQuantidade = 1, tempo = 20, experiencia = 370, pontos = 75, chanceSucesso = 1000, maxChanceSucesso = 2500, aprender = 0, atributos = {armadura = {1, 3}}},--5300
			-- {item = 2494, nivel = 50, nivelJogador = 1, ferramenta = 2421, materiais = {{2463, 1}, {6558, 10}, {5954, 5}, {5888, 3}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {armadura = {0, 3}}},
			-- {item = 15406, nivel = 80, nivelJogador = 1, ferramenta = 7450, materiais = {{2463, 1}, {15434, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {armadura = {0, 3}}},
			-- {item = 12642, nivel = 65, nivelJogador = 1, ferramenta = 2434, materiais = {{2463, 1}, {5881, 10}, {12616, 5}, {12615, 5}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {armadura = {0, 3}}},
			-- {item = 21706, nivel = 20, nivelJogador = 1, ferramenta = 2422, materiais = {{2463, 1}, {21705, 10}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {armadura = {0, 3}}},

			-- Cal�as
			-- {item = 15490, nivel = 20, nivelJogador = 1, ferramenta = 2422, materiais = {{15479, 10}, {15622, 10}, {15484, 10}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {armadura = {0, 3}}},
			{item = 2504, nivel = 1, nivelJogador = 10, ferramenta = 2422, materiais = {{2647, 1}, {5880, 2}, {5900, 2}}, fabricarQuantidade = 1, tempo = 3, experiencia = 20, pontos = 2, chanceSucesso = 8000, aprender = 0, atributos = {armadura = {1, 3}}},--230
			{item = 15409, nivel = 20, nivelJogador = 100, ferramenta = 2321, materiais = {{2647, 1}, {15426, 5}, {15430, 10}, {5880, 5}}, fabricarQuantidade = 1, tempo = 25, experiencia = 1300, pontos = 180, chanceSucesso = 1500, maxChanceSucesso = 3500, aprender = 0, atributos = {armadura = {1, 2}}},--1580
			-- {item = 2488, nivel = 40, nivelJogador = 1, ferramenta = 2422, materiais = {{2647, 1}, {5887, 2}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {armadura = {0, 3}}},
			-- {item = 15412, nivel = 80, nivelJogador = 1, ferramenta = 7450, materiais = {{2647, 1}, {15436, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {armadura = {0, 3}}},
			{item = 2477, nivel = 6, nivelJogador = 40, ferramenta = 2422, materiais = {{2647, 1}, {5880, 10}}, fabricarQuantidade = 1, tempo = 10, experiencia = 100, pontos = 10, chanceSucesso = 5000, aprender = 0, atributos = {armadura = {1, 3}}},--580
			-- {item = 18405, nivel = 75, nivelJogador = 1, ferramenta = 7450, materiais = {{2647, 1}, {11227, 1}, {18422, 5}, {18423, 2}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {armadura = {0, 3}}},
			-- {item = 11304, nivel = 50, nivelJogador = 1, ferramenta = 2422, materiais = {{2647, 1}, {5876, 5}, {11330, 1}, {5880, 5}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {armadura = {0, 3}}},
			-- {item = 2470, nivel = 50, nivelJogador = 1, ferramenta = 2444, materiais = {{2647, 1}, {15515, 3}, {5904, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {armadura = {0, 3}}},
			-- {item = 2495, nivel = 20, nivelJogador = 1, ferramenta = 2422, materiais = {{9820, 1}, {5954, 10}, {5888, 10}, {9941, 10}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {armadura = {0, 3}}},
			-- {item = 2469, nivel = 20, nivelJogador = 1, ferramenta = 2422, materiais = {{9820, 1}, {5954, 10}, {5888, 10}, {9941, 10}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {armadura = {0, 3}}},

			-- Cal�ados
			-- {item = 11303, nivel = 50, nivelJogador = 1, ferramenta = 2422, materiais = {{9817, 1}, {5876, 5}, {11326, 1}, {5880, 5}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {armadura = {0, 3}}},
			-- {item = 18406, nivel = 75, nivelJogador = 1, ferramenta = 7450, materiais = {{9817, 1}, {11227, 1}, {18422, 5}, {18423, 2}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {armadura = {0, 3}}},
			-- {item = 11117, nivel = 20, nivelJogador = 1, ferramenta = 2422, materiais = {{9817, 1}, {12508, 10}, {8302, 10}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {armadura = {0, 3}}},
			-- {item = 11240, nivel = 20, nivelJogador = 1, ferramenta = 2422, materiais = {{2645, 1}, {5887, 10}, {13757, 10}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {armadura = {0, 3}}},
			-- {item = 12646, nivel = 65, nivelJogador = 1, ferramenta = 2434, materiais = {{12660, 1}, {5881, 10}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {armadura = {0, 3}}},
			-- {item = 2645, nivel = 20, nivelJogador = 1, ferramenta = 2422, materiais = {{9817, 1}, {5892, 10}, {13757, 10}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {armadura = {0, 3}}},
			-- {item = 15410, nivel = 85, nivelJogador = 1, ferramenta = 2321, materiais = {{9817, 1}, {15425, 5}, {15430, 5}, {5880, 5}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {armadura = {0, 3}}},
			-- {item = 5889, nivel = 50, nivelJogador = 1, ferramenta = 2321, materiais = {{5880, 1}, {13757, 1}, {12614, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {armadura = {0, 3}}},

			-- Escudos
			{item = 2540, nivel = 1, nivelJogador = 10, ferramenta = 2321, materiais = {{9814, 1}, {10558, 10}}, fabricarQuantidade = 1, tempo = 3, experiencia = 20, pontos = 2, chanceSucesso = 7000, aprender = 0, atributos = {defesa = {1, 3}}},--230
			{item = 2525, nivel = 1, nivelJogador = 15, ferramenta = 2422, materiais = {{9814, 1}, {5880, 3}, {5900, 1}}, fabricarQuantidade = 1, tempo = 3, experiencia = 30, pontos = 2, chanceSucesso = 8000, aprender = 0, atributos = {defesa = {1, 3}}},--205
			-- {item = 3975, nivel = 2, nivelJogador = 1, ferramenta = 2422, materiais = {{9814, 1}, {19737, 10}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {defesa = {0, 3}}},
			{item = 6131, nivel = 2, nivelJogador = 15, ferramenta = 2422, materiais = {{9814, 1}, {5899, 20}}, fabricarQuantidade = 1, tempo = 4, experiencia = 30, pontos = 3, chanceSucesso = 7000, aprender = 0, atributos = {defesa = {1, 3}}},--330
			-- {item = 3973, nivel = 4, nivelJogador = 1, ferramenta = 2422, materiais = {{9814, 1}, {8614, 10}, {3956, 10}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {defesa = {0, 3}}},
			-- {item = 2518, nivel = 4, nivelJogador = 1, ferramenta = 2422, materiais = {{9814, 1}, {5898, 10}, {2230, 10}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {defesa = {0, 3}}},
			-- {item = 7460, nivel = 4, nivelJogador = 1, ferramenta = 2422, materiais = {{9814, 1}, {7314, 10}, {21401, 10}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {defesa = {0, 3}}},
			{item = 2515, nivel = 5, nivelJogador = 25, ferramenta = 2422, materiais = {{9814, 1}, {2154, 2}, {2158, 2}, {5880, 5}}, fabricarQuantidade = 1, tempo = 7, experiencia = 75, pontos = 5, chanceSucesso = 6000, aprender = 0, atributos = {defesa = {1, 3}}},--730
			-- {item = 8905, nivel = 20, nivelJogador = 1, ferramenta = 2422, materiais = {{9814, 1}, {13213, 10}, {13214, 10}, {13215, 10}, {13196, 10}, {13197, 10}, {13198, 10}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {defesa = {0, 3}}},
			{item = 2516, nivel = 6, nivelJogador = 30, ferramenta = 2434, materiais = {{9814, 1}, {5920, 2}, {12413, 10}, {21401, 10}}, fabricarQuantidade = 1, tempo = 3, experiencia = 100, pontos = 10, chanceSucesso = 5000, aprender = 0, atributos = {defesa = {1, 3}}},--1430
			{item = 21697, nivel = 20, nivelJogador = 1, ferramenta = 7777, materiais = {{9814, 1}, {10578, 10}, {10549, 10}, {8302, 10}}, fabricarQuantidade = 1, tempo = 15, experiencia = 800, pontos = 40, chanceSucesso = 3000, maxChanceSucesso = 5000, aprender = 0, atributos = {defesa = {0, 4}}},--1300
			{item = 2537, nivel = 9, nivelJogador = 1, ferramenta = 2422, materiais = {{9814, 1}, {7249, 10}, {12399, 10}}, fabricarQuantidade = 1, tempo = 10, experiencia = 250, pontos = 20, chanceSucesso = 2000, aprender = 0, atributos = {defesa = {1, 3}}},--730
			-- {item = 2519, nivel = 11, nivelJogador = 50, ferramenta = 2422, materiais = {{9814, 1}, {5887, 2}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {defesa = {0, 3}}},
			{item = 2528, nivel = 12, nivelJogador = 50, ferramenta = 2321, materiais = {{9814, 1}, {5880, 10}, {2159, 20}}, fabricarQuantidade = 1, tempo = 15, experiencia = 300, pontos = 20, chanceSucesso = 4000, aprender = 0, atributos = {defesa = {1, 3}}}, -- 2530
			{item = 2536, nivel = 13, nivelJogador = 60, ferramenta = 2321, materiais = {{9814, 1}, {11226, 30}, {16105, 3}}, fabricarQuantidade = 1, tempo = 10, experiencia = 450, pontos = 30, chanceSucesso = 3500, maxChanceSucesso = 5000, aprender = 0, atributos = {defesa = {1, 3}}}, -- 2580
			-- {item = 15453, nivel = 13, nivelJogador = 70, ferramenta = 2321, materiais = {{9814, 1}, {11226, 30}, {16105, 3}}, fabricarQuantidade = 1, tempo = 10, experiencia = 450, pontos = 30, chanceSucesso = 3500, maxChanceSucesso = 5000, aprender = 0, atributos = {defesa = {1, 3}}}, -- 2580
			-- {item = 21707, nivel = 20, nivelJogador = 1, ferramenta = 7450, materiais = {{9814, 1}, {21695, 10}, {5880, 10}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {defesa = {0, 3}}},
			{item = 2534, nivel = 15, nivelJogador = 75, ferramenta = 2321, materiais = {{9814, 1}, {12405, 30}, {21241, 15}}, fabricarQuantidade = 1, tempo = 7, experiencia = 650, pontos = 40, chanceSucesso = 2000, maxChanceSucesso = 3500, aprender = 0, atributos = {defesa = {1, 3}}}, -- 2580
			-- {item = 2520, nivel = 50, nivelJogador = 1, ferramenta = 2421, materiais = {{9814, 1}, {6558, 10}, {11057, 5}, {5888, 3}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {defesa = {0, 3}}},
			-- {item = 12644, nivel = 65, nivelJogador = 1, ferramenta = 7450, materiais = {{9814, 1}, {12628, 10}, {12629, 5}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {defesa = {0, 3}}},
			-- {item = 15413, nivel = 80, nivelJogador = 1, ferramenta = 7450, materiais = {{9814, 1}, {15435, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {defesa = {0, 4}}},
			-- {item = 2542, nivel = 20, nivelJogador = 1, ferramenta = 2422, materiais = {{9814, 1}, {8303, 10}, {5880, 10}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {defesa = {0, 3}}},
			-- {item = 6391, nivel = 20, nivelJogador = 1, ferramenta = 2422, materiais = {{9814, 1}, {22537, 10}, {22616, 10}, {5880, 10}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {defesa = {0, 3}}},
			-- {item = 6433, nivel = 20, nivelJogador = 100, ferramenta = 2421, materiais = {{9814, 1}, {22474, 1}, {12431, 1}, {21446, 3}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {defesa = {1, 3}}}, -- 2400
			-- {item = 2514, nivel = 20, nivelJogador = 1, ferramenta = 2422, materiais = {{9814, 1}, {5906, 10}, {7440, 10}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {defesa = {0, 3}}},
			-- {item = 18410, nivel = 75, nivelJogador = 1, ferramenta = 7450, materiais = {{9814, 1}, {11227, 1}, {18422, 5}, {18423, 2}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {defesa = {0, 3}}},
			-- {item = 2522, nivel = 70, nivelJogador = 1, ferramenta = 2434, materiais = {{9814, 1}, {5920, 10}, {5882, 5}, {5889, 3}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {defesa = {0, 3}}},
			-- {item = 2523, nivel = 20, nivelJogador = 1, ferramenta = 2422, materiais = {{9814, 1}, {5892, 10}, {8301, 10}, {5887, 10}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {defesa = {0, 3}}},

			-- Espadas de Uma M�o
			{item = 2397, nivel = 1, nivelJogador = 10, ferramenta = 2422, materiais = {{2234, 1}, {5880, 1}}, fabricarQuantidade = 1, tempo = 3, experiencia = 20, pontos = 2, chanceSucesso = 9000, aprender = 0, atributos = {ataque = {0, 3}}},--80
			{item = 2409, nivel = 2, nivelJogador = 10, ferramenta = 2321, materiais = {{2350, 1}, {10611, 10}}, fabricarQuantidade = 1, tempo = 5, experiencia = 40, pontos = 3, chanceSucesso = 8000, aprender = 0, atributos = {ataque = {0, 3}}},--180
			{item = 2419, nivel = 2, nivelJogador = 15, ferramenta = 2321, materiais = {{2385, 1}, {8267, 10}, {13757, 5}}, fabricarQuantidade = 1, tempo = 5, experiencia = 45, pontos = 3, chanceSucesso = 10000, aprender = 0, atributos = {ataque = {0, 3}}},--205
			{item = 8602, nivel = 3, nivelJogador = 15, ferramenta = 2321, materiais = {{2404, 1}, {11192, 5}, {13757, 5}}, fabricarQuantidade = 1, tempo = 5, experiencia = 65, pontos = 5, chanceSucesso = 8000, aprender = 0, atributos = {ataque = {0, 3}}},--280
			{item = 3963, nivel = 5, nivelJogador = 20, ferramenta = 2321, materiais = {{2350, 1}, {5876, 5}, {5880, 5}}, fabricarQuantidade = 1, tempo = 7, experiencia = 120, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {ataque = {1, 3}}},--380
			-- {item = 2392, nivel = 20, nivelJogador = 1, ferramenta = 7758, materiais = {{2350, 1}, {8304, 10}, {5880, 5}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 5}}},
			-- {item = 2383, nivel = 20, nivelJogador = 1, ferramenta = 2422, materiais = {{2350, 1}, {11325, 10}, {5880, 5}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 5}}},
			{item = 20092, nivel = 8, nivelJogador = 25, ferramenta = 2422, materiais = {{2350, 1}, {20089, 5}, {11192, 10}}, fabricarQuantidade = 1, tempo = 7, experiencia = 185, pontos = 20, chanceSucesso = 7000, aprender = 0, atributos = {ataque = {1, 3}}},--530
			-- {item = 7385, nivel = 20, nivelJogador = 1, ferramenta = 2321, materiais = {{2412, 1}, {13530, 10}, {13757, 5}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 5}}},
			{item = 7408, nivel = 10, nivelJogador = 30, ferramenta = 2434, materiais = {{2350, 1}, {10561, 5}, {5880, 5}}, fabricarQuantidade = 1, tempo = 10, experiencia = 250, pontos = 30, chanceSucesso = 6000, maxChanceSucesso = 9000, aprender = 0, atributos = {ataque = {1, 3}}},--580
			{item = 2407, nivel = 12, nivelJogador = 35, ferramenta = 2321, materiais = {{2395, 1}, {11227, 10}, {13757, 5}}, fabricarQuantidade = 1, tempo = 10, experiencia = 280, pontos = 45, chanceSucesso = 10000, aprender = 0, atributos = {ataque = {1, 3}}},--605
			-- {item = 2438, nivel = 13, nivelJogador = 40, ferramenta = 2321, materiais = {{2384, 1}, {11234, 10}, {13757, 5}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 5}}},
			{item = 2451, nivel = 13, nivelJogador = 40, ferramenta = 2422, materiais = {{2351, 1}, {12426, 10}, {13757, 10}}, fabricarQuantidade = 1, tempo = 10, experiencia = 300, pontos = 50, chanceSucesso = 10000, aprender = 0, atributos = {ataque = {1, 3}}},--450
			{item = 7404, nivel = 13, nivelJogador = 40, ferramenta = 2422, materiais = {{2350, 1}, {21242, 10}, {5880, 5}}, fabricarQuantidade = 1, tempo = 10, experiencia = 300, pontos = 50, chanceSucesso = 5000, maxChanceSucesso = 7000, aprender = 0, atributos = {ataque = {1, 3}}},--830
			{item = 2446, nivel = 14, nivelJogador = 45, ferramenta = 7450, materiais = {{2350, 1}, {12422, 10}, {2354, 2}}, fabricarQuantidade = 1, tempo = 10, experiencia = 330, pontos = 50, chanceSucesso = 4000, maxChanceSucesso = 7000, aprender = 0, atributos = {ataque = {1, 3}}},--
			{item = 7383, nivel = 14, nivelJogador = 45, ferramenta = 2321, materiais = {{7385, 1}, {5880, 1}, {13757, 10}}, fabricarQuantidade = 1, tempo = 10, experiencia = 330, pontos = 50, chanceSucesso = 4000, maxChanceSucesso = 7000, aprender = 0, atributos = {ataque = {1, 3}}},--
			-- {item = 13871, nivel = 20, nivelJogador = 1, ferramenta = 2321, materiais = {{2350, 1}, {13546, 10}, {5880, 5}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 5}}},
			{item = 7416, nivel = 14, nivelJogador = 50, ferramenta = 2422, materiais = {{2350, 1}, {12405, 20}, {2178, 10}}, fabricarQuantidade = 1, tempo = 10, experiencia = 330, pontos = 55, chanceSucesso = 4000, maxChanceSucesso = 6000, aprender = 0, atributos = {ataque = {1, 3}}},--1030
			-- {item = 11307, nivel = 20, nivelJogador = 1, ferramenta = 2422, materiais = {{2451, 1}, {12636, 10}, {13757, 5}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 5}}},
			{item = 7384, nivel = 15, nivelJogador = 60, ferramenta = 2321, materiais = {{2350, 1}, {5944, 5}, {5880, 10}}, fabricarQuantidade = 1, tempo = 12, experiencia = 350, pontos = 65, chanceSucesso = 3000, maxChanceSucesso = 5000, aprender = 0, atributos = {ataque = {0, 4}}},--1130
			{item = 7417, nivel = 15, nivelJogador = 60, ferramenta = 2444, materiais = {{2350, 1}, {10549, 10}, {2348, 4}}, fabricarQuantidade = 1, tempo = 12, experiencia = 350, pontos = 65, chanceSucesso = 3000, maxChanceSucesso = 4500, aprender = 0, atributos = {ataque = {0, 4}}},--1630
			-- {item = 7418, nivel = 20, nivelJogador = 1, ferramenta = 7423, materiais = {{2350, 1}, {12436, 10}, {11229, 5}, {9942, 10}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 5}}},
			-- {item = 18450, nivel = 20, nivelJogador = 1, ferramenta = 7422, materiais = {{2350, 1}, {18432, 10}, {9942, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 5}}},
			-- {item = 7390, nivel = 20, nivelJogador = 1, ferramenta = 2321, materiais = {{7383, 1}, {13757, 10}, {9942, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 5}}},
			-- {item = 12649, nivel = 20, nivelJogador = 1, ferramenta = 2422, materiais = {{2350, 1}, {2234, 1}, {12629, 10}, {13757, 10}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 5}}},
			-- {item = 22398, nivel = 20, nivelJogador = 1, ferramenta = 2421, materiais = {{2350, 1}, {22396, 2}, {12505, 10}, {9942, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 5}}},
			-- {item = 2400, nivel = 20, nivelJogador = 1, ferramenta = 2421, materiais = {{2350, 1}, {9743, 5}, {12508, 2}, {9941, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 5}}},
			-- {item = 8930, nivel = 20, nivelJogador = 1, ferramenta = 7422, materiais = {{2350, 1}, {11262, 1}, {2155, 5}, {9941, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 5}}},
			-- {item = 18465, nivel = 20, nivelJogador = 1, ferramenta = 7450, materiais = {{2350, 1}, {11227, 10}, {18423, 5}, {9941, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 5}}},
			-- {item = 22399, nivel = 20, nivelJogador = 1, ferramenta = 2421, materiais = {{22398, 1}, {22396, 2}, {13757, 10}, {9941, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 5}}},
			-- {item = 8931, nivel = 20, nivelJogador = 1, ferramenta = 2421, materiais = {{18465, 1}, {7247, 10}, {10139, 1}, {9980, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 5}}},
			-- {item = 22400, nivel = 20, nivelJogador = 1, ferramenta = 2421, materiais = {{22399, 1}, {22396, 2}, {13757, 10}, {9980, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 5}}},

			-- Espadas de Duas M�os
			{item = 2413, nivel = 1, nivelJogador = 10, ferramenta = 2422, materiais = {{2234, 1}, {5880, 2}}, fabricarQuantidade = 1, tempo = 5, experiencia = 25, pontos = 2, chanceSucesso = 9000, aprender = 0, atributos = {ataque = {0, 4}}},--130
			{item = 2377, nivel = 5, nivelJogador = 20, ferramenta = 2321, materiais = {{2397, 2}, {13757, 3}}, fabricarQuantidade = 1, tempo = 10, experiencia = 130, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {ataque = {0, 4}}},--235
			{item = 11309, nivel = 10, nivelJogador = 30, ferramenta = 2422, materiais = {{2350, 1}, {6097, 1}, {5880, 4}}, fabricarQuantidade = 1, tempo = 12, experiencia = 265, pontos = 30, chanceSucesso = 6000, aprender = 0, atributos = {ataque = {1, 4}}},--320
			-- {item = 7449, nivel = 20, nivelJogador = 30, ferramenta = 2444, materiais = {{2350, 1}, {2234, 10}, {7242, 5}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 7407, nivel = 20, nivelJogador = 40, ferramenta = 7450, materiais = {{2350, 1}, {2234, 10}, {5884, 5}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			{item = 7406, nivel = 13, nivelJogador = 40, ferramenta = 2422, materiais = {{2350, 1}, {5880, 5}, {13757, 5}}, fabricarQuantidade = 1, tempo = 15, experiencia = 320, pontos = 50, chanceSucesso = 4000, maxChanceSucesso = 7000, aprender = 0, atributos = {ataque = {1, 4}}},--405
			-- {item = 7386, nivel = 20, nivelJogador = 50, ferramenta = 2422, materiais = {{2350, 1}, {21400, 1}, {5880, 10}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			{item = 7402, nivel = 15, nivelJogador = 60, ferramenta = 2434, materiais = {{2350, 1}, {10020, 5}, {5919, 1}}, fabricarQuantidade = 1, tempo = 20, experiencia = 370, pontos = 65, chanceSucesso = 3000, maxChanceSucesso = 6000, aprender = 0, atributos = {ataque = {0, 5}}},--930
			-- {item = 11306, nivel = 20, nivelJogador = 1, ferramenta = 2422, materiais = {{2350, 1}, {11309, 1}, {13757, 10}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 7391, nivel = 20, nivelJogador = 1, ferramenta = 2321, materiais = {{7386, 1}, {12508, 3}, {13757, 5}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 2393, nivel = 20, nivelJogador = 1, ferramenta = 2422, materiais = {{2350, 1}, {12508, 3}, {10574, 5}, {5880, 10}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 7382, nivel = 20, nivelJogador = 1, ferramenta = 2422, materiais = {{2350, 1}, {6558, 5}, {12505, 5}, {9942, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 12613, nivel = 20, nivelJogador = 1, ferramenta = 2421, materiais = {{12617, 1}, {5880, 10}, {9942, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 7403, nivel = 20, nivelJogador = 1, ferramenta = 2422, materiais = {{2350, 1}, {20129, 5}, {20106, 5}, {9942, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 7405, nivel = 20, nivelJogador = 1, ferramenta = 2422, materiais = {{7391, 1}, {9743, 3}, {13757, 10}, {9942, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 6528, nivel = 20, nivelJogador = 1, ferramenta = 2421, materiais = {{2350, 1}, {15485, 10}, {12505, 5}, {9942, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 22401, nivel = 20, nivelJogador = 1, ferramenta = 2421, materiais = {{2350, 1}, {22396, 2}, {12505, 10}, {9942, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 8932, nivel = 20, nivelJogador = 1, ferramenta = 7450, materiais = {{2350, 1}, {22598, 3}, {5892, 3}, {9941, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 22402, nivel = 20, nivelJogador = 1, ferramenta = 2421, materiais = {{22401, 1}, {22396, 2}, {13757, 10}, {9941, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 2408, nivel = 20, nivelJogador = 1, ferramenta = 2421, materiais = {{2350, 1}, {21399, 1}, {13757, 10}, {9980, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 22403, nivel = 20, nivelJogador = 1, ferramenta = 2421, materiais = {{22402, 1}, {22396, 2}, {13757, 10}, {9980, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 2390, nivel = 20, nivelJogador = 1, ferramenta = 2421, materiais = {{2400, 1}, {11260, 1}, {21251, 2}, {13757, 10}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},

			-- Machados de Uma M�o
			{item = 2441, nivel = 1, nivelJogador = 10, ferramenta = 2422, materiais = {{2559, 1}, {5880, 1}}, fabricarQuantidade = 1, tempo = 3, experiencia = 20, pontos = 2, chanceSucesso = 9000, aprender = 0, atributos = {ataque = {0, 3}}},--80
			{item = 8601, nivel = 3, nivelJogador = 15, ferramenta = 2422, materiais = {{2386, 1}, {5880, 1}, {13757, 3}}, fabricarQuantidade = 1, tempo = 5, experiencia = 65, pontos = 5, chanceSucesso = 10000, aprender = 0, atributos = {ataque = {0, 3}}},--125
			{item = 2428, nivel = 5, nivelJogador = 20, ferramenta = 2422, materiais = {{2559, 1}, {11113, 10}, {5880, 2}}, fabricarQuantidade = 1, tempo = 7, experiencia = 120, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {ataque = {1, 3}}},--180
			-- {item = 2432, nivel = 20, nivelJogador = 1, ferramenta = 7758, materiais = {{2559, 1}, {8304, 10}, {5880, 5}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			{item = 2429, nivel = 7, nivelJogador = 25, ferramenta = 2422, materiais = {{2559, 1}, {7290, 1}, {5880, 5}}, fabricarQuantidade = 1, tempo = 7, experiencia = 175, pontos = 18, chanceSucesso = 7000, aprender = 0, atributos = {ataque = {1, 3}}},--295
			{item = 2435, nivel = 9, nivelJogador = 30, ferramenta = 2321, materiais = {{2559, 1}, {5900, 10}, {5880, 2}}, fabricarQuantidade = 1, tempo = 7, experiencia = 220, pontos = 25, chanceSucesso = 7000, aprender = 0, atributos = {ataque = {1, 3}}},--380
			{item = 2430, nivel = 11, nivelJogador = 35, ferramenta = 2422, materiais = {{8601, 1}, {5880, 4}, {13757, 5}}, fabricarQuantidade = 1, tempo = 10, experiencia = 265, pontos = 38, chanceSucesso = 6000, maxChanceSucesso = 9000, aprender = 0, atributos = {ataque = {1, 3}}},--445
			{item = 3962, nivel = 11, nivelJogador = 35, ferramenta = 7450, materiais = {{8601, 1}, {11199, 1}, {13757, 10}}, fabricarQuantidade = 1, tempo = 10, experiencia = 265, pontos = 38, chanceSucesso = 5500, maxChanceSucesso = 8500, aprender = 0, atributos = {ataque = {1, 3}}},--450
			-- {item = 7456, nivel = 20, nivelJogador = 1, ferramenta = 2321, materiais = {{2559, 1}, {21245, 10}, {5887, 5}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 7419, nivel = 20, nivelJogador = 1, ferramenta = 2321, materiais = {{2559, 1}, {6558, 10}, {5954, 5}, {5880, 10}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 7412, nivel = 20, nivelJogador = 1, ferramenta = 2422, materiais = {{2559, 1}, {13530, 10}, {5880, 5}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			{item = 7411, nivel = 14, nivelJogador = 50, ferramenta = 2422, materiais = {{2559, 1}, {10549, 5}, {5880, 6}}, fabricarQuantidade = 1, tempo = 10, experiencia = 330, pontos = 55, chanceSucesso = 4000, maxChanceSucesso = 7000, aprender = 0, atributos = {ataque = {1, 3}}},--630
			-- {item = 15451, nivel = 20, nivelJogador = 1, ferramenta = 2422, materiais = {{2559, 1}, {12438, 10}, {5880, 5}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 7388, nivel = 20, nivelJogador = 1, ferramenta = 2321, materiais = {{2559, 1}, {11366, 10}, {5880, 5}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 7389, nivel = 20, nivelJogador = 1, ferramenta = 2321, materiais = {{7456, 1}, {10135, 10}, {13757, 5}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 7433, nivel = 20, nivelJogador = 1, ferramenta = 2321, materiais = {{2559, 1}, {10134, 10}, {5880, 5}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 15492, nivel = 20, nivelJogador = 1, ferramenta = 7450, materiais = {{2559, 1}, {15483, 10}, {9942, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 7420, nivel = 20, nivelJogador = 1, ferramenta = 7450, materiais = {{2559, 1}, {6500, 10}, {10577, 5}, {9942, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 7434, nivel = 20, nivelJogador = 1, ferramenta = 7450, materiais = {{2559, 1}, {10140, 10}, {12505, 5}, {9942, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 7455, nivel = 20, nivelJogador = 1, ferramenta = 7450, materiais = {{2559, 1}, {11227, 10}, {12505, 5}, {9942, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 22404, nivel = 20, nivelJogador = 1, ferramenta = 2421, materiais = {{2559, 1}, {22396, 10}, {12505, 5}, {9942, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 15404, nivel = 20, nivelJogador = 1, ferramenta = 7422, materiais = {{2559, 1}, {10133, 10}, {12505, 5}, {9941, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 7435, nivel = 20, nivelJogador = 1, ferramenta = 7422, materiais = {{2559, 1}, {5809, 10}, {12505, 5}, {9941, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 2431, nivel = 20, nivelJogador = 1, ferramenta = 7422, materiais = {{2559, 1}, {1294, 10}, {10141, 5}, {9941, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 18451, nivel = 20, nivelJogador = 1, ferramenta = 7422, materiais = {{2559, 1}, {18432, 10}, {11227, 5}, {9941, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 8924, nivel = 20, nivelJogador = 1, ferramenta = 2421, materiais = {{7388, 1}, {20131, 10}, {11233, 5}, {6558, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 22405, nivel = 20, nivelJogador = 1, ferramenta = 2421, materiais = {{22404, 1}, {22396, 10}, {13757, 5}, {9941, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 8925, nivel = 20, nivelJogador = 1, ferramenta = 7450, materiais = {{2431, 1}, {11400, 10}, {11258, 5}, {9980, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 22406, nivel = 20, nivelJogador = 1, ferramenta = 2421, materiais = {{22405, 1}, {22396, 10}, {13757, 5}, {9980, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},

			-- Machados de Duas M�os
			{item = 2378, nivel = 1, nivelJogador = 15, ferramenta = 2422, materiais = {{2559, 2}, {5880, 2}}, fabricarQuantidade = 1, tempo = 5, experiencia = 25, pontos = 2, chanceSucesso = 9000, aprender = 0, atributos = {ataque = {0, 4}}},--160
			-- {item = 3964, nivel = 20, nivelJogador = 1, ferramenta = 2321, materiais = {{11335, 1}, {6107, 1}, {2174, 10}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			{item = 2425, nivel = 7, nivelJogador = 25, ferramenta = 2321, materiais = {{2404, 1}, {6107, 1}, {5880, 3}}, fabricarQuantidade = 1, tempo = 10, experiencia = 180, pontos = 18, chanceSucesso = 7000, aprender = 0, atributos = {ataque = {0, 4}}},--
			{item = 2387, nivel = 11, nivelJogador = 35, ferramenta = 2422, materiais = {{2378, 1}, {5880, 2}, {13757, 2}}, fabricarQuantidade = 1, tempo = 12, experiencia = 270, pontos = 35, chanceSucesso = 6000, aprender = 0, atributos = {ataque = {1, 4}}},--310
			{item = 2381, nivel = 11, nivelJogador = 35, ferramenta = 2422, materiais = {{6107, 1}, {10585, 10}}, fabricarQuantidade = 1, tempo = 12, experiencia = 270, pontos = 35, chanceSucesso = 6000, maxChanceSucesso = 9000, aprender = 0, atributos = {ataque = {1, 4}}},--530
			-- {item = 13838, nivel = 20, nivelJogador = 1, ferramenta = 2321, materiais = {{2548, 1}, {5880, 10}, {13757, 5}, {9971, 2}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			{item = 11323, nivel = 12, nivelJogador = 40, ferramenta = 2422, materiais = {{11335, 5}, {6107, 1}, {5876, 20}}, fabricarQuantidade = 1, tempo = 12, experiencia = 290, pontos = 42, chanceSucesso = 6000, maxChanceSucesso = 9000, aprender = 0, atributos = {ataque = {1, 4}}},--580
			{item = 2440, nivel = 13, nivelJogador = 45, ferramenta = 2422, materiais = {{2559, 1}, {2441, 1}, {5880, 10}}, fabricarQuantidade = 1, tempo = 15, experiencia = 315, pontos = 49, chanceSucesso = 5000, maxChanceSucesso = 8000, aprender = 0, atributos = {ataque = {1, 4}}},--690
			{item = 2426, nivel = 13, nivelJogador = 45, ferramenta = 2321, materiais = {{11335, 5}, {6107, 1}, {5877, 7}}, fabricarQuantidade = 1, tempo = 15, experiencia = 315, pontos = 49, chanceSucesso = 5000, maxChanceSucesso = 8000, aprender = 0, atributos = {ataque = {1, 4}}},--880
			{item = 7454, nivel = 14, nivelJogador = 50, ferramenta = 2422, materiais = {{2559, 1}, {11228, 10}, {5880, 10}}, fabricarQuantidade = 1, tempo = 15, experiencia = 335, pontos = 58, chanceSucesso = 4000, maxChanceSucesso = 7000, aprender = 0, atributos = {ataque = {1, 4}}},--880
			-- {item = 7380, nivel = 20, nivelJogador = 1, ferramenta = 2422, materiais = {{2559, 1}, {7371, 10}, {5880, 5}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 7413, nivel = 20, nivelJogador = 1, ferramenta = 7450, materiais = {{2387, 1}, {5893, 10}, {5880, 5}, {13757, 10}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 7436, nivel = 20, nivelJogador = 1, ferramenta = 2421, materiais = {{2559, 1}, {20130, 10}, {5880, 5}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			{item = 2447, nivel = 16, nivelJogador = 1, ferramenta = 2321, materiais = {{2559, 2}, {2146, 30}}, fabricarQuantidade = 1, tempo = 20, experiencia = 20, pontos = 70, chanceSucesso = 3000, maxChanceSucesso = 6000, aprender = 0, atributos = {ataque = {0, 5}}},--1560
			-- {item = 2427, nivel = 20, nivelJogador = 1, ferramenta = 2321, materiais = {{2381, 1}, {11333, 10}, {5880, 5}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			{item = 15454, nivel = 17, nivelJogador = 1, ferramenta = 2422, materiais = {{2559, 1}, {6107, 1}, {15423, 5}}, fabricarQuantidade = 1, tempo = 20, experiencia = 435, pontos = 90, chanceSucesso = 3000, maxChanceSucesso = 6000, aprender = 0, atributos = {ataque = {0, 5}}},--1530
			-- {item = 2414, nivel = 20, nivelJogador = 1, ferramenta = 2434, materiais = {{2426, 1}, {18526, 10}, {5919, 5}, {9942, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 11305, nivel = 20, nivelJogador = 1, ferramenta = 2321, materiais = {{11323, 1}, {11259, 1}, {12505, 5}, {9942, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 2454, nivel = 20, nivelJogador = 1, ferramenta = 2422, materiais = {{7436, 1}, {10571, 10}, {12505, 5}, {9942, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 2443, nivel = 20, nivelJogador = 1, ferramenta = 2321, materiais = {{2559, 1}, {2418, 1}, {12505, 5}, {9942, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 6553, nivel = 1, nivelJogador = 1, ferramenta = 2422, materiais = {{8601, 2}, {5888, 5}, {9942, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 7453, nivel = 20, nivelJogador = 1, ferramenta = 7450, materiais = {{2559, 1}, {2136, 1}, {12505, 5}, {9942, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 22407, nivel = 20, nivelJogador = 1, ferramenta = 2421, materiais = {{2559, 1}, {22396, 2}, {12505, 5}, {9942, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 2415, nivel = 20, nivelJogador = 1, ferramenta = 2422, materiais = {{7454, 1}, {5887, 10}, {13757, 5}, {9941, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 22408, nivel = 20, nivelJogador = 1, ferramenta = 2421, materiais = {{22407, 1}, {22396, 2}, {13757, 5}, {9941, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 8926, nivel = 20, nivelJogador = 1, ferramenta = 2321, materiais = {{7380, 1}, {5906, 10}, {13757, 5}, {9980, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 22409, nivel = 20, nivelJogador = 1, ferramenta = 2421, materiais = {{22408, 1}, {22396, 2}, {13757, 5}, {9980, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},

			-- Clavas de Uma M�o
			{item = 20104, nivel = 1, nivelJogador = 10, ferramenta = 2422, materiais = {{20102, 8}, {20103, 10}}, fabricarQuantidade = 1, tempo = 3, experiencia = 20, pontos = 2, chanceSucesso = 9000, aprender = 0, atributos = {ataque = {0, 3}}},--30
			{item = 2439, nivel = 2, nivelJogador = 15, ferramenta = 2422, materiais = {{6107, 1}, {5880, 1}}, fabricarQuantidade = 1, tempo = 3, experiencia = 42, pontos = 3, chanceSucesso = 9000, aprender = 0, atributos = {ataque = {0, 3}}},--80
			{item = 2417, nivel = 3, nivelJogador = 20, ferramenta = 2422, materiais = {{2556, 1}, {5880, 2}}, fabricarQuantidade = 1, tempo = 3, experiencia = 65, pontos = 5, chanceSucesso = 9000, aprender = 0, atributos = {ataque = {0, 3}}},--130
			{item = 3966, nivel = 4, nivelJogador = 20, ferramenta = 2422, materiais = {{6107, 1}, {12467, 3}, {5880, 1}}, fabricarQuantidade = 1, tempo = 5, experiencia = 87, pontos = 7, chanceSucesso = 8000, aprender = 0, atributos = {ataque = {0, 3}}},--140
			{item = 2394, nivel = 5, nivelJogador = 25, ferramenta = 2422, materiais = {{2556, 1}, {11325, 1}, {5880, 2}}, fabricarQuantidade = 1, tempo = 5, experiencia = 120, pontos = 9, chanceSucesso = 8000, aprender = 0, atributos = {ataque = {0, 3}}},--215
			{item = 20093, nivel = 6, nivelJogador = 25, ferramenta = 2422, materiais = {{6107, 1}, {11113, 10}, {5880, 3}}, fabricarQuantidade = 1, tempo = 7, experiencia = 145, pontos = 12, chanceSucesso = 8000, aprender = 0, atributos = {ataque = {0, 3}}},--230
			{item = 2423, nivel = 7, nivelJogador = 30, ferramenta = 2422, materiais = {{6107, 1}, {2327, 1}, {5880, 5}}, fabricarQuantidade = 1, tempo = 7, experiencia = 175, pontos = 15, chanceSucesso = 7000, aprender = 0, atributos = {ataque = {0, 3}}},--
			{item = 7381, nivel = 8, nivelJogador = 30, ferramenta = 2321, materiais = {{2556, 1}, {2230, 10}, {11238, 10}}, fabricarQuantidade = 1, tempo = 10, experiencia = 197, pontos = 19, chanceSucesso = 7000, aprender = 0, atributos = {ataque = {0, 3}}},--330
			-- {item = 7432, nivel = 20, nivelJogador = 1, ferramenta = 2422, materiais = {{2556, 1}, {11224, 2}, {5880, 5}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 20139, nivel = 20, nivelJogador = 1, ferramenta = 2422, materiais = {{6107, 1}, {11321, 2}, {5880, 5}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			{item = 2434, nivel = 11, nivelJogador = 40, ferramenta = 2321, materiais = {{2556, 1}, {5920, 1}, {5880, 5}}, fabricarQuantidade = 1, tempo = 10, experiencia = 265, pontos = 32, chanceSucesso = 6000, maxChanceSucesso = 9000, aprender = 0, atributos = {ataque = {1, 3}}},--430
			{item = 7387, nivel = 12, nivelJogador = 40, ferramenta = 2422, materiais = {{6107, 1}, {2145, 5}, {5880, 5}}, fabricarQuantidade = 1, tempo = 10, experiencia = 283, pontos = 40, chanceSucesso = 6000, maxChanceSucesso = 9000, aprender = 0, atributos = {ataque = {1, 3}}},--530
			-- {item = 7430, nivel = 20, nivelJogador = 1, ferramenta = 7758, materiais = {{6107, 1}, {18425, 2}, {5880, 5}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			{item = 2436, nivel = 13, nivelJogador = 45, ferramenta = 2422, materiais = {{6107, 1}, {2229, 6}, {5880, 6}}, fabricarQuantidade = 1, tempo = 10, experiencia = 300, pontos = 45, chanceSucesso = 5000, maxChanceSucesso = 8000, aprender = 0, atributos = {ataque = {1, 3}}},--630
			{item = 7437, nivel = 13, nivelJogador = 45, ferramenta = 2321, materiais = {{2556, 1}, {2146, 7}, {5880, 7}}, fabricarQuantidade = 1, tempo = 10, experiencia = 300, pontos = 45, chanceSucesso = 5000, maxChanceSucesso = 8000, aprender = 0, atributos = {ataque = {1, 3}}},--730
			-- {item = 2445, nivel = 20, nivelJogador = 1, ferramenta = 2321, materiais = {{6107, 1}, {7242, 2}, {5880, 5}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			{item = 7451, nivel = 14, nivelJogador = 50, ferramenta = 2321, materiais = {{6107, 1}, {21446, 1}, {5880, 5}}, fabricarQuantidade = 1, tempo = 10, experiencia = 330, pontos = 55, chanceSucesso = 5000, maxChanceSucesso = 8000, aprender = 0, atributos = {ataque = {1, 3}}},--1080
			{item = 3961, nivel = 14, nivelJogador = 50, ferramenta = 2321, materiais = {{6107, 1}, {11367, 30}, {5880, 15}}, fabricarQuantidade = 1, tempo = 10, experiencia = 330, pontos = 55, chanceSucesso = 5000, maxChanceSucesso = 8000, aprender = 0, atributos = {ataque = {1, 3}}},--1140
			-- {item = 2424, nivel = 20, nivelJogador = 1, ferramenta = 2422, materiais = {{6107, 1}, {12449, 2}, {5880, 5}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			{item = 7409, nivel = 15, nivelJogador = 55, ferramenta = 2422, materiais = {{6107, 1}, {8302, 10}, {5880, 15}}, fabricarQuantidade = 1, tempo = 10, experiencia = 370, pontos = 67, chanceSucesso = 4000, maxChanceSucesso = 7000, aprender = 0, atributos = {ataque = {1, 4}}},--1380
			-- {item = 7410, nivel = 20, nivelJogador = 1, ferramenta = 2321, materiais = {{6107, 1}, {11262, 2}, {5880, 5}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 7415, nivel = 20, nivelJogador = 1, ferramenta = 7423, materiais = {{7409, 1}, {5669, 2}, {5880, 5}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 15647, nivel = 20, nivelJogador = 1, ferramenta = 7422, materiais = {{7452, 1}, {15455, 2}, {12622, 5}, {5880, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 7421, nivel = 20, nivelJogador = 1, ferramenta = 7422, materiais = {{6107, 1}, {11261, 2}, {5880, 5}, {9743, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 7422, nivel = 20, nivelJogador = 1, ferramenta = 2321, materiais = {{2556, 1}, {12651, 2}, {2127, 2}, {9942, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 7429, nivel = 20, nivelJogador = 1, ferramenta = 7450, materiais = {{6107, 1}, {5942, 2}, {8261, 5}, {9942, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 22410, nivel = 20, nivelJogador = 1, ferramenta = 2421, materiais = {{2556, 1}, {22396, 2}, {12505, 5}, {9942, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 7431, nivel = 20, nivelJogador = 1, ferramenta = 7423, materiais = {{2556, 1}, {13830, 2}, {6558, 5}, {9941, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 12648, nivel = 20, nivelJogador = 1, ferramenta = 7450, materiais = {{2556, 1}, {12647, 2}, {9955, 5}, {9941, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 15414, nivel = 20, nivelJogador = 1, ferramenta = 7422, materiais = {{2556, 1}, {15480, 2}, {5887, 5}, {9941, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 2421, nivel = 20, nivelJogador = 1, ferramenta = 7450, materiais = {{2556, 1}, {10137, 2}, {21699, 5}, {9941, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 8928, nivel = 20, nivelJogador = 1, ferramenta = 2321, materiais = {{2556, 1}, {11260, 2}, {13940, 5}, {9941, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 18452, nivel = 20, nivelJogador = 1, ferramenta = 7422, materiais = {{2556, 1}, {18434, 2}, {18433, 5}, {9941, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 22411, nivel = 20, nivelJogador = 1, ferramenta = 2421, materiais = {{22410, 1}, {22396, 2}, {13757, 5}, {9941, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 8927, nivel = 20, nivelJogador = 1, ferramenta = 2421, materiais = {{2556, 1}, {9969, 2}, {5785, 5}, {9980, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 22412, nivel = 20, nivelJogador = 1, ferramenta = 2421, materiais = {{22411, 1}, {22396, 2}, {13757, 5}, {9980, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},

			-- Clavas de Duas M�os
			{item = 7425, nivel = 1, nivelJogador = 10, ferramenta = 2321, materiais = {{6107, 1}, {12428, 2}, {5880, 1}}, fabricarQuantidade = 1, tempo = 5, experiencia = 30, pontos = 2, chanceSucesso = 9000, aprender = 0, atributos = {ataque = {0, 4}}},--100
			{item = 7379, nivel = 7, nivelJogador = 25, ferramenta = 2321, materiais = {{6107, 1}, {2229, 1}, {13757, 1}}, fabricarQuantidade = 1, tempo = 10, experiencia = 180, pontos = 15, chanceSucesso = 7000, aprender = 0, atributos = {ataque = {0, 4}}},--105
			-- {item = 2433, nivel = 20, nivelJogador = 1, ferramenta = 2321, materiais = {{6107, 1}, {7242, 2}, {5880, 5}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			{item = 7424, nivel = 13, nivelJogador = 45, ferramenta = 2321, materiais = {{6107, 1}, {10577, 1}, {5880, 1}}, fabricarQuantidade = 1, tempo = 15, experiencia = 315, pontos = 45, chanceSucesso = 5000, maxChanceSucesso = 8000, aprender = 0, atributos = {ataque = {1, 4}}},--280
			{item = 7452, nivel = 13, nivelJogador = 45, ferramenta = 2422, materiais = {{6107, 1}, {11325, 1}, {5880, 4}}, fabricarQuantidade = 1, tempo = 15, experiencia = 315, pontos = 45, chanceSucesso = 5000, maxChanceSucesso = 8000, aprender = 0, atributos = {ataque = {1, 4}}},--315
			-- {item = 7392, nivel = 20, nivelJogador = 1, ferramenta = 2444, materiais = {{2556, 1}, {12433, 2}, {5880, 5}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			{item = 7426, nivel = 14, nivelJogador = 50, ferramenta = 2422, materiais = {{6107, 1}, {9970, 6}, {21585, 1}}, fabricarQuantidade = 1, tempo = 15, experiencia = 340, pontos = 55, chanceSucesso = 4000, maxChanceSucesso = 7000, aprender = 0, atributos = {ataque = {1, 4}}},--390
			{item = 15400, nivel = 15, nivelJogador = 60, ferramenta = 2321, materiais = {{6107, 1}, {15426, 2}, {5880, 5}}, fabricarQuantidade = 1, tempo = 15, experiencia = 380, pontos = 67, chanceSucesso = 4000, maxChanceSucesso = 7000, aprender = 0, atributos = {ataque = {0, 5}}},--500
			-- {item = 7427, nivel = 20, nivelJogador = 1, ferramenta = 7450, materiais = {{7432, 1}, {13942, 2}, {5880, 5}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			{item = 20108, nivel = 16, nivelJogador = 60, ferramenta = 2422, materiais = {{10564, 5}, {11224, 5}, {5880, 5}}, fabricarQuantidade = 1, tempo = 20, experiencia = 425, pontos = 81, chanceSucesso = 3000, maxChanceSucesso = 6000, aprender = 0, atributos = {ataque = {0, 5}}},--600
			-- {item = 2391, nivel = 20, nivelJogador = 1, ferramenta = 2422, materiais = {{6107, 1}, {12403, 2}, {5880, 5}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			{item = 11308, nivel = 17, nivelJogador = 65, ferramenta = 2422, materiais = {{6107, 1}, {5880, 10}, {13757, 10}}, fabricarQuantidade = 1, tempo = 20, experiencia = 465, pontos = 97, chanceSucesso = 3000, maxChanceSucesso = 6000, aprender = 0, atributos = {ataque = {0, 5}}},--780
			{item = 7428, nivel = 17, nivelJogador = 65, ferramenta = 2421, materiais = {{2394, 1}, {5925, 5}, {2146, 10}}, fabricarQuantidade = 1, tempo = 20, experiencia = 465, pontos = 97, chanceSucesso = 3000, maxChanceSucesso = 6000, aprender = 0, atributos = {ataque = {0, 5}}},--840
			-- {item = 7414, nivel = 20, nivelJogador = 1, ferramenta = 2421, materiais = {{6107, 1}, {6103, 2}, {13758, 5}, {9942, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 2444, nivel = 20, nivelJogador = 1, ferramenta = 2421, materiais = {{2556, 1}, {5809, 2}, {5944, 5}, {9942, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 2452, nivel = 20, nivelJogador = 1, ferramenta = 2421, materiais = {{6107, 1}, {11325, 2}, {9942, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 2453, nivel = 20, nivelJogador = 1, ferramenta = 7450, materiais = {{6107, 1}, {7632, 2}, {10549, 5}, {9942, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 22413, nivel = 20, nivelJogador = 1, ferramenta = 2421, materiais = {{2256, 1}, {22396, 2}, {12505, 5}, {9942, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 7423, nivel = 20, nivelJogador = 1, ferramenta = 2321, materiais = {{2256, 1}, {13529, 2}, {21395, 5}, {9941, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 8929, nivel = 20, nivelJogador = 1, ferramenta = 2421, materiais = {{6107, 1}, {13535, 2}, {12505, 5}, {9941, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 7450, nivel = 20, nivelJogador = 1, ferramenta = 2421, materiais = {{2256, 1}, {7422, 1}, {9981, 5}, {9941, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 22414, nivel = 20, nivelJogador = 1, ferramenta = 2421, materiais = {{22413, 1}, {22396, 2}, {13757, 5}, {9941, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},
			-- {item = 22415, nivel = 20, nivelJogador = 1, ferramenta = 2421, materiais = {{22414, 1}, {22396, 2}, {13757, 5}, {9980, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {ataque = {0, 3}}},

			-- Bestas
			{item = 8849, nivel = 12, nivelJogador = 40, ferramenta = 2558, materiais = {{12407, 1}, {5901, 10}, {12448, 10}}, fabricarQuantidade = 1, tempo = 12, experiencia = 290, pontos = 43, chanceSucesso = 4000, maxChanceSucesso = 6500, aprender = 0},--570
			-- {item = 15644, nivel = 20, nivelJogador = 1, ferramenta = 13115, materiais = {{2455, 1}, {12508, 2}, {10549, 5}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0},
			-- {item = 8850, nivel = 20, nivelJogador = 1, ferramenta = 13115, materiais = {{2455, 1}, {12410, 2}, {5880, 5}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0},
			{item = 21690, nivel = 17, nivelJogador = 65, ferramenta = 13115, materiais = {{2455, 1}, {13758, 10}, {11198, 10}}, fabricarQuantidade = 1, tempo = 20, experiencia = 465, pontos = 97, chanceSucesso = 3000, maxChanceSucesso = 5000, aprender = 0},--1130
			-- {item = 22419, nivel = 20, nivelJogador = 1, ferramenta = 2421, materiais = {{2455, 1}, {22396, 2}, {12505, 5}, {9942, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0},
			{item = 5803, nivel = 19, nivelJogador = 70, ferramenta = 2558, materiais = {{8849, 1}, {5901, 20}, {12503, 5}}, fabricarQuantidade = 1, tempo = 20, experiencia = 550, pontos = 130, chanceSucesso = 2500, maxChanceSucesso = 4000, aprender = 0},--1570~
			-- {item = 8853, nivel = 20, nivelJogador = 1, ferramenta = 13115, materiais = {{2455, 1}, {18447, 2}, {12505, 5}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0},
			-- {item = 18453, nivel = 20, nivelJogador = 1, ferramenta = 13115, materiais = {{2455, 1}, {9743, 2}, {13757, 5}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0},
			-- {item = 8852, nivel = 20, nivelJogador = 1, ferramenta = 13115, materiais = {{2455, 1}, {22613, 2}, {12505, 5}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0},
			-- {item = 22420, nivel = 20, nivelJogador = 1, ferramenta = 2421, materiais = {{22419, 1}, {22396, 2}, {12505, 5}, {9941, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0},
			-- {item = 8851, nivel = 20, nivelJogador = 1, ferramenta = 13115, materiais = {{2455, 1}, {5887, 2}, {9678, 5}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0},
			-- {item = 16111, nivel = 20, nivelJogador = 1, ferramenta = 13115, materiais = {{2455, 1}, {5954, 2}, {5906, 5}, {22537, 5}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0},
			-- {item = 22421, nivel = 20, nivelJogador = 1, ferramenta = 2421, materiais = {{22420, 1}, {22396, 2}, {12505, 5}, {9980, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0},

			-- Arcos
			{item = 8857, nivel = 1, nivelJogador = 10, ferramenta = 2558, materiais = {{5901, 5}, {8860, 5}}, fabricarQuantidade = 1, tempo = 5, experiencia = 30, pontos = 10, chanceSucesso = 8000, aprender = 0},--400
			-- {item = 7438, nivel = 3, nivelJogador = 15, ferramenta = 2558, materiais = {{5901, 5}, {12420, 1}}, fabricarQuantidade = 1, tempo = 5, experiencia = 70, pontos = 10, chanceSucesso = 6500, maxChanceSucesso = 8500, aprender = 0},
			{item = 21696, nivel = 8, nivelJogador = 30, ferramenta = 2558, materiais = {{2456, 1}, {8302, 10}}, fabricarQuantidade = 1, tempo = 10, experiencia = 190, pontos = 10, chanceSucesso = 5000, maxChanceSucesso = 7000, aprender = 0},--630
			-- {item = 13873, nivel = 20, nivelJogador = 1, ferramenta = 13115, materiais = {{2456, 1}, {13546, 2}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0},
			-- {item = 8855, nivel = 20, nivelJogador = 1, ferramenta = 2558, materiais = {{2456, 1}, {10582, 2}, {5879, 5}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0},
			-- {item = 8856, nivel = 20, nivelJogador = 1, ferramenta = 2558, materiais = {{2456, 1}, {5886, 2}, {5879, 5}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0},
			-- {item = 8858, nivel = 20, nivelJogador = 1, ferramenta = 13115, materiais = {{2456, 1}, {7731, 2}, {2122, 5}, {5879, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0},
			-- {item = 22416, nivel = 20, nivelJogador = 1, ferramenta = 2421, materiais = {{2456, 1}, {22396, 2}, {12505, 5}, {9942, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0},
			-- {item = 8854, nivel = 20, nivelJogador = 1, ferramenta = 13115, materiais = {{2456, 1}, {21252, 2}, {5480, 5}, {22540, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0},
			-- {item = 15643, nivel = 20, nivelJogador = 1, ferramenta = 13115, materiais = {{2456, 1}, {15481, 2}, {11370, 5}, {5879, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0},
			-- {item = 18454, nivel = 20, nivelJogador = 1, ferramenta = 13115, materiais = {{2456, 1}, {18434, 2}, {18433, 5}, {5879, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0},
			-- {item = 22417, nivel = 20, nivelJogador = 1, ferramenta = 2421, materiais = {{22416, 1}, {22396, 2}, {12505, 5}, {9941, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0},
			-- {item = 22418, nivel = 20, nivelJogador = 1, ferramenta = 2421, materiais = {{22417, 1}, {22396, 2}, {12505, 5}, {9980, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0},

			-- Dist�ncia (Lan�as/Shurikens)
			-- {item = 3965, nivel = 20, nivelJogador = 1, ferramenta = 2422, materiais = {{2389, 1}, {12425, 2}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0},
			{item = 7378, quantidade = 5, nivel = 5, nivelJogador = 25, ferramenta = 2321, materiais = {{2389, 1}, {5880, 1}, {13757, 1}}, fabricarQuantidade = 1, tempo = 2, experiencia = 10, pontos = 1, chanceSucesso = 9000, aprender = 0},
			{item = 7367, nivel = 15, nivelJogador = 60, ferramenta = 7450, materiais = {{2389, 1}, {21246, 1}}, fabricarQuantidade = 1, tempo = 3, experiencia = 20, pontos = 2, chanceSucesso = 9000, aprender = 0},
			-- {item = 7368, nivel = 20, nivelJogador = 1, ferramenta = 2421, materiais = {{7366, 1}, {8309, 2}, {13530, 5}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0},
			-- {item = 7368, quantidade = 25, nivel = 20, nivelJogador = 1, ferramenta = 2421, materiais = {{7366, 25}, {5887, 2}, {13530, 5}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0},

			-- Muni��o - Flechas (Arrows)
			-- {item = 7840, quantidade = 10, nivel = 20, nivelJogador = 1, ferramenta = 7758, materiais = {{8304, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {}},
			-- {item = 7840, quantidade = 15, nivel = 20, nivelJogador = 1, ferramenta = 7758, materiais = {{2353, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {}},
			-- {item = 7840, quantidade = 25, nivel = 20, nivelJogador = 1, ferramenta = 7758, materiais = {{10553, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {}},
			{item = 7840, quantidade = 50, nivel = 5, nivelJogador = 20, ferramenta = 7758, materiais = {{2156, 1}}, fabricarQuantidade = 1, tempo = 3, experiencia = 100, pontos = 8, chanceSucesso = 9000, aprender = 0},
			-- {item = 18437, quantidade = 10, nivel = 20, nivelJogador = 1, ferramenta = 7868, materiais = {{18396, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {}},
			-- {item = 18437, quantidade = 15, nivel = 20, nivelJogador = 1, ferramenta = 7868, materiais = {{10584, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {}},
			-- {item = 18437, quantidade = 25, nivel = 20, nivelJogador = 1, ferramenta = 7868, materiais = {{10557, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {}},
			-- {item = 18437, quantidade = 50, nivel = 20, nivelJogador = 1, ferramenta = 7868, materiais = {{2155, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {}},
			{item = 7850, quantidade = 30, nivel = 5, nivelJogador = 20, ferramenta = 7868, materiais = {{7736, 1}}, fabricarQuantidade = 1, tempo = 1, experiencia = 10, pontos = 1, chanceSucesso = 9500, aprender = 0},
			-- {item = 7850, quantidade = 10, nivel = 20, nivelJogador = 1, ferramenta = 7868, materiais = {{8305, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {}},
			-- {item = 7850, quantidade = 15, nivel = 20, nivelJogador = 1, ferramenta = 7868, materiais = {{11222, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {}},
			{item = 7850, quantidade = 50, nivel = 5, nivelJogador = 20, ferramenta = 7868, materiais = {{2154, 1}}, fabricarQuantidade = 1, tempo = 3, experiencia = 100, pontos = 8, chanceSucesso = 9000, aprender = 0},
			-- {item = 7838, quantidade = 10, nivel = 20, nivelJogador = 1, ferramenta = 7883, materiais = {{8303, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {}},
			-- {item = 7838, quantidade = 15, nivel = 20, nivelJogador = 1, ferramenta = 7883, materiais = {{8306, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {}},
			-- {item = 7838, quantidade = 25, nivel = 20, nivelJogador = 1, ferramenta = 7883, materiais = {{21699, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {}},
			-- {item = 7838, quantidade = 50, nivel = 20, nivelJogador = 1, ferramenta = 7883, materiais = {{2153, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {}},
			{item = 7839, quantidade = 5, nivel = 5, nivelJogador = 20, ferramenta = 7777, materiais = {{8302, 1}}, fabricarQuantidade = 1, tempo = 1, experiencia = 10, pontos = 1, chanceSucesso = 9500, aprender = 0},
			{item = 7839, quantidade = 15, nivel = 5, nivelJogador = 20, ferramenta = 7777, materiais = {{8300, 1}}, fabricarQuantidade = 1, tempo = 1, experiencia = 30, pontos = 2, chanceSucesso = 9500, aprender = 0},
			{item = 7839, quantidade = 30, nivel = 5, nivelJogador = 20, ferramenta = 7777, materiais = {{10578, 1}}, fabricarQuantidade = 1, tempo = 2, experiencia = 60, pontos = 4, chanceSucesso = 9500, aprender = 0},
			{item = 7839, quantidade = 50, nivel = 5, nivelJogador = 20, ferramenta = 7777, materiais = {{2158, 1}}, fabricarQuantidade = 1, tempo = 3, experiencia = 100, pontos = 8, chanceSucesso = 9000, aprender = 0},
			-- {item = 7364, quantidade = 10, nivel = 20, nivelJogador = 1, ferramenta = 7450, materiais = {{12468, 1}, {2230, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {}},
			-- {item = 15648, quantidade = 5, nivel = 20, nivelJogador = 1, ferramenta = 7450, materiais = {{15480, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {}},
			-- {item = 7365, quantidade = 5, nivel = 20, nivelJogador = 1, ferramenta = 2421, materiais = {{9743, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {}},
			-- {item = 18304, quantidade = {1, 3}, nivel = 20, nivelJogador = 1, ferramenta = 7450, materiais = {{10169, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {}},

			-- Muni��o - Dardos (Bolts)
			-- {item = 7363, quantidade = 10, nivel = 20, nivelJogador = 1, ferramenta = 2321, materiais = {{12428, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {}},
			-- {item = 15649, quantidade = 10, nivel = 20, nivelJogador = 1, ferramenta = 7450, materiais = {{13217, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {}},
			-- {item = 2547, quantidade = 5, nivel = 20, nivelJogador = 1, ferramenta = 2422, materiais = {{5954, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {}},
			{item = 18436, quantidade = 5, nivel = 19, nivelJogador = 70, ferramenta = 2321, materiais = {{11222, 1}}, fabricarQuantidade = 1, tempo = 5, experiencia = 50, pontos = 13, chanceSucesso = 8000, aprender = 0},
			-- {item = 18435, quantidade = 1, nivel = 20, nivelJogador = 1, ferramenta = 7450, materiais = {{11227, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {}},
			-- {item = 18435, quantidade = 1, nivel = 20, nivelJogador = 1, ferramenta = 7450, materiais = {{18422, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {}},
			-- {item = 18435, quantidade = 10, nivel = 20, nivelJogador = 1, ferramenta = 7450, materiais = {{18423, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {}},
			-- {item = 6529, quantidade = {1, 3}, nivel = 20, nivelJogador = 1, ferramenta = 2421, materiais = {{5943, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {}},
		},
		mensagem = "A forja permite voc� criar equipamentos �nicos e poderosos, basta voc� ter os materiais necess�rios para isso.",
		efeitoTrabalhando = CONST_ME_BLOCKHIT,
		efeitoSucesso = CONST_ME_FIREWORK_RED,
		efeitoFalha = CONST_ME_POFF,
		ingredientesMelhoria = {
			{item = 18413, chance = 1500},
			{item = 18414, chance = 1500},
			{item = 18415, chance = 1500},
			{item = 18416, chance = 1000},
			{item = 18417, chance = 1000},
			{item = 18418, chance = 1000},
			{item = 18419, chance = 500},
			{item = 18420, chance = 500},
			{item = 18421, chance = 500}
		},
		extraData = {}
	},
	[21000] = {
		nome = "Alquimista",
		mesaTrabalho = {9909, 9910},
		mesaTrabalhando = {},
		receitas = {
			-- Po��es
			-- {item = 7618, nivel = 1, nivelJogador = 1, ferramenta = 1965, materiais = {{2148, 1}}, fabricarQuantidade = 1, ingredienteSecreto = {2152, 1, 1000}, tempo = 0, experiencia = 100, pontos = 10, chanceSucesso = 5000, aprender = 0, atributos = {health = {50, 60}}},
			-- {item = 21309, nome = "Profession Potion [Profiss�o: Aleat�ria]", nivel = 1, nivelJogador = 1, ferramenta = 1965, materiais = {{2148, 1}}, tempo = 0, experiencia = 100, pontos = 10, chanceSucesso = 10000, aprender = 0, atributos = {profissao = 1, chance = {8, 13}}},
			-- {item = 21309, nome = "Profession Potion [Profiss�o: Alquimista]", nivel = 1, nivelJogador = 1, ferramenta = 1965, materiais = {{2148, 1}}, tempo = 0, experiencia = 100, pontos = 10, chanceSucesso = 10000, aprender = 0, atributos = {profissao = "alquimista", chance = {8, 13}}},
			-- {item = 21309, nome = "Profession Potion [Profiss�o: Alfaiate]", nivel = 1, nivelJogador = 1, ferramenta = 1965, materiais = {{2148, 1}}, tempo = 0, experiencia = 100, pontos = 10, chanceSucesso = 10000, aprender = 0, atributos = {profissao = "alfaiate", chance = {8, 13}}},
			-- {item = 21309, nome = "Profession Potion [Profiss�o: Cozinheiro]", nivel = 1, nivelJogador = 1, ferramenta = 1965, materiais = {{2148, 1}}, tempo = 0, experiencia = 100, pontos = 10, chanceSucesso = 10000, aprender = 0, atributos = {profissao = "cozinheiro", chance = {8, 13}}},
			-- {item = 21309, nome = "Profession Potion [Profiss�o: Ferreiro]", nivel = 1, nivelJogador = 1, ferramenta = 1965, materiais = {{2148, 1}}, tempo = 0, experiencia = 100, pontos = 10, chanceSucesso = 10000, aprender = 0, atributos = {profissao = "ferreiro", chance = {8, 13}}},
			-- {item = 21426, nivel = 1, nivelJogador = 1, ferramenta = 1965, materiais = {{2148, 1}}, tempo = 0, experiencia = 100, pontos = 10, chanceSucesso = 10000, aprender = 0, atributos = {chance = {8, 13}}},

			-- Armaduras
			-- {item = 12431, nivel = 1, nivelJogador = 1, ferramenta = 11237, materiais = {{2657, 1}}, tempo = 0, experiencia = 100, pontos = 10, chanceSucesso = 10000, aprender = 0},

			-- Spellbooks
			{item = 8900, nivel = 3, nivelJogador = 1, ferramenta = 6533, materiais = {{2175, 1}, {6107, 1}, {12411, 20}}, fabricarQuantidade = 1, tempo = 3, experiencia = 40, pontos = 2, chanceSucesso = 5000, aprender = 0, atributos = {defesa = {0, 2}}},--460
			-- {item = 8901, nivel = 4, nivelJogador = 1, ferramenta = 6533, materiais = {{2175, 1}, {6107, 1}, {2176, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {defesa = {0, 3}}},
			-- {item = 8902, nivel = 6, nivelJogador = 1, ferramenta = 6533, materiais = {{2175, 1}, {6107, 1}, {10580, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {defesa = {0, 3}}},
			-- {item = 8903, nivel = 7, nivelJogador = 1, ferramenta = 11237, materiais = {{2175, 1}, {6107, 1}, {5809, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {defesa = {0, 3}}},
			-- {item = 8904, nivel = 9, nivelJogador = 1, ferramenta = 11237, materiais = {{13529, 1}, {6107, 1}, {5944, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {defesa = {0, 3}}},
			-- {item = 22422, nivel = 11, nivelJogador = 1, ferramenta = 22474, materiais = {{2217, 1}, {22396, 1}, {21246, 1}, {9942, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {defesa = {0, 3}}},
			-- {item = 8918, nivel = 13, nivelJogador = 1, ferramenta = 1976, materiais = {{2217, 1}, {6103, 1}, {11237, 1}, {10103, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {defesa = {0, 3}}},
			-- {item = 18401, nivel = 14, nivelJogador = 1, ferramenta = 11237, materiais = {{2217, 1}, {6107, 1}, {22538, 1}, {18433, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {defesa = {0, 3}}},
			-- {item = 16112, nivel = 16, nivelJogador = 1, ferramenta = 1976, materiais = {{2217, 1}, {11223, 1}, {10605, 1}, {2348, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {defesa = {0, 3}}},
			-- {item = 22423, nivel = 18, nivelJogador = 1, ferramenta = 22474, materiais = {{22422, 1}, {22396, 1}, {21246, 1}, {9941, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {defesa = {0, 3}}},
			-- {item = 22424, nivel = 20, nivelJogador = 1, ferramenta = 22474, materiais = {{22423, 1}, {22396, 1}, {21246, 1}, {9980, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {defesa = {0, 3}}},

			-- Wands
			{item = 2190, nivel = 1, nivelJogador = 1, ferramenta = 6533, materiais = {{7735, 1}}, fabricarQuantidade = 1, tempo = 3, experiencia = 30, pontos = 2, chanceSucesso = 9000, aprender = 0},--30
			{item = 2191, nivel = 2, nivelJogador = 1, ferramenta = 6533, materiais = {{7735, 1}}, fabricarQuantidade = 1, tempo = 3, experiencia = 50, pontos = 3, chanceSucesso = 9000, aprender = 0},--30
			-- {item = 2188, nivel = 3, nivelJogador = 1, ferramenta = 11237, materiais = {{7735, 1}, {3955, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {}},
			{item = 8921, nivel = 5, nivelJogador = 1, ferramenta = 6533, materiais = {{2191, 1}, {5920, 1}}, fabricarQuantidade = 1, tempo = 6, experiencia = 100, pontos = 3, chanceSucesso = 5000, aprender = 0}, -- 180
			-- {item = 2189, nivel = 6, nivelJogador = 1, ferramenta = 1976, materiais = {{2190, 1}, {8310, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {}},
			-- {item = 2187, nivel = 8, nivelJogador = 1, ferramenta = 1976, materiais = {{8921, 1}, {2353, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {}},
			-- {item = 8920, nivel = 10, nivelJogador = 1, ferramenta = 1976, materiais = {{2189, 1}, {8306, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {}},
			-- {item = 13880, nivel = 12, nivelJogador = 1, ferramenta = 12406, materiais = {{8920, 1}, {8310, 1}, {13546, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {}},
			{item = 8922, nivel = 14, nivelJogador = 1, ferramenta = 22474, materiais = {{2188, 1}, {9019, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {}},
			-- {item = 18390, nivel = 15, nivelJogador = 1, ferramenta = 12406, materiais = {{13880, 1}, {6548, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {}},
			-- {item = 18409, nivel = 18, nivelJogador = 1, ferramenta = 12406, materiais = {{2187, 1}, {6550, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {}},
			-- {item = 13760, nivel = 20, nivelJogador = 1, ferramenta = 22474, materiais = {{7735, 1}, {18457, 10}, {18509, 5}, {6547, 1}, {21395, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0, atributos = {}},

			-- Rods
			{item = 2182, nivel = 1, nivelJogador = 1, ferramenta = 6533, materiais = {{7735, 1}}, fabricarQuantidade = 1, tempo = 3, experiencia = 30, pontos = 2, chanceSucesso = 9000, aprender = 0},--30
			{item = 2186, nivel = 2, nivelJogador = 1, ferramenta = 6533, materiais = {{7735, 1}}, fabricarQuantidade = 1, tempo = 3, experiencia = 50, pontos = 3, chanceSucesso = 9000, aprender = 0},--30
			-- {item = 2185, nivel = 20, nivelJogador = 1, ferramenta = 11237, materiais = {{7735, 1}, {2230, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0},
			{item = 8911, nivel = 5, nivelJogador = 1, ferramenta = 6533, materiais = {{2186, 1}, {7289, 3}}, fabricarQuantidade = 1, tempo = 6, experiencia = 100, pontos = 3, chanceSucesso = 5000, aprender = 0}, -- 180
			-- {item = 2181, nivel = 20, nivelJogador = 1, ferramenta = 1976, materiais = {{2182, 1}, {21310, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0},
			{item = 2183, nivel = 20, nivelJogador = 1, ferramenta = 1976, materiais = {{8911, 1}, {8300, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0},
			-- {item = 8912, nivel = 20, nivelJogador = 1, ferramenta = 1976, materiais = {{2181, 1}, {8298, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0},
			-- {item = 13872, nivel = 20, nivelJogador = 1, ferramenta = 1976, materiais = {{2183, 1}, {7314, 1}, {13546, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0},
			-- {item = 8910, nivel = 20, nivelJogador = 1, ferramenta = 22474, materiais = {{2185, 1}, {5669, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0},
			-- {item = 18411, nivel = 20, nivelJogador = 1, ferramenta = 12406, materiais = {{8912, 1}, {6549, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0},
			-- {item = 18412, nivel = 20, nivelJogador = 1, ferramenta = 12406, materiais = {{13872, 1}, {18412, 1}}, fabricarQuantidade = 1, tempo = 0, experiencia = 10, pontos = 10, chanceSucesso = 1000, maxChanceSucesso = 2000, aprender = 0},
		},
		mensagem = "A alquimia permite voc� criar po��es �nicas e encantamentos poderosos, basta voc� ter os materiais necess�rios para isso.",
		efeitoTrabalhando = CONST_ME_BLOCKHIT,
		efeitoSucesso = CONST_ME_FIREWORK_BLUE,
		efeitoFalha = CONST_ME_POFF,
		ingredientesMelhoria = {
			{item = 22472, chance = 1000},
			{item = 22473, chance = 1500},
		},
		extraData = {}
	},
	[22000] = {
		nome = "Alfaiate",
		mesaTrabalho = {9895, 9898},
		mesaTrabalhando = {9896, 9899},
		receitas = {
			-- Materiais
			{item = 13540, nivel = 5, nivelJogador = 1, ferramenta = 13828, materiais = {{23875, 1}, {9970, 10}, {5914, 5}}, tempo = 3, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0},--750
			{item = 13541, nivel = 5, nivelJogador = 1, ferramenta = 13828, materiais = {{23875, 1}, {2149, 10}, {5910, 5}}, tempo = 3, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0},--750
			{item = 13542, nivel = 5, nivelJogador = 1, ferramenta = 13828, materiais = {{23875, 1}, {2145, 10}, {5913, 5}}, tempo = 3, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0},--750
			{item = 13543, nivel = 5, nivelJogador = 1, ferramenta = 13828, materiais = {{23875, 1}, {2147, 10}, {5911, 5}}, tempo = 3, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0},--750
			{item = 13544, nivel = 5, nivelJogador = 1, ferramenta = 13828, materiais = {{23875, 1}, {2150, 10}, {5911, 5}}, tempo = 3, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0},--750
			{item = 13545, nivel = 5, nivelJogador = 1, ferramenta = 13828, materiais = {{23875, 1}, {2146, 10}, {5912, 5}}, tempo = 3, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0},--750

			-- Capacetes
			{item = 5917, nivel = 1, nivelJogador = 1, ferramenta = 5908, materiais = {{8860, 1}, {10606, 5}}, tempo = 2, experiencia = 30, pontos = 2, chanceSucesso = 9000, aprender = 0, atributos = {defesa = {0, 2}}},--40
			{item = 2663, nivel = 1, nivelJogador = 1, ferramenta = 13828, materiais = {{8860, 1}, {12412, 3}, {5912, 5}}, tempo = 2, experiencia = 30, pontos = 2, chanceSucesso = 9000, aprender = 0, atributos = {defesa = {0, 2}}},--195
			{item = 7458, nivel = 2, nivelJogador = 10, ferramenta = 5908, materiais = {{8860, 1}, {11224, 5}, {11212, 5}}, tempo = 3, experiencia = 45, pontos = 3, chanceSucesso = 8000, aprender = 0, atributos = {defesa = {0, 2}}},--255
			{item = 6096, nivel = 2, nivelJogador = 10, ferramenta = 5908, materiais = {{8860, 1}, {12442, 3}, {10123, 5}}, tempo = 3, experiencia = 45, pontos = 3, chanceSucesso = 8000, aprender = 0, atributos = {defesa = {0, 2}}},--310
			-- {item = 7459, nivel = 1, nivelJogador = 1, ferramenta = 5908, materiais = {{8860, 1}, {7290, 1}, {11209, 1}}, tempo = 2, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {defesa = {0, 3}}},
			{item = 13756, nivel = 3, nivelJogador = 15, ferramenta = 5908, materiais = {{8820, 1}, {5911, 10}, {5914, 5}}, tempo = 3, experiencia = 65, pontos = 5, chanceSucesso = 8000, aprender = 0, atributos = {defesa = {0, 2}}},--480
			{item = 2323, nivel = 5, nivelJogador = 20, ferramenta = 5908, materiais = {{8820, 1}, {13544, 1}, {21243, 5}}, tempo = 5, experiencia = 120, pontos = 10, chanceSucesso = 7000, aprender = 0, atributos = {defesa = {1, 2}}},--900
			-- {item = 10570, nivel = 1, nivelJogador = 1, ferramenta = 5908, materiais = {{8820, 1}, {12404, 1}, {10569, 1}}, tempo = 2, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {armadura = {5, 10}}},
			-- {item = 10016, nivel = 1, nivelJogador = 1, ferramenta = 5908, materiais = {{10570, 1}, {5894, 1}, {13545, 1}}, tempo = 2, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {armadura = {5, 10}}},
			{item = 11368, nivel = 8, nivelJogador = 30, ferramenta = 5908, materiais = {{8860, 1}, {2149, 10}, {21247, 5}}, tempo = 5, experiencia = 185, pontos = 20, chanceSucesso = 6000, aprender = 0, atributos = {defesa = {1, 2}}},--930
			-- {item = 7900, nivel = 1, nivelJogador = 1, ferramenta = 5908, materiais = {{8860, 1}, {21585, 1}, {8304, 1}, {13543, 1}}, tempo = 2, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {defesa = {0, 3}}},
			-- {item = 7902, nivel = 1, nivelJogador = 1, ferramenta = 5908, materiais = {{8860, 1}, {8302, 1}, {12289, 1}, {13545, 1}}, tempo = 2, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {defesa = {0, 3}}},
			-- {item = 7901, nivel = 1, nivelJogador = 1, ferramenta = 5908, materiais = {{8860, 1}, {8303, 1}, {8306, 1}, {13545, 1}}, tempo = 2, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {defesa = {0, 3}}},
			-- {item = 7903, nivel = 1, nivelJogador = 1, ferramenta = 5908, materiais = {{8860, 1}, {8310, 1}, {11222, 1}, {13541, 1}}, tempo = 2, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {defesa = {0, 3}}},
			-- {item = 23536, nivel = 1, nivelJogador = 1, ferramenta = 5908, materiais = {{11236, 1}, {11209, 1}, {5912, 1}, {5910, 1}, {5911, 1}, {5914, 1}}, tempo = 2, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {defesa = {0, 3}}},
			-- {item = 9778, nivel = 1, nivelJogador = 1, ferramenta = 5908, materiais = {{11236, 1}, {5909, 1}, {13540, 1}, {13545, 1}}, tempo = 2, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {defesa = {0, 3}}},
			-- {item = 18398, nivel = 1, nivelJogador = 1, ferramenta = 5908, materiais = {{11236, 1}, {11209, 1}, {5912, 1}, {5910, 1}, {5911, 1}, {5914, 1}}, tempo = 2, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {defesa = {0, 3}}},
			-- {item = 2501, nivel = 1, nivelJogador = 1, ferramenta = 5908, materiais = {{11236, 1}, {11209, 1}, {5912, 1}, {5910, 1}, {5911, 1}, {5914, 1}}, tempo = 2, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {defesa = {0, 3}}},
			-- {item = 2474, nivel = 1, nivelJogador = 1, ferramenta = 5908, materiais = {{11236, 1}, {11209, 1}, {5912, 1}, {5910, 1}, {5911, 1}, {5914, 1}}, tempo = 2, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {defesa = {0, 3}}},

			-- Armaduras
			{item = 6095, nivel = 1, nivelJogador = 1, ferramenta = 5908, materiais = {{8860, 1}, {5909, 1}, {10123, 1}}, tempo = 2, experiencia = 30, pontos = 2, chanceSucesso = 9000, aprender = 0, atributos = {defesa = {0, 3}}},--80
			{item = 8892, nivel = 1, nivelJogador = 5, ferramenta = 5908, materiais = {{8860, 1}, {11224, 1}, {5911, 2}}, tempo = 2, experiencia = 30, pontos = 3, chanceSucesso = 9000, aprender = 0, atributos = {defesa = {0, 3}}},--120
			{item = 8870, nivel = 2, nivelJogador = 10, ferramenta = 5908, materiais = {{8860, 1}, {8819, 1}, {5912, 3}}, tempo = 3, experiencia = 45, pontos = 3, chanceSucesso = 8000, aprender = 0, atributos = {defesa = {0, 3}}},--150
			-- {item = 8871, nivel = 1, nivelJogador = 1, ferramenta = 5908, materiais = {{8860, 1}, {8819, 1}, {11236, 10}}, tempo = 2, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {defesa = {0, 3}}},
			{item = 7463, nivel = 3, nivelJogador = 15, ferramenta = 5908, materiais = {{8860, 1}, {11224, 8}}, tempo = 3, experiencia = 65, pontos = 5, chanceSucesso = 8000, aprender = 0, atributos = {defesa = {0, 3}}},--270
			{item = 8872, nivel = 4, nivelJogador = 20, ferramenta = 5908, materiais = {{8860, 1}, {11224, 10}, {12448, 5}}, tempo = 90, experiencia = 100, pontos = 7, chanceSucesso = 7000, aprender = 0, atributos = {defesa = {0, 3}}},--355
			{item = 2656, nivel = 5, nivelJogador = 25, ferramenta = 5908, materiais = {{8860, 1}, {12414, 1}, {13545, 2}}, tempo = 120, experiencia = 100, pontos = 10, chanceSucesso = 7000, aprender = 0, atributos = {defesa = {1, 3}}},--1600
			-- {item = 8865, nivel = 1, nivelJogador = 1, ferramenta = 5908, materiais = {{8860, 1}, {12431, 1}, {21406, 1}}, tempo = 2, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {defesa = {0, 3}}},
			-- {item = 7897, nivel = 1, nivelJogador = 1, ferramenta = 5908, materiais = {{8860, 1}, {8302, 1}, {12289, 1}, {13545, 1}}, tempo = 2, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {defesa = {0, 3}}},
			-- {item = 7898, nivel = 1, nivelJogador = 1, ferramenta = 5908, materiais = {{8860, 1}, {8303, 1}, {8306, 1}, {13545, 1}}, tempo = 2, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {defesa = {0, 3}}},
			-- {item = 7899, nivel = 1, nivelJogador = 1, ferramenta = 5908, materiais = {{8860, 1}, {21585, 1}, {8304, 1}, {13543, 1}}, tempo = 2, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {defesa = {0, 3}}},
			-- {item = 7884, nivel = 1, nivelJogador = 1, ferramenta = 5908, materiais = {{8860, 1}, {8310, 1}, {11222, 1}, {13541, 1}}, tempo = 2, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {defesa = {0, 3}}},
			-- {item = 11355, nivel = 1, nivelJogador = 1, ferramenta = 5908, materiais = {{11236, 1}, {12429, 1}, {19738, 1}, {13544, 1}}, tempo = 2, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {defesa = {0, 3}}},
			-- {item = 8821, nivel = 1, nivelJogador = 1, ferramenta = 5908, materiais = {{8860, 1}, {12404, 1}, {10602, 1}, {13543, 1}}, tempo = 2, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {defesa = {0, 3}}},
			-- {item = 11356, nivel = 1, nivelJogador = 1, ferramenta = 5908, materiais = {{11236, 1}, {13543, 1}, {5948, 1}, {10553, 1}, {13542, 1}}, tempo = 2, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {defesa = {0, 3}}},
			-- {item = 8869, nivel = 1, nivelJogador = 1, ferramenta = 5908, materiais = {{12501, 1}, {18396, 1}, {8305, 1}, {13758, 1}}, tempo = 2, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {defesa = {0, 3}}},
			-- {item = 21725, nivel = 1, nivelJogador = 1, ferramenta = 5908, materiais = {{12501, 1}, {6500, 1}, {21247, 1}}, tempo = 2, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {defesa = {0, 3}}},
			-- {item = 18399, nivel = 1, nivelJogador = 1, ferramenta = 5908, materiais = {{11236, 1}, {11209, 1}, {5912, 1}, {5910, 1}, {5911, 1}, {5914, 1}}, tempo = 2, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {defesa = {0, 3}}},
			-- {item = 15489, nivel = 1, nivelJogador = 1, ferramenta = 5908, materiais = {{12501, 1}, {15486, 1}, {21247, 1}}, tempo = 2, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {defesa = {0, 3}}},
			-- {item = 8867, nivel = 1, nivelJogador = 1, ferramenta = 5908, materiais = {{12501, 1}, {13543, 1}, {5948, 1}, {5882, 1}, {8304, 1}, {13542, 1}}, tempo = 2, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {defesa = {0, 3}}},
			-- {item = 8866, nivel = 1, nivelJogador = 1, ferramenta = 5908, materiais = {{12501, 1}, {8302, 1}, {22645, 1}, {13545, 1}, {7289, 1}}, tempo = 2, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {defesa = {0, 3}}},
			-- {item = 8890, nivel = 1, nivelJogador = 1, ferramenta = 5908, materiais = {{12501, 1}, {11237, 1}, {21446, 1}, {21405, 1}}, tempo = 2, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {defesa = {0, 3}}},
			-- {item = 12643, nivel = 1, nivelJogador = 1, ferramenta = 5908, materiais = {{11236, 1}, {12614, 1}, {9678, 1}, {21247, 1}, {13540, 1}}, tempo = 2, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {defesa = {0, 3}}},
			-- {item = 8868, nivel = 1, nivelJogador = 1, ferramenta = 5908, materiais = {{12501, 1}, {10601, 1}, {21699, 1}, {13544, 1}}, tempo = 2, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {defesa = {0, 3}}},
			-- {item = 9776, nivel = 1, nivelJogador = 1, ferramenta = 5908, materiais = {{11236, 1}, {5909, 1}, {13540, 1}}, tempo = 2, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {defesa = {0, 3}}},

			-- Cal�as
			{item = 7464, nivel = 1, nivelJogador = 1, ferramenta = 5908, materiais = {{8860, 1}, {11224, 2}}, tempo = 2, experiencia = 30, pontos = 2, chanceSucesso = 9000, aprender = 0, atributos = {defesa = {0, 2}}},--90
			{item = 5918, nivel = 1, nivelJogador = 1, ferramenta = 5908, materiais = {{8860, 1}, {5912, 1}, {10123, 1}}, tempo = 2, experiencia = 30, pontos = 2, chanceSucesso = 9000, aprender = 0, atributos = {defesa = {0, 2}}},--110
			-- {item = 18400, nivel = 1, nivelJogador = 1, ferramenta = 5908, materiais = {{11236, 1}, {11209, 1}, {5912, 1}, {5910, 1}, {5911, 1}, {5914, 1}}, tempo = 2, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {defesa = {0, 3}}},
			{item = 7730, nivel = 5, nivelJogador = 1, ferramenta = 13828, materiais = {{8860, 1}, {13545, 1}}, tempo = 5, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {defesa = {1, 2}}},--800
			-- {item = 21700, nivel = 1, nivelJogador = 1, ferramenta = 5908, materiais = {{8860, 1}, {7290, 1}, {8300, 1}, {13545, 1}, {8302, 1}}, tempo = 2, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {defesa = {0, 3}}},
			-- {item = 7896, nivel = 1, nivelJogador = 1, ferramenta = 5908, materiais = {{8860, 1}, {8302, 1}, {12289, 1}, {13545, 1}}, tempo = 2, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {defesa = {0, 3}}},
			-- {item = 7894, nivel = 1, nivelJogador = 1, ferramenta = 5908, materiais = {{8860, 1}, {21585, 1}, {8304, 1}, {13543, 1}}, tempo = 2, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {defesa = {0, 3}}},
			-- {item = 7895, nivel = 1, nivelJogador = 1, ferramenta = 5908, materiais = {{8860, 1}, {8303, 1}, {8306, 1}, {13545, 1}}, tempo = 2, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {defesa = {0, 3}}},
			-- {item = 7885, nivel = 1, nivelJogador = 1, ferramenta = 5908, materiais = {{8860, 1}, {8310, 1}, {11222, 1}, {13541, 1}}, tempo = 2, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {defesa = {0, 3}}},
			-- {item = 9777, nivel = 1, nivelJogador = 1, ferramenta = 5908, materiais = {{11236, 1}, {5909, 1}, {13540, 1}}, tempo = 2, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {defesa = {0, 3}}},

			-- Cal�ados
			-- {item = 21708, nivel = 1, nivelJogador = 1, ferramenta = 5908, materiais = {{11209, 1}, {10602, 1}, {2642, 1}}, tempo = 2, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {defesa = {0, 3}}},
			{item = 7457, nivel = 1, nivelJogador = 1, ferramenta = 5908, materiais = {{6980, 1}, {11224, 1}, {13542, 1}}, tempo = 2, experiencia = 30, pontos = 2, chanceSucesso = 9000, aprender = 0, atributos = {defesa = {0, 1}}},--90
			-- {item = 5462, nivel = 1, nivelJogador = 1, ferramenta = 5908, materiais = {{8860, 1}, {12404, 1}, {10123, 1}}, tempo = 2, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {defesa = {0, 3}}},
			{item = 7892, nivel = 5, nivelJogador = 30, ferramenta = 5908, materiais = {{8860, 1}, {8302, 5}, {13545, 1}}, tempo = 5, experiencia = 100, pontos = 10, chanceSucesso = 6000, aprender = 0, atributos = {defesa = {0, 1}}},--1000
			-- {item = 7893, nivel = 1, nivelJogador = 1, ferramenta = 5908, materiais = {{8860, 1}, {8303, 1}, {8306, 1}, {13545, 1}}, tempo = 2, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {defesa = {0, 3}}},
			{item = 7891, nivel = 5, nivelJogador = 30, ferramenta = 5908, materiais = {{8860, 1}, {8299, 10}, {13543, 1}}, tempo = 5, experiencia = 100, pontos = 10, chanceSucesso = 6000, aprender = 0, atributos = {defesa = {0, 1}}},--1000
			-- {item = 7886, nivel = 1, nivelJogador = 1, ferramenta = 5908, materiais = {{8860, 1}, {8310, 1}, {11222, 1}, {13541, 1}}, tempo = 2, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {defesa = {0, 3}}},
			-- {item = 2195, nivel = 1, nivelJogador = 1, ferramenta = 5908, materiais = {{11209, 1}, {13158, 1}, {2642, 1}}, tempo = 2, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {defesa = {0, 3}}},
			-- {item = 6132, nivel = 1, nivelJogador = 1, ferramenta = 5908, materiais = {{12501, 1}, {13545, 1}, {13544, 1}, {13543, 1}, {21251, 1}}, tempo = 2, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {defesa = {0, 3}}},
			-- {item = 11118, nivel = 1, nivelJogador = 1, ferramenta = 5908, materiais = {{5877, 1}, {5920, 1}}, tempo = 2, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {defesa = {0, 3}}},
		},
		mensagem = "Ser um alfaiate permite voc� criar vestimentas �nicas e equipamentos poderosos, basta voc� ter os materiais necess�rios para isso.",
		efeitoTrabalhando = CONST_ME_BLOCKHIT,
		efeitoSucesso = CONST_ME_FIREWORK_BLUE,
		efeitoFalha = CONST_ME_POFF,
		ingredientesMelhoria = {
			{item = 13193, chance = 500},
			{item = 13194, chance = 500},
			{item = 13195, chance = 500},
			{item = 13196, chance = 1500},
			{item = 13197, chance = 1500},
			{item = 13198, chance = 1500},
			{item = 13213, chance = 1000},
			{item = 13214, chance = 1000},
			{item = 13215, chance = 1000},
		},
		extraData = {}
	},
	[23000] = {
		nome = "Cozinheiro",
		mesaTrabalho = {1787, 1789, 1791, 1793},
		mesaTrabalhando = {1786, 1788, 1790, 1792},
		receitas = {
			-- {item = 9992, nivel = 1, nivelJogador = 1, ferramenta = 2347, materiais = {{11192, 2}, {2671, 5}, {8838, 3}, {2787, 3}}, tempo = 5, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {}},
			-- {item = 9993, nivel = 1, nivelJogador = 1, ferramenta = 2347, materiais = {{7250, 3}, {8838, 3}, {8842, 5}, {2805, 2}}, tempo = 5, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {}},
			-- {item = 9994, nivel = 1, nivelJogador = 1, ferramenta = 2347, materiais = {{12638, 3}, {11429, 3}, {2795, 4}, {2677, 3}}, tempo = 5, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {}},
			-- {item = 9995, nivel = 1, nivelJogador = 1, ferramenta = 2347, materiais = {{11190, 2}, {2006, 2, 3}, {8841, 2}, {7909, 7}}, tempo = 5, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {}},
			-- {item = 9996, nivel = 1, nivelJogador = 1, ferramenta = 2347, materiais = {{6574, 1}, {2676, 10}, {2006, 1, 6}, {2800, 1}}, tempo = 5, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {}},
			-- {item = 9997, nivel = 1, nivelJogador = 1, ferramenta = 2347, materiais = {{12639, 2}, {12416, 3}, {12418, 4}, {12417, 4}}, tempo = 5, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {}},
			-- {item = 9998, nivel = 1, nivelJogador = 1, ferramenta = 2347, materiais = {{8844, 5}, {2666, 5}, {2096, 1}, {2685, 2}}, tempo = 5, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {}},
			-- {item = 9999, nivel = 1, nivelJogador = 1, ferramenta = 2347, materiais = {{2672, 5}, {8843, 2}, {9114, 4}, {8844, 2}}, tempo = 5, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {}},
			-- {item = 10000, nivel = 1, nivelJogador = 1, ferramenta = 2347, materiais = {{2685, 5}, {2695, 2}, {2692, 5}, {2006, 1, 6}}, tempo = 5, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {}},
			-- {item = 10001, nivel = 1, nivelJogador = 1, ferramenta = 2347, materiais = {{7963, 1}, {2689, 1}, {2667, 7}, {2696, 4}}, tempo = 5, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {}},
			-- {item = 12540, nivel = 1, nivelJogador = 1, ferramenta = 2347, materiais = {{2678, 2}, {2670, 8}, {2789, 1}, {8845, 2}}, tempo = 5, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {}},
			-- {item = 12542, nivel = 1, nivelJogador = 1, ferramenta = 2347, materiais = {{8844, 4}, {8838, 4}, {2006, 2, 14}, {2686, 3}}, tempo = 5, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {}},
			-- {item = 12543, nivel = 1, nivelJogador = 1, ferramenta = 2347, materiais = {{6500, 1}, {6569, 8}, {6574, 2}, {8840, 2}}, tempo = 5, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {}},
			-- {item = 12544, nivel = 1, nivelJogador = 1, ferramenta = 2347, materiais = {{20100, 1}, {12415, 4}, {2006, 4, 14}, {7910, 4}}, tempo = 5, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {}},
			-- {item = 12637, nivel = 1, nivelJogador = 1, ferramenta = 2347, materiais = {{11246, 5}, {2668, 3}, {2669, 3}, {2800, 2}}, tempo = 5, experiencia = 100, pontos = 10, chanceSucesso = 8000, aprender = 0, atributos = {}}
		},
		mensagem = "Cozinhar permite voc� criar comidas �nicas e poderosos, basta voc� ter os materiais necess�rios para isso.",
		efeitoTrabalhando = CONST_ME_SMOKE,
		efeitoSucesso = CONST_ME_FIREWORK_BLUE,
		efeitoFalha = CONST_ME_BLACKSMOKE,
		ingredientesMelhoria = {
			{item = 10047, chance = 1000}
		},
		extraData = {}
	}
}
listaProfissoes = {}
listaProfissoesNomes = {}
listaProfissoesInfo = {}
listaProfissoesLista1 = {}
listaProfissoesLista2 = {}
listaProfissoesLista3 = {}
listaProfissoesReceitas = {}
for a, b in pairs(profissoes) do
	table.insert(listaProfissoes, a)
	table.insert(listaProfissoesNomes, string.lower(b.nome))
	table.insert(listaProfissoesInfo, a+configProfissoes.modalInfo)
	table.insert(listaProfissoesLista1, a+configProfissoes.modalLista1)
	table.insert(listaProfissoesLista2, a+configProfissoes.modalLista2)
	table.insert(listaProfissoesLista3, a+configProfissoes.modalLista3)
	for c, d in pairs(b.receitas) do
		table.insert(listaProfissoesReceitas, a+c+configProfissoes.receitasInicio)
	end
end
function doCalcLevel(n)
	if n == 0 then
		return 0
	else
		o = 0
		if n ~= 1 then
			o = math.pow((0.188*(math.pow(n, 1.4))), 2)+10
		end
		return math.max(0, (n-1)*40+o)+doCalcLevel(n-1)
	end
end
function doCalcLevelPontos(n)
	if n == 0 then
		return 0
	else
		return math.max(0, (n-1)*2+math.pow((0.01*(math.pow(n, 0.2))), 2)+10)+doCalcLevelPontos(n-1)
	end
end
function calcularLevelProfissao(n)
	return math.floor(doCalcLevel(n))
end
function calcularPontosProfissao(n)
	return math.floor(doCalcLevelPontos(n))
end
function verificiarProfissao(value, verificarReceita)
	for a, b in pairs(profissoes) do
		if verificarReceita == nil then
			if	a+configProfissoes.modalInfo == value or
				a+configProfissoes.modalLista1 == value or
				a+configProfissoes.modalLista2 == value or
				a+configProfissoes.modalLista3 == value then
				return a
			end
		else
			for c, d in pairs(b.receitas) do
				if a+c+configProfissoes.receitasInicio == value then
					return {a, c}
				end
			end
		end
	end
	return 0
end
function verificiarProfissaoPorNome(value)
	for a, b in pairs(profissoes) do
		if string.lower(b.nome) == value then
			return a
		end
	end
	return 0
end
function ordenarReceitasPorNome(receitas)
	local nomesReceitas, exibirReceitas = {}, {}
	for a, b in pairs(receitas) do
		if #nomesReceitas < 256 then
			local nomeReceita = capAll(getItemName(b.item)) .. " - N�vel de Profiss�o: " .. b.nivel
			if b.nome ~= nil then
				nomeReceita = b.nome
			end
			table.insert(nomesReceitas, nomeReceita)
		end
	end
	local sortedKeys = getKeysSortedByValue(nomesReceitas, function(a, b) return a < b end)
	for _, k in ipairs(sortedKeys) do
		local nomeReceita = nomesReceitas[k]
		quantidade = receitas[k].quantidade
		if quantidade ~= nil and ((type(quantidade) == "number" and quantidade > 1) or (type(quantidade) == "table" and #quantidade == 2)) then
			if type(quantidade) == "table" then
				quantidade = (quantidade[1].."-"..quantidade[2])
			elseif quantidade > 1 then
				quantidade = quantidade
			end
			nomeReceita = "("..quantidade..") "..nomeReceita
		end
		table.insert(exibirReceitas, {k, nomeReceita})
	end
	return exibirReceitas
end
function Player.getProfissaoSkill(self, profissaoId)
	return math.max(1, self:getStorageValue(profissaoId+configProfissoes.skill))
end
function Player.getProfissaoSkillExp(self, profissaoId)
	return math.max(0, self:getStorageValue(profissaoId+configProfissoes.skillExp))
end
function Player.getProfissaoSkillExpProximoNivel(self, profissaoId)
	local skill = math.max(1, self:getStorageValue(profissaoId+configProfissoes.skill))
	local skillExp = math.max(0, self:getStorageValue(profissaoId+configProfissoes.skillExp))
	return calcularLevelProfissao(skill+1)-skillExp
end
function Player.getProfissaoSkillPorcentagem(self, profissaoId)
	local skillExp = self:getProfissaoSkillExp(profissaoId)
	local skillExpProximoNivel = self:getProfissaoSkillExpProximoNivel(profissaoId)+skillExp
	local percent = math.floor(100*skillExp/skillExpProximoNivel)
	if percent >= 0 and percent <= 100 then
		return percent
	else
		return 0
	end
end
function Player.addProfissaoSkill(self, profissaoId)
	local profissao = profissoes[profissaoId]
	local storageSkill = profissaoId+configProfissoes.skill
	local storageSkillExp = profissaoId+configProfissoes.skillExp
	local skill = self:getProfissaoSkill(profissaoId)+1
	self:setStorageValue(storageSkill, skill)
	self:setStorageValue(storageSkillExp, 0)
	self:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voc� avan�ou seu n�vel de "..string.lower(profissao.nome).." para "..skill..".")
	self:addProfissaoPontos(profissaoId, calcularPontosProfissao(skill))
end
function Player.addProfissaoSkillExp(self, profissaoId, experiencia)
	local storageSkillExp = profissaoId+configProfissoes.skillExp
	local skill = self:getProfissaoSkill(profissaoId)
	local skillExp = self:getProfissaoSkillExp(profissaoId)
	local skillExpProxLevel = calcularLevelProfissao(skill+1)
	local novaExperiencia = 0
	if skill < configProfissoes.nivelMaximoProfissao and experiencia + skillExp >= skillExpProxLevel then
		novaExperiencia = experiencia+skillExp-skillExpProxLevel
		self:addProfissaoSkill(profissaoId)
	else
		novaExperiencia = skillExp+experiencia
	end
	self:setStorageValue(storageSkillExp, novaExperiencia)
end
function Player.getProfissaoPontos(self, profissaoId)
	return math.max(0, self:getStorageValue(profissaoId+configProfissoes.pontosProfissao))
end
function Player.addProfissaoPontos(self, profissaoId, pontos)
	local profissao = profissoes[profissaoId]
	local storagePontos = profissaoId+configProfissoes.pontosProfissao
	local pontosTotais = self:getProfissaoPontos(profissaoId)+pontos
	self:setStorageValue(storagePontos, pontosTotais)
	self:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voc� recebeu "..pontos.." pontos de "..string.lower(profissao.nome)..". Voc� possui um total de "..pontosTotais.." pontos.")
end
function Player.getProfissaoReceitasFabricadas(self, profissaoId)
	return math.max(0, self:getStorageValue(profissaoId+configProfissoes.receitasFabricadas))
end
function Player.addProfissaoReceitasFabricadas(self, profissaoId)
	local storageReceitasFabricadas = profissaoId+configProfissoes.receitasFabricadas
	local receitasFabricadas = math.max(0, self:getStorageValue(storageReceitasFabricadas))
	self:setStorageValue(storageReceitasFabricadas, receitasFabricadas+1)
end
function Player.getProfissaoReceitasFalhadas(self, profissaoId)
	return math.max(0, self:getStorageValue(profissaoId+configProfissoes.receitasFalhadas))
end
function Player.addProfissaoReceitasFalhadas(self, profissaoId)
	local storageReceitasFalhadas = profissaoId+configProfissoes.receitasFalhadas
	local receitasFalhadas = math.max(0, self:getStorageValue(storageReceitasFalhadas))
	self:setStorageValue(storageReceitasFalhadas, receitasFalhadas+1)
end
function Player.addProfissaoUltimaReceita(self, profissaoId, receitaId)
	self:setStorageValue(profissaoId+configProfissoes.ultimaReceita, receitaId)
end
function Player.getProfissaoUltimaReceita(self, profissaoId)
	return math.max(0, self:getStorageValue(profissaoId+configProfissoes.ultimaReceita))
end
function Player.getProfissaoUltimasReceitasFalhadas(self, profissaoId, receitaId)
	return math.floor(math.max(0, self:getStorageValue(profissaoId+configProfissoes.ultimasReceitasFalhadas+receitaId))*50)
end
function Player.addProfissaoUltimasReceitasFalhadas(self, profissaoId, receitaId)
	local storageUltimasReceitasFalhadas = profissaoId+configProfissoes.ultimasReceitasFalhadas+receitaId
	local ultimasReceitasFalhadas = math.max(0, self:getStorageValue(storageUltimasReceitasFalhadas))
	self:setStorageValue(storageUltimasReceitasFalhadas, ultimasReceitasFalhadas+1)
end
function Player.resetProfissaoUltimasReceitasFalhadas(self, profissaoId, receitaId)
	self:setStorageValue(profissaoId+configProfissoes.ultimasReceitasFalhadas+receitaId, 0)
end
function Player.getProfissaoBonusAdicional(self, profissaoId)
	local nivel = self:getProfissaoSkill(profissaoId)
	return math.floor(0.05*nivel)
end
function Player.getProfissaoIngredienteMelhoria(self, profissaoId)
	return math.max(0, self:getStorageValue(profissaoId+configProfissoes.ingredienteMelhoria))
end
function Player.addProfissaoIngredienteMelhoria(self, profissaoId, ingredienteMelhoria)
	self:setStorageValue(profissaoId+configProfissoes.ingredienteMelhoria, ingredienteMelhoria)
end
function Player.resetProfissaoIngredienteMelhoria(self, profissaoId)
	self:addProfissaoIngredienteMelhoria(profissaoId, 0)
end
function Player.getProfissaoChanceSucessoAdicional(self, profissaoId)
	local nivel = self:getProfissaoSkill(profissaoId)
	local chanceSucessoAdicional = (20*(nivel-1))
	local pocaoProfissaoStorage = self:getStorageValue(configProfissoes.pocaoProfissaoStorage)
	if	((pocaoProfissaoStorage > 1 and pocaoProfissaoStorage == profissaoId) or (pocaoProfissaoStorage == 1)) and
		getCreatureCondition(self, CONDITION_ATTRIBUTES, configProfissoes.pocaoCD) then
		chanceSucessoAdicional = chanceSucessoAdicional+(math.max(0, self:getStorageValue(configProfissoes.pocaoChanceStorage))*100)
	end
	return chanceSucessoAdicional
end
function Player.getProfissaoChanceColetaAdicional(self, profissaoId)
	local nivel = self:getProfissaoSkill(profissaoId)
	return (40*(nivel-1))
end
function Player.getProfissaoChanceSucessoReceita(self, profissaoId, receitaId)
	local profissao = profissoes[profissaoId]
	local receita = profissao.receitas[receitaId]
	local chanceSucessoAdicional = self:getProfissaoChanceSucessoAdicional(profissaoId)
	local chanceSucessoUltimasReceitasFalhadas = self:getProfissaoUltimasReceitasFalhadas(profissaoId, receitaId)
	local chanceSucesso = receita.chanceSucesso
	local maxChanceSucesso = receita.maxChanceSucesso
	local chanceSucessoReceita = chanceSucesso+chanceSucessoUltimasReceitasFalhadas+chanceSucessoAdicional
	local ingredienteSecreto = receita.ingredienteSecreto
	if ingredienteSecreto ~= nil and self:getItemCount(ingredienteSecreto[1]) >= ingredienteSecreto[2] then
		chanceSucessoReceita = chanceSucessoReceita+ingredienteSecreto[3]
	end
	if profissao.ingredientesMelhoria ~= nil then
		local ingredienteMelhoria = profissao.ingredientesMelhoria[self:getProfissaoIngredienteMelhoria(profissaoId)]
		if ingredienteMelhoria ~= nil and self:getItemCount(ingredienteMelhoria.item) > 0 then
			chanceSucessoReceita = chanceSucessoReceita+ingredienteMelhoria.chance
		end
	end
	if maxChanceSucesso == nil then
		maxChanceSucesso = 10000
	end
	chanceSucessoReceita = math.min(maxChanceSucesso, chanceSucessoReceita)
	return chanceSucessoReceita
end
function Player.getProfissaoReceitaAprendizado(self, profissaoId, receitaId)
	return math.max(0, self:getStorageValue(profissaoId+configProfissoes.receitasInicio+receitaId))
end
function Player.addProfissaoReceitaAprendizado(self, profissaoId, receitaId)
	local storageReceitasInicio = profissaoId+configProfissoes.receitasInicio+receitaId
	self:setStorageValue(storageReceitasInicio, 1)
end
function Player.getPosicaoMesaTrabalho(self, profissaoId, trabalhando)
	local extraData = profissoes[profissaoId].extraData[self:getId()]
	local posicaoMesaTrabalho = extraData.mesaTrabalho:getPosition()
	local posicaoEfeitoMesaTrabalho = extraData.mesaTrabalho:getPosition()
	local mesaTrabalho = extraData.mesaTrabalho:getType():getId()
	if trabalhando ~= nil and trabalhando == 1 then
		if mesaTrabalho == 1786 then
			posicaoEfeitoMesaTrabalho.x = posicaoEfeitoMesaTrabalho.x+1
			posicaoEfeitoMesaTrabalho.y = posicaoEfeitoMesaTrabalho.y-1
		elseif mesaTrabalho == 1788 then
			posicaoEfeitoMesaTrabalho.x = posicaoEfeitoMesaTrabalho.x+1
			posicaoEfeitoMesaTrabalho.y = posicaoEfeitoMesaTrabalho.y-1
		elseif mesaTrabalho == 1790 then
			posicaoEfeitoMesaTrabalho.x = posicaoEfeitoMesaTrabalho.x+1
		end
	end
	return {mesaTrabalho = posicaoMesaTrabalho, efeito = posicaoEfeitoMesaTrabalho}
end
function Player.getProfissaoModalQuantidade(self, profissaoId, receitaId, cristalAtivo)
	local profissao = profissoes[profissaoId]
	local receita = profissao.receitas[receitaId]
	local modalId = profissaoId+configProfissoes.receitasInicio+receitaId
	local modalTitulo = self:getProfissaoModalTitulo(profissaoId).." - Selecione a Quantidade"
	local modalMensagem = "Selecione a quantidade de itens que deseja fabricar.\n\nClique no bot�o 'Criar', tecle 'Enter' ou d� dois cliques para iniciar o processo de fabrica��o.\n\n"
	local modal = ModalWindow(modalId, modalTitulo, modalMensagem)
	local quantidadePossivel = self:verificarJogadorItensReceita(profissaoId, receitaId, configProfissoes.maxQuantidadeFabricacao)
	for i = 1, quantidadePossivel do
		modal:addChoice(i, i)
	end
	modal:setDefaultEnterButton(1)
	modal:addButton(1, "Criar")
	modal:addButton(2, "Sair")
	modal:setDefaultEscapeButton(2)
	return modal
end
function Player.getProfissaoModalPrincipal(self, profissaoId)
	local profissao = profissoes[profissaoId]
	local profissaoMensagem = profissao.mensagem
	local profissaoNome = profissao.nome
	local profissaoNivel = self:getProfissaoSkill(profissaoId)
	local profissaoExpPorcentagem = self:getProfissaoSkillPorcentagem(profissaoId)
	local modalTitulo = profissaoNome.." - N�vel: "..profissaoNivel.." ("..profissaoExpPorcentagem.."%)"
	local modalMensagem = profissaoMensagem.."\n\nO que voc� deseja fazer?\n"
	local modal = ModalWindow(profissaoId, modalTitulo, modalMensagem)
	local receitaId = self:getProfissaoUltimaReceita(profissaoId)
	if receitaId > 0 and self:verificarJogadorItensReceita(profissaoId, receitaId) > 0 then
		modal:addChoice(5, "Fabricar �ltima Receita")
	end
	modal:addChoice(1, "Informa��es da Profiss�o")
	modal:addChoice(2, "Lista de Receitas - Prontas para Fabrica��o")
	modal:addChoice(3, "Lista de Receitas - Conhecidas")
	modal:addChoice(4, "Lista de Receitas - Geral")
	modal:addButton(1, "Ok")
	modal:setDefaultEnterButton(1)
	modal:addButton(2, "Sair")
	modal:setDefaultEscapeButton(2)
	return modal
end
function Player.getProfissaoModalTitulo(self, profissaoId)
	local profissao = profissoes[profissaoId]
	local profissaoNome = profissao.nome
	local profissaoNivel = self:getProfissaoSkill(profissaoId)
	local profissaoExpPorcentagem = self:getProfissaoSkillPorcentagem(profissaoId)
	return profissaoNome.." - N�vel: "..profissaoNivel.." ("..profissaoExpPorcentagem.."%)"
end
function Player.verificarJogadorItensReceita(self, profissaoId, receitaId, quantidadeMaxima)
	if quantidadeMaxima == nil then
		quantidadeMaxima = 1
	end
	local profissao = profissoes[profissaoId]
	local receita = profissao.receitas[receitaId]
	local ferramenta = receita.ferramenta
	local materiais = receita.materiais
	if self:getItemCount(ferramenta) == 0 then
		return 0
	end
	local quantidadesPossiveis = {}
	for a, b in pairs(materiais) do
		if b[3] ~= -1 then
			b[3] = -1
		end
		local quantidadeItemJogador = self:getItemCount(b[1], b[3])
		local quantidadeMaximaPossivel = 0
		if quantidadeItemJogador >= b[2] then
			quantidadeMaximaPossivel = math.min(quantidadeMaxima, (quantidadeItemJogador-(quantidadeItemJogador%b[2]))/b[2])
		end
		table.insert(quantidadesPossiveis, quantidadeMaximaPossivel)
	end
	return math.min(unpack(quantidadesPossiveis))
end
function Player.iniciarReceitaQuantidade(self, profissaoId, receitaId, quantidadeTotal, quantidadeAtual, tempo)
	if quantidadeAtual == 0 then
		self:allowMovement(false)
	end
	if quantidadeAtual == 0 then
		delay = 0
	else
		delay = tempo+1
	end
	addEvent(function(player, profissaoId, receitaId, quantidadeTotal, quantidadeAtual, tempo)
		local player = Player(player)
		local bloquearMovimento = 1
		if quantidadeAtual == quantidadeTotal then
			bloquearMovimento = 0
		end
		local iniciarReceita = self:iniciarReceita(profissaoId, receitaId, bloquearMovimento)
		if iniciarReceita and quantidadeAtual < quantidadeTotal then
			player:iniciarReceitaQuantidade(profissaoId, receitaId, quantidadeTotal, quantidadeAtual, tempo)
		elseif not iniciarReceita then
			player:resetProfissaoIngredienteMelhoria(profissaoId)
			self:allowMovement(true)
		end
	end, delay*1000, self.uid, profissaoId, receitaId, quantidadeTotal, quantidadeAtual+1, tempo)
end
function Player.getIngredientesMelhoria(self, profissaoId)
	local profissao = profissoes[profissaoId]
	local ingredientesMelhoria = profissao.ingredientesMelhoria
	local ingredientesMelhoriaDisponiveis = {}
	if type(ingredientesMelhoria) == "table" then
		for a, b in pairs(ingredientesMelhoria) do
			if self:getItemCount(b.item) > 0 then
				table.insert(ingredientesMelhoriaDisponiveis, a+configProfissoes.receitasInicio)
			end
		end
	end
	return ingredientesMelhoriaDisponiveis
end
function Player.iniciarReceita(self, profissaoId, receitaId, bloquearMovimento)
	local mesaTrabalho = profissoes[profissaoId].extraData[self:getId()].mesaTrabalho
	local itemDesativado = configProfissoes.itemDesativado
	if mesaTrabalho:getActionId() == itemDesativado then
		return false
	end
	local profissao = profissoes[profissaoId]
	local profissaoNivel = self:getProfissaoSkill(profissaoId)
	local efeitoTrabalhando = profissao.efeitoTrabalhando
	local mesaTrabalhoKey = searchArrayKey(profissao.mesaTrabalho, mesaTrabalho:getType():getId())
	local mesaTrabalhando = profissao.mesaTrabalhando[mesaTrabalhoKey]
	local receita = profissao.receitas[receitaId]
	local ferramenta = receita.ferramenta
	local materiais = receita.materiais
	local ingredienteSecreto = receita.ingredienteSecreto
	local efeitoFalha = profissao.efeitoFalha
	if	profissaoNivel < receita.nivel or
		self:getLevel() < receita.nivelJogador or
		(receita.aprender == 1 and self:getProfissaoReceitaAprendizado(profissaoId, receitaId) == 0) then
		return false
	end
	if self:verificarJogadorItensReceita(profissaoId, receitaId) == 0 then
		return false
	end
	local pesoTotalReceita = 0
	for a, b in pairs(materiais) do
		pesoTotalReceita = pesoTotalReceita + ItemType(b[1]):getWeight()*b[2]
	end
	if ingredienteSecreto ~= nil and self:getItemCount(ingredienteSecreto[1]) >= ingredienteSecreto[2] then
		pesoTotalReceita = pesoTotalReceita + ItemType(ingredienteSecreto[1]):getWeight()*ingredienteSecreto[2]
	end
	local ingredienteMelhoria = self:getProfissaoIngredienteMelhoria(profissaoId)
	if ingredienteMelhoria > 0 then
		local ingredienteMelhoriaItem = profissao.ingredientesMelhoria[ingredienteMelhoria].item
		if ingredienteMelhoriaItem ~= nil and self:getItemCount(ingredienteMelhoriaItem) > 0 then
			pesoTotalReceita = pesoTotalReceita + ItemType(ingredienteMelhoriaItem):getWeight()
		end
	end
	local pesoItem = ItemType(receita.item):getWeight() - pesoTotalReceita
	if pesoItem > self:getFreeCapacity() then
		self:sendCancelMessage("Voc� n�o possui capacidade suficiente para produzir essa receita. Voc� precisa liberar, pelo menos, " .. formatarPeso(pesoItem - self:getFreeCapacity()) .. ".")
		self:sendMagicEffect(efeitoFalha)
		return false
	end
	for a, b in pairs(materiais) do
		if b[3] == nil then
			b[3] = -1
		end
		self:removeItem(b[1], b[2], b[3])
	end
	mesaTrabalho:setActionId(itemDesativado)
	if mesaTrabalhando ~= nil then
		mesaTrabalho:transform(mesaTrabalhando)
		mesaTrabalhando = profissao.mesaTrabalho[mesaTrabalhoKey]
	end
	local tempo = receita.tempo
	local craftCD = Condition(CONDITION_SPELLCOOLDOWN)
	craftCD:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)
	craftCD:setParameter(CONDITION_PARAM_SUBID, 160)
	craftCD:setParameter(CONDITION_PARAM_TICKS, (tempo+1)*1000)
	self:addCondition(craftCD)
	if bloquearMovimento == nil then
		self:allowMovement(false)
	end
	self:say("Trabalhando...", TALKTYPE_MONSTER_SAY)
	local posicaoMesaTrabalho = self:getPosicaoMesaTrabalho(profissaoId, 1)
	function enviarAnimacao(tempo, posicao, efeito)
		if tempo > 0 then
			posicao:sendMagicEffect(efeito)
			addEvent(enviarAnimacao, 1000, tempo-1, posicao, efeito)
		end
	end
	enviarAnimacao(tempo, posicaoMesaTrabalho.efeito, efeitoTrabalhando)
	addEvent(function(player, receitaId, profissaoId, mesaTrabalhando, bloquearMovimento)
		local player = Player(player)
		player:fabricarItem(receitaId, profissaoId, mesaTrabalhando, bloquearMovimento)
	end, tempo*1000, self.uid, receitaId, profissaoId, mesaTrabalhando, bloquearMovimento)
	return true
end
function Player.fabricarItem(self, receitaId, profissaoId, mesaTrabalhando, bloquearMovimento)
	local profissao = profissoes[profissaoId]
	local mesaTrabalho = profissao.extraData[self:getId()].mesaTrabalho
	local posicaoMesaTrabalho = self:getPosicaoMesaTrabalho(profissaoId).efeito
	local efeitoSucesso = profissao.efeitoSucesso
	local efeitoFalha = profissao.efeitoFalha
	local receita = profissao.receitas[receitaId]
	local nivel = receita.nivel
	local chanceSucesso = self:getProfissaoChanceSucessoReceita(profissaoId, receitaId)
	local ingredienteSecreto = receita.ingredienteSecreto
	if ingredienteSecreto ~= nil and self:getItemCount(ingredienteSecreto[1]) >= ingredienteSecreto[2] then
		self:removeItem(ingredienteSecreto[1], ingredienteSecreto[2])
	end
	local ingredienteMelhoria = self:getProfissaoIngredienteMelhoria(profissaoId)
	if ingredienteMelhoria > 0 then
		local ingredienteMelhoriaItem = profissao.ingredientesMelhoria[ingredienteMelhoria].item
		if ingredienteMelhoriaItem ~= nil and self:getItemCount(ingredienteMelhoriaItem) > 0 then
			self:removeItem(ingredienteMelhoriaItem, 1)
		end
	end
	local experiencia = receita.experiencia
	local pontos = receita.pontos
	local chance = math.random(10000)
	if chance <= chanceSucesso then
		local itemCriado = receita.item
		local quantidade = 1
		if receita.quantidade ~= nil and ItemType(itemCriado):isStackable() then
			if type(receita.quantidade) == "table" then
				quantidade = math.random(receita.quantidade[1], receita.quantidade[2])
			else
				quantidade = receita.quantidade
			end
		end
		local atributos = receita.atributos
		local itemCriado = self:addItem(itemCriado, quantidade)
		if quantidade == 1 then
			if itemCriado:getType():getDescription() ~= "" then
				itemCriado:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, itemCriado:getType():getDescription().."\nCriado por "..self:getName()..".")
			else
				itemCriado:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, "Criado por "..self:getName()..".")
			end
		end
		if receita.atributos ~= nil and type(receita.atributos) == "table" then
			local bonusAdicional = self:getProfissaoBonusAdicional(profissaoId)
			if itemCriado:getType():getAttack() > 0 and receita.atributos.ataque ~= nil then
				if type(receita.atributos.ataque) == "table" then
					ataqueAdicional = math.random(receita.atributos.ataque[1], receita.atributos.ataque[2])
				else
					ataqueAdicional = receita.atributos.ataque
				end
				itemCriado:setAttribute(ITEM_ATTRIBUTE_ATTACK, itemCriado:getType():getAttack()+ataqueAdicional+bonusAdicional)
			end
			if itemCriado:getType():getDefense() > 0 and receita.atributos.defesa ~= nil then
				if type(receita.atributos.defesa) == "table" then
					defesaAdicional = math.random(receita.atributos.defesa[1], receita.atributos.defesa[2])
				else
					defesaAdicional = receita.atributos.defesa
				end
				itemCriado:setAttribute(ITEM_ATTRIBUTE_DEFENSE, itemCriado:getType():getDefense()+defesaAdicional+bonusAdicional)
			end
			if itemCriado:getType():getExtraDefense() > 0 and receita.atributos.defesaExtra ~= nil then
				itemCriado:setAttribute(ITEM_ATTRIBUTE_EXTRADEFENSE, itemCriado:getType():getExtraDefense()+receita.atributos.defesaExtra)
			end
			if itemCriado:getType():getArmor() > 0 and receita.atributos.armadura ~= nil then
				if type(receita.atributos.armadura) == "table" then
					armaduraAdicional = math.random(receita.atributos.armadura[1], receita.atributos.armadura[2])
				else
					armaduraAdicional = receita.atributos.armadura
				end
				itemCriado:setAttribute(ITEM_ATTRIBUTE_ARMOR, itemCriado:getType():getArmor()+armaduraAdicional+bonusAdicional)
			end
			if itemCriado:getType():getShootRange() > 0 then
				itemCriado:setAttribute(ITEM_ATTRIBUTE_SHOOTRANGE, itemCriado:getType():getShootRange()+math.random(0, 1))
			end
			if receita.atributos.health ~= nil then
				if type(receita.atributos.health) == "table" then
					healthAdicional = math.random(receita.atributos.health[1], receita.atributos.health[2])
				else
					healthAdicional = receita.atributos.health
				end
				itemCriado:setAttribute(ITEM_ATTRIBUTE_NAME, itemCriado:getName().." [health: "..healthAdicional.."]")
			end
			if receita.atributos.mana ~= nil then
				if type(receita.atributos.mana) == "table" then
					manaAdicional = math.random(receita.atributos.mana[1], receita.atributos.mana[2])
				else
					manaAdicional = receita.atributos.mana
				end
				itemCriado:setAttribute(ITEM_ATTRIBUTE_NAME, itemCriado:getName().." [mana: "..manaAdicional.."]")
			end
			if receita.atributos.profissao ~= nil then
				local profissaoNome = receita.atributos.profissao
				if profissaoNome == 1 then
					profissaoNome = listaProfissoesNomes[math.random(#listaProfissoesNomes)]
				end
				itemCriado:setAttribute(ITEM_ATTRIBUTE_NAME, itemCriado:getName().." [profiss�o: "..profissaoNome.."]")
			end
			if receita.atributos.chance ~= nil then
				if type(receita.atributos.chance) == "table" then
					chanceAdicional = math.random(receita.atributos.chance[1], receita.atributos.chance[2])
				else
					chanceAdicional = receita.atributos.chance
				end
				itemCriado:setAttribute(ITEM_ATTRIBUTE_NAME, itemCriado:getName().." [chance adicional: "..chanceAdicional.."%]")
			end
		end
		self:addProfissaoReceitasFabricadas(profissaoId)
		self:resetProfissaoUltimasReceitasFalhadas(profissaoId, receitaId)
		self:sendTextMessage(MESSAGE_EVENT_DEFAULT, "Voc� fabricou com sucesso o item '"..capAll(itemCriado:getName()).."'.")
		self:addProfissaoPontos(profissaoId, pontos)
		posicaoMesaTrabalho:sendMagicEffect(efeitoSucesso)
	else
		self:addProfissaoReceitasFalhadas(profissaoId)
		self:addProfissaoUltimasReceitasFalhadas(profissaoId, receitaId)
		posicaoMesaTrabalho:sendMagicEffect(efeitoFalha)
		self:sendCancelMessage("O processo de cria��o falhou.")
	end
	self:addProfissaoSkillExp(profissaoId, experiencia)
	self:addProfissaoUltimaReceita(profissaoId, receitaId)
	if mesaTrabalhando ~= nil then
		mesaTrabalho:transform(mesaTrabalhando)
	end
	mesaTrabalho:removeAttribute(ITEM_ATTRIBUTE_ACTIONID)
	if bloquearMovimento == nil or bloquearMovimento == 0 then
		self:resetProfissaoIngredienteMelhoria(profissaoId)
		self:allowMovement(true)
	end
	return true
end

function atualizarProfissoesBanco()
	db.query("TRUNCATE TABLE `z_profissoes`")
	for a, b in pairs(profissoes) do
		local exibirMesaTrabalho = ""
		local exibirIngredientesMelhoria = ""
		for c, d in pairs(b.mesaTrabalho) do
			exibirMesaTrabalho = exibirMesaTrabalho .. d .. ";"
		end
		for c, d in pairs(b.ingredientesMelhoria) do
			exibirIngredientesMelhoria = exibirIngredientesMelhoria .. d.item .. "," .. d.chance .. ";"
		end
		local colunas = {"nome", "storage", "mesaTrabalho", "mensagem", "ingredientesMelhoria"}
		local valores = {b.nome, a, exibirMesaTrabalho, b.mensagem, exibirIngredientesMelhoria}
		local query = "INSERT INTO `z_profissoes` ("
		for c, d in pairs(colunas) do
			if c > 1 then
				query = query .. ", "
			end
			query = query .. "`" .. d .. "`"
		end
		query = query .. ") VALUES ("
		for c, d in pairs(valores) do
			if c > 1 then
				query = query .. ", "
			end
			query = query .. db.escapeString(d)
		end
		query = query .. ")"
		db.query(query)
	end
end

function atualizarReceitasBanco()
	db.query("TRUNCATE TABLE `z_receitas`")
	for a, b in pairs(profissoes) do
		for c, d in pairs(b.receitas) do
			local colunas = {"profissao"}
			local resultId = db.storeQuery("SELECT `id` FROM `z_profissoes` WHERE `nome` = " .. db.escapeString(b.nome) .. "")
			local profissaoId = result.getDataInt(resultId, "id")
			local valores = {profissaoId}
			for e, f in pairs(d) do
				table.insert(colunas, e)
				table.insert(valores, f)
			end
			local query = "INSERT INTO `z_receitas` ("
			for e, f in pairs(colunas) do
				if f ~= "atributos" then
					if e > 1 then
						query = query .. ", "
					end
					query = query .. "`" .. f .. "`"
				end
			end
			query = query .. ") VALUES ("
			for e, f in pairs(valores) do
				if colunas[e] == "materiais" then
					if e > 1 then
						query = query .. ", "
					end
					local queryMateriais = ""
					for g, h in pairs(f) do
						queryMateriais = queryMateriais .. h[1] .. "," .. h[2] .. ";"
					end
					query = query .. db.escapeString(queryMateriais)
				elseif colunas[e] == "ingredienteSecreto" then
					if e > 1 then
						query = query .. ", "
					end
					query = query .. db.escapeString(f[1] .. "," .. f[2] .. "," .. f[3])
				elseif colunas[e] ~= "atributos" then
					if e > 1 then
						query = query .. ", "
					end
					query = query .. db.escapeString(f)
				end
			end
			query = query .. ")"
			db.query(query)
			local receitaId = db.lastInsertId()
			if d.atributos ~= nil then
				for e, f in pairs(d.atributos) do
					local exibirValor = f
					if type(exibirValor) == "table" then
						exibirValor = f[1] .. "," .. f[2]
					end
					db.query("INSERT INTO `z_receitas_atributos` (`receita`, `atributo`, `valor`) VALUES (" .. db.escapeString(receitaId) .. ", " .. db.escapeString(e) .. ", " .. db.escapeString(exibirValor) .. ")")
				end
			end
		end
	end
end
