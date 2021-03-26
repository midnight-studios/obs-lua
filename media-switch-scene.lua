-- Open Broadcaster Software®️
-- OBS > Tools > Scripts
-- Original Code: @Exeldro
--
-- 27/03/2021 13:59 @midnight-studios
--
--	Globals

obs         = obslua
source_name = ""
scene_name  = ""

last_state  = obs.OBS_MEDIA_STATE_NONE
stop_streaming   = false
stop_recording   = false
disable_script   = false


function script_update(settings)
	
    source_name = obs.obs_data_get_string(settings, "source")
	
    scene_name = obs.obs_data_get_string(settings, "scene")
	
    stop_streaming = obs.obs_data_get_bool(settings,"stop_streaming")
	
    stop_recording = obs.obs_data_get_bool(settings,"stop_recording")
	
    disable_script = obs.obs_data_get_bool(settings,"disable_script")
	
end

function script_description()
	
	return "Select a media source and a scene to switch to after playback\n\nMade by Exeldro"
	
end

function script_properties()
	
    props = obs.obs_properties_create()
	
	local p = obs.obs_properties_add_list(props, "source", "Media Source", obs.OBS_COMBO_TYPE_EDITABLE, obs.OBS_COMBO_FORMAT_STRING)
	
	local sources = obs.obs_enum_sources()
	
	if sources ~= nil then
		
        for _, source in ipairs(sources) do
			
            local name = obs.obs_source_get_name(source)
			
            obs.obs_property_list_add_string(p, name, name)
			
		end
	end
	
    obs.source_list_release(sources)
	
	local scene_list = obs.obs_properties_add_list(props, "scene", "Scene:", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING)

	obs.obs_property_list_add_string(scene_list, "Select", "select")
	
    local scenenames = obs.obs_frontend_get_scene_names()
	
    if scenenames ~= nil then
		
        for _, scenename in ipairs(scenenames) do
			
            obs.obs_property_list_add_string(scene_list, scenename, scenename)
			
        end
		
    end
	
	local a_prop = obs.obs_properties_add_bool(props, "stop_streaming", "End Stream")
	
	obs.obs_property_set_long_description(a_prop, "When Streaming, if enabled will stop Streaming on Media Play End\n")
	
	local b_prop = obs.obs_properties_add_bool(props, "stop_recording", "End Recording")
	
	obs.obs_property_set_long_description(b_prop, "When Recording, if enabled will stop Recording on Media Play End\n")
	
    obs.obs_properties_add_bool(props, "disable_script", "Disable Script")

    return props
end

function script_load(settings)
	
    stop_streaming = obs.obs_data_get_bool(settings,"stop_streaming")
	
    stop_recording = obs.obs_data_get_bool(settings,"stop_recording")
	
    disable_script = obs.obs_data_get_bool(settings,"disable_script")
	
    script_update(settings)
	
end

function script_save(settings)

end

function script_tick(seconds)
			
   if disable_script then
		return					
	end
	
	if source_name == "select" or scene_name  == "select" then
		return
	end	
	
    local source = obs.obs_get_source_by_name(source_name)
	
    if source ~= nil then
		
        local state = obs.obs_source_media_get_state(source)
		
        if last_state ~= state then
			
            last_state = state
			
            if state == obs.OBS_MEDIA_STATE_STOPPED or state == obs.OBS_MEDIA_STATE_ENDED then
				
				if stop_streaming then
					obs.obs_frontend_streaming_stop()
				end
				if stop_recording then
					obs.obs_frontend_streaming_stop()				
				end

                local scene_source = obs.obs_get_source_by_name(scene_name)
				
                if scene_source ~= nil then
					
                    obs.obs_frontend_set_current_scene(scene_source)
					
                end
				
            end
			
        end
		
    end
	
    obs.obs_source_release(source)
	
end