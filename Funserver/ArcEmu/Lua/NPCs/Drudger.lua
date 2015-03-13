{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fswiss\fcharset0 Arial;}}
{\*\generator Msftedit 5.41.15.1515;}\viewkind4\uc1\pard\f0\fs20 function drudger_oncombat(pUnit, event)\par
 setvars(pUnit, \{knockhap=0, furioushap=0\});\par
pUnit:RegisterEvent("drudger_ms", math.random(15000, 20000), 0)\par
pUnit:RegisterEvent("drudger_knock", 1000, 0)\par
pUnit:RegisterEvent("drudger_furious", 1000, 0)\par
pUnit:RegisterEvent("drudger_chat", 500, 1)\par
end\par
\par
function drudger_chat(pUnit, event)\par
    local chatchance = math.random(1, 2)\par
    if chatchance < 2 then \par
    pUnit:RegisterEvent("drudger_class", 500, 1)\par
end\par
end\par
\par
function drudger_class(pUnit, event)\par
local plr = pUnit:GetMainTank()\par
local classget = plr:GetPlayerClass()\par
if (classget == 1) then\par
    pUnit:SendChatMessage(12, 0, "Die puny warrior!")\par
end\par
if (classget == 2) then\par
    pUnit:SendChatMessage(12, 0, "Die puny paladin!")\par
end\par
if (classget == 3) then\par
    pUnit:SendChatMessage(12, 0, "Die puny hunter!")\par
end\par
if (classget == 4) then\par
    pUnit:SendChatMessage(12, 0, "Die puny rogue!")\par
end\par
if (classget == 5) then\par
    pUnit:SendChatMessage(12, 0, "Die puny priest!")\par
end\par
if (classget == 7) then\par
    pUnit:SendChatMessage(12, 0, "Die puny shaman!")\par
end\par
if (classget == 8) then\par
    pUnit:SendChatMessage(12, 0, "Die puny mage!")\par
end\par
if (classget == 9) then\par
    pUnit:SendChatMessage(12, 0, "Die puny warlock!")\par
end\par
if (classget == 11) then\par
    pUnit:SendChatMessage(12, 0, "Die puny druid!")\par
end\par
end\par
\par
function drudger_ms(pUnit, event)\par
local msrand = math.random(1, 10)\par
local mstarg = pUnit:GetMainTank()\par
 if msrand <= 3 and (mstarg ~= nil) then \par
pUnit:FullCastSpellOnTarget(13737, mstarg)\par
        else\par
    end\par
end\par
\par
function drudger_knock(pUnit, event)\par
local knocktarg = pUnit:GetMainTank()\par
local args = getvars(pUnit);\par
 if (knocktarg ~= nil) and (args.knockhap == 0) and pUnit:GetHealthPct() <= 50 then\par
pUnit:StopMovement(4000)\par
pUnit:FullCastSpellOnTarget(13737, knocktarg)\par
pUnit:RegisterEvent("drudger_knockmark", 500, 1)\par
        else\par
    end\par
end\par
\par
function drudger_knockmark(pUnit, event)\par
\tab local args = getvars(pUnit);\par
\tab args.knockhap=1;\par
\tab setvars(pUnit, args);\par
end\par
\par
function drudger_furious(pUnit, event)\par
local args = getvars(pUnit);\par
 if (args.furioushap == 0) and pUnit:GetHealthPct() <= 20 then\par
pUnit:CastSpell(35491)\par
pUnit:RegisterEvent("drudger_furiousmark", 500, 1)\par
        else\par
    end\par
end\par
\par
function drudger_furiousmark(pUnit, event)\par
\tab local args = getvars(pUnit);\par
\tab args.furioushap=1;\par
\tab setvars(pUnit, args);\par
end\par
\par
function drudger_leavecombat(pUnit, event)\par
\tab pUnit:RemoveEvents()\par
end\par
\par
function drudger_died(pUnit, event)\par
\tab pUnit:RemoveEvents()\par
end\par
\par
RegisterUnitEvent(20004, 1, "drudger_oncombat")\par
RegisterUnitEvent(20004, 2, "drudger_leavecombat")\par
RegisterUnitEvent(20004, 4, "drudger_died")\par
}
 