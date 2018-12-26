data:extend(
{
  {
    type = "fluid",
	localised_name = "contaminated water",
    name = "contaminated-water",
    default_temperature = 15,
    max_temperature = 100,
    heat_capacity = "1KJ",
    base_color = {r=0.5, g=0.34, b=0.2},
    flow_color = {r=0.5, g=0.34, b=0.2},
    icon = "__SJT-DirtyOre-Remastered__/graphics/icons/waste_water.png",
	icon_size = 32,
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    order = "z-z",
  },
  {
	localised_name = "clear water (no product)",
	type = "recipe",
	name = "clear-water-no-product",
	enabled = "true",
	category = "waste-water-clearing",
	energy_required = 5,
	ingredients =
	{
		{type="fluid",name="contaminated-water", amount=5},
	},
    results=
    {
      {type="fluid", name="water", amount=1, probability=0},
    },
	icon = "__SJT-DirtyOre-Remastered__/graphics/icons/waste_water.png",
	icon_size = 32,
	subgroup = "liquid-processing",
	order = "c-c",
  },
  {
	localised_name = "clear water",
	type = "recipe",
	name = "clear-water",
	enabled = "true",
	category = "waste-water-clearing",
	energy_required = 5,
	ingredients =
	{
		{type="fluid",name="contaminated-water", amount=5}
	},
    results=
    {
      {type="fluid", name="water", amount=5},
    },
	icon = "__SJT-DirtyOre-Remastered__/graphics/icons/waste_water.png",
	icon_size = 32,
	subgroup = "liquid-processing",
	order = "c-c",
  },
  {
	localised_name = "dispose waste water",
	type = "recipe",
	name = "dispose-waste-water",
	enabled = "true",
	category = "waste-water-disposal",
	energy_required = 5,
	ingredients =
	{
		{type="fluid",name="contaminated-water", amount=5}
	},
    results=
    {
      {type="fluid", name="water", amount=1, probability=0},
    },
	icon = "__SJT-DirtyOre-Remastered__/graphics/icons/waste_water.png",
	icon_size = 32,
	subgroup = "liquid-processing",
	order = "c-c",
  },
}
)

