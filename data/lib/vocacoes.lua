Vocacoes = {
	sorcerer = {1, 5},
	druid = {2, 6},
	paladin = {3, 7},
	knight = {4, 8}
}

if teleportadorGuilda == nil then
	teleportadorGuilda = {
		posicoesBase = {
			{x = 932, y = 1919, z = 2}, -- Civitaten
			{x = 812, y = 1330, z = 7}, -- Ôttô
			{x = 1083, y = 1591, z = 6}, -- Hyalakur
			{x = 580, y = 910, z = 7} -- Maruim Island
		},
		posicoesTeleportadorGuilda = {
			{x = 932, y = 1920, z = 2}, -- Civitaten
			{x = 812, y = 1332, z = 7}, -- Ôttô
			{x = 1085, y = 1591, z = 6}, -- Hyalakur
			{x = 583, y = 911, z = 7} -- Maruim Island
		},
		idsTeleportadorGuilda = {},
		teleportadorGuildaGravado = false
	}
end

function Player:teleportarParaGuilda(teleportador)
	if not teleportador then
		teleportador = false
	end

	local posicoes = {
		{
			{x = 600, y = 983, z = 7},
			{x = 545, y = 948, z = 5},
			{x = 448, y = 957, z = 2},
			{x = 647, y = 902, z = 8}
		},
		{
			{x = 606, y = 982, z = 7},
			{x = 538, y = 944, z = 5},
			{x = 450, y = 961, z = 6},
			{x = 638, y = 909, z = 5}
		}
	}

	if not teleportador then
		pegarPosicao = 1
	else
		pegarPosicao = 2
	end

	local vocacao = self:getVocation():getId()

	local posicao
	if isInArray(Vocacoes.sorcerer, vocacao) then
		posicao = posicoes[pegarPosicao][1]
	elseif isInArray(Vocacoes.druid, vocacao) then
		posicao = posicoes[pegarPosicao][2]
	elseif isInArray(Vocacoes.paladin, vocacao) then
		posicao = posicoes[pegarPosicao][3]
	elseif isInArray(Vocacoes.knight, vocacao) then
		posicao = posicoes[pegarPosicao][4]
	end

	self:teleportarJogador(posicao, true)
end

function Player:teleportarParaGuildaRetorno()
	local teleportGuildaRetorno = self:teleportGuildaPosicaoAnterior()
	self:teleportarJogador(teleportadorGuilda.posicoesTeleportadorGuilda[teleportGuildaRetorno], true)
end

function Player:teleportGuildaPosicaoAnterior()
	return self:getStorageValue(Storage.teleportGuildaRetorno)
end

function Player:teleportGuildaTempo()
	local tempo = self:getStorageValue(Storage.teleportGuildaRetornoTempo)

	if os.time() < tempo + Reputacao.viagem.tempoRetorno then
		return true
	end

	return false
end

function Npc:gravarTeleportadorGuilda()
	if not teleportadorGuilda.teleportadorGuildaGravado then
		local npcPosicao = self:getPosition()

		for a, posicao in pairs(teleportadorGuilda.posicoesBase) do
			if posicao.x == npcPosicao.x and posicao.y == npcPosicao.y and posicao.z == npcPosicao.z then
				teleportadorGuilda.idsTeleportadorGuilda[a] = self:getId()
			end
		end
	end
end

function Player:formatarNomeVocacao()
	return firstToUpper(self:getVocation():getName()) .. "s"
end
