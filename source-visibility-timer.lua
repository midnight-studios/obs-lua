-- Open Broadcaster Software®️
-- OBS > Tools > Scripts
--	
--
--
-- 06/11/2020 13:59 @achilles

--	Globals
local repeat_hold, repeat_source

obs           = obslua
source_name   = ""
mode          = ""
total_ms      = 0
delay         = 0
hold          = 0
start_visible = true
group_items	  = false	
settings_     = nil

--
--	OBS Script Description
--	Displayed in the User Interface
--
--
--
function script_description()
	
	return "Sets a source to show/hide on a timer."
end

--
--	Settings
--	Displayed in the User Interface
--
--
--
function script_properties()
	
	local props = obs.obs_properties_create()

	local mode = obs.obs_properties_add_list(props, "mode", "Mode", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING)
	
	obs.obs_property_list_add_string(mode, "Hide source after specified time", "mode_hide")
	
	obs.obs_property_list_add_string(mode, "Show source after specified time", "mode_show")
	
	obs.obs_property_list_add_string(mode, "Repeat", "mode_repeat")

	local p = obs.obs_properties_add_list(props, "source", "Source", obs.OBS_COMBO_TYPE_EDITABLE, obs.OBS_COMBO_FORMAT_STRING)
	
	local sources = obs.obs_enum_sources()
	
	if sources ~= nil then
		
		for _, source in ipairs(sources) do
			
			local name = obs.obs_source_get_name(source)
			
			obs.obs_property_list_add_string(p, name, name)
			
		end
		
	end
	
	obs.source_list_release(sources)

	obs.obs_properties_add_int(props, "delay_ms", "Delay after activated (ms)", 0, 3600000, 1)
	
	obs.obs_properties_add_int(props, "duration_ms", "Show (ms)", 1, 3600000, 1)
	
	obs.obs_properties_add_int(props, "hold_ms", "Hide (ms)", 1, 3600000, 1)

	obs.obs_properties_add_bool(props, "start_visible", "Start visible")

	obs.obs_properties_add_bool(props, "group_items", "Include Group items?")

	obs.obs_property_set_modified_callback(mode, settings_modified)

	settings_modified(props, nil, settings_)

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
--	This will toggle the visibility Source (Scene Item/s)
--	
--
--
--
function set_visibility(is_visible)
		
    local scenes = obs.obs_frontend_get_scenes()
	
	local is_source = false
	
    if scenes ~= nil then
		
        for _, scenesource in ipairs(scenes) do
			
            local scenename = obs.obs_source_get_name(scenesource)
			
            local scene = obs.obs_scene_from_source(scenesource)
			
            local sceneitems = obs.obs_scene_enum_items(scene)

            for i, sceneitem in ipairs(sceneitems) do
               
	                local source = obs.obs_sceneitem_get_source(sceneitem)
				
                    local sourcename = obs.obs_source_get_name(source)
					
                    if sourcename == source_name then
					
                        local group = obs.obs_group_from_source(source)
					
                        local groupitems = obs.obs_scene_enum_items(group)

							if is_visible ~= nil then
						
								obs.obs_sceneitem_set_visible(sceneitem, is_visible)
						
							else
								obs.obs_sceneitem_set_visible(sceneitem, not obs.obs_sceneitem_visible(sceneitem))
							end
							
							-- Target Sources inside Groups only if user specified
							if group_items then
						
								for j, groupitem in ipairs(groupitems) do

									if is_visible ~= nil then
										
										obs.obs_sceneitem_set_visible(groupitem, is_visible)
								
									else
										obs.obs_sceneitem_set_visible(groupitem, not obs.obs_sceneitem_visible(groupitem))

									end
								end							
							end
                    end
                
            end
			
            obs.sceneitem_list_release(groupitems)
			
            obs.sceneitem_list_release(sceneitems)
			
        end
		
        obs.source_list_release(scenes)
		
        --obs.obs_frontend_source_list_free(scenes)
    end
	
	obs.obs_source_release(source)
	
end

--
--	Hook function
--	Modify Source Visibility [Hide]
--	Stops Timer
--
--
function show_source()

	set_visibility(true)

	obs.timer_remove(show_source)
	
end

--
--	Hook function	
--	Modify Source Visibility [Show]	
--	Start Timer
--
--
function hide_source()

	set_visibility(false)

	obs.timer_remove(hide_source)
	
end

--
--	Hook function	
--	
-- Timer Modifications
--
--
function repeat_hold()

	set_visibility()

	obs.timer_remove(repeat_hold)
	
	obs.timer_add(repeat_source, total_ms)
	
end

--
--	Hook function	
--	
-- Timer Modifications
--
--
function repeat_source()

	set_visibility()

	obs.timer_remove(repeat_source)

	obs.timer_add(repeat_hold, hold)

end

--
--	
--	
--
--
--
function start_timer()

		if (mode == "mode_hide") then

			set_visibility(true)

			obs.timer_add(hide_source, total_ms)
		
		elseif (mode == "mode_show") then

			set_visibility(false)

			obs.timer_add(show_source, total_ms)
		
		elseif (mode == "mode_repeat") then

			set_visibility(start_visible)

			obs.timer_add(repeat_source, total_ms)
		
		end
	
	obs.timer_remove(start_timer)
	
end

--
--	
--	
--
--
--
function activate(activating)
	
	obs.timer_remove(start_timer)
	
	obs.timer_remove(repeat_hold)
	
	obs.timer_remove(repeat_source)
	
	obs.timer_remove(hide_source)
	
	obs.timer_remove(show_source)

	if activating then
		
		local source = obs.obs_get_source_by_name(source_name)

		if source == nil then
			
			return
			
		end

		obs.obs_source_release(source)

		if delay ~= 0 then
			
			obs.timer_add(start_timer, delay)
			
		else
			
			start_timer()
			
		end
		
	end
	
end

--
--	
--	
--
--
--
function settings_modified(props, prop, settings)
	
	local mode_setting = obs.obs_data_get_string(settings, "mode")
	
	local start = obs.obs_properties_get(props, "start_visible")
	
	local hold = obs.obs_properties_get(props, "hold_ms")

	local enabled

	if (mode_setting == "mode_repeat") then
		
		enabled = true
		
	else
		
		enabled = false
		
	end

	obs.obs_property_set_visible(start, enabled)
	
	obs.obs_property_set_visible(hold, enabled)

	return true
	
end


--
--	
--	
--
--
--
function script_update(settings)
	
	total_ms = obs.obs_data_get_int(settings, "duration_ms")
	
	delay = obs.obs_data_get_int(settings, "delay_ms")
	
	hold = obs.obs_data_get_int(settings, "hold_ms")
	
	source_name = obs.obs_data_get_string(settings, "source")
	
	mode = obs.obs_data_get_string(settings, "mode")
	
	start_visible = obs.obs_data_get_bool(settings, "start_visible")
	
	group_items = obs.obs_data_get_bool(settings, "group_items")
	
	activate(true)
	
end

--
--	
--	
--
--
--
function script_defaults(settings)
	
	obs.obs_data_set_default_int(settings, "duration_ms", 1000)
	
	obs.obs_data_set_default_int(settings, "delay_ms", 0)
	
	obs.obs_data_set_default_int(settings, "hold_ms", 1000)
	
	obs.obs_data_set_default_bool(setting, "start_visible", true)
	
	obs.obs_data_set_default_bool(setting, "group_items", false)
	
end

--
--	
--	
--
--
--
function script_load(settings)
	
	settings_ = settings
	
end

--
--	
--	
--
--
--
function script_unload()

end
