-- ProbablyEngine Rotation Packager
-- Custom Arms Warrior Rotation
-- Created on Nov 2nd 2013 7:48 am
ProbablyEngine.rotation.register_custom(71, "Arms-PVP-FC", {

-- Hotkeys
	{ "Heroic Leap", "modifier.lshift", "ground" },
    { "Shattering Throw", "modifier.lcontrol", "target" }, -- Shattering Throw
--    { "Charge", "modifier.actionbutton5", "target" }, -- Charge

-- Buffs
	

-- Shouts
--	{ "Battle Shout", {
--  		"!player.buff(Battle Shout)",
--  		"!player.buff(Horn of Winter)",
--  		"!player.buff(Trueshot Aura)",
--	}},
--
--	{ "Commanding Shout", {
--  		"!player.buff(Commanding Shout)",
--  		"!player.buff(Dark Intent)",
--  		"!player.buff(Power Word: Fortitude)",
--  		"!player.buff(Qiraji Fortitude)",
--	}},

-- Interrupts
	{ "Pummel", "modifier.interrupts" },
	{ "Disrupting Shout", "modifier.interrupts" },
	
-- Snares
  	{ "Piercing Howl", {
    "!target.debuff(Hamstring)",
    "!target.debuff(Piercing Howl)",
    "target.range < 15"
  	}},
  	
   	{ "Hamstring", {
    "!target.debuff(Hamstring)",
    "!target.debuff(Piercing Howl)"
  	}},

	{ "Rallying Cry", {
    	"player.health < 25",
	}},
	
	{ "#trinket2", {
    	"player.health < 15",
	}},

	{ "Shield Wall", {
    	"player.health < 15"
  	}},

  	{ "Die by the Sword", {
    	"player.health < 40",
  	}},
  	
    { "Disarm", {
    	"player.health < 95",
    }},

    { "#Healthstone", {
    		"player.health < 40",
    		"!#Healthstone.cooldown",
      }, },

  	{ "Impending Victory" },
  	{ "Victory Rush" },
  	{ "Intimidating Shout", {
    "target.range <= 7 ",
    "player.health < 75" 
    }},

	{ "71", {
		"player.health <= 99",
        "player.seal != 2"
    }},
--	{ "2457", {
--		"player.health >= 85",
--        "player.seal != 1"
--    }},
    
-- Heals
  		{ "Impending Victory", "player.health < 80" },
  		{ "Victory Rush", "player.health < 80" },

-- Cooldowns
	{{
  		{ "Bloodbath", "modifier.cooldowns" },
  		{ "Avatar", "modifier.cooldowns" },
  		{ "Recklessness", "modifier.cooldowns" },
  		{ "Skull Banner", "modifier.cooldowns" },
		--{ "#gloves"},
		{ "Blood Fury"},
	}, "modifier.cooldowns"},

-- AoE
	{{ 
		{ "Thunder Clap", "@cpoworks.inMelee()" },
		{ "Sweeping Strikes" },
		{ "Bloodbath", "player.buff(Sweeping Strikes).duration > 4" },
		{ "Bladestorm", "player.buff(Bloodbath)" },
		{ "Dragon Roar" , "@cpoworks.inMelee()" },
		{ "Colossus Smash", "target.debuff(Colossus Smash).duration <= 2" },
		{ "Slam", "player.rage > 70" },
		{ "Mortal Strike", "player.rage < 40", "player.buff(Sweeping Strikes).duration < 3"  },
		{ "7384", "player.buff(60503).count >= 1" }, --Overpower
		{ "Battle Shout" },
		{ "Heroic Throw" },	
	}, "modifier.multitarget"},

-- Single Target
	{ "Colossus Smash", "target.debuff(Colossus Smash).duration <= 1" },
	
	-- Inside CS
	{{
		{ "Heroic Strike", "player.rage >= 60" },
		{ "Storm Bolt" },
		{ "#trinket1" },
		{ "Mortal Strike" },
		{ "Slam", "player.buff(1719)"}, --Slam /w Reck
		{ "7384", "player.buff(60503).count >= 1" }, --Overpower
		{ "Slam" },
	}, {"target.debuff(Colossus Smash)", "target.health > 20" }},

	-- Execute Inside CS
	{{
		--{ "Shattering Throw", "!player.moving" },
		{ "Storm Bolt" },
		{ "#trinket1" },
		{ "Mortal Strike" },
		{ "Execute" },
		{ "7384", "player.buff(139958)" }, --Overpower
	}, {"target.debuff(Colossus Smash)", "target.health <= 20" }},
	
	-- Outside CS
	{{
		{ "Heroic Strike", "player.rage >= 115" },
		{ "Mortal Strike" },
		{ "Dragon Roar" , "@cpoworks.inMelee()" },
		{ "Slam", "player.buff(1719)"}, --Slam /w Reck
		{ "7384", "player.buff(60503).count >= 1" }, --Overpower
		{ "Slam" },
		{ "Battle Shout"},
		{ "Heroic Throw" },
	}, {"!target.debuff(Colossus Smash)", "target.health > 20" }},

	-- Execute Outside CS
	{{
		{ "Mortal Strike" },
		{ "Dragon Roar" , "@cpoworks.inMelee()" },
		{ "Execute", "player.rage > 90" },
		{ "7384", "player.buff(139958)" }, --Overpower
		{ "Battle Shout" },
		{ "Heroic Throw" },		
	}, {"!target.debuff(Colossus Smash)", "target.health <= 20" }},

})