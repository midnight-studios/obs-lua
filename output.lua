
obs           				= obslua
gversion 					= "3.1"
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
timer_cycle 				= 10 
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

local function log( name, msg )
  if msg ~= nil then
    msg = " > " .. tostring( msg )
  else
    msg = ""
  end
  obs.script_log( obs.LOG_DEBUG, name .. msg )
end

function filename() 
	local str = debug.getinfo(2).source:sub(2) 
	return str:match("^.*/(.*).lua$") or str 
end

function script_description()
	return string.format( desc, tostring( gversion ) )
end

function assign_default_frequency()
	local fps = 60 
	local video_info = obs.obs_video_info()
    if obs.obs_get_video_info(video_info) then
		fps = video_info.fps_num		
	end
	time_frequency = ( 1/fps )
end	

function get_time_lapsed()
	local ns = obs.os_gettime_ns()
	local delta = ( ns/1000000000.0 ) - ( orig_time/1000000000.0 )
	return TimeFormat( delta )
end	


function get_frequency( previous )
	local ns = obs.os_gettime_ns()
	ns_last = ns
	local f = ( ns/1000000000.0 ) - ( previous/1000000000.0 )
	if f > 1 then f = time_frequency end
	return f	
end


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

function set_text( source_name, text )
	if source_name == 'Select' or  source_name == 'select'then
		return
	end	
	
function wait( ms )
	if ms ~= nil then
    local start = math.floor( ( obs.os_gettime_ns()/1000000 ) )
    repeat until ( math.floor( ( obs.os_gettime_ns()/1000000 ) )-start ) >= ms 
	end 
end

function record( mark, ms )
	if timer_type ~= 2 then return end
	if start_recording == 1 and mark == recording_type then
		obs.obs_frontend_recording_start()
	end
	if ms ~= nil then wait( ms ) end 
end	

 
function timer_ended( source_name )
	delayed_recording()
	if next_scene == "" or next_scene == "Select" then
		return
	end	
	if next_scene ~= "TIMER END TEXT" and next_scene ~= "Source List"  and next_scene ~= "Scene List" then
		set_visible( timer_source, false ) 
		
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


function TimeFormat( time, notrim )
	if time == nil then
		return
	end
	local trim = ( timer_trim == 1 )
	local hour, minutes, seconds, mili = 0, 0, 0, 0
	
function LongTimeFormat( time )
	local c_time = time
	
	if time > 86399 then 
		c_time = math.floor( ( time ) / 86400)
	end
	if time < 86400 then
		c_time = 0
	end
	return c_time
end


function set_time_text( source_name )
	if reset_activated then 
		reset_activated = false
		fresh_start( true ) 
	end	
	if cur_seconds <= 0.01 and timer_type ~= 1 then cur_seconds = 0 end
	local text = tostring( TimeFormat( cur_seconds ) )
	
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


function start_media( source_name, ref )
start_media_action( source_name, ref )
end


function start_media_action( source_name, ref )
	if source_name == nil or source_name  == "None" then
		return
	end		
	if media[ref..'_activated'] then set_visible( source_name, true ) end
end

function stop_media( ref, bypass )
	if bypass then 
		set_visible( media['source_name_audio_'..ref], false )
	else 
		stop_media_action( ref )	
	end	
end


function stop_media_action( ref )
	local source_name = media['source_name_audio_'..ref]
	if source_name == nil or source_name  == "None" then
		return
	end	
	
function get_source_looping( source_name )
	local property = "looping"
	


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
		end 
		obs.bfree( scn )
		obs.source_list_release( scenes )		
	end
end

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
		end 
		obs.bfree( scn )
		obs.source_list_release( scenes )		
	end
	
	return isvisible
end

function delayed_recording()
	obs.timer_add( recording_callback, 100 ) - milliseconds 
end	

function recording_callback()
	obs.timer_remove( recording_callback )
	record( 1 )
end

function start_timer()
	record( 5, 100 ) 
	timer_active = true
	fresh_start( false )
	obs.timer_add( timer_callback, timer_cycle ) - milliseconds 
end		


function timer_callback()
	time_frequency = get_frequency( ns_last )
	calculate()
	completed_cycles = completed_cycles + 1
	set_time_text( timer_source )
	
end


function calculate()
	if timer_type ~= 2 then
		cur_seconds = cur_seconds + time_frequency
	else
		cur_seconds = cur_seconds - time_frequency
	end
end	

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

	
function timer_caution_media_end_callback()
	set_visible( media['source_name_audio_caution'], false )	
	obs.remove_current_callback()
end	
	
function timer_warning_media_end_callback()
	set_visible( media['source_name_audio_warning'], false )
	obs.remove_current_callback()
end	
	
function disconnect_after_media_end( ref )
	
	local source_name = media['source_name_audio_'..ref] 
	
	source = obs.obs_get_source_by_name( source_name ) 
function signal_media_ended( cd )
	
function activate( activating, timer_expired )
	if disable_script then
		return		
	end	
	activated = activating
	if activating then	
		
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


function source_activated( cd )
   if disable_script then
		return		
	end
	activate_signal( cd, true )
end


function source_deactivated( cd )
	activate_signal( cd, false )
end


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


function reset_button_clicked( props, p )
	reset( true )
	return false
end


function pause_button_clicked( props, p )
	on_pause( true )
	return false
end


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
		
		
	else
		if activated == false then	
			activate( true )
		end	
	end
end


function split_button_clicked( props, p )
	on_split( true )
	return false
end


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
			
			text = tostring( TimeFormat( interval ) )
		elseif split_type == 'Mark' then
			title = 'Mark'
			
			text = tostring( TimeFormat( mark ) )
		elseif split_type == 'Mark Interval' then
			title = 'Mark                     '
			subtitle = 'Interval'
			text = tostring( TimeFormat( mark )..'          '..TimeFormat( interval ) )
		else	
			title = 'Interval                  '
			subtitle = 'Mark'
		text = tostring( TimeFormat( interval )..'          '..TimeFormat( mark ) )
		end	
		
		local n = i 
		if i < 10 then n = '0'..tostring( i ) end
		if data ~= nil then 	
			data = data .. '\n' .. n..' )    '..text
		else
			data = '#       '..title..subtitle..'\n'..line..'\n\n'..n..' )    '..text
		end
	end	
	split_data = data
end

function pairsByKeys(t, f)
	local a = {}
	for n in pairs(t) do table.insert(a, n) end
	table.sort(a, f)
	local i = 0      
	local iter = function ()   
		i = i + 1
		if a[i] == nil then return nil
		else return a[i], t[a[i]]
		end
	end
	return iter
end

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

function property_onchange( props, property, settings )
	
	local config = obs.obs_data_get_int( settings, "config" )
	local mode = obs.obs_data_get_int( settings, "timer_type" )
	local rec = obs.obs_data_get_int( settings, "start_recording" )
	local scene = obs.obs_data_get_string( settings, "next_scene" )	
	local t_source = obs.obs_data_get_string( settings, "timer_source" )
	local a_source = obs.obs_data_get_string( settings, "active_source" )
	local mth = obs.obs_data_get_int( settings, "month" )
	local yr = obs.obs_data_get_int( settings, "year" )
	local d = obs.obs_data_get_int( settings, "day" )
	local c_type = obs.obs_data_get_int( settings, "countdown_type" )
	obs.obs_property_set_visible( obs.obs_properties_get( props, "stop_text" ), false )
	obs.obs_property_set_visible( obs.obs_properties_get( props, "text_prefix" ), false )
	obs.obs_property_set_visible( obs.obs_properties_get( props, "text_suffix" ), false )
	obs.obs_property_set_visible( obs.obs_properties_get( props, "recording_type" ), false )
	obs.obs_property_set_visible( obs.obs_properties_get( props, "cycle_list" ), ( (scene == 'Source List' or scene == 'Scene List') and config == 2 ) )
	obs.obs_property_set_visible( obs.obs_properties_get( props, "active_source" ), ( (scene == 'Source List' or scene == 'Scene List') and config == 2 ) )
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
	
	if c_type == 1 and mth ~= 1 and d == 0 then
		obs.obs_data_set_int(settings, "day", 1) 
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
		obs.obs_data_set_string(settings, "active_source", 'select') 
	end
	obs.obs_property_set_visible( obs.obs_properties_get( props, "countdown_type" ), false )
	obs.obs_property_set_visible( obs.obs_properties_get( props, "countdown_type" ), (config == 2 and mode == 2 ) )
	if scene == 'TIMER END TEXT' and  mode == 2 then
		obs.obs_property_set_visible( obs.obs_properties_get( props, "stop_text" ), true )
	end	
	
	if rec == 1 and mode == 2 then
	obs.obs_property_set_visible( obs.obs_properties_get( props, "recording_type" ), config == 2 )
	end	
	if mode == 2 then	
	obs.obs_property_set_visible( obs.obs_properties_get( props, "text_prefix" ), config == 2 )
	obs.obs_property_set_visible( obs.obs_properties_get( props, "text_suffix" ), config == 2 )
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
  
  return true
end


function script_properties()
	local props = obs.obs_properties_create()
  	local p_a = obs.obs_properties_add_list( props, "timer_type", "<b>Timer Type</b>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT )
  	t_type = {"Stopwatch", "Countdown"}
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_a, v, i ) end
  	local p_b = obs.obs_properties_add_list( props, "config", "<font color=".. font_dimmed ..">Configuration</font>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT )
  	t_type = {"Basic", "Advanced"}
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_b, v, i ) end
	

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
	longtimetext_s = obs.obs_data_get_string( settings, "day_text" )
	longtimetext_p = obs.obs_data_get_string( settings, "days_text" )
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
	text_suffix = obs.obs_data_get_string( settings, "text_suffix" )
	stop_text = obs.obs_data_get_string( settings, "stop_text" )
    start_on_visible = obs.obs_data_get_bool( settings,"start_on_visible" )
    disable_script = obs.obs_data_get_bool( settings,"disable_script" )
	reset( true )
	
  	p_settings = settings 
end


function script_defaults( settings )
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
	obs.obs_data_set_default_string( settings, "day_text", "# Day \n" )
	obs.obs_data_set_default_string( settings, "days_text", "# Days \n" )
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
	obs.obs_data_set_default_string( settings, "text_suffix", "" )
	obs.obs_data_set_default_string( settings, "stop_text", "" )
	obs.obs_data_set_default_bool( settings, "start_on_visible", false )
	obs.obs_data_set_default_bool( settings, "disable_script", false )
end


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


function script_load( settings )
	assign_default_frequency()
	
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