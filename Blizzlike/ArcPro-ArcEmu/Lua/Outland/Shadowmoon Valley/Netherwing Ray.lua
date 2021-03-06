--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function NetherwingRay_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("NetherwingRay_DrainMana", 1000, 0)
	Unit:RegisterEvent("NetherwingRay_TailSting", 32000, 0)
end

function NetherwingRay_DrainMana(Unit,Event)
	if(Unit:GetManaPct() == 92) then
		Unit:FullCastSpellOnTarget(17008, Unit:GetRandomPlayer(4))
	end
end

function NetherwingRay_TailSting(Unit,Event)
	Unit:FullCastSpellOnTarget(36659, Unit:GetClosestPlayer())
end

function NetherwingRay_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function NetherwingRay_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(23501, 1, "NetherwingRay_OnEnterCombat")
RegisterUnitEvent(23501, 2, "NetherwingRay_OnLeaveCombat")
RegisterUnitEvent(23501, 4, "NetherwingRay_OnDied")