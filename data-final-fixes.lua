if not sjtextension then sjtextension={} end

require "config"
require "SJT_library"
if assembling_machine_2_5 then
	data.raw["technology"]["automation-3"].prerequisites = {"speed-module","automation-2_5"}
end

for k, v in pairs(data.raw.resource) do
	tint_buffer = {r=0,g=0,b=0}
	localised_ore_name_buffer = v.name:gsub("%-", " ")

	if string.match(v.name, "dirty") then
		-- do nothing
	
	elseif string.match(v.name, "trace")then
		-- do nothing

	else
		-- definition of the localised name
		for l, w in pairs(ore_names) do
			if v.name == l then
				localised_ore_name_buffer = w
			end
		end
		
		-- definition of the icon colour
		if v.name == "coal" then
			tint_buffer = {r = 0.2, g = 0.2, b = 0.2}
		elseif v.name == "iron-ore" then
			--tint_buffer = {r = 63/255, g = 109/255, b = 131/255}
			tint_buffer = {r = 73/255, g = 119/255, b = 141/255}
		elseif v.name == "copper-ore" then
			--tint_buffer = {r = 141/255, g = 44/255, b = 17/255}
			tint_buffer = {r = 161/255, g = 74/255, b = 37/255}
		elseif v.name == "stone" then
			tint_buffer = {r = 97/255, g = 81/255, b = 59/255}
		elseif v.name == "y-res1" then
			tint_buffer = {r = 21/255, g = 63/255, b = 103/255}
		elseif v.name == "y-res2" then
			tint_buffer = {r = 68/255, g = 140/255, b = 110/255}
		else
			tint_buffer = v.stages.sheet.tint
		end
	
		-- prepare the icons
		if dirt_trace_overlay then
			dirty_overlay = "__SJT-DirtyOre-Remastered__/graphics/icons/dirty-overlay.png"
			trace_overlay = "__SJT-DirtyOre-Remastered__/graphics/icons/trace-overlay.png"
		else 
			dirty_overlay = "__SJT-DirtyOre-Remastered__/graphics/icons/nothing.png"
			trace_overlay = "__SJT-DirtyOre-Remastered__/graphics/icons/nothing.png"
		end

		
		if v.infinite == true then
			-- do nothing		(infinite resources need no infinite variants)
		else

			-- prepare the buffer with mining results this is necessary as there are both mining results and mining result >_<
			mining_results_buffer = {}
			mining_results_buffer_dirty = {}
			mining_results_buffer_trace = {}
			if v.minable.result then
				if (type(v.minable.result) == "table") then
	  				mining_results_buffer[1] = table_copy(v.minable.result)
				else
					mining_results_buffer =		-- yes without [1] as there are two curly braces
					{
						{
						  type = data.raw["item"][v.name].type,
						  name = v.minable.result,
						  amount_min = does_exist(v.amount_min),
						  amount_max = does_exist(v.amount_max),
						  probability = does_exist(v.probability)
						}
					}
				end
			elseif v.minable.results then
				mining_results_buffer = table_copy(v.minable.results)
			else
			-- this is a default setting if coal appears somewhere it shouldn't something has gone horribly wrong
		      mining_results_buffer =
				{
					{
					  type = "item",
					  name = "coal",
					  amount_min = 1,
					  amount_max = 1,
					  probability = 1
					}
				}
			end
			mining_results_buffer_dirty = table_copy(mining_results_buffer)
			mining_results_buffer_trace = table_copy(mining_results_buffer)
			for l,w in pairs(mining_results_buffer_dirty) do
				w.name = "dirty-"..w.name
			end
			for l,w in pairs(mining_results_buffer_trace) do
				w.name = "trace-"..w.name
			end
		
			data:extend(
			{
			  --two new ores
			  {
--				localised_name = "dirty "..v.name,  -- can't use v.localised_name. it appears that this property is not generated at this point of time, it's a pitty
				localised_name = "dirty "..localised_ore_name_buffer,
				type = "resource",
				name = "dirty-" .. v.name,
				icon = v.icon,
				icon_size = 32,
				flags = v.flags,
			    category = v.category,
				order = v.order,
				minable =
				{
				  hardness = v.minable.hardness,
				  mining_particle = v.mining_particle,
				  mining_time = v.minable.mining_time*1.1,
				  --result = "dirty-" .. v.name		-- using v.minable.result yields an error: attempt to concatenate field 'result' (a nil value). strange just using v.minable.result makes the original ore drop
				  -- results = v.minable.results,
				  -- result = v.minable.result
				  results = mining_results_buffer_dirty
				},
				collision_box = v.collision_box,
				selection_box = v.selection_box,
				stage_counts = v.stage_counts,
				stages =
				{
				  sheet =
				  {
					filename = v.stages.sheet.filename,
					priority = "extra-high",
					tint = v.stages.sheet.tint,
					width = v.stages.sheet.width,
					height = v.stages.sheet.height,
					frame_count = v.stages.sheet.frame_count,
					variation_count = v.stages.sheet.variation_count
				  }
				},
				map_color = v.map_color
			  },

			  {
				localised_name = "trace "..localised_ore_name_buffer,  -- can't use v.localised_name. it appears that this property is not generated at this point of time, it's a pitty
				type = "resource",
				name = "trace-" .. v.name,
				icon = v.icon,
				icon_size = 32,
				flags = v.flags,
			    category = v.category,
				order = v.order,
				infinite=true,
				minimum=999,
				normal=1000,
				maximum=3000,
				minable =
				{
				  hardness = v.minable.hardness,
				  mining_particle = v.mining_particle,
				  mining_time = v.minable.mining_time*1.2,
				  results = mining_results_buffer_trace
				  },
				collision_box = v.collision_box,
				selection_box = v.selection_box,
				stage_counts = v.stage_counts,
				stages =
				{
				  sheet =
				  {
					filename = v.stages.sheet.filename,
					priority = "extra-high",
					tint = v.stages.sheet.tint,
					width = v.stages.sheet.width,
					height = v.stages.sheet.height,
					frame_count = v.stages.sheet.frame_count,
					variation_count = v.stages.sheet.variation_count				
				  }
				},
				map_color = v.map_color
			  },
			})
			for l,w in pairs(mining_results_buffer) do
				localised_item_name_buffer = v.name:gsub("%-", " ")
				for m, x in pairs(item_names) do
					if w.name == m then
						localised_item_name_buffer = x
					end
				end
				
				if w.type == "item" then	-- if it is not a fluid
					if not data.raw["item"]["dirty"..w.name] then
						data:extend(
						{
						  -- new ore-items produced by the new ores
							{
								localised_name = "dirty "..localised_item_name_buffer,
								type = "item",
								name = "dirty-"..w.name,
								icons = overlay_icons(data.raw["item"][w.name].icon, dirty_overlay),
								icon_size = 32,
								flags = {"goes-to-main-inventory"},
								subgroup = "dirty-ores",
								order = "d-b",
								stack_size = data.raw["item"][w.name].stack_size
							},
							{
								localised_name = "process dirty "..localised_item_name_buffer,
								type = "recipe",
								name = "process-dirty-"..w.name,
								enabled = "true",
								category = "dirty-ore-processing",
								energy_required = 1,
								ingredients =
								{
								  {"dirty-"..w.name, 3},
								  {type="fluid", name="water", amount=5}
								},
								results=
								{
									{name=w.name, amount=2},
									{name="stone", amount=1},
									{type="fluid",name="contaminated-water", amount=5}
								},
								icons = overlay_icons(data.raw["item"][w.name].icon, dirty_overlay),
								icon_size = 32,
								subgroup = "dirty-ores-processing",
								order = "a-a"
							},
						})
					end
					if not data.raw["item"]["trace"..w.name] then
						data:extend(
						{
							{
								localised_name = "trace "..localised_item_name_buffer,
								type = "item",
								name = "trace-"..w.name,
								icons = overlay_icons(data.raw["item"][w.name].icon, trace_overlay),
								icon_size = 32,
								flags = {"goes-to-main-inventory"},
								subgroup = "trace-ores",
								order = "d-b",
								stack_size = data.raw["item"][w.name].stack_size
							},
							{
								localised_name = "trace "..localised_item_name_buffer.." powder",
								type = "item",
								name = "trace-"..w.name.."-powder",
								icons = overlay_icons("__SJT-DirtyOre-Remastered__/graphics/icons/sand.png", trace_overlay, tint_buffer),
								icon_size = 32,
								flags = {"goes-to-main-inventory"},
								subgroup = "trace-ores",
								order = "d-b",
								stack_size = data.raw["item"][w.name].stack_size
							},
							{
								localised_name = "process trace "..localised_item_name_buffer,
								type = "recipe",
								name = "process-trace-"..w.name,
								enabled = "true",
								category = "dirty-ore-processing",	-- this is due to bad naming conventions i choose in the beginning should really have named it gravity-processing and chemical-processing or sth. like that
								energy_required = 1,
								ingredients =
								{
								  {"trace-"..w.name, 3},
								  {type="fluid", name="water", amount=5}
								},
								results=
								{
									{name="trace-"..w.name.."-powder", amount=2},
									{name="stone", amount=1},
									{type="fluid",name="contaminated-water", amount=5}
								},
								icons = overlay_icons(data.raw["item"][w.name].icon, trace_overlay),
								icon_size = 32,
								subgroup = "trace-ores-processing",
								order = "b-b"
							},
							{
								localised_name = "process trace "..localised_item_name_buffer.." powder",
								type = "recipe",
								name = "process-trace-"..w.name.."-powder",
								enabled = "true",
								category = "trace-ore-processing",
								energy_required = 1,
								ingredients =
								{
								  {"trace-"..w.name.."-powder", 2},
								  {type="fluid", name="sulfuric-acid", amount=1},
								  {type="fluid", name="water", amount=4}
								},
								results=
								{
									{name=w.name, amount=1},	--v.minable.result doesn't work here either still don't know why
									{name="stone", amount=1},
									{type="fluid",name="contaminated-water", amount=5}
								},
								icons = overlay_icons("__SJT-DirtyOre-Remastered__/graphics/icons/sand.png", trace_overlay, tint_buffer),
								icon_size = 32,
								subgroup = "trace-ores-processing",
								order = "b-b"
							},
						})
					end
				else -- if it is a fluid
					if not data.raw["fluid"]["dirty"..w.name] then
						data:extend(
						{
						  -- new liquid-items produced by the new liquid-patches
							{
								localised_name = "dirty "..localised_item_name_buffer,
								type = "fluid",
								name = "dirty-"..w.name,
								default_temperature = data.raw["fluid"][w.name].default_temperature,
								heat_capacity = data.raw["fluid"][w.name].heat_capacity,
								base_color = data.raw["fluid"][w.name].base_color,
								flow_color = data.raw["fluid"][w.name].flow_color,
								max_temperature = data.raw["fluid"][w.name].max_temperature,
								icons = overlay_icons(data.raw["fluid"][w.name].icon, dirty_overlay),
								icon_size = 32,
								pressure_to_speed_ratio = data.raw["fluid"][w.name].pressure_to_speed_ratio,
								flow_to_energy_ratio = data.raw["fluid"][w.name].flow_to_energy_ratio,
								order = data.raw["fluid"][w.name].order,
							},
							{
								localised_name = "process dirty "..localised_item_name_buffer,
								type = "recipe",
								name = "process-dirty-"..w.name,
								enabled = "true",
								category = "oil-processing",
								energy_required = 1,
								ingredients =
								{
								  {type="fluid", name="dirty-"..w.name, amount=3},
								  {type="fluid", name="water", amount=5}
								},
								results=
								{
									{type="fluid", name=w.name, amount=2},	--v.minable.result doesn't work here either still don't know why
									{type="fluid", name="contaminated-water", amount=6}
								},
								icons = overlay_icons(data.raw["fluid"][w.name].icon, dirty_overlay),
								icon_size = 32,
								subgroup = "dirty-ores-processing",
								order = "a-a"
							},
						})
					end
					if not data.raw["fluid"]["trace"..w.name] then
						data:extend(
						{
							{
								localised_name = "trace "..localised_item_name_buffer,
								type = "fluid",
								name = "trace-"..w.name,
								default_temperature = data.raw["fluid"][w.name].default_temperature,
								heat_capacity = data.raw["fluid"][w.name].heat_capacity,
								base_color = data.raw["fluid"][w.name].base_color,
								flow_color = data.raw["fluid"][w.name].flow_color,
								max_temperature = data.raw["fluid"][w.name].max_temperature,
								icons = overlay_icons(data.raw["fluid"][w.name].icon, dirty_overlay),
								icon_size = 32,
								pressure_to_speed_ratio = data.raw["fluid"][w.name].pressure_to_speed_ratio,
								flow_to_energy_ratio = data.raw["fluid"][w.name].flow_to_energy_ratio,
								order = data.raw["fluid"][w.name].order,
							},
							{
								localised_name = "process trace "..localised_item_name_buffer,
								type = "recipe",
								name = "process-trace-"..w.name,
								enabled = "true",
								category = "oil-processing",
								energy_required = 1,
								ingredients =
								{
								  {type="fluid", name="trace-"..w.name, amount=2},
								  {type="fluid", name="water", amount=8}
								},
								results=
								{
									{type="fluid",name="dirty-"..w.name, amount=1},	--v.minable.result doesn't work here either still don't know why
									{type="fluid",name="contaminated-water", amount=9}
								},
								icons = overlay_icons(data.raw["fluid"][w.name].icon, dirty_overlay),
								icon_size = 32,
								subgroup = "trace-ores-processing",
								order = "b-b"
							},
						})
					end
				end

			end

		end
	end
end

for k, v in pairs(ore_blacklist) do
	data.raw["recipe"]["process-dirty-"..v].enabled = false
	data.raw["recipe"]["process-trace-"..v].enabled = false
end
	
-- <kyranf> to understand lua syntax for "pairs" what it does is each iteration,
--  "k" is the "key" which could be a number, or anything actually,
-- used as the unique key for that entry in whatever table you passed into the pairs() section
-- [19:03] <kyranf> the "v" is the contents of that table entry,
-- which could be another table (lol) or a value of some kind