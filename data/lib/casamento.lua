STATUS_CASAMENTO_PEDIDO = 1
STATUS_CASAMENTO_CASADO = 2
LOOK_MARRIAGE_DESCR = true
ITEM_WEDDING_RING = 2121
ITEM_ENGRAVED_WEDDING_RING = 10502
ITEM_WEDDING_OUTFIT_BOX = 10503
CUSTO_DIVORCIO = 10000

function Player:pegarConjuge()
	local id = self:getGuid()
    local resultQuery = db.storeQuery("SELECT `casamento_conjuge` FROM `players` WHERE `id` = " .. db.escapeString(id))
    if resultQuery ~= false then
        local ret = result.getDataInt(resultQuery, "casamento_conjuge")
        result.free(resultQuery)
        return ret
    end
    return -1
end

function Player:definirConjuge(conjuge)
    db.query("UPDATE `players` SET `casamento_conjuge` = " .. db.escapeString(conjuge) .. " WHERE `id` = " .. db.escapeString(self:getGuid()))
end

function Player:pegarStatusCasamento()
    local resultQuery = db.storeQuery("SELECT `casamento_status` FROM `players` WHERE `id` = " .. db.escapeString(self:getGuid()))
    if resultQuery ~= false then
        local ret = result.getDataInt(resultQuery, "casamento_status")
        result.free(resultQuery)
        return ret
    end
    return -1
end

function Player:definirStatusCasamento(status)
    db.query("UPDATE `players` SET `casamento_status` = " .. db.escapeString(status) .. " WHERE `id` = " .. db.escapeString(self:getGuid()))
end

function Player:desfazerCasamento()
	local conjuge = self:pegarConjuge()
	self:definirStatusCasamento(0)
	self:definirConjuge(0)
    db.query("UPDATE `players` SET `casamento_status` = '0', `casamento_conjuge` = '0' WHERE `id` = " .. db.escapeString(conjuge))
end

function Player:pegarPropostas()
	local propostas = {}
    local resultId = db.storeQuery("SELECT `id` FROM `players` WHERE `casamento_conjuge` = " .. db.escapeString(self:getGuid()))
	if resultId ~= false then
		repeat
		table.insert(propostas, getPlayerNameById(result.getDataInt(resultId, "id")))
		until not result.next(resultId)
		result.free(resultId)
	end
	return propostas
end

function exibirPropostas(propostas)
	local exibirPropostas = ""
	for a, b in pairs(propostas) do
		exibirPropostas = exibirPropostas .. "{" .. b .. "}"
		if a < #propostas - 1 then
			exibirPropostas = exibirPropostas .. ", "
		elseif a == #propostas - 1 then
			exibirPropostas = exibirPropostas .. " e "
		end
	end
	return exibirPropostas
end

function Player:pegarDescricaoCasamento(thing)
    local descricao = ""
    if thing:pegarStatusCasamento() == STATUS_CASAMENTO_CASADO then
        local conjuge = thing:pegarConjuge()
        if self == thing then
            descricao = descricao .. " You are "
        elseif thing:getSex() == PLAYERSEX_FEMALE then
            descricao = descricao .. " She is "
        else
            descricao = descricao .. " He is "
        end
        descricao = descricao .. "married to " .. getPlayerNameById(conjuge) .. '.'
    end
    return descricao
end
