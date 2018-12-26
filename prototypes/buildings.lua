require "SJT_library"
require "crafting-item-definitions"
require "config"

data:extend(
{
-- ITEMS ########################################################################################
-- Floatation ###################################################################################
-- MK1 ##########################################################################################
    {
    type = "item",
	localised_name = "gravity concentration unit MK1",
    name = "gravity-concentration-unit",
    icon = "__SJT-DirtyOre-Remastered__/graphics/icons/ore-floatation-cell.png",
	icon_size = 32,
	flags = {"goes-to-quickbar"},
    subgroup = "dirty-ores-processing",
    order = "a[ore-floatation-cell]",
    place_result = "gravity-concentration-unit",
    stack_size = 10,
    },
-- MK2 ##########################################################################################
    {
    type = "item",
	localised_name = "gravity concentration unit MK2",
    name = "gravity-concentration-unit-2",
    icon = "__SJT-DirtyOre-Remastered__/graphics/icons/ore-floatation-cell-2.png",
	icon_size = 32,
	flags = {"goes-to-quickbar"},
    subgroup = "dirty-ores-processing",
    order = "b[ore-floatation-cell-2]",
    place_result = "gravity-concentration-unit-2",
    stack_size = 10,
    },
-- MK3 ##########################################################################################
    {
    type = "item",
	localised_name = "gravity concentration unit MK3",
    name = "gravity-concentration-unit-3",
    icon = "__SJT-DirtyOre-Remastered__/graphics/icons/ore-floatation-cell-3.png",
	icon_size = 32,
	flags = {"goes-to-quickbar"},
    subgroup = "dirty-ores-processing",
    order = "c[ore-floatation-cell-3]",
    place_result = "gravity-concentration-unit-3",
    stack_size = 10,
    },

-- Leaching #####################################################################################
-- MK1 ##########################################################################################
	{
    type = "item",
	localised_name = "ore leaching unit MK1",
    name = "ore-leaching-unit",
    icon = "__SJT-DirtyOre-Remastered__/graphics/icons/ore-leaching-plant.png",
	icon_size = 32,
	flags = {"goes-to-quickbar"},
    subgroup = "trace-ores-processing",
    order = "x[ore-leaching-plant]",
    place_result = "ore-leaching-unit",
    stack_size = 10,
    },
-- MK2 ##########################################################################################
    {
    type = "item",
	localised_name = "ore leaching unit MK2",
    name = "ore-leaching-unit-2",
    icon = "__SJT-DirtyOre-Remastered__/graphics/icons/ore-leaching-plant-2.png",
	icon_size = 32,
	flags = {"goes-to-quickbar"},
    subgroup = "trace-ores-processing",
    order = "y[ore-leaching-plant-2]",
    place_result = "ore-leaching-unit-2",
    stack_size = 10,
    },
-- MK3 ##########################################################################################
    {
    type = "item",
	localised_name = "ore leaching unit MK3",
    name = "ore-leaching-unit-3",
    icon = "__SJT-DirtyOre-Remastered__/graphics/icons/ore-leaching-plant-3.png",
	icon_size = 32,
	flags = {"goes-to-quickbar"},
    subgroup = "trace-ores-processing",
    order = "z[ore-leaching-plant-3]",
    place_result = "ore-leaching-unit-3",
    stack_size = 10,
    },
	
-- clarification-plant ##########################################################################
    {
    type = "item",
	localised_name = "clarification plant",
    name = "clarification-plant",
    icon = "__SJT-DirtyOre-Remastered__/graphics/icons/clarification-plant.png",
	icon_size = 32,
    flags = {"goes-to-quickbar"},
    subgroup = "liquid-processing",
    order = "e[clarification-plant]",
    place_result = "clarification-plant",
    stack_size = 10,
	},

-- waste-water-outlet ###########################################################################
	{
    type = "item",
	localised_name = "waste water outlet",
    name = "waste-water-outlet",
    icon = "__base__/graphics/icons/pump.png",
	icon_size = 32,
	flags = {"goes-to-quickbar"},
    subgroup = "liquid-processing",
    order = "z",
    place_result = "waste-water-outlet",
    stack_size = 10,
    },

	
-- ENTITIES #####################################################################################
-- Floatation ###################################################################################
-- MK1 ##########################################################################################
	{
    type = "assembling-machine",
	localised_name = "gravity concentration unit MK1",
    name = "gravity-concentration-unit",
    icon = "__SJT-DirtyOre-Remastered__/graphics/icons/ore-floatation-cell.png",
	icon_size = 32,
	flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 1, result = "gravity-concentration-unit"},
	fast_replaceable_group = "gravity-concentration-unit",
    max_health = 300,
	corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    module_specification =
    {
      module_slots = 2
    },
    allowed_effects = {"productivity", "speed", "pollution"},
    crafting_categories = {"dirty-ore-processing"},
    crafting_speed = 0.75,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = 0.02 / 2
    },
    energy_usage = "200kW",
    ingredient_count = 3,
    animation ={
        filename = "__SJT-DirtyOre-Remastered__/graphics/entity/ore-floatation-cell/1ore-floatation-cell.png",
		priority = "extra-high",
        width = 192,
        height = 192,
        frame_count = 16,
		line_length = 4,
        shift = {0.45, 0.7},
		animation_speed = 0.5
	},
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound = { filename = "__SJT-DirtyOre-Remastered__/sound/ore-floatation-cell.ogg" },
	  idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 2.5,
    },
	fluid_boxes =
    {
      {
        production_type = "input",
		pipe_picture = floatationpipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {0, 3} }}
      },
      {
        production_type = "output",
		pipe_picture = floatationpipepictures(),
        pipe_covers = pipecoverspictures(),
        base_level = 1,
        pipe_connections = {{ position = {0, -3} }}
      }
    },
    pipe_covers = pipecoverspictures()
    },

-- MK2 ##########################################################################################
	{
    type = "assembling-machine",
	localised_name = "gravity concentration unit MK2",
    name = "gravity-concentration-unit-2",
    icon = "__SJT-DirtyOre-Remastered__/graphics/icons/ore-floatation-cell-2.png",
	icon_size = 32,
	flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 1, result = "gravity-concentration-unit-2"},
	fast_replaceable_group = "gravity-concentration-unit",
    max_health = 300,
	corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    module_specification =
    {
      module_slots = 3
    },
    allowed_effects = {"productivity", "speed", "pollution"},
    crafting_categories = {"dirty-ore-processing"},
    crafting_speed = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = 0.03 / 2.5
    },
    energy_usage = "250kW",
    ingredient_count = 3,
    animation ={
	layers={
	{
        filename = "__SJT-DirtyOre-Remastered__/graphics/entity/ore-floatation-cell/1ore-floatation-cell.png",
		priority = "extra-high",
        width = 192,
        height = 192,
        frame_count = 16,
		line_length = 4,
        shift = {0.45, 0.7},
		animation_speed = 0.5
	},
	{
        filename = "__SJT-DirtyOre-Remastered__/graphics/entity/ore-floatation-cell/2ore-floatation-cell-overlay.png",
		tint= {r=0.2, g=0.3, b=0.45},
		priority = "high",
        width = 192,
        height = 192,
        frame_count = 16,
		line_length = 4,
        shift = {0.45, 0.7},
	}
	}
	},
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound = { filename = "__SJT-DirtyOre-Remastered__/sound/ore-floatation-cell.ogg" },
	  idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 2.5,
    },
	fluid_boxes =
    {
      {
        production_type = "input",
		pipe_picture = floatationpipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {0, 3} }}
      },
      {
        production_type = "output",
		pipe_picture = floatationpipepictures(),
        pipe_covers = pipecoverspictures(),
        base_level = 1,
        pipe_connections = {{ position = {0, -3} }}
      }
    },
    pipe_covers = pipecoverspictures()
    },

-- MK3 ##########################################################################################
	{
    type = "assembling-machine",
	localised_name = "gravity concentration unit MK3",
    name = "gravity-concentration-unit-3",
    icon = "__SJT-DirtyOre-Remastered__/graphics/icons/ore-floatation-cell-3.png",
	icon_size = 32,
	flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 1, result = "gravity-concentration-unit-3"},
	fast_replaceable_group = "gravity-concentration-unit",
    max_health = 300,
	corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    module_specification =
    {
      module_slots = 3
    },
    allowed_effects = {"productivity", "speed", "pollution"},
    crafting_categories = {"dirty-ore-processing"},
    crafting_speed = 1.5,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = 0.04 / 3
    },
    energy_usage = "300kW",
    ingredient_count = 3,
    animation ={
	layers={
	{
        filename = "__SJT-DirtyOre-Remastered__/graphics/entity/ore-floatation-cell/1ore-floatation-cell.png",
		priority = "extra-high",
        width = 192,
        height = 192,
        frame_count = 16,
		line_length = 4,
        shift = {0.45, 0.7},
		animation_speed = 0.5
	},
	{
        filename = "__SJT-DirtyOre-Remastered__/graphics/entity/ore-floatation-cell/2ore-floatation-cell-overlay.png",
		tint= {r=0.50, g=0.1, b=0.05},
		priority = "high",
        width = 192,
        height = 192,
        frame_count = 16,
		line_length = 4,
        shift = {0.45, 0.7},
	}
	}
	},
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound = { filename = "__SJT-DirtyOre-Remastered__/sound/ore-floatation-cell.ogg" },
	  idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 2.5,
    },
	fluid_boxes =
    {
      {
        production_type = "input",
		pipe_picture = floatationpipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {0, 3} }}
      },
      {
        production_type = "output",
		pipe_picture = floatationpipepictures(),
        pipe_covers = pipecoverspictures(),
        base_level = 1,
        pipe_connections = {{ position = {0, -3} }}
      }
    },
    pipe_covers = pipecoverspictures()
  },


 -- Leaching #####################################################################################
 -- MK1 ##########################################################################################
	{
    type = "assembling-machine",
	localised_name = "ore leaching unit MK1",
    name = "ore-leaching-unit",
    icon = "__SJT-DirtyOre-Remastered__/graphics/icons/ore-leaching-plant.png",
	icon_size = 32,
	flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 1, result = "ore-leaching-unit"},
	fast_replaceable_group = "ore-leaching-unit",
    max_health = 300,
	corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    module_specification =
    {
      module_slots = 2
    },
    allowed_effects = {"productivity", "speed", "pollution"},
    crafting_categories = {"trace-ore-processing"},
    crafting_speed = 0.75,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = 0.04 / 3
    },
    energy_usage = "200kW",
    ingredient_count = 4,
    animation =
	{
        filename = "__SJT-DirtyOre-Remastered__/graphics/entity/ore-leaching-plant/1ore-leaching-plant.png",
		priority = "extra-high",
        width = 192,
        height = 192,
        frame_count = 1,
        shift = {0.4, -0.14},
	},
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound = { filename = "__SJT-DirtyOre-Remastered__/sound/ore-leaching-plant.ogg" },
	  idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 2.5,
    },
	fluid_boxes =
    {
      {
        production_type = "input",
		pipe_picture = leachingpipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {1, 3} }}
      },
      {
        production_type = "input",
		pipe_picture = leachingpipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {-3, 1} }}
      },
	  {
        production_type = "output",
		pipe_picture = leachingpipepictures(),
        pipe_covers = pipecoverspictures(),
        base_level = 1,
        pipe_connections = {{ position = {-1, -3} }}
      }
    },
	pipe_covers = pipecoverspictures(),
    },

-- MK2 ##########################################################################################
	{
    type = "assembling-machine",
		localised_name = "ore leaching unit MK2",
    name = "ore-leaching-unit-2",
    icon = "__SJT-DirtyOre-Remastered__/graphics/icons/ore-leaching-plant-2.png",
	icon_size = 32,
	flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 1, result = "ore-leaching-unit-2"},
	fast_replaceable_group = "ore-leaching-unit",
    max_health = 300,
	corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    module_specification =
    {
      module_slots = 3
    },
    allowed_effects = {"productivity", "speed", "pollution"},
    crafting_categories = {"trace-ore-processing"},
    crafting_speed = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = 0.05 / 3.5
    },
    energy_usage = "250kW",
    ingredient_count = 4,
    animation ={
	layers={
	{
        filename = "__SJT-DirtyOre-Remastered__/graphics/entity/ore-leaching-plant/1ore-leaching-plant.png",
		priority = "extra-high",
        width = 192,
        height = 192,
        frame_count = 1,
        shift = {0.4, -0.14},
	},
	{
        filename = "__SJT-DirtyOre-Remastered__/graphics/entity/ore-leaching-plant/2ore-leaching-plant-overlay.png",
		tint= {r=0.2, g=0.3, b=0.45},
		priority = "high",
        width = 192,
        height = 192,
        frame_count = 1,
        shift = {0.4, -0.14},
	}
	}
	},
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound = { filename = "__SJT-DirtyOre-Remastered__/sound/ore-leaching-plant.ogg" },
	  idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 2.5,
    },
	fluid_boxes =
    {
      {
        production_type = "input",
		pipe_picture = leachingpipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {1, 3} }}
      },
      {
        production_type = "input",
		pipe_picture = leachingpipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {-3, 1} }}
      },
	  {
        production_type = "output",
		pipe_picture = leachingpipepictures(),
        pipe_covers = pipecoverspictures(),
        base_level = 1,
        pipe_connections = {{ position = {-1, -3} }}
      }
    },
    },

-- MK3 ##########################################################################################
	{
    type = "assembling-machine",
	localised_name = "ore leaching unit MK3",
    name = "ore-leaching-unit-3",
    icon = "__SJT-DirtyOre-Remastered__/graphics/icons/ore-leaching-plant-3.png",
	icon_size = 32,
	flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 1, result = "ore-leaching-unit-3"},
	fast_replaceable_group = "ore-leaching-unit",
    max_health = 300,
	corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    module_specification =
    {
      module_slots = 3
    },
    allowed_effects = {"productivity", "speed", "pollution"},
    crafting_categories = {"trace-ore-processing"},
    crafting_speed = 1.5,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = 0.06 / 4
    },
    energy_usage = "300kW",
    ingredient_count = 4,
    animation ={
		layers={
			{
				filename = "__SJT-DirtyOre-Remastered__/graphics/entity/ore-leaching-plant/1ore-leaching-plant.png",
				priority = "extra-high",
				width = 192,
				height = 192,
				frame_count = 1,
				shift = {0.4, -0.14},
			},
			{
				filename = "__SJT-DirtyOre-Remastered__/graphics/entity/ore-leaching-plant/2ore-leaching-plant-overlay.png",
				tint= {r=0.50, g=0.1, b=0.05},
				priority = "high",
				width = 192,
				height = 192,
				frame_count = 1,
				shift = {0.4, -0.14},
			}
		}
	},
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound = { filename = "__SJT-DirtyOre-Remastered__/sound/ore-leaching-plant.ogg" },
	  idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 2.5,
    },
	fluid_boxes =
    {
      {
        production_type = "input",
		pipe_picture = leachingpipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {1, 3} }}
      },
      {
        production_type = "input",
		pipe_picture = leachingpipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {-3, 1} }}
      },
	  {
        production_type = "output",
		pipe_picture = leachingpipepictures(),
        pipe_covers = pipecoverspictures(),
        base_level = 1,
        pipe_connections = {{ position = {-1, -3} }}
      }
    },
  },

-- clarification-plant ##########################################################################
  {
    type = "assembling-machine",
	localised_name = "clarification plant",
    name = "clarification-plant",
    icon = "__SJT-DirtyOre-Remastered__/graphics/icons/clarification-plant.png",
	icon_size = 32,
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 1, result = "clarification-plant"},
	fast_replaceable_group = "clarification-plant",
    max_health = 300,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    module_specification =
    {
      module_slots = 2
    },
    allowed_effects = {"speed", "pollution"},
    crafting_categories = {"waste-water-clearing"},
    crafting_speed = 1.0,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = 0.5 / 150
    },
    energy_usage = "150kW",
    ingredient_count = 4,
    animation ={
		layers={
		{
			filename = "__SJT-DirtyOre-Remastered__/graphics/entity/clarification-plant/clarification-plant.png",
			width = 192,
			height = 192,
			frame_count = 1,
			shift = {0.5, -0.5},
		},
		-- {
			-- filename = "__angelsrefining__/graphics/entity/7x7-overlay.png",
			-- tint = {r=1, g=0, b=0},
			-- width = 224,
			-- height = 224,
			-- frame_count = 1,
			-- shift = {0, 0},
		-- },
		}
	},
     vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound = { filename = "__base__/sound/oil-refinery.ogg" },
      idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 2.5,
    },
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
		pipe_picture = clarificationplantpipepictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {0, 3} }}
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
		pipe_picture = clarificationplantpipepictures(),
		base_area = 10,
        base_level = 1,
        pipe_connections = {{type="output", position = {0, -3} }}
      }
    },
    pipe_covers = pipecoverspictures(),
	off_when_no_fluid_recipe = true
    },
	
-- waste-water-outlet ###########################################################################
	{
    type = "assembling-machine",
	localised_name = "waste water outlet",
    name = "waste-water-outlet",
    icon = "__base__/graphics/icons/pump.png",
	icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
	subgroup = "liquid-processing",
    minable = {mining_time = 1, result = "waste-water-outlet"},
    max_health = 80,
    fast_replaceable_group = "pipe",
    corpse = "small-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
	fluid_boxes =
    {
     {
        production_type = "input",
		--pipe_picture = floatationpipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {0, 1} }}
      },
     {
        production_type = "output",
		--pipe_picture = floatationpipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {0, -1} }}
      },
    },
    module_specification =
    {
      module_slots = 2
    },
    allowed_effects = {"speed"},
    crafting_categories = {"waste-water-disposal"},
    crafting_speed = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = 50
    },
    energy_usage = "1kW",
	ingredient_count=1,
    animation =
    {
      north =
      {
        filename = "__base__/graphics/entity/pump/pump-north.png",
		priority = "extra-high",
        width = 46,
        height = 56,
        frame_count = 8,
        shift = {0.09375, 0.03125},
        animation_speed = 0.5
      },
      east =
      {
        filename = "__base__/graphics/entity/pump/pump-east.png",
		priority = "extra-high",
        width = 51,
        height = 56,
        frame_count = 8,
        shift = {0.265625, -0.21875},
        animation_speed = 0.5
      },
      south =
      {
        filename = "__base__/graphics/entity/pump/pump-south.png",
		priority = "extra-high",
        width = 61,
        height = 58,
        frame_count = 8,
        shift = {0.421875, -0.125},
        animation_speed = 0.5
      },
      west =
      {
        filename = "__base__/graphics/entity/pump/pump-west.png",
		priority = "extra-high",
        width = 56,
        height = 44,
        frame_count = 8,
        shift = {0.3125, 0.0625},
        animation_speed = 0.5
      }
    },
--    pumping_speed = 0.5,
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    circuit_wire_connection_points =
    {
      {
        shadow =
        {
          red = {0.171875, 0.140625},
          green = {0.171875, 0.265625},
        },
        wire =
        {
          red = {-0.53125, -0.15625},
          green = {-0.53125, 0},
        }
      },
      {
        shadow =
        {
          red = {0.890625, 0.703125},
          green = {0.75, 0.75},
        },
        wire =
        {
          red = {0.34375, 0.28125},
          green = {0.34375, 0.4375},
        }
      },
      {
        shadow =
        {
          red = {0.15625, 0.0625},
          green = {0.09375, 0.125},
        },
        wire =
        {
          red = {-0.53125, -0.09375},
          green = {-0.53125, 0.03125},
        }
      },
      {
        shadow =
        {
          red = {0.796875, 0.703125},
          green = {0.625, 0.75},
        },
        wire =
        {
          red = {0.40625, 0.28125},
          green = {0.40625, 0.4375},
        }
      }
    },
    --circuit_connector_sprites =
    --[[
	{
      get_circuit_connector_sprites({-0.40625, -0.3125}, nil, 24),
      get_circuit_connector_sprites({0.125, 0.21875}, {0.34375, 0.40625}, 18),
      get_circuit_connector_sprites({-0.40625, -0.25}, nil, 24),
      get_circuit_connector_sprites({0.203125, 0.203125}, {0.25, 0.40625}, 18),
    },
	]]--
    circuit_wire_max_distance = 7.5

  },
  
-- RECIPES ######################################################################################
-- Floatation ###################################################################################
-- MK1 ##########################################################################################
  	{
    type = "recipe",
    name = "gravity-concentration-unit",
    energy_required = 10,
	enabled = "false",
    ingredients ={
		{"stone-brick", 10},
		{plate_1, 10},
		{gear_1, 2},
		{bearing_1, 3},
		{chip_1, 5},
	},
    result= "gravity-concentration-unit",
    icon = "__SJT-DirtyOre-Remastered__/graphics/icons/ore-floatation-cell.png",
	icon_size = 32,
    },
-- MK2 ##########################################################################################
	{
    type = "recipe",
    name = "gravity-concentration-unit-2",
    energy_required = 10,
	enabled = "false",
    ingredients ={
		{"gravity-concentration-unit", 1},
		{plate_2, 5},
		{gear_2, 2},
		{bearing_2, 3},
		{chip_2, 1},
	},
    result= "gravity-concentration-unit-2",
    icon = "__SJT-DirtyOre-Remastered__/graphics/icons/ore-floatation-cell-2.png",
	icon_size = 32,
    },
-- MK3 ##########################################################################################
	{
    type = "recipe",
    name = "gravity-concentration-unit-3",
    energy_required = 10,
	enabled = "false",
    ingredients ={
		{"gravity-concentration-unit-2", 2},
		{plate_3, 5},
		{gear_3, 2},
		{bearing_3, 3},
		{chip_3, 1},
	},
    result= "gravity-concentration-unit-3",
    icon = "__SJT-DirtyOre-Remastered__/graphics/icons/ore-floatation-cell-3.png",
    icon_size = 32,
	},

-- Leaching #####################################################################################
-- MK1 ##########################################################################################
	{
    type = "recipe",
    name = "ore-leaching-unit",
    energy_required = 10,
	enabled = "false",
    ingredients ={
		{"stone-brick", 10},
		{plate_1, 10},
		{gear_1, 1},
		{bearing_1, 1},
		{chip_1, 5},
	},
    result= "ore-leaching-unit",
    icon = "__SJT-DirtyOre-Remastered__/graphics/icons/ore-leaching-plant.png",
	icon_size = 32,
    },
-- MK2 ##########################################################################################
	{
    type = "recipe",
    name = "ore-leaching-unit-2",
    energy_required = 10,
	enabled = "false",
    ingredients ={
		{"ore-leaching-unit", 1},
		{plate_2, 10},
		{gear_2, 1},
		{bearing_2, 1},
		{chip_2, 3},
	},
    result= "ore-leaching-unit-2",
    icon = "__SJT-DirtyOre-Remastered__/graphics/icons/ore-leaching-plant-2.png",
	icon_size = 32,
    },
-- MK3 ##########################################################################################
	{
    type = "recipe",
    name = "ore-leaching-unit-3",
    energy_required = 10,
	enabled = "false",
    ingredients ={
		{"ore-leaching-unit-2", 1},
		{plate_3, 10},
		{gear_3, 1},
		{bearing_3, 1},
		{chip_3, 2},
	},
    result= "ore-leaching-unit-3",
    icon = "__SJT-DirtyOre-Remastered__/graphics/icons/ore-leaching-plant-3.png",
	icon_size = 32,
    },

-- clarification-plant ##########################################################################
    {
    type = "recipe",
    name = "clarification-plant",
    energy_required = 10,
	enabled = "false",
    ingredients =
	{
		{plate_2, 10},
		{"stone-brick", 20},
		{chip_2, 5},
		{"pipe", 5},
	},
    result="clarification-plant",
    icon = "__SJT-DirtyOre-Remastered__/graphics/icons/clarification-plant.png",
	icon_size = 32,
    },
-- waste-water-outlet ###########################################################################
    {
    type = "recipe",
    name = "waste-water-outlet",
    energy_required = 10,
	enabled = "true",
    ingredients =
	{
		{"pump", 1},
	},
    result="waste-water-outlet",
    icon = "__base__/graphics/icons/pump.png",
	icon_size = 32,
    },
  }
  )