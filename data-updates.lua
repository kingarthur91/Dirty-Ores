require "prototypes/buildings-vanilla-extension"
require "prototypes/buildings"
require "crafting-item-definitions"

if update_chemical_plant and not mods["angelspetrochem"] then
	chemical_plant_1_energy_usage	= (calc_energy_usage(chemical_plant_1_speed, 180)).."kW"
	chemical_plant_1_pollution		= (calc_pollution(chemical_plant_1_speed, 3/250))
	
	data.raw["assembling-machine"]["chemical-plant"].crafting_speed = chemical_plant_1_speed
	data.raw["assembling-machine"]["chemical-plant"].energy_source.emissions = chemical_plant_1_pollution
	data.raw["assembling-machine"]["chemical-plant"].energy_usage = chemical_plant_1_energy_usage
	--data.raw["recipe"]["chemical-plant"].ingredients[1][2] = data.raw["assembling-machine"]["chemical-plant"].ingredients[1][2]*4/5
	for k, v in pairs(data.raw["recipe"]["chemical-plant"].ingredients) do
		v[2] = v[2]*4/5
	end
end

if recipe_change_assembling_machine_3 then
--	data.raw["recipe"]["assembling-machine-3"].ingredients = nil
	data.raw["recipe"]["assembling-machine-3"].ingredients[1] = {plate_2, 9}
	data.raw["recipe"]["assembling-machine-3"].ingredients[2] = {chip_2, 3}
	data.raw["recipe"]["assembling-machine-3"].ingredients[3] = {gear_2, 2}
	data.raw["recipe"]["assembling-machine-3"].ingredients[4] = {bearing_2, 3}
	data.raw["recipe"]["assembling-machine-3"].ingredients[5] = {"speed-module", 2}
	data.raw["recipe"]["assembling-machine-3"].ingredients[6] = {"assembling-machine-2_5", 1}
end
--if recipe_change_assembling_machine_3 then
--	data.raw["recipe"]["assembling-machine-3"].ingredients = nil,
--	data.raw["recipe"]["assembling-machine-3"].ingredients =
--    {
--      {"speed-module", 1},
--      {"assembling-machine-2", 2}
--    }
--	data.raw["recipe"]["assembling-machine-3"].ingredients[3] = {"iron-plate", 10}
--	data.raw["recipe"]["assembling-machine-3"].ingredients[1] = nil
--end