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

luafileTitle				= ""
gversion 					= 0.2
luafile						= ""
obsurl						= ""
script_settings 			= nil
gs            				= nil
icon						= ""
desc	    				= [[
<hr/><center><h2>]] .. luafileTitle ..[[</h2>(Version: %s)</center>
<br><center><img width=50 height=50 src=']] .. icon .. [['/></center>
<br><center><a href="https://github.com/midnight-studios/obs-lua/blob/main/]] .. luafile ..[[">Find it on GitHub</a></center>
<br><p>Title</p>
<p>Text:
<ol>
<li><tt>`Text`</tt></li>
</ol></p>
<p>Find help on the <a href="https://obsproject.com/forum/resources/]] .. obsurl ..[[">OBS Forum Thread</a>.</p>
<hr/>]]
local bit = require('bit')

function send_hotkey( hotkey_id_name, key_modifiers )
	print('sent hotkey')
  shift = key_modifiers.shift or false
  control = key_modifiers.control or false
  alt = key_modifiers.alt or false
  command = key_modifiers.command or false
  modifiers = 0

  if shift then modifiers = bit.bor( modifiers,obs.INTERACT_SHIFT_KEY ) end
  if control then modifiers = bit.bor( modifiers,obs.INTERACT_CONTROL_KEY ) end
  if alt then modifiers = bit.bor( modifiers,obs.INTERACT_ALT_KEY ) end
  if command then modifiers = bit.bor( modifiers,obs.INTERACT_COMMAND_KEY ) end

  combo = obs.obs_key_combination()
  combo.modifiers = modifiers
  combo.key = obs.obs_key_from_name( hotkey_id_name )

  if not modifiers and
    ( combo.key == obs.OBS_KEY_NONE or combo.key >= obs.OBS_KEY_LAST_VALUE ) then
    return error('invalid key-modifier combination')
  end
  obs.obs_hotkey_enable_background_press( true )
  obs.obs_hotkey_inject_event( combo, false )
  obs.obs_hotkey_inject_event( combo, true )
  obs.obs_hotkey_inject_event( combo, false )
end


function script_description()
	return string.format( desc, tostring( gversion ) )
end

function script_load( settings )

    gs = settings
    local sh = obs.obs_get_signal_handler()
    obs.signal_handler_connect( sh, "source_load", loaded )
end
--[[
----------------------------------------------------------
	A function named script_properties defines the properties that the user
	can change for the entire script module itself
----------------------------------------------------------
]]
function script_properties()
	local props = obs.obs_properties_create()
		--[[
		Returns an array of reference-incremented sources. 
		Release with source_list_release().
	]]	
	local sources = obs.obs_enum_sources()
	local p_a = obs.obs_properties_add_list( props, "hotkey_source", "<i>Hotkey Source</i>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING )
	obs.obs_property_list_add_string( p_a, "Select", "select" )
	local list = {}
	if sources ~= nil then
		for _, source in ipairs( sources ) do
			source_id = obs.obs_source_get_unversioned_id( source )
			--if source_id == "text_gdiplus" or source_id == "text_ft2_source" then
				local name = obs.obs_source_get_name( source )
				
					--[[
						add it to list so that it can be reordered
					]]		
					list[name] = name
	
			--end
		end
			obs.bfree(source)
		
		for key, value in pairsByKeys( list ) do
			--[[
				add item to property list
			]]	
			obs.obs_property_list_add_string( p_a, value, value )
		end
	end
	obs.source_list_release( sources )
	return props
end	
	
function script_update( settings )
    local hotkey_source = obs.obs_data_get_string( settings, "hotkey_source" );  
	local source = obs.obs_get_source_by_name( hotkey_source )
	if source ~= nil then
		local sh = obs.obs_source_get_signal_handler( source );
		obs.signal_handler_disconnect( sh, "show", item_visible )
		obs.signal_handler_connect( sh, "show", item_visible )
		obs.signal_handler_disconnect( sh, "hide", item_visible )
		obs.signal_handler_connect( sh, "hide", item_visible )

	end
	obs.obs_source_release( source )
end
--[[
----------------------------------------------------------
A function named script_defaults will be called to set the default settings
----------------------------------------------------------
]]
function script_defaults( settings )
	obs.obs_data_set_default_string( settings, "hotkey_source", "select" )
end

function item_visible( cd )
	
    local source = obs.calldata_source( cd, "source" )
		--[[
		Found Source:
	]]
	if source ~= nil then 
		local name = obs.obs_source_get_name( source )
		-- https://github.com/obsproject/obs-studio/blob/master/libobs/obs-hotkeys.h
		--send_hotkey("OBS_KEY_M",{control=false})
		send_hotkey("OBS_KEY_F11",{control=true})
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
function loaded( cd )
	
    if gs == nil then
        return
    end
    local cd_source = obs.calldata_source( cd, "source" )
	
    local source_name = obs.obs_source_get_name( cd_source )

    local hotkey_source = obs.obs_data_get_string( gs, "hotkey_source");

	if source_name == hotkey_source then
		print(source_name)
		local source = obs.obs_get_source_by_name( hotkey_source )
		if source ~= nil then
			local sh = obs.obs_source_get_signal_handler( source );
			obs.signal_handler_disconnect( sh, "show", item_visible )
			obs.signal_handler_connect( sh, "show", item_visible )
			obs.signal_handler_disconnect( sh, "hide", item_visible )
			obs.signal_handler_connect( sh, "hide", item_visible )
			obs.obs_source_release( source )
		end		
	end	
end



--[[
--------------------------------------------------------------------
--------------------------------------------------------------------
]]
function pairsByKeys( t, f )
	local a = {}
	for n in pairs( t ) do table.insert( a, n ) end
	table.sort( a, f )
	local i = 0      -- iterator variable
	local iter = function ()   -- iterator function
		i = i + 1
		if a[i] == nil then return nil
		else return a[i], t[a[i]]
		end
	end
	return iter
end
