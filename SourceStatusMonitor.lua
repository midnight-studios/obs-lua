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
gversion = 0.2
luafileTitle				= "Source Status Monitor"
luafile						= "SourceStatusMonitor.lua"
obsurl						= "audio-status-monitor.1381/"
p_settings 					= nil
active_color				= 0xFF0FF781
inactive_color				= 0xFF3838FF
active_font					= 0xFF0B0E10
inactive_font				= 0xFF0B0E10
mode          				= ""
monitor_state          		= false
--  global context information
props = nil -- property
props_mode = nil -- property
props_monitor = nil -- property
props_scene = nil -- property
props_color = nil -- property
props_text = nil -- property
-- Add ',' if this list continues
source_id_whitelist			= {
	a = "wasapi_input_capture",
	b = "wasapi_output_capture",
	c = "dshow_input",
	d = "browser_source"
	--e = "ffmpeg_source",
	--f = "monitor_capture",
	--g = "streamlink_source",
}
icon="data:image/png;base64,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"
desc	    				= [[
<hr/><center><h2>]] .. luafileTitle ..[[</h2>(Version: %s)</center>
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
<p><hr/></p>]]
--[[
--------------------------------------------------------------------
 custom function:helper
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
--------------------------------------------------------------------
script_description()
--------------------------------------------------------------------
 this let OBS know this is a script
--------------------------------------------------------------------
]]
function script_description()
	return string.format(desc, tostring(gversion))
end

--[[
--------------------------------------------------------------------
 custom function:helper
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
--------------------------------------------------------------------
 custom function: helper
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
--------------------------------------------------------------------
 custom function
----------------------------------------------------------
]]
function set_color_bounds(settings)
	monitor_scene = obs.obs_data_get_string(settings, "monitor_scene")
	source = obs.obs_get_source_by_name(monitor_scene)
	if source ~= nil then
		scene_width = obs.obs_source_get_width(source)
		scene_height = obs.obs_source_get_height(source)
		obs.obs_source_release(source)
		text_source = obs.obs_data_get_string(settings, "color_source")
		source = obs.obs_get_source_by_name(text_source)
		if source ~= nil then
			local source_settings = obs.obs_source_get_settings(source)
			obs.obs_data_set_int(source_settings, "width", scene_width)
			obs.obs_data_set_int(source_settings, "height", scene_height)
		end
			obs.obs_source_update(source, source_settings)
			obs.obs_data_release(source_settings)
	end
end

--[[
--------------------------------------------------------------------
 custom function
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
		end
		obs.obs_data_release(source_settings)
		obs.obs_source_release(source)
	end
end	

--[[
--------------------------------------------------------------------
 custom function
	Update Source
--------------------------------------------------------------------
]]
function source_settings_update()	
	if obs.obs_data_get_bool( p_settings, "disable_script" ) then
		return
	end 
		local color, text = nil, nil
			if monitor_state then
				color_background = obs.obs_data_get_int(p_settings, "active_color")
				color_text = obs.obs_data_get_int(p_settings, "active_font")
				text = obs.obs_data_get_string(p_settings, "active_text")
			else
				color_background = obs.obs_data_get_int(p_settings, "inactive_color")
				color_text = obs.obs_data_get_int(p_settings, "inactive_font")
				text = obs.obs_data_get_string(p_settings, "inactive_text")
			end	
			if obs.obs_data_get_bool(p_settings, "include_name") then
				text = name .. ' ' .. text .. ' '
			end 
				color_source = obs.obs_data_get_string(p_settings, "color_source")
				text_source = obs.obs_data_get_string(p_settings, "text_source")
				set_visible(color_source, true)
				set_visible(text_source, true)
				source = obs.obs_get_source_by_name(color_source)
			if source ~= nil then
				local source_settings = obs.obs_source_get_settings(source)
				obs.obs_data_set_int(source_settings, "color", color_background)
				obs.obs_source_update(source, source_settings)
			end	
				obs.obs_data_release(source_settings)
				obs.obs_source_release(source)
				source = obs.obs_get_source_by_name(text_source)
			if source ~= nil then
				local source_settings = obs.obs_source_get_settings(source)
				obs.obs_data_set_string(source_settings, "text", text)
				obs.obs_data_set_int(source_settings, "color", color_text)
				obs.obs_source_update(source, source_settings)
			end
				obs.obs_data_release(source_settings)
				obs.obs_source_release(source)	
end	
--[[
--------------------------------------------------------------------
 custom function
	Called when a source is activated/deactivated
--------------------------------------------------------------------
]]
function source_mute( cd )
	if obs.obs_data_get_bool( p_settings, "disable_script" ) then
		return
	end 
	local source = obs.calldata_source( cd, "source" )
	if source ~= nil then
		local name = obs.obs_source_get_name(source)
		if (name == monitor_source) then
			if mode ~= "Streaming" and mode ~= "Recording" then
				monitor_state = not obs.obs_source_muted(source)
			end
		end
	end
	source_settings_update()
end
--[[
--------------------------------------------------------------------

--------------------------------------------------------------------

--------------------------------------------------------------------
]]
function scene_items_by_scene_name(scene_name, disp_name, prop_ref)
		
	local enumerated = false
		--[[
			'source' selected to provide monitor information
		]]			
		local source = obs.obs_get_source_by_name( scene_name )
		--[[
			'source' selected to provide monitor information
		]]
		if source ~= nil then
			local scene = obs.obs_scene_from_source( source )
			local sceneitems = obs.obs_scene_enum_items( scene )
			--[[
				selected 'scene' has scene items
			]]			
			if sceneitems ~= nil then

				--[[
					cycle through scene items 
				]]	
				for key_sceneitem, value_sceneitem in pairs( sceneitems ) do
					--[[
						get source for current scene item
					]]					
					local sceneitem_source = obs.obs_sceneitem_get_source( value_sceneitem )
					--[[
						check if 'source' is 'group'
					]]	
					local group = obs.obs_group_from_source( sceneitem_source )

					--[[
						get 'source' name, id and display name
					]]					
					local name 				= obs.obs_source_get_name( sceneitem_source )	
					local id 				= obs.obs_source_get_id( sceneitem_source )
					local display_name 		= obs.obs_source_get_display_name( id )

					--[[
						if we find the source we want
						add it to the list
						match it with 'display name'
						TODO> instead of checking this one by one, lets perhaps use a json object 
					]]				
					if display_name == disp_name then
						enumerated = true
						obs.obs_property_list_add_string( prop_ref, name, name )
					end

					--[[
						if 'source' is 'group', lets check the group items
					]]				
					if group ~= nil then

						--[[
							load 'group' items
						]]		
						local groupitems = obs.obs_scene_enum_items( group )

						--[[
							does 'group' have items?
						]]	
						if groupitems ~= nil then

							--[[
								cycle through group items 
							]]
							for key_groupitem, value_groupitem in pairs( groupitems ) do

								--[[
									get source for the current group item
								]]	
								local groupitemsource = obs.obs_sceneitem_get_source( value_groupitem )		

								--[[
									get 'source' name, id and display name
								]]
								name 			= obs.obs_source_get_name( groupitemsource )	
								id 				= obs.obs_source_get_id( groupitemsource )
								display_name 	= obs.obs_source_get_display_name( id )	

								--[[
									if we find the source we want
									add it to the list
									match it with 'display name'
									TODO> instead of checking this one by one, lets perhaps use a json object 
								]]	
								if display_name == disp_name then
									enumerated = true
									obs.obs_property_list_add_string( prop_ref, name, name )
								end
							end -- end for
							obs.sceneitem_list_release( groupitems ) -- release the reference of scene item list for groups				
						end
						--obs.bfree(group)
					end
				end -- end for sceneitems
				obs.sceneitem_list_release( sceneitems ) -- release the reference of scene items					
			end
		else -- source == nil
		end --  source ~= nil
		--obs.bfree(scene)
		obs.obs_source_release( source ) -- release reference to source [scene_name]
	
	return enumerated
end	
--[[
--------------------------------------------------------------------

--------------------------------------------------------------------

--------------------------------------------------------------------
]]
function mode_item_set_status()
	--[[
		get mode for Monitor Type
		use this here to determine visibility 
		for property list item
	]]	
	mode = obs.obs_data_get_string( p_settings, "mode" )
	if mode == 'Audio' then
		monitor_source = obs.obs_data_get_string( p_settings, "monitor_source" )
		source = obs.obs_get_source_by_name(monitor_source)
		if source ~= nil then
			monitor_state = not obs.obs_source_muted(source)
		end
		obs.obs_source_release(source)
	end
	--"Recording", "Streaming", "Media"
	if mode == "Recording" then
		monitor_state = obs.obs_frontend_recording_active()
	end
	if mode == "Streaming" then
		monitor_state = obs.obs_frontend_streaming_active()
	end
	
end	
--[[
--------------------------------------------------------------------

--------------------------------------------------------------------

--------------------------------------------------------------------
]]
function update_properties_list_items(ref)
	
	if ref == "monitor_source" then
		obs.obs_property_list_clear( props_monitor )
		t_type = {"None"}
		for i,v in ipairs( t_type) do obs.obs_property_list_add_string( props_monitor, v, v ) end
		--[[
			build list
			add to property
		]] 	
		local sources = obs.obs_enum_sources()
		if sources ~= nil then
			for _, source in pairs( sources ) do
				local name = obs.obs_source_get_name( source )
				source_id = obs.obs_source_get_unversioned_id( source )
				if in_table( source_id_whitelist, source_id ) then
					obs.obs_property_list_add_string( props_monitor, name, name )
				end	
			end	
		end	
		obs.source_list_release( sources ) -- releases the references of source list		
	end
	if ref == "monitor_scene" then
		obs.obs_property_list_clear( props_scene )
		t_type = {"None"}
		for i,v in ipairs( t_type ) do obs.obs_property_list_add_string( props_scene, v, v ) end
		--[[
			build list
			add to property
		]] 	
		local scenes = obs.obs_frontend_get_scene_names()
		if scenes ~= nil then
			for i, scene in ipairs( scenes ) do
				obs.obs_property_list_add_string( props_scene, scene, scene )
			end
		obs.bfree( scene )
		end
	end
	
	if ref == "" then
		
	end	
	
  -- IMPORTANT: returns true to trigger refresh of the properties
  return true
end
--[[
----------------------------------------------------------
Callback on property modification
----------------------------------------------------------
]]
function property_onchange( props, property, settings )
	
	--[[
		get mode for Monitor Type
		use this here to determine visibility 
		for property list item
	]]	
	mode = obs.obs_data_get_string( settings, "mode" )
	
		prop_names = {
			"monitor_source",
			"monitor_scene",
			"color_source",
			"text_source",
			"active_color",
			"inactive_color", 
			"active_font", 
			"inactive_font",
			"active_text", 
			"inactive_text",
			"include_name",
		}
	
	if mode ~= "select" then
		for i,v in ipairs( prop_names ) do obs.obs_property_set_visible(obs.obs_properties_get( props, v ), true ) end
	else
		for i,v in ipairs( prop_names ) do obs.obs_property_set_visible(obs.obs_properties_get( props, v ), false ) end
		return true
	end

	mode_item_set_status()
	source_settings_update()
	
	--[[
		define list that will show a property list item
		if 'mode' is not in this list it will set visible to false
	]]
	local monitor_source_list = {
		a = "Audio",
		b = "Media"	
	}
	--[[
		set visibility for property list item
	]]	
	obs.obs_property_set_visible(obs.obs_properties_get( props, "monitor_source" ), in_table( monitor_source_list, mode ) )
	
	--local mode_whitelist = {
	--	a = "Color Source",
	--	b = "Text (GDI+)"
	--	
	--}	

	--[[
		get the value in property list item
	]]		
	local monitor_scene = obs.obs_data_get_string( settings, "monitor_scene" )
		--[[
		get the value in property list item
	]]
	local color_source = obs.obs_properties_get( props, "color_source" )
		--[[
		get the value in property list item
	]]
	local text_source = obs.obs_properties_get( props, "text_source" )
		--[[
		if a 'scene' was defined to provide monitor information
	]]
	if monitor_scene ~= "None" then
		
		--[[
			clear property list item, rebuild from fresh
		]]		
		obs.obs_property_list_clear( color_source )
		obs.obs_property_list_clear( text_source )
				
		--[[
			nothing available for the list, instead of leaving it empty,
			display a messasge to the user
		]]		
		if not scene_items_by_scene_name(monitor_scene, "Text (GDI+)", text_source) then
			obs.obs_property_list_add_string( text_source, 'Nothing Available', 'none' )
		end
		if not scene_items_by_scene_name(monitor_scene, "Color Source", color_source) then
			obs.obs_property_list_add_string( color_source, 'Nothing Available', 'none' )
		end
	end
  -- IMPORTANT: returns true to trigger refresh of the properties
  return true
end

--[[
--------------------------------------------------------------------
script_properties()
--------------------------------------------------------------------
Called to define user properties associated with the script. 
These properties are used to define how to show settings 
properties to a user.

Returns: 
obs_properties_t object created via obs_properties_create().
--------------------------------------------------------------------
]]
function script_properties()

	
    --  create new properties
	props = obs.obs_properties_create()
	local sources = obs.obs_enum_sources()
	
	--[[
		new property item: list
		Monitor Scene
	]] 
	
	
	props_mode = obs.obs_properties_add_list( props, "mode", "<i>Monitor Mode</i>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING )
	t_type = {"Audio", "Recording", "Streaming", "Media", "Capture Device"}
	obs.obs_property_list_add_string(props_mode, "Select", "select")
	obs.obs_property_set_long_description( props_mode, "\nWhat do you wish to monitor?\n" )
	for i,v in ipairs( t_type ) do obs.obs_property_list_add_string( props_mode, v, v ) end
	
	--[[
		new property item: list
		What do you want to monitor?
		if not a source, then hide this list
	]] 
	props_monitor = obs.obs_properties_add_list( props, "monitor_source", "<i>Monitor Source</i>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING )
	obs.obs_property_set_long_description( props_monitor, "\nThe actual Audio Source to watch\n" )
	
	--[[
		build list
		add to property
	]] 	
	update_properties_list_items("monitor_source")	

	--[[
		new property item: list
		This is where we create the feedback
		Monitor Scene
	]]
	props_scene = obs.obs_properties_add_list( props, "monitor_scene", "<i>Status Scene</i>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING )
	obs.obs_property_set_long_description( props_scene, "\nThe scene with sources to give feedback.\n" )
	
	update_properties_list_items("monitor_scene")	
	
	--[[
		new property item: list
	]] 	
	props_color = obs.obs_properties_add_list( props, "color_source", "<i>Colour Source</i>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING )
	t_type = {"None"}
	for i,v in ipairs( t_type) do obs.obs_property_list_add_string(props_color, v, v ) end
	
	--[[
		new property item: list
	]] 
	props_text = obs.obs_properties_add_list( props, "text_source", "<i>Text Source</i>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING )
	t_type = {"None"}
	for i,v in ipairs( t_type ) do obs.obs_property_list_add_string( props_text, v, v ) end
	
	--[[
		new property item: color
	]] 	
	obs.obs_properties_add_color_alpha( props, "active_color", "<font color=#c8ffb7>On Air Background</font>" )
	--[[
		new property item: color
	]] 	
	obs.obs_properties_add_color_alpha( props, "inactive_color", "<font color=#ffb7b7>Stand-By Background</font>" )
	--[[
		new property item: color
	]] 	
	obs.obs_properties_add_color_alpha( props, "active_font", "<font color=#c8ffb7>On Air Font</font>" )
	--[[
		new property item: color
	]] 	
	obs.obs_properties_add_color_alpha( props, "inactive_font", "<font color=#ffb7b7>Stand-By Font</font>" )
	--[[
		new property item: color
	]] 	
	obs.source_list_release( sources ) -- releases the references of source list
	
	--[[
		new property item: text
	]] 
	local p_e = obs.obs_properties_add_text( props, "active_text", "<font color=#c8ffb7>On Air Text</font>", obs.OBS_TEXT_DEFAULT )
	obs.obs_property_set_long_description( p_e, "\nThe text updated in the text layer\n" )
	
	--[[
		new property item: text
	]] 
	local p_f = obs.obs_properties_add_text( props, "inactive_text", "<font color=#ffb7b7>Stand-By Text</font>", obs.OBS_TEXT_DEFAULT )
	obs.obs_property_set_long_description( p_f, "\nThe text updated in the text layer\n" )
	--[[
		new property item: text
	]] 
    local p_g = obs.obs_properties_add_bool( props, "include_name", "Include Source Name" )
	obs.obs_property_set_long_description( p_g, "\nInclude in the text updated in the text layer\n" )
	
	--[[
		new property item: bool
	]] 
    obs.obs_properties_add_bool( props, "disable_script", "Disable Script" )
  	
	
    --  create clone button
    obs.obs_properties_add_button(props, "refresh_settings", "Refresh Settings", refresh_settings)
	--[[
		OnChange Events
	]]	
	obs.obs_property_set_modified_callback( props_mode, property_onchange )
  	obs.obs_property_set_modified_callback( props_scene, property_onchange )

	--[[
		Calls the callback once to set-up current visibility
	]]	
  	obs.obs_properties_apply_settings( props, p_settings )
	
	--[[
		End of function
		return
	]]	
	return props
end


--[[
--------------------------------------------------------------------

--------------------------------------------------------------------

--------------------------------------------------------------------
]]

function scene_item_updated( cd )
	
			--[[
		get the value in property list item
	]]
	local color_source = obs.obs_properties_get( props, "color_source" )
		--[[
		get the value in property list item
	]]
	local text_source = obs.obs_properties_get( props, "text_source" )
	
		--[[
			clear property list item, rebuild from fresh
		]]		
		obs.obs_property_list_clear( color_source )
		obs.obs_property_list_clear( text_source )
	
		if not scene_items_by_scene_name(monitor_scene, "Text (GDI+)", text_source) then
			obs.obs_property_list_add_string( text_source, 'Nothing Available', 'none' )
		end
		if not scene_items_by_scene_name(monitor_scene, "Color Source", color_source) then
			obs.obs_property_list_add_string( color_source, 'Nothing Available', 'none' )
		end
  -- IMPORTANT: returns true to trigger refresh of the properties
  return true
end

--[[
--------------------------------------------------------------------

--------------------------------------------------------------------

--------------------------------------------------------------------
]]
function connect_scene_signal()
	source = obs.obs_frontend_get_current_scene()
    sh = obs.obs_source_get_signal_handler(source)
    obs.signal_handler_connect(sh, "item_add", scene_item_updated)
    obs.signal_handler_connect(sh, "item_remove", scene_item_updated)
    obs.obs_source_release(source)
end	
--[[
--------------------------------------------------------------------

--------------------------------------------------------------------

--------------------------------------------------------------------
]]
function refresh_settings()
  -- IMPORTANT: returns true to trigger refresh of the properties
  return true
end	
--[[
--------------------------------------------------------------------
script_update(settings)
--------------------------------------------------------------------
Called when the script’s settings (if any) have been changed by the 
user.

Parameters:
settings – Settings associated with the script.
--------------------------------------------------------------------
]]
function script_update( settings )
	--[[
		Update Global
	]]	
	mode = obs.obs_data_get_string( settings, "mode" )
	--[[
		set some things
	]]
	set_text_bounds( settings )
	set_color_bounds( settings )
	--[[
		connect handler to source
	]]
	connect_source_signal()
	--[[
		check mode and relevant state and set variant accordingly
	]]
	mode_item_set_status()
	--[[
		make sure the source is updated with the most recent changes
	]]
	source_settings_update()
	
	-- Keep track of current settings
  	p_settings = settings 
end

--[[
--------------------------------------------------------------------
script_defaults(settings)
--------------------------------------------------------------------
Called to set default settings (if any) associated with the script. 
You would typically call Default Value Functions for the on the 
settings in order to set its default values.

Parameters
settings – Settings associated with the script.
--------------------------------------------------------------------
]]
function script_defaults( settings )
	obs.obs_data_set_default_string( settings, "mode", "Select" )
	obs.obs_data_set_default_string( settings, "monitor_scene", "None" )
	obs.obs_data_set_default_string( settings, "color_source", "None" )
	obs.obs_data_set_default_string( settings, "text_source", "None" )
	obs.obs_data_set_default_string( settings, "active_text", "On Air" )
	obs.obs_data_set_default_string( settings, "inactive_text", "Stand-By" )
	obs.obs_data_set_default_int( settings, "active_color", active_color )
	obs.obs_data_set_default_int( settings, "inactive_color", inactive_color )
	obs.obs_data_set_default_int( settings, "active_font", active_font )
	obs.obs_data_set_default_int( settings, "inactive_font", inactive_font )
	obs.obs_data_set_default_bool( settings, "include_name", false )
	obs.obs_data_set_default_bool( settings, "disable_script", false )
end

--[[
--------------------------------------------------------------------
script_load(settings)
--------------------------------------------------------------------
Called on script startup with specific settings associated with the
script. 

The settings parameter provided is not typically used for settings 
that are set by the user; instead the parameter is used for any 
extra internal settings data that may be used in the script.

Parameters:
settings – Settings associated with the script.
--------------------------------------------------------------------
]]
function script_load( settings )	
	local sh = obs.obs_get_signal_handler()
	obs.signal_handler_connect( sh, "source_load", source_load )
	obs.obs_frontend_add_event_callback( on_event )
end
--[[
--------------------------------------------------------------------
script_unload()
--------------------------------------------------------------------
Called when the script is being unloaded.
--------------------------------------------------------------------
]]
function script_unload()
	-- not in use by this script
end
--[[
--------------------------------------------------------------------
 custom function

	we use this to get a signal handler for a specific source once
	it is loaded
--------------------------------------------------------------------
]]
function source_load( cd )
	monitor_source = obs.obs_data_get_string( p_settings, "monitor_source" )
	local source = obs.calldata_source( cd, "source" )
	if source ~= nil then
		local name = obs.obs_source_get_name( source )
		if ( name == monitor_source ) then
			local sh = obs.obs_source_get_signal_handler( source )
			obs.signal_handler_connect( sh, "mute", source_mute )			
		end	
	end
end

--[[
--------------------------------------------------------------------
 custom function

	
--------------------------------------------------------------------
]]
function connect_source_signal()
	if mode == "Streaming" or mode == "Recording" then
		return
	end
	monitor_source = obs.obs_data_get_string( p_settings, "monitor_source" )
	source = obs.obs_get_source_by_name(monitor_source)
	if source ~= nil then
		monitor_state = not obs.obs_source_muted(source)
		local sh = obs.obs_source_get_signal_handler( source )
		obs.signal_handler_connect( sh, "mute", source_mute )
	end
	obs.obs_source_release(source)	
end	
--[[
--------------------------------------------------------------------
 custom function

	Adds a callback that will be called when a frontend event occurs.
	https://obsproject.com/docs/reference-frontend-api.html?highlight=record

	RECORDING / STREAMING

	OBS_FRONTEND_EVENT_RECORDING_STARTED
	OBS_FRONTEND_EVENT_RECORDING_STOPPING
	OBS_FRONTEND_EVENT_RECORDING_STOPPED

	obslua.obs_frontend_add_event_callback(callback, private_data)

	function obslua.obs_frontend_remove_event_callback(callback, private_data)
	obs.remove_current_callback()
--------------------------------------------------------------------
]]
function on_event(event)
	if event == obs.OBS_FRONTEND_EVENT_STREAMING_STARTED then
		if mode == "Streaming" then
			monitor_state = true
			source_settings_update()
		end
	elseif event == obs.OBS_FRONTEND_EVENT_STREAMING_STOPPED then
		if mode == "Streaming" then
			monitor_state = false
			source_settings_update()
		end
	elseif event == obs.OBS_FRONTEND_EVENT_RECORDING_STARTED then
		if mode == "Recording" then
			monitor_state = true
			source_settings_update()
		end
	elseif event == obs.OBS_FRONTEND_EVENT_RECORDING_PAUSED then
		if mode == "Recording" then
			monitor_state = false
			source_settings_update()
		end
	elseif event == obs.OBS_FRONTEND_EVENT_RECORDING_UNPAUSED then
		if mode == "Recording" then
			monitor_state = true
			source_settings_update()	
		end
	elseif event == obs.OBS_FRONTEND_EVENT_RECORDING_STOPPED then
		if mode == "Recording" then
			monitor_state = false
			source_settings_update()
		end
	elseif event == obs.OBS_FRONTEND_EVENT_SCENE_LIST_CHANGED then
            --  update our source scene list
		--print("OBS_FRONTEND_EVENT_SCENE_LIST_CHANGED")
		update_properties_list_items("monitor_scene")
		
	elseif event == obs.OBS_FRONTEND_EVENT_SCENE_CHANGED then
            --  update our source scene list
		--print("OBS_FRONTEND_EVENT_SCENE_CHANGED")
		connect_scene_signal()
	end
end