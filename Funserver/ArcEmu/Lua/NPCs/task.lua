{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fswiss\fcharset0 Arial;}}
{\*\generator Msftedit 5.41.15.1515;}\viewkind4\uc1\pard\f0\fs20 function task_oncombat(pUnit, event)\par
 setvars(pUnit, \{executehap=0, frenzyhap=0\});\par
 pUnit:RegisterEvent("task_talkdep", 500, 1)\par
 pUnit:RegisterEvent("task_combat", 500, 1)\par
end\par
\par
function task_talkdep(pUnit, event)   \par
        local plr = pUnit:GetMainTank()\par
        if plr:HasFinishedQuest(1000) == true then\par
        pUnit:RegisterEvent("task_sayifcomp", 500, 1)\par
else\par
        pUnit:RegisterEvent("task_sayifincomp", 500, 1)\par
end\par
end\par
\par
function task_sayifcomp(pUnit, event)\par
            local plr = pUnit:GetMainTank()\par
            if plr ~= nil then\par
                pUnit:SendChatMessage(12, 0, plr:GetName()..", your attempts to stop these operations end here, our work shall not be jeopardized!")\par
            end\par
        end\par
\par
function task_sayifincomp(pUnit, event)\par
local plr = pUnit:GetMainTank()\par
local classget = plr:GetPlayerClass()\par
if (classget == 1) then\par
    pUnit:SendChatMessage(12, 0, "Die warrior!")\par
end\par
if (classget == 2) then\par
    pUnit:SendChatMessage(12, 0, "Die paladin!")\par
end\par
if (classget == 3) then\par
    pUnit:SendChatMessage(12, 0, "Die hunter!")\par
end\par
if (classget == 4) then\par
    pUnit:SendChatMessage(12, 0, "Die rogue!")\par
end\par
if (classget == 5) then\par
    pUnit:SendChatMessage(12, 0, "Die priest!")\par
end\par
if (classget == 7) then\par
    pUnit:SendChatMessage(12, 0, "Die shaman!")\par
end\par
if (classget == 8) then\par
    pUnit:SendChatMessage(12, 0, "Die mage!")\par
end\par
if (classget == 9) then\par
    pUnit:SendChatMessage(12, 0, "Die warlock!")\par
end\par
if (classget == 11) then\par
    pUnit:SendChatMessage(12, 0, "Die druid!")\par
end\par
end\par
\par
function task_combat(pUnit, event)\par
pUnit:RegisterEvent("task_thoriumdrill", math.random(5000, 10000), 0) \par
pUnit:RegisterEvent("task_thrash", math.random(5000, 10000), 0)\par
pUnit:RegisterEvent("task_execute", 1000, 0)\par
pUnit:RegisterEvent("task_frenzy", 1000, 0)\par
pUnit:RegisterEvent("task_armdrill", math.random(25000, 30000), 0)\par
pUnit:RegisterEvent("task_magnet", math.random(15000, 20000), 0)\par
end\par
\par
function task_armdrill(pUnit, event)\par
local drillrand = math.random(1, 10)\par
local drilltarg = pUnit:GetMainTank()\par
 if drillrand <= 5 and (drilltarg ~= nil) then \par
pUnit:FullCastSpellOnTarget(35047, drilltarg)\par
        else\par
    end\par
end\par
\par
function task_magnet(pUnit, event)\par
local magtarg = pUnit:GetMainTank()\par
 if pUnitGetDistance(magtarg) > 6 and (magtarg ~= nil) then \par
pUnit:FullCastSpellOnTarget(31705, magtarg)\par
        else\par
    end\par
end\par
\par
function task_thoriumdrill(pUnit, event)\par
local thorrand = math.random(1, 10)\par
local thortarg = pUnit:GetMainTank()\par
 if thorrand <= 5 and (thortarg ~= nil) then \par
pUnit:FullCastSpellOnTarget(32005, thortarg)\par
        else\par
    end\par
end\par
\par
function task_thrash(pUnit, event)\par
local thrashrand = math.random(1, 10)\par
 if thrashrand <= 5 then\par
pUnit:CastSpell(3391)\par
else\par
end\par
end\par
\par
function task_execute(pUnit, event)\par
local args = getvars(pUnit);\par
local plrex = pUnit:GetMainTank()\par
 if plrex:GetHealthPct() <= 20 and (plrex ~= nil) and (args.executehap == 0) then\par
pUnit:FullCastSpellOnTarget(56426, plrex)\par
pUnit:RegisterEvent("task_executemark", 500, 1)\par
else\par
end\par
end\par
\par
function task_executemark(pUnit, event)\par
\tab local args = getvars(pUnit);\par
\tab args.executehap=1;\par
\tab setvars(pUnit, args);\par
end\par
\par
function task_frenzy(pUnit, event)\par
 local args = getvars(pUnit);\par
 if pUnit:GetHealthPct() <= 20 and (args.frenzyhap == 0) then\par
pUnit:CastSpell(53361)\par
pUnit:RegisterEvent("task_frenzymark", 500, 1)\par
else\par
end\par
end\par
\par
function task_frenzymark(pUnit, event)\par
\tab local args = getvars(pUnit);\par
\tab args.frenzyhap=1;\par
\tab setvars(pUnit, args);\par
end\par
\par
function task_leavecombat(pUnit, event)\par
\tab pUnit:RemoveEvents()\par
end\par
\par
function task_died(pUnit, event)\par
\tab pUnit:RemoveEvents()\par
end\par
\par
\par
RegisterUnitEvent(20005, 1, "task_oncombat")\par
RegisterUnitEvent(20005, 2, "task_leavecombat")\par
RegisterUnitEvent(20005, 4, "task_died")\par
}
 