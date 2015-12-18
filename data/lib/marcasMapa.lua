local marcasMapa = {
	[1] = {
		{
			marca = MAPMARK_TEMPLE,
			posicao = {x = 586, y = 925, z = 7},
			descricao = "Templo"
		},
		{
			marca = MAPMARK_TEMPLE,
			posicao = {x = 607, y = 955, z = 7},
			descricao = "Igreja"
		},
		{
			marca = MAPMARK_BAG,
			posicao = {x = 575, y = 956, z = 7},
			descricao = "Loja de Equipamentos"
		},
		{
			marca = MAPMARK_BAG,
			posicao = {x = 581, y = 952, z = 7},
			descricao = "Vendedor de Comidas"
		},
		{
			marca = MAPMARK_SHOVEL,
			posicao = {x = 597, y = 949, z = 7},
			descricao = "Vendedor de Utilidades"
		},
		{
			marca = MAPMARK_BAG,
			posicao = {x = 610, y = 921, z = 7},
			descricao = "Vendedor de Armas à Distância"
		},
		{
			marca = MAPMARK_DOLLAR,
			posicao = {x = 564, y = 946, z = 7},
			descricao = "Compradores de Produtos de Criaturas"
		},
		{
			marca = MAPMARK_BAG,
			posicao = {x = 570, y = 922, z = 7},
			descricao = "Loja de Ervas"
		},
		{
			marca = MAPMARK_BAG,
			posicao = {x = 580, y = 934, z = 7},
			descricao = "Loja de Amuletos/Colares"
		},
		{
			marca = MAPMARK_BAG,
			posicao = {x = 651, y = 951, z = 7},
			descricao = "Loja de Armas"
		},
		{
			marca = MAPMARK_BAG,
			posicao = {x = 649, y = 956, z = 6},
			descricao = "Loja de Escudos"
		},
		{
			marca = MAPMARK_FLAG,
			posicao = {x = 632, y = 939, z = 7},
			descricao = "Navio"
		},
		{
			marca = MAPMARK_FLAG,
			posicao = {x = 633, y = 938, z = 6},
			descricao = "Capitão do Navio"
		},
		{
			marca = MAPMARK_FLAG,
			posicao = {x = 593, y = 1019, z = 7},
			descricao = "Acesso à Parte Baixa da Ilha"
		},
		{
			marca = MAPMARK_FLAG,
			posicao = {x = 600, y = 1085, z = 7},
			descricao = "Acesso à Parte Alta da Ilha"
		},
		{
			marca = MAPMARK_STAR,
			posicao = {x = 448, y = 955, z = 2},
			descricao = "Mestre Paladin"
		},
		{
			marca = MAPMARK_STAR,
			posicao = {x = 449, y = 957, z = 7},
			descricao = "Guilda dos Paladins"
		},
		{
			marca = MAPMARK_STAR,
			posicao = {x = 545, y = 946, z = 5},
			descricao = "Mestre Druid"
		},
		{
			marca = MAPMARK_STAR,
			posicao = {x = 537, y = 945, z = 7},
			descricao = "Guilda dos Druids"
		},
		{
			marca = MAPMARK_STAR,
			posicao = {x = 598, y = 981, z = 7},
			descricao = "Mestre Sorcerer"
		},
		{
			marca = MAPMARK_STAR,
			posicao = {x = 605, y = 974, z = 7},
			descricao = "Guilda dos Sorcerers"
		},
		{
			marca = MAPMARK_STAR,
			posicao = {x = 647, y = 899, z = 8},
			descricao = "Mestre Knight"
		},
		{
			marca = MAPMARK_STAR,
			posicao = {x = 642, y = 908, z = 7},
			descricao = "Guilda dos Knights"
		},
		{
			marca = MAPMARK_SKULL,
			posicao = {x = 553, y = 896, z = 7},
			descricao = "Área de Caça"
		},
		{
			marca = MAPMARK_SKULL,
			posicao = {x = 467, y = 867, z = 7},
			descricao = "Área de Caça"
		},
		{
			marca = MAPMARK_SKULL,
			posicao = {x = 568, y = 1033, z = 7},
			descricao = "Área de Caça - Vilarejo"
		},
		{
			marca = MAPMARK_FLAG,
			posicao = {x = 485, y = 946, z = 7},
			descricao = "Lar dos Primeiros Elfos"
		},
		{
			marca = MAPMARK_FLAG,
			posicao = {x = 643, y = 848, z = 7},
			descricao = "Castelo"
		},
		{
			marca = MAPMARK_FLAG,
			posicao = {x = 598, y = 1102, z = 7},
			descricao = "Taverna"
		}
	}
}

function Player:adicionarMarcasMapa(cidade)
	local marcas = marcasMapa[cidade]
	for i = 1, #marcas do
		local marca = marcas[i]
		self:addMapMark(marca.posicao, marca.marca, marca.descricao)
	end
end