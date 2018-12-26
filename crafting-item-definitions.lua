-- standard items for crafting
chip_1 = nil
chip_2 = nil
chip_3 = nil

if data.raw["item"]["advanced-circuit"] then
	chip_1 = "advanced-circuit"
else
	chip_1 = "electronic-circuit"
end

if data.raw["item"]["advanced-processing-unit"] then
	chip_2 = "processing-unit"
	chip_3 = "advanced-processing-unit"
else
	chip_2 = "advanced-circuit"
	chip_3 = "processing-unit"
end
--###############################################################################################
plate_1	= "steel-plate"
plate_2	= "steel-plate"
plate_3	= "steel-plate"

if data.raw["item"]["titanium-plate"] then
	plate_2 = "titanium-plate"
end

if data.raw["item"]["tungsten-plate"] then
	plate_3 = "tungsten-plate"
end
--###############################################################################################
gear_1	= "iron-gear-wheel"
gear_2	= "iron-gear-wheel"
gear_3	= "iron-gear-wheel"
if data.raw["item"]["steel-gear-wheel"] then
	gear_1 = "steel-gear-wheel"
end

if data.raw["item"]["titanium-gear-wheel"] then
	gear_2 = "titanium-gear-wheel"
end

if data.raw["item"]["tungsten-gear-wheel"] then
	gear_3 = "tungsten-gear-wheel"
end
--###############################################################################################
bearing_1	= "iron-gear-wheel"
bearing_2	= "iron-gear-wheel"
bearing_3	= "iron-gear-wheel"
if data.raw["item"]["steel-bearing"] then
	bearing_1 = "steel-bearing"
end

if data.raw["item"]["titanium-bearing"] then
	bearing_2 = "titanium-bearing"
end

if data.raw["item"]["nitinol-bearing"] then
	bearing_3 = "nitinol-bearing"
end