function Creature:getClosestFreePosition(position, extended)
	local usePosition = Position(position)
	local tiles = { Tile(usePosition) }
	local length = extended and 2 or 1

	local tile
	for y = -length, length do
		for x = -length, length do
			if x ~= 0 or y ~= 0 then
				usePosition.x = position.x + x
				usePosition.y = position.y + y

				tile = Tile(usePosition)
				if tile then
					tiles[#tiles + 1] = tile
				end
			end
		end
	end

	for i = 1, #tiles do
		tile = tiles[i]
		if tile:getCreatureCount() == 0 and not tile:hasProperty(CONST_PROP_IMMOVABLEBLOCKSOLID) then
			return tile:getPosition()
		end
	end
	return Position()
end

function Creature:getPlayer()
	return self:isPlayer() and self or nil
end

function Creature:isItem()
	return false
end

function Creature:isMonster()
	return false
end

function Creature:isNpc()
	return false
end

function Creature:isPlayer()
	return false
end

function Creature:isTile()
	return false
end
