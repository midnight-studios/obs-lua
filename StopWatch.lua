--[[
----------------------------------------------------------
Simple Stop Watch Version 0.1
----------------------------------------------------------
]]
obs           		= obslua
last_text    		= ""
source_name   		= ""
warning_text		= ""
caution_text		= ""
default_text   		= "00:00:00,00"
cur_seconds   		= 0
orig_time     		= 0
time_frequency 		= 0
completed_cycles	= 0
ns_last				= 0
timer_cycle    		= 10 --milliseconds 
normal_color		= 0xFFFFFFFF
caution_color		= 0x40f3ed
warning_color		= 0x05055a 
warning_activated  	= false
activated     		= false
timer_active  		= false
reset_activated    	= false
start_on_visible  	= false
disable_script   	= false
hotkey_id_reset     = obs.OBS_INVALID_HOTKEY_ID
hotkey_id_pause     = obs.OBS_INVALID_HOTKEY_ID

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
----------------------------------------------------------
	Assign a default Frequency based on the Frame Rate
----------------------------------------------------------
]]
function assign_default_frequency()
	time_frequency = (1/obs.obs_get_active_fps())
end	

--[[
----------------------------------------------------------
	Used this in testing to measure accuracy

	The Text Source and the Log should produce the same value
	The Text source is updated by the time function while the bedug 
	uses start and end timestamps to get a value
----------------------------------------------------------
]]
function get_time_lapsed()
	local ns = obs.os_gettime_ns()
	local delta = (ns/1000000000.0) - (orig_time/1000000000.0)
	return TimeFormat(delta)
end	

--[[
----------------------------------------------------------
	The true frequency between cycles varies due to script
	and system task processing, therefore a static frequency
	will produce inaccuarte results over time. 

	Start with a default frequency of 1 second devided by
	the assigned active fps and then update the frequency 
	calculated from the difference between cycles for the 
	previous and current cycle using high-precision system 
	time, in nanoseconds.

	It should be noted, the frequency is based on the
	script defined cycle time, which in this case is 
	10 microseconds. Based on testing 10 Microseconds is the
	fastest cycle supported in OBS lua.
----------------------------------------------------------
]]
function get_frequency(previous)
	local ns = obs.os_gettime_ns()
	ns_last = ns
	local f = (ns/1000000000.0) - (previous/1000000000.0)
	if f > 1 then f = time_frequency end
	return f	
end

--[[
----------------------------------------------------------
	Convert Seconds to hours:minutes:seconds:miliseconds
----------------------------------------------------------
]]
function TimeFormat(time, val)
	local hour, minutes, seconds, mili = 0, 0, 0, 0
	hour = math.floor(time/3600)
	if hour < 10 then
		hour = "0"..hour
	end
	minutes = math.floor((time - math.floor(time/3600)*3600)/60)
	if minutes < 10 then
		minutes = "0"..minutes
	end
	seconds =  math.floor(time - math.floor(time/3600)*3600 - math.floor((time - math.floor(time/3600)*3600)/60)*60)
	if seconds < 10 then
		seconds = "0"..seconds
	end
	mili = math.floor((time - math.floor(time/3600)*3600 - math.floor((time - math.floor(time/3600)*3600)/60)*60 - math.floor(time - math.floor(time/3600)*3600 - math.floor((time - math.floor(time/3600)*3600)/60)*60))*100)
	if mili < 10 then
		mili = "0"..mili
	end
	
	if val == 4 then
	
		return hour..":"..minutes..":"..seconds..","..mili
					
		
	elseif  val == 3 then
	
		return hour..":"..minutes..":"..seconds
					
		
	elseif  val == 2 then
	
		return hour..":"..minutes
					
		
	elseif  val == 1 then
	
		return hour
				
		
	else
	
		return hour..":"..minutes..":"..seconds..","..mili	
					
	end	
end

--[[
----------------------------------------------------------
	Function to set the time text
----------------------------------------------------------
]]
function set_time_text()
	if reset_activated then 
		reset_activated = false
		fresh_start(true) 
	end	
	local text = tostring(TimeFormat(cur_seconds))
	local color = tostring(0x05055a)
	if text ~= last_text then
		local source = obs.obs_get_source_by_name(source_name)
		if source ~= nil then
			--
			local settings = obs.obs_data_create()
			obs.obs_data_set_string(settings, "text", text)

			if not caution_activated and not warning_activated then
				obs.obs_data_set_int(settings, "color", normal_color)
				caution_activated = true
				warning_activated = true
			end		
			if TimeFormat(cur_seconds, 3) == caution_text then
				obs.obs_data_set_int(settings, "color", caution_color)
			end	
			if TimeFormat(cur_seconds, 3) == warning_text then
				obs.obs_data_set_int(settings, "color", warning_color)
			end	
				
			
			
			obs.obs_source_update(source, settings)
			obs.obs_data_release(settings)
			obs.obs_source_release(source)
		end
	end
	last_text = text
end

--[[
----------------------------------------------------------
	Add timer here so we have a global setting
----------------------------------------------------------
]]
function start_timer()
	timer_active = true
	fresh_start(false)
	obs.timer_add(timer_callback, timer_cycle) --<- milliseconds 
end		

--[[
----------------------------------------------------------
----------------------------------------------------------
]]

function set_text_color()
end	

--[[
----------------------------------------------------------
----------------------------------------------------------
]]
function timer_callback()
	time_frequency = get_frequency(ns_last)
	cur_seconds = cur_seconds + time_frequency
	completed_cycles = completed_cycles + 1
	set_time_text()
	--log('Applied frequency', time_frequency) 
end

--[[
----------------------------------------------------------
	Called if the counter is starting fresh
----------------------------------------------------------
]]
function fresh_start(reset_curent)
	if reset_curent ~= nil then
		if reset_curent then
			cur_seconds = 0
			completed_cycles = 0
			caution_activated = false
			warning_activated = false
		end
	end
	orig_time = obs.os_gettime_ns()
end	

--[[
----------------------------------------------------------
----------------------------------------------------------
]]
function activate(activating)
	if disable_script then
		return		
	end	
	activated = activating
	if activating then	
		--obs.obs_frontend_recording_start()
		start_timer()
	else
		timer_active = false
		obs.timer_remove(timer_callback)
	end
end

--[[
----------------------------------------------------------
	Called when a source is activated/deactivated
----------------------------------------------------------
]]
function activate_signal(cd, activating)
	local source = obs.calldata_source(cd, "source")
	if source ~= nil then
		local name = obs.obs_source_get_name(source)
		if (name == source_name) then
			if start_on_visible then
				activate(activating)
			end
		end
	end
end

--[[
----------------------------------------------------------
----------------------------------------------------------
]]
function source_activated(cd)
   if disable_script then
		return		
	end
	activate_signal(cd, true)
end

--[[
----------------------------------------------------------
----------------------------------------------------------
]]
function source_deactivated(cd)
	activate_signal(cd, false)
end

--[[
----------------------------------------------------------
----------------------------------------------------------
]]
function reset(pressed)
	if not pressed then
		return
	end
	reset_activated = true
	set_time_text()
	activate(false)
end

--[[
----------------------------------------------------------
----------------------------------------------------------
]]
function reset_button_clicked(props, p)
	reset(true)
	return false
end

--[[
----------------------------------------------------------
----------------------------------------------------------
]]
function pause_button_clicked(props, p)
	on_pause(true)
	return false
end

--[[
----------------------------------------------------------
----------------------------------------------------------
]]
function on_pause(pressed)
	if not pressed then
		return
	end
	if timer_active then
		timer_active = false
		activate(false)
		--log('OBS Video Frame Time', obs.obs_get_video_frame_time())
		--log(completed_cycles..' Cycles', get_time_lapsed())	
	else
		if activated == false then
			
			activate(true)
		end	
	end
end

--[[
----------------------------------------------------------
	A function named script_properties defines the properties that the user
	can change for the entire script module itself
----------------------------------------------------------
]]
function script_properties()
	local props = obs.obs_properties_create()
	local p = obs.obs_properties_add_list(props, "source", "Timer Source", obs.OBS_COMBO_TYPE_EDITABLE, obs.OBS_COMBO_FORMAT_STRING)
	obs.obs_property_list_add_string(p, "Select", "select")
	local sources = obs.obs_enum_sources()
	if sources ~= nil then
		for _, source in ipairs(sources) do
			source_id = obs.obs_source_get_unversioned_id(source)
			if source_id == "text_gdiplus" or source_id == "text_ft2_source" then
				local name = obs.obs_source_get_name(source)
				obs.obs_property_list_add_string(p, name, name)
			end
		end
	end
	obs.source_list_release(sources)
	obs.obs_properties_add_color(props, "normal_color", "Normal Color")
	obs.obs_properties_add_color(props, "caution_color", "Caution Color")
	obs.obs_properties_add_color(props, "warning_color", "Warning Color")
	local a_caution = obs.obs_properties_add_text(props, "caution_text", "Caution Text", obs.OBS_TEXT_DEFAULT)
	local a_warning = obs.obs_properties_add_text(props, "warning_text", "Warning Text", obs.OBS_TEXT_DEFAULT)
	obs.obs_property_set_long_description(a_caution, "Use format 00:00:00 (hoursa:minutes:seconds)\n")
	obs.obs_property_set_long_description(a_warning, "Use format 00:00:00 (hoursa:minutes:seconds)\n")
	obs.obs_properties_add_button(props, "reset_button", "Reset Stopwatch", reset_button_clicked)
	obs.obs_properties_add_button(props, "pause_button", "Start/Pause Stopwatch", pause_button_clicked)
    obs.obs_properties_add_bool(props, "start_on_visible", "Start Timer on Source Visible")
    obs.obs_properties_add_bool(props, "disable_script", "Disable Script")
	return props
end

--[[
----------------------------------------------------------
	A function named script_description returns the description shown to
	the user
----------------------------------------------------------
]]
function script_description()
	return "Stopwatch"
end

--[[
----------------------------------------------------------
	A function named script_update will be called when settings are changed
----------------------------------------------------------
]]

function script_update(settings)
	assign_default_frequency()
	activate(false)
	source_name = obs.obs_data_get_string(settings, "source")
	warning_text = obs.obs_data_get_string(settings, "warning_text")
	caution_text = obs.obs_data_get_string(settings, "caution_text")
    start_on_visible = obs.obs_data_get_bool(settings,"start_on_visible")
    disable_script = obs.obs_data_get_bool(settings,"disable_script")
	reset(true)
end

--[[
----------------------------------------------------------
A function named script_defaults will be called to set the default settings
----------------------------------------------------------
]]
function script_defaults(settings)assign_default_frequency()
	assign_default_frequency()
	obs.obs_data_set_default_int(settings, "normal_color", normal_color)
	obs.obs_data_set_default_int(settings, "caution_color", caution_color)
	obs.obs_data_set_default_int(settings, "warning_color", warning_color)
	obs.obs_data_set_default_string(settings, "warning_text", "")
	obs.obs_data_set_default_string(settings, "caution_text", "")
	obs.obs_data_set_default_bool(settings, "start_on_visible", false)
	obs.obs_data_set_default_bool(settings, "disable_script", false)
end

--[[
----------------------------------------------------------
	A function named script_save will be called when the script is saved
	NOTE: This function is usually used for saving extra data (such as in this
	case, a hotkey's save data).  Settings set via the properties are saved
	automatically.
----------------------------------------------------------
]]
function script_save(settings)
	local hotkey_save_array_reset = obs.obs_hotkey_save(hotkey_id_reset)
	local hotkey_save_array_pause = obs.obs_hotkey_save(hotkey_id_pause)
	obs.obs_data_set_array(settings, "reset_hotkey", hotkey_save_array_reset)
	obs.obs_data_set_array(settings, "pause_hotkey", hotkey_save_array_pause)
	obs.obs_data_array_release(hotkey_save_array_pause)
	obs.obs_data_array_release(hotkey_save_array_reset)
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
	assign_default_frequency()
	--log('OBS Video Default Frequency', time_frequency)
	local sh = obs.obs_get_signal_handler()
	obs.signal_handler_connect(sh, "source_activate", source_activated)
	obs.signal_handler_connect(sh, "source_deactivate", source_deactivated)
	hotkey_id_reset = obs.obs_hotkey_register_frontend("reset_stopwatch_thingy", "Reset Stopwatch", reset)
	hotkey_id_pause = obs.obs_hotkey_register_frontend("pause_stopwatch_thingy", "Start/Pause Stopwatch", on_pause)
	local hotkey_save_array_reset = obs.obs_data_get_array(settings, "reset_hotkey")
	local hotkey_save_array_pause = obs.obs_data_get_array(settings, "pause_hotkey")
	obs.obs_hotkey_load(hotkey_id_reset, hotkey_save_array_reset)
	obs.obs_hotkey_load(hotkey_id_pause, hotkey_save_array_pause)
	obs.obs_data_array_release(hotkey_save_array_reset)
	obs.obs_data_array_release(hotkey_save_array_pause)
end