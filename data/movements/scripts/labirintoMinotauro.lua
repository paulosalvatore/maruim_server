local posicaoInicial = {x = 695, y = 972, z = 9}
local config = {
	{posicaoJogador = {x = 695, y = 951, z = 9}, posicaoDestino = posicaoInicial},
	{posicaoJogador = {x = 697, y = 951, z = 9}, posicaoDestino = posicaoInicial},
	{posicaoJogador = {x = 698, y = 952, z = 9}, posicaoDestino = posicaoInicial},
	{posicaoJogador = {x = 700, y = 953, z = 9}, posicaoDestino = posicaoInicial},
	{posicaoJogador = {x = 697, y = 954, z = 9}, posicaoDestino = posicaoInicial},
	{posicaoJogador = {x = 699, y = 957, z = 9}, posicaoDestino = posicaoInicial},
	{posicaoJogador = {x = 697, y = 959, z = 9}, posicaoDestino = posicaoInicial},
	{posicaoJogador = {x = 701, y = 957, z = 9}, posicaoDestino = posicaoInicial},
	{posicaoJogador = {x = 702, y = 959, z = 9}, posicaoDestino = posicaoInicial},
	{posicaoJogador = {x = 704, y = 957, z = 9}, posicaoDestino = posicaoInicial},
	{posicaoJogador = {x = 704, y = 961, z = 9}, posicaoDestino = posicaoInicial},
	{posicaoJogador = {x = 697, y = 963, z = 9}, posicaoDestino = posicaoInicial},
	{posicaoJogador = {x = 697, y = 972, z = 9}, posicaoDestino = posicaoInicial},
	{posicaoJogador = {x = 699, y = 972, z = 9}, posicaoDestino = posicaoInicial},
	{posicaoJogador = {x = 713, y = 972, z = 9}, posicaoDestino = posicaoInicial},
	{posicaoJogador = {x = 714, y = 969, z = 9}, posicaoDestino = posicaoInicial},
	{posicaoJogador = {x = 711, y = 970, z = 9}, posicaoDestino = posicaoInicial},
	{posicaoJogador = {x = 711, y = 967, z = 9}, posicaoDestino = posicaoInicial},
	{posicaoJogador = {x = 717, y = 966, z = 9}, posicaoDestino = posicaoInicial},
	{posicaoJogador = {x = 715, y = 962, z = 9}, posicaoDestino = posicaoInicial},
	{posicaoJogador = {x = 715, y = 960, z = 9}, posicaoDestino = posicaoInicial},
	{posicaoJogador = {x = 714, y = 960, z = 9}, posicaoDestino = posicaoInicial},
	{posicaoJogador = {x = 717, y = 958, z = 9}, posicaoDestino = posicaoInicial},
	{posicaoJogador = {x = 715, y = 956, z = 9}, posicaoDestino = posicaoInicial},
	{posicaoJogador = {x = 706, y = 955, z = 9}, posicaoDestino = posicaoInicial},
	{posicaoJogador = {x = 708, y = 951, z = 9}, posicaoDestino = posicaoInicial},
	{posicaoJogador = {x = 710, y = 951, z = 9}, posicaoDestino = posicaoInicial},
	{posicaoJogador = {x = 712, y = 951, z = 9}, posicaoDestino = posicaoInicial},
	{posicaoJogador = {x = 708, y = 963, z = 9}, posicaoDestino = posicaoInicial},
	{posicaoJogador = {x = 710, y = 965, z = 9}, posicaoDestino = posicaoInicial},
	{posicaoJogador = {x = 714, y = 966, z = 9}, posicaoDestino = posicaoInicial},
	{posicaoJogador = {x = 715, y = 971, z = 9}, posicaoDestino = posicaoInicial},
	{posicaoJogador = {x = 715, y = 972, z = 9}, posicaoDestino = posicaoInicial},
	{posicaoJogador = {x = 713, y = 943, z = 9}, posicaoDestino = posicaoInicial},
	{posicaoJogador = {x = 714, y = 964, z = 9}, posicaoDestino = posicaoInicial},
	{posicaoJogador = {x = 717, y = 964, z = 9}, posicaoDestino = posicaoInicial},
	{posicaoJogador = {x = 697, y = 966, z = 9}, posicaoDestino = {x = 697, y = 969, z = 9}},
	{posicaoJogador = {x = 706, y = 953, z = 9}, posicaoDestino = {x = 697, y = 969, z = 9}},
	{posicaoJogador = {x = 712, y = 961, z = 9}, posicaoDestino = {x = 717, y = 962, z = 9}},
	{posicaoJogador = {x = 709, y = 968, z = 9}, posicaoDestino = {x = 717, y = 962, z = 9}},
	{posicaoJogador = {x = 714, y = 958, z = 9}, posicaoDestino = {x = 717, y = 955, z = 9}},
	{posicaoJogador = {x = 717, y = 972, z = 9}, posicaoDestino = {x = 717, y = 957, z = 9}},
	{posicaoJogador = {x = 717, y = 968, z = 9}, posicaoDestino = {x = 717, y = 970, z = 9}},
	{posicaoJogador = {x = 706, y = 961, z = 9}, posicaoDestino = {x = 712, y = 965, z = 9}},
	{posicaoJogador = {x = 716, y = 949, z = 9}, posicaoDestino = {x = 716, y = 944, z = 9}},
	{posicaoJogador = {x = 699, y = 967, z = 9}, posicaoEsqueleto = {y = -2}},
	{posicaoJogador = {x = 701, y = 966, z = 9}, posicaoEsqueleto = {x = 1, y = -1}},
	{posicaoJogador = {x = 704, y = 966, z = 9}, posicaoEsqueleto = {x = 1, y = -1}},
	{posicaoJogador = {x = 707, y = 966, z = 9}, posicaoEsqueleto = {x = 1, y = -1}}
}
function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return
	end
	for a, b in pairs(config) do
		if position.x == b.posicaoJogador.x and position.y == b.posicaoJogador.y and position.z == b.posicaoJogador.z then
			if b.posicaoDestino ~= nil then
				player:teleportTo(b.posicaoDestino, true)
				player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			else
				local posicaoEsqueleto = position + b.posicaoEsqueleto
				if Tile(posicaoEsqueleto):getItemById(9522):remove(1) then
					addEvent(function(posicaoEsqueleto)
						Game.createItem(9522, 1, posicaoEsqueleto)
					end, 120*1000, posicaoEsqueleto)
				end
				Game.createMonster("Skeleton", posicaoEsqueleto)
			end
			return true
		end
	end
	return true
end