-- Initialize tables
if not cpoworks then cpoworks = {} end


ProbablyEngine.listener.register("cpoworks", "COMBAT_LOG_EVENT_UNFILTERED", function(...)
	local event			= select(2, ...)
	local source		= select(5, ...)
	local destGUID		= select(8, ...)
	local destination	= select(9, ...)
	local spellID		= select(12, ...)
	local spell			= select(13, ...)
	local damage		= select(15, ...)
	local critical		= select(21, ...)
	
	
end)


ProbablyEngine.listener.register("cpoworks", "MODIFIER_STATE_CHANGED", function(...)
	local key			= select(1, ...)
	local isDown		= select(2, ...)
	UseCD = ProbablyEngine.config.data.button_states.cooldowns
	AoE = ProbablyEngine.config.data.button_states.multitarget
	
	if  (key == "RCTRL" and isDown == 1) 
	and cpoworks.UseHotKeys then
		if UseCD  then 
			print("Cooldowns: |cFFFF0000Disabled")	
			ProbablyEngine.buttons.toggle('cooldowns')
		else 
			print("Cooldowns: |cFF00FF00Enabled")
			ProbablyEngine.buttons.toggle('cooldowns')
		end
	end	
	
	if  (key == "LCTRL" and isDown == 1) 
	and cpoworks.UseHotKeys then
		if AoE  then 
			print("AoE: |cFFFF0000Disabled")	
			ProbablyEngine.buttons.toggle('multitarget')
		else 
			print("AoE: |cFF00FF00Enabled")
			ProbablyEngine.buttons.toggle('multitarget')
		end
	end	
end)

