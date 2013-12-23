-- Initialize tables
if not cpoworks then cpoworks = {} end
cpoworks.UseHotKeys = false

--Hides button made on default profile.
SLASH_STATUSFRAME1="/TOTEMBUTTON" 
SlashCmdList.STATUSFRAME=function() 
	if PE_Buttons_totems:IsShown()then 
		PE_Buttons_totems:Hide()
	else 
		PE_Buttons_totems:Show()
	end 
end 

SLASH_USEHOTKEYS1="/USEHOTKEYS" 
SlashCmdList.USEHOTKEYS=function() 
	if cpoworks.UseHotKeys then 
		print("Hotkeys: |cFFFF0000Disabled")	
		cpoworks.UseHotKeys = false
	else 
		print("Hotkeys: |cFF00FF00Enabled")
		cpoworks.UseHotKeys = true
	end 
end 

-- Convert Spell ID to Spell Name
function UnitBuffID(unit, spell, filter)
	if not unit or unit == nil or not UnitExists(unit) then return false end
	if spell then spell = GetSpellInfo(spell) else return false end
	
	if filter then return UnitBuff(unit, spell, filter) else return UnitBuff(unit, spell) end
end
function UnitDebuffID(unit, spell, filter)
	if not unit or unit == nil or not UnitExists(unit) then return false end
	if spell then spell = GetSpellInfo(spell) else return false end
	
	if filter then return UnitDebuff(unit, spell, filter) else return UnitDebuff(unit, spell) end
end

function InMeleeSpell()
	meleeSpell = 0
	
	if select(2,UnitClass("player")) == "WARRIOR" then
		meleeSpell = 78
	end
	
	if select(2,UnitClass("player")) == "SHAMAN" then
		meleeSpell = 73899
	end
	
	return meleeSpell
end 

if not (totemX and totemY) then
		totemX,totemY = 0,0
end

function totemDistance()
		local totemName = select(2,GetTotemInfo(1)) or select(2,GetTotemInfo(2))
		local fire = GetSpellInfo(2894)
		local earth = GetSpellInfo(2062)

		if totemX ~= (0 or nil) and totemY ~= (0 or nil) and totemName ~= (fire or earth) then
			local a,b,c,d,e,f,g,h,i,j = GetAreaMapInfo(GetCurrentMapAreaID())
			local a1 , b1 = GetPlayerMapPosition("Player")
			local x1 , y1 = a1 * 1000, b1 * 1000
			local a2 , b2 = totemX, totemY
			local x2 , y2 = a2 * 1000, b2 * 1000
			local w = (d - e)
			local h = (f - g)
			local distance = sqrt(min(x1 - x2, w - (x1 - x2))^2 + min(y1 - y2, h - (y1-y2))^2)
			
			return distance
		else
			return 0
		end
	end

--Amount of Cooldown that remains--
function cpoworks.cdRemains(spellid)
	if select(2,GetSpellCooldown(spellid)) + (select(1,GetSpellCooldown(spellid)) - GetTime()) > 0
		then return select(2,GetSpellCooldown(spellid)) + (select(1,GetSpellCooldown(spellid)) - GetTime())
	else return 0
	end
end
	
	
function cpoworks.inMelee()
	if UnitAffectingCombat("player") ~= nil
	and IsSpellInRange(GetSpellInfo(InMeleeSpell()),"target") == 1
	and UnitExists("target") ~= nil
	and UnitCanAttack("player","target") ~= nil
	then return true
	end
end

function cpoworks.IsMouseButton3Down()
	if IsMouseButtonDown(3) then
		return true
	end
end

function cpoworks.IsMouseButton4Down()
	if IsMouseButtonDown(4) then
		return true
	end
end

function cpoworks.IsMouseButton5Down()
	if IsMouseButtonDown(5) then
		return true
	end
end

function cpoworks.SearingTotem()
	distance = totemDistance()
	
	if GetTotemTimeLeft(1) < 3 or distance >= 25 
	and cpoworks.cdRemains(3599) == 0 then
		totemX,totemY = GetPlayerMapPosition("Player")
		return true
	end
end




-- Register library
ProbablyEngine.library.register("cpoworks", cpoworks)