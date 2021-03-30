-- Open Broadcaster Software®️
-- OBS > Tools > Scripts
--
-- 30/03/2021 14:52 @midnight-studios
--
--	Globals
obs           		= obslua
disable_script   	= false
visible_index 		= 1
switch_delay_ms      		= 0
current_source_name = ''
target_name 		= ''
last_state  		= obs.OBS_MEDIA_STATE_NONE

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
--	OBS Script Description
--	Displayed in the User Interface
--
--
--
function script_description()
	return "Cycle visibility of Scene Items (Sources).\n\nWhen the source Media End it will switch to the next Scene Item (Source)"
end

--
--	Settings
--	Displayed in the User Interface
--
--
--
function script_properties()
	
    local props = obs.obs_properties_create()
	--obs_properties_add_list(obs_properties_t, name, description, type, format)
	local scene_list = obs.obs_properties_add_list(props, "target_name", "Scene:", obs.OBS_COMBO_TYPE_EDITABLE, obs.OBS_COMBO_FORMAT_STRING)

	obs.obs_property_list_add_string(scene_list, "Select", "select")
	
    local scenenames = obs.obs_frontend_get_scene_names()
	
    if scenenames ~= nil then
		
        for _, scenename in ipairs(scenenames) do
			
            obs.obs_property_list_add_string(scene_list, scenename, scenename)
			
        end
		
    end
	
	local a_prop = obs.obs_properties_add_int(props, "switch_delay_ms", "Delay (ms)", 1, 3600000, 1000)
	
	--obs.obs_property_set_description(prop, "Delay for switching from one source to the next.")
	
    obs.obs_properties_add_bool(props, "disable_script", "Disable Script")
	
	return props
end

--
--	
--	
--
--
--
function script_update(settings)
			
    disable_script = obs.obs_data_get_bool(settings,"disable_script")
		
	target_name = obs.obs_data_get_string(settings, "target_name")
	
	switch_delay_ms = obs.obs_data_get_int(settings, "switch_delay_ms")
		
	obs.timer_remove(switch_source)
	
	activate(true)
	
end

--
--	
--	
--
--
--
function activate(activating)

	obs.timer_remove(switch_source)
	
	if activating then
		
		local source = obs.obs_get_source_by_name(target_name)

		if source == nil then
			
			return
			
		end

		obs.obs_source_release(source)
	
		hide_all()
		
		obs.timer_add(switch_source, switch_delay_ms)
		
	end
	
end

--
--	
--	
--
--
--	
function group_loop(diff)
		
    local scenes = obs.obs_frontend_get_scenes()
    if scenes ~= nil then
        for _, scenesource in ipairs(scenes) do
            local scene_name = obs.obs_source_get_name(scenesource)
            local scene = obs.obs_scene_from_source(scenesource)
            local sceneitems = obs.obs_scene_enum_items(scene)
            local maxindex = 0
            local index = 1
            for i, sceneitem in ipairs(sceneitems) do
				local source = obs.obs_sceneitem_get_source(sceneitem)
				local source_name = obs.obs_source_get_name(source)
				local enable = (index == visible_index)
				if scene_name == target_name and scene_name ~= source_name then
					obs.obs_sceneitem_set_visible(sceneitem, enable)
					if obs.obs_sceneitem_visible(sceneitem) then
						local item_source = obs.obs_sceneitem_get_source(sceneitem)
						current_source_name = obs.obs_source_get_name(item_source)
					end
                    maxindex = index
                    index = index + 1
				else
                    if sourcename == target_name then
						if group ~= nil then
                        	local groupitems = obs.obs_scene_enum_items(group)
							for j, groupitem in ipairs(groupitems) do
								if obs.obs_sceneitem_visible(groupitem) then
									local item_source = obs.obs_sceneitem_get_source(groupitem)
									current_source_name = obs.obs_source_get_name(item_source)
								end		
								maxindex = index
								index = index + 1
							end
							obs.sceneitem_list_release(groupitems)
						else			
							if scene_name == target_name and scene_name ~= source_name then
								if obs.obs_sceneitem_visible(groupitem) then
									local item_source = obs.obs_sceneitem_get_source(groupitem)
									current_source_name = obs.obs_source_get_name(item_source)
								end	
								maxindex = index
								index = index + 1
							end	
						end	-- end else							
                        visible_index = visible_index + 1
                        if visible_index > maxindex then
                            visible_index = 1
                        end
                    end
                end
            end
			obs.obs_source_release(item_source)
			obs.obs_source_release(source)
            obs.sceneitem_list_release(sceneitems)
            if scene_name == target_name then
                visible_index = visible_index + diff
                if visible_index > maxindex then
                    visible_index = 1
                elseif visible_index < 1 then
                    visible_index = maxindex
                end
            end
        end
        obs.source_list_release(scenes)
    end
end

--
--	
--	
--
--
--
function script_tick(seconds)
		
   if disable_script then
		return					
	end
	
	if target_name == "select" or target_name  == "" then
		return
	end	
	
    local source = obs.obs_get_source_by_name(current_source_name)
	
    if source ~= nil then
		
        local state = obs.obs_source_media_get_state(source)
		
        if last_state ~= state then
			
            last_state = state
			
            if state == obs.OBS_MEDIA_STATE_STOPPED or state == obs.OBS_MEDIA_STATE_ENDED then
				
				obs.timer_add(switch_source, switch_delay_ms)
				
            end
			
        end
		
    end
	
    obs.obs_source_release(source)
	
end

--
--	
--	
--
--
--
function switch_source()
	
	obs.timer_remove(switch_source)
	
	group_loop(1)
	
end	

--
--	
--	
--
--
--
function hide_all()
    local scenes = obs.obs_frontend_get_scenes()
    if scenes ~= nil then
        for _, scenesource in ipairs(scenes) do
            local scene_name = obs.obs_source_get_name(scenesource)
            local scene = obs.obs_scene_from_source(scenesource)
            local sceneitems = obs.obs_scene_enum_items(scene)
            for i, sceneitem in ipairs(sceneitems) do
                if scene_name == target_name then
                    obs.obs_sceneitem_set_visible(sceneitem, false)
                else
                    local source = obs.obs_sceneitem_get_source(sceneitem)

                        local group = obs.obs_group_from_source(source)
                        local groupitems = obs.obs_scene_enum_items(group)
                        for j, groupitem in ipairs(groupitems) do
                            obs.obs_sceneitem_set_visible(groupitem, false)
                        end 
						obs.sceneitem_list_release(groupitems)
                end
            end
            obs.sceneitem_list_release(sceneitems)

        end
        obs.source_list_release(scenes)
    end
end

--
--	
--	
--
--
--
function script_defaults(settings)

	obs.obs_data_set_default_int(settings, "switch_delay_ms", 1000)
	obs.obs_data_set_default_string(settings, "target_name", "Select")

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
function script_load(settings)
		
end
--
--	
--	
--
--
--
function script_unload()

end