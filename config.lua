-- this option might help if resource depletion should cause an error
-- setting this to true will disable some resources from spawning that should really spawn (no clue why) so it's not active by default
-- in save mode when bob mods is present dirty-gem-ore doesn't spawn for example but dirty-gold-ore does
save_mode = false

-- toggles the spawning of dirty and trace ores
spawn_dirty_ores = true

-- changes the recipe for assembling machine 37
recipe_change_assembling_machine_3 = true	-- requires assembling_machine 2.5 to be true

-- enables higher tier production buildings
assembling_machine_2_5 = true
assembling_machine_2_5_speed = 1

assembling_machine_4 = true
assembling_machine_4_speed = 1.5

-- vanilla chemical plant has speed of 1.25
-- update chemical plant updates crafting-speed to 1.00 and lowers power consumption and pollution in relation
update_chemical_plant = true
chemical_plant_1_speed = 1

chemical_plant_2 = true
chemical_plant_2_speed = 1.25

chemical_plant_3 = true		-- requires chemical_plant_2 to be true
chemical_plant_3_speed = 1.5

oil_refinery_2 = true
oil_refinery_2_speed = 1.25

oil_refinery_3 = true		-- requires chemical_plant_3 to be true
oil_refinery_3_speed = 1.5

--toggles the dirt/trace overlay of the item (e.g. on transport belts)
dirt_trace_overlay = true

-- the blacklist disables recipes for ore processing, this can be used to disable ores from appearing in the crafting tab that don't spawn in the environment
-- format is Ore_Blacklist = {"copper-ore", "iron-ore"}
ore_blacklist = {}

-- ore name list: to this list you can add ores and their translation
-- format is ore_name["foo"]="bar" where foo is the internal name (e.g. "iron-ore" for iron ore) and bar is the name you want to appear when playing (e.g "iron ore" for iron ore)
ore_names = {};
	ore_names["y-res1"]="N4-Material Chunk (Durotal)";
	ore_names["y-res2"]="F7-Material Chunk (Nuatreel)";
	ore_names["ruby-ore"]="Ruby Ore";
	ore_names["sapphire-ore"]="Sapphire Ore";
	ore_names["emerald-ore"]="Emerald Ore";
	ore_names["amethyst-ore"]="Amethyst Ore";
	ore_names["topaz-ore"]="Topaz Ore";
	ore_names["diamond-ore"]="Diamond Ore";
	ore_names["gold-ore"]="Gold ore";
	ore_names["lead-ore"]="Galena (Lead ore)";
	ore_names["silver-ore"]="Silver ore";
	ore_names["tin-ore"]="Tin ore";
	ore_names["tungsten-ore"]="Tungsten ore";
	ore_names["zinc-ore"]="Zinc ore";
	ore_names["bauxite-ore"]="Bauxite (Aluminium ore)";
	ore_names["rutile-ore"]="Rutile (Titanium ore)";
	ore_names["nickel-ore"]="Nickel ore";
	ore_names["cobalt-ore"]="Cobaltite";
	ore_names["quartz"]="Quartz (Silicon ore)";
	ore_names["sulfur"]="Sulfur";
	ore_names["gem-ore"]="Gemstones";
	ore_names["lithia-water"]="Lithia Water";
	ore_names["ground-water"]="Ground Water";
	ore_names["coal"]="Coal";
	ore_names["stone"]="Stone";
	ore_names["iron-ore"]="Iron ore";
	ore_names["copper-ore"]="Copper ore"

--item names: to this list you can add ore-items (not the entity but the mined item) and their translation
-- format as above
item_names ={};
	item_names["y-res1"]="N4-Material Chunk (Durotal)";
	item_names["y-res2"]="F7-Material Chunk (Nuatreel)";
	item_names["ruby-ore"]="Ruby Ore";
	item_names["sapphire-ore"]="Sapphire Ore";
	item_names["emerald-ore"]="Emerald Ore";
	item_names["amethyst-ore"]="Amethyst Ore";
	item_names["topaz-ore"]="Topaz Ore";
	item_names["diamond-ore"]="Diamond Ore";
	item_names["gold-ore"]="Gold ore";
	item_names["lead-ore"]="Galena (Lead ore)";
	item_names["silver-ore"]="Silver ore";
	item_names["tin-ore"]="Tin ore";
	item_names["tungsten-ore"]="Tungsten ore";
	item_names["zinc-ore"]="Zinc ore";
	item_names["bauxite-ore"]="Bauxite (Aluminium ore)";
	item_names["rutile-ore"]="Rutile (Titanium ore)";
	item_names["nickel-ore"]="Nickel ore";
	item_names["cobalt-ore"]="Cobaltite";
	item_names["quartz"]="Quartz (Silicon ore)";
	item_names["sulfur"]="Sulfur";
	item_names["gem-ore"]="Gemstones";
	item_names["lithia-water"]="Lithia Water";
	item_names["ground-water"]="Ground Water";
	item_names["coal"]="Coal";
	item_names["stone"]="Stone";
	item_names["iron-ore"]="Iron ore";
	item_names["copper-ore"]="Copper ore"

-- not intended for public usage
dev_mode = false