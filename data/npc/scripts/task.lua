local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(player)       npcHandler:onCreatureAppear(player)       end
function onCreatureDisappear(player)     npcHandler:onCreatureDisappear(player)       end
function onCreatureSay(player, type, msg)
	npcHandler:setMessage(MESSAGE_GREET, "{tasks}, {tarefas}")
	npcHandler:onCreatureSay(player, type, msg)
end
function onThink()         npcHandler:onThink()           end
local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if isInArray({"tasks", "tarefas"}, msg) then
		player:enviarTasksModalPrincipal()
		player:registerEvent("Tasks")
		npcHandler:unGreet(cid)
	end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())