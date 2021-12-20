-- Open Broadcaster Software®️
-- OBS > Tools > Scripts
-- Original Code: @Exeldro
--
-- 27/03/2021 13:59 @midnight-studios
--
--	Globals
obs           				= obslua
luafileTitle				= "MediaSwitchScene"
gversion 					= 0.3
luafile						= "MediaSwitchScene.lua"
obsurl						= "media-switch-scene.1386/"
icon="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAfQAAAH0CAYAAADL1t+KAAAACXBIWXMAAC4jAAAuIwF4pT92AAAFyGlUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNi4wLWMwMDIgNzkuMTY0NDYwLCAyMDIwLzA1LzEyLTE2OjA0OjE3ICAgICAgICAiPiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIiB4bWxuczpzdEV2dD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlRXZlbnQjIiB4bWxuczpkYz0iaHR0cDovL3B1cmwub3JnL2RjL2VsZW1lbnRzLzEuMS8iIHhtbG5zOnBob3Rvc2hvcD0iaHR0cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgMjEuMiAoV2luZG93cykiIHhtcDpDcmVhdGVEYXRlPSIyMDIxLTEwLTI1VDExOjI4OjE3KzEzOjAwIiB4bXA6TWV0YWRhdGFEYXRlPSIyMDIxLTEwLTI1VDExOjI4OjE3KzEzOjAwIiB4bXA6TW9kaWZ5RGF0ZT0iMjAyMS0xMC0yNVQxMToyODoxNysxMzowMCIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDozMmNjZDk0NS03MDI4LWY4NDQtOWM5OS1iNzhiY2Q3ZjFhMmIiIHhtcE1NOkRvY3VtZW50SUQ9ImFkb2JlOmRvY2lkOnBob3Rvc2hvcDpjY2ZkNmU5YS00MGU5LTM5NDQtOTcyYi1l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"
desc	    				= [[
<hr/><center><h2>]] .. luafileTitle ..[[</h2>(Version: %s)</center>
<br><center><img width=50 height=50 src=']] .. icon .. [['/></center>
<br><center><a href="https://github.com/midnight-studios/obs-lua/blob/main/]] .. luafile ..[[">Find it on GitHub</a></center>
<br><p>Switch to Scene when media end.</p>
<p>Select media from a list, when it ends playing, the Script will switch to your selected scene.
<ol>
<li><tt>`Select Media`</tt></li>
<li><tt>`Select Scene`</tt></li>
</ol></p>
<p>Find help on the <a href="https://obsproject.com/forum/resources/]] .. obsurl ..[[">OBS Forum Thread</a>.</p>
<hr/>]]
p_settings 					= nil
media_name 					= ""
p_media_name 				= nil
scene_name 					= ""
disable_script 				= ""
last_state  = obs.OBS_MEDIA_STATE_NONE
--[[
--------------------------------------------------------------------
--------------------------------------------------------------------
]]
function script_description()
	return string.format(desc, tostring(gversion))
end
--[[
----------------------------------------------------------
-- Use this to create a Script Log Output used in testing
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
--------------------------------------------------------------------
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
Callback on property modification
----------------------------------------------------------
]]
function property_onchange( props, property, settings )
	
	--[[
		get mode for Monitor Type
		use this here to determine visibility 
		for property list item
	]]	
	media_name = obs.obs_data_get_string( settings, "media_name" )
	--[[

	]]	
	if ( media_name == "Select" ) then
		--[[

		]]	
		obs.obs_property_set_visible(obs.obs_properties_get( props, "scene_name" ), false )
	else
		--[[

		]]	
		obs.obs_property_set_visible(obs.obs_properties_get( props, "scene_name" ), true )
	end
	--[[
		update previous name
	]]		
	p_media_name = media_name
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
function script_update(settings)
	--[[
		Update globals
	]]	
    media_name = obs.obs_data_get_string(settings, "media_name")
	--[[
		Update globals
	]]	
    scene_name = obs.obs_data_get_string(settings, "scene_name")
	--[[
		Update globals
	]]	
	disable_script = obs.obs_data_get_bool(settings,"disable_script")

	-- Keep track of current settings
  	p_settings = settings 
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
	--[[
		Create a property list
	]]	
    props = obs.obs_properties_create()
	--[[
		Create a Media List
	]]	
	local props_source = obs.obs_properties_add_list(props, "media_name", "Media Source", obs.OBS_COMBO_TYPE_EDITABLE, obs.OBS_COMBO_FORMAT_STRING)
	--[[
		Add a no select
	]]	
	obs.obs_property_list_add_string(props_source, "Select", "select")
	--[[
		An array of reference-incremented sources. Release with source_list_release().
	]]	
	local sources = obs.obs_enum_sources() 
	--[[
		fetch source list
	]]	
	if sources ~= nil then
		
		local list = {}
		--[[
			Check Source one at a time
		]]	
        for _, source in ipairs(sources) do
			--[[
				Get name for current source
			]]	
            local name = obs.obs_source_get_name( source )
			--[[
				Get id for current source
			]]	
			local id = obs.obs_source_get_id( source )
			--[[
				if id match, list it
			]]	
			if id == "ffmpeg_source" then
			--[[
				add it to list so that it can be reordered
			]]		
				list[name] = name
			end -- if id == "ffmpeg_source"
		end	--  for soures
		--[[
			
		]]				
		for key, value in pairsByKeys(list) do
			--[[
				add item to property list
			]]	
			obs.obs_property_list_add_string( props_source, value, value )
		end
	end -- sources ~= nil
	--[[
		Release obs_enum_sources
	]]	
    obs.source_list_release(sources)
	--[[
		Create a scene list
	]]		
	local scene_list = obs.obs_properties_add_list(props, "scene_name", "Scene:", obs.OBS_COMBO_TYPE_EDITABLE, obs.OBS_COMBO_FORMAT_STRING)
	--[[
		Add a no select
	]]	
	obs.obs_property_list_add_string(scene_list, "Select", "select")
	--[[
		The scene name list, ending with NULL. 
		The list is stored within one contiguous segment of memory, 
		so freeing the returned pointer with bfree() will free the entire list.
	]]	
    local scenenames = obs.obs_frontend_get_scene_names()
	--[[
		Found names:
	]]	
    if scenenames ~= nil then
		--[[
			Cycle through items
		]]	
        for _, scenename in ipairs(scenenames) do
			--[[
					add item to property list
			]]	
            obs.obs_property_list_add_string(scene_list, scenename, scenename)
		--[[

		]]	
        end
		--[[
			Free list segment of memory
		]]	
		obs.bfree( scenename )
	--[[
		
	]]	
    end
	--[[
		Add one more property item to disbale script if needed
	]]	
	obs.obs_properties_add_bool(props, "disable_script", "Disable Script")
		--[[
		OnChange Events
	]]	
	obs.obs_property_set_modified_callback( props_source, property_onchange )

	--[[
		Calls the callback once to set-up current visibility
	]]	
  	obs.obs_properties_apply_settings( props, p_settings )
	--[[
		return the properties
	]]	
    return props
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
function script_defaults(settings)
	--[[
		Set default
	]]	
	obs.obs_data_set_default_string(settings, "media_name", "Select")
	--[[
		Set default
	]]	
	obs.obs_data_set_default_string(settings, "scene_name", "Select")
	--[[
		Set default
	]]	
	obs.obs_data_set_default_bool(settings, "disable_script", false)
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
function script_load(settings)
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
]]
function script_tick(seconds)
			
   if disable_script then
		return					
	end
	--[[
			
	]]		
	if media_name == "Select" or scene_name == "Select" then
		return
	end

    local source = obs.obs_get_source_by_name( media_name )

    if source ~= nil then
		
		if obs.obs_source_active( source ) then

			local state = obs.obs_source_media_get_state(source)

			if last_state ~= state then

				last_state = state

				if state == obs.OBS_MEDIA_STATE_STOPPED or state == obs.OBS_MEDIA_STATE_ENDED then

					local scene_source = obs.obs_get_source_by_name(scene_name)

					if scene_source ~= nil then

						obs.obs_frontend_set_current_scene(scene_source)
						obs.obs_source_release(scene_source)
					end

				end

			end	
			
		end
		
    end
	
    obs.obs_source_release(source)
	
end