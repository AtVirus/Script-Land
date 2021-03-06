--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function TundraScavenger_OnCombat(Unit, Event)
	Unit:RegisterEvent("TundraScavenger_Maul", 5000, 0)
end

function TundraScavenger_Maul(Unit, Event) 
	Unit:FullCastSpellOnTarget(51875, Unit:GetMainTank()) 
end

function TundraScavenger_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TundraScavenger_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27294, 1, "TundraScavenger_OnCombat")
RegisterUnitEvent(27294, 2, "TundraScavenger_OnLeaveCombat")
RegisterUnitEvent(27294, 4, "TundraScavenger_OnDied")