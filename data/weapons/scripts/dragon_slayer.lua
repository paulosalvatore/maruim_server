local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, 1)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_SKILL, 0, 0, 1.0, 0)
local combatDragao = createCombatObject()
setCombatParam(combatDragao, COMBAT_PARAM_BLOCKARMOR, 1)
setCombatParam(combatDragao, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combatDragao, COMBAT_FORMULA_SKILL, 0, 0, 1.1, 0)

local dragoes = {"Dragon", "Dragon Hatchling", "Dragon Lord", "Dragon Lord Hatchling", "Frost Dragon", "Frost Dragon Hatchling", "Wyrm", "Elder Wyrm", "Draptor", "Ghastly Dragon", "Undead Dragon"}
function onUseWeapon(cid, var)
	local nomeCriatura = Creature(var.number):getType():getName()
	if isInArray(dragoes, nomeCriatura) then
		return doCombat(cid, combatDragao, var)
	else
		return doCombat(cid, combat, var)
	end
end