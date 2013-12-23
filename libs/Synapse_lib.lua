-- thanks to root and chumii!
local Synapse = { }

local lang = GetCVar("locale")

Synapse.items = { }
Synapse.flagged = GetTime()
Synapse.unflagged = GetTime()

-- Commands -- bug thanks to chumii
-----------------------------------------------------------------------------------------------------------------------------
-- Notify Frame -- (c)xrn overlay for pqr -----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------
    local function onUpdate(self,elapsed) 
      if self.time < GetTime() - 2.5 then
        if self:GetAlpha() == 0 then self:Hide() else self:SetAlpha(self:GetAlpha() - .05) end
      end
    end
    itb = CreateFrame("Frame",nil,ChatFrame1) 
    itb:SetSize(ChatFrame1:GetWidth(),30)
    itb:Hide()
    itb:SetScript("OnUpdate",onUpdate)
    itb:SetPoint("TOPLEFT",0,150)
    itb.text = itb:CreateFontString(nil,"OVERLAY","MovieSubtitleFont")
    itb.text:SetAllPoints()
    itb.texture = itb:CreateTexture()
    itb.texture:SetAllPoints()
    itb.texture:SetTexture(0,0,0,.50) 
    itb.time = 0
    function itb:message(message) 
      self.text:SetText(message)
      self:SetAlpha(1)
      self.time = GetTime() 
      self:Show() 
    end
    
    local function onUpdate(self,elapsed) 
      if self.time < GetTime() - 2.8 then
        if self:GetAlpha() == 0 then self:Hide() else self:SetAlpha(self:GetAlpha() - .05) end
      end
    end
    itb = CreateFrame("Frame",nil,ChatFrame1) 
    itb:SetSize(ChatFrame1:GetWidth(),30)
    itb:Hide()
    itb:SetScript("OnUpdate",onUpdate)
    itb:SetPoint("TOP",0,0)
    itb.text = itb:CreateFontString(nil,"OVERLAY","MovieSubtitleFont")
    itb.text:SetAllPoints()
    itb.texture = itb:CreateTexture()
    itb.texture:SetAllPoints()
    itb.texture:SetTexture(0,0,0,.50) 
    itb.time = 0
    function itb:message(message) 
      self.text:SetText(message)
      self:SetAlpha(1)
      self.time = GetTime() 
      self:Show() 
    end
	
-----------------------------------------------------------------------------------------------------------------------------
-- Create Help -------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------
function Synapse.createHelpText( ... )
  --print(lang .. " is the client language")
  if lang ~= "deDE" then
	print("|cFF0A94FFChat commands:\n|cFFF8EFFB- /syn help -- for a list of available commands\n|cFFF8EFFB- /syn synapse -- installs all the required macros")
	print("|cFF0A94FFQueue spells:\n|cFFF8EFFB- /syn sChains -- Chains of Ice\n|cFFF8EFFB- /syn sNecro -- Necrotic Strike\n|cFFF8EFFB- /syn sRaise -- Raise Ally at target\n|cFFF8EFFB- /syn sPest --Pestilence")
	print("|cFF0A94FFFor any further assistance please visit my thread!")
  else
	print("|cFF0A94FFChat commands:\n|cFFF8EFFB- /syn help -- für eine Liste verfügbarer Chat kommandos\n|cFFF8EFFB- /syn synapse -- um die benötigten Makros zu erstellen")
	print("|cFF0A94FFQueue spells:\n|cFFF8EFFB- /syn sChains -- Eisketten\n|cFFF8EFFB- /syn sNecro -- Nekrotischer Stoß\n|cFFF8EFFB- /syn sRaise -- Verbündeten Erwecken\n|cFFF8EFFB- /syn sPest --Pestilenz")
	print("|cFF0A94FFFür weitere Hilfe, besuche meinen Thread!")
  end  
end  
	
-----------------------------------------------------------------------------------------------------------------------------
-- Create Macros ------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------
function Synapse.createAllMacros( ... )
  local usedslots = select(2,GetNumMacros())
  if usedslots <= 13 then
	DeleteMacro("SYN_TOGGLE");
	DeleteMacro("SYN_AUDIBLE");
	DeleteMacro("SYN_MULTI");
	DeleteMacro("SYN_DEF");
	DeleteMacro("SYN_HOWLING");
	DeleteMacro("SYN_DND");
	DeleteMacro("SYN_KICK");
	DeleteMacro("SYN_FR_COOLDOWNS");
	DeleteMacro("SYN_UH_COOLDOWNS");
	DeleteMacro("SYN_BL_COOLDOWNS");
	DeleteMacro("SYN_COI");
	DeleteMacro("SYN_NECRO");
	DeleteMacro("SYN_PEST");
	DeleteMacro("SYN_RAISE"); 	
	CreateMacro("SYN_AUDIBLE", "inv_misc_bell_01", "/syn audible", 1);	
	CreateMacro("SYN_MULTI", "Ability_Druid_Starfall", "/syn aoe", 1);	
	CreateMacro("SYN_TOGGLE", "inv_sword_04", "/syn toggle", 1);
	CreateMacro("SYN_DEF", "spell_deathknight_iceboundfortitude", "/syn def", 1);
	CreateMacro("SYN_HOWLING", "spell_frost_arcticwinds", "/syn howling", 1);
	CreateMacro("SYN_DND", "spell_shadow_deathanddecay", "/syn dnd", 1);
	CreateMacro("SYN_KICK", "spell_deathknight_mindfreeze", "/syn kick", 1);
	CreateMacro("SYN_FR_COOLDOWNS", "ability_deathknight_pillaroffrost", "/syn pillar", 1);
	CreateMacro("SYN_UH_COOLDOWNS", "spell_shadow_unholyfrenzy", "/syn frenzy", 1);
	CreateMacro("SYN_BL_COOLDOWNS", "inv_sword_07", "/syn dancing", 1);
	if lang ~= "deDE" then
		CreateMacro("SYN_COI", "spell_frost_chainsofice", "#showtooltip Chains of Ice\n/syn sChains", 1);
		CreateMacro("SYN_NECRO", "inv_axe_96", "#showtooltip Necrotic Strike\n/syn sNecro", 1);
		CreateMacro("SYN_PEST", "spell_shadow_plaguecloud", "#showtooltip Pestilence\n/syn sPest", 1);
		CreateMacro("SYN_RAISE", "spell_shadow_deadofnight", "#showtooltip Raise Ally\n/syn sRaise", 1);
	else 
		CreateMacro("SYN_COI", "spell_frost_chainsofice", "#showtooltip Eisketten\n/syn sChains", 1);
		CreateMacro("SYN_NECRO", "inv_axe_96", "#showtooltip Nekrotischer Stoß\n/syn sNecro", 1);
		CreateMacro("SYN_PEST", "spell_shadow_plaguecloud", "#showtooltip Pestilenz\n/syn sPest", 1);
		CreateMacro("SYN_RAISE", "spell_shadow_deadofnight", "#showtooltip Verbündeten Erwecken\n/syn sRaise", 1);
	end
	itb:message("|cFF0A94FFCreated Macros");
  else
    print("|cFF0A94FFSynapse: |cFFB30000You don't have enough free Macroslots")
  end
end  
-----------------------------------------------------------------------------------------------------------------------------
-- Macros ------------------------------------------------------------------------------------------------------------------- 
-----------------------------------------------------------------------------------------------------------------------------
ProbablyEngine.command.register('syn', function(msg, box)
  local command, text = msg:match("^(%S*)%s*(.-)$")
  local loc = "Interface\\AddOns\\Probably_Synapse_by_Weischbier\\sounds\\"
  if command == 'synapse' or command == 'install' or command == 'macros' then
	Synapse.createAllMacros()
  end
  if command == 'help' then
	Synapse.createHelpText()
  end
-- Toggle -------------------------------------------------------------------------------------------------------------------
  if command == 'toggle' then
    if ProbablyEngine.toggle.states.MasterToggle then
        ProbablyEngine.buttons.toggle('MasterToggle')
        itb:message("|cFFB30000Synapse off")
		if ProbablyEngine.toggle.states.audiblecues == true then PlaySoundFile(loc .. "syn_off.mp3", "master") end
    else
        ProbablyEngine.buttons.toggle('MasterToggle')
        itb:message("|cFF0A94FFSynapse on")
		if ProbablyEngine.toggle.states.audiblecues == true then PlaySoundFile(loc .. "syn_on.mp3", "master") end
	end
  end  
  
  if command == 'kick' then
    if ProbablyEngine.toggle.states.interrupt then
      ProbablyEngine.buttons.toggle('interrupt')
      itb:message("|cFFB30000Interrupts off")
	  if ProbablyEngine.toggle.states.audiblecues == true then PlaySoundFile(loc .. "kick_off.mp3", "master") end
    else
      ProbablyEngine.buttons.toggle('interrupt')
      itb:message("|cFF00B34AInterrupts on")	  
	  if ProbablyEngine.toggle.states.audiblecues == true then PlaySoundFile(loc .. "kick_on.mp3", "master") end
    end
  end

  if command == 'pillar' or command == 'frenzy' or command == 'dancing' then
    if ProbablyEngine.toggle.states.cooldowns then
      ProbablyEngine.buttons.toggle('cooldowns')
      itb:message("|cFFB30000Cooldowns off")
	  if ProbablyEngine.toggle.states.audiblecues == true then PlaySoundFile(loc .. "cool_off.mp3", "master") end
    else
      ProbablyEngine.buttons.toggle('cooldowns')
      itb:message("|cFF00B34ACooldowns on")
	  if ProbablyEngine.toggle.states.audiblecues == true then PlaySoundFile(loc .. "cool_on.mp3", "master") end
    end
  end

  if command == 'aoe' then
    if ProbablyEngine.toggle.states.multitarget then
      ProbablyEngine.buttons.toggle('multitarget')
      itb:message("|cFFB30000AoE off")
	  if ProbablyEngine.toggle.states.audiblecues == true then PlaySoundFile(loc .. "multi_off.mp3", "master") end
    else
      ProbablyEngine.buttons.toggle('multitarget')
      itb:message("|cFF00B34AAoE on")
	  if ProbablyEngine.toggle.states.audiblecues == true then PlaySoundFile(loc .. "multi_on.mp3", "master") end
    end
  end  

  if command == 'def' then
    if ProbablyEngine.toggle.states.def then
      ProbablyEngine.buttons.toggle('def')
      itb:message("|cFFB30000Defensive Cooldowns off")
	  if ProbablyEngine.toggle.states.audiblecues == true then PlaySoundFile(loc .. "def_off.mp3", "master") end
    else
      ProbablyEngine.buttons.toggle('def')
      itb:message("|cFF00B34ADefensive Cooldowns on")
	  if ProbablyEngine.toggle.states.audiblecues == true then PlaySoundFile(loc .. "def_on.mp3", "master") end
    end
  end
  
  if command == 'howling' then
    if ProbablyEngine.toggle.states.howling then
      ProbablyEngine.buttons.toggle('howling')
      itb:message("|cFFB30000Howling Blast off")
	  if ProbablyEngine.toggle.states.audiblecues == true then PlaySoundFile(loc .. "howling_off.mp3", "master") end
    else
      ProbablyEngine.buttons.toggle('howling')
      itb:message("|cFF00B34AHowling Blast on")
	  if ProbablyEngine.toggle.states.audiblecues == true then PlaySoundFile(loc .. "howling_on.mp3", "master") end
    end
  end

  if command == 'dnd' then
    if ProbablyEngine.toggle.states.dnd then
      ProbablyEngine.buttons.toggle('dnd')
      itb:message("|cFFB30000Death and Decay off")
	  if ProbablyEngine.toggle.states.audiblecues == true then PlaySoundFile(loc .. "dnd_off.mp3", "master") end
    else
      ProbablyEngine.buttons.toggle('dnd')
      itb:message("|cFF00B34ADeath and Decay on")
	  if ProbablyEngine.toggle.states.audiblecues == true then PlaySoundFile(loc .. "dnd_on.mp3", "master") end
    end
  end
  
  if command == 'audible' then
    if ProbablyEngine.toggle.states.audiblecues then
      ProbablyEngine.buttons.toggle('audiblecues')
      itb:message("|cFFB30000Audible cues off")
    else
      ProbablyEngine.buttons.toggle('audiblecues')
      itb:message("|cFF00B34AAudible cues on")
    end
  end
  -- Spell Queue -- thank you merq for basic code -----------------------------------------------------------------------------
  if command == "sChains" or command == 45524 then
    Synapse.queueSpell = 45524
    itb:message("Chains of Ice queued")
  elseif command == "sNecro" or command == 73975 then
    Synapse.queueSpell = 73975
    itb:message("Necrotic Strike queued")
  elseif command == "sRaise" or command == 61999 then
    Synapse.queueSpell = 61999
    itb:message("Raise Ally queued. Target the noob!")
  elseif command == "sPest" or command == 50842 then
    Synapse.queueSpell = 50842
    itb:message("Pestilence queued")
  else
    Synapse.queueSpell = nil
  end
  if Synapse.queueSpell ~= nil then Synapse.queueTime = GetTime() end
end)

-----------------------------------------------------------------------------------------------------------------------------
-- Spell Queue Check -- thank you merq for basic code ----------------------------------------------------------------------- 
-----------------------------------------------------------------------------------------------------------------------------
Synapse.checkQueue = function (spellId)
	local firstLaunch = true
	if Synapse.queueTime == nil and firstLaunch then
		Synapse.queueTime = 1
		firstLaunch = false
	end
    if (GetTime() - Synapse.queueTime) > 4 then
        Synapse.queueTime = 0
        Synapse.queueSpell = nil
    return false
    else
    if Synapse.queueSpell then
        if Synapse.queueSpell == spellId then
            if ProbablyEngine.parser.lastCast == GetSpellName(spellId) then
                Synapse.queueSpell = nil
                Synapse.queueTime = 0
            end
        return true
        end
    end
    end
    return false
end

-- Required checks
function Synapse.CanCast(spellID, target)
	local isKnown = IsSpellKnown(spellID, false)
	local isUsable = IsUsableSpell(spellID)
	local inRange = IsSpellInRange(spellID, target)
	local spellCooldown = select(2,GetSpellCooldown(spellID))
	
	if isKnown and isUsable and inRange and spellCooldown <= 0 then
		return true
	else
		return false
	end
end

function Synapse.CastSpell(spellID, target)
	local canCast = Synapse.CanCast(spellID, target)
	if canCast then
		CastSpellByID(spellID, target)
	end
end

function Synapse.t2d(target)
	if ProbablyEngine.condition["deathin"](target) then
		return ProbablyEngine.condition["deathin"](target)
	end
  return 600
end

Synapse.setFlagged = function (self, ...)
  Synapse.flagged = GetTime()
end

Synapse.setUnflagged = function (self, ...)
  Synapse.unflagged = GetTime()
  if Synapse.items[77589] then
    Synapse.items[77589].exp = Synapse.unflagged + 60
  end
end

Synapse.DarkSimulacrumList = {
    144214, -- Froststorm Bolt (Wavebinder Kardris)
    143432, -- Arcane Shock (General Nazgrim; Kor'kron Arcweaver)
	145790, -- Residue (Spoils of Pandaria; Zar'thik Amber Priest)
	145812, -- Rage of the Empress (Spoils of Pandaria; Set'thik Wind Wielder)
	144584  -- Chain Lighning (Garrosh; Farseer Wolf Rider)
} 

Synapse.eventHandler = function(self, ...)
		local event, timestamp, eventtype, hideCaster, 
		srcGUID, srcName, srcFlags, srcRaidFlags,
		destGUID, destName, destFlags, destRaidFlags,
		param9, param10, param11, param12, param13, param14, 
		param15, param16, param17, param18, param19, param20 = ...

		if not eventtype or not eventtype or not destName then return end
		local spellID, spellName, school = param9 or 0, param10 or "", param11 or 0
		local spellschool = self:GetSpellSchool(school) or "N/A" -- string (Magic)
	
		-- Item checks
		if eventtype == "SPELL_CAST_SUCCESS" then
			if srcName == UnitName("player") then
				if spellID == 6262 then -- Healthstone (itemID 5512)
					Synapse.items[6262] = { lastCast = GetTime() }
				end
				if spellID == 124199 then -- Landshark (itemID 77589)
					Synapse.items[77589] = { lastCast = GetTime(), exp = 0 }
				end
			end			
		end		
		-- Dark Simulacrum Logic
		if eventtype == "SPELL_CAST_START" and srcName ~= UnitName("player") then
			local castID = select(8,UnitCastingInfo("sourceName")) -- castID of srcNames current cast
			for i=1, #Synapse.DarkSimulacrumList do
				if castID ==  Synapse.DarkSimulacrumList[i] then
					Synapse.CastSpell(77606,"sourceName");
				end
			end
		end
end
ProbablyEngine.listener.register("Synapse", "COMBAT_LOG_EVENT_UNFILTERED", Synapse.eventtypeHandler)
ProbablyEngine.listener.register("Synapse", "PLAYER_REGEN_DISABLED", Synapse.setFlagged)
ProbablyEngine.listener.register("Synapse", "PLAYER_REGEN_DISABLED", Synapse.setUnflagged)

-- Offhand has Weapon
function Synapse.HasOffhand()
	local hasWeapon = OffhandHasWeapon()
	if hasWeapon == 1 then
		--itb:message("|cFF0A94FFDual Wielding")
		return true
	else
		--itb:message("|cFFB30000NOT Dual Wielding")
		return false
	end
end

-- Dot Damage
function Synapse.DotDamage()
if not DKStatsVar then
	DotDmg 				  	= 0
	DKStatsVar 				= true
end
if ActualDotDmg() > DotDmg then
	DotDmg = ActualDotDmg()
	return true
end
end

function ActualDotDmg()
	local Spec 				= select(1,GetSpecializationInfo(GetSpecialization()))
	local Mastery 			= GetMastery()
	local CriticalChance	= GetCritChance()
	local Power				= select(7,UnitDamage("player"))
	local AttackPower		= select(1,UnitAttackPower("player")) + select(2,UnitAttackPower("player")) + select(3,UnitAttackPower("player"))
	
	local DotTicks, DotTicksSecond, DotTicksDamage, DotDuration, DotDamage, DotDPS
	
	--Blood Plague
	local DotTicks = 10
	local DotTicksSecond = 3
	local DotTicksDamage = 172 + 0.138 * AttackPower
	local DotDuration = DotTicks * DotTicksSecond
	
	if Spec == 252
	then
		DotDamage = (DotTicksDamage * DotTicks) * (1 + CriticalChance / 100) * (1 + (2.5 * Mastery) / 100) * Power
		return DotDamage
	end	
	
	if Spec == 250 or Spec == 251
	then
		DotDamage = (DotTicksDamage * DotTicks) * (1 + CriticalChance / 100) * Power
		return DotDamage
	end	
end

-- Potion of Mogu Power
function Synapse.PotionOfMoguPower()
	if not (UnitBuff("player", 2825) or
			UnitBuff("player", 32182) or 
			UnitBuff("player", 80353) or
			UnitBuff("player", 90355)) then
		return false
	end
	if GetItemCount(76095) < 1 then return false end
	if GetItemCooldown(76095) ~= 0 then return false end
	if not ProbablyEngine.condition["modifier.cooldowns"] then return false end
	return true 
end

-- Synapse Springs check
function Synapse.SynapseSprings()
  local hasEngi = false
  for i=1,9 do
    if select(7,GetProfessionInfo(i)) == 202 then 
		hasEngi = true 
	end
  end
  if hasEngi == false then 
	return false 
  end
  if GetItemCooldown(GetInventoryItemID("player", 10)) > 0 then 
	return false 
  end 
  local PoF = select(2,GetSpellCooldown(51271))
  if PoF > 10 and PoF < 21 then
    return false
  end
  return true
end

-- G91 Landshark
function Synapse.Landshark()
  if GetItemCount(77589, false, false) > 0 then
    if not Synapse.items[77589] then return true end
    if Synapse.items[77589].exp ~= 0 and
      Synapse.items[77589].exp < GetTime() then return true end
  end
end

-- Life Spirit
function Synapse.LifeSpirit()
  if GetItemCount(89640, false, false) > 0 then
    if not Synapse.items[89640] then return true end
    if Synapse.items[89640].exp ~= 0 and
      Synapse.items[89640].exp < GetTime() then return true end
  end
end

-- Healthstone
function Synapse.Healthstone()
  if GetItemCount(5512, false, true) > 0 then
    if not Synapse.items[5512] then return true end
    if Synapse.items[5512].exp ~= 0 and
      Synapse.items[5512].exp < GetTime() then return true end
  end
end

-- Valid Boss pull, on bosses only!
function Synapse.IsBoss()
	if IsEncounterInProgress() then 
		return true 
	else 
		return false
	end
end

ProbablyEngine.library.register("Synapse", Synapse)

























