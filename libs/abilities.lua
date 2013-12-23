-- Initialize tables
if not repli then repli = { } end

------------------------------------------------------------
------------------------------------------------------------
-------------- NORMAL Functions-----------------------------
------------------------------------------------------------
------------------------------------------------------------
if macros == nil then
	-- Macros
	macros = { 
	    ["SingleTarget"]   		= 1, 
	    ["UseCds"]			= 1, 
	   	["AoE"]   			= 1,
	} 
end
if not _singletarget then _singletarget = true
end

--------------------
-- Slash Commands --
--------------------
if SlashMacros == nil then
	SlashMacros = true
	
	if ProbablyEngine.config.data.button_states.cooldowns then 
	macros["UseCds"] = true 
	else macros["UseCds"] = false
	end
	
	SLASH_USECDS1 = "/usecds"
	function SlashCmdList.USECDS(msg, editbox)
		if macros["UseCds"] == false then
			macros["UseCds"] = true
			print("COOLDOWNS: |cFFFFD700ENABLED")
			ProbablyEngine.buttons.toggle('cooldowns')	
		else
			print("COOLDOWNS: |cFFFFD700DISABLED") 
			ProbablyEngine.buttons.toggle('cooldowns')
			macros["UseCds"] = false
		end
	end
	if ProbablyEngine.config.data.button_states.multitarget then 
	macros["AoE"] = true 
	else macros["AoE"] = false
	end
	SLASH_AOE1 = "/aoe"
	function SlashCmdList.AOE(msg, editbox)
		if macros["AoE"] == false then
			macros["AoE"] = true
			print("AOE: |cFF008000ENABLED")
			ProbablyEngine.buttons.toggle('multitarget')
		else
			print("AOE: |cFF008000DISABLED") 
			ProbablyEngine.buttons.toggle('multitarget')
			macros["AoE"] = false
		end
	end
	
	SLASH_SINGLETARGET1 = "/singletarget"
	function SlashCmdList.SINGLETARGET(msg, editbox)
		if macros["SingleTarget"] == 1 then
		   macros["SingleTarget"] = 2
			print("ROTATION: |cFFFF0000TWO TARGET")	
		elseif macros["SingleTarget"] == 2 then
		  macros["SingleTarget"] = 3
			print("ROTATION: |cFFFF0000THREE TARGET") 
		else 
		macros["SingleTarget"] = 1
		print("ROTATION: |cFFFF0000SINGLE TARGET") 
		end
	end

	SLASH_DECREASETARGET1 = "/decreasetarget"
	function SlashCmdList.DECREASETARGET(msg, editbox)
		if macros["SingleTarget"] == 3 then
		   macros["SingleTarget"] = 2
			print("ROTATION: |cFFFF0000TWO TARGETr")	
		elseif macros["SingleTarget"] == 2 then
		  macros["SingleTarget"] = 1
			print("ROTATION: |cFFFF0000SINGLE TARGET") 
		else 
		macros["SingleTarget"] = 3
		print("ROTATION: |cFFFF0000THREE TARGET") 
		end
	end
end
-----------------------------------
-----------------------------------
-----------TRINKET CHECK-----------

-- Unerring Vision of Lei-Shen
local testEvil = {
	104993, -- EvilEye Raid Finder
	  104744, -- Flexible
	  102298, -- Normal
	  105242, -- Warforged
	  104495, -- Heroic
	  105491, -- Heroic Warforged
}
itemCheck = nil
function itemCheck(tbl)
	local itemCount = 0
	for i=1,#tbl do
		if IsEquippedItem(tbl[i]) then itemCount = itemCount + 1 end
	end
	return itemCount
end


-- Initialize Trinkets
local itemCheck = itemCheck
local testEvil = testEvil
function repli.testor()
if itemCheck(testEvil) == 1 
then
return true
end
end
-----------------------------------
-----------------------------------
-----------------------------------
-----------------------------------
----FUNCTIONS FOR SLASH COMMANDS---
-----------------------------------
-----------------------------------
singletargetrota = nil
function repli.singletargetrota()
if macros["SingleTarget"] == 1 
then
return true
else return false
end
end

twotargetrota = nil
function repli.twotargetrota()
if macros["SingleTarget"] == 2
then
return true
else return false
end
end

threetargetrota = nil
function repli.threetargetrota()
if macros["SingleTarget"] == 3
then
return true
else return false
end
end

-------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
function UnitBuffID(unit, spell, filter)
	if not unit or unit == nil or not UnitExists(unit) then 
		return false 
	end
	if spell then 
		spell = GetSpellInfo(spell) 
	else 
		return false 
	end
	if filter then 
		return UnitBuff(unit, spell, nil, filter) 
	else 
		return UnitBuff(unit, spell) 
	end
end
function UnitDebuffID(unit, spell, filter)
	if not unit or unit == nil or not UnitExists(unit) then 
		return false 
	end
	if spell then 
		spell = GetSpellInfo(spell) 
	else 
		return false 
	end
	if filter then 
		return UnitDebuff(unit, spell, nil, filter) 
	else 
		return UnitDebuff(unit, spell) 
	end
end
function getHp(unit)
if UnitExists(unit)
	then
		return 100 * UnitHealth(unit) / UnitHealthMax(unit)
	else return false
	end
end
function cdRemains(spellid)
	if select(2,GetSpellCooldown(spellid)) + (select(1,GetSpellCooldown(spellid)) - GetTime()) > 0
		then return select(2,GetSpellCooldown(spellid)) + (select(1,GetSpellCooldown(spellid)) - GetTime())
	else return 0
	end
end
function HaveBuff(UnitID,SpellID,TimeLeft,Filter) 
  if not TimeLeft then TimeLeft = 0 end
  if type(SpellID) == "number" then SpellID = { SpellID } end 
  for i=1,#SpellID do 
    local spell, rank = GetSpellInfo(SpellID[i])
    if spell then
      local buff = select(7,UnitBuff(UnitID,spell,rank,Filter)) 
      if buff and ( buff == 0 or buff - GetTime() > TimeLeft ) then return true end
      end
  end
end

function HaveDebuff(UnitID,SpellID,TimeLeft,Filter) 
  if not TimeLeft then TimeLeft = 0 end
  if type(SpellID) == "number" then SpellID = { SpellID } end 
  for i=1,#SpellID do 
    local spell, rank = GetSpellInfo(SpellID[i])
    if spell then
      local debuff = select(7,UnitDebuff(UnitID,spell,rank,Filter)) 
      if debuff and ( debuff == 0 or debuff - GetTime() > TimeLeft ) then return true end
     end
  end
end

CheckCastTime = {}
repli.LastCast = nil
function repli.LastCast(spellid, ytime)
	if ytime > 0 then
		if #CheckCastTime > 0 then
			for i=1, #CheckCastTime do
				if CheckCastTime[i].SpellID == spellid then
					if GetTime() - CheckCastTime[i].CastTime > ytime then
						CheckCastTime[i].CastTime = GetTime()
						return true
					else
						return false
					end
				end
			end
		end
		table.insert(CheckCastTime, { SpellID = spellid, CastTime = GetTime() } )
		return true
	elseif ytime <= 0 then
		return true
	end
	return false
end

--LEAP
function repli.Leap()
if select(2,GetSpellCooldown(6544)) == 0
then
	CastSpellByName(GetSpellInfo(6544))
		if SpellIsTargeting() ~= nil
		then 
			CameraOrSelectOrMoveStart()
			CameraOrSelectOrMoveStop()
		end
		return true
		else return false
end
end

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
--BloodFury --buff.cooldown_reduction.down&(buff.bloodbath.up|(!talent.bloodbath.enabled&debuff.colossus_smash.up))|buff.cooldown_reduction.up&buff.recklessness.up
--function repli.BloodFury()
--if UnitExists("target") and cdRemains(20572) == 0 then
--if UnitBuffID("player",1719) ~= nil
--then
--return true
--else return false
--end
--end
--end

function repli.BloodFury()
if UnitExists("target") and cdRemains(20572) == 0 then
if not repli.testor()
	and(IsPlayerSpell(12292) == true and UnitBuffID("player",12292) ~= nil
	or (IsPlayerSpell(12292) == false and UnitDebuffID("target",86346,"player") ~= nil))
	or repli.testor() and UnitBuffID("player",1719) ~= nil
then
return true
else return false
end
end
end
	
--buff.skull_banner.down&(((cooldown.colossus_smash.remains<2|debuff.colossus_smash.remains>=5)&target.time_to_die>192&buff.cooldown_reduction.up)|buff.recklessness.up)

--Skull Banner
function repli.Skullbanner()
if UnitExists("target") and cdRemains(114207) == 0 then
if UnitBuffID("player",114207) == nil then
if (((cdRemains(86346) < 2 
	or HaveDebuff("target",86346,5,"player")) and repli.testor())
	or UnitBuffID("player",1719) ~= nil)
then
return true
else return false
end
end
end
end
--RECKLESSNESS
function repli.Recklessness()
if UnitExists("target") and cdRemains(1719) == 0 then
if ((cdRemains(86346) < 2 
		or HaveDebuff("target",86346,5,"player"))
		or getHp("target") < 20) -- wo Bloodbath talent
	or (UnitBuffID("player",12292) ~= nil
		or getHp("target") < 20)
then
return true
else return false
end
end
end

	

---------------------------------------------------------------------------------

function repli.HS() --Heroic Strike
	if UnitExists("target") then
	if ((UnitPower("player") >= 40 and UnitDebuffID("target",86346,"player"))
		and getHp("target") >= 20)
	or UnitPower("player") >= 100
	and UnitBuffID("player",12880)
	then 
		return true
	else
		return false
	end
end
end

function repli.SB() --stormbolt
	if UnitExists("target") then
	if UnitDebuffID("target",86346,"player") and repli.testor()--evil_eye >= 1
	then 
		return true
	else
		return false
	end
end
end

function repli.SBnew() --stormbolt
	if UnitExists("target") then
	if UnitDebuffID("target",86346,"player") and not repli.testor()--evil_eye < 1
	then 
		return true
	else
		return false
	end
end
end
function repli.SBnoevil() --stormbolt
	if UnitExists("target") then
	if not repli.testor()--evil_eye < 1
	then 
		return true
	else
		return false
	end
end
end

function repli.RBhigh() --raging_blow
	if UnitExists("target") then
	if UnitDebuffID("target",86346,"player")
	and getHp("target") >= 20
	then 
		return true
	else
		return false
	end
end
end

function repli.BT() --bloodthirst
	if UnitExists("target") 
	then
	if not (getHp("target") < 20
			and UnitDebuffID("target",86346,"player") ~= nil
			and UnitPower("player") >= 30
			and UnitBuffID("player",12880) ~= nil)
	then 
		return true
	else
		return false
	end
end
end

function repli.WShigh()  --wildstrike
	if UnitExists("target") then
	if UnitBuffID("player",46916) ~= nil 
	   and getHp("target") >= 20
	
	then 
		return true
	else
		return false
	end
end
end

function repli.WAIT()  --wait 
	if UnitExists("target") then
	if not ( getHp("target") < 20 
			and UnitDebuffID("target",86346,"player") ~= nil
			and UnitPower("player") >= 30
			and UnitBuffID("player",12880) ~= nil)
	and (cdRemains(23881) <= 1)
	then 
		return true
	else
		return false
	end
end
end

function repli.Execute()  --execute
	if UnitExists("target") then
	if UnitDebuffID("target",86346,"player") ~= nil
	   or UnitPower("player") > 70
	then 
		return true
	else
		return false
	end
end
end

function repli.RBmid()  --raging_blow
	if UnitExists("target") then
	if getHp("target") < 20
	or (UnitBuffID("player",131116) ~= nil
		and select(4,UnitBuffID("player",131116)) == 2)
	or ( UnitDebuffID("target",86346,"player") ~= nil
		or (cdRemains(23881) >= 1
		and not HaveBuff("player",131116,3)))
	then 
		return true
	else
		return false
	end
end
end

function repli.Dragonroar() --dragon_roar
if UnitExists("target") then
if UnitDebuffID("target",86346,"player") == nil
	and ( IsPlayerSpell(12292) == true and UnitBuffID("player",12292) ~= nil
		or IsPlayerSpell(12292) == false) then
return true
else return false
end
end
end

function repli.Bladestorm() --bladestorm /bladestorm,if=enabled&buff.enrage.up&(buff.bloodbath.up|!talent.bloodbath.enabled)
if UnitExists("target") then
if UnitBuffID("player",12880) ~= nil
	and ( IsPlayerSpell(12292) == true and UnitBuffID("player",12292) ~= nil
		or IsPlayerSpell(12292) == false) then
return true
else return false
end
end
end

function repli.Bloodbath()
if UnitExists("target") then
if ( cdRemains(86346) < 2
	or HaveDebuff("target",86346,5,"player"))
then
return true
else return false
end
end
end

-----------------------------------
------TWO TARGET FUNCTIONS---------
-----------------------------------

function repli.Cleavetwo()
if UnitExists("target") then
if (UnitPower("player") >= 60
	and UnitDebuffID("target",86346,"player") ~= nil)
	or UnitPower("player") > 90 then
return true
else return false
end
end
end

function repli.rbtwo() 
if UnitExists("target") then
if (UnitBuffID("player",131116) ~= nil
    and UnitBuffID("player",85739) ~= nil)
	or (UnitBuffID("player",131116) ~= nil
		and getHp("target") < 20)
then
return true 
else return false
end
end
end
		

ProbablyEngine.library.register("repli", repli)