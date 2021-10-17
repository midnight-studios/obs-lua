
--[[
----------------------------------------------------------
Open Broadcaster Software®️
OBS > Tools > Scripts
@midnight-studios

Simple Source Search Tool
----------------------------------------------------------
]]

--Globals
obs           				= obslua
source_name   				= ""
list_all 					= "List Everything"
p_settings 					= nil
icon="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAACXBIWXMAAAsTAAALEwEAmpwYAAAF8WlUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNi4wLWMwMDIgNzkuMTY0NDYwLCAyMDIwLzA1LzEyLTE2OjA0OjE3ICAgICAgICAiPiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtbG5zOmRjPSJodHRwOi8vcHVybC5vcmcvZGMvZWxlbWVudHMvMS4xLyIgeG1sbnM6cGhvdG9zaG9wPSJodHRwOi8vbnMuYWRvYmUuY29tL3Bob3Rvc2hvcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZUV2ZW50IyIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgMjEuMiAoV2luZG93cykiIHhtcDpDcmVhdGVEYXRlPSIyMDIxLTEwLTE3VDAwOjI2OjI2KzEzOjAwIiB4bXA6TW9kaWZ5RGF0ZT0iMjAyMS0xMC0xN1QxNzo1NzozNisxMzowMCIgeG1wOk1ldGFkYXRhRGF0ZT0iMjAyMS0xMC0xN1QxNzo1NzozNisxMzowMCIgZGM6Zm9ybWF0PSJpbWFnZS9wbmciIHBob3Rvc2hvcDpDb2xvck1vZGU9IjMiIHBob3Rvc2hvcDpJQ0NQcm9maWxlPSJzUkdCIElFQzYxOTY2LTIuMSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDplNTkyOWZiYS0yYzA4LTI1NDYtOTdlMC0zZDBjZjZiNWZjNmUiIHhtcE1NOkRvY3VtZW50SUQ9ImFkb2JlOmRvY2lkOnBob3Rvc2hvcDpmMjMyODU5MC03YTQ2LTVlNDItOGM4Ni1iMjZkZGVmMTA4Y2UiIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDoxZWJmNWY5Mi1kNDg5LWU0NDQtOTFlNi05MTcwOTFkODYyMDciPiA8eG1wTU06SGlzdG9yeT4gPHJkZjpTZXE+IDxyZGY6bGkgc3RFdnQ6YWN0aW9uPSJjcmVhdGVkIiBzdEV2dDppbnN0YW5jZUlEPSJ4bXAuaWlkOjFlYmY1ZjkyLWQ0ODktZTQ0NC05MWU2LTkxNzA5MWQ4NjIwNyIgc3RFdnQ6d2hlbj0iMjAyMS0xMC0xN1QwMDoyNjoyNisxMzowMCIgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWRvYmUgUGhvdG9zaG9wIDIxLjIgKFdpbmRvd3MpIi8+IDxyZGY6bGkgc3RFdnQ6YWN0aW9uPSJzYXZlZCIgc3RFdnQ6aW5zdGFuY2VJRD0ieG1wLmlpZDplNTkyOWZiYS0yYzA4LTI1NDYtOTdlMC0zZDBjZjZiNWZjNmUiIHN0RXZ0OndoZW49IjIwMjEtMTAtMTdUMTc6NTc6MzYrMTM6MDAiIHN0RXZ0OnNvZnR3YXJlQWdlbnQ9IkFkb2JlIFBob3Rvc2hvcCAyMS4yIChXaW5kb3dzKSIgc3RFdnQ6Y2hhbmdlZD0iLyIvPiA8L3JkZjpTZXE+IDwveG1wTU06SGlzdG9yeT4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4jcxTwAAAJbklEQVR4nO2de7BWVRmHn8M5HgIOoGiQDBSm2UheaKxRC4qL3XTKsoS0suliFycluxjWlKlTOhmkTaGV+UeWmmk4xmSZoxDJhJQNHaQwKIoGlFIuCnIRTn/8zjd8Z5+19rfX2mvvbzWsZ8YB1r6s95zf3nu9613vu+zo6+sjEQ9D2m1AYiBJkMhIgkRGEiQykiCRkQSJjCRIZCRBIiMJEhlJkMjocjl5y1NPVWHDCcA04GTgOGAS8GJgFLJvO7AD2AisBZ4AHgEeBfZUYVBoxo4b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"
desc	    				= [[
<hr/><center><h2>Find Source Location</h2>(Version: %s)</center>
<br><center><img width=50 height=50 src=']] .. icon .. [['/></center>
<br><center><a href="https://github.com/midnight-studios/obs-lua/blob/main/find-source-location.lua">Find it on GitHub</a></center>
<br><p>Find Source location and display results in the Script Log.</p><p>Find help on the <a href=
"https://obsproject.com/forum/resources/">
OBS Forum Thread</a>.</p><hr/></p>]]
gversion = 0.1
goto   			= false
--[[
----------------------------------------------------------
--	If testing and log event writing is needed
----------------------------------------------------------
]]
local function log(name, msg)
  if msg ~= nil then
    msg = " > " .. tostring(msg)
  else
    msg = ""
  end
  obs.script_log(obs.LOG_DEBUG, name .. msg)
end


--[[
----------------------------------------------------------
----------------------------------------------------------
]]
function script_description()
	return string.format(desc, tostring(gversion))
end
--[[
----------------------------------------------------------
----------------------------------------------------------
]]
function source_list(source_name)
	local scenes = obs.obs_frontend_get_scenes()
    if scenes ~= nil then
        for key_scenesource, value_scenesource in pairs(scenes) do
            local scenename = obs.obs_source_get_name(value_scenesource)
            local scene = obs.obs_scene_from_source(value_scenesource)
            local sceneitems = obs.obs_scene_enum_items(scene)
            for key_sceneitem, value_sceneitem in pairs(sceneitems) do
                local source = obs.obs_sceneitem_get_source(value_sceneitem)
				local group = obs.obs_group_from_source(source)
				source_name_parent = obs.obs_source_get_name(source)		
				if source_name == source_name_parent then
					local results = string.format('<Source:"%s"> <Scene:"%s">', tostring(source_name_parent), tostring(scenename))
					print(results)
					if goto then
						set_current_scene(scenename)
					end					
				end		
				if source_name == list_all then
					local results = string.format('<Source:"%s"> <Scene:"%s">', tostring(source_name_parent), tostring(scenename))
					print(results)			
				end	
				if group ~= nil then
					local groupitems = obs.obs_scene_enum_items(group)	
					if groupitems ~= nil then
						for key_groupitem, value_groupitem in pairs(groupitems) do
							local groupitemsource = obs.obs_sceneitem_get_source(value_groupitem)
							source_name_child = obs.obs_source_get_name(groupitemsource)		
							if source_name == source_name_child then
								local results = string.format('<Source:"%s"> <Group:"%s"> <Scene:"%s">', tostring(source_name_child), tostring(source_name_parent), tostring(scenename))
								print(results)
								if goto then
									set_current_scene(scenename)
								end		
							end
							if source_name == list_all then
								local results = string.format('<Source:"%s"> <Group:"%s"> <Scene:"%s">', tostring(source_name_child), tostring(source_name_parent), tostring(scenename))
								print(results)	
							end					
						end -- end for
						obs.sceneitem_list_release(groupitems)
					end
				end	
            end -- end for
            obs.sceneitem_list_release(sceneitems)
			--log('Done', '')
        end
        obs.source_list_release(scenes)
        --obs.obs_frontend_source_list_free(scenes)
    end
	return results
end	

--[[
----------------------------------------------------------
----------------------------------------------------------
]]
function remove_duplicates(t)
local hash = {}
local res = {}
for _,v in pairsByKeys(t) do
   if (not hash[v]) then
       res[#res+1] = v -- you could print here instead of saving to result table if you wanted
       hash[v] = true
   end

end	
	return res
end	

--[[
----------------------------------------------------------
----------------------------------------------------------
]]
function pairsByKeys(t, f)
	local a = {}
	for n in pairs(t) do table.insert(a, n) end
	table.sort(a, f)
	local i = 0      -- iterator variable
	local iter = function ()   -- iterator function
		i = i + 1
		if a[i] == nil then return nil
		else return a[i], t[a[i]]
		end
	end
	return iter
end
--[[
----------------------------------------------------------
	Only used in Countdown mode
----------------------------------------------------------
]]
function set_current_scene(source_name)
		local source = obs.obs_get_source_by_name(source_name)
		if source ~= nil then
			obs.obs_frontend_set_current_scene(source)
		end
		obs.obs_source_release(source)
end	
--[[
----------------------------------------------------------
Callback on list modification
----------------------------------------------------------
]]
function property_filter(props, property, settings)
	local source_filter = obs.obs_data_get_string(settings, "source_filter")
	local props = obs.obs_properties_get(props, "source_name")
	obs.obs_property_list_clear(props)
	if source_filter == list_all then
		obs.obs_property_list_add_string(props, list_all, list_all)
	end
	local list = {}
	local sources = obs.obs_enum_sources()
		if sources ~= nil then
			for _, source in ipairs(sources) do
				local name = obs.obs_source_get_name(source)
				local id = obs.obs_source_get_id(source)
				local display_name = obs.obs_source_get_display_name(id)
				if source_filter ~= list_all then
					if display_name == source_filter then
						list[name] = name
					end	
				else
					list[name] = name
				end	
			end	
			for key, value in pairsByKeys(list) do
				obs.obs_property_list_add_string(props, value, value)
			end
		end	
	obs.source_list_release(sources)
  -- IMPORTANT: returns true to trigger refresh of the properties
  return true
end
--[[
----------------------------------------------------------
----------------------------------------------------------
]]
function script_properties()
	local list = {}
	local props = obs.obs_properties_create()
	local sources = obs.obs_enum_sources()
	local p_a = obs.obs_properties_add_list(props, "source_filter", "Source Filter", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING)
	obs.obs_property_list_add_string(p_a, list_all, list_all)	
	if sources ~= nil then
		for _, source in pairs(sources) do
			local name = obs.obs_source_get_name(source)
			local id = obs.obs_source_get_id(source)
			local display_name = obs.obs_source_get_display_name(id)
			if display_name ~= nil then
				list[display_name] = display_name
			end
		end	
		list = remove_duplicates(list)
		for key, value in pairsByKeys(list) do
			obs.obs_property_list_add_string(p_a, value, value)
		end
	end	
	list = {}
	local p_b = obs.obs_properties_add_list(props, "source_name", "Source Name", obs.OBS_COMBO_TYPE_EDITABLE, obs.OBS_COMBO_FORMAT_STRING)
	obs.obs_property_list_add_string(p_b, list_all, list_all)	
	if sources ~= nil then
		for _, source in ipairs(sources) do
			local name = obs.obs_source_get_name(source)
			list[name] = name
		end	
		for key, value in pairsByKeys(list) do
			obs.obs_property_list_add_string(p_b, value, value)
		end
	end	
	obs.obs_properties_add_bool(props, "goto", "Activate Found Scene")
	obs.source_list_release(sources)
  	obs.obs_property_set_modified_callback(p_a, property_filter)
	-- Calls the callback once to set-up current visibility
  	obs.obs_properties_apply_settings(props, p_settings)
	return props
end
--[[
----------------------------------------------------------
----------------------------------------------------------
]]
function script_update(settings)
	source_name = obs.obs_data_get_string(settings, "source_name")
    goto = obs.obs_data_get_bool(settings,"goto")
	source_list(source_name)
	-- Keep track of current settings
  	p_settings = settings 
end
--[[
----------------------------------------------------------
A function named script_defaults will be called to set the default settings
----------------------------------------------------------
]]
function script_defaults(settings)
		obs.obs_data_set_default_bool(settings, "goto", false)
	obs.obs_data_set_default_string(settings, "source_name", list_all)
	obs.obs_data_set_default_string(settings, "source_filter", list_all)
end