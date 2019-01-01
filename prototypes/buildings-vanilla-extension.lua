require "config"
require "crafting-item-definitions"
require "SJT_library"




-- ITEMS ########################################################################################
-- Assembling-machine ###########################################################################
-- MK2.5 ##########################################################################################
if assembling_machine_2_5 then
data:extend({
  {
    type = "item",
	localised_name = "Assembling machine 2.5",
    name = "assembling-machine-2_5",
    icon = "__base__/graphics/icons/assembling-machine-2.png",
	icon_size = 32,
    flags = {"goes-to-quickbar"},
    subgroup = "production-machine",
    order = "c[assembling-machine-2-5]",
    place_result = "assembling-machine-2_5",
    stack_size = 50
  }
})
end
-- MK4 ##########################################################################################
if assembling_machine_4 then
data:extend({
  {
    type = "item",
	localised_name = "Assembling machine 4",
    name = "assembling-machine-4",
    icon = "__base__/graphics/icons/assembling-machine-3.png",
	icon_size = 32,
    flags = {"goes-to-quickbar"},
    subgroup = "production-machine",
    order = "c[assembling-machine-4]",
    place_result = "assembling-machine-4",
    stack_size = 50
  }
})
end

-- Oil-refinery #################################################################################
-- MK2 ##########################################################################################
if oil_refinery_2 then
data.raw["item"]["oil-refinery"].order = "d[refinery-1]"
data:extend({
  {
    type = "item",
	localised_name = "Oil refinery 2",
    name = "oil-refinery-2",
    icon = "__base__/graphics/icons/oil-refinery.png",
	icon_size = 32,
    flags = {"goes-to-quickbar"},
    subgroup = "production-machine",
    order = "d[refinery-2]",
    place_result = "oil-refinery-2",
    stack_size = 10
  }
})
end
-- MK3 ##########################################################################################
if oil_refinery_3 then
data.raw["item"]["oil-refinery"].order = "d[refinery-1]"
data:extend({
  {
    type = "item",
	localised_name = "Oil refinery 3",
    name = "oil-refinery-3",
    icon = "__base__/graphics/icons/oil-refinery.png",
	icon_size = 32,
    flags = {"goes-to-quickbar"},
    subgroup = "production-machine",
    order = "d[refinery-3]",
    place_result = "oil-refinery-3",
    stack_size = 10
  }
})
end

-- Chemical-plant ###############################################################################
-- MK2 ##########################################################################################
if chemical_plant_2 then
data.raw["item"]["chemical-plant"].order = "e[chemical-plant-1]"
data:extend({
  {
    type = "item",
	localised_name = "Chemical plant 2",
    name = "chemical-plant-2",
    icon = "__base__/graphics/icons/chemical-plant.png",
	icon_size = 32,
    flags = {"goes-to-quickbar"},
    subgroup = "production-machine",
    order = "e[chemical-plant-2]",
    place_result = "chemical-plant-2",
    stack_size = 10
  }
})
end
-- MK3 ##########################################################################################
if chemical_plant_3 then
data.raw["item"]["chemical-plant"].order = "e[chemical-plant-1]"
data:extend({
  {
    type = "item",
	localised_name = "Chemical plant 3",
    name = "chemical-plant-3",
    icon = "__base__/graphics/icons/chemical-plant.png",
	icon_size = 32,
    flags = {"goes-to-quickbar"},
    subgroup = "production-machine",
    order = "e[chemical-plant-3]",
    place_result = "chemical-plant-3",
    stack_size = 10
  }
})
end
	

-- ENTITIES #####################################################################################
-- Assembling-machine ###########################################################################
-- MK2.5 ##########################################################################################
	assembling_2_5_energy_usage		= (calc_energy_usage(assembling_machine_2_5_speed, 180)).."kW"
	assembling_2_5_pollution			= (calc_pollution(assembling_machine_2_5_speed, 3/250))

if assembling_machine_2_5 then
data:extend({
  {
    type = "assembling-machine",
    name = "assembling-machine-2_5",
    icon = "__base__/graphics/icons/assembling-machine-2.png",
	icon_size = 32,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "assembling-machine-2_5"},
    max_health = 250,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {0, -2} }}
      },
      {
        production_type = "output",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {0, 2} }}
      },
      off_when_no_fluid_recipe = true
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    fast_replaceable_group = "assembling-machine",
    animation =
    {
      filename = "__base__/graphics/entity/assembling-machine-2/assembling-machine-2.png",
      priority = "high",
      width = 113,
      height = 99,
      frame_count = 32,
      line_length = 8,
      shift = {0.4, -0.06}
    },
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound = {
        {
          filename = "__base__/sound/assembling-machine-t2-1.ogg",
          volume = 0.8
        },
        {
          filename = "__base__/sound/assembling-machine-t2-2.ogg",
          volume = 0.8
        },
      },
      idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 1.5,
    },
    crafting_categories = {"crafting", "advanced-crafting", "crafting-with-fluid"},
    crafting_speed = assembling_machine_2_5_speed,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = assembling_2_5_pollution
    },
    energy_usage = assembling_2_5_energy_usage,
    ingredient_count = 5,
    module_specification =
    {
      module_slots = 2
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"}
  },
})
end
-- MK4 ##########################################################################################
	assembling_4_energy_usage		= (calc_energy_usage(assembling_machine_4_speed, 180)).."kW"
	assembling_4_pollution			= (calc_pollution(assembling_machine_4_speed, 3/250))

if assembling_machine_4 then
data:extend({
  {
    type = "assembling-machine",
	localised_name = "Assembling machine 4",
    name = "assembling-machine-4",
    icon = "__base__/graphics/icons/assembling-machine-3.png",
	icon_size = 32,
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "assembling-machine-4"},
    max_health = 300,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {0, -2} }}
      },
      {
        production_type = "output",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {0, 2} }}
      },
      off_when_no_fluid_recipe = true
    },
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound = {
        {
          filename = "__base__/sound/assembling-machine-t3-1.ogg",
          volume = 0.8
        },
        {
          filename = "__base__/sound/assembling-machine-t3-2.ogg",
          volume = 0.8
        },
      },
      idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 1.5,
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    fast_replaceable_group = "assembling-machine",
    animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/assembling-machine-3/assembling-machine-3.png",
          priority = "high",
          width = 108,
          height = 119,
          frame_count = 32,
          line_length = 8,
          shift = util.by_pixel(0, -0.5),
          hr_version =
          {
            filename = "__base__/graphics/entity/assembling-machine-3/hr-assembling-machine-3.png",
            priority = "high",
            width = 214,
            height = 237,
            frame_count = 32,
            line_length = 8,
            shift = util.by_pixel(0, -0.75),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/assembling-machine-3/assembling-machine-3-shadow.png",
          priority = "high",
          width = 130,
          height = 82,
          frame_count = 32,
          line_length = 8,
          draw_as_shadow = true,
          shift = util.by_pixel(28, 4),
          hr_version =
          {
            filename = "__base__/graphics/entity/assembling-machine-3/hr-assembling-machine-3-shadow.png",
            priority = "high",
            width = 260,
            height = 162,
            frame_count = 32,
            line_length = 8,
            draw_as_shadow = true,
            shift = util.by_pixel(28, 4),
            scale = 0.5
          }
        }
      }
    },
    crafting_categories = {"crafting", "advanced-crafting", "crafting-with-fluid"},
    crafting_speed = assembling_machine_4_speed,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
--      emissions = 0.03 / 3.5
		emissions = assembling_4_pollution
    },
--    energy_usage = "270kW",
	energy_usage = assembling_4_energy_usage,
    ingredient_count = 7,
    module_specification =
    {
      module_slots = 4
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"}
  },
})
end

-- Oil-refinery #################################################################################
-- MK2 ##########################################################################################
	oil_refinery_2_energy_usage		= (calc_energy_usage(oil_refinery_2_speed, 420)).."kW"
	oil_refinery_2_pollution		= (calc_pollution(oil_refinery_2_speed, 0.03/3.5))

if oil_refinery_2 then
data:extend({
  {
    type = "assembling-machine",
	localised_name = "Oil refinery 2",
    name = "oil-refinery-2",
    icon = "__base__/graphics/icons/oil-refinery.png",
	icon_size = 32,
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 1, result = "oil-refinery-2"},
    max_health = 300,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    module_specification =
    {
      module_slots = 3
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"oil-processing"},
    crafting_speed = oil_refinery_2_speed,
    has_backer_name = true,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      --emissions = 0.008
	  emissions = oil_refinery_2_pollution
    },
    --energy_usage = "700kW",
	energy_usage = oil_refinery_2_energy_usage,
    ingredient_count = 4,
    animation =
    {
      north =
      {
        filename = "__base__/graphics/entity/oil-refinery/oil-refinery.png",
        width = 337,
        height = 255,
        frame_count = 1,
        shift = {2.515625, 0.484375}
      },
      east =
      {
        filename = "__base__/graphics/entity/oil-refinery/oil-refinery.png",
        x = 337,
        width = 337,
        height = 255,
        frame_count = 1,
        shift = {2.515625, 0.484375}
      },
      south =
      {
        filename = "__base__/graphics/entity/oil-refinery/oil-refinery.png",
        x = 674,
        width = 337,
        height = 255,
        frame_count = 1,
        shift = {2.515625, 0.484375}
      },
      west =
      {
        filename = "__base__/graphics/entity/oil-refinery/oil-refinery.png",
        x = 1011,
        width = 337,
        height = 255,
        frame_count = 1,
        shift = {2.515625, 0.484375}
      }
    },
    working_visualisations =
    {
      {
        north_position = util.by_pixel(34, -65),
        east_position = util.by_pixel(-52, -61),
        south_position = util.by_pixel(-59, -82),
        west_position = util.by_pixel(57, -58),
        animation =
        {
          filename = "__base__/graphics/entity/oil-refinery/oil-refinery-fire.png",
          line_length = 10,
          width = 20,
          height = 40,
          frame_count = 60,
          animation_speed = 0.75,
          shift = util.by_pixel(0, -14),
          hr_version =
          {
            filename = "__base__/graphics/entity/oil-refinery/hr-oil-refinery-fire.png",
            line_length = 10,
            width = 40,
            height = 81,
            frame_count = 60,
            animation_speed = 0.75,
            scale = 0.5,
            shift = util.by_pixel(0, -14.25)
          }
        },
        light = {intensity = 0.4, size = 6, color = {r = 1.0, g = 1.0, b = 1.0}}
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
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {-1, 3} }}
      },
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {1, 3} }}
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        base_level = 1,
        pipe_connections = {{ position = {-2, -3} }}
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        base_level = 1,
        pipe_connections = {{ position = {0, -3} }}
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        base_level = 1,
        pipe_connections = {{ position = {2, -3} }}
      }
    },
    pipe_covers = pipecoverspictures()
  }
})
end
-- MK3 ##########################################################################################
	oil_refinery_3_energy_usage		= (calc_energy_usage(oil_refinery_3_speed, 420)).."kW"
	oil_refinery_3_pollution		= (calc_pollution(oil_refinery_3_speed, 0.03/3.5))

if oil_refinery_3 then
data:extend({
  {
    type = "assembling-machine",
	localised_name = "Oil refinery 3",
    name = "oil-refinery-3",
    icon = "__base__/graphics/icons/oil-refinery.png",
	icon_size = 32,
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 1, result = "oil-refinery-3"},
    max_health = 300,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    module_specification =
    {
      module_slots = 4
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"oil-processing"},
    crafting_speed = oil_refinery_3_speed,
    has_backer_name = true,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      --emissions = 0.007
	  emissions = oil_refinery_3_pollution
    },
    --energy_usage = "980kW",
	energy_usage = oil_refinery_3_energy_usage,
    ingredient_count = 4,
    animation =
    {
      north =
      {
        filename = "__base__/graphics/entity/oil-refinery/oil-refinery.png",
        width = 337,
        height = 255,
        frame_count = 1,
        shift = {2.515625, 0.484375}
      },
      east =
      {
        filename = "__base__/graphics/entity/oil-refinery/oil-refinery.png",
        x = 337,
        width = 337,
        height = 255,
        frame_count = 1,
        shift = {2.515625, 0.484375}
      },
      south =
      {
        filename = "__base__/graphics/entity/oil-refinery/oil-refinery.png",
        x = 674,
        width = 337,
        height = 255,
        frame_count = 1,
        shift = {2.515625, 0.484375}
      },
      west =
      {
        filename = "__base__/graphics/entity/oil-refinery/oil-refinery.png",
        x = 1011,
        width = 337,
        height = 255,
        frame_count = 1,
        shift = {2.515625, 0.484375}
      }
    },
    working_visualisations =
    {
      {
        north_position = util.by_pixel(34, -65),
        east_position = util.by_pixel(-52, -61),
        south_position = util.by_pixel(-59, -82),
        west_position = util.by_pixel(57, -58),
        animation =
        {
          filename = "__base__/graphics/entity/oil-refinery/oil-refinery-fire.png",
          line_length = 10,
          width = 20,
          height = 40,
          frame_count = 60,
          animation_speed = 0.75,
          shift = util.by_pixel(0, -14),
          hr_version =
          {
            filename = "__base__/graphics/entity/oil-refinery/hr-oil-refinery-fire.png",
            line_length = 10,
            width = 40,
            height = 81,
            frame_count = 60,
            animation_speed = 0.75,
            scale = 0.5,
            shift = util.by_pixel(0, -14.25)
          }
        },
        light = {intensity = 0.4, size = 6, color = {r = 1.0, g = 1.0, b = 1.0}}
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
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {-1, 3} }}
      },
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {1, 3} }}
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        base_level = 1,
        pipe_connections = {{ position = {-2, -3} }}
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        base_level = 1,
        pipe_connections = {{ position = {0, -3} }}
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        base_level = 1,
        pipe_connections = {{ position = {2, -3} }}
      }
    },
    pipe_covers = pipecoverspictures()
  }
})
end

-- Chemical-plant ###############################################################################
-- MK2 ##########################################################################################
	chemical_plant_2_energy_usage	= (calc_energy_usage(chemical_plant_2_speed, 180)).."kW"
	chemical_plant_2_pollution		= (calc_pollution(chemical_plant_2_speed, 3/250))
	
if chemical_plant_2 then
data:extend({
  {
    type = "assembling-machine",
	localised_name = "Chemical plant 2",
    name = "chemical-plant-2",
    icon = "__base__/graphics/icons/chemical-plant.png",
	icon_size = 32,
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "chemical-plant-2"},
    max_health = 300,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    drawing_box = {{-1.5, -1.9}, {1.5, 1.5}},
    module_specification =
    {
      module_slots = 3
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    
    animation = make_4way_animation_from_spritesheet({ layers =
    {
      {
        filename = "__base__/graphics/entity/chemical-plant/chemical-plant.png",
        width = 122,
        height = 134,
        frame_count = 1,
        shift = util.by_pixel(-5, -4.5),
        hr_version =
        {
          filename = "__base__/graphics/entity/chemical-plant/hr-chemical-plant.png",
          width = 244,
          height = 268,
          frame_count = 1,
          shift = util.by_pixel(-5, -4.5),
          scale = 0.5
          }
      },
      {
        filename = "__base__/graphics/entity/chemical-plant/chemical-plant-shadow.png",
        width = 175,
        height = 110,
        frame_count = 1,
        shift = util.by_pixel(31.5, 11),
        draw_as_shadow = true,
        hr_version =
        {
          filename = "__base__/graphics/entity/chemical-plant/hr-chemical-plant-shadow.png",
          width = 350,
          height = 219,
          frame_count = 1,
          shift = util.by_pixel(31.5, 10.75),
          draw_as_shadow = true,
          scale = 0.5
          }
      }
    }}),
    working_visualisations =
    {
      {
        north_position = util.by_pixel(30, -24),
        west_position = util.by_pixel(1, -49.5),
        south_position = util.by_pixel(-30, -48),
        east_position = util.by_pixel(-11, -1),
        apply_recipe_tint = "primary",
        animation =
        {
          filename = "__base__/graphics/entity/chemical-plant/boiling-green-patch.png",
          frame_count = 32,
          width = 15,
          height = 10,
          animation_speed = 0.5,
          hr_version =
          {
            filename = "__base__/graphics/entity/chemical-plant/hr-boiling-green-patch.png",
            frame_count = 32,
            width = 30,
            height = 20,
            animation_speed = 0.5,
            scale = 0.5
          }
        }
      },

      {
        north_position = util.by_pixel(30, -24),
        west_position = util.by_pixel(1, -49.5),
        south_position = util.by_pixel(-30, -48),
        east_position = util.by_pixel(-11, -1),
        apply_recipe_tint = "secondary",
        animation =
        {
          filename = "__base__/graphics/entity/chemical-plant/boiling-green-patch-mask.png",
          frame_count = 32,
          width = 15,
          height = 10,
          animation_speed = 0.5,
          hr_version =
          {
            filename = "__base__/graphics/entity/chemical-plant/hr-boiling-green-patch-mask.png",
            frame_count = 32,
            width = 30,
            height = 20,
            animation_speed = 0.5,
            scale = 0.5
          }
        }
      },


      {
        apply_recipe_tint = "tertiary",
        north_position = {0, 0},
        west_position = {0, 0},
        south_position = {0, 0},
        east_position = {0, 0},
        north_animation =
        {
          filename = "__base__/graphics/entity/chemical-plant/boiling-window-green-patch.png",
          frame_count = 1,
          width = 87,
          height = 60,
          shift = util.by_pixel(0, -5),
          hr_version =
          {
            filename = "__base__/graphics/entity/chemical-plant/hr-boiling-window-green-patch.png",
            x = 0,
            frame_count = 1,
            width = 174,
            height = 119,
            shift = util.by_pixel(0, -5.25),
            scale = 0.5
          }
        },
        east_animation =
        {
          filename = "__base__/graphics/entity/chemical-plant/boiling-window-green-patch.png",
          x = 87,
          frame_count = 1,
          width = 87,
          height = 60,
          shift = util.by_pixel(0, -5),
          hr_version =
          {
            filename = "__base__/graphics/entity/chemical-plant/hr-boiling-window-green-patch.png",
            x = 174,
            frame_count = 1,
            width = 174,
            height = 119,
            shift = util.by_pixel(0, -5.25),
            scale = 0.5
          }
        },
        south_animation =
        {
          filename = "__base__/graphics/entity/chemical-plant/boiling-window-green-patch.png",
          x = 174,
          frame_count = 1,
          width = 87,
          height = 60,
          shift = util.by_pixel(0, -5),
          hr_version =
          {
            filename = "__base__/graphics/entity/chemical-plant/hr-boiling-window-green-patch.png",
            x = 348,
            frame_count = 1,
            width = 174,
            height = 119,
            shift = util.by_pixel(0, -5.25),
            scale = 0.5
          }
        }
      }
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound =
      {
        {
          filename = "__base__/sound/chemical-plant.ogg",
          volume = 0.8
        }
      },
      idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 1.5
    },
    crafting_speed = chemical_plant_2_speed,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      --emissions = 0.008
	  emissions = chemical_plant_2_pollution
    },
    --energy_usage = "350kW",
	energy_usage = chemical_plant_2_energy_usage,
    ingredient_count = 4,
    crafting_categories = {"chemistry"},
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {-1, -2} }}
      },
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {1, -2} }}
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        base_level = 1,
        pipe_connections = {{ position = {-1, 2} }}
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        base_level = 1,
        pipe_connections = {{ position = {1, 2} }}
      }
    }
  } 
})
end
-- MK3 ##########################################################################################
	chemical_plant_3_energy_usage	= (calc_energy_usage(chemical_plant_3_speed, 180)).."kW"
	chemical_plant_3_pollution		= (calc_pollution(chemical_plant_3_speed, 3/250))
	
if chemical_plant_3 then
data:extend({
  {
    type = "assembling-machine",
	localised_name = "Chemical plant 3",
    name = "chemical-plant-3",
    icon = "__base__/graphics/icons/chemical-plant.png",
	icon_size = 32,
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "chemical-plant-2"},
    max_health = 300,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    drawing_box = {{-1.5, -1.9}, {1.5, 1.5}},
    module_specification =
    {
      module_slots = 4
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
   
    animation = make_4way_animation_from_spritesheet({ layers =
    {
      {
        filename = "__base__/graphics/entity/chemical-plant/chemical-plant.png",
        width = 122,
        height = 134,
        frame_count = 1,
        shift = util.by_pixel(-5, -4.5),
        hr_version =
        {
          filename = "__base__/graphics/entity/chemical-plant/hr-chemical-plant.png",
          width = 244,
          height = 268,
          frame_count = 1,
          shift = util.by_pixel(-5, -4.5),
          scale = 0.5
          }
      },
      {
        filename = "__base__/graphics/entity/chemical-plant/chemical-plant-shadow.png",
        width = 175,
        height = 110,
        frame_count = 1,
        shift = util.by_pixel(31.5, 11),
        draw_as_shadow = true,
        hr_version =
        {
          filename = "__base__/graphics/entity/chemical-plant/hr-chemical-plant-shadow.png",
          width = 350,
          height = 219,
          frame_count = 1,
          shift = util.by_pixel(31.5, 10.75),
          draw_as_shadow = true,
          scale = 0.5
          }
      }
    }}),
    working_visualisations =
    {
      {
        north_position = util.by_pixel(30, -24),
        west_position = util.by_pixel(1, -49.5),
        south_position = util.by_pixel(-30, -48),
        east_position = util.by_pixel(-11, -1),
        apply_recipe_tint = "primary",
        animation =
        {
          filename = "__base__/graphics/entity/chemical-plant/boiling-green-patch.png",
          frame_count = 32,
          width = 15,
          height = 10,
          animation_speed = 0.5,
          hr_version =
          {
            filename = "__base__/graphics/entity/chemical-plant/hr-boiling-green-patch.png",
            frame_count = 32,
            width = 30,
            height = 20,
            animation_speed = 0.5,
            scale = 0.5
          }
        }
      },

      {
        north_position = util.by_pixel(30, -24),
        west_position = util.by_pixel(1, -49.5),
        south_position = util.by_pixel(-30, -48),
        east_position = util.by_pixel(-11, -1),
        apply_recipe_tint = "secondary",
        animation =
        {
          filename = "__base__/graphics/entity/chemical-plant/boiling-green-patch-mask.png",
          frame_count = 32,
          width = 15,
          height = 10,
          animation_speed = 0.5,
          hr_version =
          {
            filename = "__base__/graphics/entity/chemical-plant/hr-boiling-green-patch-mask.png",
            frame_count = 32,
            width = 30,
            height = 20,
            animation_speed = 0.5,
            scale = 0.5
          }
        }
      },


      {
        apply_recipe_tint = "tertiary",
        north_position = {0, 0},
        west_position = {0, 0},
        south_position = {0, 0},
        east_position = {0, 0},
        north_animation =
        {
          filename = "__base__/graphics/entity/chemical-plant/boiling-window-green-patch.png",
          frame_count = 1,
          width = 87,
          height = 60,
          shift = util.by_pixel(0, -5),
          hr_version =
          {
            filename = "__base__/graphics/entity/chemical-plant/hr-boiling-window-green-patch.png",
            x = 0,
            frame_count = 1,
            width = 174,
            height = 119,
            shift = util.by_pixel(0, -5.25),
            scale = 0.5
          }
        },
        east_animation =
        {
          filename = "__base__/graphics/entity/chemical-plant/boiling-window-green-patch.png",
          x = 87,
          frame_count = 1,
          width = 87,
          height = 60,
          shift = util.by_pixel(0, -5),
          hr_version =
          {
            filename = "__base__/graphics/entity/chemical-plant/hr-boiling-window-green-patch.png",
            x = 174,
            frame_count = 1,
            width = 174,
            height = 119,
            shift = util.by_pixel(0, -5.25),
            scale = 0.5
          }
        },
        south_animation =
        {
          filename = "__base__/graphics/entity/chemical-plant/boiling-window-green-patch.png",
          x = 174,
          frame_count = 1,
          width = 87,
          height = 60,
          shift = util.by_pixel(0, -5),
          hr_version =
          {
            filename = "__base__/graphics/entity/chemical-plant/hr-boiling-window-green-patch.png",
            x = 348,
            frame_count = 1,
            width = 174,
            height = 119,
            shift = util.by_pixel(0, -5.25),
            scale = 0.5
          }
        }
      }
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound =
      {
        {
          filename = "__base__/sound/chemical-plant.ogg",
          volume = 0.8
        }
      },
      idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 1.5
    },
    crafting_speed = chemical_plant_3_speed,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      --emissions = 0.007
	  emissions = chemical_plant_3_pollution,
    },
    --energy_usage = "490kW",
	energy_usage = chemical_plant_3_energy_usage,
    ingredient_count = 4,
    crafting_categories = {"chemistry"},
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {-1, -2} }}
      },
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {1, -2} }}
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        base_level = 1,
        pipe_connections = {{ position = {-1, 2} }}
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        base_level = 1,
        pipe_connections = {{ position = {1, 2} }}
      }
    }
  }
})
end


-- RECIPES ######################################################################################
-- Assembling-machine ###########################################################################
-- MK2.5 ##########################################################################################
if assembling_machine_2_5 then
data:extend({
  {
    type = "recipe",
    name = "assembling-machine-2_5",
    enabled = false,
    ingredients =
    {
      {plate_1, 9},
	  {chip_1, 2},
	  {gear_1, 2},
	  {bearing_1, 3},
	  {"assembling-machine-2", 1}
    },
    result = "assembling-machine-2_5"
  }
})
end
-- MK4 ##########################################################################################
if assembling_machine_4 then
data:extend({
  {
    type = "recipe",
    name = "assembling-machine-4",
    enabled = false,
    ingredients =
    {
      {plate_3, 9},
	  {chip_3, 2},
	  {gear_3, 2},
	  {bearing_3, 3},
	  {"speed-module-2", 2},
	  {"assembling-machine-3", 1}
    },
    result = "assembling-machine-4"
  }
})
end
	
-- Oil-refinery #################################################################################
-- MK2 ##########################################################################################
if oil_refinery_2 then
data:extend({
  {
    type = "recipe",
    name = "oil-refinery-2",
    energy_required = 20,
    ingredients =
    {
      {"oil-refinery", 1},
      {chip_2, 10},
      {plate_2, 10},
      {gear_2, 5},
      {bearing_2, 5}
    },
    result = "oil-refinery-2",
    enabled = false
  }
})
end
-- MK3 ##########################################################################################
if oil_refinery_3 then
data:extend({
  {
    type = "recipe",
    name = "oil-refinery-3",
    energy_required = 20,
    ingredients =
    {
      {"oil-refinery-2", 1},
      {chip_3, 5},
      {plate_3, 10},
      {gear_3, 5},
      {bearing_3, 5}
    },
    result = "oil-refinery-3",
    enabled = false
  }
})
end

-- Chemical-plant ###############################################################################
-- MK2 ##########################################################################################
if chemical_plant_2 then
data:extend({
  {
    type = "recipe",
    name = "chemical-plant-2",
    energy_required = 10,
    enabled = false,
    ingredients =
    {
	  {"chemical-plant", 1},
      {plate_2, 5},
      {gear_2, 3},
	  {bearing_1, 2},
      {chip_2, 4},
    },
    result= "chemical-plant-2"
  }
})
end
-- MK3 ##########################################################################################
if chemical_plant_3 then
data:extend({
  {
    type = "recipe",
    name = "chemical-plant-3",
    energy_required = 10,
    enabled = false,
    ingredients =
    {
	  {"chemical-plant-2", 1},
      {plate_3, 5},
      {gear_3, 3},
	  {bearing_2, 2},
      {chip_3, 3},
    },
    result= "chemical-plant-3"
  }
})
end
