local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end


keywordHandler:addKeyword({{'heal'}, {'curar'}}, StdModule.say, {npcHandler = npcHandler, text = 'Você está ferida, criança. Eu irei curá-la.'},
	function(player) return player:getHealth() < math.max(40, math.floor(player:getMaxHealth()*0.1)) end,
	function(player)
		local playerHP = player:getHealth()
		local playerChecarHP = math.max(40, math.floor(player:getMaxHealth()*0.1))
		local playerRecuperarHP = playerChecarHP-playerHP
		if playerHP < playerChecarHP then player:addHealth(playerRecuperarHP) end
		for i, v in ipairs(conditionsHealing) do
			if(getCreatureCondition(player, v) == true) then
				doRemoveCondition(player, v)
			end
		end
		player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
	end
)

npcHandler:setMessage(MESSAGE_GREET, 'Seja bem-vindo, jovem |PLAYERNAME|! Se você está gravemente ferido ou envenenado, eu posso te {curar} sem cobrar nada.')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Lembre-se: Se você está gravemente ferido ou envenenado, eu posso te {curar} sem cobrar nada.')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Que os Deuses estejam com você, |PLAYERNAME|!')

npcHandler:addModule(FocusModule:new())