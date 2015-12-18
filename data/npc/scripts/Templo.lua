local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end

function onCreatureSay(player, type, msg)
	local fraseNpc = "Seja bem-vindo, jovem |PLAYERNAME|! Se você estiver gravemente ferido ou envenenado, eu posso te {curar} sem cobrar nada."
	if player:getItemCount(5941) > 0 and player:getStorageValue(Storage.blessWoodenStake) + tempoBlessWoodenStake <= os.time() then
		fraseNpc = fraseNpc .. " Eu também posso abençoar sua {wooden stake} caso queira."
	end
	npcHandler:setMessage(MESSAGE_GREET, fraseNpc)
	npcHandler:onCreatureSay(player, type, msg)
end

function onThink()						npcHandler:onThink()						end

function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if msg == "wooden stake" then
		if player:getStorageValue(Storage.blessWoodenStake) + tempoBlessWoodenStake <= os.time() then
			if player:removeItem(5941, 1) then
				npcHandler:say("Aqui está, sua 'wooden stake' foi abençoada.", cid)
				player:addItem(5942, 1, true)
				player:setStorageValue(Storage.blessWoodenStake, os.time())
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
			end
		else
			npcHandler:say("Eu só posso abençoar uma vez a cada 24 horas.", cid)
		end
	end
end

keywordHandler:addKeywords({{"heal"}, {"curar"}}, StdModule.say, {npcHandler = npcHandler, text = "Você está ferida, criança. Eu irei curá-la."},
	function(player) return Tile(player:getPosition()):hasFlag(TILESTATE_PROTECTIONZONE) and player:getHealth() < math.max(300, round(player:getMaxHealth()*0.4)) end,
	function(player)
		local playerHP = player:getHealth()
		local playerChecarHP = math.max(300, round(player:getMaxHealth()*0.4))
		local playerRecuperarHP = playerChecarHP-playerHP
		if playerHP < playerChecarHP then player:addHealth(playerRecuperarHP) end
		player:removerDebuffs()
		player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
	end
)

npcHandler:setMessage(MESSAGE_WALKAWAY, "Lembre-se: Se você está gravemente ferido ou envenenado, eu posso te {curar} sem cobrar nada.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Que os Deuses estejam com você, |PLAYERNAME|!")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
