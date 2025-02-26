-----------------------------------
-- Area: Bastok Mines
--  NPC: Gonija
-- Type: Chocobo Breeder
-- !pos 28 0 -105 234
-----------------------------------
require("scripts/globals/settings")
local ID = require("scripts/zones/Bastok_Mines/IDs")
require("scripts/globals/events/starlight_celebrations")
-----------------------------------

local entity = {}

entity.onTrade = function(player, npc, trade)
    xi.events.starlightCelebration.onStarlightSmilebringersTrade(player, trade, npc)
end

entity.onTrigger = function(player, npc)
    player:startEvent(534)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
