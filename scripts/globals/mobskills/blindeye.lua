-----------------------------------
--  Blindeye
--
--  Description: Inflicts damage on a single target. Additional effect: Blind
--  Type: Physical
--  Utsusemi/Blink absorb: Yes
--  Range: Single target
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
    local numhits = 1
    local accmod = 1
    local dmgmod = 1
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.physicalTpBonus.DMG_VARIES, 2, 2.25, 2.5)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.BLUNT, info.hitslanded)
    target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.BLUNT)

    local typeEffect = xi.effect.BLINDNESS

    xi.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 15, 0, 120)

    return dmg
end

return mobskillObject
