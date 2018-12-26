require "util"
require "story"
require "autoplace_utils"
require "dataloader"
require "math3d"
require "SJT_library"
require "config"

if save_mode then
	if spawn_dirty_ores then
		script.on_event(defines.events, function(event)
			if event.name == defines.events.on_resource_depleted then
	--game.show_message_dialog{text={"resource depleted"}}
				if string.match(event.entity.name, "dirty") then
					-- spawn trace ore
					if game.item_prototypes["trace-"..event.entity.name:gsub("dirty%-", "")] then
						event.entity.surface.create_entity({name="trace-"..event.entity.name:gsub("dirty%-", ""), amount=math.random(500, 3000), position={event.entity.position.x, event.entity.position.y}})
					else
						-- do nothing
					end
				elseif string.match(event.entity.name, "trace") then
						-- do nothing (this is important to catch resource "depletion" event of trace deposits (when amount falls down to 999 ))
				else
					--spawn dirty ore
	--game.show_message_dialog{text={event.entity.name}}
					if game.item_prototypes["dirty-"..event.entity.name] then
	--game.show_message_dialog{text={"trying to place dirty ore variant: ".."dirty-"..event.entity.name}}
						event.entity.surface.create_entity({name="dirty-"..event.entity.name, amount=math.random(1001, 3000), position={event.entity.position.x, event.entity.position.y}})
					else
						-- do nothing
					end
				end
			end
		end)
	end
else
	if spawn_dirty_ores then
		script.on_event(defines.events, function(event)
			if event.name == defines.events.on_resource_depleted then
				if string.match(event.entity.name, "dirty") then
					event.entity.surface.create_entity({name="trace-"..event.entity.name:gsub("dirty%-", ""), amount=math.random(500, 3000), position={event.entity.position.x, event.entity.position.y}})
				elseif string.match(event.entity.name, "trace") then
						-- do nothing (this is important to catch resource "depletion" event of trace deposits (when amount falls down to 999 ))
				else
					event.entity.surface.create_entity({name="dirty-"..event.entity.name, amount=math.random(1001, 3000), position={event.entity.position.x, event.entity.position.y}})
				end
			end
		end)
	end
end


--############################################################################################
--Pollution when waste-water is used for power consumption

function index_generators()
	if global.generator_index == nil then
		global.generator_index = {}
		for k,surf in pairs (game.surfaces) do
			for chunk in surf.get_chunks() do
				for key, generator in pairs(surf.find_entities_filtered({area={{chunk.x * 32, chunk.y * 32}, {chunk.x * 32 + 32, chunk.y * 32 + 32}}, type = "generator",})) do
					table.insert(global.generator_index, generator)
					if dev_mode then
						game.players[1].print{"generator indexed: "..#global.generator_index}
					end
				end
			end
		end
	else
		for k in pairs (global.generator_index) do
			global.generator_index [k] = nil
		end
		for k,surf in pairs (game.surfaces) do
			for chunk in surf.get_chunks() do
				for key, generator in pairs(surf.find_entities_filtered({area={{chunk.x * 32, chunk.y * 32}, {chunk.x * 32 + 32, chunk.y * 32 + 32}}, type = "generator",})) do
					table.insert(global.generator_index, generator)
					if dev_mode then
						game.players[1].print{"generator indexed: "..#global.generator_index}
					end
				end
			end
		end
	end
end

function add_gen_to_index(entity)
	if entity.type == "generator" then
		if global.generator_index == nil then
			global.generator_index = {}
		end
		table.insert(global.generator_index, entity)
	end
end

script.on_configuration_changed(function(event)
	if global.generator_index == nil then
		index_generators()
	end
end)
script.on_event(defines.events.on_built_entity, function(event)
		add_gen_to_index(event.created_entity)
end)
script.on_event(defines.events.on_robot_built_entity, function(event)
		add_gen_to_index(event.created_entity)
end)

script.on_event(defines.events.on_tick, function(event)
	if event.tick%60 == 32 then		-- on every tick 32 of a game sec
		if global.generator_index ~= nil then
			for key, generator in pairs(global.generator_index) do
				if generator.valid then
					if dev_mode then
						game.players[1].print{"indexed generators: "..#global.generator_index}
					end
					if generator.fluidbox[1] ~= nil then
						if generator.fluidbox[1].type == "contaminated-water" then
							generator.surface.pollute({generator.position.x, generator.position.y}, generator.fluidbox[1].amount*6*75)
							generator.health = generator.health*0.99
						end
					end
				else	-- if the generator no longer exists remove it from the index
					table.remove(global.generator_index, key)
				end
			end
		end
	end
end)