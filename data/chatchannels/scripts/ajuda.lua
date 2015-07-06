local CHANNEL_HELP = 7

local muted = Condition(CONDITION_CHANNELMUTEDTICKS, CONDITIONID_DEFAULT)
muted:setParameter(CONDITION_PARAM_SUBID, CHANNEL_HELP)
muted:setParameter(CONDITION_PARAM_TICKS, 3600000)

function onSpeak(player, type, message)
	local playerAccountType = player:getAccountType()
	if player:getLevel() == 1 and playerAccountType == ACCOUNT_TYPE_NORMAL then
		player:sendCancelMessage("Você precisa ter nível maior do que 1 para falar neste canal.")
		return false
	end

	if player:getCondition(CONDITION_CHANNELMUTEDTICKS, CONDITIONID_DEFAULT, CHANNEL_HELP) then
		player:sendCancelMessage("Você está proibido de usar o 'Canal de Ajuda' por uso inapropriado.")
		return false
	end

	if playerAccountType >= ACCOUNT_TYPE_TUTOR then
		if string.sub(message, 1, 6) == "!mute " then
			local targetName = string.sub(message, 7)
			local target = Player(targetName)
			if target ~= nil then
				if playerAccountType > target:getAccountType() then
					if not target:getCondition(CONDITION_CHANNELMUTEDTICKS, CONDITIONID_DEFAULT, CHANNEL_HELP) then
						target:addCondition(muted)
						sendChannelMessage(CHANNEL_HELP, TALKTYPE_CHANNEL_R1, target:getName() .. " foi mutado por " .. player:getName() .. " por utilizar o 'Canal de Ajudo' inapropriadamente.")
					else
						player:sendCancelMessage("Esse jogador já está mutado.")
					end
				else
					player:sendCancelMessage("Você não está autorizado a mutar esse jogador.")
				end
			else
				player:sendCancelMessage(RETURNVALUE_PLAYERWITHTHISNAMEISNOTONLINE)
			end
			return false
		elseif string.sub(message, 1, 8) == "!unmute " then
			local targetName = string.sub(message, 9)
			local target = Player(targetName)
			if target ~= nil then
				if playerAccountType > target:getAccountType() then
					if target:getCondition(CONDITION_CHANNELMUTEDTICKS, CONDITIONID_DEFAULT, CHANNEL_HELP) then
						target:removeCondition(CONDITION_CHANNELMUTEDTICKS, CONDITIONID_DEFAULT, CHANNEL_HELP)
						sendChannelMessage(CHANNEL_HELP, TALKTYPE_CHANNEL_R1, target:getName() .. " foi desmutado por " .. player:getName() .. ".")
					else
						player:sendCancelMessage("Esse jogador não está mutado.")
					end
				else
					player:sendCancelMessage("Você não está autorizado a desmutar esse jogador.")
				end
			else
				player:sendCancelMessage(RETURNVALUE_PLAYERWITHTHISNAMEISNOTONLINE)
			end
			return false
		end
	end

	if type == TALKTYPE_CHANNEL_Y then
		if playerAccountType >= ACCOUNT_TYPE_TUTOR or getPlayerFlagValue(player, PlayerFlag_TalkOrangeHelpChannel) then
			type = TALKTYPE_CHANNEL_O
		end
	elseif type == TALKTYPE_CHANNEL_O then
		if playerAccountType < ACCOUNT_TYPE_TUTOR and not getPlayerFlagValue(player, PlayerFlag_TalkOrangeHelpChannel) then
			type = TALKTYPE_CHANNEL_Y
		end
	elseif type == TALKTYPE_CHANNEL_R1 then
		if playerAccountType < ACCOUNT_TYPE_GAMEMASTER and not getPlayerFlagValue(player, PlayerFlag_CanTalkRedChannel) then
			if playerAccountType >= ACCOUNT_TYPE_TUTOR or getPlayerFlagValue(player, PlayerFlag_TalkOrangeHelpChannel) then
				type = TALKTYPE_CHANNEL_O
			else
				type = TALKTYPE_CHANNEL_Y
			end
		end
	end
	return type
end
