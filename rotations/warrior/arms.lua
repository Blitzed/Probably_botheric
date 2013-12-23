-- ProbablyEngine Rotation Packager
-- Custom Arms Warrior Rotation
-- Created on Nov 2nd 2013 7:48 am
ProbablyEngine.rotation.register_custom(71, "Arms-PVP", {

-- Hotkeys
	{ "6544", "modifier.lshift", "ground" },
    { "Shattering Throw", "modifier.lcontrol", "target", "!player.moving" }, -- Shattering Throw
--    { "Charge", "modifier.actionbutton5", "target" }, -- Charge

-- Buffs
	{ "6673", {		--BattleShout
  		"player.buff(6673).duration < 296",
  		"player.rage < 60",
  		"player.spell(6673).cooldown = 0",
	}},
-- Interrupts
  	{ "6552", "modifier.interrupts" },		-- Pummel
  	{ "102060", "modifier.interrupts" },	-- Disrupting Shout
	{ "18499", "player.state.fear" },		-- Berserker Rage
	{ "18499", "player.state.incapacitate" },		-- Berserker Rage
	{ "18499", "player.state.horror" },		-- Berserker Rage
-- Spellreflect
--{{
	--{ "114028", "player.spell(114028).exists", "!player.buff(114028)", "!player.buff(23920)", "target.casting", "player" }, --Mass Spell Reflection
    --{ "23920", "!player.buff(114028)", "!player.buff(23920)", "target.casting", "player" } --Spell Reflection
    --{ "23920", {		--Spell Reflection
       	--"!player.buff(114028)",
       	--"!player.buff(23920)",    
       	--"player.spell(6552).cooldown > 0", --Pummel Cd check
        --"player.spell(102060).exists",
        --"player.spell(102060).cooldown > 0", --Disrupting Shout Cd check
	
-- Snares
  	{ "12323", {		--Piercing Howl
    "!target.debuff(1715)",		--Hamstring
    "!target.debuff(12323)",	--Piercing Howl
    "target.range < 15"
  	}},
  	
   	{ "1715", {		--Hamstring
    "target.debuff(1715).duration <= 1",
    "!target.debuff(12323)",	--Piercing Howl
    "target.range <= 6"
  	}},
  	
-- Defensives  	
	{ "#18606", {	--Battle Standard
		"player.health < 40",
		"!#18606.cooldown",
	}},

	{ "Rallying Cry", {
    	"player.health < 25",
	}},
	
	{ "#trinket2", {
    	"player.health < 29",
    	"!#trinket2.cooldown",
	}},
	
	{ "Shield Wall", {
    	"player.health < 29"
  	}},

  	{ "Die by the Sword", {
    	"player.health < 70",
  	}},
  	
    { "676", {	-- Disarm
    "target.disarmAble",
    "player.spell(676).cooldown = 0",
    "target.range <= 5",
    }},

  	{ "Intimidating Shout", {
    "target.range <= 7 ",
    "player.health < 75" 
    }},

	{ "71", {
		"player.health <= 39",
        "player.seal != 2"
    }},
	{ "2457", {
		"player.health >= 85",
        "player.seal != 1"
    }, },
    
-- Heals
  		{ "Impending Victory", "player.health < 90" },
  		{ "Victory Rush", "player.health < 90" },
  		{"#5512", "player.health <= 45"},

  -- Cooldowns
    {{
	  { "20572",  --BloodFury
        {
          "@repli.BloodFury()",
		  "player.spell(20572).exists",
          "player.range <= 5",
        }
      },
	  { "114207",  --Skull Banner
        {
          "@repli.Skullbanner()",
          "player.range <= 5",
        }
      },
	  
      { "1719",  --Recklessness
        {
          "@repli.Recklessness()",
          "player.range <= 5",
        }
      },
	  { "107574",  --Avatar
        {
		  "player.spell(107574).exists",
		  "player.buff(1719)",
          "player.range <= 5",
        }
      },
    }, "modifier.cooldowns" },

-- AoE
	{{ 
		{ "Thunder Clap", "@cpoworks.inMelee()" },
		{ "12328" }, -- Sweeping Strikes
		{ "12292", "target.range <= 6" }, -- Bloodbath
		{ "46924", "player.buff(12292).duration > 5" }, -- Bladestorm
		{ "118000" , "@cpoworks.inMelee()" },	-- Dragon Roar
		{ "86346", "target.debuff(86346).duration <= 2" }, -- Colossus Smash
		{ "1464", "player.rage > 70" }, -- Slam
		{ "12294", "player.rage < 40", "player.buff(12328).duration < 3"  },	-- Mortal Strike
		{ "7384", "player.buff(60503).count >= 1" }, --Overpower
	}, "modifier.multitarget"},
	-- Single Target
	{ "86346", "target.debuff(86346).duration <= 2" }, -- Colossus Smash
		{ "#trinket1", {	--Trinket 1
	    "player.buff(Enrage).duration >= 5",	--Enrage
    	"!#trinket1.cooldown",
    }},
	-- Inside CS
	{{
		{ "78", "player.rage >= 90" }, -- Heroic Strike
		{ "107570" }, -- Storm Bolt
		{ "12294" }, -- Mortal Strike
		{ "5308" }, -- Execute
		{ "1464", "player.rage >= 40" }, -- Slam
		{ "7384", "player.buff(60503).count >= 3" }, -- Overpower
	}, {"target.debuff(86346)", "target.health > 20" }},
	   	{"57755", {		--Heroic Throw
		"!target.debuff(86346)",
		"player.rage < 60",
		"player.spell(57755).cooldown = 0",
		"player.range <= 5"
		},"target"},
	-- Execute Inside CS
	{{
		{ "107570" }, -- Storm Bolt
		{ "12294" }, -- Mortal Strike
		{ "5308" }, -- Execute
		{ "7384", "player.buff(60503).count >= 1" }, -- Overpower
	}, {"target.debuff(86346)", "target.health <= 20" }},	
	
	-- Outside CS
	{{
		{ "78", "player.rage >= 110" }, -- Heroic Strike
		{ "12294" }, -- Mortal Strike
		{ "5308" }, -- Execute	
		{ "7384", "player.buff(60503).count >= 3" }, -- Overpower
		{ "1464", "player.rage >= 80" }, -- Slam
		{ "57755" }, -- Heroic Throw
	}, {"!target.debuff(86346)", "target.health > 20" }},
	-- Execute Outside CS
	{{
		{ "12294" }, -- Mortal Strike
		{ "5308" }, -- Execute
		{ "7384", "player.buff(60503).count >= 1" }, -- Overpower
		{ "57755" }, -- Heroic Throw
	}, {"!target.debuff(86346)", "target.health <= 20" }},
 }, --Combat end
{  
  -- Out of combat
   {"6544", {
		"modifier.lshift",
		"@repli.Leap()"
	}},
}
)

ProbablyEngine.rotation.register_custom(71, "MOL-Arms-PVE", {
-- SPEC ID 71

-- Hotkeys
	{ "6544", "modifier.lshift", "ground" },
    { "Shattering Throw", "modifier.lcontrol", "target" }, -- Shattering Throw
--    { "Charge", "modifier.actionbutton5", "target" }, -- Charge

-- Buffs
	
	{"6673", {		--BattleShout
		"!target.debuff(86346)",
		"player.rage < 60",
		"player.spell(6673).cooldown = 0",
		"player.range <= 5"
	}},
--
--	{ "Commanding Shout", {
--  		"!player.buff(Commanding Shout)",
--  		"!player.buff(Dark Intent)",
--  		"!player.buff(Power Word: Fortitude)",
--  		"!player.buff(Qiraji Fortitude)",
--	}},

-- Interrupts
{{
    { "102060", "player.spell(102060).exists", "player.spell(6552).cooldown > 0", "target" }, --Disrupting Shout
    { "6552", "target" } --Pummel
}, "modifier.interrupts" },

-- Spellreflect
--	{ "Pummle", {
--  	"target.casting",
--  	"!target.immune.silence"
--	}}
	
-- Snares
  	{ "Piercing Howl", {
    "!target.debuff(Hamstring)",
    "!target.debuff(Piercing Howl)",
    "target.range < 15"
  	}},
  	
   	{ "Hamstring", {
    "!target.debuff(Hamstring)",
    "!target.debuff(Piercing Howl)",
    "target.range <= 5"
  	}},
  	
-- Defensives  	

	{ "Rallying Cry", {
    	"player.health < 25",
	}},
	
	{ "#trinket2", {
    	"player.health < 29",
    	"!#trinket2.cooldown",
	}},
	
	{ "Shield Wall", {
    	"player.health < 29"
  	}},

  	{ "Die by the Sword", {
    	"player.health < 70",
  	}},
  	
    { "676", {	-- Disarm
    "target.disarmAble",
    "player.spell(676).cooldown = 0",
    "target.range <= 5",
    }},

  	{ "Intimidating Shout", {
    "target.range <= 7 ",
    "player.health < 75" 
    }},

	{ "71", {
		"player.health <= 39",
        "player.seal != 2"
    }},
	{ "2457", {
		"player.health >= 85",
        "player.seal != 1"
    }, },
    
-- Heals
  		{ "Impending Victory", "player.health < 90" },
  		{ "Victory Rush", "player.health < 90" },

  -- Cooldowns
    {{
	  { "20572",  --BloodFury
        {
          "@repli.BloodFury()",
		  "player.spell(20572).exists",
          "player.range <= 5",
        }
      },
	  { "114207",  --Skull Banner
        {
          "@repli.Skullbanner()",
          "player.range <= 5",
        }
      },
	  
      { "1719",  --Recklessness
        {
          "@repli.Recklessness()",
          "player.range <= 5",
        }
      },
	  { "107574",  --Avatar
        {
		  "player.spell(107574).exists",
		  "player.buff(1719)",
          "player.range <= 5",
        }
      },
    }, "modifier.cooldowns" },

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
	}, "modifier.multitarget"},

-- Single Target
	{ "Colossus Smash", "target.debuff(Colossus Smash).duration <= 1" },
	    { "#trinket1", {	--Trinket 1
    		"!#trinket1.cooldown",
      }, },
	-- Inside CS
	{{
		{ "Heroic Strike", "player.rage >= 60" },
		{ "Storm Bolt" },
		{ "Mortal Strike" },
		{ "Slam", "player.buff(1719)"}, --Slam /w Reck
		{ "7384", "player.buff(60503).count >= 1" }, --Overpower
		{ "Slam" },
	}, {"target.debuff(Colossus Smash)", "target.health > 20" }},
	   	{"57755", {		--Heroic Throw
		"!target.debuff(86346)",
		"player.rage < 60",
		"player.spell(57755).cooldown = 0",
		"player.range <= 5"
		},"target"},

	-- Execute Inside CS
	{{
		--{ "Shattering Throw", "!player.moving" },
		{ "Storm Bolt" },
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
	}, {"!target.debuff(Colossus Smash)", "target.health > 20" }},

	-- Execute Outside CS
	{{
		{ "Mortal Strike" },
		{ "Dragon Roar" , "@cpoworks.inMelee()" },
		{ "Execute", "player.rage > 90" },
		{ "7384", "player.buff(139958)" }, --Overpower
	}, {"!target.debuff(Colossus Smash)", "target.health <= 20" }},
 }, --Combat end
{  
  -- Out of combat
   {"6544", {
		"modifier.lshift",
		"@repli.Leap()"
	}},
}
)