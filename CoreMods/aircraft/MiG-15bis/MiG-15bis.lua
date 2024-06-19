-- This mod is a comprehensive re-write of the Simple Flight Model and the Engine Model For the MIG 15 BIS.
-- The SFM was changed to more closely match the data in Technical Literature. 
-- When a note in the SFM refers to table or a figure. They are refereing to the data found in
-- The Technical Manual for the  MIG 15bis can be found in the link Below.
-- https://www.digitalcombatsimulator.com/en/files/2365583/
-- Great care was taken to match the aerodynamic and performance data. 
-- In the link Below, I've drawn this mod's drag profile on top of the Soviet Charts
-- https://www.desmos.com/calculator/ugbgtle5oh
-- Similar work was done to compute the lift profile.
-- https://www.desmos.com/calculator/lkxljidb8u
-- Weapon Dispersion, Paylod and ect were changed to match the data form the Soviet Aircraft Projectiles Technical Manual 
-- References To The Manual "Soviet Aircraft Projectiles" refer to the following
-- https://disk.yandex.com/i/YVj0XI6O3Mu4LM
-- The changes to the SFM and Engine Model match the data in Technical as closely as possible. 
-- Has G Suit to set to 0.0 The MIG 15 does not have a G suit. 
-- Has G Suit = 0.25 Allows the player and AI to sustain a 4 G turn. Ace will still pull to 8 g 
-- The default setting, Has G Suit = 0.35 allows the AI to sustain 6 g turns. 
declare_weapon({category = CAT_SHELLS,name =   "N37_37x155_HEI_T",                                                                  
  user_name		 = _("N37_37x155_HEI_T"),
  model_name     = "tracer_bullet_crimson",
  projectile      = "HE", -- added as this was not defined before
  v0   		  = 690, -- Muzzle Velocity of Projectile.
  Dv0             = 0.0057, -- This is delta Velocity 0, IRL Mean Dv0 is is 4 mps, Table 15 4/ 690 = 0.00579 --page 120 Soviet Aircraft Projectile Manual
  Da0             = 0.00083, -- Original Value Da0 = 0.0017,  Soviet Aircraft Projectile Manual page 127  Probable Error is .5 meters at 600 for the HEI in both the x and y axis. Therefore the Prob  radius  of dispersion is = .5/600 = Da0 = 0.00083  ,da0 * 8 = 100% dispersion diameter, da0 is the probable error = standard deviation of dispersion (sigma) * 0.6745   
  Da1             = 0.0,
  mass           = 0.735, -- Changed to Match Soviet Data Page 46 Table 6
  round_mass 	 = 1.250+0.115,		-- round + link
  cartridge_mass = 0.0,				-- 0.413+0.115, cartridges are ejected
  explosive      = 0.041, -- OG .41 KG IRL 37g + 8g Tracer  Table 8 Soviet Aircraft Projectile Manual
  life_time      = 8.0, -- increased to 
  caliber        = 37.0,
  s              = 0.0,
  j              = 0.0,
  l              = 0.0,
  charTime       = 0,
  cx        	 = {0.5,0.80,0.90,0.080,2.15},
  k1        	 = 5.7e-09,
  tracer_off     = 3.0, -- Visible to 1500m Soviet Aircraft Projectiles Page 45, TOF to 1500 meters ~ 5 seconds per US eval of 37mm N https://apps.dtic.mil/sti/tr/pdf/AD0004232.pdf
  scale_smoke    = 0.05, --2 Original lowered 
  smoke_tail_life_time = 0.15, -- Orginal 1, 
  cartridge		 = 0,
  visual_effect_correction = 3.0,
})

-- Spacer Debug
declare_weapon({category = CAT_SHELLS,name =   "N37_37x155_API_T",
  user_name		 = _("N37_37x155_API_T "),
  model_name     = "tracer_bullet_crimson", 
  projectile      = "AP", --added as this was not defined before, the projectile is really an AP round with a Tracer
  payload         = 0.008, -- has 8 grams of tracer no exp or incen
  payloadEffect   = "Thermal", -- trial of API params in WW2 Weapon file. 
  payloadMaterial = "Thermite", -- trial of API params  in WW2 Weapon file. 
  v0    	= 675,
  Dv0   	= 0.0059, -- mean error is 4 mps Dv0 = 4 / 675 mv
  Da0     	 = 0.00067,  -- Original Value Da0 = 0.0017, da0 is the dispersion probable error = 0.4 meters at 600 meters Da0 = 0.4 / 600 Soviet Aircraft Projectile Manual page 127     
  Da1     	 = 0.0,
  mass      	 = 0.753, -- Changed to Match Soviet Data Page 46 Table 6
  round_mass 	 = 1.294+0.115,	-- round + link
  cartridge_mass = 0.0,	-- 0.413+0.115, cartridges are ejected
  life_time      = 8.0, -- increased to 8 
  caliber        = 37.0,
  s              = 0.0,
  j              = 0.0,
  l              = 0.0,
  charTime       = 0,
  cx        	 = {0.5,0.80,0.90,0.080,2.15},
  k1        	 = 5.7e-09,
  tracer_off     = 3.0, -- Visable to 1500m Page 45 of 
  scale_smoke    = 0.05, -- 2 Original lowered 
  smoke_tail_life_time = 0.15, -- Orginal 1, 
  cartridge		 = 0,
  visual_effect_correction = 3.0,
})

declare_weapon({category = CAT_SHELLS,name =   "NR23_23x115_HEI_T",
  user_name		 = _("NR23_23x115_HEI_T"),
  model_name     = "tracer_bullet_crimson", -- Colors can be changed, "tracer_bullet_yellow" will also work
  projectile     = "HE", -- added as this was not defined before
  v0    = 680, -- MIG 15 BS has NR23 mm with 1450 barrel v0 is 680  1600 mm barrel v0= 690
  Dv0   = 0.0050,
  Da0    = 0.0012, -- Soviet Aircraft Projectile Manual Page 127, Error Prob = 0.6 meter at 500 Meters = .6/500 = dao 0.0012   Gives Probable Error  as 
  Da1     	 = 0.0,
  mass      	 = 0.196,
  round_mass 	 = 0.340+0.071,		-- round + link
  cartridge_mass = 0.0,				-- 0.111+0.071, cartridges are ejected
  explosive      = 0.014, --Table 8 11 grams of HEI + 3 Grams of Tracer
  life_time      = 5.0,
  caliber        = 23.0,
  s              = 0.0,
  j              = 0.0,
  l              = 0.0,
  charTime       = 0,
  cx        	 = {1.0,0.74,0.65,0.150,1.78},
  k1        	 = 2.3e-08,
  tracer_off     = 2.5, -- Tracer Burns to 1200m Page 34 Soviet Aircraft Projectile Manual
  scale_smoke    = 0.1, 
  smoke_tail_life_time = 0.25,
  cartridge		 = 0,
  life_time      = 8.0, -- increased to 8 
})

declare_weapon({category = CAT_SHELLS,name =   "NR23_23x115_API",
  user_name		 = _("NR23_23x115_API"),
  model_name     = "tracer_bullet_crimson",
  projectile      = "AP", -- added as this was not defined before
  v0    	 = 680,
  Dv0   	 = 0.0050,
  Da0     	 = 0.0012, -- Soviet Aircraft Projectile Manual Page 127 Gives Probable Error (sigma *0.6745) as 0.6 meter at 500 Meters = .6/500 = dao 0.0012 
  Da1     	 = 0.0,
  mass      	 = 0.199,
  round_mass 	 = 0.340+0.071,		-- round + link
  cartridge_mass = 0.0,				-- 0.111+0.071, cartridges are ejected
  payload         = 0.006, -- 6 grams of incendiary Table 8
  payloadEffect   = "Thermal", -- trial of API params  in WW2 Weapon file.
  payloadMaterial = "Thermite",-- trial of API params  in WW2 Weapon file.
  --explosive      = 0.006, -- 6 grams of incendiary 
  life_time      = 5.0,
  caliber        = 23.0,
  s              = 0.0,
  j              = 0.0,
  l              = 0.0,
  charTime       = 0,
  cx        	 = {1.0,0.74,0.65,0.150,1.78},
  k1        	 = 2.3e-08,
  tracer_off     = -1,
  scale_smoke    = 0.2, -- reduced was huge 2.0, .4 seems large too., trail life to long
  smoke_tail_life_time = 0.3,  -- trail life to long 1 second to .3 
  cartridge		 = 0,
  life_time      = 8.0, -- increased to 8   
})

function nr23(tbl)

	tbl.category = CAT_GUN_MOUNT 
	tbl.name 	 = "NR-23"
	tbl.display_name	= "NR-23"
	tbl.supply 	 = 
	{
		shells = {"NR23_23x115_HEI_T","NR23_23x115_API"},
		mixes  = {{1,2}}, --  This is the AMMO the gun mount has avialable. 1 = HEIT, 2 = API. Mixes on line 402 defines the Ammo belt, or the order in which the projectiles are fired. Changed To ensure the correct mix of ammo is fired.
		count  = 80,
	}
	if tbl.mixes then 
	   tbl.supply.mixes =  tbl.mixes
	   tbl.mixes	    = nil
	end
	tbl.gun = 
	{
		max_burst_length = 80,
		rates 		 = {950}, -- Set to max value Given as 800 to 950 MIG Bis Tech Manual Vol 2 Page
		recoil_coeff 	 = 1,
		barrels_count 	 = 1,
	}
	if tbl.rates then 
	   tbl.gun.rates    =  tbl.rates
	   tbl.rates	    = nil
	end	
	tbl.ejector_pos 			= tbl.ejector_pos or {-0.4, -1.2, 0.18}
	tbl.ejector_dir 			= tbl.ejector_dir or {0,2,0}
	tbl.supply_position  		= tbl.supply_position   or {0,  0.3, -0.3}
	tbl.aft_gun_mount 			= false
	tbl.effective_fire_distance = 600 -- og 1000 - 600m per MiG 17 Tactical Manual.
	tbl.drop_cartridge 			= 204		-- shell_50cal
	tbl.muzzle_pos				= {0,0,0}	-- all position from connector
	tbl.azimuth_initial 		= tbl.azimuth_initial    or 0   
	tbl.elevation_initial 		= tbl.elevation_initial  or 0   
	if  tbl.effects == nil then
		tbl.effects = {{ name = "FireEffect"     , arg 		 = tbl.effect_arg_number or 436 },
					   { name = "HeatEffectExt"  , shot_heat = 0.000, barrel_k = 0.462 * 2.7, body_k = 0.462 * 14.3 }, -- Set to 0, shot heat reduces MV and increases Da0, the dispersion is modeled via Da0 .
					   { name = "SmokeEffect"}}
	end 
	return declare_weapon(tbl)
end

function n37(tbl)

	tbl.category = CAT_GUN_MOUNT 
	tbl.name 	 = "N-37"
	tbl.display_name	= "N-37"
	tbl.supply 	 = 
	{
		shells = {"N37_37x155_HEI_T", "N37_37x155_API_T"},
		mixes  = {{1,2}}, --  This is the type of bullets the gun mount can fire. The order in which these shell are fired is defined in the Guns table on line 387. Changed To Prevent in the wrong shells being fired.
		count  = 40,
	}
	if tbl.mixes then 
	   tbl.supply.mixes =  tbl.mixes
	   tbl.mixes	    = nil
	end
	tbl.gun = 
	{
		max_burst_length = 40,
		rates 		= {400},
		recoil_coeff 	 = 1,
		barrels_count 	 = 1,
	}
	if tbl.rates then 
	   tbl.gun.rates    =  tbl.rates
	   tbl.rates	    = nil
	end	
	tbl.ejector_pos 			= tbl.ejector_pos or {-0.4, -1.2, 0.18}
	tbl.ejector_dir 			= tbl.ejector_dir or {0,3,0}
	tbl.supply_position  		= tbl.supply_position   or {0,  0.3, -0.3}
	tbl.aft_gun_mount 			= false
	tbl.effective_fire_distance = 600  -- default 1000, 600 Based on MIG 17 Combat Manual 
	tbl.drop_cartridge 			= 203		-- shell_30mm
	tbl.muzzle_pos				= {0,0,0}	-- all position from connector
	tbl.azimuth_initial 		= tbl.azimuth_initial    or 0   
	tbl.elevation_initial 		= tbl.elevation_initial  or 0   
	if  tbl.effects == nil then
		tbl.effects = {{ name = "FireEffect"     , arg 		 = tbl.effect_arg_number or 436 },
					   { name = "HeatEffectExt"  , shot_heat = 0, barrel_k = 0.462 * 2.7, body_k = 0.462 * 14.3 },
					   { name = "SmokeEffect"}} -- shot heat off full dispersion modeled via Da0 
	end
	return declare_weapon(tbl)
end

function make_mig15(rewrite_settings)                                                                                              

local mechanimations_mig15 = {
        Door0 = {
            {Transition = {"Close", "Open"},  Sequence = {{C = {{"VelType", 3}, {"Arg", 38, "to", 0.9, "in", 2.0}}}}, Flags = {"Reversible"}},
            {Transition = {"Open", "Close"},  Sequence = {{C = {{"VelType", 3}, {"Arg", 38, "to", 0.0, "in", 2.0}}}}, Flags = {"Reversible", "StepsBackwards"}},
            {Transition = {"Any", "Bailout"}, Sequence = {
                --[[0]] {C = {{"ArgumentPhase", 5, "x", 38, "to", 0.88, "sign", 1}}},
                --[[1]] {C = {{"Arg", 38, "set", 0.04}}},
                --[[2]] {C = {{"Sleep", "for", 1.0}}},
                --[[3]] {C = {{"TearCanopy", 0}}},
                --[[4]] {C = {{"Sleep", "for", 2.0}}},
                --[[5]] {C = {{"Arg", 91, "set", 1.0}}},
                }},
            {Transition = {"Any", "TearOff"},  Sequence = {{C = {{"TearCanopy", 0}, {"Arg", 91, "set", 1.0}}}}},
        },
    } -- end of mechanimations

local rewrite_settings  = rewrite_settings or {Name = 'MiG-15bis', DisplayName = _('MiG-15bis'), bailout_arg = 91, mechanimations = mechanimations_mig15}

local base_MiG_15bis =  {        
	Name 				= rewrite_settings.Name,
	DisplayName			= rewrite_settings.DisplayName,
	Picture 			= "MiG-15bis.png",
	Rate 				= 20, -- RewardPoint in Multiplayer
	Shape 				= "MiG_15bis",
	livery_entry		= "MiG-15bis",
	
	country_of_origin = "SUN", --USSR

	shape_table_data 	= 
	{
		{
			file  	 = 'MiG_15bis';
			life  	 = 15; -- прочность объекта (методом lifebar*) -- The strength of the object (ie. lifebar *)
			vis   	 = 3; -- множитель видимости (для маленьких объектов лучше ставить поменьше). Visibility factor (For a small objects is better to put lower nr).
			desrt    = 'Fighter-2-crush',-- Name of destroyed object file name
			fire  	 = { 300, 4}; -- Fire on the ground after destoyed: 300sec 4m
			username = 'MiG-15bis';
			index    =  WSTYPE_PLACEHOLDER;
			classname = "lLandPlane";
			positioning = "BYNORMAL";
		},
	},
	mapclasskey 		= "P0091000024",
	attribute  			= {wsType_Air, wsType_Airplane, wsType_Fighter, WSTYPE_PLACEHOLDER ,"Battleplanes",},
	Categories 			= {"{78EFB7A2-FD52-4b57-A6A6-3BF0E1D6555F}", "Interceptor",},	
	-------------------------
	M_empty   = 3753 ,    -- with pilot and nose load, kg
	M_nominal = 5044 ,    -- kg
	M_max 	  = 6106 ,    -- kg
	M_fuel_max = 1172 ,    -- 1412 * 0.83, -- kg
	H_max 	  = 15500,    -- 15000 for test H max for 11560 rpm. -Table 8 Manual Original 15100 m
	average_fuel_consumption = 0.43,      -- Table 19 this is highly relative, was .63 test/ but good estimates are 36-40l/min = 28-31kg/min = 0.47-0.52kg/s -- 45l/min = 35kg/min = 0.583kg/s 2270 kg per hour @ cruse = 0.63 kg per second, 2250 kg h Nominal = 0.78 kgs, Max 2890 kgh =0.802 kgs table 19
	CAS_min   = 50,       -- This is Close Air Support Time on Station in Minutes, (for AI) LOITER TIME for aircraft_task(CAS), it should be 10-15 minutes.....
    -- M = 15600 lbs
	V_opt 		= 367 / 3.6, -- velocity for L/D Max, Mach .3 at 0 m =367 TAS Kph. Setting V_opt to high and AI does not have enough lift to turn fighting,  Page 24 MiG Aero Manual. -- Mach .6 735 kph @ S.L. this also given as speed for L/D max fig 54 and note below, Max Climb is 710 table 5, Original Value is 850 m 0.7.   V cruse = 1.131 Vopt.                                                                                       
	V_take_off 	= 76.8, 	-- Take off speed in m/s (for AI)  Figs, 25, and 30 275 KPH with 0 flaps and Weight - 5980 Original 63 mps
	V_land 		= 83, 		-- Land speed in m/s (for AI) 300KPH
	V_max_sea_level = 1076/3.6, --  Mission Editor Max Speed IRL = 1076  Mach 0.877 Set high to test AI Max speed at sea level in m/s (for AI)-irl
	V_max_h 	= 956/3.6,  -- Max speed at max altitude in m/s in mission editor:  To test SFM  set to 1327  The DCS Editor Limits Aircraft V to GS Vmax sea level 
	Vy_max 		= 50,      --  50 max  at 0; 20 at 10km MiG tech manual Mean 32 fig 110 To test SFM 500 Max climb speed in m/s (for AI)
	Mach_max 	= 0.91, 	-- Set for testing Max speed in Mach (for AI) mission editor- .919 @ 11,000 Km table 5 + page 12 and fig 15 
	Ny_min 		= -3, 		-- Min G (for AI) -3 Can be lowered, AI likes to use -g to accel with 0 drag, 
	Ny_max 		= 8.0,  	-- Max G (for AI)
	Ny_max_e 	= 12,       -- Ultimate G limit / structural G limit -- table 2 say 12g,
	AOA_take_off 	= 0.122, 	-- AoA in take off radians (for AI) AOA for L/D  max
	bank_angle_max 	= 90,	--  Max bank angle (for AI; probably for orbit) Old 85 -table 18 Bank angle for min turn time clean  77, For 8 g 82.81. Old 85 


	has_afteburner 				= false, 	-- AFB yes/no
	has_speedbrake 				= true, 	-- Speedbrake yes/no
	has_differential_stabilizer = false,    -- Differential stabilizers yes/no
	tand_gear_max 				= 1.192, 	-- tangent on maximum yaw angle of front wheel, 50 degrees
	wing_area 				= 20.6, 	-- wing area in m2 		
	wing_span 				= 10.08 , 	-- wing span in m			
	wing_type 				= 0,		-- Fixed wing				
	thrust_sum_max 				= 2479,     -- max thurst kgf of engine changed to reflect, 21161 newtons. Reduced to match installed power see Figure 80 Page 31 and Figs 82 and 84	
	thrust_sum_ab 				= 2479, 	-- max thurst Afterburner in kgf Old 26.0kN -- reduced to match installed power	
	length 					= 10.11, 	-- full lenght in m		
	height 					= 3.7, 		-- height in m				
	flaps_maneuver 				= 0, 		-- Max flaps in take-off and maneuver (0.5 = 1st stage; 1.0 = 2nd stage) (for AI) when 0, AI will land full flaps-- default = 0
    flaps_transmission          = "Hydraulic",
    undercarriage_transmission  = "Hydraulic",
	range 						= 1240, 	-- Max range in km (for AI)
	RCS 						= 2, 		-- Radar Cross Section m2
	IR_emission_coeff 			= 0.26,		-- Normal engine -- IR_emission_coeff = 1 is Su-27 without afterburner. It is reference.
	IR_emission_coeff_ab 		= 0.26, 	-- With afterburner
	wing_tip_pos 				= {-2.248,-0.212,4.9}, -- wingtip coords for visual effects
	
	nose_gear_pos 					= { 2.782, -1.416,	0},   -- nosegear coord 
	nose_gear_amortizer_direct_stroke   		=  0,  -- down from nose_gear_pos !!!
	nose_gear_amortizer_reversal_stroke  		= -0.227,  -- up 
	nose_gear_amortizer_normal_weight_stroke 	= -0.06,   -- up 
	nose_gear_wheel_diameter 					=  0.478, -- in m
	
	main_gear_pos 					= {-0.4  ,-1.249 , 1.905}, -- main gear coords (base = 3810)
	main_gear_amortizer_direct_stroke	 	 =   0, --  down from main_gear_pos !!!
	main_gear_amortizer_reversal_stroke  	 = 	-0.192, --  up 
	main_gear_amortizer_normal_weight_stroke =  -0.06,-- down from main_gear_pos
	main_gear_wheel_diameter 				 =   0.658, -- in m
	
	nose_gear_door_close_after_retract		= false,
	main_gear_door_close_after_retract		= false,

	--sounderName = "Aircraft/Planes/MiG15bis",
	
	brakeshute_name 			= 0, -- Landing - brake chute visual shape after separation
	engines_count				= 1, -- Engines count
	engines_nozzles = {
		[1] = 
		{
			pos 				= {-4.105,-0.063,0}, -- nozzle coords
			elevation 			= 0, -- AFB cone elevation
			diameter 			= 0.675, -- AFB cone diameter
			exhaust_length_ab 	= 3, -- lenght in m
			exhaust_length_ab_K = 0.76, -- AB animation
			smokiness_level     = 0.1, 
		}, -- end of [1]
	}, -- end of engines_nozzles
	crew_members = 
	{
		[1] = 
		{
			ejection_seat_name	= "pilot_mig15_seat",
			drop_canopy_name	= "MiG_15bis-fonar",
            canopy_pos			= {1.5, 0.7, 0.0},
            bailout_arg			= rewrite_settings.bailout_arg,
			pilot_name			= "pilot_mig15",
			pos 				=  {1.771, 0.856,0},
			g_suit 				=  0.0, -- This Aircraft does not have a G suit, Default is 0.35 may set to zero.
			drop_parachute_name	= "pilot_mig15_parachute",
		}, -- end of [1]
	}, -- end of crew_members
    mechanimations = rewrite_settings.mechanimations, -- end of mechanimations

	fires_pos = {
			[1] = 	{-0.40,	-0.46, 0},      -- After maingear, fuselage bottom -- offsets: length, height, witdth
			[2] = 	{0.914, 0.08, 0.501},   -- Wing inner Left top **
			[3] = 	{0.968, 0.08, -0.502},   -- Wing inner Right bottom **
			--[4] = 	{0.215, -0.08, 1.195},    -- Wing middle Left bottom ** /no fuel here
			--[5] = 	{-1.582, 0.07, -1.687},   -- Wing middle Right top ** /no fuel here
			--[6] = 	{-0.80,	0.066,	2.2},    -- Wing outer Left ** /no fuel here
			--[7] = 	{1.58, 0.102,	-0.806},   -- Wing outer Right /no fuel here
			[8] = 	{-5.35, 0.0, 0},      -- Engine damage big
			[9] = 	{-5.59, -0.12, -0.393},      -- Engine damage small
			[10] = 	{1.25, -0.38, 0.30},   -- Air intake bottom L
			[11] = 	{0.85, -0.28, -0.40},  -- Air intake bottom R
	}, -- end of fires_pos
    
       
	--sensors
	
	detection_range_max		 = 30,
	radar_can_see_ground 	 = true, -- this should be examined (what is this exactly?)
	CanopyGeometry 								=	makeAirplaneCanopyGeometry(LOOK_GOOD, LOOK_GOOD, LOOK_AVERAGE),
	Sensors = {
		--RWR = "Abstract RWR", -- RWR type
	},
	HumanRadio = {
		frequency = 3.750,  -- Radio Freq
		editable = true,
		minFrequency = 3.750,
		maxFrequency = 5.000,
		modulation = MODULATION_AM
	},

	--panelRadio = {
	--},

	Guns = {
			n37({
				muzzle_pos_connector = "Gun_point_2", --NR 37mm
				effect_arg_number	 = 350,
				azimuth_initial		 = 0,
				elevation_initial	 = 0,
				supply_position		 = {2.115, -0.45, 0.0},
--				ejector_pos			 = {0.0, 0.0, 0.0},					--{-1.67, -0.07, -0.07}}),
				ejector_pos_connector = "ejector_1",
                		mixes                 = {{1,2,1,1,1,2,1}}, -- added belt 70% HEI 30% APT per MiG-17 tech manual, Order of projectiles fired,  1 =HEI T, 2= API-T 
				}),
			nr23({
				muzzle_pos_connector = "Gun_point_3",
				effect_arg_number	 = 433,
                		rates  			 = {861}, --  lowered mean + 1 so both 23mm can be fired at same time. When rates of guns are multi guns are = on F-86 They dont functon.
				mixes			 = {{2,1,1,2,1,1,1}}, -- Order of projectiles fired, added belt 70% HEI 30% APT per MiG-17 tech manual
				azimuth_initial		 = 0,
				elevation_initial	 = 0,
				supply_position		 = {2.436, -0.4, 0.0},
--				ejector_pos			 = {0.0, 0.0 ,0.0},
				ejector_pos_connector = "ejector_2",
				}),	-- FRONT
			nr23({
				muzzle_pos_connector = "Gun_point_007", --NR 23
				effect_arg_number	 = 432,
				mixes			 = {{1,1,1,2,1,1,2}}, --added belt 70% HEI 30% APT per MiG-17 tech manual
                		rates  			 = {859}, -- Lowered to mean -1 so both can fire at same time. called again so both cans be fired twice.
				azimuth_initial		 = 0,
				elevation_initial	 = 0,
				supply_position		 = {1.866, -0.47, 0.0},
--				ejector_pos			 = {0.0, 0.0 ,0.0},
				ejector_pos_connector = "ejector_3",
				}),	-- REAR
			},

	Pylons = {
		-- LEFT WING
		pylon(1, 0, -0.309661, -0.226186, -2.976318,{use_full_connector_position=true,connector = "Pylon_2",arg = 309,arg_value = 0},
			{
				{ CLSID = "FAB_50",				arg_value = 0.15 },
				{ CLSID = "FAB_100M",			arg_value = 0.15 },
				{ CLSID = "PTB400_MIG15",		arg_value = 0.25 },
				{ CLSID = "PTB600_MIG15",		arg_value = 0.35 },
				{ CLSID = "PTB300_MIG15",		arg_value = 0.45 },
			}
		),
		-- RIGHT WING
		pylon(2, 0, -0.309661, -0.226186, 2.976639,{use_full_connector_position=true,connector = "Pylon_1",arg = 308,arg_value = 0},
			{
				{ CLSID = "FAB_50",			arg_value = 0.15 },
				{ CLSID = "FAB_100M",			arg_value = 0.15 },
				{ CLSID = "PTB400_MIG15",		arg_value = 0.25 },
				{ CLSID = "PTB600_MIG15",		arg_value = 0.35 },
				{ CLSID = "PTB300_MIG15",		arg_value = 0.45 },
			}
		),
    },
	
	Tasks = {
	aircraft_task(CAP),				-- 11, Combat Air Patrol
        aircraft_task(CAS),				-- 31, Close air support
        aircraft_task(Escort),			-- 18,
        aircraft_task(FighterSweep),	-- 19,
        aircraft_task(GroundAttack),	-- 32,
        aircraft_task(Intercept),		-- 10,
    },	
	DefaultTask = aircraft_task(CAP),
	
	SFM_Data = {
		aerodynamics = -- Cx = Cx_0 + Cy^2*B2 +Cy^4*B4 
		{
			Cy0	=	-0.025, -- zero AoA lift coefficient-fig 51 Cy at AOA 0 = -0.025 at cy 0 
			Mzalfa	=	4.355, -- coefficients for pitch agility --
			Mzalfadt	=   0.8,  -- coefficients for pitch agility -- 
			kjx	=	2,--2.3, -- Inertial parametre X roll  -- effects time to roll rate max. Per Yo Yo Kj - are the coefficients time constant in short-periodic movement depends on. https://forum.dcs.world/topic/74145-dcs-mods-structure-how-to-create-your-plugin-from-scratch/?do=findComment&comment=1680884
			kjz	=	0.01,-- Inertial parametre Z Pitch equiv to Mass Moment of Inertia - MIG 15 and F-86 are the only SFMs where kjz does not =  0.00125
			Czbe	=	-0.014, -- coefficient, Yaw coefficient due to side slip. along Z axis (perpendicular), affects yaw, negative value means force orientation in FC coordinate system Fig 76 Gives Cz beta Cz -0.1 at 8 Beta
			cx_gear	=	0.02, --  Drag coefficient, Landing gear ?? -- cx0 increase when landing gear is deployed
			cx_flap	=	0.06, -- coefficient, drag, full flaps Cx max 0.16 @ 1.15 AOA, W flap 55 Cy Max 1.46, Cx 2.6. @ Cy 1, Cx = 0.1 W/ flap Cx =0.14
			cy_flap	=	0.35, -- coefficient, normal force, lift, from full flaps. Cy0+Cy_flap+(Cya*AOA)=Cy
			cx_brk	=	0.026, -- coefficient, drag, air brakes 
			table_data = 
			{	--M		Cx0*	 	Cya*		B2		 	B4	 		Omxmax		Aldop*		Cymax*
                		{ 0.0,	0.0195	,	0.058	,	0.076	,	0.022 	,	0.186	,	10   ,  1.100},
				{ 0.1,	0.0183	,	0.066	,	0.076	,	0.0165 	,	0.372	,	15.5 ,	1.100},
				{ 0.2,	0.0173	,	0.070	,	0.0739	,	0.014	,	0.600	,	16.5 ,	1.130},
				{ 0.3,	0.0165	,	0.074	,	0.075	,	0.014   ,	0.850	,	15.3 ,	1.110},
				{ 0.4,	0.016	,	0.0781	,	0.075	,	0.015  	,	1.100	,	14.0 ,	1.070},
				{ 0.5,	0.0157	,	0.0825	,	0.078	,	0.015 	,	1.365	,	12.5 ,	1.010},
				{ 0.6,	0.0158	,	0.087	,	0.078	,	0.015 	,	1.525	,	11.8 ,	0.950},
				{ 0.7,	0.0160	,	0.088	,	0.074	,	0.025 	,	1.460	,	10.2,	0.872},
				{ 0.8,	0.0168	,	0.096	,	0.075 	,	0.017 	,	1.250	,	8.3  ,	0.770},
				{ 0.86,	0.0181	,	0.10	,	0.075	,	0.15	,	1.060	,	6.3	 ,	0.600},
                		{ 0.88,	0.0197	,	0.099	,	0.065	,	0.29	,	0.952	,	7.2	 ,	0.684},
				{ 0.9,	0.0232	,	0.098	,	0.088	,	0.36 	,	0.870   ,	7	 ,	0.658},
				{ 0.92,	0.0300	,	0.094	,	0.095	,	0.45 	,	0.761   ,	7	 ,	0.629},
               			{ 0.94,	0.0402	,	0.090	,	0.099	,	0.689	,	0.636	,	7	  ,	0.600},
				{ 1.0,  0.0599	,	0.088	,	0.16 	,	0.58   	,	0.380	,	6	  ,	0.500},
				{ 1.04,	0.0632	,	0.115	,	0.24 	,	0.89    ,	0.20	,   4.4	  ,	0.477},
				{ 1.2,	0.0680	,	0.115	,	0.26 	,	8   	,	0.10 	,	2.2	  ,	0.239},
			}, -- end of table_data
			-- M - Mach number
			-- Cx0 - Coefficient, drag, profile, of the airplane
			-- Cya - Lift Per AOA degs. Cya = (Cy / AOA) + Cy0 . Cya set to match fig 60. AOA = ((1/Cya)*Cy+((Cy0*-1)/Cya))
			-- B2 - Polar 2nd power coeff -- Drag polar Set to match chart 55 and 56, added entry for Mach .88 and Mach .92 
			-- B4 - Polar 4th power coeff 
			-- Omxmax - roll rate, rad/s- Chart 40 
			-- Aldop - Alfadop, SET to AOA for CL Max based on Aero Data. This also seems to limit AI AOA. The player's FM this is = AOA when aircraft buffet / screen shake begins. Fig 185 has buffet onset for MIG-15 Bis. Yo Yo says this is AOA for Nonlinear effects, This also seems to limit AI AOA.
			-- Cymax - Coefficient, lift, SFM based on FIG 185 maximum possible (ignores other calculations if current Cy > Cymax), If Cy flap + Cy > Cymax, then Cy = Cymax.  
            -- Changes to SFM 
            -- Drag Polars tuned to match Figs 55 and 56.
	    -- Cy Max changes Based on Cy Fig 53 and flight test data Fig 183 to 185.
            -- Cy changes produced the same load factor limits at the same velocity as test data. Ref Fig 50, Fig 183, 184
            -- Aldop Set to 98% AOA Max. Note This higher than the IRL buffet limit of ~ 75 AOA max. AI will not pull AOA greater than Aldop. To get realistic aircraft performance out of AI Aldop has to be higher than Real buffet on set angle.
            -- Performance Limiting Factors of AI SFM are AI Level Cy Max, Aldop, and g_suit, Vopt    			 
			}, -- end of aerodynamics, Table Mod 
		engine = 
		{
            Nominal_RPM = 11560.0, -- changed to match table 19
			Nmg	=	22.5, -- %RPM at idle 2601
            Startup_Prework = 28.0,
            Startup_Duration = 21.0,
            Shutdown_Duration = 62.0,
			MinRUD	=	0, -- Min state of the РУД
			MaxRUD	=	1, -- Max state of the РУД
			MaksRUD	=	1, -- Military power state of the РУД
			ForsRUD	=	1, -- Afterburner state of the РУД
			type	=	"TurboJet",
			hMaxEng	=	15.5, -- 15.5 Max altitude for safe engine operation in km Set Max alt for RPM max table 5 and 8 - maybe H for rpm max
			dcx_eng	=	0.0134, -- Engine drag coeficient: page 24 0.0058 rpm max. 0.0058/11560 -old 0.0134
			cemax	=	1.1, -- table 19 Thrust Specific Fuel Consumption Kg per hour of fuel flow / Thurst in Kgf Tmax at 0 = 2430 kgf (23814 n)  not used for fuel calulation , only for AI routines to check flight time ( fuel calculation algorithm is built in )
			cefor	=	1.1, -- Afterburner specific fuel consumption On all DCS SFM this is = CEFOR only for AI routines to check flight time ( fuel calculation algorithm is built in )
			dpdh_m	=	1325, --  altitude coefficient for max thrust; Tuned to match velocity at 1000m (1072 kph) 5000m (1044 kph), 10,0000m (987 kph) and 15,000m (950 Kph). table 5 and fig 80 
			dpdh_f	=	1325, --  altitude coefficient for AB thrust 
			table_data = 
			{ --    Mach	, Pmax: Thurst max Newtons , MaxPfor AB Thurst Max 	
				{ 0.0	,  	24085   ,	24085	},
                		{ 0.1   ,   	23497   ,  	23497   },
				{ 0.2	,	22917	,	22917	},
				{ 0.3	,	22363	,	22363	},
                		{ 0.4	,	21817	,	21817	},
                		{ 0.5	,	21492	,	21492	},
				{ 0.6	,	21296   ,	21296	},
                		{ 0.7	,	21366	,	21366	},
				{ 0.8	,	21808	,	21808	},
				{ 0.86	,	22301	,	22301	},
				{ 0.88	,	22510	,	22510   },
				{ 0.9	,	22743	,	22743	},
				{ 0.92  ,	23001	,	23001	},
                		{ 0.94  ,   	23285   ,   	23285   },
                		{ 1.00	,	24311	,	24311	},
				{ 1.04	,	25150	,	25150	},
				{ 1.20  ,	30000	,	30000	},
				
								
			}, -- end of table_data
            -- UPDATED ENGINE Model
            -- Matches Thrust Available Chart, Fig 80, https://www.desmos.com/calculator/8thmeisgv2 
            -- New Engine Model accounts for loss of thrust due installion in aircraft see fig 80. 82 and 84 Thrust available / r Chart.
            -- Old engine model was based on a bench test of the engine. Resulting in to much thrust.
            -- dpdh_m lowered and tuned to match velocity at 1000m (1072 kph) 5000m (1044 kph), 10,0000m (987 kph) and 15,000m (950 Kph). table 5 and fig 80  
			-- M - Mach number
			-- Pmax - Engine thrust at military power
			-- Pfor - Engine thrust at AFB
			-- Thrust = P(M,H,Dr) = F1(M)*F2(H)*F3(Dr);
			-- H - is flight altitude;
			-- M - is Mach number;
			-- Dr - is engine operating mode.
			-- Notes
            -- Notes
		}, -- end of engine
	},

	Failures = {
		-- electric system
		{ id = 'es_damage_Generator',	label = _('Generator FAILURE'),		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'es_damage_Starter',		label = _('Starter FAILURE'),		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'es_damage_Battery',		label = _('Battery FAILURE'),		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		-- fuel system
		{ id = 'fs_damage_TransferPump',	label = _('Fuel Transfer Pump FAILURE'),	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'fs_damage_BoosterPump',		label = _('Fuel Booster Pump FAILURE'),		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		-- hydraulic system
		{ id = 'hs_damage_MainPump',			label = _('Main Hydraulic Pump FAILURE'),			enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'hs_damage_MainAccumulator',		label = _('Main Hydraulic Accumulator FAILURE'),	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'hs_damage_MainAutoUnload',		label = _('Main Relief Valve FAILURE'),				enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'hs_damage_GainPump',			label = _('Booster Pump FAILURE'),					enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'hs_damage_GainAccumulator',		label = _('Booster Accumulator FAILURE'),			enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'hs_damage_GainAutoUnload',		label = _('Booster Relief Valve FAILURE'),			enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		-- oxygen system
		{ id = 'os_damage_BalloonLeakage',		label = _('Oxygen FAILURE'),		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		-- power plant

		-- air system
		{ id = 'as_damage_Depressurization',	label = _('Depressurization'),		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
				
		-- 
		{ id = 'AGK_47B_GYRO_TOTAL_FAILURE', 	label = _('AGK-47B gyro failure'),		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },

	},

	Damage = {
		-------------  nose, gear
		[0]  = {critical_damage = 3, args = {146}},						-- nose center (arg - ?)
		[1]  = {critical_damage = 3, args = {150}},						-- nose left
		[2]  = {critical_damage = 3, args = {149}},						-- nose right
		[59] = {critical_damage = 3, args = {148}},						-- nose bottom 
		[8]  = {critical_damage = 2, args = {265}},						-- front gear - FRONT_GEAR_BOX (arg - ?)
		[83] = {critical_damage = 2, args = {134}},						-- wheel nose 
		-------------  cabin
		[3]  = {critical_damage = 1, args = {65}},						-- cockpit
		-------------  fuselage
		[9]  = {critical_damage = 3, args = {154}},									-- fuselage left
		[10] = {critical_damage = 3, args = {153}},									-- fuselage right
		[82] = {critical_damage = 3, args = {152}},									-- fuselage bottom
		[19] = {critical_damage = 1, args = {185}},									-- airbrake left
		[20] = {critical_damage = 1, args = {183}},									-- airbrake right
		-------------  left wing, aileron, flap, gear
		[23] = {critical_damage = 6, args = {223}, deps_cells = {25}},				-- wing out left
		[29] = {critical_damage = 7, args = {224}, deps_cells = {23, 25, 37}},		-- wing center left
		[35] = {critical_damage = 7, args = {225}, deps_cells = {23, 29, 25, 37, 15, 84}},	-- wing in left
		[25] = {critical_damage = 1, args = {226}},									-- aileron left
		[37] = {critical_damage = 2, args = {227}},									-- flap in left
		[15] = {critical_damage = 3,args = {267}},									-- gear left - LEFT_GEAR_BOX (arg - ?)
		[84] = {critical_damage = 3, args = {136}},						  			-- wheel left
		-------------  right wing, aileron, flap, gear
		[24] = {critical_damage = 6, args = {213}, deps_cells = {26}},				-- wing out right
		[30] = {critical_damage = 7, args = {214}, deps_cells = {24, 26, 38}},		-- wing center right
		[36] = {critical_damage = 7, args = {215}, deps_cells = {24, 30, 26, 38, 16, 85}},	-- wing in right
		[26] = {critical_damage = 1, args = {216}},									-- aileron right
		[38] = {critical_damage = 2, args = {217}},									-- flap in right
		[16] = {critical_damage = 3,args = {266}},									-- gear right - RIGHT_GEAR_BOX
		[85] = {critical_damage = 3, args = {135}},						  			-- wheel right
		-------------  fin, rudder
		[40] = {critical_damage = 3, args = {241}, deps_cells = {53}},				-- fin top right
		[44] = {critical_damage = 3, args = {242}},									-- fin bottom left
		[53] = {critical_damage = 1, args = {248}},									-- rudder top (left)
		[54] = {critical_damage = 1, args = {247}},									-- rudder bottom (right)
		-------------  tail
		[56] = {critical_damage = 3, args = {158}},									-- tail left
		[57] = {critical_damage = 3, args = {157}},									-- tail right
		[58] = {critical_damage = 3, args = {156}},									-- tail bottom
		[11] = {critical_damage = 3, args = {167}},									-- engine		 (arg - ?)
		-------------  left stabilizer
		[47] = {critical_damage = 3, args = {236}, deps_cells = {51}},				-- stabilizer left
		[51] = {critical_damage = 1, args = {239}},									-- elevator left		(visual - 239)
		-------------  right stabilizer
		[48] = {critical_damage = 3, args = {234}, deps_cells = {52}},				-- stabilizer right
		[52] = {critical_damage = 1, args = {238}},									-- elevator right
        --
		[86]  = {critical_damage = 1},						-- PYLON1
		[87]  = {critical_damage = 1},						-- PYLON2                                                                                                
	},
	
	DamageParts = 
	{  
		[1] = "MiG_15bis_oblomok__wing_R",
		[2] = "MiG_15bis_oblomok__wing_L",
	},
	
	lights_data = {
		typename =	"collection",
		lights 	 = 
		{
			-- WOLALIGHT_SPOTS -- фары
			[2] =
			{
				lights = 
				{
					[1] = -- nose
					{
						typename	=	"argumentlight",
						argument	=	51,
					}, -- end of [1]
				}, -- end of lights
				typename	=	"collection",
			}, -- end of [2]
			-- WOLALIGHT_NAVLIGHTS -- навигационные
			[3] =
			{
				lights =
				{
					[1] =	-- left wing
					{
						typename	=	"argumentlight",
						argument	=	190,
					},
					[2] =	-- right wing
					{
						typename	=	"argumentlight",
						argument	=	191,
					},
					[3] =	-- tail
					{
						typename	=	"argumentlight",
						argument	=	192,
					},
				}, -- end of lights
				typename	=	"collection",
			}, -- end of [3]
		}, -- end of lights
	},-- end of lights data
}

if rewrite_settings then 
   for i,o in pairs(rewrite_settings) do
		base_MiG_15bis[i] = o
   end
end

add_aircraft(base_MiG_15bis)
end

make_mig15()
----------------------------------------------------------------------------------



local FAB_50 = {
	category  = CAT_BOMBS,
	name      = "FAB_50",
	model     = "fab50_40x",
	user_name = _("FAB-50 - 50kg GP Bomb LD"),
	wsTypeOfWeapon = {wsType_Weapon, wsType_Bomb, wsType_Bomb_A, WSTYPE_PLACEHOLDER},
	scheme    = "bomb-common",
	type      = 0,
    mass      = 50.0,
    hMin      = 1000.0,
    hMax      = 12000.0,
    Cx        = 0.00035,
    VyHold    = -100.0,
    Ag        = -1.23,

	fm = {
        mass        = 50,  -- empty weight with warhead, wo fuel, kg
        caliber     = 0.200,  -- Caliber, meters 
        cx_coeff    = {1, 0.39, 0.38, 0.236, 1.31}, -- Cx
        L           = 1.040, -- Length, meters 
        I           = 4.507, -- kgm2 - moment of inertia  I = 1/12 ML2
        Ma          = 0.667,  -- dependence moment coefficient of  by  AoA angular acceleration  T / I
        Mw          = 1.094, --  rad/s  - 57.3°/s - dependence moment coefficient by angular velocity (|V|*sin(?))/|r| -  Mw  =  Ma * t
        
        wind_sigma  = 10, -- dispersion coefficient
  
        cx_factor   = 100,
    },
  
	warhead = {
		mass                 = 25,
		expl_mass            = 25,
		other_factors        = {1, 1, 1},
		obj_factors          = {1, 1},
		concrete_factors     = {1, 1, 1},
		cumulative_factor    = 0,
		concrete_obj_factor  = 0,
		cumulative_thickness = 0,
		piercing_mass        = 5,
		caliber              = 200,
	},

	-- velK is calibrated to get arming time of 0.8 seconds at initial bomb speed of 150 m/s (540 km/h)
	arming_vane = {enabled = true, velK = 0.00834},
	-- overriding default setting (delay is enabled for all bombs by default)
	arming_delay = {enabled = false, delay_time = 0},
	
	shape_table_data = {
		{
			name     = "FAB_50",
			file     = "fab50_40x",
			life     = 1,
			fire     = {0, 1},
			username = "FAB-50",
			index    = WSTYPE_PLACEHOLDER,
		},
	},
 
	targeting_data = {
		char_time = 20.87, -- characteristic time for sights 
	},
}
declare_weapon(FAB_50)

declare_loadout(
{
	category 		= CAT_BOMBS,
	CLSID	 		= "FAB_50",
	attribute		= FAB_50.wsTypeOfWeapon,
	Count 			= 1,
	Cx_pil			= FAB_50.Cx,
	Picture			= "fab100.png",		-- TODO: "FAB50.png",
	displayName		= FAB_50.user_name,
	Weight			= FAB_50.mass,
	Elements  = {
		{
			ShapeName = "fab50_40x",
		}, 
	},
}
)

-- Copy from FAB-100
local FAB_100M = {
	category  = CAT_BOMBS,
	name      = "FAB_100M",
	model     = "fab100_40x",
	user_name = _("FAB-100M - 100kg GP Bomb LD"),
	wsTypeOfWeapon  = {wsType_Weapon,wsType_Bomb,wsType_Bomb_A,WSTYPE_PLACEHOLDER},
	scheme    = "bomb-common",
	type      = 0,
    mass      = 100.0,
    hMin      = 1000.0,
    hMax      = 12000.0,
    Cx        = 0.00035,
    VyHold    = -100.0,
    Ag        = -1.23,

	fm = {
        mass        = 100,  -- empty weight with warhead, wo fuel, kg
        caliber     = 0.280,  -- Caliber, meters 
        cx_coeff    = {1, 0.39, 0.38, 0.236, 1.31}, -- Cx
        L           = 1.040, -- Length, meters 
        I           = 9.0133, -- kgm2 - moment of inertia  I = 1/12 ML2
        Ma          = 0.68,  -- dependence moment coefficient of  by  AoA angular acceleration  T / I
        Mw          = 1.116, --  rad/s  - 57.3°/s - dependence moment coefficient by angular velocity (|V|*sin(?))/|r| -  Mw  =  Ma * t
        
        wind_sigma  = 20, -- dispersion coefficient
  
        cx_factor   = 100,
    },
  
	warhead = {
		mass                 = 45,
		expl_mass            = 45,
		other_factors        = {1, 1, 1},
		obj_factors          = {1, 1},
		concrete_factors     = {1, 1, 1},
		cumulative_factor    = 0,
		concrete_obj_factor  = 0,
		cumulative_thickness = 0,
		piercing_mass        = 9,
		caliber              = 280,
	},
  
    -- velK is calibrated to get arming time of 0.8 seconds at initial bomb speed of 150 m/s (540 km/h)
	arming_vane = {enabled = true, velK = 0.00834},
	-- overriding default setting (delay is enabled for all bombs by default)
	arming_delay = {enabled = false, delay_time = 0},
	
	shape_table_data = {
		{
			name     = "FAB_100M",
			file     = "fab100_40x",
			life     = 1,
			fire     = {0, 1},
			username = "FAB-100M",
			index    = WSTYPE_PLACEHOLDER,
		},
	},
 
	targeting_data = {
		char_time = 20.84, -- characteristic time for sights 
	},
}

declare_weapon(FAB_100M)

declare_loadout(
{
	category 		= CAT_BOMBS,
	CLSID	 		= "FAB_100M",
	attribute		= FAB_100M.wsTypeOfWeapon,
	Count 			= 1,
	Cx_pil			= FAB_100M.Cx,
	Picture			= "fab100.png",
	displayName		= FAB_100M.user_name,
	Weight			= FAB_100M.mass,
	Elements  = {
		{
			ShapeName = "fab100_40x",
		}, 
	},
}
)

declare_loadout(
	{
		category	= CAT_FUEL_TANKS,
		CLSID		= "PTB400_MIG15",
		attribute	=  {wsType_Air,wsType_Free_Fall,wsType_FuelTank,WSTYPE_PLACEHOLDER},
		Picture		= "PTB.png",
		displayName	= _("Fuel Tank 400 liters"),
		Weight_Empty	= 32.0,
		Weight		= 32.0 + 400*0.83,
		Cx_pil		= 0.001313754,
		shape_table_data = 
		{
			{
				name	= "PTB400_MIG15";
				file	= "PTB400_MIG15";
				life	= 1;
				fire	= { 0, 1};
				username	= "PTB400_MIG15";
				index	= WSTYPE_PLACEHOLDER;
			},
		},
		Elements	= 
		{
			{
				ShapeName	= "PTB400_MIG15",
			}, 
		}, 
	}
)

declare_loadout(
	{
		category	= CAT_FUEL_TANKS,
		CLSID		= "PTB600_MIG15",
		attribute	=  {wsType_Air,wsType_Free_Fall,wsType_FuelTank,WSTYPE_PLACEHOLDER},
		Picture		= "PTB.png",
		displayName	= _("Fuel Tank 600 liters"),
		Weight_Empty	= 33.0,
		Weight		= 33.0 + 600*0.83,
		Cx_pil		= 0.0018392556,			--2.0*0.001313754,
		shape_table_data = 
		{
			{
				name	= "PTB600_MIG15";
				file	= "PTB600_MIG15";
				life	= 1;
				fire	= { 0, 1};
				username	= "PTB600_MIG15";
				index	= WSTYPE_PLACEHOLDER;
			},
		},
		Elements	= 
		{
			{
				ShapeName	= "PTB600_MIG15",
			}, 
		}, 
	}
)

declare_loadout(
	{
		category	= CAT_FUEL_TANKS,
		CLSID		= "PTB300_MIG15",
		attribute	=  {wsType_Air,wsType_Free_Fall,wsType_FuelTank,WSTYPE_PLACEHOLDER},
		Picture		= "PTB.png",
		displayName	= _("Fuel Tank 300 liters"),
		Weight_Empty	= 22.0,
		Weight		= 22.0 + 300*0.83,
		Cx_pil		= 0.00141885432,		--1.2*0.001313754,
		shape_table_data = 
		{
			{
				name	= "PTB300_MIG15";
				file	= "PTB300_MIG15";
				life	= 1;
				fire	= { 0, 1};
				username	= "PTB300_MIG15";
				index	= WSTYPE_PLACEHOLDER;
			},
		},
		Elements	= 
		{
			{
				ShapeName	= "PTB300_MIG15",
			}, 
		}, 
	}
)
