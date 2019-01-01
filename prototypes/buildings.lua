require "SJT_library"
require "crafting-item-definitions"
require "config"

data:extend(
{
-- ITEMS ########################################################################################
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
    collision_box = {{-0.29, -0.79}, {0.29, 0.79}},
    selection_box = {{-0.5, -1}, {0.5, 1}},
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
    
    animations =
    {
      north =
      {
        filename = "__base__/graphics/entity/pump/pump-north.png",
        width = 53,
        height = 79,
        line_length =8,
        frame_count =32,
        animation_speed = 0.5,
        shift = util.by_pixel(8.000, 7.500),
        hr_version =
        {
          filename = "__base__/graphics/entity/pump/hr-pump-north.png",
          width = 103,
          height = 164,
          scale = 0.5,
          line_length =8,
          frame_count =32,
          animation_speed = 0.5,
          shift = util.by_pixel(8, 3.5) -- {0.515625, 0.21875}
        }
      },
      east =
      {
        filename = "__base__/graphics/entity/pump/pump-east.png",
        width = 66,
        height = 60,
        line_length =8,
        frame_count =32,
        animation_speed = 0.5,
        shift = util.by_pixel(0, 4),
        hr_version =
        {
          filename = "__base__/graphics/entity/pump/hr-pump-east.png",
          width = 130,
          height = 109,
          scale = 0.5,
          line_length =8,
          frame_count =32,
          animation_speed = 0.5,
          shift = util.by_pixel(-0.5, 1.75) --{-0.03125, 0.109375}
        }
      },

      south =
      {
        filename = "__base__/graphics/entity/pump/pump-south.png",
        width = 62,
        height = 87,
        line_length =8,
        frame_count =32,
        animation_speed = 0.5,
        shift = util.by_pixel(13.5, 0.5),
        hr_version =
        {
          filename = "__base__/graphics/entity/pump/hr-pump-south.png",
          width = 114,
          height = 160,
          scale = 0.5,
          line_length =8,
          frame_count =32,
          animation_speed = 0.5,
          shift = util.by_pixel(12.5, -8) -- {0.75, -0.5}
        }
      },
      west =
      {
        filename = "__base__/graphics/entity/pump/pump-west.png",
        width = 69,
        height = 51,
        line_length =8,
        frame_count =32,
        animation_speed = 0.5,
        shift = util.by_pixel(0.5, -0.5),
        hr_version =
        {
          filename = "__base__/graphics/entity/pump/hr-pump-west.png",
          width = 131,
          height = 111,
          scale = 0.5,
          line_length =8,
          frame_count =32,
          animation_speed = 0.5,
          shift = util.by_pixel(-0.25, 1.25) -- {-0.015625, 0.078125}
        }
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