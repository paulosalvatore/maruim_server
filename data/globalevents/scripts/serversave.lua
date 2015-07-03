local shutdownAtServerSave = false
local cleanMapAtServerSave = false

local function serverSave()
	if shutdownAtServerSave then
		Game.setGameState(GAME_STATE_SHUTDOWN)
	else
		Game.setGameState(GAME_STATE_CLOSED)

		if cleanMapAtServerSave then
			cleanMap()
		end

		Game.setGameState(GAME_STATE_NORMAL)
	end
end

local function secondServerSaveWarning()
	broadcastMessage("O servidor irá salvar em um minuto.", MESSAGE_STATUS_WARNING)
	addEvent(serverSave, 60000)
	Game.setGameState(GAME_STATE_STARTUP)
end

local function firstServerSaveWarning()
	broadcastMessage("O servidor irá salvar em 3 minutos.", MESSAGE_STATUS_WARNING)
	addEvent(secondServerSaveWarning, 120000)
end

function onThink(cid, interval, lastExecution)
	broadcastMessage("O servidor irá salvar em 5 minutos.", MESSAGE_STATUS_WARNING)
	addEvent(firstServerSaveWarning, 120000)
	return not shutdownAtServerSave
end
