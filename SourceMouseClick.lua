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
p_settings 					= nil
icon=""
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

local bit = require("bit")
sh_source		= nil -- global signal handle for source
sh				= nil -- global signal handle for source
--local json = require 'json'
--local inspect = require 'inspect'
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

local function enum_sources(callback)
	local sources = obs.obs_enum_sources()
	if sources ~= nil then
		for _,source in ipairs(sources) do
			callback(source)
		end
	end
	obs.source_list_release(sources)
end

local function examine_source_state(source)
	local current_source = obs.obs_frontend_get_current_scene()
	local current_scene = obs.obs_scene_from_source(current_source)
	local sh = obs.obs_get_signal_handler()
	local name = obs.obs_source_get_name(source)
	local flags = obs.obs_source_get_output_flags(source)
	local item = obs.obs_scene_find_source(current_scene, name)
	local in_current_scene = item ~= nil
	--script_log(name .. " " .. active .. " " .. status .. " " .. obs.obs_source_get_id(source) .. " " .. bit.tohex(flags))

	if bit.band(flags, obs.OBS_SOURCE_INTERACTION) ~= 0 then
		
		local sourcedata = obs.calldata()
		obs.calldata_init(sourcedata)
		obs.calldata_set_ptr(sourcedata, "source", source)
		obs.signal_handler_signal(sh, "lua_check_source_mouse_click", sourcedata)
		obs.calldata_free(sourcedata)
	end
	obs.obs_source_release(current_source)
end

local function examine_source_states()
	enum_sources(examine_source_state)
	--return true
end
--[[
----------------------------------------------------------
Callback onchange
----------------------------------------------------------
]]
function property_onchange(props, property, settings)
	--local str = obs.obs_data_get_string(settings, "str")
	--obs.obs_property_list_clear(str)
	
	scene_name = obs.obs_data_get_string( settings, "monitor_scene" )
	
	
	--local scene = obs.scene_from_scene_name(scene_name)
	--local source = scene_source_from_scene_name(scene_name)

	
	
	-- IMPORTANT: returns true to trigger refresh of the properties
	return true
end
	
--[[
----------------------------------------------------------

obs OBS_SOURCE_INTERACTION example



(*obs_source_info.mouse_click)(void *data, const struct obs_mouse_event *event, int32_t type, bool mouse_up, uint32_t click_count)

----------------------------------------------------------
]]


function scene_source_from_scene_name(scene_name)
	local scene_source = nil
	local source = obs.obs_get_source_by_name( scene_name ) 
	if source ~= nil then
		local scene = obs.obs_scene_from_source( source ) -- Does not increase the reference
		scene_source  = obs.obs_scene_get_source(scene) --- Does not increment the reference
	end
	obs.obs_source_release(source)
	
	return scene_source
end


function script_update(settings)
	
	scene_name = obs.obs_data_get_string( settings, "monitor_scene" )
	
	
	--local scene = obs.scene_from_scene_name(scene_name)
	--local source = scene_source_from_scene_name(scene_name)
	--local flags = obs.obs_source_get_output_flags(source)
	--local name = obs.obs_source_get_name(source)
	--local scene = obs.obs_scene_from_source(source)
	--local item = obs.obs_scene_find_source(scene, name)


			
			--[[
			
			
			
			void obs_source_send_mouse_click(obs_source_t *source,
				 const struct obs_mouse_event *event,
				 int32_t type, bool mouse_up,
				 uint32_t click_count)
{
	if (!obs_source_valid(source, "obs_source_send_mouse_click"))
		return;

	if (source->info.output_flags & OBS_SOURCE_INTERACTION) {
		if (source->info.mouse_click) {
			source->info.mouse_click(source->context.data, event,
						 type, mouse_up, click_count);
		}
	}
}

			
			
			]]
			
			--print(flags..' '..name)

	--obs.obs_source_release(source)
	
	local sources = obs.obs_enum_sources()
		if sources ~= nil then
			for _, source in ipairs(sources) do
				local name = obs.obs_source_get_name(source)
				local id = obs.obs_source_get_id(source)
				local display_name = obs.obs_source_get_display_name(id)
				local flags = obs.obs_source_get_output_flags(source)
				local event = obs.obs_mouse_event()
				--print(bit.band(flags, obs.OBS_SOURCE_INTERACTION)..' '..name)
		
				if bit.band(flags, obs.OBS_SOURCE_INTERACTION) ~= 0 then

					obs.obs_source_send_mouse_click(source, event, obs.INTERACT_MOUSE_LEFT, true, 1) -- source, event, type, mouse_up, click_count
				end
	
			end	
		end	
	obs.source_list_release(sources)
	
	
	-- Keep track of current settings
	p_settings = settings 
end

--[[
----------------------------------------------------------
----------------------------------------------------------
]]
function script_properties()
	
	local list = {}
	local props = obs.obs_properties_create()

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

	
  	obs.obs_property_set_modified_callback(p_b, property_onchange)
	-- Calls the callback once to set-up current visibility
  	obs.obs_properties_apply_settings(props, p_settings)
	
	return props
end

--[[
----------------------------------------------------------
A function named script_defaults will be called to set the default settings
----------------------------------------------------------
]]
function script_defaults(settings)
	--obs.obs_data_set_default_string(settings, "muted_color", "Stand-By")
	--obs.obs_data_set_default_int(settings, "active_color", active_color)
	--obs.obs_data_set_default_bool(settings, "disable_script", false)
end

local function source_click(calldata)
	print("receive source_click")
	local source = obs.calldata_source(calldata, "source")
	local name = obs.obs_source_get_name(source)
	print(name .. " " .. obs.obs_source_get_id(source))
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
	--local sh = obs.obs_get_signal_handler()
	-- signals sent
	--obs.signal_handler_add(sh, "void lua_check_source_mouse_click(ptr source)")
			local sources = obs.obs_enum_sources()
		if sources ~= nil then
			for _, source in ipairs(sources) do
				local name = obs.obs_source_get_name(source)
				local id = obs.obs_source_get_id(source)
				local display_name = obs.obs_source_get_display_name(id)
				local flags = obs.obs_source_get_output_flags(source)
				
				--print(bit.band(flags, obs.OBS_SOURCE_INTERACTION)..' '..name)
				local sh = obs.obs_get_signal_handler()
				if bit.band(flags, obs.OBS_SOURCE_INTERACTION) ~= 0 then
					local sourcedata = obs.calldata()
					obs.calldata_init(sourcedata)
					obs.calldata_set_ptr(sourcedata, "source", source)
					obs.signal_handler_signal(sh, "source_click", sourcedata)
					obs.calldata_free(sourcedata)
				end
				
			end	
		end	
	obs.source_list_release(sources)
	local sh = obs.obs_get_signal_handler()
	obs.signal_handler_add(sh, "void source_click(ptr source, bool clicked)")
	obs.signal_handler_connect(sh, "source_click", source_click)

end