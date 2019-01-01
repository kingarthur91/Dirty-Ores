require "prototypes/pipes-overlay"
require "prototypes/item-recipe-groups"
require "prototypes/liquids"
require "SJT_library"
require "prototypes/technologies"

--TODO: add settings for infinite ore types.:DONE
--TODO: add settings to and non normal ores types to spawn:DONE
--TODO: compatibilty. pymods compatibilty will be in pycoaltbaa. angels and bobs will remain as internal to dirty-ores:DONE AND LIES
--TODO: create infinite ore gen code :DONE
--TODO: adjust ore spawn to lower spawn rate of normal ores

if dev_mode then
data:extend(
{
  {
    type = "resource",
    name = "sjt-crude-oil",
    icon = "__base__/graphics/icons/crude-oil.png",
	icon_size = 32,
    flags = {"placeable-neutral"},
    category = "basic-fluid",
    order="a-b-a",
    infinite = false,
    minimum = 1500,
    normal = 15000,
    minable =
    {
      hardness = 1,
      mining_time = 1,
      results =
      {
        {
          type = "fluid",
          name = "sjtfluid",
          amount_min = 1,
          amount_max = 1,
          probability = 1
        }
      }
    },
    collision_box = {{ -1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
    stage_counts = {0},
    stages =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/crude-oil/crude-oil.png",
        priority = "extra-high",
        width = 75,
        height = 61,
        frame_count = 4,
        variation_count = 1
      }
    },
    map_color = {r=0.8, g=0.1, b=0.8},
    map_grid = false
  },
    {
    type = "fluid",
    name = "sjtfluid",
    default_temperature = 25,
    heat_capacity = "1KJ",
    base_color = {r=0, g=0, b=0},
    flow_color = {r=0.5, g=0.5, b=0.5},
    max_temperature = 100,
    icon = "__base__/graphics/icons/fluid/crude-oil.png",
	icon_size = 32,
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    order = "a[fluid]-b[crude-oil]"
  },
})
end