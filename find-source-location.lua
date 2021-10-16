
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
icon="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABUAAAAVCAYAAACpF6WWAAABlUlEQVQ4jc3UzUtVURQF8N9Lg1CLqEBMJD8iCSp4COZIEIxq0kDIolEzhzmoQRD1R1Q0rFmhPvwXmhQNRAdOtKJRBDWLog8efXBwC4/nvb7zBkEL7uSec9bZe629TsVO9OE6LqEfv/EHK1jEUvzLQrpgHu9wC0MNhzpwFo+xijO5pA+xjP0t9k1gE1OtCG8EYZEcRTiODRwr29AXLbeqsBlX8LRs8R5u1tHOF12tYbCZcA8u7qOGq7iQW2Z9ayJqRWc60fuFDyHDN5wOd1/jcMPlnzCK9ziIQx1s/mK8qNJK6PkWJzCM9TBhACdjX5rTLvzAKRzt5isONJNWgmy0vjXoP/ExiDZi+OtB9Dl1he8RhiN7mcQI7jYTp5RMtmtUmPUIM0WaJ4Oe5BrUgKTrG3QXLXaGhhNtkt6POJdiLKI3kkk4hxfxJuyKc5Gs2V3imlp+gJdRRDWnguGIXnqJ7uAypnEtTEmX3g7JqmXEZRUl8vMhR08M/is8j4BsIxE+C7PXcqrORTXSlyXFf0Oc5vYfELPwF4m1ZXqLr0FIAAAAAElFTkSuQmCC"
desc	    				= [[
<hr/><center><h2>Find Source Location</h2>(Version: %s)</center>
<br><center><img width=38 height=42 src=']] .. icon .. [['/></center>
<br><center><a href="https://github.com/midnight-studios/obs-lua/blob/main/find-source-location.lua">Find it on GitHub</a></center>
<br><p>Find Source location and display results in the Script Log.</p><p>Find help on the <a href=
"https://obsproject.com/forum/resources/">
OBS Forum Thread</a>.</p><hr/></p>]]
gversion = 0.1
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
Callback on list modification
----------------------------------------------------------
]]
function property_filter(props, property, settings)
	local source_filter = obs.obs_data_get_string(settings, "source_filter")
	local props = obs.obs_properties_get(props, "source_name")
	obs.obs_property_list_clear(props)
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
	source_list(source_name)
	-- Keep track of current settings
  	p_settings = settings 
end