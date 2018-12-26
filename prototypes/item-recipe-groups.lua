-- new item group for the new stuff
data:extend({
	{
	type = "item-group",
	localised_name = "ore processing",
	name = "ores",
	order = "o",
	icon = "__base__/graphics/icons/copper-ore.png",
	icon_size = 32,
	},
	{
	type = "item-subgroup",
	name = "dirty-ores",
	group = "ores",
	order = "a",
	},
	{
	type = "item-subgroup",
	name = "trace-ores",
	group = "ores",
	order = "b",
	},
	{
	type = "item-subgroup",
	name = "dirty-ores-processing",
	group = "ores",
	order = "c",
	},
	{
	type = "item-subgroup",
	name = "trace-ores-processing",
	group = "ores",
	order = "c",
	},
	{
	type = "item-subgroup",
	name = "liquid-processing",
	group = "ores",
	order = "d",
	},
	
	
  {
    type = "recipe-category",
    name = "dirty-ore-processing",
  },
  {
    type = "recipe-category",
    name = "trace-ore-processing",
  },
    {
    type = "recipe-category",
    name = "waste-water-clearing",
  },
    {
    type = "recipe-category",
    name = "waste-water-disposal",
  },
  
})