-----------------------------------
-- Area: Windurst Waters
--  NPC: Kayeel-Payeel
-- Working 100%
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/events/starlight_celebrations")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if xi.events.starlightCelebration.isStarlightEnabled() ~= 0 then
        xi.events.starlightCelebration.npcGiftsNpcOnTrigger(player, 1)
    else
        player:startEvent(975)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
