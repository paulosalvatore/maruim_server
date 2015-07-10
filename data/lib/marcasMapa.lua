local marcasMapa = {
	[1] = {
		{
			marca = MAPMARK_TEMPLE,
			posicao = {x = 586, y = 925, z = 7},
			descricao = "Templo"
		},
		{
			marca = MAPMARK_BAG,
			posicao = {x = 575, y = 956, z = 7},
			descricao = "Vendedor de Armaduras"
		},
		{
			marca = MAPMARK_SHOVEL,
			posicao = {x = 597, y = 949, z = 7},
			descricao = "Vendedor de Utilidades"
		},
		{
			marca = MAPMARK_DOLLAR,
			posicao = {x = 559, y = 944, z = 7},
			descricao = "Comprador de Produtos de Criaturas"
		},
		{
			marca = MAPMARK_BAG,
			posicao = {x = 573, y = 930, z = 7},
			descricao = "Comprador de Ervas"
		},
		{
			marca = MAPMARK_BAG,
			posicao = {x = 651, y = 951, z = 7},
			descricao = "NPC Ferreiro"
		},
		{
			marca = MAPMARK_BAG,
			posicao = {x = 657, y = 949, z = 6},
			descricao = "Ferreiro de Knight"
		},
		{
			marca = MAPMARK_BAG,
			posicao = {x = 649, y = 956, z = 6},
			descricao = "Ferreiro de Paladin"
		},
		{
			marca = MAPMARK_BAG,
			posicao = {x = 588, y = 976, z = 8},
			descricao = "Alquimista"
		},
		{
			marca = MAPMARK_BAG,
			posicao = {x = 580, y = 954, z = 6},
			descricao = "Alfaiate"
		},
		{
			marca = MAPMARK_FLAG,
			posicao = {x = 633, y = 938, z = 6},
			descricao = "Barqueiro para Main Land"
		},
		{
			marca = MAPMARK_FLAG,
			posicao = {x = 593, y = 1019, z = 7},
			descricao = "Parte Baixa da Ilha"
		},
		{
			marca = MAPMARK_FLAG,
			posicao = {x = 600, y = 1085, z = 7},
			descricao = "Parte Alta da Ilha"
		},
		{
			marca = MAPMARK_STAR,
			posicao = {x = 448, y = 955, z = 2},
			descricao = "Mestre Paladin"
		},
		{
			marca = MAPMARK_STAR,
			posicao = {x = 449, y = 957, z = 7},
			descricao = "Guilda de Paladin"
		},
		{
			marca = MAPMARK_STAR,
			posicao = {x = 545, y = 946, z = 5},
			descricao = "Mestre Druid"
		},
		{
			marca = MAPMARK_STAR,
			posicao = {x = 537, y = 945, z = 7},
			descricao = "Guilda de Druid"
		},
		{
			marca = MAPMARK_STAR,
			posicao = {x = 598, y = 981, z = 7},
			descricao = "Mestre Sorcerer"
		},
		{
			marca = MAPMARK_STAR,
			posicao = {x = 605, y = 974, z = 7},
			descricao = "Guilda de Sorcerer"
		},
		{
			marca = MAPMARK_STAR,
			posicao = {x = 647, y = 899, z = 8},
			descricao = "Mestre Knight"
		},
		{
			marca = MAPMARK_STAR,
			posicao = {x = 642, y = 908, z = 7},
			descricao = "Guilda de Knight"
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
			descricao = "Vilajero dos Elfos"
		}
	}
}

function Player.adicionarMarcasMapa(self, cidade)
	local marcas = marcasMapa[cidade]
	for i = 1, #marcas do
		local marca = marcas[i]
		self:addMapMark(marca.posicao, marca.marca, marca.descricao)
	end
end