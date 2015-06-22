local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

keywordHandler:addKeywords({{'forja'}, {'forjar'}}, StdModule.say, {npcHandler = npcHandler, text = "Existem muitas {receitas} para {produzir}, cada uma delas com sua característica e {dificuldade}."})
keywordHandler:addKeyword({'produzir'}, StdModule.say, {npcHandler = npcHandler, text = "Para produzir alguma receita você deverá usar a bigorna. Você pode usar essa que está do meu lado, caso esteja disponível."})
keywordHandler:addKeywords({{'receita'}, {'receitas'}}, StdModule.say, {npcHandler = npcHandler, text = "Existem receitas que você poderá produzir conforme sua evolução como ferreiro, outras você deverá aprender de outras diversas maneiras."})
keywordHandler:addKeywords({{'dificuldade'}, {'dificuldades'}}, StdModule.say, {npcHandler = npcHandler, text = "Existem receitas de diversas dificuldades, conforme sua {evolução} como ferreiro você aprimora suas habilidades, podendo produzir equipamentos cada vez mais poderosos."})
keywordHandler:addKeywords({{'evolucao'}, {'evolução'}}, StdModule.say, {npcHandler = npcHandler, text = "Para evoluir na sua profissão, você deve produzir receitas, mesmo que você não obtenha sucesso, isso lhe garantirá pontos de experiência."})

npcHandler:setMessage(MESSAGE_GREET, "Olá aventureiro, seja bem-vindo à minha {forja}, em que posso lhe ajudar?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Boa viagem aventureiro!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "De nada!!!")

npcHandler:addModule(FocusModule:new())