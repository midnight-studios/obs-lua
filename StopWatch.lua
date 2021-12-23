--[[
----------------------------------------------------------
Open Broadcaster Software®️
OBS > Tools > Scripts
@midnight-studios
Stopwatch
----------------------------------------------------------
]]
--Globals
obs           				= obslua
gversion = 2.9
luafile						= "StopWatch.lua"
obsurl						= "simple-stopwatch.1364/"
icon="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABUAAAAVCAYAAACpF6WWAAAENElEQVQ4jY1UTUgjZxh+ksl/JuMkMYb4F40bNZqK0KJFqBZqS9ddyl76dyhdKPRQShH2sNDSnnopCz11D10KS/dSKNiDoD2I7KXFQ0XSSGpM1llFMYn5mZiMY2IymfIOhgazXfaDj5n53u975vme531fnaqqeMHxJYCvAOgAlABcAyA1jxLO1tYW1tbWoL+Kd3x8jGg0imw2C0VRWkMEYgNgBeAFYKTFRqOh7aVnE9xwFTSZTGJ7exszMzPQ6XSQZRk8z9P7YrVa/Y5hmKLBYHCpqirW63Wcn5/j7OwMHo9HA6bvNqY2mw1Op1N70qaTkxPkcjmbLMsDZrN5hOO4NxuNhlMUxTFiSCA0FEW5GQ6H/wmHwzfamDavUKlUYDKZAoFA4Gue52/r9f/9v6OjQ5uKojwpFAr3RFF8UCwWjW63OzQ/P/9yGyiBnZ6eEtN3eZ7/9XJZrlQqP2cymcf5fL4QDAbHdTrd2yzLXvd4PD9yHHdLEISFXC7nsdvtuTb3c7kcEokEJiYmhliWtaiqWs5ms4f1el0lE2lOTU0hn8/DYrF09vb23jebze9JkvRXNBqdMpvNaIJaLh1tHScAzpvsSd+joyOkUimEQiFNa4vFAlEU4Xa7HwYCgduFQuHRxsbGx5p+qqq+o/7/SF7uQSaTwcHBgZYdgiBMqKqa2dnZ8S8tLaFcLicIIR6PjzU13Qew+gzPKNEj9JJOp5tag+O41/v7+x/v7u7+sLOzc8BxHN1icXR0dMXlcn3xQhW1v7+PSCSC6enptxwOx3WWZRcbjcbTjY2NAJ1nWRYGgwHj4+OqoigFYnr/UlPlClYFwJ1arVYjU8bGxhZ8Pt9KMxiLxd5gGEbTlTSv1WqQJOmJw+G4RqCfPYfkN4qiFDs7O9HT0/Nqa4BhmKd2u10DrFaruLi4oJmncibQSUCrLHJabDlHzItGo1E7FIvFvg+FQjMmkykkCMK9eDwOivl8PvqhBspxXJAOEujfz2HazzBMdXh4OJNMJoupVGre7/cbBEGor6+vY2RkROsLlwY6jUajS5KkSGvtf0oVemUeAPiDgsFgUHMeQJ3MmZycxNzcnMZWkiT4/f67FJRl+UFrmcYB/N7y3UyLSHOBzNjb20MgEMDg4CC6urqwublJZo12d3ffVRRFEQTh4TNTqlQqaawoTShOVdOsqMPDQ8zOzmqFQK3PZrO91NPTs2U0GkmWG4lEYrWt9cViMSwvL1Ntvw9gRafT/aTX6z8AwFKcuhU5zjDMkNfr/XZgYCBKgMfHx3eSyeSqw+Fob9LEipxMp9MRp9P5uclkWuB5/hOKWa3Wvb6+vjLP8wNer5fXUkRRLkql0ofZbPY3ug019TZQ6jKU0AzD7Iqi+Josy6+4XK6P7Hb7LbvdPkS5SXpXKpU/ZVn+5ezs7FG9Xi9brVZNLr1ej38BVDs6EbSfFQsAAAAASUVORK5CYII="
desc	    				= [[
<hr/><center><h2>Advanced Stopwatch</h2>( Version: %s )</center>
<br><center><img width=38 height=42 src=']] .. icon .. [['/></center>
<br><center><a href="https://github.com/midnight-studios/obs-lua/blob/main/]] .. luafile ..[[">Find it on GitHub</a></center>
<br><p>The Properties for this script will adjust visibility as needed. Some advanced properties will only be visible if the Configuration is set to "Advanced". If the Configuration is set to "Basic" the defined values will still be used, so ensure you define those correctly.</p><p>Find help on the <a href="https://obsproject.com/forum/resources/]] .. obsurl ..[[">OBS Forum Thread</a>.</p><hr/>]]
last_text    				= ""
font_normal					= "#ffffff"
font_dimmed					= "#bfbbbf"
timer_source   				= ""
countdown_type 				= ""
cur_seconds   				= 0
def_seconds   				= 0
split	     				= 0
timer_year	     			= 0
timer_month	     			= 0
timer_day	     			= 0
timer_hours	     			= 0
timer_minutes 	     		= 0
timer_seconds	     		= 0
split_itm					= {}
split_data					= nil
p_settings 					= nil
p_prop 						= nil
longtimetext_s 				= ""
longtimetext_p 				= ""
last_split_data 			= ""
split_type   				= ""
split_source   				= ""
active_source  				= ""
timer_type   				= 0
next_scene					= ""
start_recording				= 0
recording_type				= 0
stop_text					= ""
orig_time     				= 0
time_frequency				= 0
completed_cycles			= 0
ns_last					= 0
cycle_index 				= 0
timer_cycle 				= 10 --milliseconds
activated     				= false
timer_active  				= false
reset_activated			= false
start_on_visible  			= false
disable_script   			= false
media = {
warning_text				= "",
caution_text				= "",
source_name_audio_warning	= "",
source_name_audio_caution	= "",
warning_activated			= false,
caution_activated			= false, 
cur_seconds_caution			= 0,
cur_seconds_warning			= 0, 
caution_duration			= 0, 
warning_duration			= 0, 
normal_color				= 0xFFFFFFFF,
caution_color				= 0x40f3ed,
warning_color				= 0x05055a, 
last_state_caution			= obs.OBS_MEDIA_STATE_NONE,
last_state_warning			= obs.OBS_MEDIA_STATE_NONE
}
hotkey_id_reset			= obs.OBS_INVALID_HOTKEY_ID
hotkey_id_pause			= obs.OBS_INVALID_HOTKEY_ID
hotkey_id_split			= obs.OBS_INVALID_HOTKEY_ID
--[[
----------------------------------------------------------
-- Use this to create a Script Log Output used in testing
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
----------------------------------------------------------
-- Get the name of this script
----------------------------------------------------------
]]
function filename() 
	local str = debug.getinfo(2).source:sub(2) 
	return str:match("^.*/(.*).lua$") or str 
end
--[[
----------------------------------------------------------
	A function named script_description returns the description shown to
	the user
----------------------------------------------------------
]]
function script_description()
	return string.format( desc, tostring( gversion ) )
end
--[[
----------------------------------------------------------
	Assign a default Frequency based on the Frame Rate	
	video_info.base_width
	video_info.base_height
	video_info.fps_den
	video_info.output_width
	video_info.output_height
	video_info.range
	video_info.colorspace
----------------------------------------------------------
]]
function assign_default_frequency()
	local fps = 60 -- 60 is the maximum supported frame rate
	local video_info = obs.obs_video_info()
    if obs.obs_get_video_info(video_info) then
		fps = video_info.fps_num		
	end
	time_frequency = ( 1/fps )
end	
--[[
----------------------------------------------------------
	Used this in testing to measure accuracy

	The Text Source and the Log should produce the same value
	The Text source is updated by the time function while the dedug 
	uses start and end time stamps to get a value
----------------------------------------------------------
]]
function get_time_lapsed()
	local ns = obs.os_gettime_ns()
	local delta = ( ns/1000000000.0 ) - ( orig_time/1000000000.0 )
	return TimeFormat( delta )
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
	10 miliseconds. Based on testing 10 Miliseconds is the
	fastest cycle supported in OBS lua.
----------------------------------------------------------
]]
function get_frequency( previous )
	local ns = obs.os_gettime_ns()
	ns_last = ns
	local f = ( ns/1000000000.0 ) - ( previous/1000000000.0 )
	if f > 1 then f = time_frequency end
	return f	
end

--[[
----------------------------------------------------------
	Convert Seconds to hours:minutes:seconds:miliseconds
----------------------------------------------------------
]]
function delta_time(year, month, day, hour, minute, second)
	local now = os.time()
	if (year == -1) then
		year = os.date("%Y", now)
	end
	if (month == -1) then
		month = os.date("%m", now)
	end
	if (day == -1) then
		day = os.date("%d", now)
	end
	local future = os.time{year=year, month=month, day=day, hour=hour, min=minute, sec=second}
	local seconds = os.difftime(future, now)
	if (seconds < 0) then
		seconds = 0
	end
	return seconds 
end

--[[
----------------------------------------------------------
	
----------------------------------------------------------
]]
function trim_time( hour, minutes, seconds, mili, trim )
	local format_hour, 
	format_minutes, 
	format_seconds, 
	format_mili = 
	( hour and "%02d" or "" ),
	( minutes and ":%02d" or "" ),
	( seconds and ":%02d" or "" ),
	( mili and ",%02d" or "" ) 
	local time = string.format( format_hour..format_minutes..format_seconds..format_mili, hour, minutes, seconds, mili )
	if trim then
		return time
	end	
	if hour == 0 then
		time = string.format( "%02d:%02d"..format_mili, minutes, seconds, mili )
	end
	if hour == 0 and minutes == 0 then
		time = string.format( "%02d"..format_mili, seconds, mili )
	end
	if hour == 0 and minutes == 0 and seconds == 0 then
		format_mili = ( mili and "%02d" or "" )
		time = string.format( format_mili, mili )
	end
	return trim_zero( time )
end
--[[
----------------------------------------------------------
	
----------------------------------------------------------
]]
function trim_zero( int )
   while true do 
      if int:sub( 1,1 ) == '0' then 
         int = int:sub( 2 )
      else
         break
      end
   end   
   return int
end

--[[
----------------------------------------------------------
	Function to set the split time text
----------------------------------------------------------
]]
function set_split_text( source_name )
	if source_name == 'Select' then
		return
	end	
	if reset_activated then 
		reset_activated = false
		fresh_start( true ) 
	end	
	local text = split_data
	if text ~= last_split_data then
	set_text( source_name, text )
	end
	last_split_data = text
end
--[[
----------------------------------------------------------
	Function to set the source text
----------------------------------------------------------
]]
function set_text( source_name, text )
	if source_name == 'Select' or  source_name == 'select'then
		return
	end	

	--[[
		Increments the source reference counter, 
		use obs_source_release() to release it when complete.
	]]
	local source = obs.obs_get_source_by_name( source_name )
	if source ~= nil then
		local settings = obs.obs_source_get_settings( source )
		obs.obs_data_set_string( settings, "text", text )	
	end
		obs.obs_source_update( source, settings )
		obs.obs_data_release( settings )
		obs.obs_source_release( source )
end
--[[
----------------------------------------------------------
----------------------------------------------------------
]]
function wait( ms )
	if ms ~= nil then
    local start = math.floor( ( obs.os_gettime_ns()/1000000 ) )
    repeat until ( math.floor( ( obs.os_gettime_ns()/1000000 ) )-start ) >= ms 
	end 
end
--[[
----------------------------------------------------------
	"Timer Expires" 	= 1 
	"Caution Time" 		= 2 
	"Warning Time" 		= 3 
	"Timer Visible" 	= 4 
	"Timer Start" 		= 5
----------------------------------------------------------
]]
function record( mark, ms )
	if timer_type ~= 2 then return end
	if start_recording == 1 and mark == recording_type then
		obs.obs_frontend_recording_start()
	end
	
	if ms ~= nil then wait( ms ) end 
end	

--[[
----------------------------------------------------------
	Only used in Countdown mode
----------------------------------------------------------
]] 
function timer_ended( source_name )
	delayed_recording()
	if next_scene == "" or next_scene == "Select" then
		return
	end	
	if next_scene ~= "TIMER END TEXT" and next_scene ~= "Source List"  and next_scene ~= "Scene List" then
		set_visible( timer_source, false ) -- last thing, set visibility of timer to hide
		--[[
			Increments the source reference counter, 
			use obs_source_release() to release it when complete.
		]]
		local source = obs.obs_get_source_by_name( next_scene )
		obs.obs_frontend_set_current_scene( source )
		obs.obs_source_release( source )
		fresh_start( true ) 
		--obs.remove_current_callback()
	end
	if next_scene == "Source List" then
		reset( true )
		cycle_list_activate( 'source' )
		on_pause( true )
	end	
	if next_scene == "Scene List" then
		reset( true )
		cycle_list_activate( 'scene' )
		on_pause( true )
	end	
	if next_scene == "TIMER END TEXT" then
		local text = stop_text
		set_text( source_name, text )
	end	
end	

--[[
----------------------------------------------------------
	Function  
----------------------------------------------------------
]]
function cycle_list_activate(source_type)
	
	local list = {}
	
	if source_type ~= "source" then
		
		local scenes = obs.obs_frontend_get_scene_names(  )

		if scenes ~= nil then
			for _, scene in pairs( scenes ) do
				if name ~= scene then
					list[scene] = scene
				end
			end
			obs.bfree( scene )
		end	
	else
		list = {}
		local sources = obs.obs_enum_sources()
		if sources ~= nil then
			for _, source in pairs( sources ) do
				local name = obs.obs_source_get_name( source )
				list[name] = name
			end
		end	
		obs.source_list_release( sources )		
	end

		cycle_list = obs.obs_data_get_array( p_settings, "cycle_list" )

		local count = obs.obs_data_array_count(cycle_list) - 1;
			
		for i = 0, count do 

			local item = obs.obs_data_array_item(cycle_list, cycle_index);

			local value = obs.obs_data_get_string(item, "value");
		
			cycle_index = cycle_index + 1

			if cycle_index > count then
				cycle_index = 0
			end	
		
			if list[value] ~= nil then
			
				if source_type ~= "source" then
					local scene_source = obs.obs_frontend_get_current_scene()
					local name = obs.obs_source_get_name( scene_source )
    				obs.obs_source_release( scene_source )
				
					if name == list[value] then 
						-- goto next			
					else
						local source = obs.obs_get_source_by_name( list[value] )
						if source ~= nil then
							obs.obs_frontend_set_current_scene( source )
						end
						obs.obs_source_release( source )
						set_text( active_source, list[value] )
						break	
					end	
			
				else
					if is_visible(list[value]) then 
						-- goto next			
					else
						set_visible( list[value], true )
						set_text( active_source, list[value] )
						break
					end
				end			
			
			end	

		end

		obs.obs_data_array_release(cycle_list)	
end	

--[[
----------------------------------------------------------
	Convert Seconds to hours:minutes:seconds:miliseconds
----------------------------------------------------------
]]
function TimeFormat( time, notrim )
	if time == nil then
		return
	end
	local trim = ( timer_trim == 1 )
	local hour, minutes, seconds, mili = 0, 0, 0, 0
	--[[
		If there is more than 24 hours in the time value
		we need to remove the additional time value to leave only a 23:59:59
		value. We will do this by calculating days
	]]
	-- If there is more than 24 hours, remove 23:59:59 as it will be in the clock 
	if time > 86399 then -- 23:59:59
		local c_time = ( math.floor( (time ) / 86400 ) * 86400 )
		time = time - c_time
	end
	hour = math.floor( time/3600 )
	if hour < 10 and trim then
		hour = "0"..hour
	end
	minutes = math.floor( ( time - math.floor( time/3600 )*3600 )/60 )
	if minutes < 10 and trim then
		minutes = "0"..minutes
	end
	seconds =  math.floor( time - math.floor( time/3600 )*3600 - math.floor( ( time - math.floor( time/3600 )*3600 )/60 )*60 )
	if seconds < 10 and trim then
		seconds = "0"..seconds
	end
	mili = math.floor( ( time - math.floor( time/3600 )*3600 - math.floor( ( time - math.floor( time/3600 )*3600 )/60 )*60 - math.floor( time - math.floor( time/3600 )*3600 - math.floor( ( time - math.floor( time/3600 )*3600 )/60 )*60 ) )*100 )
	if mili < 10 and trim then
		mili = "0"..mili
	end 
	if notrim then
		return trim_time( hour, minutes, seconds, nil, true )		
	end	
	return trim_time( hour, minutes, seconds, ( ( timer_trim ~= 3 ) and mili or nil ), trim )
end

--[[
----------------------------------------------------------
	
----------------------------------------------------------
]]
function LongTimeFormat( time )
	local c_time = time
	-- If there is more than 24 hours, remove 23:59:59 as it will be in the clock 
	if time > 86399 then -- 23:59:59
		c_time = math.floor( ( time ) / 86400)
	end
	if time < 86400 then
		c_time = 0
	end
	return c_time
end

--[[
----------------------------------------------------------
	Function to set the time text
----------------------------------------------------------
]]
function set_time_text( source_name )
	if reset_activated then 
		reset_activated = false
		fresh_start( true ) 
	end	
	if cur_seconds <= 0.01 and timer_type ~= 1 then cur_seconds = 0 end
	local text = tostring( TimeFormat( cur_seconds ) )
	--[[
		Format the Text 'Day/Days'
	]]
	if timer_type == 2 and countdown_type == 1 and cur_seconds ~= 0 then
		local longtimetext = longtimetext_p
		if math.floor( cur_seconds / 86400 ) <= 1 then
			longtimetext = longtimetext_s
		end
		if math.floor( cur_seconds / 86400 ) <= 0 then
			longtimetext = longtimetext_p
		end		
		text = LongTimeFormat( cur_seconds ) .. longtimetext .. text
	end
	
	text = text_prefix .. text
	
	if text ~= last_text then
		--[[
			Increments the source reference counter, 
			use obs_source_release() to release it when complete.
		]]		
		local source = obs.obs_get_source_by_name( source_name )
		if source ~= nil then
			local settings = obs.obs_source_get_settings( source )
			obs.obs_data_set_string( settings, "text", text )
			if not media['caution_activated'] and not media['warning_activated'] then
				obs.obs_data_set_int( settings, "color", media['normal_color'] )
			end		
			media_activate( settings, 'caution' )
			media_activate( settings, 'warning' )
		end
			obs.obs_source_update( source, settings )
			obs.obs_data_release( settings )
			obs.obs_source_release( source )
	end
	stop_media( 'caution' )
	stop_media( 'warning' )
	last_text = text
		if cur_seconds <= 0.01 and timer_type ~= 1 then
		activate( false, true )
		--[[
		Timer Ended
		]]--
		timer_ended( source_name )
	end	
end
--[[
----------------------------------------------------------
	
----------------------------------------------------------
]]
function media_activate( settings, ref )
	if TimeFormat( cur_seconds, true ) == media[ref..'_text'] then
		obs.obs_data_set_int( settings, "color", media[ref..'_color'] )
		media['cur_seconds_'..ref] = cur_seconds
		media[ref..'_activated'] = true
		start_media( media['source_name_audio_'..ref], ref )
		if ref == 'caution' then record( 2 ) end 
		if ref == 'warning' then record( 3 ) end 
	end		
	return settings
end

--[[
----------------------------------------------------------
	
----------------------------------------------------------
]]
function start_media( source_name, ref )
start_media_action( source_name, ref )
end

--[[
----------------------------------------------------------
	Set source visble = true
----------------------------------------------------------
]]
function start_media_action( source_name, ref )
	if source_name == nil or source_name  == "None" then
		return
	end		
	if media[ref..'_activated'] then set_visible( source_name, true ) end
end
--[[
----------------------------------------------------------
	Stop Media is designed to reset the Source to the
	starting state. In other words, make the source
	invisible again. This sould only happen if the media
	ended, or if it is looped, end the media after a
	defined time.
----------------------------------------------------------
]]
function stop_media( ref, bypass )
	if bypass then -- No checks, just stop it
		set_visible( media['source_name_audio_'..ref], false )
	else -- do some checks
		stop_media_action( ref )	
	end	
end

--[[
----------------------------------------------------------
	Check if the source state changed, 
	if so, set source visble = false
----------------------------------------------------------
]]
function stop_media_action( ref )
	local source_name = media['source_name_audio_'..ref]
	if source_name == nil or source_name  == "None" then
		return
	end	
	--[[
		Increments the source reference counter, 
		use obs_source_release() to release it when complete.
		
		we got a source name, let's see if it exist...
	]]
    local source = obs.obs_get_source_by_name( source_name )	
    if source ~= nil then -- source is valid
        local state = obs.obs_source_media_get_state( source ) -- get the current state for the source
		if media['last_state_'..ref] ~= state then -- The state has changed
			if get_source_looping( source_name ) then
				--log( 'is looped', source_name )
				if state == obs.OBS_MEDIA_STATE_PLAYING  then
					-- The source is looping, it will never stop
					if source_name == media['source_name_audio_'..ref] then
						local time_remaining = math.floor( media['cur_seconds_'..ref] ) + math.floor( media[ref..'_duration'] ) - math.floor( cur_seconds )
						local time_end = ( time_remaining <= 0 )
						if time_end then
							media['last_state_'..ref] = state
							set_visible( source_name, false )
						end 	
					end
				end
			else
				--log( 'not looped', source_name )
				media['last_state_'..ref] = state
				if state == obs.OBS_MEDIA_STATE_STOPPED or state == obs.OBS_MEDIA_STATE_ENDED then
					set_visible( source_name, false )
				end
			end	
		end	 
    end
    obs.obs_source_release( source )
end

--[[
----------------------------------------------------------
	
----------------------------------------------------------
]]
function get_source_looping( source_name )
	local property = "looping"
	--[[
		Increments the source reference counter, 
		use obs_source_release() to release it when complete.
		
		we got a source name, let's see if it exist...
	]]	
	local source = obs.obs_get_source_by_name( source_name )	
	local enabled = false 
    if source ~= nil then
		local source_id = obs.obs_source_get_unversioned_id( source )
			if source_id == "ffmpeg_source" then
				local s = obs.obs_source_get_settings( source )
				--local prop = obs.obs_data_get_string( s, property )
				enabled = obs.obs_data_get_bool( s, property )
				obs.obs_data_release( s )
			end
	end
    obs.obs_source_release( source )
	return enabled
end	

--[[
----------------------------------------------------------
	set source visibility
----------------------------------------------------------
]]

--[[
----------------------------------------------------------
	set source visibility
----------------------------------------------------------
]]
function set_visible( target_name, visible )
	local scenes = obs.obs_frontend_get_scenes()
	if scenes ~= nil then
		for i, scn in ipairs( scenes ) do	
			local scene = obs.obs_scene_from_source( scn )
			local sceneitem = obs.obs_scene_find_source_recursive( scene, target_name )
			if sceneitem ~= nil then
				obs.obs_sceneitem_set_visible( sceneitem, visible )
				break	
			end	
		end --end for
		obs.bfree( scn )
		obs.source_list_release( scenes )		
	end
end
--[[
----------------------------------------------------------
	set source visibility
----------------------------------------------------------
]]
function is_visible( target_name )
	local isvisible = false
	local scenes = obs.obs_frontend_get_scenes()
	if scenes ~= nil then
		for i, scn in ipairs( scenes ) do	
			local scene = obs.obs_scene_from_source( scn )
			local sceneitem = obs.obs_scene_find_source_recursive( scene, target_name )
			if sceneitem ~= nil then
				isvisible = obs.obs_sceneitem_visible( sceneitem )
				break	
			end	
		end --end for
		obs.bfree( scn )
		obs.source_list_release( scenes )		
	end
	
	return isvisible
end
--[[
----------------------------------------------------------
----------------------------------------------------------
]]
function delayed_recording()
	obs.timer_add( recording_callback, 100 ) --<- milliseconds 
end	
--[[
----------------------------------------------------------
----------------------------------------------------------
]]
function recording_callback()
	obs.timer_remove( recording_callback )
	record( 1 )
end
--[[
----------------------------------------------------------
	Add timer here so we have a global setting
----------------------------------------------------------
]]
function start_timer()
	record( 5, 100 ) -- wait 100 miliseconds
	timer_active = true
	fresh_start( false )
	obs.timer_add( timer_callback, timer_cycle ) --<- milliseconds 
end		

--[[
----------------------------------------------------------
	Add timer here so we have a global setting
----------------------------------------------------------
]]
function timer_callback()
	time_frequency = get_frequency( ns_last )
	calculate()
	completed_cycles = completed_cycles + 1
	set_time_text( timer_source )
	--log( 'Applied frequency', time_frequency ) 
end

--[[
----------------------------------------------------------
----------------------------------------------------------
]]
function calculate()
	if timer_type ~= 2 then
		cur_seconds = cur_seconds + time_frequency
	else
		cur_seconds = cur_seconds - time_frequency
	end
end	
--[[
----------------------------------------------------------
	Called if the counter is starting fresh
----------------------------------------------------------
]]
function fresh_start( reset_curent )

	if timer_type == 2 and countdown_type == 1 then
		cur_seconds = delta_time( timer_year, timer_month, timer_day, timer_hours, timer_minutes, timer_seconds)
		def_seconds = cur_seconds
	end
	
	if reset_curent ~= nil then
		if reset_curent then
			cur_seconds = def_seconds
			completed_cycles = 0
			split = 0
			split_itm = {}
			split_data = nil
			media['caution_activated'] = false
			media['warning_activated'] = false
		end
	end
	orig_time = obs.os_gettime_ns()
end	

--[[
----------------------------------------------------------
----------------------------------------------------------
]]	
function timer_caution_media_end_callback()
	set_visible( media['source_name_audio_caution'], false )	
	obs.remove_current_callback()
end	
--[[
----------------------------------------------------------
----------------------------------------------------------
]]	
function timer_warning_media_end_callback()
	set_visible( media['source_name_audio_warning'], false )
	obs.remove_current_callback()
end	
--[[
----------------------------------------------------------
----------------------------------------------------------
]]	
function disconnect_after_media_end( ref )
	
	local source_name = media['source_name_audio_'..ref] 
	
	source = obs.obs_get_source_by_name( source_name ) -- Increments the source reference counter, use obs_source_release() to release it when complete.  	--[[
	--[[
		Found Source:
	]]
	if source ~= nil then   
		
		local state = obs.obs_source_media_get_state( source ) -- get the current state for the source
				
			if get_source_looping( source_name ) then -- The source is looping, it will never stop
				
				if ref == "caution" then
					obs.timer_add( timer_caution_media_end_callback, math.floor( media[ref..'_duration'] * 1000 ) ) --<- milliseconds
				end
			
				if ref == "warning" then
					obs.timer_add( timer_warning_media_end_callback, math.floor( media[ref..'_duration'] * 1000 ) ) --<- milliseconds
				end
			 
			else
				--[[
				Create a signal handler for the source
				]]
				local sh = obs.obs_source_get_signal_handler( source )	
				--[[
					https://obsproject.com/docs/reference-sources.html?highlight=media_started
					attach event listener callback [source_signal]: Called when media has ended.
				]]	
				obs.signal_handler_connect( sh, "media_ended", signal_media_ended )		
			end
	end
end
--[[
----------------------------------------------------------
----------------------------------------------------------
]]	
function signal_media_ended( cd )
	--[[
		Get source from CallData
	]]
	local source = obs.calldata_source( cd, "source" )
	--[[
		Found Source:
	]]
	if source ~= nil then 
		local name = obs.obs_source_get_name( source )
		set_visible( name, false )
		obs.remove_current_callback()
	end	
end
--[[
----------------------------------------------------------
----------------------------------------------------------
]]
function activate( activating, timer_expired )
	if disable_script then
		return		
	end	
	activated = activating
	if activating then	
		--obs.obs_frontend_recording_start()
		start_timer()
	else
		if timer_expired then
			obs.timer_remove( timer_callback )
			disconnect_after_media_end( 'caution' )
			disconnect_after_media_end( 'warning' )
		else
			timer_active = false
			obs.timer_remove( timer_callback )
			stop_media( 'caution',true )
			stop_media( 'warning',true )	
		end
	end
end

--[[
----------------------------------------------------------
	Called when a source is activated/deactivated
----------------------------------------------------------
]]
function activate_signal( cd, activating )
	local source = obs.calldata_source( cd, "source" )
	if source ~= nil then
		local name = obs.obs_source_get_name( source )
		if ( name == timer_source ) then
			if activating then record( 4, 300 ) end
			if start_on_visible then
				fresh_start( true )
				activate( activating )
			end
		end
	end
end

--[[
----------------------------------------------------------
----------------------------------------------------------
]]
function source_activated( cd )
   if disable_script then
		return		
	end
	activate_signal( cd, true )
end

--[[
----------------------------------------------------------
----------------------------------------------------------
]]
function source_deactivated( cd )
	activate_signal( cd, false )
end

--[[
----------------------------------------------------------
----------------------------------------------------------
]]
function reset( pressed )
	if not pressed then
		return
	end
	reset_activated = true
	set_time_text( timer_source )
	activate( false )
	set_split_text( split_source )
	
	set_text( active_source, "" )
end

--[[
----------------------------------------------------------
----------------------------------------------------------
]]
function reset_button_clicked( props, p )
	reset( true )
	return false
end

--[[
----------------------------------------------------------
----------------------------------------------------------
]]
function pause_button_clicked( props, p )
	on_pause( true )
	return false
end

--[[
----------------------------------------------------------
----------------------------------------------------------
]]
function on_pause( pressed )
	if not pressed then
		return
	end
	
	set_visible( timer_source, true )
	
	if timer_active then
		timer_active = false
		activate( false )
		split_unpack()
		set_split_text( split_source )
		--log( 'OBS Video Frame Time', obs.obs_get_video_frame_time() )
		--log( completed_cycles..' Cycles', get_time_lapsed() )	
	else
		if activated == false then	
			activate( true )
		end	
	end
end

--[[
----------------------------------------------------------
----------------------------------------------------------
]]
function split_button_clicked( props, p )
	on_split( true )
	return false
end

--[[
----------------------------------------------------------
----------------------------------------------------------
]]
function on_split( pressed )
	if not pressed then
		return
	end
	if timer_active then
		split = split + 1
		split_itm[split] = cur_seconds
		split_unpack()
		set_split_text( split_source )
	end
end

--[[
----------------------------------------------------------
	This captures the split times and unpack it in the
	correct format.

	The text source only permits linebreaks ( '\n' ) this 
	limitation affects how the data can be formated  ):
----------------------------------------------------------
]]
function split_unpack()
	local data = nil
	local c = table.getn( split_itm )
	local text = ''
	local title = ''
	local subtitle = ''
	local line = '______________________________'
    for i = 1,c do 
		local mark = split_itm[i]
		local interval = mark
		if i > 1 then
			local j = i - 1 
			interval = split_itm[i] - split_itm[j]
		end
		if split_type == 'Interval' then
			title = 'Interval'
			--subtitle = ''
			text = tostring( TimeFormat( interval ) )
		elseif split_type == 'Mark' then
			title = 'Mark'
			--subtitle = ''
			text = tostring( TimeFormat( mark ) )
		elseif split_type == 'Mark Interval' then
			title = 'Mark                     '
			subtitle = 'Interval'
			text = tostring( TimeFormat( mark )..'          '..TimeFormat( interval ) )
		else	--	"Interval Mark"
			title = 'Interval                  '
			subtitle = 'Mark'
		text = tostring( TimeFormat( interval )..'          '..TimeFormat( mark ) )
		end	
		-- data collection here
		local n = i --formatting the index number
		if i < 10 then n = '0'..tostring( i ) end
		if data ~= nil then 	
			data = data .. '\n' .. n..' )    '..text
		else
			data = '#       '..title..subtitle..'\n'..line..'\n\n'..n..' )    '..text
		end
	end	-- end for
	split_data = data
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
--------------------------------------------------------------------
 custom function: helper
----------------------------------------------------------
]]
function in_table( tbl, value )
	--if debug > 1 then print( "function: in_table()" ) end 
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
----------------------------------------------------------

----------------------------------------------------------
]]
function is_leap_year(year)
	if year % 4 == 0 then
		if year % 100 == 0 then
			if year % 400 == 0 then
			  return true
			else
			  return false
			end			
		else
		 return true
		end
	else
		return false
	end						
end	
--[[
----------------------------------------------------------
Callback on list modification
----------------------------------------------------------
]]
function property_onchange( props, property, settings )
	-- Retrieves value selected in list
	local config = obs.obs_data_get_int( settings, "config" )
	local mode = obs.obs_data_get_int( settings, "timer_type" )
	local rec = obs.obs_data_get_int( settings, "start_recording" )
	local scene = obs.obs_data_get_string( settings, "next_scene" )	
	local t_source = obs.obs_data_get_string( settings, "timer_source" )
	local a_source = obs.obs_data_get_string( settings, "active_source" )
	local mth = obs.obs_data_get_int( settings, "month" )
	local yr = obs.obs_data_get_int( settings, "year" )
	local c_type = obs.obs_data_get_int( settings, "countdown_type" )
	obs.obs_property_set_visible( obs.obs_properties_get( props, "stop_text" ), false )
	obs.obs_property_set_visible( obs.obs_properties_get( props, "text_prefix" ), false )
	obs.obs_property_set_visible( obs.obs_properties_get( props, "recording_type" ), false )
	obs.obs_property_set_visible( obs.obs_properties_get( props, "cycle_list" ), ( (scene == 'Source List' or scene == 'Scene List') and config == 2 ) )
	
	obs.obs_property_set_visible( obs.obs_properties_get( props, "day_text" ), ( c_type == 1 and config == 2 and mode == 2 ) )
	obs.obs_property_set_visible( obs.obs_properties_get( props, "days_text" ), ( c_type == 1 and config == 2 and mode == 2 ) )
	obs.obs_property_set_visible( obs.obs_properties_get( props, "month" ), ( c_type == 1 and config == 2 and mode == 2 ) )
	obs.obs_property_set_visible( obs.obs_properties_get( props, "day" ), ( c_type == 1 and config == 2 and mode == 2 ) )
	obs.obs_property_set_visible( obs.obs_properties_get( props, "year" ), ( c_type == 1 and config == 2 and mode == 2 ) )
	
	obs.obs_property_set_visible( obs.obs_properties_get( props, "month" ), ( c_type == 1 and config == 2 and mode == 2 ) )

	
	if mth ~= 1 then
	obs.obs_property_set_enabled( obs.obs_properties_get( props, "day" ), true )
	obs.obs_property_set_enabled( obs.obs_properties_get( props, "year" ), true )
	else
	obs.obs_property_set_enabled( obs.obs_properties_get( props, "day" ), false )
	obs.obs_property_set_enabled( obs.obs_properties_get( props, "year" ), false )
	end
	
	obs.obs_property_int_set_limits(obs.obs_properties_get( props, "day" ), 1, 31, 1)
	
	if ( mth == 5 or mth == 7 or mth == 10 or mth == 12 ) then
		obs.obs_property_int_set_limits(obs.obs_properties_get( props, "day" ), 1, 30, 1)
	elseif ( mth == 3 ) then
		local leap = 28
		if is_leap_year(yr) then
			 leap = 29
		else
			 leap = 28
		end	
		obs.obs_property_int_set_limits(obs.obs_properties_get( props, "day" ), 1, leap, 1)
	end
		
	if ( t_source == a_source ) then
		obs.obs_data_set_string(settings, "active_source", 'select') -- Don't allow timer and active text source to be the same
	end
	
		
	obs.obs_property_set_visible( obs.obs_properties_get( props, "countdown_type" ), false )
	obs.obs_property_set_visible( obs.obs_properties_get( props, "countdown_type" ), (config == 2 and mode == 2 ) )
	
	if scene == 'TIMER END TEXT' and  mode == 2 then
		obs.obs_property_set_visible( obs.obs_properties_get( props, "stop_text" ), true )
	end	
	-- Preset parameters
	if rec == 1 and mode == 2 then
	obs.obs_property_set_visible( obs.obs_properties_get( props, "recording_type" ), config == 2 )
	end	
	if mode == 2 then	
	obs.obs_property_set_visible( obs.obs_properties_get( props, "text_prefix" ), config == 2 )
	obs.obs_property_set_description( obs.obs_properties_get( props, "pause_button" ), "Start/Pause Countdown" )
	obs.obs_property_set_description( obs.obs_properties_get( props, "reset_button" ), "Reset Countdown" )	
	obs.obs_property_set_visible( obs.obs_properties_get( props, "start_recording" ), config == 2 )
	obs.obs_property_set_visible( obs.obs_properties_get( props, "next_scene" ), config == 2 )
	obs.obs_property_set_visible( obs.obs_properties_get( props, "hours" ), (config == 2 ) )
	obs.obs_property_set_visible( obs.obs_properties_get( props, "minutes" ), (config == 2 ) )
	obs.obs_property_set_visible( obs.obs_properties_get( props, "seconds" ), (config == 2 ) )
	else
	obs.obs_property_set_description( obs.obs_properties_get( props, "pause_button" ), "Start/Pause Stopwatch" )
	obs.obs_property_set_description( obs.obs_properties_get( props, "reset_button" ), "Reset Stopwatch" )	
	obs.obs_property_set_visible( obs.obs_properties_get( props, "start_recording" ), false )
	obs.obs_property_set_visible( obs.obs_properties_get( props, "next_scene" ), false )
	obs.obs_property_set_visible( obs.obs_properties_get( props, "hours" ), false )
	obs.obs_property_set_visible( obs.obs_properties_get( props, "minutes" ), false )
	obs.obs_property_set_visible( obs.obs_properties_get( props, "seconds" ), false )	
	end	
	obs.obs_property_set_visible( obs.obs_properties_get( props, "split_button" ), mode==1 )
  	obs.obs_property_set_visible( obs.obs_properties_get( props, "split_type" ), false )
	obs.obs_property_set_visible( obs.obs_properties_get( props, "split_source" ), false )
	obs.obs_property_set_visible( obs.obs_properties_get( props, "timer_trim" ), config==2 )
	obs.obs_property_set_visible( obs.obs_properties_get( props, "audio_caution" ), config==2 )
	obs.obs_property_set_visible( obs.obs_properties_get( props, "audio_warning" ), config==2 )
	obs.obs_property_set_visible( obs.obs_properties_get( props, "caution_duration" ), config==2 )
	obs.obs_property_set_visible( obs.obs_properties_get( props, "warning_duration" ), config==2 )
	obs.obs_property_set_visible( obs.obs_properties_get( props, "normal_color" ), config==2 )
	obs.obs_property_set_visible( obs.obs_properties_get( props, "caution_color" ), config==2 )
	obs.obs_property_set_visible( obs.obs_properties_get( props, "warning_color" ), config==2 )
	obs.obs_property_set_visible( obs.obs_properties_get( props, "caution_text" ), config==2 )
	obs.obs_property_set_visible( obs.obs_properties_get( props, "warning_text" ), config==2 )
	obs.obs_property_set_visible( obs.obs_properties_get( props, "start_on_visible" ), config==2 )
	obs.obs_property_set_visible( obs.obs_properties_get( props, "disable_script" ), config==2 )
	if mode == 1 then
  		obs.obs_property_set_visible( obs.obs_properties_get( props, "split_type" ), config == 2 )
		obs.obs_property_set_visible( obs.obs_properties_get( props, "split_source" ), config == 2 )	
	end	
  -- IMPORTANT: returns true to trigger refresh of the properties
  return true
end

--[[
----------------------------------------------------------
	A function named script_properties defines the properties that the user
	can change for the entire script module itself
----------------------------------------------------------
]]
function script_properties()
	local props = obs.obs_properties_create()
  	local p_a = obs.obs_properties_add_list( props, "timer_type", "<b>Timer Type</b>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT )
  	t_type = {"Stopwatch", "Countdown"}
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_a, v, i ) end
  	local p_b = obs.obs_properties_add_list( props, "config", "<font color=".. font_dimmed ..">Configuration</font>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT )
  	t_type = {"Basic", "Advanced"}
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_b, v, i ) end
	--[[
		Returns an array of reference-incremented sources. 
		Release with source_list_release().
	]]	
	local sources = obs.obs_enum_sources()
	local p_c = obs.obs_properties_add_list( props, "timer_source", "<i>Timer Source</i>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING )
	obs.obs_property_list_add_string( p_c, "Select", "select" )
	local list = {}
	if sources ~= nil then
		for _, source in ipairs( sources ) do
			source_id = obs.obs_source_get_unversioned_id( source )
			if source_id == "text_gdiplus" or source_id == "text_ft2_source" then
				local name = obs.obs_source_get_name( source )
				if name ~= split_source then
					--[[
						add it to list so that it can be reordered
					]]		
					list[name] = name
				else
					--continue 
				end
			end
		end
			obs.bfree(source)
		
		for key, value in pairsByKeys( list ) do
			--[[
				add item to property list
			]]	
			obs.obs_property_list_add_string( p_c, value, value )
		end
	end
	
	local p_u = obs.obs_properties_add_list( props, "countdown_type", "<font color=".. font_dimmed ..">Countdown Type</font>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT )
  	t_type = {"Specific Date & Time", "Hours, Minutes, Seconds"}
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_u, v, i ) end
	
	
	
	

	local p_y = obs.obs_properties_add_text( props, "day_text", "<font color=".. font_dimmed ..">Day Text Format</font>", obs.OBS_TEXT_DEFAULT )
	obs.obs_property_set_long_description( p_y, "\nUsed to distinguish between singular and plural days format. Use this for singular.\n" )	
	
		local p_z = obs.obs_properties_add_text( props, "days_text", "<font color=".. font_dimmed ..">Days Text Format</font>", obs.OBS_TEXT_DEFAULT )
	obs.obs_property_set_long_description( p_z, "\nUsed to distinguish between singular and plural days format. Use this for plural.\n" )
	
	
	
	
	
	
	
	
	
	
  	local p_v = obs.obs_properties_add_list( props, "month", "<font color=".. font_dimmed ..">Month</font>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT )
  	t_type = {"Select", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"}
	
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_v, v, i ) end
	
  	local p_x = obs.obs_properties_add_int( props, "year", "<font color=".. font_dimmed ..">Year</font>", 2021, 212021221, 1 )
  	local p_w = obs.obs_properties_add_int( props, "day", "<font color=".. font_dimmed ..">Day</font>", 1, 31, 1 )
	local p_n = obs.obs_properties_add_int( props, "hours", "<font color=".. font_dimmed ..">Hours</font>", 0, 23, 1 )

	obs.obs_property_int_set_suffix( p_n, " Hours" )
	local p_o = obs.obs_properties_add_int( props, "minutes", "<font color=".. font_dimmed ..">Minutes</font>", 0, 59, 1 )
	obs.obs_property_int_set_suffix( p_o, " Minutes" );
	local p_p = obs.obs_properties_add_int( props, "seconds", "<font color=".. font_dimmed ..">Seconds</font>", 0, 59, 1 )
	obs.obs_property_int_set_suffix( p_p, " Seconds" );
	local p_m = obs.obs_properties_add_list( props, "timer_trim", "Timer Format", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT )
	t_type = {"Display full format", "Remove leading zeros", "No leading zeros, no split seconds"}
	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_m, v, i ) end
	local p_d = obs.obs_properties_add_list( props, "split_source", "<i>Split Source</i>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING )
	obs.obs_property_list_add_string( p_d, "Select", "select" )
	list = {}
	if sources ~= nil then
		for _, source in ipairs( sources ) do
			source_id = obs.obs_source_get_unversioned_id( source )
			if source_id == "text_gdiplus" or source_id == "text_ft2_source" then
				local name = obs.obs_source_get_name( source )
				if name ~= timer_source then
					--[[
						add it to list so that it can be reordered
					]]		
					list[name] = name
				else
					--continue 
				end
			end
		end
			obs.bfree(source)
		
		for key, value in pairsByKeys(list) do
			--[[
				add item to property list
			]]	
			obs.obs_property_list_add_string( p_d, value, value )
		end
	end	
  	local p_e = obs.obs_properties_add_list( props, "split_type", "Split Type", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT )
  	t_type = {"Interval", "Mark", "Mark Interval", "Interval Mark"}
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_e, v, i ) end
	obs.obs_property_set_long_description( p_e, "\nInterval = Time between current and previous split.\n\nMark = Time of split\n" )
	local p_f = obs.obs_properties_add_list( props, "audio_caution", "<font color=".. font_dimmed ..">Caution Audio</font>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING )
	obs.obs_property_list_add_string( p_f, "None", "none" )
	if sources ~= nil then
		for _, source in ipairs( sources ) do
			source_id = obs.obs_source_get_unversioned_id( source )
			if source_id == "ffmpeg_source" then
				local name = obs.obs_source_get_name( source )
				obs.obs_property_list_add_string( p_f, name, name )
			end
		end
			obs.bfree(source)
	end	
	local p_g = obs.obs_properties_add_list( props, "audio_warning", "<font color=".. font_dimmed ..">Warning Audio</font>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING )
	obs.obs_property_list_add_string( p_g, "None", "none" )
	if sources ~= nil then
		for _, source in ipairs( sources ) do
			source_id = obs.obs_source_get_unversioned_id( source )
			if source_id == "ffmpeg_source" then
				local name = obs.obs_source_get_name( source )
				obs.obs_property_list_add_string( p_g, name, name )
			end
		end
			obs.bfree(source)
	end		
	obs.source_list_release( sources )
	obs.obs_properties_add_color( props, "normal_color", "Normal Color" )
	obs.obs_properties_add_color( props, "caution_color", "Caution Color" )
	obs.obs_properties_add_color( props, "warning_color", "Warning Color" )
	local p_h = obs.obs_properties_add_text( props, "caution_text", "<font color=".. font_dimmed ..">Caution Time</font>", obs.OBS_TEXT_DEFAULT )
	obs.obs_property_set_long_description( p_h, "\nUse format 00:00:00 ( hoursa:minutes:seconds )\n" )
	local p_i = obs.obs_properties_add_text( props, "warning_text", "<font color=".. font_dimmed ..">Warning Time</font>", obs.OBS_TEXT_DEFAULT )
	obs.obs_property_set_long_description( p_i, "\nUse format 00:00:00 ( hoursa:minutes:seconds )\n" )
	--*props, *name, *description, min, max, step
	obs.obs_properties_add_int_slider( props, "caution_duration", "Caution Duration", 1, 100, 1 )
	obs.obs_properties_add_int_slider( props, "warning_duration", "Warning Duration", 1, 100, 1 )
	local p_j = obs.obs_properties_add_list( props, "start_recording", "Auto Recording", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT )
	t_type = {"Yes", "No"}
	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_j, v, i ) end
	-- Combo list filled with the options from _type
  	local p_k = obs.obs_properties_add_list( props, "recording_type", "Recording", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT )
  	t_type = {"Timer Expires", "Caution Time", "Warning Time", "Timer Visible", "Timer Start"}
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_k, v, i ) end
	local p_l = obs.obs_properties_add_list( props, "next_scene", "<i>Next Scene</i>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING )
	t_type = {"Select", "TIMER END TEXT", "Source List", "Scene List"}
	for i,v in ipairs( t_type ) do obs.obs_property_list_add_string( p_l, v, v ) end
	local scene_source = obs.obs_frontend_get_current_scene()
	local name = obs.obs_source_get_name( scene_source )
	local scenes = obs.obs_frontend_get_scene_names(  )
	if scenes ~= nil then
		for i, scene in ipairs( scenes ) do
			if name ~= scene then
				obs.obs_property_list_add_string( p_l, scene, scene )
			end
		end
		obs.bfree( scene )
	end
	
    obs.obs_source_release( scene_source )

	local p_q = obs.obs_properties_add_text( props, "text_prefix", "<font color=#fefceb>Timer Prefix</font>", obs.OBS_TEXT_DEFAULT )
	obs.obs_property_set_long_description( p_q, "\nDefine text placed before the Timer\n" )
	local p_r = obs.obs_properties_add_text( props, "stop_text", "<font color=#fef1eb>Timer End Text</font>", obs.OBS_TEXT_DEFAULT )
	obs.obs_property_set_long_description( p_r, "\nDefine text displayed when timer ended\n" )
   	local p_s = obs.obs_properties_add_list( props, "active_source", "<i>Active Source</i>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING )
	obs.obs_property_set_long_description( p_s, "\nSelect a text source, that will be used to show the name for the current active Source or Scene\n" )
	obs.obs_property_list_add_string( p_s, "Select", "select" )
	list = {}
	if sources ~= nil then
		for _, source in ipairs( sources ) do
			source_id = obs.obs_source_get_unversioned_id( source )
			if source_id == "text_gdiplus" or source_id == "text_ft2_source" then
				local name = obs.obs_source_get_name( source )
				if name ~= timer_source then
					--[[
						add it to list so that it can be reordered
					]]		
					list[name] = name
				else
					--continue 
				end
			end
		end
			obs.bfree(source)
		
		for key, value in pairsByKeys(list) do
			--[[
				add item to property list
			]]	
			obs.obs_property_list_add_string( p_s, value, value )
		end
	end
	local p_t = obs.obs_properties_add_editable_list(props, "cycle_list", "Cycle List",obs.OBS_EDITABLE_LIST_TYPE_STRINGS,nil,nil)
	obs.obs_properties_add_button( props, "reset_button", "Reset Stopwatch", reset_button_clicked )
	obs.obs_properties_add_button( props, "pause_button", "Start/Pause Stopwatch", pause_button_clicked )	
	obs.obs_properties_add_button( props, "split_button", "Split Time", split_button_clicked )
    obs.obs_properties_add_bool( props, "start_on_visible", "Start Timer on Source Visible" )
    obs.obs_properties_add_bool( props, "disable_script", "Disable Script" )
	--Sets callback upon modification of the list Basically an Event Listener
  	obs.obs_property_set_modified_callback( p_a, property_onchange )
  	obs.obs_property_set_modified_callback( p_b, property_onchange )
  	obs.obs_property_set_modified_callback( p_j, property_onchange )
  	obs.obs_property_set_modified_callback( p_l, property_onchange )
  	obs.obs_property_set_modified_callback( p_s, property_onchange )
  	obs.obs_property_set_modified_callback( p_u, property_onchange )
  	obs.obs_property_set_modified_callback( p_v, property_onchange )
  	obs.obs_property_set_modified_callback( p_x, property_onchange )
	-- Calls the callback once to set-up current visibility
  	obs.obs_properties_apply_settings( props, p_settings )
	p_prop = prop
	return props
end

--[[
----------------------------------------------------------
	A function named script_update will be called when settings are changed
----------------------------------------------------------
]]
-- Called upon settings initialization and modification
function script_update( settings )
	assign_default_frequency()
	activate( false )
	timer_type = obs.obs_data_get_int( settings, "timer_type" )
	timer_source = obs.obs_data_get_string( settings, "timer_source" )
	countdown_type = obs.obs_data_get_int( settings, "countdown_type" )
	if timer_type == 2 then
		cur_seconds = 
		( obs.obs_data_get_int( settings, "hours" )*60*60 ) + 
		( obs.obs_data_get_int( settings, "minutes" )*60 ) + 
		obs.obs_data_get_int( settings, "seconds" )
	else
		cur_seconds = 0
	end		
	longtimetext_s = obs.obs_data_get_string( p_settings, "day_text" )
	longtimetext_p = obs.obs_data_get_string( p_settings, "days_text" )
	timer_year = obs.obs_data_get_int( settings, "year" )
	timer_month = obs.obs_data_get_int( settings, "month" ) - 1
	timer_day = obs.obs_data_get_int( settings, "day" )
	timer_hours = obs.obs_data_get_int( settings, "hours" )
	timer_minutes = obs.obs_data_get_int( settings, "minutes" )
	timer_seconds = obs.obs_data_get_int( settings, "seconds" )
	
	if timer_type == 2 and countdown_type == 1 then
		cur_seconds = delta_time( timer_year, timer_month, timer_day, timer_hours, timer_minutes, timer_seconds)
	end
	
	timer_trim = obs.obs_data_get_int( settings, "timer_trim" )
	def_seconds = cur_seconds 
	split_source = obs.obs_data_get_string( settings, "split_source" )
	active_source = obs.obs_data_get_string( settings, "active_source" )
	media['source_name_audio_warning'] = obs.obs_data_get_string( settings, "audio_warning" )
	media['source_name_audio_caution'] = obs.obs_data_get_string( settings, "audio_caution" )											
	media['normal_color'] = obs.obs_data_get_int( settings, "normal_color" )
	media['caution_color'] = obs.obs_data_get_int( settings, "caution_color" )
	media['warning_color'] = obs.obs_data_get_int( settings, "warning_color" )										
	media['warning_text'] = obs.obs_data_get_string( settings, "warning_text" )
	media['caution_text'] = obs.obs_data_get_string( settings, "caution_text" )
	media['caution_duration'] = obs.obs_data_get_int( settings, "caution_duration" )
	media['warning_duration'] = obs.obs_data_get_int( settings, "warning_duration" )
	split_type = obs.obs_data_get_string( settings, "split_type" )
	start_recording = obs.obs_data_get_int( settings, "start_recording" )
	recording_type = obs.obs_data_get_int( settings, "recording_type" )
	next_scene = obs.obs_data_get_string( settings, "next_scene" )
	text_prefix = obs.obs_data_get_string( settings, "text_prefix" )
	stop_text = obs.obs_data_get_string( settings, "stop_text" )
    start_on_visible = obs.obs_data_get_bool( settings,"start_on_visible" )
    disable_script = obs.obs_data_get_bool( settings,"disable_script" )
	reset( true )
	-- Keep track of current settings
  	p_settings = settings 
end

--[[
----------------------------------------------------------
A function named script_defaults will be called to set the default settings
----------------------------------------------------------
]]
function script_defaults( settings )
	assign_default_frequency()
	assign_default_frequency()
	obs.obs_data_set_default_int( settings, "timer_type", 1 )
	obs.obs_data_set_default_int( settings, "config", 1 )
	obs.obs_data_set_default_string( settings, "timer_source", "Select" )
	obs.obs_data_set_default_int( settings, "countdown_type", 2 )
	obs.obs_data_set_default_int( settings, "year", os.date("%Y", os.time()) )
	obs.obs_data_set_default_int( settings, "hours", 0 )
	obs.obs_data_set_default_int( settings, "minutes", 0 )
	obs.obs_data_set_default_int( settings, "seconds", 0 )
	obs.obs_data_set_default_int( settings, "timer_trim", 1 )
	obs.obs_data_set_default_string( settings, "day_text", " Day \n" )
	obs.obs_data_set_default_string( settings, "days_text", " Days \n" )
	obs.obs_data_set_default_string( settings, "split_source", "Select" )
	obs.obs_data_set_default_string( settings, "audio_warning", "None" )
	obs.obs_data_set_default_string( settings, "audio_caution", "None" )
	obs.obs_data_set_default_int( settings, "normal_color", media['normal_color'] )
	obs.obs_data_set_default_int( settings, "caution_color", media['caution_color'] )
	obs.obs_data_set_default_int( settings, "warning_color", media['warning_color'] )
	obs.obs_data_set_default_string( settings, "warning_text", "" )
	obs.obs_data_set_default_string( settings, "caution_text", "" )
	obs.obs_data_set_default_int( settings, "caution_duration", 5 )
	obs.obs_data_set_default_int( settings, "warning_duration", 5 )
	obs.obs_data_set_default_int( settings, "split_type", 2 )
	obs.obs_data_set_default_int( settings, "start_recording", 2 )
	obs.obs_data_set_default_int( settings, "recording_type", 5 )
	obs.obs_data_set_default_string( settings, "next_scene", "Select" )
	obs.obs_data_set_default_string( settings, "text_prefix", "" )
	obs.obs_data_set_default_string( settings, "stop_text", "" )
	obs.obs_data_set_default_bool( settings, "start_on_visible", false )
	obs.obs_data_set_default_bool( settings, "disable_script", false )
end

--[[
----------------------------------------------------------
	A function named script_save will be called when the script is saved
	NOTE: This function is usually used for saving extra data ( such as in this
	case, a hotkey's save data ).  Settings set via the properties are saved
	automatically.
----------------------------------------------------------
]]
function script_save( settings )
	local hotkey_save_array_reset = obs.obs_hotkey_save( hotkey_id_reset )
	local hotkey_save_array_pause = obs.obs_hotkey_save( hotkey_id_pause )
	local hotkey_save_array_split = obs.obs_hotkey_save( hotkey_id_split )
	obs.obs_data_set_array( settings, "reset_hotkey", hotkey_save_array_reset )
	obs.obs_data_set_array( settings, "pause_hotkey", hotkey_save_array_pause )
	obs.obs_data_set_array( settings, "split_hotkey", hotkey_save_array_split )
	obs.obs_data_array_release( hotkey_save_array_pause )
	obs.obs_data_array_release( hotkey_save_array_reset )
	obs.obs_data_array_release( hotkey_save_array_split )
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
function script_load( settings )
	assign_default_frequency()
	--log( 'OBS Video Default Frequency', time_frequency )
	local sh = obs.obs_get_signal_handler()
	obs.signal_handler_connect( sh, "source_activate", source_activated )
	obs.signal_handler_connect( sh, "source_deactivate", source_deactivated )
	
	
	hotkey_id_reset = obs.obs_hotkey_register_frontend( "reset_stopwatch_" .. filename():lower():gsub('[%W%p%c%s]', ''), "Reset " .. filename(), reset )
	hotkey_id_pause = obs.obs_hotkey_register_frontend( "pause_stopwatch_" .. filename():lower():gsub('[%W%p%c%s]', ''), "Start/Pause " .. filename(), on_pause )
	hotkey_id_split = obs.obs_hotkey_register_frontend( "split_stopwatch_" .. filename():lower():gsub('[%W%p%c%s]', ''), "Split Time " .. filename(), on_split )
	
	
	local hotkey_save_array_reset = obs.obs_data_get_array( settings, "reset_hotkey" )
	local hotkey_save_array_pause = obs.obs_data_get_array( settings, "pause_hotkey" )
	local hotkey_save_array_pause = obs.obs_data_get_array( settings, "pause_split" )
	obs.obs_hotkey_load( hotkey_id_reset, hotkey_save_array_reset )
	obs.obs_hotkey_load( hotkey_id_pause, hotkey_save_array_pause )
	obs.obs_hotkey_load( hotkey_id_split, hotkey_save_array_split )
	obs.obs_data_array_release( hotkey_save_array_reset )
	obs.obs_data_array_release( hotkey_save_array_pause )
	obs.obs_data_array_release( hotkey_save_array_split )
end