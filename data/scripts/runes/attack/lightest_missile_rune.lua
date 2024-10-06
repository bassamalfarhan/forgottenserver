local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ENERGYHIT)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)

function onGetFormulaValues(player, level, magicLevel)
	level = math.min(level, 20)
	magicLevel = math.min(magicLevel, 20)
	local min = (level / 5) + (magicLevel * 0.45) + 3
	local max = (level / 5) + (magicLevel * 0.7) + 4
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell(SPELL_RUNE)

function spell.onCastSpell(creature, variant, isHotkey)
	return combat:execute(creature, variant)
end

spell:group("attack")
spell:id(7)
spell:name("Lightest Missile Rune")
spell:runeId(23723)
spell:allowFarUse(true)
spell:charges(10)
spell:runeLevel(1)
spell:cooldown(2000)
spell:groupCooldown(2000)
spell:runeMagicLevel(0)
spell:needTarget(true)
spell:isBlocking(true, false)
spell:register()