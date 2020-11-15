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
	return "When a Group Source (Scene Item) visibility is toggled all children source items will also be toggled.\n\nThe user can specify Scene Items (Sources) to be exluded from the toggle action.\n\n"
end

--
--	Settings
--	Displayed in the User Interface
--
--
--
function script_properties()
	
    local props = obs.obs_properties_create()
	
    obs.obs_properties_add_editable_list(props, "sources", "Scenes and Groups",obs.OBS_EDITABLE_LIST_TYPE_STRINGS,nil,nil)
	
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

    local scene = obs.obs_sceneitem_get_scene(item)
	
    local sceneitems = obs.obs_scene_enum_items(scene)

    local found = false
		
    for i, sceneitem in ipairs(sceneitems) do
			
        local itemsource = obs.obs_sceneitem_get_source(sceneitem)

        local isn = obs.obs_source_get_name(itemsource)
		
		if isn == sourceName then

			-- Now hide all sources not excluded
			if not in_exclusion_array(sourceName) and not in_exclusion_array(isn) then 

				local group = obs.obs_group_from_source(itemsource)
				
				local groupitems = obs.obs_scene_enum_items(group)	

				for j, groupitem in ipairs(groupitems) do

						if visible and  not obs.obs_sceneitem_visible(g_sceneitem) then

							obs.obs_sceneitem_set_visible(groupitem, true)
						
						end	
				
				end -- end for
				
				obs.sceneitem_list_release(groupitems)
				
				if not visible and sourceName ~= isn and obs.obs_sceneitem_visible(sceneitem) then
				
				 found = true
				
				end
				
				
				
			end		
			
		end

	end 
	
    obs.sceneitem_list_release(sceneitems)
	
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
		
    local sourceNames =  obs.obs_data_get_array(settings, "sources")
	
    local count = obs.obs_data_array_count(sourceNames)
	
    for i = 0,count do 
		
        local item = obs.obs_data_array_item(sourceNames, i)
		
        local sourceName = obs.obs_data_get_string(item, "value")
		
        local source = obs.obs_get_source_by_name(sourceName)
		
        if source ~= nil then
			
            local sh = obs.obs_source_get_signal_handler(source)
			
            obs.signal_handler_disconnect(sh,"item_visible",item_visible)
			
            obs.signal_handler_connect(sh,"item_visible",item_visible)
			
            obs.obs_source_release(source)
			
        end
		
    end
	
	obs.obs_data_array_release(sourceNames)
	
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
	
    local source = obs.calldata_source(cd, "source")
	
    local sn = obs.obs_source_get_name(source)

    local sourceNames =  obs.obs_data_get_array(gs, "sources")
	
    local count = obs.obs_data_array_count(sourceNames)
	
    for i = 0,count do 
		
        local item = obs.obs_data_array_item(sourceNames, i)
		
        local sourceName = obs.obs_data_get_string(item, "value")
		
        if sn == sourceName then
			
            local sh = obs.obs_source_get_signal_handler(source);
			
            obs.signal_handler_disconnect(sh,"item_visible",item_visible)
			
            obs.signal_handler_connect(sh,"item_visible",item_visible)
			
        end
		
    end

    obs.obs_data_array_release(sourceNames)

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
