require "config"
--[[
data:extend({
	{
		type = "technology",
		localised_name = "gravity separation 1",
		name = "ore-processing-1",
		icon = "__SJT-DirtyOre-Remastered__/graphics/icons/ore-processing-1.png",
		icon_size = 32,
		effects =
		{
			{
			type = "unlock-recipe",
			recipe = "gravity-concentration-unit"
			}
		},
		prerequisites = {"fluid-handling"},
		unit =
		{
			count = 10,
			ingredients =
			{
				{"science-pack-1", 1},
				{"science-pack-2", 1}
			},
			time = 10
		}
	},
})
data:extend({
	{
		type = "technology",
		localised_name = "gravity separation 2",
		name = "ore-processing-2",
		icon = "__SJT-DirtyOre-Remastered__/graphics/icons/ore-processing-2.png",
		icon_size = 32,
		effects =
		{
			{
			type = "unlock-recipe",
			recipe = "gravity-concentration-unit-2"
			}
		},
		prerequisites = {"ore-processing-1"},
		unit =
		{
			count = 75,
			ingredients =
			{
				{"science-pack-1", 1},
				{"science-pack-2", 1},
				{"science-pack-3", 1}
			},
			time = 15
		}
	},
})
data:extend({
	{
		type = "technology",
		localised_name = "gravity separation 3",
		name = "ore-processing-3",
		icon = "__SJT-DirtyOre-Remastered__/graphics/icons/ore-processing-3.png",
		icon_size = 32,
		effects =
		{
			{
			type = "unlock-recipe",
			recipe = "gravity-concentration-unit-3"
			}
		},
		prerequisites = {"ore-processing-2"},
		unit =
		{
			count = 50,
			ingredients =
			{
				{"science-pack-1", 2},
				{"science-pack-2", 2},
				{"science-pack-3", 2},
				--{"alien-science-pack", 1}
			},
			time = 30
		}
	},
})
data:extend({
	{
		type = "technology",
		localised_name = "ore leaching 1",
		name = "ore-processing-4",
		icon = "__SJT-DirtyOre-Remastered__/graphics/icons/ore-processing-T1.png",
		icon_size = 32,
		effects =
		{
			{
			type = "unlock-recipe",
			recipe = "ore-leaching-unit"
			}
		},
		prerequisites = {"sulfur-processing","ore-processing-1"},
		unit =
		{
			count = 100,
			ingredients =
			{
				{"science-pack-1", 1},
				{"science-pack-2", 1}
			},
			time = 5
		}
	},
})
data:extend({
	{
		type = "technology",
		localised_name = "ore leaching 2",
		name = "ore-processing-5",
		icon = "__SJT-DirtyOre-Remastered__/graphics/icons/ore-processing-T2.png",
		icon_size = 32,
		effects =
		{
			{
			type = "unlock-recipe",
			recipe = "ore-leaching-unit-2",
			}
		},
		prerequisites = {"ore-processing-4"},
		unit =
		{
			count = 75,
			ingredients =
			{
				{"science-pack-1", 1},
				{"science-pack-2", 1},
				{"science-pack-3", 1}
			},
			time = 15
		}
	},
})
data:extend({
	{
		type = "technology",
		localised_name = "ore leaching 3",
		name = "ore-processing-6",
		icon = "__SJT-DirtyOre-Remastered__/graphics/icons/ore-processing-T3.png",
		icon_size = 32,
		effects =
		{
			{
			type = "unlock-recipe",
			recipe = "ore-leaching-unit-3"
			}
		},
		prerequisites = {"ore-processing-5"},
		unit =
		{
			count = 50,
			ingredients =
			{
				{"science-pack-1", 2},
				{"science-pack-2", 2},
				{"science-pack-3", 2},
				--{"alien-science-pack", 1}
			},
			time = 50
		}
	},
})
data:extend({
	{
		type = "technology",
		localised_name = "waste water processing",
		name = "waste-water-processing",
		icon = "__SJT-DirtyOre-Remastered__/graphics/icons/waste_water.png",
		icon_size = 32,
		effects =
		{
			{
			type = "unlock-recipe",
			recipe = "clarification-plant"
			}
		},
		prerequisites = {"ore-processing-1"},
		unit =
		{
			count = 10,
			ingredients =
			{
				{"science-pack-1", 5},
				{"science-pack-2", 5},
			},
			time = 10
		}
	},
})

]]--
if assembling_machine_2_5 then
	data:extend({
		{
			type = "technology",
			localised_name = "automation 2.5",
			name = "automation-2_5",
			icon = "__base__/graphics/technology/automation.png",
			icon_size = 32,
			effects =
			{
				{
				type = "unlock-recipe",
				recipe = "assembling-machine-2_5"
				}
			},
			prerequisites = {"automation-2"},
			unit =
			{
				count = 100,
				ingredients =
				{
					{"science-pack-1", 1},
					{"science-pack-2", 1},
				},
				time = 10
			}
		},
	})
end
if assembling_machine_4 then
	data:extend({
		{
			type = "technology",
			localised_name = "automation 4",
			name = "automation-4",
			icon = "__base__/graphics/technology/automation.png",
			icon_size = 32,
			effects =
			{
				{
				type = "unlock-recipe",
				recipe = "assembling-machine-4"
				}
			},
			prerequisites = {"automation-3"},
			unit =
			{
				count = 150,
				ingredients =
				{
					{"science-pack-1", 1},
					{"science-pack-2", 1},
					{"science-pack-3", 1},
					--{"alien-science-pack",1}
				},
				time = 60
			}
		},
	})
end
if chemical_plant_2 then
	data:extend({
		{
			type = "technology",
			localised_name = "chemical plant MK2",
			name = "chemical-plant-2",
			icon = "__base__/graphics/icons/chemical-plant.png",
			icon_size = 32,
			effects =
			{
				{
				type = "unlock-recipe",
				recipe = "chemical-plant-2"
				}
			},
			prerequisites = {"oil-processing"},
			unit =
			{
				count = 75,
				ingredients =
				{
					{"science-pack-1", 1},
					{"science-pack-2", 1},
					{"science-pack-3", 1}
				},
				time = 15
			}
		},
	})
end
if chemical_plant_3 then
	data:extend({
		{
			type = "technology",
			localised_name = "chemical plant MK3",
			name = "chemical-plant-3",
			icon = "__base__/graphics/icons/chemical-plant.png",
			icon_size = 32,
			effects =
			{
				{
				type = "unlock-recipe",
				recipe = "chemical-plant-3"
				}
			},
			prerequisites = {"chemical-plant-2"},
			unit =
			{
				count = 50,
				ingredients =
				{
					{"science-pack-1", 2},
					{"science-pack-2", 2},
					{"science-pack-3", 2},
					--{"alien-science-pack", 1}
				},
				time = 30
			}
		},
	})
end
if oil_refinery_2 then
	data:extend({
		{
			type = "technology",
			localised_name = "oil refinery MK2",
			name = "oil-refinery-2",
			icon = "__base__/graphics/icons/oil-refinery.png",
			icon_size = 32,
			effects =
			{
				{
				type = "unlock-recipe",
				recipe = "oil-refinery-2"
				}
			},
			prerequisites = {"oil-processing"},
			unit =
			{
				count = 75,
				ingredients =
				{
					{"science-pack-1", 1},
					{"science-pack-2", 1},
					{"science-pack-3", 1}
				},
				time = 15
			}
		},
	})
end
if chemical_plant_3 then
	data:extend({
		{
			type = "technology",
			localised_name = "oil refinery MK3",
			name = "oil-refinery-3",
			icon = "__base__/graphics/icons/oil-refinery.png",
			icon_size = 32,
			effects =
			{
				{
				type = "unlock-recipe",
				recipe = "oil-refinery-3"
				}
			},
			prerequisites = {"oil-refinery-2"},
			unit =
			{
				count = 50,
				ingredients =
				{
					{"science-pack-1", 2},
					{"science-pack-2", 2},
					{"science-pack-3", 2},
					--{"alien-science-pack", 1}
				},
				time = 30
			}
		},
	})
end