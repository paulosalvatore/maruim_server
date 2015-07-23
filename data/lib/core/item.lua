function Item:getType()
	return ItemType(self:getId())
end

function Item:isContainer()
	return false
end

function Item:isCreature()
	return false
end

function Item:isPlayer()
	return false
end

function Item:isTeleport()
	return false
end

function Item:isTile()
	return false
end
