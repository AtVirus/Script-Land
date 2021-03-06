--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function BurningDepthsNecromancer_OnCombat(Unit, Event)
	Unit:RegisterEvent("BurningDepthsNecromancer_PowerRelease", 7000, 0)
end

function BurningDepthsNecromancer_PowerRelease(Unit, Event) 
	Unit:FullCastSpellOnTarget(51431, Unit:GetMainTank()) 
end

function BurningDepthsNecromancer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BurningDepthsNecromancer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27358, 1, "BurningDepthsNecromancer_OnCombat")
RegisterUnitEvent(27358, 2, "BurningDepthsNecromancer_OnLeaveCombat")
RegisterUnitEvent(27358, 4, "BurningDepthsNecromancer_OnDied")