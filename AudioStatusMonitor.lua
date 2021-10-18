--[[
----------------------------------------------------------
Open Broadcaster Software®️
OBS > Tools > Scripts
@midnight-studios

Source Monitor
----------------------------------------------------------
]]

--Globals
obs           				= obslua
gversion = 0.1
luafile						= ""
obsurl						= ""
source_name   				= ""
list_all 					= "None"
p_settings 					= nil
active_color				= 0xFF0FF781
inactive_color				= 0xFF3838FF
active_text					= 0xFF0B0E10
inactive_text				= 0xFF0B0E10
source_id_whitelist			= {
	a = "wasapi_input_capture",
	b = "wasapi_output_capture",
	c = "dshow_input" -- Add ',' if this list continues
	--d = "browser_source",
	--e = "ffmpeg_source",
	--f = "monitor_capture",
	--g = "streamlink_source",
}
icon="data:image/png;base64,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"
desc	    				= [[
<hr/><center><h2>Audio Status Monitor</h2>(Version: %s)</center>
<br><center><img width=50 height=50 src=']] .. icon .. [['/></center>
<br><center><a href="https://github.com/midnight-studios/obs-lua/blob/main/]] .. luafile ..[[">Find it on GitHub</a></center>
<br><p>Select an Audio Source to minitor</p>
<p>Create a <b>New Scene</b> and add the following:
<ol>
<li><tt>`Colour Source`</tt></li>
<li><tt>`Text Source`</tt></li>
</ol></p>
<p>Add The New Scene to a new Source dock.</p>
<b>Dependencies</b>
<ol>
<li><a href="https://obsproject.com/forum/resources/source-dock.1317//">Source Dock</a></li><br></li>
</ol>

<p>Find help on the <a href="https://obsproject.com/forum/resources/]] .. obsurl ..[[">OBS Forum Thread</a>.</p>
<hr/>]]
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

--[[
----------------------------------------------------------
	set source visibility
----------------------------------------------------------
]]
function set_visible(target_name, visible)
	local scenes = obs.obs_frontend_get_scenes()
	if scenes ~= nil then
		for i, scn in ipairs(scenes) do	
			local scene = obs.obs_scene_from_source(scn)
			local sceneitem = obs.obs_scene_find_source_recursive(scene, target_name)
			if sceneitem ~= nil then
				obs.obs_sceneitem_set_visible(sceneitem, visible)
				break	
			end	
		end --end for		
	end
end
--[[
----------------------------------------------------------
----------------------------------------------------------
]]

--[[
----------------------------------------------------------
Callback on list modification
----------------------------------------------------------
]]
function property_event(props, property, settings)
	local monitor_scene = obs.obs_data_get_string(settings, "monitor_scene")
	local colour_source = obs.obs_properties_get(props, "colour_source")
	local text_source = obs.obs_properties_get(props, "text_source")
	if monitor_scene ~= "None" then
		local enumerated_text = false
		local enumerated_color = false
		obs.obs_property_list_clear(colour_source)
		obs.obs_property_list_clear(text_source)
		local source = obs.obs_get_source_by_name(monitor_scene)
		local scene = obs.obs_scene_from_source(source)
		local sceneitems = obs.obs_scene_enum_items(scene)
		if sceneitems ~= nil then
			for key_sceneitem, value_sceneitem in pairs(sceneitems) do
				local sceneitem_source = obs.obs_sceneitem_get_source(value_sceneitem)
				local group = obs.obs_group_from_source(sceneitem_source)
				local name = obs.obs_source_get_name(sceneitem_source)	
				local id = obs.obs_source_get_id(sceneitem_source)
				local display_name = obs.obs_source_get_display_name(id)
				if display_name == "Color Source" then
					enumerated_color = true
					obs.obs_property_list_add_string(colour_source, name, name)
				end
				if display_name == "Text (GDI+)" then
					enumerated_text = true
					obs.obs_property_list_add_string(text_source, name, name)
				end
				if group ~= nil then
					local groupitems = obs.obs_scene_enum_items(group)	
					if groupitems ~= nil then
						for key_groupitem, value_groupitem in pairs(groupitems) do
							local groupitemsource = obs.obs_sceneitem_get_source(value_groupitem)
							name = obs.obs_source_get_name(groupitemsource)	
							id = obs.obs_source_get_id(groupitemsource)
							display_name = obs.obs_source_get_display_name(id)		
							if display_name == "Color Source" then
								enumerated_color = true
								obs.obs_property_list_add_string(colour_source, name, name)
							end
							if display_name == "Text (GDI+)" then
								enumerated_text = true
								obs.obs_property_list_add_string(text_source, name, name)
							end
						end -- end for
						obs.sceneitem_list_release(groupitems)						
					end
					--obs.bfree(group)
				end
			end -- end for sceneitems
			obs.sceneitem_list_release(sceneitems)				
		end
		--obs.bfree(scene)
		obs.obs_source_release(source)
		
		if not enumerated_text then
			obs.obs_property_list_add_string(text_source, 'Nothing Available', 'none')
		end
		if not enumerated_color then
			obs.obs_property_list_add_string(colour_source, 'Nothing Available', 'none')
		end
		
	end
  -- IMPORTANT: returns true to trigger refresh of the properties
  return true
end

--[[
----------------------------------------------------------
----------------------------------------------------------
]]
function in_table(tbl, value)
	local found = false
	for k, v in pairs(tbl) do
		if value == v then
			found = true
			break
		end	
	end
	return found
end
--[[
----------------------------------------------------------
----------------------------------------------------------
]]
function script_properties()
	local list = {}
	local props = obs.obs_properties_create()
	local sources = obs.obs_enum_sources()
	local p_a = obs.obs_properties_add_list(props, "monitor_source", "<i>Monitor Source</i>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING)
	t_type = {"None"}
	obs.obs_property_set_long_description(p_a, "\nThe actual Audio Source to watch\n")
	for i,v in ipairs(t_type) do obs.obs_property_list_add_string(p_a, v, v) end
	local list = {}
	if sources ~= nil then
		for _, source in pairs(sources) do
			local name = obs.obs_source_get_name(source)
			source_id = obs.obs_source_get_unversioned_id(source)
			if in_table(source_id_whitelist, source_id) then
				obs.obs_property_list_add_string(p_a, name, name)
			end	
		end	
	end	
	-- Monitor Scene
	local p_b = obs.obs_properties_add_list(props, "monitor_scene", "<i>Status Scene</i>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING)
	t_type = {"None"}
	obs.obs_property_set_long_description(p_b, "\nThe scene with sources to give feedback.\n")
	for i,v in ipairs(t_type) do obs.obs_property_list_add_string(p_b, v, v) end
	local scenes = obs.obs_frontend_get_scene_names()
	if scenes ~= nil then
		for i, scene in ipairs(scenes) do
			obs.obs_property_list_add_string(p_b, scene, scene)
		end
	obs.bfree(scene)
	end
	local p_c = obs.obs_properties_add_list(props, "colour_source", "<i>Colour Source</i>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING)
	t_type = {"None"}
	for i,v in ipairs(t_type) do obs.obs_property_list_add_string(p_c, v, v) end
	local p_d = obs.obs_properties_add_list(props, "text_source", "<i>Text Source</i>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING)
	t_type = {"None"}
	for i,v in ipairs(t_type) do obs.obs_property_list_add_string(p_d, v, v) end
	obs.obs_properties_add_color_alpha(props, "active_color", "<font color=#c8ffb7>On Air Background</font>")
	obs.obs_properties_add_color_alpha(props, "inactive_color", "<font color=#ffb7b7>Stand-By Background</font>")
	obs.obs_properties_add_color_alpha(props, "active_text", "<font color=#c8ffb7>On Air Font</font>")
	obs.obs_properties_add_color_alpha(props, "inactive_text", "<font color=#ffb7b7>Stand-By Font</font>")
	obs.source_list_release(sources)
	local p_g = obs.obs_properties_add_text(props, "unmuted_color", "<font color=#c8ffb7>On Air Text</font>", obs.OBS_TEXT_DEFAULT)
	obs.obs_property_set_long_description(p_g, "\nThe text updated in the text layer\n")
	local p_h = obs.obs_properties_add_text(props, "muted_color", "<font color=#ffb7b7>Stand-By Text</font>", obs.OBS_TEXT_DEFAULT)
	obs.obs_property_set_long_description(p_h, "\nThe text updated in the text layer\n")
    local p_i = obs.obs_properties_add_bool(props, "include_name", "Include Source Name")
	obs.obs_property_set_long_description(p_i, "\nInclude in the text updated in the text layer\n")
    obs.obs_properties_add_bool(props, "disable_script", "Disable Script")
  	obs.obs_property_set_modified_callback(p_b, property_event)
	-- Calls the callback once to set-up current visibility
  	obs.obs_properties_apply_settings(props, p_settings)
	return props
end
--[[
----------------------------------------------------------
----------------------------------------------------------
]]
function script_update(settings)
    --goto = obs.obs_data_get_bool(settings,"goto")
	set_text_bounds(settings)
	connect_signal(settings)
	-- Keep track of current settings
  	p_settings = settings 
end
--[[
----------------------------------------------------------
A function named script_defaults will be called to set the default settings
----------------------------------------------------------
]]
function script_defaults(settings)
	--obs.obs_data_set_default_bool(settings, "goto", false)
	obs.obs_data_set_default_string(settings, "monitor_scene", "None")
	obs.obs_data_set_default_string(settings, "colour_source", "None")
	obs.obs_data_set_default_string(settings, "text_source", "None")
	obs.obs_data_set_default_string(settings, "unmuted_color", "On Air")
	obs.obs_data_set_default_string(settings, "muted_color", "Stand-By")
	obs.obs_data_set_default_int(settings, "active_color", active_color)
	obs.obs_data_set_default_int(settings, "inactive_color", inactive_color)
	obs.obs_data_set_default_int(settings, "active_text", active_text)
	obs.obs_data_set_default_int(settings, "inactive_text", inactive_text)
	obs.obs_data_set_default_bool(settings, "include_name", false)
	obs.obs_data_set_default_bool(settings, "disable_script", false)
end

--[[
----------------------------------------------------------
	Called when a source is activated/deactivated
----------------------------------------------------------
]]
function source_mute(cd)
	if obs.obs_data_get_bool(p_settings, "disable_script") then
		return
	end 
	local source = obs.calldata_source(cd, "source")
	if source ~= nil then
		local name = obs.obs_source_get_name(source)
		if (name == monitor_source) then
			muted = obs.obs_source_muted(source)
			local color, text = nil, nil
			if muted then
				color_background = obs.obs_data_get_int(p_settings, "inactive_color")
				color_text = obs.obs_data_get_int(p_settings, "inactive_text")
				text = obs.obs_data_get_string(p_settings, "muted_color")
			else
				color_background = obs.obs_data_get_int(p_settings, "active_color")
				color_text = obs.obs_data_get_int(p_settings, "active_text")
				text = obs.obs_data_get_string(p_settings, "unmuted_color")
			end	
			if obs.obs_data_get_bool(p_settings, "include_name") then
				text = name .. ' ' .. text .. ' '
			end 
				colour_source = obs.obs_data_get_string(p_settings, "colour_source")
				text_source = obs.obs_data_get_string(p_settings, "text_source")
				set_visible(colour_source, true)
				set_visible(text_source, true)
			source = obs.obs_get_source_by_name(colour_source)
			if source ~= nil then
				local source_settings = obs.obs_source_get_settings(source)
				obs.obs_data_set_int(source_settings, "color", color_background)
				obs.obs_source_update(source, source_settings)
				obs.obs_data_release(source_settings)
				obs.obs_source_release(source)
			end	
			source = obs.obs_get_source_by_name(text_source)
			if source ~= nil then
				local source_settings = obs.obs_source_get_settings(source)
				obs.obs_data_set_string(source_settings, "text", text)
				obs.obs_data_set_int(source_settings, "color", color_text)
				obs.obs_source_update(source, source_settings)
				obs.obs_data_release(source_settings)
				
				obs.obs_source_release(source)
			end
		end
	end
end

--[[
----------------------------------------------------------
----------------------------------------------------------
]]
function connect_signal(settings)
	monitor_source = obs.obs_data_get_string(settings, "monitor_source")
	local source = obs.obs_get_source_by_name(monitor_source)
	if source ~= nil then
		local sh = obs.obs_source_get_signal_handler(source)
		obs.signal_handler_connect(sh, "mute", source_mute)
	end
end

--[[
----------------------------------------------------------
----------------------------------------------------------
]]
function set_color_bounds(settings)
	monitor_scene = obs.obs_data_get_string(settings, "monitor_scene")
	source = obs.obs_get_source_by_name(monitor_scene)
	if source ~= nil then
		scene_width = obs.obs_source_get_width(source)
		scene_height = obs.obs_source_get_height(source)
		obs.obs_source_release(source)
		text_source = obs.obs_data_get_string(settings, "colour_source")
		source = obs.obs_get_source_by_name(text_source)
		if source ~= nil then
			local source_settings = obs.obs_source_get_settings(source)
			obs.obs_data_set_int(source_settings, "width", scene_width)
			obs.obs_data_set_int(source_settings, "height", scene_height)
			obs.obs_source_update(source, source_settings)
			obs.obs_data_release(source_settings)
		end
	end
end

--[[
----------------------------------------------------------
----------------------------------------------------------
]]
function set_text_bounds(settings)
	monitor_scene = obs.obs_data_get_string(settings, "monitor_scene")
	source = obs.obs_get_source_by_name(monitor_scene)
	if source ~= nil then
		scene_width = obs.obs_source_get_width(source)
		scene_height = obs.obs_source_get_height(source)
		obs.obs_source_release(source)
		text_source = obs.obs_data_get_string(settings, "text_source")
		source = obs.obs_get_source_by_name(text_source)
		if source ~= nil then
			local source_settings = obs.obs_source_get_settings(source)
			obs.obs_data_set_int(source_settings, "extents_cx", scene_width)
			obs.obs_data_set_int(source_settings, "extents_cy", scene_height)
			obs.obs_data_set_bool(source_settings, "extents", true)
			obs.obs_data_set_bool(source_settings, "extents_wrap", true)
			obs.obs_data_set_bool(source_settings, "antialiasing", true)
			obs.obs_data_set_string(source_settings, "align", "center")
			obs.obs_data_set_string(source_settings, "valign", "center")
			obs.obs_source_update(source, source_settings)
			obs.obs_data_release(source_settings)
		end
	end
end	
--[[
----------------------------------------------------------
	a function named script_load will be called on startup	
	Connect hotkey and activation/deactivation signal callbacks
	--
	NOTE: These particular script callbacks do not necessarily have to
	be disconnected, as callbacks will automatically destroy themselves
	if the script is unloaded.  So there's no real need to manually
	disconnect callbacks that are intended to last until the script is
	unloaded.
----------------------------------------------------------
]]
function script_load(settings)
connect_signal(settings)
set_text_bounds(settings)
set_color_bounds(settings)
end