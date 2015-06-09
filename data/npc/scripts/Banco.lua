local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local count = {}
local transfer = {}
local frases = {
	["inicial"] = "Pois não? O que eu posso fazer por você, |PLAYERNAME|? Negócios no Banco, talvez?",
	["final"] = "Tenha um bom dia.",
	["think"] = "Não se esqueça de depositar seu dinheiro no banco antes de ir a alguma aventura.",
	["dinheiro"] = "Eu posso {trocar} dinheiro para você. Você também pode acessar sua {conta bancária}.",
	["troca"] = "Existem três tipos de moeda: '100 gold coins' é igual a '1 platinum coin', '100 platinum coins' é igual a '1 crystal coin'. Então se você quiser trocar '100 gold coins' em '1 platinum coin', simplesmente diga '{trocar gold}' e então '1 platinum'.",
	["avançado"] = "Sua {conta bancária} será usada automaticamente quando você quiser {alugar} uma casa ou fazer uma oferta em um item no {mercado}. Me diga se você quiser saber sobre como algum desses funciona.",
	["ajuda"] = "Você pode conferir o {balanço} de sua contá bancária, {depositar} ou {sacar} dinheiro. Você também pode {transferir} dinheiro para outra pessoa, contanto que ela tenha uma profissão.",
	["profissão"] = "Eu trabalho nesse banco. Eu posso lhe informar como fazer o {câmbio} de seu dinheiro para trocar em moedas diferentes e ajudá-lo com sua {conta bancária}. Me informe caso precise de {ajuda}.",
	["conta bancária"] = {
		"Todo aventureiro possui uma. A grande vantagem é que você consegue acessar seu dinheiro em qualquer afilição de nosso banco! ...",
		"Você gostaria de conhecer um pouco mais sobre as funções {básicas}, as funções {avançadas} ou já está entediado comigo, por acaso?"
	},
	["balanço"] = {
		"Eu acho que você é um dos mais ricos habitantes desse mundo!",
		"Você conseguiu 10 milhões e continua crescendo!",
		"MEUS DEUS! Você conseguiu o número mágico de UM MILHÃO DE GP!!!",
		"Você conseguiu uma boa grana.",
		"O balanço da sua conta é |PLAYERBALANCE| gold."
	},
	["dinheiro insuficiente possui"] = "Você não possui dinheiro suficiente.",
	["depositar tudo"] = "Você tem certeza que deseja depositar |PLAYERMONEY| gold?",
	["depositar quantia"] = "Você tem certeza que deseja depositar |MONEYCOUNT| gold?",
	["depositar informar quantia"] = "Por gentileza, me diga a quantia que você quer depositar.",
	["quantia insuficiente"] = "Desculpe, mas você não pode depositar essa quantia.",
	["quantidade depositada"] = "Pronto, nós adicionamos a quantia de |SHOWCOUNT| gold ao seu {balanço}. Você pode {sacar} seu dinheiro sempre que você quiser.",
	["negar"] = "Como quiser. Existe algo mais que eu possa fazer por você?",
	["negar saque"] = "O cliente é que manda! Volte a qualquer momento que você desejar {sacar} seu dinheiro.",
	["sacar informar quantia"] = "Por gentileza me diga a quantia que você deseja sacar.",
	["sacar quantia"] = "Você tem certeza que deseja sacar |MONEYCOUNT| gold de sua conta bancária?",
	["dinheiro insuficiente saque"] = "Não existe dinheiro suficiente em sua conta bancária.",
	["saque sucesso"] = "Aqui está, |SHOWCOUNT| gold. Por favor me diga se existe algo mais que eu possa fazer por você.",
	["capacidade insuficiente"] = "Ei, espere! Você não possui espaço suficiente no seu inventário para carregar todas essas moedas. Eu não quero que eles caiam no chão, volte aqui com um carrinho!",
	["transferencia informar quantidade"] = "Por gentileza me diga a quantia que você quer transferir.",
	["transferencia informar pessoa"] = "Você gostaria de transferir |SHOWCOUNT| gold para quem?",
	["transferencia informar pessoa diferente"] = "Me informe qual pessoa irá receber essa quantia!",
	["transferencia confirmar"] = "Então você quer transferir |SHOWCOUNT| gold para quem?",
	["pessoa inexistente"] = "Essa pessoa não existe!",
	["transferencia erro"] = "Você não pode transferir dinheiro para essa conta bancária.",
	["transferencia sucesso"] = "Muito bem. Você transferiu |SHOWCOUNT| gold para |SHOWTRANSFER|.",
	["entregar sucesso"] = "Aqui está!",
	["trocar gold"] = "Quantos 'platinum coins' você deseja receber?",
	["trocar platinum"] = "Você gostaria de trocar 'platinum coins' em 'gold coins' ou 'crystal coins'?",
	["trocar platinum gold"] = "Quantos 'platinum coins' você gostaria de trocar em 'gold coins'?",
	["trocar platinum crystal"] = "Quantos 'crystal coins' você deseja receber?",
	["trocar crystal"] = "Quantos 'crystal coins' você gostaria de trocar em 'platinum coins'?",
	["gold insuficiente"] = "Desculpe, você não possui 'gold coins' suficientes.",
	["platinum insuficiente"] = "Desculpe, você não possui 'platinum coins' suficientes.",
	["crystal insuficiente"] = "Desculpe, você não possui 'crystal coins' suficientes.",
	["trocar gold confirmar"] = "Então você quer que eu troque |MONEYCOUNT100| de seus 'gold coins' em |MONEYCOUNT| 'platinum coins'?",
	["trocar platinum gold confirmar"] = "Então você quer que eu troque |MONEYCOUNT| de seus 'platinum coins' em |MONEYCOUNT100| 'gold coins'?",
	["trocar platinum crystal confirmar"] = "Então você quer que eu troque |MONEYCOUNT100| de seus 'platinum coins' em |MONEYCOUNT| 'crystal coins'?",
	["trocar crystal confirmar"] = "Então você quer que eu troque |MONEYCOUNT| de seus 'crystal coins' em |MONEYCOUNT100| 'platinum coins'?"
}

function onCreatureAppear(cid)       npcHandler:onCreatureAppear(cid)     end
function onCreatureDisappear(cid)     npcHandler:onCreatureDisappear(cid)     end
function onCreatureSay(cid, type, msg)     npcHandler:onCreatureSay(cid, type, msg)   end
local lastSound = 0
function onThink()
	if lastSound < os.time() then
		lastSound = (os.time() + 60)
		if math.random(100) < 10 then
			Npc():say(frases["think"], TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end

local function greetCallback(cid)
	count[cid], transfer[cid] = nil, nil
	return true
end
local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)
---------------------------- Ajuda ------------------------
	if msgcontains(msg, 'bank account') or msgcontains(msg, 'conta bancaria') or msgcontains(msg, 'conta bancária') then
		npcHandler:say({
			frases["conta bancária"][1],
			frases["conta bancária"][2]
		}, cid)
		npcHandler.topic[cid] = 0
		return true
---------------------------- Balanço ---------------------
	elseif msgcontains(msg, 'balance') or msgcontains(msg, 'balanco') or msgcontains(msg, 'balanço') then
		npcHandler.topic[cid] = 0
		local mensagem = ""
		local balanco = player:getBankBalance()
		if balanco >= 100000000 then
			mensagem = frases["balanço"][1]
		elseif balanco >= 10000000 then
			mensagem = frases["balanço"][2]
		elseif balanco >= 1000000 then
			mensagem = frases["balanço"][3]
		elseif balanco >= 100000 then
			mensagem = frases["balanço"][4]
		end
		if mensagem ~= "" then
			mensagem = mensagem .. " "
		end
		npcHandler:say(mensagem .. formatarFrase(frases["balanço"][5], cid, msg), cid)
		return true
---------------------------- Depósito ---------------------
	elseif msgcontains(msg, 'deposit') or msgcontains(msg, 'depositar') or msgcontains(msg, 'depósito') or msgcontains(msg, 'deposito') then
		count[cid] = player:getMoney()
		if count[cid] < 1 then
			npcHandler:say(frases["dinheiro insuficiente"], cid)
			npcHandler.topic[cid] = 0
			return false
		end
		if msgcontains(msg, 'all') or msgcontains(msg, 'tudo') then
			count[cid] = player:getMoney()
			npcHandler:say(frases["depositar tudo"], cid)
			npcHandler.topic[cid] = 2
			return true
		else
			if string.match(msg,'%d+') then
				count[cid] = getMoneyCount(msg)
				if count[cid] < 1 then
					npcHandler:say(frases["dinheiro insuficiente"], cid)
					npcHandler.topic[cid] = 0
					return false
				end
				npcHandler:say(formatarFrase(frases["depositar quantia"], cid, msg), cid)
				npcHandler.topic[cid] = 2
				return true
			else
				npcHandler:say(frases["depositar informar quantia"], cid)
				npcHandler.topic[cid] = 1
				return true
			end
		end
		if not isValidMoney(count[cid]) then
			npcHandler:say(frases["quantia insuficiente"], cid)
			npcHandler.topic[cid] = 0
			return false
		end
	elseif npcHandler.topic[cid] == 1 then
		count[cid] = getMoneyCount(msg)
		if isValidMoney(count[cid]) then
			npcHandler:say(formatarFrase(frases["depositar quantia"], cid, msg), cid)
			npcHandler.topic[cid] = 2
			return true
		else
			npcHandler:say(frases["dinheiro insuficiente"], cid)
			npcHandler.topic[cid] = 0
			return true
		end
	elseif npcHandler.topic[cid] == 2 then
		if msgcontains(msg, 'yes') or msgcontains(msg, 'sim') then
			if player:getMoney() >= tonumber(count[cid]) then
				player:depositMoney(count[cid])
				npcHandler:say(formatarFrase(frases["quantidade depositada"], cid, msg, count[cid]), cid)
			else
				npcHandler:say(frases["dinheiro insuficiente"], cid)
			end
		elseif msgcontains(msg, 'no') or msgcontains(msg, 'nao') or msgcontains(msg, 'não') then
			npcHandler:say(frases["negar"], cid)
		end
		npcHandler.topic[cid] = 0
		return true
---------------------------- Saque --------------------
	elseif msgcontains(msg, 'withdraw') or msgcontains(msg, 'sacar') or msgcontains(msg, 'retirar') then
		if string.match(msg,'%d+') then
			count[cid] = getMoneyCount(msg)
			if isValidMoney(count[cid]) then
				npcHandler:say(formatarFrase(frases["sacar quantia"], cid, msg), cid)
				npcHandler.topic[cid] = 7
			else
				npcHandler:say(frases["dinheiro insuficiente saque"], cid)
				npcHandler.topic[cid] = 0
			end
			return true
		else
			npcHandler:say(frases["sacar informar quantia"], cid)
			npcHandler.topic[cid] = 6
			return true
		end
	elseif npcHandler.topic[cid] == 6 then
		count[cid] = getMoneyCount(msg)
		if isValidMoney(count[cid]) then
			npcHandler:say(formatarFrase(frases["sacar quantia"], cid, msg), cid)
			npcHandler.topic[cid] = 7
		else
			npcHandler:say(frases["dinheiro insuficiente saque"], cid)
			npcHandler.topic[cid] = 0
		end
		return true
	elseif npcHandler.topic[cid] == 7 then
		if msgcontains(msg, 'yes') or msgcontains(msg, 'sim') then
			if player:getFreeCapacity() >= getMoneyWeight(count[cid]) then
				if not player:withdrawMoney(count[cid]) then
					npcHandler:say(frases["dinheiro insuficiente saque"], cid)
				else
					npcHandler:say(formatarFrase(frases["saque sucesso"], cid, msg, count[cid]), cid)
				end
			else
				npcHandler:say(frases["capacidade insuficiente"], cid)
			end
			npcHandler.topic[cid] = 0
		elseif msgcontains(msg, 'no') or msgcontains(msg, 'nao') or msgcontains(msg, 'não') then
			npcHandler:say(frases["negar saque"], cid)
			npcHandler.topic[cid] = 0
		end
		return true
---------------------------- Transferência --------------------
	elseif msgcontains(msg, 'transfer') or msgcontains(msg, 'transferir') or msgcontains(msg, 'transferencia') or msgcontains(msg, 'transferência') then
		npcHandler:say(frases["transferencia informar quantidade"], cid)
		npcHandler.topic[cid] = 11
	elseif npcHandler.topic[cid] == 11 then
		count[cid] = getMoneyCount(msg)
		if player:getBankBalance() < count[cid] then
			npcHandler:say(frases["dinheiro insuficiente saque"], cid)
			npcHandler.topic[cid] = 0
			return true
		end
		if isValidMoney(count[cid]) then
			npcHandler:say(formatarFrase(frases["transferencia confirmar"], cid, msg, count[cid]), cid)
			npcHandler.topic[cid] = 12
		else
			npcHandler:say(frases["dinheiro insuficiente saque"], cid)
			npcHandler.topic[cid] = 0
		end
	elseif npcHandler.topic[cid] == 12 then
		transfer[cid] = msg
		if player:getName() == transfer[cid] then
			npcHandler:say(frases["transferencia informar pessoa diferente"], cid)
			npcHandler.topic[cid] = 0
			return true
		end
		if playerExists(transfer[cid]) then
			npcHandler:say(formatarFrase(frases["transferencia confirmar"], cid, msg, count[cid], transfer[cid]), cid)
			npcHandler.topic[cid] = 13
		else
			npcHandler:say(frases["pessoa inexistente"], cid)
			npcHandler.topic[cid] = 0
		end
	elseif npcHandler.topic[cid] == 13 then
		if msgcontains(msg, 'yes') or msgcontains(msg, 'sim') then
			if not player:transferMoneyTo(transfer[cid], count[cid]) then
				npcHandler:say(frases["transferencia erro"], cid)
			else
				npcHandler:say(formatarFrase(frases["transferencia sucesso"], cid, msg, count[cid], transfer[cid]), cid)
				transfer[cid] = nil
			end
		elseif msgcontains(msg, 'no') or msgcontains(msg, 'nao') or msgcontains(msg, 'não') then
			npcHandler:say(frases["negar"], cid)
		end
		npcHandler.topic[cid] = 0
---------------------------- Troca de Dinheiro --------------
	elseif msgcontains(msg, 'change gold') or msgcontains(msg, 'trocar gold') then
		npcHandler:say(frases["trocar gold"], cid)
		npcHandler.topic[cid] = 14
	elseif npcHandler.topic[cid] == 14 then
		if getMoneyCount(msg) < 1 then
			npcHandler:say(frases["gold insuficiente"], cid)
			npcHandler.topic[cid] = 0
		else
			count[cid] = getMoneyCount(msg)
			npcHandler:say(formatarFrase(frases["trocar gold confirmar"], cid, msg), cid)
			npcHandler.topic[cid] = 15
		end
	elseif npcHandler.topic[cid] == 15 then
		if msgcontains(msg, 'yes') or msgcontains(msg, 'sim') then
			if player:removeItem(2148, count[cid] * 100) then
				player:addItem(2152, count[cid])
				npcHandler:say(frases["entregar sucesso"], cid)
			else
				npcHandler:say(frases["gold insuficiente"], cid)
			end
		else
			npcHandler:say(frases["negar"], cid)
		end
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, 'change platinum') or msgcontains(msg, 'trocar platinum') then
		npcHandler:say(frases["trocar platinum"], cid)
		npcHandler.topic[cid] = 16
	elseif npcHandler.topic[cid] == 16 then
		if msgcontains(msg, 'gold') then
			npcHandler:say(frases["trocar platinum gold"], cid)
			npcHandler.topic[cid] = 17
		elseif msgcontains(msg, 'crystal') then
			npcHandler:say(frases["trocar platinum crystal"], cid)
			npcHandler.topic[cid] = 19
		else
			npcHandler:say(frases["negar"], cid)
			npcHandler.topic[cid] = 0
		end
	elseif npcHandler.topic[cid] == 17 then
		if getMoneyCount(msg) < 1 then
			npcHandler:say(frases["platinum insuficiente"], cid)
			npcHandler.topic[cid] = 0
		else
			count[cid] = getMoneyCount(msg)
			npcHandler:say(formatarFrase(frases["trocar platinum gold confirmar"], cid, msg), cid)
			npcHandler.topic[cid] = 18
		end
	elseif npcHandler.topic[cid] == 18 then
		if msgcontains(msg, 'yes') or msgcontains(msg, 'sim') then
			if player:removeItem(2152, count[cid]) then
				player:addItem(2148, count[cid] * 100)
				npcHandler:say(frases["entregar sucesso"], cid)
			else
				npcHandler:say(frases["platinum insuficiente"], cid)
			end
		else
			npcHandler:say(frases["negar"], cid)
		end
		npcHandler.topic[cid] = 0
	elseif npcHandler.topic[cid] == 19 then
		if getMoneyCount(msg) < 1 then
			npcHandler:say(frases["platinum insuficiente"], cid)
			npcHandler.topic[cid] = 0
		else
			count[cid] = getMoneyCount(msg)
			npcHandler:say(formatarFrase(frases["trocar platinum crystal confirmar"], cid, msg), cid)
			npcHandler.topic[cid] = 20
		end
	elseif npcHandler.topic[cid] == 20 then
		if msgcontains(msg, 'yes') or msgcontains(msg, 'sim') then
			if player:removeItem(2152, count[cid] * 100) then
				player:addItem(2160, count[cid])
				npcHandler:say(frases["entregar sucesso"], cid)
			else
				npcHandler:say(frases["platinum insuficiente"], cid)
			end
		else
			npcHandler:say(frases["negar"], cid)
		end
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, 'change crystal') then
		npcHandler:say(frases["trocar crystal"], cid)
		npcHandler.topic[cid] = 21
	elseif npcHandler.topic[cid] == 21 then
		if getMoneyCount(msg) < 1 then
			npcHandler:say(frases["crystal insuficiente"], cid)
			npcHandler.topic[cid] = 0
		else
			count[cid] = getMoneyCount(msg)
			npcHandler:say(formatarFrase(frases["trocar crystal confirmar"], cid, msg), cid)
			npcHandler.topic[cid] = 22
		end
	elseif npcHandler.topic[cid] == 22 then
		if msgcontains(msg, 'yes') or msgcontains(msg, 'sim') then
			if player:removeItem(2160, count[cid])  then
				player:addItem(2152, count[cid] * 100)
				npcHandler:say(frases["entregar sucesso"], cid)
			else
				npcHandler:say(frases["crystal insuficiente"], cid)
			end
		else
			npcHandler:say(frases["negar"], cid)
		end
		npcHandler.topic[cid] = 0
	end
	return true
end

keywordHandler:addKeywords({{'money'}, {'dinheiro'}, {'bank'}, {'banco'}}, StdModule.say, {npcHandler = npcHandler, text = frases["dinheiro"]})
keywordHandler:addKeywords({{'exchange'}, {'câmbio'}, {'cambio'}}, StdModule.say, {npcHandler = npcHandler, text = frases["troca"]})
keywordHandler:addKeywords({{'advanced'}, {'avançado'}, {'avancado'}}, StdModule.say, {npcHandler = npcHandler, text = frases["avançado"]})
keywordHandler:addKeywords({{'help'}, {'ajuda'}, {'functions'}, {'funções'}, {'funcoes'}, {'basic'}, {'básico'}, {'basico'}}, StdModule.say, {npcHandler = npcHandler, text = frases["ajuda"]})
keywordHandler:addKeywords({{'job'}, {'profissão'}, {'profissao'}}, StdModule.say, {npcHandler = npcHandler, text = frases["profissão"]})

npcHandler:setMessage(MESSAGE_GREET, frases["inicial"])
npcHandler:setMessage(MESSAGE_FAREWELL, frases["final"])
npcHandler:setMessage(MESSAGE_WALKAWAY, frases["final"])
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())