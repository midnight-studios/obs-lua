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
gversion 					= 0.7
luafileTitle				= "Source Status Monitor"
luafile						= "SourceStatusMonitor.lua"
obsurl						= "audio-status-monitor.1381/"
script_settings 					= nil
active_color				= 0xFF0FF781
inactive_color				= 0xFF3838FF
active_font					= 0xFF0B0E10
inactive_font				= 0xFF0B0E10
mode          				= ""
monitor_state          		= false
--  global context information
props 						= nil -- property
props_mode 					= nil -- property
props_monitor 				= nil -- property
props_scene 				= nil -- property
props_color 				= nil -- property
props_text 					= nil -- property
-- Add ',' if this list continues
source_id_whitelist			= {}
icon="data:image/png;base64,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"
desc	    				= [[
<hr/><center><h2>]] .. luafileTitle ..[[</h2>(Version: %s)</center>
<br><center><img width=50 height=50 src=']] .. icon .. [['/></center>
<br><center><a href="https://github.com/midnight-studios/obs-lua/blob/main/]] .. luafile ..[[">Find it on GitHub</a></center>
<br><p>Select an Item to minitor</p>
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
local function log( name, msg )
  if msg ~= nil then
    msg = " > " .. tostring( msg )
  else
    msg = ""
  end
  obs.script_log( obs.LOG_DEBUG, name .. msg )
end

--[[
--------------------------------------------------------------------
script_description()
--------------------------------------------------------------------
 this let OBS know this is a script
--------------------------------------------------------------------
]]
function script_description()
	return string.format( desc, tostring( gversion ) )
end

--[[
--------------------------------------------------------------------
 custom function:helper
	set source visibility
----------------------------------------------------------
]]
function set_visible( target_name, visible )
	--[[
		Get Scene list, check scene items recursively for a match
		
		Documentation suggets to release with 'obs_frontend_source_list_free', 
		but it does not work here, instead release with 'source_list_release'
	]]
	local scenes = obs.obs_frontend_get_scenes() -- incremented scenes. Release with source_list_release
	--[[
		Found Scene Sources (Scenes)
	]]
	if scenes ~= nil then
	--[[
		Check scene source one by one
	]]		
		for _, scn in ipairs(scenes) do	
			--[[
				get scene from source so that we can look at scene items
			]]		
			local scene = obs.obs_scene_from_source( scn ) -- Does not increase the reference
			--[[
				Check recursively to include any groups in scenes
			]]				
			local sceneitem = obs.obs_scene_find_source_recursive( scene, target_name )
			--[[
				Found what we are looking for:
			]]			
			if sceneitem ~= nil then
				--[[
					Set item visibility
				]]	
				obs.obs_sceneitem_set_visible( sceneitem, visible )
				--[[
					we found the target, break out the loop
				]]					
				break	
			end	
		end --end for
		--[[
			Frees allocated memory 
		]]			
		obs.bfree( scn )
		--[[
			Documentation suggets to release with 'obs_frontend_source_list_free', 
			but it does not work here, instead release with 'source_list_release'
		]]		
		obs.source_list_release( scenes )
	end
end

--[[
--------------------------------------------------------------------
 custom function: helper
--------------------------------------------------------------------
Check if a value exist in table
returns: boolean (bool)
--------------------------------------------------------------------
]]
function in_table( tbl, value )
	local found = false
	for k, v in pairs( tbl ) do
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
--------------------------------------------------------------------
Sets Scene Item Settings for the Status Source
--------------------------------------------------------------------
]]
function set_color_bounds( settings )
	--[[
		Monitor scene is where status results are sent
	]]	
	monitor_scene = obs.obs_data_get_string( settings, "monitor_scene" )
	--[[
		Get Source for Monitor scene.
	
		We want the Video Frame Size: Width and Height
		to set the child elements (Scene Items) to match.
	]]		
	source = obs.obs_get_source_by_name( monitor_scene ) -- Increments the source reference counter, use obs_source_release() to release it when complete.
	--[[
		Found Source:
	]]		
	if source ~= nil then
		--[[
			Fetch parent current Settings: Width
		]]	
		scene_width = obs.obs_source_get_width( source )
		--[[
			Fetch parent current Settings: Height
		]]
		scene_height = obs.obs_source_get_height( source )
		--[[
			We're done, release referrence 
		]]
		obs.obs_source_release( source )
		--[[
			Lets apply the Width and Height to the 'Text Source'
			We do this so that we can fill the frame with the color 
		
			Get the Source Name as defined by user in Script Settings
		]]		
		text_source = obs.obs_data_get_string( settings, "color_source" )
		--[[
			Sources have unique names
			Load the Source, from the Name
		]]			
		source = obs.obs_get_source_by_name( text_source ) -- Increments the source reference counter, use obs_source_release() to release it when complete.
		--[[
			Found Source:
		]]
		if source ~= nil then
			--[[
				Fetch the Source settings so we can edit them
			]]
			local source_settings = obs.obs_source_get_settings( source)
			--[[
				Set width from previously retrieved scene width
			]]
			obs.obs_data_set_int( source_settings, "width", scene_width )
			--[[
				Set width from previously retrieved scene height
			]]
			obs.obs_data_set_int( source_settings, "height", scene_height )
			--[[
				All set, send the updated settings
			]]
			obs.obs_source_update( source, source_settings )
			--[[
				We are done with the source settings,
				let's release the referrence 
			]]
			obs.obs_data_release( source_settings )
		end
		--[[
			We are done with the source,
			let's release the referrence 
		]]
		obs.obs_source_release( source )
	end
end

--[[
--------------------------------------------------------------------
 custom function
--------------------------------------------------------------------
--------------------------------------------------------------------
]]
function set_text_bounds( settings )
	--[[
		Monitor scene is where status results are sent
	]]
	monitor_scene = obs.obs_data_get_string( settings, "monitor_scene" )
	--[[
		Get Source for Monitor scene.
	
		We want the Video Frame Size: Width and Height
		to set the child elements (Scene Items) to match.
	]]
	source = obs.obs_get_source_by_name( monitor_scene ) -- Increments the source reference counter, use obs_source_release() to release it when complete.
		--[[
			Found Source:
		]]
	if source ~= nil then
		--[[
			Fetch parent current Settings: Width
		]]
		scene_width = obs.obs_source_get_width( source )
		--[[
			Fetch parent current Settings: Height
		]]
		scene_height = obs.obs_source_get_height( source )
		--[[
			We're done, release referrence 
		]]
		obs.obs_source_release( source )
		--[[
			Lets apply the Width and Height to the 'Text Source'
			We do this so that we can center the text properly
		
			Get the Source Name as defined by user in Script Settings
		]]
		text_source = obs.obs_data_get_string( settings, "text_source" )
		--[[
			Sources have unique names
			Load the Source, from the Name
		]]		
		source = obs.obs_get_source_by_name( text_source ) -- Increments the source reference counter, use obs_source_release() to release it when complete.
		--[[
				Found Source:
		]]
		if source ~= nil then
			--[[
				Fetch the Source settings so we can edit them
			]]
			local source_settings = obs.obs_source_get_settings( source )
			--[[
					set text bounds width
			]]



			obs.obs_data_set_int( source_settings, "extents_cx", scene_width )
			--[[
					set text bounds height
			]]
			obs.obs_data_set_int( source_settings, "extents_cy", scene_height )
			--[[
					Use extends
			]]
			obs.obs_data_set_bool( source_settings, "extents", true )
			--[[
					set text wrap
			]]
			obs.obs_data_set_bool( source_settings, "extents_wrap", true )
			--[[
					set text antialiasing
			]]
			obs.obs_data_set_bool( source_settings, "antialiasing", true )
			--[[
					text align horizontal
			]]
			obs.obs_data_set_string( source_settings, "align", "center" )
			--[[
					text align verticle
			]]
			obs.obs_data_set_string( source_settings, "valign", "center" )
			--[[
				All set, send the updated settings
			]]
			obs.obs_source_update( source, source_settings )
			--[[
				We are done with the source settings,
				let's release the referrence 
			]]
			obs.obs_data_release( source_settings )
		end
		--[[
				we are done with the source, let's release the referrence
		]]
		obs.obs_source_release( source )
	end
end	

--[[
--------------------------------------------------------------------
 custom function
--------------------------------------------------------------------
	Update Source
--------------------------------------------------------------------
]]
function source_settings_update( a_settings )
		
	if a_settings ~= nil then	
		script_settings = a_settings	
	end	
	
	--[[
		exit her if script is disabled
	]]	
	if obs.obs_data_get_bool( script_settings, "disable_script" ) then
		return
	end 

	--[[
		
	]]	
	local color, text = nil, nil

	--[[
		
	]]			
	if monitor_state ~= nil then

		--[[

		]]	
		if monitor_state then
			color_background = obs.obs_data_get_int( script_settings, "active_color" )
			color_text = obs.obs_data_get_int( script_settings, "active_font" )
			text = obs.obs_data_get_string( script_settings, "active_text" )
		else
			color_background = obs.obs_data_get_int( script_settings, "inactive_color" )
			color_text = obs.obs_data_get_int( script_settings, "inactive_font" )
			text = obs.obs_data_get_string( script_settings, "inactive_text" )
		end	
		--[[

		]]
		if obs.obs_data_get_bool( script_settings, "include_name" ) then
			text = name .. ' ' .. text .. ' '
		end
	
	--[[
		
	]]
	else
		color_background =  0xFFFF9900	
		color_text = 0xFF0B0E10
		text = "Source Not Defined"
	end
				--[[

				]]
				color_source = obs.obs_data_get_string( script_settings, "color_source" )
				--[[

				]]
				text_source = obs.obs_data_get_string( script_settings, "text_source" )
				--[[

				]]
				set_visible( color_source, true )
				--[[

				]]
				set_visible( text_source, true )
				--[[
					Sources have unique names
					Load the Source, from the Name
				]]		
				source = obs.obs_get_source_by_name( color_source ) -- Increments the source reference counter, use obs_source_release() to release it when complete.
			--[[
					Found Source:
			]]
			if source ~= nil then
				--[[

				]]
				local source_settings = obs.obs_source_get_settings( source )
				--[[

				]]
				obs.obs_data_set_int( source_settings, "color", color_background )
				--[[

				]]
				obs.obs_source_update( source, source_settings )
				--[[

				]]
				obs.obs_data_release( source_settings )
			end	
				--[[
					we are done with the source, let's release the referrence
				]]
				obs.obs_source_release(source)
				--[[
					Sources have unique names
					Load the Source, from the Name
				]]	
				source = obs.obs_get_source_by_name( text_source ) -- Increments the source reference counter, use obs_source_release() to release it when complete.
			--[[
				Found Source:
			]]
			if source ~= nil then
				--[[

				]]
				local source_settings = obs.obs_source_get_settings( source )
				--[[

				]]
				obs.obs_data_set_string( source_settings, "text", text )
				--[[

				]]
				obs.obs_data_set_int( source_settings, "color", color_text )

				--[[

				]]
				obs.obs_source_update( source, source_settings )
				--[[

				]]
				obs.obs_data_release( source_settings )
				--[[

				]]
			end	
			--[[

			]]
			obs.obs_source_release( source )
end	

--[[
--------------------------------------------------------------------

--------------------------------------------------------------------

--------------------------------------------------------------------
]]
function scene_items_by_scene_name( scene_name, source_id, prop_ref )

	local enumerated = false
		--[[
			'source' selected to provide monitor information
		
			Sources have unique names
			Load the Source, from the Name
		]]	
		local source = obs.obs_get_source_by_name( scene_name ) -- Increments the source reference counter, use obs_source_release() to release it when complete.
		--[[
			'source' selected to provide monitor information
		]]
		if source ~= nil then
			--[[

			]]
			local scene = obs.obs_scene_from_source( source ) -- Does not increase the reference
			--[[

			]]
			local sceneitems = obs.obs_scene_enum_items( scene ) -- Release with sceneitem_list_release()
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
					local sceneitem_source = obs.obs_sceneitem_get_source( value_sceneitem ) -- Does not increment the reference
					--[[
						check if 'source' is 'group'
					]]	
					local group = obs.obs_group_from_source( sceneitem_source ) -- Does not increase the reference

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
						NOTE: We use type_ID as this is not affected by language packs, display_name is dependent on language setting
					]]	
					if id == source_id then
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
						local groupitems = obs.obs_scene_enum_items( group ) -- Release with sceneitem_list_release()

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
								local groupitemsource = obs.obs_sceneitem_get_source( value_groupitem )	-- Does not increment the reference	

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
									NOTE: We use type_ID as this is not affected by language packs, display_name is dependent on language setting
								]]	
								if id == source_id then
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
custom function
--------------------------------------------------------------------

--------------------------------------------------------------------
]]
function update_properties_list_items(ref)
	--[[

	]]
	if ref == "monitor_source" then
		--[[

		]]
		obs.obs_property_list_clear( props_monitor )
		--[[

		]]
		t_type = {"None"}
		--[[

		]]
		for i,v in ipairs( t_type) do obs.obs_property_list_add_string( props_monitor, v, v ) end
		--[[
			build list
			add to property
		]] 	
		local sources = obs.obs_enum_sources() -- Release with source_list_release().
		--[[

		]]
		if sources ~= nil then
			--[[

			]]
			for _, source in pairs( sources ) do
				--[[

				]]
				local name = obs.obs_source_get_name( source )
				--[[

				]]
				source_id = obs.obs_source_get_unversioned_id( source )
				--[[

				]]
				if in_table( source_id_whitelist, source_id ) then
					--[[

					]]
					obs.obs_property_list_add_string( props_monitor, name, name )
				end	
			end	
		end	
		--[[

		]]
		obs.source_list_release( sources ) -- releases the references of source list		
	end
	--[[

	]]
	if ref == "monitor_scene" then
		--[[

		]]
		obs.obs_property_list_clear( props_scene )
		--[[

		]]
		t_type = {"None"}
		--[[

		]]
		for i,v in ipairs( t_type ) do obs.obs_property_list_add_string( props_scene, v, v ) end
		--[[
			build list
			add to property
		]] 	
		local scenes = obs.obs_frontend_get_scene_names() -- The list is stored within one contiguous segment of memory, so freeing the returned pointer with bfree() will free the entire list
		--[[

		]]
		if scenes ~= nil then
			--[[

			]]
			for i, scene in ipairs( scenes ) do
				--[[

				]]
				obs.obs_property_list_add_string( props_scene, scene, scene )
			end
		end
		--[[

		]]
		obs.bfree( scene )
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
	--[[

	]]	
	if mode ~= "select" then
		for i,v in ipairs( prop_names ) do obs.obs_property_set_visible(obs.obs_properties_get( props, v ), true ) end
	else
		for i,v in ipairs( prop_names ) do obs.obs_property_set_visible(obs.obs_properties_get( props, v ), false ) end
		return true
	end
	--[[

	]]	
	monitor_source = obs.obs_data_get_string( script_settings, "monitor_source" )
	if monitor_source == "None" then
		monitor_state = nil
	end
	--[[

	]]	
	mode_item_set_status()
	source_settings_update()
	
	--[[
		define list that will show a property list item
		if 'mode' is not in this list it will set visible to false
		Set the Monitor Source List available only if one of the 
		options are selected   

		Audio Mute / Unmute types
		"Input Audio Device", "Output Audio Device", "Browser Audio", "Capture Device Audio"
	]]	
	local monitor_source_list = {
		a = "Input Audio Device",
		b = "Output Audio Device",
		c = "Browser Audio",
		d = "Capture Device Audio",
		e = "Media State"	
	}
	--[[
		set visibility for property list item
	]]	
	obs.obs_property_set_visible(obs.obs_properties_get( props, "monitor_source" ), in_table( monitor_source_list, mode ) )
	--[[

	]]	
	assign_whitelist()	
	--[[
		build list
		add to property
	]] 	
	update_properties_list_items("monitor_source")
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
		if not scene_items_by_scene_name( monitor_scene, "text_gdiplus_v2", text_source ) then
			obs.obs_property_list_add_string( text_source, 'Nothing Available', 'none' )
		end	
		--[[
			nothing available for the list, instead of leaving it empty,
			display a messasge to the user
		]]		
		if not scene_items_by_scene_name( monitor_scene, "color_source_v3", color_source ) then
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
	local sources = obs.obs_enum_sources() -- Release with source_list_release().
	
	--[[
		new property item: list
		Monitor Scene
		Audio Mute / Unmute types
		"Input Audio Device", "Output Audio Device", "Browser Audio", "Capture Device Audio"
	]]	
	props_mode = obs.obs_properties_add_list( props, "mode", "<i>Monitor Mode</i>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING )
	t_type = {"Input Audio Device", "Output Audio Device", "Browser Audio", "Capture Device Audio", "Recording", "Streaming", "Media State"}
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
	for i,v in ipairs( t_type ) do obs.obs_property_list_add_string(props_color, v, v ) end
	
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
	obs.obs_property_set_modified_callback( props_monitor, property_onchange )
  	obs.obs_property_set_modified_callback( props_scene, property_onchange )

	--[[
		Calls the callback once to set-up current visibility
	]]	
  	obs.obs_properties_apply_settings( props, script_settings )
	
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
function is_audio_device()

	--[[
		load mode if available
	]]
	mode = obs.obs_data_get_string( script_settings, "mode" )
	--[[
		
	]]
	return ( mode == "Input Audio Device" or mode == "Output Audio Device" or mode == "Browser Audio" or mode == "Capture Device Audio" )
end	

--[[
--------------------------------------------------------------------

--------------------------------------------------------------------

--------------------------------------------------------------------
]]
function assign_whitelist()
	
	--[[
		Audio Mute / Unmute types
		"Input Audio Device", "Output Audio Device", "Browser Audio", "Capture Device Audio"
	]]		
	if mode == "Input Audio Device" then
		source_id_whitelist	= {
		a = "wasapi_input_capture",
		--b = "wasapi_output_capture",
		--c = "dshow_input",
		--d = "browser_source"
		--e = "ffmpeg_source",
		--f = "monitor_capture",
		--g = "streamlink_source",
		}
	end	
		
	if mode == "Output Audio Device" then
		source_id_whitelist	= {
		--a = "wasapi_input_capture",
		b = "wasapi_output_capture",
		--c = "dshow_input",
		--d = "browser_source"
		--e = "ffmpeg_source",
		--f = "monitor_capture",
		--g = "streamlink_source",
		}
	end
	
	if mode == "Browser Audio" then
		source_id_whitelist	= {
		--a = "wasapi_input_capture",
		--b = "wasapi_output_capture",
		--c = "dshow_input",
		d = "browser_source"
		--e = "ffmpeg_source",
		--f = "monitor_capture",
		--g = "streamlink_source",
		}
	end		
	
	if mode == "Media State" then
		source_id_whitelist	= {
		--a = "wasapi_input_capture",
		--b = "wasapi_output_capture",
		--c = "dshow_input",
		--d = "browser_source"
		e = "ffmpeg_source"
		--f = "monitor_capture",
		--g = "streamlink_source",
		}
	end
	
	if mode == "Capture Device Audio" then
		source_id_whitelist	= {
		--a = "wasapi_input_capture",
		--b = "wasapi_output_capture",
		c = "dshow_input",
		--d = "browser_source"
		--e = "ffmpeg_source",
		--f = "monitor_capture",
		--g = "streamlink_source",
		}
	end			
end

--[[
--------------------------------------------------------------------

--------------------------------------------------------------------

--------------------------------------------------------------------
]]
function scene_item_updated()
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
		--[[
			
		]]		
		if not scene_items_by_scene_name( monitor_scene, "text_gdiplus_v2", text_source ) then
			obs.obs_property_list_add_string( text_source, 'Nothing Available', 'none' )
		end	
		--[[
			nothing available for the list, instead of leaving it empty,
			display a messasge to the user
		]]		
		if not scene_items_by_scene_name( monitor_scene, "color_source_v3", color_source ) then
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
	
	
	assign_whitelist()
	--[[
		set some things
	]]
	set_text_bounds( settings )
	set_color_bounds( settings )
	--[[
		connect handler to source
	]]
	reconnect_source_signal()
	--[[
		check mode and relevant state and set variant accordingly
	]]
	mode_item_set_status()
	--[[
		make sure the source is updated with the most recent changes
	]]
	source_settings_update()
	
	-- Keep track of current settings
  	script_settings = settings 
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

	--[[
		check mode and relevant state and set variant accordingly
	]]
	mode_item_set_status( settings )
	
	--[[
		make sure the source is updated with the most recent changes
	]]
	source_settings_update( settings )
	--[[
		Create Signal Handler 
	]]	
	local sh = obs.obs_get_signal_handler()
	--[[
		attach event listener callback [connect_source_signal]
		for when a source is done loading.
	]]	
	obs.signal_handler_connect( sh, "source_load", connect_source_signal )
	--[[
		Adds a callback that will be called when a frontend event occurs. 
		See obs_frontend_event on what sort of events can be triggered.
	]]
	obs.obs_frontend_add_event_callback( on_event )
		
	source_settings_update( settings )	
		
	-- Keep track of current settings	
  	script_settings = settings
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

--------------------------------------------------------------------

--------------------------------------------------------------------
]]
function mode_item_set_status( a_settings )	
		
	if a_settings ~= nil then	
		script_settings = a_settings	
	end	
	--[[
		get mode for Monitor Type
		use this here to determine visibility 
		for property list item
	
		Audio Mute / Unmute types
		"Input Audio Device", "Output Audio Device", "Browser Audio", "Capture Device Audio"
	]]	
	mode = obs.obs_data_get_string( script_settings, "mode" )
	
	if is_audio_device() or mode == 'Media State' then
		
		monitor_source = obs.obs_data_get_string( script_settings, "monitor_source" )
		
		--[[
			Sources have unique names
			Load the Source, from the Name
		]]	
		source = obs.obs_get_source_by_name( monitor_source ) -- Increments the source reference counter, use obs_source_release() to release it when complete.
		--[[
			Found Source:
		]]	
		if source ~= nil then
			--[[

			]]
			if is_audio_device() then
				--[[

				]]
				monitor_state = not obs.obs_source_muted(source)
			--[[

			]]
			elseif mode == 'Media State' then
				--[[

				]]
				local state = obs.obs_source_media_get_state(source)
				--[[

				]]
				monitor_state = false
				--[[

				]]
				if state == obs.OBS_MEDIA_STATE_STOPPED or state == obs.OBS_MEDIA_STATE_ENDED then
					--[[

					]]
					monitor_state = false
				end
				--[[

				]]
				if state == obs.OBS_MEDIA_STATE_OPENING or state == obs.OBS_MEDIA_STATE_PLAYING then
					--[[

					]]
					monitor_state = true
				end
			end	
		end
		--[[
			we are done with the source, let's release the referrence
		]]
		obs.obs_source_release(source)
	end
	--[[
			If mode match, get correct state
	]]
	if mode == "Recording" then
		monitor_state = obs.obs_frontend_recording_active()
	end
	--[[
			If mode match, get correct state
	]]
	if mode == "Streaming" then
		monitor_state = obs.obs_frontend_streaming_active()
	end
	
end	
--[[
--------------------------------------------------------------------
 custom function connect_scene_signal()
--------------------------------------------------------------------
Event Listener when user adds/remove items to a scene
The idea here is to refresh the Script Properties if the user 
Edited Scene Items so that the may be inlcuded as options in the
Script Property List. It doesn't work nicely, because the Script
Property is not refreshed without some help. See Refresh Button
--------------------------------------------------------------------
]]
function connect_scene_signal()
	
	--[[
		check mode and relevant state and set variant accordingly
	]]
	mode_item_set_status( settings )
	
	--[[
		make sure the source is updated with the most recent changes
	]]	
	source_settings_update( settings )
	--[[
		Get current scene source
	]]
	source = obs.obs_frontend_get_current_scene() -- A new reference to the currently active scene 
	--[[
		Create a signal handler for the source
	]]
    sh = obs.obs_source_get_signal_handler(source)  
	--[[
		Scene Signals
		https://obsproject.com/docs/reference-scenes.html?highlight=item_add
	]]
    obs.signal_handler_connect(sh, "item_add", scene_item_updated)  
	--[[
		Scene Signals
		https://obsproject.com/docs/reference-scenes.html?highlight=item_remove
	]]
    obs.signal_handler_connect(sh, "item_remove", scene_item_updated)  
	--[[
		we are done with the source, let's release the referrence
	]]
    obs.obs_source_release(source)
end
--[[
--------------------------------------------------------------------
 custom function

	we use this to get a signal handler for a specific source once
	it is loaded to ensure it is connected when OBS starts up
--------------------------------------------------------------------
]]
function connect_source_signal( cd )
	
	--[[
		check mode and relevant state and set variant accordingly
	]]
	mode_item_set_status( script_settings )
	--[[
		Fetch the settings defined in the Script Settings
	]]
	monitor_source = obs.obs_data_get_string( script_settings, "monitor_source" )
	--[[
		load mode if available
	]]
	mode = obs.obs_data_get_string( script_settings, "mode" )
	--[[
		Get source from CallData
	]]
	local source = obs.calldata_source( cd, "source" )
	--[[
		Found Source:
	]]
	if source ~= nil then
		--[[
			Get the Source Name
		]]
		local name = obs.obs_source_get_name( source )
		--[[
			Does the name match the defined Script Settings name?
		]] 
		if ( name == monitor_source ) then  
			--[[
			Create a signal handler for the source
			]]
			local sh = obs.obs_source_get_signal_handler( source )
			--[[
				Audio Mute / Unmute types
				"Input Audio Device", "Output Audio Device", "Browser Audio", "Capture Device Audio"
			]]	
			if is_audio_device() then  
				--[[
					https://obsproject.com/docs/reference-sources.html?highlight=mute
					attach event listener callback [source_signal]: Called when the source is muted/unmuted.
				]]
				obs.signal_handler_connect( sh, "mute", source_signal )	  
			--[[
					reserve for mode
			]]
			elseif mode == 'Media State' then
				--[[
					https://obsproject.com/docs/reference-sources.html?highlight=media_started
					attach event listener callback [source_signal]: Called when media has started.
				]]
				obs.signal_handler_connect( sh, "media_started", source_signal )
				--[[
					https://obsproject.com/docs/reference-sources.html?highlight=media_started
					attach event listener callback [source_signal]: Called when media has started.
				]]	
				obs.signal_handler_connect( sh, "media_ended", source_signal )	
			end		
		end	
	end
end

--[[
--------------------------------------------------------------------
 custom function

	The user may have changed the monitor source, reconnect source
	signals for the correct signal call
--------------------------------------------------------------------
]]
function reconnect_source_signal()
	--[[
		Reserve this for other modes
	]]	
	if mode == "Streaming" or mode == "Recording" then
		return
	end  
	--[[
		Fetch the settings defined in the Script Settings
	]]
	monitor_source = obs.obs_data_get_string( script_settings, "monitor_source" )  
	--[[
		Sources have unique names
		Load the Source, from the Name
	]]	
	source = obs.obs_get_source_by_name( monitor_source ) -- Increments the source reference counter, use obs_source_release() to release it when complete.  
	--[[
		Found Source:
	]]
	if source ~= nil then  
		--[[
			Check if the Source is unmuted
		]]
		monitor_state = not obs.obs_source_muted( source )  
		--[[
		Create a signal handler for the source
		]]
		local sh = obs.obs_source_get_signal_handler( source )	
		--[[
			Audio Mute / Unmute types
			"Input Audio Device", "Output Audio Device", "Browser Audio", "Capture Device Audio"
		]]	
		if is_audio_device() then  
			--[[
				https://obsproject.com/docs/reference-sources.html?highlight=mute
				attach event listener callback [source_signal]: Called when the source is muted/unmuted.
			]]
			obs.signal_handler_connect( sh, "mute", source_signal )	  
		--[[
				reserve for mode
		]]
		elseif mode == 'Media State' then  
			--[[
				https://obsproject.com/docs/reference-sources.html?highlight=media_started
				attach event listener callback [source_signal]: Called when media has started.
			]]
			obs.signal_handler_connect( sh, "media_started", source_signal )  
			--[[
				https://obsproject.com/docs/reference-sources.html?highlight=media_started
				attach event listener callback [source_signal]: Called when media has ended.
			]]	
			obs.signal_handler_connect( sh, "media_ended", source_signal )	
		end	
	end  
	--[[
		we are done with the source, let's release the referrence
	]]
	obs.obs_source_release(source)	
end	

--[[
--------------------------------------------------------------------
 custom function
	Called when a source is activated/deactivated
--------------------------------------------------------------------
]]
function source_signal( cd )
	--[[
		exit here if script is disabled
	]]
	if obs.obs_data_get_bool( script_settings, "disable_script" ) then
		return
	end  
	--[[
		Get source from CallData
	]]
	local source = obs.calldata_source( cd, "source" ) 
	--[[
		Found Source:
	]]
	if source ~= nil then 
	--[[
		Get the Source Name
	]]
		local name = obs.obs_source_get_name( source ) 
		--[[
			Does the name match the defined Script Settings name?
		]]
		if ( name == monitor_source ) then	
			--[[
				Audio Mute / Unmute types
				"Input Audio Device", "Output Audio Device", "Browser Audio", "Capture Device Audio"
			]]	
			if is_audio_device() then 
				--[[
					check if source state is unmuted 
				]]
				monitor_state = not obs.obs_source_muted( source ) 
			--[[

			]]
			elseif mode == 'Media State' then 
				--[[
					Media play, active?
				]]
				local state = obs.obs_source_media_get_state( source )
				--[[
					Set default state
				]]
				monitor_state = false
				--[[
					Set state depending on media state
				]]
				if state == obs.OBS_MEDIA_STATE_STOPPED or state == obs.OBS_MEDIA_STATE_ENDED then
				--[[
					Let he user know this is not active
				]]
					monitor_state = false
				end
				--[[
					Set state depending on media state
				]]
				if state == obs.OBS_MEDIA_STATE_OPENING or state == obs.OBS_MEDIA_STATE_PLAYING then
				--[[
					Let he user know this is active
				]]
					monitor_state = true
				end
			end				
		end
	end
	--[[
		update source settings
	]]
	source_settings_update()
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
		update_properties_list_items("monitor_scene")
		
	elseif event == obs.OBS_FRONTEND_EVENT_SCENE_CHANGED then
            --  update our source scene list
		connect_scene_signal()
	end
end