--
--	OBS Script LUA
--	https://obsproject.com/docs/genindex.html
--
--
--
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
	
    if not visible and not always_show then --[[ return --]] end  --ok

    local item = obs.calldata_sceneitem(calldata,"item") --ok
	
    local source = obs.obs_sceneitem_get_source(item)  --ok
	
	local currentscene = obs.obs_frontend_get_current_scene()  --ok
	
	local activescene = obs.obs_scene_from_source(currentscene)  --ok
	
    obs.obs_source_release(currentscene)
		
	local targetgroup = obs.obs_sceneitem_get_group(activescene, item)

	local groupsource = obs.obs_sceneitem_get_source(targetgroup)
	
	local groupname = obs.obs_source_get_name(groupsource)

	if not in_exclusion_array(groupname) then 
	
		local sceneitems = obs.obs_scene_enum_items(activescene) --ok

		for i, sceneitem in ipairs(sceneitems) do

			local g_source = obs.obs_sceneitem_get_source(sceneitem)

			local gi_name = obs.obs_source_get_name(g_source)

			if gi_name == groupname then

				if not obs.obs_sceneitem_visible(sceneitem) and visible then

					obs.obs_sceneitem_set_visible(sceneitem, true)

				end 	

				break

			end	
		end	 -- end for i
		
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

		end
		
	end
	
	obs.source_list_release(sources)
	
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
			
		end
		
	end
	
	obs.source_list_release(sources)

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
