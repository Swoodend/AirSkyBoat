-----------------------------------
--  Impale
--
--  Description: Deals damage to a single target. Additional effect: Paralysis (NM version AE applies a strong poison effect and resets enmity on target)
--  Type: Physical
--  Utsusemi/Blink absorb: 1 shadow (NM version ignores shadows)
--  Range: Melee
--  Notes:
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/mobskills")
-----------------------------------
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local typeEffect = xi.effect.PARALYSIS
    local numhits = 1
    local accmod = 1
    local dmgmod = 1
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.magicalTpBonus.NO_EFFECT, 1, 1.25, 1.5)
    local shadows = info.hitslanded

    if mob:isMobType(xi.mobskills.mobType.NOTORIOUS) then
        shadows = xi.mobskills.shadowBehavior.IGNORE_SHADOWS
        typeEffect = xi.effect.POISON
        mob:resetEnmity(target)
    end

    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.PIERCING, shadows)
    xi.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 20, 0, 120)
    target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.PIERCING)

    return dmg
end

return mobskillObject
