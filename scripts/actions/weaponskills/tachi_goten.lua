-- ---------------------------------
-- Tachi Goten
-- Great Katana weapon skill
-- Skill Level: 70
-- Deals lightning elemental damage to enemy. Damage varies with TP.
-- Will stack with Sneak Attack.
-- Aligned with the Light Gorget / Thunder Gorget.
-- Aligned with the Light Belt / Thunder Belt.
-- Element: Thunder
-- Modifiers: STR:60%
-- 100%TP    200%TP    300%TP
-- .5         .75      1.00
-----------------------------------
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    params.ftp100 = 1.0 params.ftp200 = 1.0 params.ftp300 = 1.0
    params.str_wsc = 0.3
    params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
    params.atk100 = 1 params.atk200 = 1 params.atk300 = 1
    params.hybridWS = true
    params.ele = xi.element.THUNDER
    params.skill = xi.skill.GREAT_KATANA
    params.includemab = true

    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.ftp100 = .5 params.ftp200 = .75 params.ftp300 = 1
        params.str_wsc = 0.6
    end

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
