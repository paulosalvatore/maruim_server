local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local count = {}
local transfer = {}

function onCreatureAppear(cid)       npcHandler:onCreatureAppear(cid)     end
function onCreatureDisappear(cid)     npcHandler:onCreatureDisappear(cid)     end
function onCreatureSay(cid, type, msg)     npcHandler:onCreatureSay(cid, type, msg)   end
local lastSound = 0
function onThink()
	if lastSound < os.time() then
		lastSound = (os.time() + 5)
		if math.random(100) < 25 then
			Npc():say("Não se esqueça de depositar seu dinheiro no banco antes de ir a alguma aventura.", TALKTYPE_SAY)
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
			'Todo aventureiro possui uma. A grande vantagem é que você consegue acessar seu dinheiro em qualquer afilição de nosso banco! ...',
			'Você gostaria de conhecer um pouco mais sobre as funções {básicas}, as funções {avançadas} ou você já está entediado, por acaso?'
		}, cid)
		npcHandler.topic[cid] = 0
		return true
---------------------------- Balanço ---------------------
	elseif msgcontains(msg, 'balance') or msgcontains(msg, 'balanco') or msgcontains(msg, 'balanço') then
		npcHandler.topic[cid] = 0
		local mensagem
		if player:getBankBalance() >= 100000000 then
			mensagem = "Eu acho que você é um dos mais ricos habitantes desse mundo!"
		elseif player:getBankBalance() >= 10000000 then
			mensagem = "Você conseguiu 10 milhões e continua crescendo!"
		elseif player:getBankBalance() >= 1000000 then
			mensagem = "MEUS DEUS! Você conseguiu o número mágico de UM MILHÃO DE GP!!!"
		elseif player:getBankBalance() >= 100000 then
			mensagem = "Você conseguiu uma boa grana."
		end
		if mensagem ~= nil then
			mensagem = mensagem .. " "
		end
		npcHandler:say(mensagem .. 'O balanço da sua conta é ' .. player:getBankBalance() .. ' gold.', cid)
		return true
---------------------------- Depósito ---------------------
	elseif msgcontains(msg, 'deposit') or msgcontains(msg, 'depositar') or msgcontains(msg, 'depósito') or msgcontains(msg, 'deposito') then
		count[cid] = player:getMoney()
		if count[cid] < 1 then
			npcHandler:say('Você não possui dinheiro suficiente.', cid)
			npcHandler.topic[cid] = 0
			return false
		end
		if msgcontains(msg, 'all') or msgcontains(msg, 'tudo') then
			count[cid] = player:getMoney()
			npcHandler:say('Você tem certeza que deseja depositar ' .. count[cid] .. ' gold?', cid)
			npcHandler.topic[cid] = 2
			return true
		else
			if string.match(msg,'%d+') then
				count[cid] = getMoneyCount(msg)
				if count[cid] < 1 then
					npcHandler:say('Você não possui dinheiro suficiente.', cid)
					npcHandler.topic[cid] = 0
					return false
				end
				npcHandler:say('Você tem certeza que deseja depositar ' .. count[cid] .. ' gold?', cid)
				npcHandler.topic[cid] = 2
				return true
			else
				npcHandler:say('Por gentileza me diga a quantia que você quer depositar.', cid)
				npcHandler.topic[cid] = 1
				return true
			end
		end
		if not isValidMoney(count[cid]) then
			npcHandler:say('Desculpe, mas você não pode depositar essa quantia.', cid)
			npcHandler.topic[cid] = 0
			return false
		end
	elseif npcHandler.topic[cid] == 1 then
		count[cid] = getMoneyCount(msg)
		if isValidMoney(count[cid]) then
			npcHandler:say('Você tem certeza que deseja depositar ' .. count[cid] .. ' gold?', cid)
			npcHandler.topic[cid] = 2
			return true
		else
			npcHandler:say('Você não possui dinheiro suficiente.', cid)
			npcHandler.topic[cid] = 0
			return true
		end
	elseif npcHandler.topic[cid] == 2 then
		if msgcontains(msg, 'yes') or msgcontains(msg, 'sim') then
			if player:getMoney() >= tonumber(count[cid]) then
				player:depositMoney(count[cid])
				npcHandler:say('Pronto, nós adicionamos a quantia de ' .. count[cid] .. ' gold ao seu {balanço}. Você pode {sacar} seu dinheiro sempre que você quiser.', cid)
			else
				npcHandler:say('Você não possui dinheiro suficiente.', cid)
			end
		elseif msgcontains(msg, 'no') or msgcontains(msg, 'nao') or msgcontains(msg, 'não') then
			npcHandler:say('Como quiser. Existe algo mais que eu possa fazer por você?', cid)
		end
		npcHandler.topic[cid] = 0
		return true
---------------------------- Saque --------------------
	elseif msgcontains(msg, 'withdraw') or msgcontains(msg, 'sacar') or msgcontains(msg, 'retirar') then
		if string.match(msg,'%d+') then
			count[cid] = getMoneyCount(msg)
			if isValidMoney(count[cid]) then
				npcHandler:say('Você tem certeza que deseja sacar ' .. count[cid] .. ' gold de sua conta bancária?', cid)
				npcHandler.topic[cid] = 7
			else
				npcHandler:say('Não existe dinheiro suficiente em sua conta bancária.', cid)
				npcHandler.topic[cid] = 0
			end
			return true
		else
			npcHandler:say('Por gentileza me diga a quantia que você deseja sacar.', cid)
			npcHandler.topic[cid] = 6
			return true
		end
	elseif npcHandler.topic[cid] == 6 then
		count[cid] = getMoneyCount(msg)
		if isValidMoney(count[cid]) then
			npcHandler:say('Você tem certeza que deseja sacar ' .. count[cid] .. ' gold de sua conta bancária?', cid)
			npcHandler.topic[cid] = 7
		else
			npcHandler:say('Não existe dinheiro suficiente em sua conta bancária.', cid)
			npcHandler.topic[cid] = 0
		end
		return true
	elseif npcHandler.topic[cid] == 7 then
		if msgcontains(msg, 'yes') or msgcontains(msg, 'sim') then
			if player:getFreeCapacity() >= getMoneyWeight(count[cid]) then
				if not player:withdrawMoney(count[cid]) then
					npcHandler:say('Não existe dinheiro suficiente em sua conta bancária.', cid)
				else
					npcHandler:say('Aqui está, ' .. count[cid] .. ' gold. Por favor me diga se existe algo mais que eu possa fazer por você.', cid)
				end
			else
				npcHandler:say('Ei, espere! Você não possui espaço suficiente no seu inventário para carregar todas essas moedas. Eu não quero que eles caiam no chão, volte aqui com um carrinho!', cid)
			end
			npcHandler.topic[cid] = 0
		elseif msgcontains(msg, 'no') or msgcontains(msg, 'nao') or msgcontains(msg, 'não') then
			npcHandler:say('O cliente é que manda! Volte a qualquer momento que você desejar {sacar} seu dinheiro.', cid)
			npcHandler.topic[cid] = 0
		end
		return true
---------------------------- Transferência --------------------
	elseif msgcontains(msg, 'transfer') or msgcontains(msg, 'transferir') or msgcontains(msg, 'transferencia') or msgcontains(msg, 'transferência') then
		npcHandler:say('Por gentileza me diga a quantia que você quer transferir.', cid)
		npcHandler.topic[cid] = 11
	elseif npcHandler.topic[cid] == 11 then
		count[cid] = getMoneyCount(msg)
		if player:getBankBalance() < count[cid] then
			npcHandler:say('Não existe dinheiro suficiente em sua conta bancária.', cid)
			npcHandler.topic[cid] = 0
			return true
		end
		if isValidMoney(count[cid]) then
			npcHandler:say('Você gostaria de transferir ' .. count[cid] .. ' gold para quem?', cid)
			npcHandler.topic[cid] = 12
		else
			npcHandler:say('Não existe dinheiro suficiente em sua conta bancária.', cid)
			npcHandler.topic[cid] = 0
		end
	elseif npcHandler.topic[cid] == 12 then
		transfer[cid] = msg
		if player:getName() == transfer[cid] then
			npcHandler:say('Me informe qual pessoa irá receber essa quantia!', cid)
			npcHandler.topic[cid] = 0
			return true
		end
		if playerExists(transfer[cid]) then
			npcHandler:say('Então você quer transferir ' .. count[cid] .. ' gold para ' .. transfer[cid] .. '?', cid)
			npcHandler.topic[cid] = 13
		else
			npcHandler:say('Essa pessoa não existe!', cid)
			npcHandler.topic[cid] = 0
		end
	elseif npcHandler.topic[cid] == 13 then
		if msgcontains(msg, 'yes') or msgcontains(msg, 'sim') then
			if not player:transferMoneyTo(transfer[cid], count[cid]) then
				npcHandler:say('Você não pode transferir dinheiro para essa conta bancária.', cid)
			else
				npcHandler:say('Muito bem. Você transferiu ' .. count[cid] .. ' gold para ' .. transfer[cid] ..'.', cid)
				transfer[cid] = nil
			end
		elseif msgcontains(msg, 'no') or msgcontains(msg, 'nao') or msgcontains(msg, 'não') then
			npcHandler:say('Como quiser. Existe algo mais que eu possa fazer por você?', cid)
		end
		npcHandler.topic[cid] = 0
---------------------------- Troca de Dinheiro --------------
	elseif msgcontains(msg, 'change gold') or msgcontains(msg, 'trocar gold') then
		npcHandler:say('Quantos \'platinum coins\' você deseja receber?', cid)
		npcHandler.topic[cid] = 14
	elseif npcHandler.topic[cid] == 14 then
		if getMoneyCount(msg) < 1 then
			npcHandler:say('Desculpe, você não possui \'gold coins\' suficientes.', cid)
			npcHandler.topic[cid] = 0
		else
			count[cid] = getMoneyCount(msg)
			npcHandler:say('Então você deseja que eu troque ' .. count[cid] * 100 .. ' de seus \'gold coins\' em ' .. count[cid] .. ' \'platinum coins\'?', cid)
			npcHandler.topic[cid] = 15
		end
	elseif npcHandler.topic[cid] == 15 then
		if msgcontains(msg, 'yes') or msgcontains(msg, 'sim') then
			if player:removeItem(2148, count[cid] * 100) then
				player:addItem(2152, count[cid])
				npcHandler:say('Aqui está.', cid)
			else
				npcHandler:say('Desculpe, você não possui \'gold coins\' suficientes.', cid)
			end
		else
			npcHandler:say('Como quiser. Existe algo mais que eu possa fazer por você?', cid)
		end
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, 'change platinum') or msgcontains(msg, 'trocar platinum') then
		npcHandler:say('Você gostaria de trocar \'platinum coins\' em \'gold coins\' ou \'crystal coins\'?', cid)
		npcHandler.topic[cid] = 16
	elseif npcHandler.topic[cid] == 16 then
		if msgcontains(msg, 'gold') then
			npcHandler:say('Quantos \'platinum coins\' você gostaria de trocar em \'gold coins\'?', cid)
			npcHandler.topic[cid] = 17
		elseif msgcontains(msg, 'crystal') then
			npcHandler:say('Quantos \'crystal coins\' você deseja receber?', cid)
			npcHandler.topic[cid] = 19
		else
			npcHandler:say('Como quiser. Existe algo mais que eu possa fazer por você?', cid)
			npcHandler.topic[cid] = 0
		end
	elseif npcHandler.topic[cid] == 17 then
		if getMoneyCount(msg) < 1 then
			npcHandler:say('Desculpe, você não possui \'platinum coins\' suficientes.', cid)
			npcHandler.topic[cid] = 0
		else
			count[cid] = getMoneyCount(msg)
			npcHandler:say('Então você deseja que eu troque ' .. count[cid] .. ' de seus \'platinum coins\' em ' .. count[cid] * 100 .. ' \'gold coins\'?', cid)
			npcHandler.topic[cid] = 18
		end
	elseif npcHandler.topic[cid] == 18 then
		if msgcontains(msg, 'yes') or msgcontains(msg, 'sim') then
			if player:removeItem(2152, count[cid]) then
				player:addItem(2148, count[cid] * 100)
				npcHandler:say('Aqui está.', cid)
			else
				npcHandler:say('Desculpe, você não possui \'platinum coins\' suficientes.', cid)
			end
		else
			npcHandler:say('Como quiser. Existe algo mais que eu possa fazer por você?', cid)
		end
		npcHandler.topic[cid] = 0
	elseif npcHandler.topic[cid] == 19 then
		if getMoneyCount(msg) < 1 then
			npcHandler:say('Desculpe, você não possui \'platinum coins\' suficientes.', cid)
			npcHandler.topic[cid] = 0
		else
			count[cid] = getMoneyCount(msg)
			npcHandler:say('Então você deseja que eu troque ' .. count[cid] * 100 .. ' de seus \'platinum coins\' em ' .. count[cid] .. ' \'crystal coins\'?', cid)
			npcHandler.topic[cid] = 20
		end
	elseif npcHandler.topic[cid] == 20 then
		if msgcontains(msg, 'yes') or msgcontains(msg, 'sim') then
			if player:removeItem(2152, count[cid] * 100) then
				player:addItem(2160, count[cid])
				npcHandler:say('Aqui está.', cid)
			else
				npcHandler:say('Desculpe, você não possui \'platinum coins\' suficientes.', cid)
			end
		else
			npcHandler:say('Como quiser. Existe algo mais que eu possa fazer por você?', cid)
		end
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, 'change crystal') then
		npcHandler:say('Quantos \'crystal coins\' você gostaria de trocar em \'platinum coins\'?', cid)
		npcHandler.topic[cid] = 21
	elseif npcHandler.topic[cid] == 21 then
		if getMoneyCount(msg) < 1 then
			npcHandler:say('Desculpe, você não possui \'crystal coins\' suficientes.', cid)
			npcHandler.topic[cid] = 0
		else
			count[cid] = getMoneyCount(msg)
			npcHandler:say('Então você deseja que eu troque ' .. count[cid] .. ' de seus \'crystal coins\' em ' .. count[cid] * 100 .. ' \'platinum coins\'?', cid)
			npcHandler.topic[cid] = 22
		end
	elseif npcHandler.topic[cid] == 22 then
		if msgcontains(msg, 'yes') or msgcontains(msg, 'sim') then
			if player:removeItem(2160, count[cid])  then
				player:addItem(2152, count[cid] * 100)
				npcHandler:say('Aqui está.', cid)
			else
				npcHandler:say('Desculpe, você não possui \'crystal coins\' suficientes.', cid)
			end
		else
			npcHandler:say('Como quiser. Existe algo mais que eu possa fazer por você?', cid)
		end
		npcHandler.topic[cid] = 0
	end
	return true
end

keywordHandler:addKeyword({'money'}, StdModule.say, {npcHandler = npcHandler, text = 'We can {change} money for you. You can also access your {bank account}.'})
keywordHandler:addKeyword({'change'}, StdModule.say, {npcHandler = npcHandler, text = 'There are three different coin types in Tibia: 100 gold coins equal 1 platinum coin, 100 platinum coins equal 1 crystal coin. So if you\'d like to change 100 gold into 1 platinum, simply say \'{change gold}\' and then \'1 platinum\'.'})
keywordHandler:addKeyword({'bank'}, StdModule.say, {npcHandler = npcHandler, text = 'We can {change} money for you. You can also access your {bank account}.'})
keywordHandler:addKeyword({'advanced'}, StdModule.say, {npcHandler = npcHandler, text = 'Your bank account will be used automatically when you want to {rent} a house or place an offer on an item on the {market}. Let me know if you want to know about how either one works.'})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, text = 'You can check the {balance} of your bank account, {deposit} money or {withdraw} it. You can also {transfer} money to other characters, provided that they have a vocation.'})
keywordHandler:addKeyword({'functions'}, StdModule.say, {npcHandler = npcHandler, text = 'You can check the {balance} of your bank account, {deposit} money or {withdraw} it. You can also {transfer} money to other characters, provided that they have a vocation.'})
keywordHandler:addKeyword({'basic'}, StdModule.say, {npcHandler = npcHandler, text = 'You can check the {balance} of your bank account, {deposit} money or {withdraw} it. You can also {transfer} money to other characters, provided that they have a vocation.'})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = 'I work in this bank. I can change money for you and help you with your bank account.'})

npcHandler:setMessage(MESSAGE_GREET, "Pois não? O que eu posso fazer por você, |PLAYERNAME|? Negócios no Banco, talvez?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Tenha um bom dia.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Tenha um bom dia.")
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())