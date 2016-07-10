
Vocacoes = {
	sorcerer = {1, 5},
	druid = {2, 6},
	paladin = {3, 7},
	knight = {4, 8}
}

function Player:teleportarParaGuilda()
	local vocacao = self:getVocation():getId()

	local posicao
	if isInArray(Vocacoes.sorcerer, vocacao) then
		posicao = {x = 600, y = 983, z = 7}
	elseif isInArray(Vocacoes.druid, vocacao) then
		posicao = {x = 545, y = 948, z = 5}
	elseif isInArray(Vocacoes.paladin, vocacao) then
		posicao = {x = 448, y = 957, z = 2}
	elseif isInArray(Vocacoes.knight, vocacao) then
		posicao = {x = 647, y = 902, z = 8}
	end

	self:teleportarJogador(posicao, true)
end


function Player:formatarNomeVocacao()
	return firstToUpper(self:getVocation():getName()) .. "s"
end
