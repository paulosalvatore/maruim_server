function capAll(str)
	local strLimpa = str
	local b = string.gmatch(str, "(.*) %[")
	for a in b do
		b = string.gmatch(a, "(.*) %[")
		strLimpa = a
	end
	for a in b do
		strLimpa = a
	end
	local novaStr = ""; palavraSeparada = string.gmatch(strLimpa, "([^%s]+)")
	for v in palavraSeparada do
		v = v:gsub("^%l", string.upper)
		if novaStr ~= "" then
			novaStr = novaStr.." "..v
		else
			novaStr = v
		end
	end
	local formatar = {
		{"Of", "of"}
	}
	for a, b in pairs(formatar) do
		novaStr = novaStr:gsub(b[1], b[2])
	end
	novaStr = str:gsub(strLimpa, novaStr)
	return novaStr
end

function formatarValor(valor, exibirDecimal)
	if exibirDecimal == nil then
		exibirDecimal = false
	end
	local decimal = string.sub(tostring(valor),-2)
	if not exibirDecimal then
		while string.sub(tostring(decimal),-1) == "0" do
			decimal = string.sub(tostring(decimal),-2,string.len(tostring(decimal))-1)
		end
		if decimal ~= "" then
			decimal = "." .. decimal
		end
	else
		decimal = "." .. decimal
	end
	return math.floor(valor/100) .. decimal
end

function formatarPeso(valor)
	return formatarValor(valor, true) .. " oz"
end

function formatarTempo(tempo)
	local exibirTempo = " segundo"
	if tempo > 1 then
		exibirTempo = exibirTempo .. "s"
	end
	return tempo .. exibirTempo
end

function searchArrayKey(t, value)
	for k, v in pairs(t) do
		if v == value then
			return k
		end
	end
	return nil
end

function getKeysSortedByValue(tbl, sortFunction)
	local keys = {}
	for key in pairs(tbl) do
		table.insert(keys, key)
	end
	table.sort(keys, function(a, b)
		return sortFunction(tbl[a], tbl[b])
	end)
	return keys
end

function getFluidNameByType(type)
	if fluids[type] ~= nil then
		return fluids[type].name
	end
	return nil
end

function formatarFrase(frase, cid, msg, count, transfer)
	local player = Player(cid)
	if frase:find("|PLAYERNAME|") then
		frase = frase:gsub("|PLAYERNAME|", player:getName())
	end
	if frase:find("|PLAYERBALANCE|") then
		frase = frase:gsub("|PLAYERBALANCE|", player:getBankBalance())
	end
	if frase:find("|PLAYERMONEY|") then
		frase = frase:gsub("|PLAYERMONEY|", player:getMoney())
	end
	if frase:find("|MONEYCOUNT|") then
		frase = frase:gsub("|MONEYCOUNT|", getMoneyCount(msg))
	end
	if frase:find("|MONEYCOUNT100|") then
		frase = frase:gsub("|MONEYCOUNT100|", getMoneyCount(msg)*100)
	end
	if frase:find("|SHOWCOUNT|") then
		frase = frase:gsub("|SHOWCOUNT|", count)
	end
	if frase:find("|SHOWTRANSFER|") then
		frase = frase:gsub("|SHOWTRANSFER|", transfer)
	end
	if frase:find("|SENHOR|") then
		local exibir = "Senhor"
		if player:getSex() == 0 then
			exibir = "Senhora"
		end
		frase = frase:gsub("|SENHOR|", exibir)
	end
	if frase:find("|MESTRE|") then
		local exibir = "Mestre"
		if player:getSex() == 0 then
			exibir = "Mestra"
		end
		frase = frase:gsub("|MESTRE|", exibir)
	end
	if frase:find("|VOCATIONNAME|") then
		frase = frase:gsub("|VOCATIONNAME|", player:getVocation():getName())
	end
	return frase
end

function formatarNomeCidade(nomeCidade)
	if nomeCidade == "Otto" then
		nomeCidade = "Ôttô"
	elseif nomeCidade == "Khazad-dum" then
		nomeCidade = "Khazad-dûm"
	end
	return nomeCidade
end

function playerExists(name)
	local resultId = db.storeQuery('SELECT `name` FROM `players` WHERE `name` = ' .. db.escapeString(name))
	if resultId then
		result.free(resultId)
		return true
	end
	return false
end

function isValidMoney(money)
	return tonumber(money) ~= nil and money > 0 and money < 4294967296
end

function getMoneyCount(string)
	local b, e = string:find("%d+")
	local money = b and e and tonumber(string:sub(b, e)) or -1
	if isValidMoney(money) then
		return money
	end
	return -1
end

function getMoneyWeight(money)
	local gold = money
	local crystal = math.floor(gold / 10000)
	gold = gold - crystal * 10000
	local platinum = math.floor(gold / 100)
	gold = gold - platinum * 100
	return (ItemType(2160):getWeight() * crystal) + (ItemType(2152):getWeight() * platinum) + (ItemType(2148):getWeight() * gold)
end

function Player.withdrawMoney(self, amount)
	local balance = self:getBankBalance()
	if amount > balance or not self:addMoney(amount) then
		return false
	end

	self:setBankBalance(balance - amount)
	return true
end

function Player.depositMoney(self, amount)
	if not self:removeMoney(amount) then
		return false
	end

	self:setBankBalance(self:getBankBalance() + amount)
	return true
end

function Player.addMoney(self, amount)
	self:setBankBalance(self:getBankBalance() + amount)
	return true
end

function Player.transferMoneyTo(self, target, amount)
	local balance = self:getBankBalance()
	if amount > balance then
		return false
	end

	local targetPlayer = Player(target)
	if targetPlayer then
		targetPlayer:setBankBalance(targetPlayer:getBankBalance() + amount)
	else
		if not playerExists(target) then
			return false
		end
		db.query("UPDATE `players` SET `balance` = `balance` + '" .. amount .. "' WHERE `name` = " .. db.escapeString(target))
	end

	self:setBankBalance(self:getBankBalance() - amount)
	return true
end

function isWalkable(pos, creature, proj, pz)
	if getTileThingByPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0}).itemid == 0 then return false end
	if getTopCreature(pos).uid > 0 and creature then return false end
	if getTileInfo(pos).protection and pz then return false, true end
	local n = not proj and 3 or 2
	for i = 0, 255 do
		pos.stackpos = i
		local tile = getTileThingByPos(pos)
		if tile.itemid ~= 0 and not isCreature(tile.uid) then
			if hasProperty(tile.uid, n) or hasProperty(tile.uid, 7) then
				return false
			end
		end
	end
	return true
end

function Player.adicionarReputacao(self, valor)
	self:setStorageValue(Storage.reputacao, self:pegarReputacao()+valor)
end

function Player.pegarReputacao(self)
	return math.max(0, self:getStorageValue(Storage.reputacao))
end

function Player.pegarRankReputacao(self)
	local reputacao = self:pegarReputacao()
	local rankId
	for a, b in pairs(Reputacao.ranks) do
		if b.pontos == 0 then
			rankId = a
		elseif b.pontos <= reputacao then
			rankId = a
		else
			return rankId
		end
	end
	return rankId
end

function pegarNomeRank(rankId)
	return Reputacao.ranks[rankId].nome
end

function pegarReputacaoRank(rankId)
	if Reputacao.ranks[rankId] ~= nil then
		return Reputacao.ranks[rankId].pontos
	end
	return false
end

function Player.isPromoted(self)
	local vocation = self:getVocation()
	local promotedVocation = vocation:getPromotion()
	promotedVocation = promotedVocation and promotedVocation:getId() or 0
	return promotedVocation == 0 and vocation:getId() ~= promotedVocation
end

function Player.promote(self)
	self:setVocation(Vocation(self:getVocation():getPromotion():getId()))
end

function getExpForLevel(level)
	level = level - 1
	return ((50 * level * level * level) - (150 * level * level) + (400 * level)) / 3
end

function Player.addLevel(self)
	self:addExperience(getExpForLevel(self:getLevel() + 1) - self:getExperience())
end

function Player.teleportarJogador(self, posicao, forcar, extended)
	if not self then
		return
	end

	if not extended then
		extended = false
	end

	if not forcar then
		local posicaoLivre = self:getClosestFreePosition(posicao, extended)
		if posicaoLivre.x > 0 and posicaoLivre.y > 0 then
			posicao = posicaoLivre
		end
	end

	if self:teleportTo(posicao) then
		self:setDirection(direcoes["sul"])
		Position(posicao):sendMagicEffect(efeitos["teleport"])
		return true
	end
	return false
end

function Player.curarJogador(self)
	self:addHealth(self:getMaxHealth()-self:getHealth())
end

function Player.removerDebuffs(self)
	for i, v in ipairs(conditionsHealing) do
		if getCreatureCondition(self, v) == true then
			doRemoveCondition(self, v)
		end
	end
end

function removerAtributosItem(item)
	local item = Item(item)
	if item:getAttribute(ITEM_ATTRIBUTE_ATTACK) then
		item:setAttribute(ITEM_ATTRIBUTE_ATTACK, 0)
	end
	if item:getAttribute(ITEM_ATTRIBUTE_DEFENSE) then
		item:setAttribute(ITEM_ATTRIBUTE_DEFENSE, 0)
	end
	if item:getAttribute(ITEM_ATTRIBUTE_EXTRADEFENSE) then
		item:setAttribute(ITEM_ATTRIBUTE_EXTRADEFENSE, 0)
	end
	return true
end