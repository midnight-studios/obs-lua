obs           = obslua
gs            = nil
always_show   = false
disable_script   = false
--
--	OBS Script Description
--	Displayed in the User Interface
--
--
--
function script_description()
	return "When child sources of a Group Source (Scene Item) visibility is toggled it will make the group visible."
end

--
--	Settings
--	Displayed in the User Interface
--
--
--
function script_properties()
	
    local props = obs.obs_properties_create()
		
    obs.obs_properties_add_editable_list(props, "exclusion", "Exclude",obs.OBS_EDITABLE_LIST_TYPE_STRINGS,nil,nil)
		
    obs.obs_properties_add_bool(props, "always_show", "Always show")
	
    obs.obs_properties_add_bool(props, "disable_script", "Disable Script")
	
	return props
end

--
--	Just a tool
--	If testing and log event writing is needed
--
--
--
local function log(name, msg)
  if msg ~= nil then
    msg = " > " .. tostring(msg)
  else
    msg = ""
  end
  obs.script_log(obs.LOG_DEBUG, name .. msg)
end

--
--	Check if an exclusion Name is in Scene / Group / Source Items
--	
--
--
--
function in_exclusion_array(itm)
	
    local matchFound = false
	
    local exclusionNames = obs.obs_data_get_array(gs, "exclusion");
	
    local count = obs.obs_data_array_count(exclusionNames);
	
    for i = 0,count do 
		
        local item = obs.obs_data_array_item(exclusionNames, i);
		
        local exclusionName = obs.obs_data_get_string(item, "value");
		
        if exclusionName ~= nil then
			
			if exclusionName == itm then
				
				matchFound = true
				
			end
			
        end
		
    end
	
	obs.obs_data_array_release(exclusionNames)

	return matchFound
	
end

--[[
-- 		The user requested a specific source to be switched on.
--
-- 		This function will switch on the requested source and
-- 		all of the sources linked to it.
--
--		The function will then switched off all other 
--		sources, but will ignore all sources listed in
-- 		the the exclussion list.   
--]] 
function item_visible(calldata)
	
    if disable_script then return end	
	
	--[[
	-- 
	-- 
	-- The 'visible' variable represents an event call
	-- intended to register a user request to switch on
	-- a new source. 
	--
	--]] 
    local visible = obs.calldata_bool(calldata,"visible")
	
	local rendered = false

    if not visible and not always_show then --[[ return --]] end

    local item = obs.calldata_sceneitem(calldata,"item")
	
    local source = obs.obs_sceneitem_get_source(item)
	
    local sourceName = obs.obs_source_get_name(source)
	
	local activescene = obs.obs_scene_from_source(obs.obs_frontend_get_current_scene(source))
	
	local targetgroup = obs.obs_sceneitem_get_group(activescene, item)
	
	local groupsource = obs.obs_sceneitem_get_source(targetgroup)
	
	local groupname = obs.obs_source_get_name(groupsource)

	-- sources not excluded
	if not in_exclusion_array(groupname) then 
	
		local g_sceneitems = obs.obs_scene_enum_items(activescene)	

		for i, g_sceneitem in ipairs(g_sceneitems) do

			local g_source = obs.obs_sceneitem_get_source(g_sceneitem)

			local gi_name = obs.obs_source_get_name(g_source)

			if gi_name == groupname then

				if not obs.obs_sceneitem_visible(g_sceneitem) and visible then

					obs.obs_sceneitem_set_visible(g_sceneitem, true)

					local group = obs.obs_group_from_source(g_source)

					local groupitems = obs.obs_scene_enum_items(group)	

					for j, groupitem in ipairs(groupitems) do

						local gi_source = obs.obs_sceneitem_get_source(groupitem)
						
						local name = obs.obs_source_get_name(gi_source)

						log(name..' enabled: ', obs.obs_source_enabled(gi_source));

					end -- end for
					
					obs.sceneitem_list_release(groupitems)

				end 	

				break

			end

		end	

		obs.sceneitem_list_release(g_sceneitems)

		obs.sceneitem_list_release(sceneitems)

	end
		
end

--
--	
--	
--
--
--
function script_update(settings)
		
    always_show = obs.obs_data_get_bool(settings,"always_show")
	
    disable_script = obs.obs_data_get_bool(settings,"disable_script")
	
	local sources = obs.obs_enum_sources()
	
	if sources ~= nil then
		
		for _, source in ipairs(sources) do
						
            local sh = obs.obs_source_get_signal_handler(source)
			
            obs.signal_handler_disconnect(sh,"item_visible",item_visible)
			
            obs.signal_handler_connect(sh,"item_visible",item_visible)
			
            obs.obs_source_release(source)
			
		end
		
	end
	
end

--
--	
--	
--
--
--
function script_defaults(settings)

end

--
--	
--	
--
--
--
function script_save(settings)

end

--
--	
--	
--
--
--
function loaded(cd)
	
    if gs == nil then
		
        return
		
    end

	local sources = obs.obs_enum_sources()
	
	if sources ~= nil then
		
		for _, source in ipairs(sources) do
						
            local sh = obs.obs_source_get_signal_handler(source)
			
            obs.signal_handler_disconnect(sh,"item_visible",item_visible)
			
            obs.signal_handler_connect(sh,"item_visible",item_visible)
			
            obs.obs_source_release(source)
			
		end
		
	end

end

--
--	
--	
--
--
--
function script_load(settings)
	
    gs = settings
	
    always_show = obs.obs_data_get_bool(settings,"always_show")
	
    disable_script = obs.obs_data_get_bool(settings,"disable_script")
	
    local sh = obs.obs_get_signal_handler()
	
    obs.signal_handler_connect(sh, "source_load", loaded)
	
end

--
--	
--	
--
--
--
function script_unload()

end
