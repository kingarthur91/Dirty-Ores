-- functions to calculate pollution and power usage based on a crafting speed of 1.0 derived from assembling machines
calc_pollution = function(speed, pollution_at_speed_1)
	local tmp = pollution_at_speed_1*1.0000000001*speed^(-1.4745201441)
	return tmp
end
calc_energy_usage = function(speed, energy_usage_at_speed_1)
	local tmp = energy_usage_at_speed_1*(0.702482284*math.log(speed)+1.005041301)
	tmp = tmp/10
	tmp = math.floor(tmp+0.5)
	tmp = tmp*10
	return tmp
end

-- funciton to copy a table
function table_copy(t)
  local t2 = {};
  for k,v in pairs(t) do
    if type(v) == "table" then
        t2[k] = table_copy(v);
    else
        t2[k] = v;
    end
  end
  return t2;
end
-- mycopy = table_copy(original)

-- create icons
function overlay_icons(path1, path2, tint1, tint2)
	-- tint1 = tint1 or {r=1,b=1,c=1}
	-- tint2 = tint2 or {r=1,b=1,c=1}
	path2 = path2 or "__SJT-DirtyOre-Remastered__/graphics/icons/nothing.png"
	local return_icons = {
			{
				icon = path1,
				tint = tint1
			},
			{
				icon = path2,
				tint = tint2
			}
		}
	return return_icons
end

--checks if a value exists
function does_exist(input)
	if input then
		return input
	else
		return 1
	end
end