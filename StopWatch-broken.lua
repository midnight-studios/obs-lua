obs           				= obslua;
gversion 					= "5";
luafile						= "StopWatch.lua";
obsurl						= "comprehensive-stopwatch-countdown-timer.1364/";
patch_notes					= "Patch Notes";
icon="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABUAAAAVCAYAAACpF6WWAAAENElEQVQ4jY1UTUgjZxh+ksl/JuMkMYb4F40bNZqK0KJFqBZqS9ddyl76dyhdKPRQShH2sNDSnnopCz11D10KS/dSKNiDoD2I7KXFQ0XSSGpM1llFMYn5mZiMY2IymfIOhgazXfaDj5n53u975vme531fnaqqeMHxJYCvAOgAlABcAyA1jxLO1tYW1tbWoL+Kd3x8jGg0imw2C0VRWkMEYgNgBeAFYKTFRqOh7aVnE9xwFTSZTGJ7exszMzPQ6XSQZRk8z9P7YrVa/Y5hmKLBYHCpqirW63Wcn5/j7OwMHo9HA6bvNqY2mw1Op1N70qaTkxPkcjmbLMsDZrN5hOO4NxuNhlMUxTFiSCA0FEW5GQ6H/wmHwzfamDavUKlUYDKZAoFA4Gue52/r9f/9v6OjQ5uKojwpFAr3RFF8UCwWjW63OzQ/P/9yGyiBnZ6eEtN3eZ7/9XJZrlQqP2cymcf5fL4QDAbHdTrd2yzLXvd4PD9yHHdLEISFXC7nsdvtuTb3c7kcEokEJiYmhliWtaiqWs5ms4f1el0lE2lOTU0hn8/DYrF09vb23jebze9JkvRXNBqdMpvNaIJaLh1tHScAzpvsSd+joyOkUimEQiFNa4vFAlEU4Xa7HwYCgduFQuHRxsbGx5p+qqq+o/7/SF7uQSaTwcHBgZYdgiBMqKqa2dnZ8S8tLaFcLicIIR6PjzU13Qew+gzPKNEj9JJOp5tag+O41/v7+x/v7u7+sLOzc8BxHN1icXR0dMXlcn3xQhW1v7+PSCSC6enptxwOx3WWZRcbjcbTjY2NAJ1nWRYGgwHj4+OqoigFYnr/UlPlClYFwJ1arVYjU8bGxhZ8Pt9KMxiLxd5gGEbTlTSv1WqQJOmJw+G4RqCfPYfkN4qiFDs7O9HT0/Nqa4BhmKd2u10DrFaruLi4oJmncibQSUCrLHJabDlHzItGo1E7FIvFvg+FQjMmkykkCMK9eDwOivl8PvqhBspxXJAOEujfz2HazzBMdXh4OJNMJoupVGre7/cbBEGor6+vY2RkROsLlwY6jUajS5KkSGvtf0oVemUeAPiDgsFgUHMeQJ3MmZycxNzcnMZWkiT4/f67FJRl+UFrmcYB/N7y3UyLSHOBzNjb20MgEMDg4CC6urqwublJZo12d3ffVRRFEQTh4TNTqlQqaawoTShOVdOsqMPDQ8zOzmqFQK3PZrO91NPTs2U0GkmWG4lEYrWt9cViMSwvL1Ntvw9gRafT/aTX6z8AwFKcuhU5zjDMkNfr/XZgYCBKgMfHx3eSyeSqw+Fob9LEipxMp9MRp9P5uclkWuB5/hOKWa3Wvb6+vjLP8wNer5fXUkRRLkql0ofZbPY3ug019TZQ6jKU0AzD7Iqi+Josy6+4XK6P7Hb7LbvdPkS5SXpXKpU/ZVn+5ezs7FG9Xi9brVZNLr1ej38BVDs6EbSfFQsAAAAASUVORK5CYII=";
desc	    				= 
[[
<hr/><center><h2>Advanced Stopwatch</h2>( Version: %s )</center>
<br><center><img width=38 height=42 src="]] .. icon .. [["/></center>
<br><center><a href="https://github.com/midnight-studios/obs-lua/blob/main/]] .. luafile ..[[">Find it on GitHub</a></center>
<center><a href="https://obsproject.com/forum/resources/]] .. obsurl ..[[updates">]] .. patch_notes ..[[</a></center>
<br><p>The Properties for this script will adjust visibility as needed. Some advanced properties will only be visible if the Configuration is set to "Advanced". If the Configuration is set to "Basic" the defined values will still be used, so ensure you define those correctly.</p><p>Find help on the <a href="https://obsproject.com/forum/resources/]] .. obsurl ..[[">OBS Forum Thread</a>.</p><hr/>
]];
text_prefix 						= "";
text_suffix 						= "";
last_text    						= "";
custom_time_format					= "";
timer_source   						= "";
countdown_type 						= "";
backup_folder 						= "";
import_list 						= "";
longtimetext_s 						= "";
longtimetext_p 						= "";
last_split_data 					= "";
split_source   						= "";
active_source  						= "";
next_scene							= "";
stop_text							= "";
toggle_mili_trigger					= "";
sec_add_1							= "";
sec_add_2							= "";
sec_add_3							= "";
sec_sub_1							= "";
sec_sub_2							= "";
sec_sub_3							= "";
output_file_name 					= "-backup($date_stamp).json";
font_normal							= "#ffffff";
font_dimmed							= "#bfbbbf";
font_highlight						= "#fffdcf";
add_limit_note_source 				= "";
sub_limit_note_source 				= ""; 
note_source_marker_a 				= "";
note_source_marker_b 				= "";
audio_marker_b						= "";
audio_marker_a						= "";
current_count_direction				= "UP";
count_orientation					= "NORMAL";
last_orientation					= "NORMAL";
add_limit_note_source_visible		= 0;
sub_limit_note_source_visible		= 0;
sources_loaded 						= 0;
timer_manipulation					= 1;
sec_add_limit						= 0;
sec_add_limit_used					= 0;
sec_sub_limit_used					= 0;
sec_sub_limit						= 0;
total_sources 						= 0;
sw_hours_saved 						= 0;
sw_minutes_saved 					= 0;
sw_seconds_saved 					= 0;
sw_milliseconds_saved 				= 0;
split_type   						= 2;
current_seconds   					= 0;
cycle_direction						= 1;
default_seconds   					= 0;
split_count    						= 0;
timer_year	     					= 0;
timer_month	     					= 0;
timer_day	     					= 0;
timer_hours	     					= 0;
timer_minutes 	     				= 0;
timer_seconds	     				= 0;
timer_mode   						= 0;
last_timer_mode   					= 0;
timer_format						= 1;
timer_display  						= 1;
start_recording						= 0;
media_playback_limit				= 0;
recording_type						= 0;
enable_marker_notes					= 1;
orig_time     						= 0;
time_frequency						= 0;
completed_cycles					= 0;
ns_last								= 0;
cycle_index 						= 1;
timer_cycle 						= 10; 
split_itm							= {};
ignore_list							= {
"",
"none",
"None",
"Select",
"select",
"list"
};
split_data							= nil;
minute_format						= nil;
local ctx = {
    propsDef    = nil,  
    propsDefSrc = nil,  
    propsSet    = nil,  
    propsVal    = {},   
    propsValSrc = nil,  
};
props								= nil;
timer_mode_changed 					= false;
script_ready 						= false;
set_timer_activated					= false;
color_normal_updated 				= false;
activated     						= false;
prevent_callback  					= false;
timer_active  						= false;
reset_activated						= false;
start_on_visible  					= false;
force_reset_on_visible				= false;
force_reset_on_scene_active			= false;
active_source_force_visible			= false;
start_on_scene_active				= false;
disable_script   					= false;
enable_direction_toggle  			= false;
show_mili   						= true;
timer_expired  						= true;
mili_toggle_triggered				= false; 
direction_changed					= false; 
prevent_negative_time  				= false;
record_timer_set  					= false;
media = {							
text_marker_b						= "",
text_marker_a						= "",
source_name_audio_marker_b			= "",
source_name_audio_marker_a			= "",
source_name_audio_marker_end		= "", 
note_source_marker_a 				= "",
note_source_marker_b 				= "",
note_marker_a 						= "",
note_marker_b 						= "",
activated_marker_b					= false,
activated_marker_a					= false, 
activated_media_marker_b			= false,
activated_media_marker_a			= false, 
activated_time_marker_b				= 0,
activated_time_marker_a				= 0, 
cycle_direction_marker_a			= 2;
cycle_direction_marker_b			= 2;
cycle_index_marker_a				= 1; 
cycle_index_marker_b				= 1; 
current_seconds_marker_a			= 0,
current_seconds_marker_b			= 0, 
duration_marker_a					= 0, 
duration_marker_b					= 0, 
reset_text_marker_a					= 0, 
reset_text_marker_b					= 0, 
duration_marker_end					= 0, 
media_ended_marker_a				= false, 
media_ended_marker_b				= false,
color_normal						= 4294967295, 
color_marker_a						= 4256749, 
color_marker_b						= 329050, 
last_state_marker_a					= obs.OBS_MEDIA_STATE_NONE,
last_state_marker_b					= obs.OBS_MEDIA_STATE_NONE
};									
selected_source_list				= {};
hotkey_id_reset						= obs.OBS_INVALID_HOTKEY_ID;
hotkey_id_pause						= obs.OBS_INVALID_HOTKEY_ID;
hotkey_id_split						= obs.OBS_INVALID_HOTKEY_ID;
hotkey_id_mili						= obs.OBS_INVALID_HOTKEY_ID;
hotkey_id_direction					= obs.OBS_INVALID_HOTKEY_ID;
hotkey_id_sec_add_1					= obs.OBS_INVALID_HOTKEY_ID;
hotkey_id_sec_add_2					= obs.OBS_INVALID_HOTKEY_ID;
hotkey_id_sec_add_3					= obs.OBS_INVALID_HOTKEY_ID;
hotkey_id_sec_sub_1					= obs.OBS_INVALID_HOTKEY_ID;
hotkey_id_sec_sub_2					= obs.OBS_INVALID_HOTKEY_ID;
hotkey_id_sec_sub_3					= obs.OBS_INVALID_HOTKEY_ID;
function script_description()
	return string.format( desc, tostring( gversion ) );
end
local function pre_dump( input )
  if type( input ) == "table" then
    local str = "{ ";
    for key, value in pairs( input ) do
      if type( key ) ~= "number" then key = "'" .. key .. "'" end;
      str = str .. "[" .. key .. "] = " .. pre_dump( value ) .. ",";
    end;
    return str .. "} ";
  else
    return tostring( input );
  end;
end
local function log( name, msg )
  if msg ~= nil then
    msg = " > " .. tostring( msg );
  else
    msg = "";
  end;
  obs.script_log( obs.LOG_DEBUG, tostring( name ) .. msg );
end
local function explode( str, delim )
   local tbl, index;
   tbl = {};
   index = 0;
   if( #str == 1 ) then return {str} end; 
   while true do
      local trace_index = string.find( str, delim, index, true ); 
      if trace_index ~= nil then 
         table.insert( tbl, string.sub( str, index, trace_index - 1 ) ); 
         index = trace_index + 1; 
      else
         table.insert( tbl, string.sub( str, index ) ); 
         break; 
      end;
   end;
   return tbl;
end
local function pairsByKeys( tbl, input_function )
	if type( tbl ) ~= "table" then return tbl end; 
	local temp_tbl = {}; 
	for items in pairs( tbl ) do table.insert( temp_tbl, items ) end;
	table.sort( temp_tbl, input_function ); 
	local i = 0 
	local iter = function () 
		i = i + 1;
		if temp_tbl[i] == nil then return nil;
		else return temp_tbl[i], tbl[temp_tbl[i]];
		end;
	end;
	return iter;
end
local function tablelength( tbl )
	local count = 0;
	if type( tbl ) == "table" then 
		for _ in pairs( tbl ) do count = count + 1 end;
	end;
	return count;
end
local function tableHasKey( tbl, key )
	if type( tbl ) ~= "table" then return false end; 
    return tbl[key] ~= nil;
end
local function in_table( tbl, input_value )
	if type( tbl ) ~= "table" or input_value == nil then return false end; 
	for key, value in pairs( tbl ) do
		if value == input_value then	
			return true
		end;
	end;
	return false
end
function refresh_properties()
	return true;
end
function checkTimeString(str)
  local pattern = "^%d%d:%d%d:%d%d$"
  if string.match(str, pattern) then
    return true
  else
    return false
  end
end
local function remove_duplicates( tbl )
	if type( tbl ) ~= "table" then return table end; 
	local hash = {};
	local clean_tbl = {};
	for _, value in pairsByKeys( tbl ) do
	   if ( not hash[value] ) then
		   clean_tbl[#clean_tbl+1] = value; 
		   hash[value] = true;
	   end;
	end;
	return clean_tbl; 
end
function removeDuplicates(tbl) 
  local seen = {}
  local result = {}
  for _, value in ipairs(tbl) do
    if not seen[value] then
      table.insert(result, value)
      seen[value] = true
    end
  end
  return result
end
function convertToSeconds(timeString)
  local hours, minutes, seconds = string.match(timeString, "(%d%d):(%d%d):(%d%d)")
  hours = tonumber(hours)
  minutes = tonumber(minutes)
  seconds = tonumber(seconds)
  local totalSeconds = (hours * 3600) + (minutes * 60) + seconds
  return totalSeconds
end
local function set_visible( source_name, visible )
	visible = visible or false;
	local action_completed = false;
	if source_name == nil then return action_completed; end;
	if in_table( ignore_list, source_name ) then return action_completed; end;
	local scenes = obs.obs_frontend_get_scenes();
	if scenes ~= nil then
		for i, scn in ipairs( scenes ) do	
			local scene = obs.obs_scene_from_source( scn );
			local sceneitem = obs.obs_scene_find_source_recursive( scene, source_name );
			if sceneitem ~= nil then
				if visible and not obs.obs_sceneitem_visible( sceneitem ) then 
					obs.obs_sceneitem_set_visible( sceneitem, visible );
				end	
				if not visible and obs.obs_sceneitem_visible( sceneitem ) then 
					obs.obs_sceneitem_set_visible( sceneitem, visible );
				end;	
				action_completed = true;
				break;	
			end;
		end; 
		obs.bfree( scn );
		obs.source_list_release( scenes );		
	end;
	return action_completed;
end
local function is_visible( source_name )
	local isvisible = false;
	local scenes = obs.obs_frontend_get_scenes();
	if scenes ~= nil then
		for i, scn in ipairs( scenes ) do	
			local scene = obs.obs_scene_from_source( scn );
			local sceneitem = obs.obs_scene_find_source_recursive( scene, source_name );
			if sceneitem ~= nil then
				isvisible = obs.obs_sceneitem_visible( sceneitem );
				break;	
			end;	
		end; 
		obs.bfree( scn );
		obs.source_list_release( scenes );		
	end; 
	return isvisible;
end	
local function compareTimeStrings(timeString1, timeString2)
  local hours1, minutes1, seconds1 = string.match(timeString1, "(%d%d):(%d%d):(%d%d)")
  local hours2, minutes2, seconds2 = string.match(timeString2, "(%d%d):(%d%d):(%d%d)")
  hours1 = tonumber(hours1)
  minutes1 = tonumber(minutes1)
  seconds1 = tonumber(seconds1)
  hours2 = tonumber(hours2)
  minutes2 = tonumber(minutes2)
  seconds2 = tonumber(seconds2)
  local totalSeconds1 = (hours1 * 3600) + (minutes1 * 60) + seconds1
  local totalSeconds2 = (hours2 * 3600) + (minutes2 * 60) + seconds2
  return totalSeconds1 < totalSeconds2
end
local function sortTimeTable(timeTable)
  table.sort(timeTable, compareTimeStrings)
end
function getNextItemMatchingTime( table, currentTime )
  local nextItem = nil
  local currentTimeString = string.format( "%02d:%02d:%02d", math.floor( currentTime / 3600 ), math.floor( ( currentTime % 3600 ) / 60 ), currentTime % 60 )
  for _, value in ipairs( table ) do		
    if value > currentTimeString then
      nextItem = value
	  break
    end	
  end	
	if table[1] ~= nil and nextItem == nil then
		[1]
	end		
  return nextItem
end
function getPreviousItemMatchingTime( table, currentTime )
  local previousItem = nil
  local currentTimeString = string.format( "%02d:%02d:%02d", math.floor( currentTime / 3600 ), math.floor( ( currentTime % 3600 ) / 60 ), currentTime % 60 )
  for _, value in ipairs(table) do
    if value < currentTimeString then
      previousItem = value
    else
      break
    end
  end	
	if table[#table] ~= nil and previousItem == nil then
		[#table] 
	end	
  return previousItem
end
local function obs_data_array_to_table( set, item )
	local array = obs.obs_data_get_array( set, item );
	local count = obs.obs_data_array_count( array );
	local list = {};
	for i = 0, count do 
		local array_item = obs.obs_data_array_item( array, i );
		local value = obs.obs_data_get_string( array_item, "value" );
		list[i] = value;
	end;
	obs.obs_data_array_release( array );
	return list;
end	
local function getMarkerTime( ref, currentTime )
	local result 	= nil
	local i 		= 0;		
	local list 		= {}; 		
	local data_list = obs_data_array_to_table( ctx.propsSet, "text_arr_" .. ref ); 
	for key, value in pairs( data_list ) do
		if value ~= nil and value ~= "" then
			if checkTimeString( value ) then
				i = i + 1;
				list[i] = value;
			end			
		end	
	end
	list = removeDuplicates( list ); 
	sortTimeTable( list ); 
	local count = tablelength( list ); 
	if #list >= 1 then
		media["activated_media_".. ref] = false; 	
	end
	if current_count_direction == "UP" then 
		result = getNextItemMatchingTime( list, currentTime ); 
	else
		result = getPreviousItemMatchingTime( list, currentTime ); 
	end	
	return result
end	
local function is_valid_media_source( source_name )
	local source = obs.obs_get_source_by_name( source_name ); 
	local is_valid = false;
    if source ~= nil then 
		local source_id = obs.obs_source_get_unversioned_id( source ); 
			if source_id == "ffmpeg_source" then 
				is_valid = true
			end;
	end;
	obs.obs_source_release( source ); 
	return is_valid; 
end	
local function source_exists_alt( source_name )
	local sourceFound = false
	local sources = obs.obs_enum_sources();
	local i = 0;
	if sources ~= nil then
		for _, source in ipairs( sources ) do 
			local name = obs.obs_source_get_name( source );
			if name == source_name then
			sourceFound = true
			end	
		end
		obs.bfree(source); 
	end;
	obs.source_list_release( sources ); 
	return sourceFound
end
function source_exists( source_name )
	local sourceFound = false
	local source = obs.obs_get_source_by_name( timer_source )
	if source ~= nil then 
		sourceFound = true
	end
	obs.obs_source_release( source ); 
	return sourceFound
end
function assign_audio_source_name( property_name, ref )
	local data_list = obs_data_array_to_table( ctx.propsSet, property_name )
	local audioTable = {}
	for i, source_name in pairs( data_list ) do
		if is_valid_media_source( source_name ) then
		  table.insert( audioTable, source_name )
		end
	end
	local current_index = media["cycle_index_".. ref]
	if count_orientation ~= last_orientation then
		 current_index = count_orientation == "NORMAL" and current_index + 1 or current_index - 1;
	end	
	last_orientation = count_orientation
	if current_count_direction == "DOWN" and current_index < 1 then
		current_index = #audioTable
	end	
	if current_count_direction == "UP" and current_index > #audioTable then
		current_index = 1
	end	
	if count_orientation == "NORMAL" then 
		media["source_name_audio_".. ref] = audioTable[current_index]  
	end
	if count_orientation == "NORMAL" then 
	  current_index = ( current_index % #audioTable ) + 1
	else
	  current_index = ( current_index - 2 + #audioTable ) % #audioTable + 1
	end
	media["cycle_index_".. ref] = current_index
	if count_orientation == "INVERTED" then 
		media["source_name_audio_".. ref] = audioTable[current_index] 
	end	
end
local function reset_audio_source_visibility( property_name, ref )
	local data_list = obs_data_array_to_table( ctx.propsSet, property_name ); 
	if data_list ~= nil then	
		for key, value in pairs( data_list ) do
			if is_valid_media_source( value ) then
					set_visible( value, false );
			end
		end	
	end	
end
function reset_audio_marker_arr()
	audio_marker_a = obs.obs_data_get_string( ctx.propsSet, "audio_marker_a" );
	audio_marker_b = obs.obs_data_get_string( ctx.propsSet, "audio_marker_b" );
	if audio_marker_a == "list" then
		reset_audio_source_visibility( "audio_marker_a_arr", "marker_a" );
	end
	if audio_marker_b == "list" then
		reset_audio_source_visibility( "audio_marker_b_arr", "marker_b" );
	end
end	
function update_time_markers( currentTime ) 	
	media["text_marker_a"] = getMarkerTime( "marker_a", currentTime );			
	media["text_marker_b"] = getMarkerTime( "marker_b", currentTime );
end	
function update_media_names( position_reset )
  	position_reset = position_reset or false
	if position_reset then
		media["cycle_index_marker_a"] = 1; 
		media["cycle_index_marker_b"] = 1; 
	end
	if audio_marker_a == "list" then
		assign_audio_source_name( "audio_marker_a_arr", "marker_a" );
	end
	if audio_marker_b == "list" then
		assign_audio_source_name( "audio_marker_b_arr", "marker_b" );
	end
	log("marker_a: ".. "["..(count_orientation == "NORMAL" and "Descending" or "Acending").."] Loaded Media:[" .. tostring(media["source_name_audio_marker_a"]) .. "]" .. " Time ["..(count_orientation == "NORMAL" and "Next" or "Previous").."]", tostring(media["text_marker_a"]) .. " Index: " .. tostring(media["cycle_index_marker_a"])); 
end	
function get_source_list( return_ref )
	local scenes = obs.obs_frontend_get_scenes();
	local source_list = {};
	local list = {};
	local sub = {};
    if scenes ~= nil then
        for key_scenesource, value_scenesource in pairs( scenes ) do
            local scenename = obs.obs_source_get_name( value_scenesource );
            local scene = obs.obs_scene_from_source( value_scenesource );
            local sceneitems = obs.obs_scene_enum_items( scene );
			local index = 0;
            for key_sceneitem, value_sceneitem in pairs( sceneitems ) do
				index = index + 1;
				sub = {};
                local source = obs.obs_sceneitem_get_source( value_sceneitem );
				local source_name_parent = obs.obs_source_get_name( source );
				local group = obs.obs_group_from_source( source );
				local id_parent = obs.obs_source_get_id( source );
				local unversioned_id_parent = obs.obs_source_get_unversioned_id( source );
				local display_name_parent = obs.obs_source_get_display_name( id_parent );
				sub["id"] = id_parent;
				sub["unversioned_id"] = unversioned_id_parent;
				sub["display_name"] = display_name_parent;
				sub["source_name"] = source_name_parent;
				list[index] = sub;
				source_list[source_name_parent] = source_name_parent; 
				if group ~= nil then
					local groupitems = obs.obs_scene_enum_items( group );	
					if groupitems ~= nil then
						for key_groupitem, value_groupitem in pairs( groupitems ) do
							index = index + 1;
							sub = {};
							local groupitemsource = obs.obs_sceneitem_get_source( value_groupitem );
							local source_name_group = obs.obs_source_get_name( groupitemsource );
							local id_group = obs.obs_source_get_id( groupitemsource );
							local unversioned_id_group = obs.obs_source_get_unversioned_id( groupitemsource );
							local display_name_group = obs.obs_source_get_display_name( id_group );
							sub["id"] = id_group;
							sub["unversioned_id"] = unversioned_id_group;
							sub["display_name"] = display_name_group;
							sub["source_name"] = source_name_group;
							list[index] = sub;
							source_list[source_name_group] = source_name_group; 
						end 
						obs.sceneitem_list_release( groupitems );
					end
				end	
            end 
            obs.sceneitem_list_release( sceneitems );
		end 
        obs.source_list_release( scenes );
    end; 
	local tmp_list = {};
	local found = false;
	if return_ref ~= nil then
		for key, value in pairs( list ) do
			if type( list[key] ) == "table" then
				if tableHasKey( list[key], return_ref ) then
					found = true;
					tmp_list[list[key]["source_name"]] = list[key][return_ref];
				end;
			end;
		end;
	end;
	if found then source_list = tmp_list end;
	return source_list;
end
local function filename() 
	local str = debug.getinfo(2).source:sub(2);
	return str:match("^.*/(.*).lua$") or str;
end
local function get_filenames( path, file_extension )
	local filenames = {};
	local dir = obs.os_opendir( path );
	local entry;
	repeat
	  entry = obs.os_readdir( dir );
	  if entry then
		local ext = obs.os_get_path_extension( entry.d_name );
		if ext == file_extension then
			local  filename = string.gsub( entry.d_name, ext, "" );
			table.insert( filenames, filename );
	  	end
	  end
	until not entry;
	obs.os_closedir( dir );
	return filenames;
end
local function write_to_json( data )
	output_folder = backup_folder;
	local file_name = filename() .. output_file_name:gsub("$date_stamp", os.date("%Y-%m-%d-%H%M"));
	local script_path = script_path();
	local output_path = script_path .. file_name;
	if (output_folder ~= "") then
		output_path = output_folder .. "/" .. file_name;
	else
		output_path = script_path .. file_name;
	end
	output_path = output_path:gsub([[\]], "/");
	obs.obs_data_erase( data, "backup_folder" );
	obs.obs_data_erase( data, "backup_mode" );
	return obs.obs_data_save_json( data, output_path );
end
local function assign_default_frequency()
	local fps = 60; 
	local video_info = obs.obs_video_info();
    if obs.obs_get_video_info(video_info) then
		fps = video_info.fps_num;		
	end;
	time_frequency = ( 1/fps );
end
local function config_time( hour, minutes, seconds, mili )
	local format_hour, 
	format_minutes, 
	format_seconds, 
	format_mili = 
	( hour and "%02d" or "" ),
	( minutes and ":%02d" or "" ),
	( seconds and ":%02d" or "" ),
	( mili and ",%02d" or "" ); 
	local time = string.format( format_hour..format_minutes..format_seconds..format_mili, hour, minutes, seconds, mili );
	if not show_mili then
		time = string.format( format_hour..format_minutes..format_seconds, hour, minutes, seconds );
	end;
	return time;
end
local function raw_time( time, simplify )
	local hour, minutes, seconds, mili = 0, 0, 0, 0;
	if time > 86399 then 
		local c_time = ( math.floor( ( time ) / 86400 ) * 86400 );
		time = time - c_time;
	end;
	hour = math.floor( time/3600 );
	if hour < 10 and trim then
		hour = "0"..hour;
	end;
	if minute_format ~= nil then
		minutes = math.floor( ( ( time/3600 ) * 3600 ) / 60 );
		minutes = minutes % minute_format;
	else
		minutes = math.floor( ( time - math.floor( time/3600 )*3600 )/60 );
	end	
	if minutes < 10 and trim then
		minutes = "0"..minutes;
	end;
	seconds =  math.floor( time - math.floor( time/3600 )*3600 - math.floor( ( time - math.floor( time/3600 )*3600 )/60 )*60 );
	if seconds < 10 and trim then
		seconds = "0"..seconds;
	end;
	mili = math.floor( ( time - math.floor( time/3600 )*3600 - math.floor( ( time - math.floor( time/3600 )*3600 )/60 )*60 - math.floor( time - math.floor( time/3600 )*3600 - math.floor( ( time - math.floor( time/3600 )*3600 )/60 )*60 ) )*100 );
	if mili < 10 and trim then
		mili = "0"..mili;
	end
	local output = "";
	if simplify then
		output = config_time( hour, minutes, seconds,  nil );
	else
		output = config_time( hour, minutes, seconds,  mili );
	end;
	return output;
end	
local function get_time_lapsed()
	local ns = obs.os_gettime_ns();
	local delta = ( ns/1000000000.0 ) - ( orig_time/1000000000.0 );
	return raw_time( delta );
end	
local function get_frequency( previous )
	local ns = obs.os_gettime_ns();
	ns_last = ns;
	local f = ( ns/1000000000.0 ) - ( previous/1000000000.0 );
	if f > 1 then f = time_frequency end;
	return f;	
end
function remove_all_timers()
	obs.timer_remove( timer_callback );
	obs.timer_remove( sal_timer_callback );
	obs.timer_remove( ssl_timer_callback );
	obs.timer_remove( timer_end_media_end_callback );
	obs.timer_remove( frontend_recording_start_callback );
	obs.timer_remove( reset_text_a_colour_timer_callback );
	obs.timer_remove( reset_text_b_colour_timer_callback );
end
local function frontend_recording_start_callback( )
	if not record_timer_set then return end;
	if not obs.obs_frontend_recording_active() then
		obs.obs_frontend_recording_start();
	end;
	obs.timer_remove( frontend_recording_start_callback );
	record_timer_set = false;
end
local function record( mark, ms )
	if obs.obs_frontend_recording_active() then 
		frontend_recording_start_callback( );
		return;
	end;
	if timer_mode ~= 2 or obs.obs_frontend_recording_active() then return end; 
	if start_recording == 1 and mark == recording_type then	
		if not record_timer_set then
			obs.timer_add( frontend_recording_start_callback, ms ); 
			record_timer_set = true; 	
		end;
	end;
end
local function delta_time( year, month, day, hour, minute, second )
	local now = os.time();
	if ( year == -1 ) then
		year = os.date( "%Y", now );
	end;
	if ( month == -1 ) then
		month = os.date( "%m", now );
	end;
	if ( day == -1 ) then
		day = os.date( "%d", now );
	end;
	local future = os.time{year=year, month=month, day=day, hour=hour, min=minute, sec=second};
	local seconds = os.difftime( future, now );
	if ( seconds < 0 ) then
		seconds = 0;
	end;
	return seconds; 
end
local function format_time( timestamp, format )
	local table1 = explode( timestamp, ":" ); 
	if table1 == nil then return timestamp end; 
	local c = tablelength( table1 ); [DD], [HH], [MM], [SS,FF])
	local _, d = timestamp:gsub(":","");
	local _, t = format:gsub("$T","");
	local day, hour, minute, seconds, mili = 0, 0, 0, 0, 0; 
	if d == 3 then 
		if tableHasKey( table1, 1 ) then 
			day = table1[1];
		end;
		if tableHasKey( table1, 2 ) then 
			hour = table1[2];
		end
		if tableHasKey( table1, 3 ) then 
			minute = table1[3];
		end;
		if tableHasKey( table1, 4 ) then 
			seconds = table1[4];
			local table2 = explode( table1[4], "," );
			if tableHasKey( table2, 1 ) and tableHasKey( table2, 2 ) then 
				seconds = table2[1];
				mili = table2[2];
			end;	
		end;
	end;
	if d == 2 then 
		if tableHasKey( table1, 1 ) then 
			hour = table1[1];
		end;
		if tableHasKey( table1, 2 ) then 
			minute = table1[2];
		end;
		if tableHasKey( table1, 3 ) then 
			seconds = table1[3];
			local table2 = explode( table1[3], "," );
			if tableHasKey( table2, 1 ) and tableHasKey( table2, 2 ) then 
				seconds = table2[1];
				mili = table2[2];
			end;
		end;
	end;
	if d == 1 then 
		if tableHasKey( table1, 1 ) then 
			minute = table1[1];
		end;
		if tableHasKey( table1, 2 ) then 
			seconds = table1[2];
			local table2 = explode( table1[2], "," );
			if tableHasKey( table2, 1 ) and tableHasKey( table2, 2 ) then 
				seconds = table2[1];
				mili = table2[2];
			end	;
		end;
	end;
	if tonumber(day) < 10 then 
		day = "0"..day;
	end;
	timestamp = format:gsub("$T", ""):gsub("$D", day):gsub( "$H", hour):gsub("$M", minute):gsub("$S", seconds):gsub("$F", mili);
	if not show_mili then 
		format = format:gsub(",$F", ""):gsub("$F", ""); 
		timestamp = format:gsub("$T", ""):gsub("$D", day):gsub( "$H", hour):gsub("$M", minute):gsub("$S", seconds);
	end 
	if t ~= 0 and current_seconds > 0.01 then
		[0]+[:]?[0]+[:]?[0]+[:]?[0]?"
		local reg = "^[0:,]*" 
		timestamp = timestamp:gsub(reg, "");
	end	
	if current_seconds < 0.01 and ( timer_display == 1 and timer_mode ~= 1 ) then
		if not in_table({1,5}, timer_format ) then timestamp = "0" end; 
	end;
	if current_seconds < 0.01 and timer_display == 2 then 
		timestamp = ""; 
	end	;
	return timestamp;
end
local function long_time( time )
	local c_time = time;
	if time > 86399 then 
		c_time = math.floor( ( time ) / 86400 );
	end;
	if time < 86400 then
		c_time = 0;
	end;
	return c_time;
end
function get_minutes_allocation( str )
    local start_index, end_index = string.find(str, "%b{}")
    if start_index == nil then
        return nil
    end
    local inside = string.sub(str, start_index + 1, end_index - 1)
    local m_index, _ = string.find(inside, "M%d+")
    if m_index == nil then
        return nil
    end
    return tonumber(string.sub(inside, m_index + 1))
end
function removeBrackets(str)
    local start_index, end_index = string.find(str, "%b{}")
    if start_index == nil then
        return str
    end
    return string.sub(str, 1, start_index - 1) .. string.sub(str, end_index + 1)
end
local function set_timer_text_color( int )
	if in_table( {"Select", "select"}, timer_source ) then return end; 
	local source = obs.obs_get_source_by_name( timer_source ); 
	if source ~= nil then 
		local settings = obs.obs_source_get_settings( source ); 
		obs.obs_data_set_int( settings, "color", int ); 
	end
	obs.obs_source_update( source, settings ); 
	obs.obs_data_release( settings ); 
	obs.obs_source_release( source ); 
end
local function reset_text_a_colour_timer_callback()
	set_timer_text_color( media["color_normal"] );
	obs.remove_current_callback();
end
local function reset_text_a_colour_end_timer()
	obs.timer_remove( reset_text_a_colour_timer_callback ); 
end	
local function reset_text_a_colour_start_timer( int )
	if int ~= 0 then
		obs.timer_add( reset_text_a_colour_timer_callback, int ); 
	end
end	
local function reset_text_b_colour_timer_callback()
	set_timer_text_color( media["color_normal"] );
	obs.remove_current_callback();
end
local function reset_text_b_colour_end_timer()
	obs.timer_remove( reset_text_b_colour_timer_callback ); 
end	
local function reset_text_b_colour_start_timer( int )
	if int ~= 0 then
		obs.timer_add( reset_text_b_colour_timer_callback, int ); 
	end
end
local function show_split( props, settings )
	local config_value = obs.obs_data_get_int( settings, "config" );
	local mode = obs.obs_data_get_int( settings, "timer_mode" );
	local shw = false;
	shw = ( config_value == 2 and mode == 2 and in_table( {1, 2}, timer_format ) );
	if ( timer_format == 5 and config_value == 2 and mode == 2 ) then
		if ( string.find( custom_time_format, "$F" ) ~= nil ) then
			shw = true;
		else
			shw = false;
		end;
	end;
	return shw;
end
local function set_text( source_name, text )
	if source_name == "Select" or  source_name == "select" then
		return;
	end;	
	local source = obs.obs_get_source_by_name( source_name );
	if source ~= nil then
		local settings = obs.obs_source_get_settings( source );
		obs.obs_data_set_string( settings, "text", text );
	end;
	obs.obs_source_update( source, settings );
	obs.obs_data_release( settings );
	obs.obs_source_release( source );
end
local function marker_a_media_end_callback( )
	set_visible( media["source_name_audio_marker_a"], false );
	obs.remove_current_callback();
end		
local function marker_b_media_end_callback( )
	set_visible( media["source_name_audio_marker_b"], false );	
	obs.remove_current_callback();
end	
local function signal_media_ended( cd )
	local source = obs.calldata_source( cd, "source" );
	if source ~= nil then 
		local name = obs.obs_source_get_name( source );
		set_visible( name, false );
		obs.remove_current_callback();
	end	
end
local function disconnect_after_media_end( ref )
	local source_name = media["source_name_audio_".. ref]; 
	local source = obs.obs_get_source_by_name( source_name ); 
	if source ~= nil then  
		local source_id = obs.obs_source_get_unversioned_id( source ); 
		if source_id == "ffmpeg_source" then 
			local sh = obs.obs_source_get_signal_handler( source );	
			obs.signal_handler_connect( sh, "media_ended", signal_media_ended );	
		end;
	end;
	obs.obs_source_release( source );
end
local function start_media_action( source_name, ref )
	if in_table( ignore_list, source_name ) then return end;
	if not timer_active then return end; 
	if not media["activated_media_".. ref] then 
		media["current_seconds_".. ref] = math.ceil( current_seconds );
		set_visible( source_name, true );
		disconnect_after_media_end( ref );
		media["activated_media_".. ref] = true; 	
	end
end
local function start_media( source_name, ref )
	start_media_action( source_name, ref );
end
local function set_text_note_color( ref )
	if media["note_source_" .. ref] == "Select" then return end; 
	local source = obs.obs_get_source_by_name( media["note_source_" .. ref] ); 
	if source ~= nil then 
		local settings = obs.obs_source_get_settings( source ) 
			obs.obs_data_set_string( settings, "text", media["note_".. ref] ); 
			obs.obs_data_set_int( settings, "color", media["color_".. ref] ); 
	end;
	obs.obs_source_update( source, settings ); 
	obs.obs_data_release( settings ); 
	obs.obs_source_release( source ); 
end	
function roundSeconds()
		local round_seconds = math.ceil( current_seconds ); 
	if current_count_direction == "UP" then
		round_seconds = math.floor( current_seconds ); 
	end		
	return round_seconds
end
local function time_mark_check( ref )
	if not timer_active then return end; 
	local round_seconds = roundSeconds();
	local activation_time = media["activated_time_".. ref];
	local text_marker = media["text_".. ref];
	if activation_time == nil or text_marker == nil then 	
	end; 
	if ( current_count_direction == "UP" and activation_time < round_seconds ) or ( current_count_direction == "DOWN" and activation_time > round_seconds ) then  
			media["activated_".. ref] = false; 
	end
	if raw_time( round_seconds, true ) == text_marker and not media["activated_".. ref] then 
		media["activated_".. ref] = true; 
		media["activated_time_".. ref] = round_seconds; 
		if ref == "marker_a" and media["reset_text_marker_a"] ~= nil and media["reset_text_marker_a"] ~= 0 then 
			reset_text_a_colour_start_timer( math.floor( media["reset_text_marker_a"] * 1000 ) );
		end
		if ref == "marker_b" and media["reset_text_marker_b"] ~= nil and media["reset_text_marker_b"] ~= 0 then 
			reset_text_b_colour_start_timer( math.floor( media["reset_text_marker_b"] * 1000 )  );
		end		
		if enable_marker_notes ~= 1 and ref == "marker_a" then 
			set_visible( media["note_source_" .. ref], true );  
			set_visible( media["note_source_marker_b"], false );  
			set_text_note_color( ref ); 
		end;		
		if enable_marker_notes ~= 1 and ref == "marker_b" then 
			set_visible( media["note_source_" .. ref], true ); 
			set_visible( media["note_source_marker_a"], false ); 
			set_text_note_color( ref );  
		end;	
		set_timer_text_color( media["color_".. ref] );
		start_media( media["source_name_audio_".. ref], ref );
		update_time_markers( round_seconds );
		update_media_names(); 
		if ref == "marker_a" then record( 2, 100 ) end; 
		if ref == "marker_b" then record( 3, 100 ) end; 
	end;		
end
local function get_source_looping( source_name )
	local property = "looping"; 
	local source = obs.obs_get_source_by_name( source_name ); 
	local enabled = false;
    if source ~= nil then 
		local source_id = obs.obs_source_get_unversioned_id( source ); 
			if source_id == "ffmpeg_source" then 
				local settings = obs.obs_source_get_settings( source ); 
				enabled = obs.obs_data_get_bool( settings, property ); 
			end;
	end;
	obs.obs_data_release( settings ); 
	obs.obs_source_release( source ); 
	return enabled; 
end
local function stop_media_action( ref )
	local source_name = media["source_name_audio_".. ref]; 
	if in_table( ignore_list, source_name ) and not media["media_ended_".. ref]	then return end; 
	if media["duration_".. ref] ~= 0 and media_playback_limit ~= 1 then
		local source = obs.obs_get_source_by_name( source_name );
		if source ~= nil then 
			local state = obs.obs_source_media_get_state( source ); 
			if media["last_state_".. ref] ~= state then 
				if state == obs.OBS_MEDIA_STATE_PLAYING then
						local media_time_started = math.ceil( media["current_seconds_".. ref] );  
						local media_time_limit = math.floor( media["duration_".. ref] ); 
						local time_currently = math.ceil( current_seconds );  
						local media_time_remaining = 0; 
						local time_end = false; 
						if timer_mode == 1 then 
							media_time_remaining = media_time_started + media_time_limit; 
							time_end = ( time_currently >= media_time_remaining  ); 
						end						
						if timer_mode == 2 then 
							media_time_remaining = media_time_started - media_time_limit; 
							time_end = ( time_currently <= media_time_remaining  ); 
						end
						if time_end then 
							media["last_state_".. ref] = state; 
							media["media_ended_".. ref] = true; 
							set_visible( source_name, false ); 
						end
				end	;
			else 
				media["last_state_".. ref] = state; 
				if state == obs.OBS_MEDIA_STATE_STOPPED or state == obs.OBS_MEDIA_STATE_ENDED then 
					set_visible( source_name, false ); 
				end;
			end;	 
		end; 
	end;
    obs.obs_source_release( source ); 
end	
local function stop_media_playback( source_name )
	if in_table( ignore_list, source_name ) or not is_visible( source_name ) then return end;
		local source = obs.obs_get_source_by_name( source_name );
		if source ~= nil then
			local source_id = obs.obs_source_get_unversioned_id( source ); 
			if source_id ~= "ffmpeg_source" then return end; 
			local state = obs.obs_source_media_get_state( source ) 
			if state == obs.OBS_MEDIA_STATE_PLAYING or obs.OBS_MEDIA_STATE_PAUSED then
				obs.obs_source_media_stop( source );
			end;
		end;
		obs.obs_source_release( source );
end	
local function pause_play_media( source_name, play )
	if in_table( ignore_list, source_name ) or not is_visible( source_name ) then return end;
		local source = obs.obs_get_source_by_name( source_name );
		if source ~= nil then
			local source_id = obs.obs_source_get_unversioned_id( source ); 
			if source_id ~= "ffmpeg_source" then return end; 
			obs.obs_source_media_play_pause( source, play );
		end
		obs.obs_source_release( source );
end	
local function stop_looping_media( ref )
	local source_name = media["source_name_audio_".. ref];
	if get_source_looping( source_name ) then 
		stop_media_playback( source_name );
	end 
end
local function stop_media( ref, bypass )
	if bypass == nil then bypass = false end;
	if bypass then 
		set_visible( media["source_name_audio_".. ref], false );  
	else 
		stop_media_action( ref ); 
	end	
end
local function cycle_source_list_by_source_type( source_type )
	local i = 0;		
	local list = {}; 		
	local item_list =  {}; 	
	local data_list = obs_data_array_to_table( ctx.propsSet, "cycle_list" ); 
	local direction = 1;		
	if source_type ~= "source" then 
		direction = 1; 
		local scenes = obs.obs_frontend_get_scene_names(); 
		if scenes ~= nil then
			for _, scene in ipairs( scenes ) do 
				item_list[scene] = scene;		
			end
			obs.bfree( scene ); 
		end
	else 
		direction = 1;
		local sources = get_source_list(); 
		for key, value in pairsByKeys( sources ) do
			item_list[value] = value;
		end
	end
	for key, value in pairs( data_list ) do
		if in_table( item_list, value ) then
			i = i + 1;
			list[i] = value;
		end
	end	
	local count = tablelength( list );
	if cycle_index > count then
		cycle_index = 1;
	end	
	local index = 0;
	if cycle_direction ~= direction then
		index = 1;
	else
		index = count;
	end	
	for i = 1, count do 
		local index_match = ( index == cycle_index );
		if list[i] ~= nil then
			if source_type ~= "source" then --
				if index_match then
					local scene_source = obs.obs_frontend_get_current_scene();
					local name = obs.obs_source_get_name( scene_source );
					obs.obs_source_release( scene_source );
					local source = obs.obs_get_source_by_name( list[i] );
					if source ~= nil then
						obs.obs_frontend_set_current_scene( source );
					end
					obs.obs_source_release( source );
				end
			else
				set_visible( list[i], index_match );
			end
			if index_match then 
				if active_source_force_visible then 
					set_visible( active_source, true ) 
				end;
				set_text( active_source, list[i] ); 
			end;
		end;
		if cycle_direction ~= direction then
			index = index + 1;
		else
			index = index - 1;
		end;
	end;
	cycle_index = cycle_index + 1;		
end
local function scene_name_has_source_name( scene_name, source_name )
			scene_source = obs.obs_get_source_by_name( scene_name );
            local scenename = obs.obs_source_get_name( scene_source );
            local scene = obs.obs_scene_from_source( scene_source );
            local sceneitems = obs.obs_scene_enum_items( scene );
			local result = false;
            for key_sceneitem, value_sceneitem in pairs( sceneitems ) do
                local source = obs.obs_sceneitem_get_source( value_sceneitem );
				local source_name_parent = obs.obs_source_get_name( source );
				local group = obs.obs_group_from_source( source );
				if source_name_parent == source_name then
					result = true;
					break;
				end				
				if group ~= nil then
					local groupitems = obs.obs_scene_enum_items( group );	
					if groupitems ~= nil then
						for key_groupitem, value_groupitem in pairs( groupitems ) do
							local groupitemsource = obs.obs_sceneitem_get_source( value_groupitem );
							local source_name_group = obs.obs_source_get_name( groupitemsource );
							if source_name_group == source_name then
								result = true;
								break;
							end;
						end; 
						obs.sceneitem_list_release( groupitems );
					end;
				end;
            end; 
            obs.sceneitem_list_release( sceneitems );
		obs.obs_source_release( scene_source );
	return result;
end
local function activate_timer_on_scene( source, activating )
		if start_on_scene_active and activating then
			local source_id = obs.obs_source_get_id( source );
			local current_scene_source = obs.obs_frontend_get_current_scene();
			local current_scene_name = obs.obs_source_get_name( current_scene_source );
			obs.obs_source_release( current_scene_source );	
			if source_id == "scene" then
				if scene_name_has_source_name( current_scene_name, timer_source ) then			
					if not is_visible( timer_source ) then 
						set_visible( timer_source, true );
					end;
				end;
			end;
		end;
end	
local function update_properties_setting_int( reference, value )
	obs.obs_data_set_int( ctx.propsSet, reference, value );
	obs.obs_properties_apply_settings( ctx.propsDef, ctx.propsSet );
	return true
end
local function update_prop_settings_current_seconds( value )
	prevent_callback = true;
	obs.obs_data_set_double( ctx.propsSet, "sw_current_seconds", value );
	sw_current_seconds = value;
	obs.obs_properties_apply_settings( ctx.propsDef, ctx.propsSet );
	prevent_callback = false;
	return true;
end
local function timer_value( value )
	current_seconds = value;
	return current_seconds;
end
local function set_time_direction( )
	local t = 0;
	if direction_changed then 
		if current_count_direction == "UP" then
			t = ( current_seconds + time_frequency ); 
		else	
			t = ( current_seconds - time_frequency ); 
		end
	else 
		if timer_mode ~= 2 then
			t = ( current_seconds + time_frequency ); 
		else
			t = ( current_seconds - time_frequency ); 
		end
	end
	timer_value( t ); 
end
function update_timer_display( source_name, text )
	local source = obs.obs_get_source_by_name( source_name );
	if source ~= nil then
		local settings = obs.obs_source_get_settings( source );
		if not media["activated_media_marker_a"] and not media["activated_media_marker_b"] and not color_normal_updated then
			obs.obs_data_set_int( settings, "color", media["color_normal"] );
			color_normal_updated = true;
		end	
		time_mark_check( "marker_a" );
		time_mark_check( "marker_b" );
		obs.obs_data_set_string( settings, "text", text );	
	end
	obs.obs_source_update( source, settings );
	obs.obs_data_release( settings );
	obs.obs_source_release( source );
end
local function toggle_mili()
	if toggle_mili_trigger ~= "" and timer_mode == 2 and not mili_toggle_triggered then
		local time_offset = 1; 
		if raw_time( ( current_seconds + time_offset ), true ) == toggle_mili_trigger then
			mili( true );
			mili_toggle_triggered = true;
		end;
	end;
end
local function set_time_text( source_name )
	if source_name == nil then return end;
	if current_seconds <= 0.01 and ( timer_mode ~= 1 or ( direction_changed and current_count_direction == "DOWN" and prevent_negative_time ) ) then 
		timer_value( 0 );   
	end;
	toggle_mili();
	local l_time = long_time( current_seconds );
	local t_time = raw_time( current_seconds );
	local text = tostring( raw_time( current_seconds ) );
	if timer_format == 2 then
		local system_time_format = "$T$H:$M:$S,$F";
		text = format_time( ( l_time ~= 0 ) and string.format( "%s:%s", l_time, t_time ) or string.format( "%s", t_time ), system_time_format );
	end	
	if timer_format == 3 then
		local system_time_format = "$T$H:$M:$S";
		text = format_time( ( l_time ~= 0 ) and string.format( "%s:%s", l_time, t_time ) or string.format( "%s", t_time ), system_time_format );
	end
	if timer_format == 4 then
		local system_time_format = "$H:$M:$S";
		text = format_time( ( l_time ~= 0 ) and string.format( "%s:%s", l_time, t_time ) or string.format( "%s", t_time ), system_time_format );
	end
	if timer_format ~= 5 then
		if timer_mode == 2 and countdown_type == 1 and current_seconds ~= 0 then
			local longtimetext = longtimetext_p;
			if math.floor( current_seconds / 86400 ) <= 1 then
				longtimetext = longtimetext_s;
			end
			if math.floor( current_seconds / 86400 ) <= 0 then
				longtimetext = longtimetext_p;
			end		
			text = string.gsub(longtimetext .. text, "[#]", long_time( current_seconds ));
		end		
	end
	if timer_format == 5 then
		text = format_time( ( l_time ~= 0 ) and string.format( "%s:%s", l_time, t_time ) or string.format( "%s", t_time ), removeBrackets(custom_time_format) );
	end	
	if timer_mode ~= 2 then
	end
	text = text_prefix .. text .. text_suffix;
	if text ~= last_text then 
		update_timer_display( timer_source, text );
	end
	stop_media( "marker_a" );
	stop_media( "marker_b" );
	last_text = text;
	if current_seconds <= 0.01 and ( timer_mode ~= 1 or ( direction_changed and current_count_direction == "DOWN" and prevent_negative_time ) ) then
		--
		if enable_marker_notes ~= 1 then 
			set_visible( media["note_source_marker_a"], false );
			set_visible( media["note_source_marker_b"], false );  
		end		
		--
		if timer_active then timer_ended( source_name ) end;
		--
		if current_seconds == 0 then timer_expired = true end;
	end
end
local function split_unpack()
	local data = nil;
	local c = table.getn( split_itm );
	local text = "";
	local title = "";
	local subtitle = "";
	local line = "______________________________";
    for i = 1, c do 
		local mark = split_itm[i];
		local interval = mark;
		if i > 1 then
			local j = i - 1;
			interval = split_itm[i] - split_itm[j];
		end
		if split_type == 1 then
			title = "Interval";
			text = tostring( raw_time( interval ) );
		elseif split_type == 2 then
			title = "Mark";
			text = tostring( raw_time( mark ) );
		elseif split_type == 3 then
			title = "Mark                     ";
			subtitle = "Interval";
			text = tostring( raw_time( mark ).."          "..raw_time( interval ) );
		else	
			title = "Interval                  ";
			subtitle = "Mark";
		text = tostring( raw_time( interval ).."          "..raw_time( mark ) );
		end;
		local n = i 
		if i < 10 then n = "0"..tostring( i ) end;
		if data ~= nil then 	
			data = data .. "\n" .. n.." )    "..text;
		else
			data = "#       "..title..subtitle.."\n"..line.."\n\n"..n.." )    "..text;
		end
	end	
	split_data = data;
end
local function update_default_time()
	if next_scene == "Source List" or next_scene == "Scene List" then
		return true;
	end	
	return false;
end
local function set_split_text( source_name )
	if in_table( ignore_list, source_name ) then return end;
	local text = split_data;
	if text ~= last_split_data then
		set_text( source_name, text );
	end
	last_split_data = text;
end
local function default_timer_globals( set_to_default )
	if set_to_default then
		if timer_mode == 1 and reset_activated then
			timer_value( 0 );
			update_prop_settings_current_seconds( 0 );
		end	
		color_normal_updated = false;
		media["activated_media_marker_a"] 		= false;
		media["activated_media_marker_b"] 		= false;
		media["activated_marker_a"] 			= false;
		media["activated_marker_b"] 			= false;
		media["activated_time_marker_a"] 		= 0;
		media["activated_time_marker_b"] 		= 0;
	end
	timer_expired = true;
	completed_cycles = 0;
	split_count = 0;
	split_itm = {};
	split_data = nil;
	set_split_text( split_source );
	orig_time = obs.os_gettime_ns();
	set_visible( media["note_source_marker_a"], false );
	set_visible( media["note_source_marker_b"], false );
	mili_toggle_triggered = false;
	media["last_state_marker_a"]		= obs.OBS_MEDIA_STATE_NONE;
	media["last_state_marker_b"]		= obs.OBS_MEDIA_STATE_NONE;
end
local function reset_mili( )
	if timer_mode ~= 2 then
		return true;
	end	
	if toggle_mili_trigger ~= "" then
		show_mili = false;
	else
		show_mili = true;
	end	
end
local function update_timer_settings( set_to_default, new_settings ) 
	local update_timer_display = false;
	if set_to_default == nil then set_to_default = false end; 
	if new_settings == nil then new_settings = ctx.propsSet end; 
	reset_mili( );
	if timer_mode == 1 then
		update_timer_display = true;
		if timer_mode_changed or force_reset_on_visible or force_reset_on_scene_active then timer_value( 0 ) end;  
		default_timer_globals( set_to_default );	
	end		
	if timer_mode == 2 then		
		if timer_mode_changed then timer_value( 0 ) end; 
		 update_timer_display = true;
		local calculated_time = 0;
		if countdown_type == 1 then
			calculated_time = ( delta_time( timer_year, timer_month, timer_day, timer_hours, timer_minutes, timer_seconds ) );
			timer_value( calculated_time );
		else
			calculated_time = (  
			( obs.obs_data_get_int( new_settings, "hours" )*60*60 ) + 
			( obs.obs_data_get_int( new_settings, "minutes" )*60 ) + 
			obs.obs_data_get_int( new_settings, "seconds" )
				);
		end
		local do_update = 
		( 
			timer_expired 
			and 
			not timer_active 
			and 
			not activated 
			and 
			not set_to_default 
			or 
			in_table( {"Source List", "Scene List"}, next_scene )
			or
			timer_mode_changed
		);
		if do_update then	
			timer_value( calculated_time ); 
			default_seconds = current_seconds;
		end	
		if set_to_default and update_default_time() or reset_activated or ( force_reset_on_visible or force_reset_on_scene_active and set_to_default ) then	
			timer_value( default_seconds ); 
		end	
		default_timer_globals( set_to_default );		
	end
	if update_timer_display then 	
		set_time_text( timer_source );
	end
	update_timer_display = false;
end
local function timer_callback()
	time_frequency = get_frequency( ns_last );
	set_time_direction( );
	completed_cycles = completed_cycles + 1; 
	set_time_text( timer_source );
end	
local function end_timer()
	timer_active = false;
	obs.timer_remove( timer_callback ); 
end	
local function start_timer()
	record( 5, 100 ); 
	timer_active = true;
	obs.timer_add( timer_callback, timer_cycle ); 
end	
local function activate( activating )
	if disable_script then
		return;
	end
	if timer_active and not activating then
		split_unpack();
		set_split_text( split_source );
	end
	activated = activating;
	if activating then
		timer_expired = false;
		set_timer_activated = false;
		start_timer(); 
	else
			reset_text_a_colour_end_timer();
			reset_text_b_colour_end_timer();
		if timer_expired and timer_active then
			end_timer() 
			set_visible( media["source_name_audio_marker_a"], false ); 
			set_visible( media["source_name_audio_marker_b"], false ); 
		else
			end_timer(); 
		end
		if not timer_active then 
		end;
	end;
end
local function pause( pressed )
	if not pressed then 
		return;
	end
	set_visible( timer_source, true );
	if timer_active then
		activate( false );
	else
		if activated == false then	
			activate( true );
		end;
	end;
	pause_play_media( media["source_name_audio_marker_a"], not timer_active );
	pause_play_media( media["source_name_audio_marker_b"], not timer_active );
	return;
end
local function hotkey_send_pause( pressed )
	if pressed then 
	else 
		return; 
	end;
	pause( pressed );
end	
local function set_stopwatch()
	time_frequency = get_frequency( ns_last );
	local hh = ( sw_hours_saved * 3600 );
	local mm = 0;
	if minute_format ~= nil then
		mm = ( sw_minutes_saved * minute_format );
	else
		mm = ( sw_minutes_saved * 60 );	
	end
	mm = ( sw_minutes_saved * 60 );
	local ss = ( sw_seconds_saved );
	local ff = ( sw_milliseconds_saved / ( 99 + time_frequency ) );
	local time = ( hh + mm + ss + ff ); 
	timer_value( time ); 
	set_time_text( timer_source );
end	
local function is_leap_year( year )
	if year % 4 == 0 then 
		if year % 100 == 0 then
			if year % 400 == 0 then
			  return true;
			else
			  return false;
			end;		
		else
		 return true;
		end;
	else
		return false;
	end;
end
local function mili_button_clicked( props, p, settings )
	mili( true );
	return true;
end	
local function update_button_label( props )
	local mode = obs.obs_data_get_int( ctx.propsSet, "timer_mode" );
	local direction_button_prop = obs.obs_properties_get( props, "direction_button" );
	if current_count_direction == "DOWN" then
		obs.obs_property_set_description( direction_button_prop, "Count Up" );
	else
		obs.obs_property_set_description( direction_button_prop, "Count Down" );
	end	
	return true;
end
local function direction_button_clicked( props, p, settings )
	if not enable_direction_toggle then
		return;
	end	
	update_timer_direction( true );
	update_button_label( props );
	return true;
end	
function update_timer_direction( pressed )	
	if not pressed and not enable_direction_toggle then
		return;
	end
	current_count_direction = ( current_count_direction == "UP" and "DOWN" or "UP")
	if timer_mode == 1 then
		count_orientation = current_count_direction == "UP" and "NORMAL" or "INVERTED"
	end
	if timer_mode == 2 then
		count_orientation = current_count_direction == "DOWN" and "NORMAL" or "INVERTED"
	end
	if count_orientation == "INVERTED" then
		direction_changed = true;
	else
		direction_changed = false;
	end
	local round_seconds = roundSeconds()
		update_time_markers( round_seconds )
		update_media_names(); 
	return true;
end
function mili( pressed )	
	if not pressed then
		return;
	end
	if show_mili then
		show_mili = false;
	else
		show_mili = true;
	end
	if not timer_active then
		set_time_text( timer_source );
	end	
	local mode = obs.obs_data_get_int( ctx.propsSet, "timer_mode" );
	local mili_button_prop = obs.obs_properties_get( props, "mili_button" ); 
	if show_mili then
		obs.obs_property_set_description( mili_button_prop, "Hide Milliseconds" );
	else
		obs.obs_property_set_description( mili_button_prop, "Show Milliseconds" );
	end
	return true
end
local function hotkey_send_mili( pressed )
	if pressed then 
	else 
		return 
	end
	mili( pressed )
end
local function hotkey_send_direction( pressed )
	if pressed then 
	else 
		return 
	end
	update_timer_direction( true )
end
function sal_timer_callback()
	if timer_manipulation == 3 then return end;
	set_visible( add_limit_note_source, false );
	obs.timer_remove( sal_timer_callback );
	obs.remove_current_callback();
end
function start_sal_timer()
	if timer_manipulation == 3 then return end;
	set_visible( add_limit_note_source, true );
	if add_limit_note_source_visible == 0 then return end;
	obs.timer_add( sal_timer_callback, add_limit_note_source_visible );
end	
local function sal_check( )
	if timer_manipulation == 3 then return end;
	if sec_add_limit == 0 then return end;
	if sec_add_limit_used >= sec_add_limit then
		start_sal_timer();
	else
		set_visible( add_limit_note_source, false );
	end	
end
local function sec_add_1_update( )
	if timer_manipulation == 3 then return end;
	if sec_add_limit ~= 0 and sec_add_limit_used >= sec_add_limit then
	else 
		timer_value( current_seconds + sec_add_1  );
		local update_value = sec_add_limit_used + 1;
		sec_add_limit_used = update_value;
		update_properties_setting_int( "sec_add_limit_used", update_value );
	end;
	sal_check( );
	return true;
end
local function sec_add_2_update( )
	if timer_manipulation == 3 then return end;
	if sec_add_limit ~= 0 and sec_add_limit_used >= sec_add_limit then
	else 
		timer_value( current_seconds + sec_add_2  );
		local update_value = sec_add_limit_used + 1;
		sec_add_limit_used = update_value;
		update_properties_setting_int( "sec_add_limit_used", update_value );
	end;
	sal_check( );
	return true;
end
local function sec_add_3_update( )
	if timer_manipulation == 3 then return end;
	if sec_add_limit ~= 0 and sec_add_limit_used >= sec_add_limit then
	else 
		timer_value( current_seconds + sec_add_3  );
		local update_value = sec_add_limit_used + 1;
		sec_add_limit_used = update_value;
		update_properties_setting_int( "sec_add_limit_used", update_value );	
	end;
	sal_check( );
	return true;
end
function ssl_timer_callback()
	if timer_manipulation == 3 then return end;
	set_visible( sub_limit_note_source, false );
	obs.timer_remove( ssl_timer_callback );
	obs.remove_current_callback();
end
function start_ssl_timer()
	if timer_manipulation == 3 then return end;
	set_visible( sub_limit_note_source, true );
	if sub_limit_note_source_visible == 0 then return end;
	obs.timer_add( ssl_timer_callback, sub_limit_note_source_visible );
end	
local function ssl_check( )
	if timer_manipulation == 3 then return end;
	if sec_sub_limit == 0 then return end;
	if sec_sub_limit_used >= sec_sub_limit then
		start_ssl_timer();
	else
		set_visible( sub_limit_note_source, false );
	end	
end
local function sec_sub_1_update( )
	if timer_manipulation == 3 then return end;
	if sec_sub_limit ~= 0 and sec_sub_limit_used >= sec_sub_limit then
	else 
		timer_value( current_seconds - sec_sub_1  );
		local update_value = sec_sub_limit_used + 1;
		sec_sub_limit_used = update_value;
		update_properties_setting_int( "sec_sub_limit_used", update_value );
	end;
	ssl_check( );
	return true;
end
local function sec_sub_2_update( )
	if timer_manipulation == 3 then return end;
	if sec_sub_limit ~= 0 and sec_sub_limit_used >= sec_sub_limit then
	else 
		timer_value( current_seconds - sec_sub_2  );
		local update_value = sec_sub_limit_used + 1;
		sec_sub_limit_used = update_value;
		update_properties_setting_int( "sec_sub_limit_used", update_value );	
	end;
	ssl_check( );
end
local function sec_sub_3_update( )
	if timer_manipulation == 3 then return end;
	if sec_sub_limit ~= 0 and sec_sub_limit_used >= sec_sub_limit then
	else 
		timer_value( current_seconds - sec_sub_3  );
		local update_value = sec_sub_limit_used + 1;
		sec_sub_limit_used = update_value;
		update_properties_setting_int( "sec_sub_limit_used", update_value );
	end;
	ssl_check( );
end
local function hotkey_send_sec_add_1( pressed )
	if pressed then 
	else 
		return; 
	end;
	sec_add_1_update( );
end
local function hotkey_send_sec_add_2( pressed )
	if pressed then 
	else 
		return; 
	end;
	sec_add_2_update( );
end
local function hotkey_send_sec_add_3( pressed )
	if pressed then 
	else 
		return; 
	end;
	sec_add_3_update( );
end
local function hotkey_send_sec_sub_1( pressed )
	if pressed then 
	else 
		return; 
	end;
	sec_sub_1_update( );
end
local function hotkey_send_sec_sub_2( pressed )
	if pressed then 
	else 
		return; 
	end
	sec_sub_2_update( );
end
local function hotkey_send_sec_sub_3( pressed )
	if pressed then 
	else 
		return; 
	end;
	sec_sub_3_update( );
end
local function activate_signal( cd, connected )
	local source = obs.calldata_source( cd, "source" );
	if source ~= nil then
		local name = obs.obs_source_get_name( source ); 
		activate_timer_on_scene( source, connected );
		if ( name == timer_source ) then
			if connected then record( 4, 300 ) end;
			if start_on_visible or start_on_scene_active then
				if not connected then				
					pause_play_media( media["source_name_audio_marker_a"], true );
					pause_play_media( media["source_name_audio_marker_b"], true );
				end
				if not set_timer_activated and ( force_reset_on_visible or force_reset_on_scene_active ) then
					update_timer_settings( true ); 
				end
				if connected then	
					activate( true );
				else
					activate( false );
				end;
			end;
		end;
	end;
end
local function reset( pressed )
	if not script_ready then return end
	reset_activated = true; 
	if pressed then 
	else 
	end
	set_visible( media["source_name_audio_marker_a"], false );
	set_visible( media["source_name_audio_marker_b"], false );
	set_visible( media["source_name_audio_marker_end"], false );
	media["cycle_index_marker_a"] = 1; 
	media["cycle_index_marker_b"] = 1; 
	media["cycle_direction_marker_a"] = 2;
	media["cycle_direction_marker_b"] = 2;
	cycle_index = 1;
	set_visible( add_limit_note_source, false );
	set_visible( sub_limit_note_source, false );
	obs.obs_data_set_int( ctx.propsSet, "sec_add_limit_used", 0 );
	obs.obs_data_set_int( ctx.propsSet, "sec_sub_limit_used", 0 );
	obs.obs_properties_apply_settings( ctx.propsDef, ctx.propsSet );
	sec_add_limit_used					= 0;
	sec_sub_limit_used					= 0;
	media["media_ended_marker_a"] 	= false;
	media["media_ended_marker_b"] 	= false;
	color_normal_updated 		  	= false;
	set_timer_activated 		  	= false;
	direction_changed				= false;
	media["activated_media_marker_a"] 		= false;
	media["activated_media_marker_b"] 		= false;
	media["activated_marker_a"] 			= false;
	media["activated_marker_b"] 			= false;
	media["activated_time_marker_a"] 		= 0;
	media["activated_time_marker_b"] 		= 0;
	count_orientation = "NORMAL"
	last_orientation = "NORMAL"
	if timer_mode == 1 then
		current_count_direction = "UP";
	else
		current_count_direction = "DOWN";
	end		
	last_text = tostring( obs.os_gettime_ns() );
	update_timer_settings( true ); 
	activate( false ); 
	set_split_text( split_source );
	if active_source ~= "Select" then 
		set_text( active_source, "" ); 
		if active_source_force_visible then set_visible( active_source, false ) end;
	end
	reset_audio_marker_arr();
	local round_seconds = roundSeconds();
	update_time_markers( round_seconds );		
	update_media_names( true );	
	reset_activated = false; 
end
local function activate_reset( pressed )
	if pressed then 
	else 
		return; 
	end
	reset( pressed );
end	
local function hotkey_send_reset( pressed )
	if pressed then 
	else 
		return; 
	end
	activate_reset( pressed );
end
local function property_button_update_start( props )
	local mode = obs.obs_data_get_int( ctx.propsSet, "timer_mode" );
	local pause_button_prop = obs.obs_properties_get( props, "pause_button" );
	local direction_button_prop = obs.obs_properties_get( props, "direction_button" );
	if mode == 2 then
			obs.obs_property_set_description( direction_button_prop, "Count Up" );
		if timer_active then
			obs.obs_property_set_description( pause_button_prop, "Start/Pause Countdown" );
		else
			obs.obs_property_set_description( pause_button_prop, "Start Countdown" );
		end;
	else
			obs.obs_property_set_description( direction_button_prop, "Count Down" );
		if timer_active then
			obs.obs_property_set_description( pause_button_prop, "Start/Pause Stopwatch" );
		else
			obs.obs_property_set_description( pause_button_prop, "Start Stopwatch" );
		end;
	end;
	return props;
end		
local function pause_button_clicked( props, p )
	pause( true );
	property_button_update_start( props );
	return true;
end	
local function sec_add_1_button_clicked( props, p )
	sec_add_1_update( );
	return true;
end
local function sec_add_2_button_clicked( props, p )
	sec_add_2_update( );
	return true;
end
local function sec_add_3_button_clicked( props, p )
	sec_add_3_update( );
	return true;
end
local function sec_sub_1_button_clicked( props, p )
	sec_sub_1_update( );
	return true;
end
local function sec_sub_2_button_clicked( props, p )
	sec_sub_2_update( );
	return true;
end
local function sec_sub_3_button_clicked( props, p )
	sec_sub_3_update( );
	return true;
end
local function export( pressed )
	if not pressed then
		return;
	end;
	local file_exported = write_to_json( ctx.propsSet );
end
local function export_button_clicked( props, p )
	export( true );
	return false;
end
local function import_button_clicked( props, p, settings )
	return true;
end
local function sw_saved_button_clicked( props, p, settings )
	if timer_mode == 1 then
		set_stopwatch();
		set_timer_activated = true;
	end;
	return false;
end
local function reset_button_clicked( props, p, settings )
	activate_reset( true );
	return true;
end
local function split_time( pressed )
	if not pressed then
		return;
	end;
	if timer_active then
		split_count = split_count + 1;
		split_itm[split_count] = current_seconds;
		split_unpack();
		set_split_text( split_source );
	end;
end
local function hotkey_send_split( pressed )
	if pressed then 
	else 
		return; 
	end
	split_time( pressed );
end
local function split_button_clicked( props, p )
	split_time( true );
	return false;
end
local function count_sources()
	local sources = obs.obs_enum_sources();
	local i = 0;
	if sources ~= nil then
		for _, source in ipairs( sources ) do 
			i = i + 1;
		end
		obs.bfree(source); 
	end;
	obs.source_list_release( sources ); 
	total_sources = i;
	return i;
end
local function load_settings_globals( settings )
	last_timer_mode = timer_mode;
	timer_day = obs.obs_data_get_int( settings, "day" );
	timer_year = obs.obs_data_get_int( settings, "year" );
	timer_hours = obs.obs_data_get_int( settings, "hours" );
	timer_month = obs.obs_data_get_int( settings, "month" ) - 1;
	timer_manipulation = obs.obs_data_get_int( settings, "timer_manipulation" );
	sec_add_1 = obs.obs_data_get_int( settings, "sec_add_1" );
	sec_add_2 = obs.obs_data_get_int( settings, "sec_add_2" );
	sec_add_3 = obs.obs_data_get_int( settings, "sec_add_3" );
	sec_sub_1 = obs.obs_data_get_int( settings, "sec_sub_1" );
	sec_sub_2 = obs.obs_data_get_int( settings, "sec_sub_2" );
	sec_sub_3 = obs.obs_data_get_int( settings, "sec_sub_3" );
	sec_add_limit = obs.obs_data_get_int( settings, "sec_add_limit" );
	sec_add_limit_used = obs.obs_data_get_int( settings, "sec_add_limit_used" );
	sec_sub_limit = obs.obs_data_get_int( settings, "sec_sub_limit" );
	sec_sub_limit_used = obs.obs_data_get_int( settings, "sec_sub_limit_used" );
	timer_mode = obs.obs_data_get_int( settings, "timer_mode" );
	timer_minutes = obs.obs_data_get_int( settings, "minutes" );
	timer_seconds = obs.obs_data_get_int( settings, "seconds" );
	add_limit_note_source = obs.obs_data_get_string( settings, "add_limit_note_source" );
	sub_limit_note_source = obs.obs_data_get_string( settings, "sub_limit_note_source" );
	add_limit_note_source_visible = obs.obs_data_get_int( settings, "add_limit_note_source_visible" );
	sub_limit_note_source_visible = obs.obs_data_get_int( settings, "sub_limit_note_source_visible" );
	enable_marker_notes = obs.obs_data_get_int( settings, "enable_marker_notes" );
	timer_format = obs.obs_data_get_int( settings, "timer_format" );
	timer_source = obs.obs_data_get_string( settings, "timer_source" );
	timer_display = obs.obs_data_get_int( settings, "timer_display" );
	countdown_type = obs.obs_data_get_int( settings, "countdown_type" );
	sw_hours_saved = obs.obs_data_get_int( settings, "sw_hours_saved" );
	cycle_direction = obs.obs_data_get_int( settings, "cycle_direction" );
	sw_current_seconds = obs.obs_data_get_double( settings, "sw_current_seconds" );
	load_saved_time = obs.obs_data_get_bool( settings, "load_saved_time" );
	sw_minutes_saved = obs.obs_data_get_int( settings, "sw_minutes_saved" );
	sw_seconds_saved = obs.obs_data_get_int( settings, "sw_seconds_saved" );
	custom_time_format = obs.obs_data_get_string( settings, "custom_time_format" );
	toggle_mili_trigger = obs.obs_data_get_string( settings, "toggle_mili_trigger" );
	sw_milliseconds_saved = obs.obs_data_get_int( settings, "sw_milliseconds_saved" );
	prevent_negative_time = obs.obs_data_get_bool( settings, "prevent_negative_time" );
	media["note_source_marker_a"] = obs.obs_data_get_string( settings, "note_source_marker_a" );
	media["note_source_marker_b"] = obs.obs_data_get_string( settings, "note_source_marker_b" );
	note_source_marker_a = obs.obs_data_get_string( settings, "note_source_marker_a" );
	note_source_marker_b = obs.obs_data_get_string( settings, "note_source_marker_b" );
	longtimetext_s = string.gsub(obs.obs_data_get_string( settings, "day_text" ), "\\([n])", {n="\n"});
	longtimetext_p = string.gsub(obs.obs_data_get_string( settings, "days_text" ), "\\([n])", {n="\n"});
	media["note_marker_a"] = string.gsub(obs.obs_data_get_string( settings, "note_marker_a" ), "\\([n])", {n="\n"});
	media["note_marker_b"] = string.gsub(obs.obs_data_get_string( settings, "note_marker_b" ), "\\([n])", {n="\n"});
	script_ready = obs.obs_data_get_bool( settings, "script_ready" );
	default_seconds = current_seconds;
	split_type = obs.obs_data_get_int( settings, "split_type" );
	stop_text = obs.obs_data_get_string( settings, "stop_text" );
	next_scene = obs.obs_data_get_string( settings, "next_scene" );
	import_list = obs.obs_data_get_string( settings, "import_list" );
	split_source = obs.obs_data_get_string( settings, "split_source" );
    disable_script = obs.obs_data_get_bool( settings, "disable_script" );
    enable_direction_toggle = obs.obs_data_get_bool( settings, "enable_direction_toggle" );
	recording_type = obs.obs_data_get_int( settings, "recording_type" );
	backup_folder = obs.obs_data_get_string( settings, "backup_folder" );
	active_source = obs.obs_data_get_string( settings, "active_source" );
	start_recording = obs.obs_data_get_int( settings, "start_recording" );
	load_saved_time = obs.obs_data_get_bool( settings, "load_saved_time" );
    start_on_visible = obs.obs_data_get_bool( settings, "start_on_visible" );													
	media["color_normal"] = obs.obs_data_get_int( settings, "color_normal" );
	media["color_marker_b"] = obs.obs_data_get_int( settings, "color_marker_b" );
	media["color_marker_a"] = obs.obs_data_get_int( settings, "color_marker_a" );
	audio_marker_a = obs.obs_data_get_string( ctx.propsSet, "audio_marker_a" );
	audio_marker_b = obs.obs_data_get_string( ctx.propsSet, "audio_marker_b" );
	if audio_marker_a ~= "list" then
		media["source_name_audio_marker_a"] = audio_marker_a
	end	
	if audio_marker_a ~= "list" then
		media["source_name_audio_marker_b"] = audio_marker_b
	end	
	media_playback_limit = obs.obs_data_get_int( settings, "media_playback_limit" );
    start_on_scene_active = obs.obs_data_get_bool( settings, "start_on_scene_active" );
    force_reset_on_visible = obs.obs_data_get_bool( settings, "force_reset_on_visible" );
    force_reset_on_scene_active = obs.obs_data_get_bool( settings, "force_reset_on_scene_active" );
    active_source_force_visible = obs.obs_data_get_bool( settings, "active_source_force_visible" );
	media["source_name_audio_marker_end"] = obs.obs_data_get_string( settings, "audio_marker_end" );	
	text_prefix = string.gsub(obs.obs_data_get_string( settings, "text_prefix" ), "\\([n])", {n="\n"});
	text_suffix = string.gsub(obs.obs_data_get_string( settings, "text_suffix" ), "\\([n])", {n="\n"});
	media["reset_text_marker_a"] = obs.obs_data_get_int( settings, "reset_text_marker_a" );
	media["reset_text_marker_b"] = obs.obs_data_get_int( settings, "reset_text_marker_b" );
	if media_playback_limit ~= 1 then
		media["duration_marker_a"] = obs.obs_data_get_int( settings, "duration_marker_a" );
		media["duration_marker_b"] = obs.obs_data_get_int( settings, "duration_marker_b" );
		media["duration_marker_end"] = obs.obs_data_get_int( settings, "duration_marker_end" );
	else
		media["duration_marker_a"] = 0;
		media["duration_marker_b"] = 0;
		media["duration_marker_end"] = 0;
	end;
	if not load_saved_time then sw_current_seconds = 0 end;
	timer_mode_changed = ( last_timer_mode ~= timer_mode );
	update_source_list();
end
local function loaded( cd )
	obs.obs_data_set_bool( settings, "script_ready", false ); 
	local all_sources_loaded = false;
	local source = obs.calldata_source( cd, "source" );
	if source ~= nil then 
		local name = obs.obs_source_get_name( source ); 
		if ( name == timer_source ) then
			if start_on_visible and not start_on_scene_active then
				set_visible( timer_source, false ); 
			end;
		end;
		if obs.obs_source_get_id( source ) ~= "scene" then
			sources_loaded = sources_loaded + 1; 
		end;	
	end;
	all_sources_loaded = ( sources_loaded == count_sources() );
	if all_sources_loaded then
		obs.obs_data_set_bool( ctx.propsSet, "script_ready", true ); 
		load_settings_globals( ctx.propsSet );	
		set_visible( media["source_name_audio_marker_a"], false ); 
		set_visible( media["source_name_audio_marker_b"], false ); 
		set_visible( media["source_name_audio_marker_end"], false ); 
		set_visible( add_limit_note_source, false );	
		set_visible( sub_limit_note_source, false ); 
		if start_on_visible and not start_on_scene_active then
			set_visible( timer_source, false ) 
		end	
		if timer_mode == 1 then
			if load_saved_time then
				timer_value( sw_current_seconds ); 
			else
				timer_value( 0 );
				reset( true );	
			end;
		else
			reset( true );	
		end;	
	end;	
end
local function source_activated( cd )
   if disable_script then
		return;		
	end;
	activate_signal( cd, true );
end
local function source_deactivated( cd )
	activate_signal( cd, false );
end
local function import_properties( props, property, settings )
	local import_folder = backup_folder
	import_folder = import_folder .. "/" .. import_list .. ".json"
	import_folder = import_folder:gsub([[\]], "/");
	if obs.os_file_exists( import_folder ) then
		data = obs.obs_data_create_from_json_file( import_folder )
		if data ~= nil then
			obs.obs_data_apply( settings, data )
			obs.obs_data_set_string( settings, "import_list", "select")
			ctx.propsSet = settings
		end	
	end
	return true
end
local function property_onchange( props, property, settings )
	local property_name = obs.obs_property_name( property );
	if prevent_callback then return end
	local day_value = obs.obs_data_get_int( settings, "day" );
	local year_value = obs.obs_data_get_int( settings, "year" );
	local month_value = obs.obs_data_get_int( settings, "month" );
	local config_value = obs.obs_data_get_int( settings, "config" );
	local timer_mode_value = obs.obs_data_get_int( settings, "timer_mode" );
	local backup_mode_value = obs.obs_data_get_bool( settings, "backup_mode" );
	local enable_marker_notes_value = obs.obs_data_get_int( settings, "enable_marker_notes" );
	local import_list_value = obs.obs_data_get_string( settings, "import_list" );
	local next_scene_value = obs.obs_data_get_string( settings, "next_scene" );	
	local timer_options_value = obs.obs_data_get_int( settings, "timer_options" );
	local timer_source_value = obs.obs_data_get_string( settings, "timer_source" );
	local split_source_value = obs.obs_data_get_string( settings, "split_source" );
	local set_stopwatch_value = obs.obs_data_get_bool( settings, "set_stopwatch" );
	local countdown_type_value = obs.obs_data_get_int( settings, "countdown_type" );
	local active_source_value = obs.obs_data_get_string( settings, "active_source" );
	local start_recording_value = obs.obs_data_get_int( settings, "start_recording" );
	local trigger_options_value = obs.obs_data_get_int( settings, "trigger_options" );
	local note_source_marker_a_value = obs.obs_data_get_string( settings, "note_source_marker_a" );
	local note_source_marker_b_value = obs.obs_data_get_string( settings, "note_source_marker_b" );
	local audio_marker_a_value = obs.obs_data_get_string( settings, "audio_marker_a" );
	local audio_marker_b_value = obs.obs_data_get_string( settings, "audio_marker_b" );
	local media_playback_limit_value = obs.obs_data_get_int( settings, "media_playback_limit" );
	local backup_mode_prop = obs.obs_properties_get( props, "backup_mode" );
	local import_list_prop = obs.obs_properties_get( props, "import_list" );
	local sec_add_1_prop = obs.obs_properties_get( props, "sec_add_1" );
	local sec_add_2_prop = obs.obs_properties_get( props, "sec_add_2" );
	local sec_add_3_prop = obs.obs_properties_get( props, "sec_add_3" );
	local sec_sub_1_prop = obs.obs_properties_get( props, "sec_sub_1" );
	local sec_sub_2_prop = obs.obs_properties_get( props, "sec_sub_2" );
	local sec_sub_3_prop = obs.obs_properties_get( props, "sec_sub_3" );
	local sec_add_limit_prop = obs.obs_properties_get( props, "sec_add_limit" );
	local sec_sub_limit_prop = obs.obs_properties_get( props, "sec_sub_limit" );
	local timer_manipulation_prop = obs.obs_properties_get( props, "timer_manipulation" );
	local mili_button_prop = obs.obs_properties_get( props, "mili_button" );
	local timer_source_prop = obs.obs_properties_get( props, "timer_source" );
	local pause_button_prop = obs.obs_properties_get( props, "pause_button" );
	local direction_button_prop = obs.obs_properties_get( props, "direction_button" );
	local timer_options_prop = obs.obs_properties_get( props, "timer_options" );
	local custom_time_format_prop = obs.obs_properties_get( props, "custom_time_format" );
	local toggle_mili_trigger_prop = obs.obs_properties_get( props, "toggle_mili_trigger" );
	local add_limit_note_source_visible_prop = obs.obs_properties_get( props, "add_limit_note_source_visible" );
	local sub_limit_note_source_visible_prop = obs.obs_properties_get( props, "sub_limit_note_source_visible" );
	local _group_1_prop = obs.obs_properties_get( props, "_group_1" );
	local _group_2_prop = obs.obs_properties_get( props, "_group_2" );
	local _group_3_prop = obs.obs_properties_get( props, "_group_3" );
	local sw_minutes_saved_prop = obs.obs_properties_get( props, "sw_minutes_saved" );
	local set_stopwatch_prop = obs.obs_properties_get( props, "set_stopwatch" );
	local timer_display_prop = obs.obs_properties_get( props, "timer_display" );
	local day_prop = obs.obs_properties_get( props, "day" );
	local year_prop = obs.obs_properties_get( props, "year" );
	local month_prop = obs.obs_properties_get( props, "month" );
	local day_text_prop = obs.obs_properties_get( props, "day_text" );
	local days_text_prop = obs.obs_properties_get( props, "days_text" );
	local stop_text_prop = obs.obs_properties_get( props, "stop_text" );
	local cycle_list_prop = obs.obs_properties_get( props, "cycle_list" );
	local text_prefix_prop = obs.obs_properties_get( props, "text_prefix" );
	local text_suffix_prop = obs.obs_properties_get( props, "text_suffix" );
	local active_source_prop = obs.obs_properties_get( props, "active_source" );
	local note_source_marker_a_prop 	= obs.obs_properties_get( props, "note_source_marker_a" );
	local note_source_marker_b_prop 	= obs.obs_properties_get( props, "note_source_marker_b" );
	local sub_limit_note_source_prop 	= obs.obs_properties_get( props, "sub_limit_note_source" );
	local add_limit_note_source_prop 	= obs.obs_properties_get( props, "add_limit_note_source" );	
	local recording_type_prop = obs.obs_properties_get( props, "recording_type" );
	local cycle_direction_prop = obs.obs_properties_get( props, "cycle_direction" );
	local as_visible_prop = obs.obs_properties_get( props, "active_source_force_visible" );
	local hours_prop = obs.obs_properties_get( props, "hours" );
	local minutes_prop = obs.obs_properties_get( props, "minutes" );
	local seconds_prop = obs.obs_properties_get( props, "seconds" );
	local split_type_prop = obs.obs_properties_get( props, "split_type" );
	local next_scene_prop = obs.obs_properties_get( props, "next_scene" );
	local split_button_prop = obs.obs_properties_get( props, "split_button" );
	local split_source_prop = obs.obs_properties_get( props, "split_source" );
	local timer_format_prop = obs.obs_properties_get( props, "timer_format" );
	local color_normal_prop = obs.obs_properties_get( props, "color_normal" );
	local reset_button_prop = obs.obs_properties_get( props, "reset_button" );
	local countdown_type_prop = obs.obs_properties_get( props, "countdown_type" );
	local start_recording_prop = obs.obs_properties_get( props, "start_recording" );
	local export_button_prop = obs.obs_properties_get( props, "export_button" );
	local import_button_prop = obs.obs_properties_get( props, "import_button" );
	local export_folder_prop = obs.obs_properties_get( props, "backup_folder" );
	local disable_script_prop = obs.obs_properties_get( props, "disable_script" );
	local enable_direction_toggle_prop = obs.obs_properties_get( props, "enable_direction_toggle" );
	local prevent_negative_time_prop = obs.obs_properties_get( props, "prevent_negative_time" );
	local start_on_visible_prop = obs.obs_properties_get( props, "start_on_visible" );
	local force_reset_on_visible_prop = obs.obs_properties_get( props, "force_reset_on_visible" );
	local force_reset_on_scene_active_prop = obs.obs_properties_get( props, "force_reset_on_scene_active" );
	local start_on_scene_active_prop = obs.obs_properties_get( props, "start_on_scene_active" );
	local to_prop = obs.obs_properties_get( props, "trigger_options" );
	local c_note_prop = obs.obs_properties_get( props, "note_marker_a" );
	local w_note_prop = obs.obs_properties_get( props, "note_marker_b" );
	local enable_marker_notes_prop = obs.obs_properties_get( props, "enable_marker_notes" );
	local text_arr_marker_a_prop = obs.obs_properties_get( props, "text_arr_marker_a" );
	local text_arr_marker_b_prop = obs.obs_properties_get( props, "text_arr_marker_b" );
	local color_marker_a_prop = obs.obs_properties_get( props, "color_marker_a" );
	local color_marker_b_prop = obs.obs_properties_get( props, "color_marker_b" );
	local audio_marker_a_prop = obs.obs_properties_get( props, "audio_marker_a" );
	local audio_marker_b_prop = obs.obs_properties_get( props, "audio_marker_b" );
	local audio_marker_a_arr_prop = obs.obs_properties_get( props, "audio_marker_a_arr" );
	local audio_marker_b_arr_prop = obs.obs_properties_get( props, "audio_marker_b_arr" );
	local audio_marker_end_prop = obs.obs_properties_get( props, "audio_marker_end" );
	local cn_source_prop = obs.obs_properties_get( props, "note_source_marker_a" );
	local wn_source_prop = obs.obs_properties_get( props, "note_source_marker_b" );
	local duration_marker_a_prop = obs.obs_properties_get( props, "duration_marker_a" );
	local duration_marker_b_prop = obs.obs_properties_get( props, "duration_marker_b" );
	local reset_text_marker_a_prop = obs.obs_properties_get( props, "reset_text_marker_a" );
	local reset_text_marker_b_prop = obs.obs_properties_get( props, "reset_text_marker_b" );
	local duration_marker_end_prop = obs.obs_properties_get( props, "duration_marker_end" );
	local media_playback_limit_prop = obs.obs_properties_get( props, "media_playback_limit" );
	obs.obs_property_set_visible( timer_options_prop, config_value == 2 );
	obs.obs_property_set_visible( timer_manipulation_prop, config_value == 2 and timer_options_value == 2 );
	obs.obs_property_set_visible( direction_button_prop, config_value == 2 and enable_direction_toggle and ( timer_mode_value == 2 and countdown_type_value == 2 or timer_mode_value == 1 ) ); 
	obs.obs_property_set_visible( timer_display_prop, config_value == 2 and timer_mode_value == 2 and timer_options_value == 2  );
	obs.obs_property_set_visible( custom_time_format_prop, timer_format == 5 and config_value == 2 and timer_options_value == 2 );
	obs.obs_property_set_visible( add_limit_note_source_visible_prop, add_limit_note_source ~= "select" );
	obs.obs_property_set_visible( sub_limit_note_source_visible_prop, sub_limit_note_source ~= "select" );
	obs.obs_property_set_visible( split_button_prop, timer_mode_value == 1 );
	obs.obs_property_set_visible( text_prefix_prop, config_value == 2 and timer_options_value == 2 );
	obs.obs_property_set_visible( text_suffix_prop, config_value == 2 and timer_options_value == 2 );
	obs.obs_property_set_visible( timer_format_prop, config_value == 2 and timer_options_value == 2 );	
	obs.obs_property_set_visible( color_normal_prop, config_value == 2 and timer_options_value == 2  );
	obs.obs_property_set_visible( set_stopwatch_prop, ( config_value == 2 and timer_mode_value == 1 and timer_options_value == 2 ) );
	obs.obs_property_set_visible( timer_source_prop, ( config_value == 2 and timer_options_value == 2 ) );
	obs.obs_property_set_visible( split_type_prop, timer_mode_value == 1 and config_value == 2 and timer_options_value == 2 );
	obs.obs_property_set_visible( split_source_prop, timer_mode_value == 1 and config_value == 2 and timer_options_value == 2 );
	obs.obs_property_set_visible( _group_1_prop, ( config_value == 2 and set_stopwatch_value and timer_mode_value == 1 and timer_options_value == 2 ) );
	obs.obs_property_set_visible( _group_2_prop, ( config_value == 2 and timer_options_value == 2 and timer_manipulation == 2 ) );
	obs.obs_property_set_visible( _group_3_prop, ( config_value == 2 and timer_options_value == 2 and timer_manipulation == 2 ) );
	obs.obs_property_set_visible( recording_type_prop, false );
	obs.obs_property_set_enabled( day_prop, month_value ~= 1 );
	obs.obs_property_set_enabled( year_prop, month_value ~= 1 );
	obs.obs_property_set_visible( mili_button_prop, toggle_mili_trigger == "" and timer_mode_value == 2  );
	obs.obs_property_set_visible( toggle_mili_trigger_prop, show_split( props, settings ) and timer_options_value == 2 );
	obs.obs_property_set_visible( hours_prop, config_value == 2 and timer_mode_value == 2 and timer_options_value == 2  );
	obs.obs_property_set_visible( minutes_prop, config_value == 2 and timer_mode_value == 2 and timer_options_value == 2  ); 
	obs.obs_property_set_visible( seconds_prop, config_value == 2 and timer_mode_value == 2 and timer_options_value == 2  ); 
	obs.obs_property_set_visible( next_scene_prop, config_value == 2 and timer_mode_value == 2 and timer_options_value == 2  );
	obs.obs_property_set_visible( countdown_type_prop, config_value == 2 and timer_mode_value == 2 and timer_options_value == 2 );
	obs.obs_property_set_visible( start_recording_prop, config_value == 2 and timer_mode_value == 2 and timer_options_value == 2 );
	obs.obs_property_set_visible( recording_type_prop, config_value == 2 and start_recording_value == 1 and timer_mode_value == 2 );	
	obs.obs_property_set_visible( stop_text_prop, next_scene_value == "TIMER END TEXT" and  timer_mode_value == 2 and timer_options_value == 2 );	
	obs.obs_property_set_visible( day_prop, countdown_type_value == 1 and config_value == 2 and timer_mode_value == 2 and timer_options_value == 2 );
	obs.obs_property_set_visible( year_prop, countdown_type_value == 1 and config_value == 2 and timer_mode_value == 2 and timer_options_value == 2 );
	obs.obs_property_set_visible( month_prop, countdown_type_value == 1 and config_value == 2 and timer_mode_value == 2 and timer_options_value == 2 );
	obs.obs_property_set_visible( day_text_prop, countdown_type_value == 1 and config_value == 2 and timer_mode_value == 2 and timer_format ~= 5 and timer_options_value == 2 );
	obs.obs_property_set_visible( days_text_prop, countdown_type_value == 1 and config_value == 2 and timer_mode_value == 2 and timer_format ~= 5 and timer_options_value == 2 );
	obs.obs_property_set_visible( cycle_list_prop, ( (next_scene_value == "Source List" or next_scene_value == "Scene List") and timer_mode_value == 2 and config_value == 2 and timer_options_value == 2 ) );
	obs.obs_property_set_visible( active_source_prop, ( (next_scene_value == "Source List" or next_scene_value == "Scene List") and timer_mode_value == 2 and config_value == 2 and timer_options_value == 2 ) );
	obs.obs_property_set_visible( as_visible_prop, ( (next_scene_value == "Source List" or next_scene_value == "Scene List") and timer_mode_value == 2 and config_value == 2 and timer_options_value == 2 ) );
	obs.obs_property_set_visible( cycle_direction_prop, ( (next_scene_value == "Source List" or next_scene_value == "Scene List") and timer_mode_value == 2 and config_value == 2 and timer_options_value == 2 ) );
	obs.obs_property_set_visible( to_prop, ( config_value == 2 ) );
	obs.obs_property_set_visible( enable_marker_notes_prop, ( config_value == 2 and trigger_options_value == 2 ));
	obs.obs_property_set_visible( text_arr_marker_a_prop, ( config_value == 2 and trigger_options_value == 2 ) );
	obs.obs_property_set_visible( text_arr_marker_b_prop, ( config_value == 2 and trigger_options_value == 2 ) );
	obs.obs_property_set_visible( audio_marker_a_prop, ( config_value == 2 and trigger_options_value == 2 ) );
	obs.obs_property_set_visible( audio_marker_a_arr_prop, ( config_value == 2 and trigger_options_value == 2 and audio_marker_a_value == 'list' ) );
	obs.obs_property_set_visible( audio_marker_b_arr_prop, ( config_value == 2 and trigger_options_value == 2 and audio_marker_b_value == 'list' ) );
	obs.obs_property_set_visible( audio_marker_b_prop, ( config_value == 2 and trigger_options_value == 2 ) );
	obs.obs_property_set_visible( audio_marker_end_prop, ( in_table( {"TIMER END TEXT", "Select"}, next_scene_value ) and config_value == 2 and trigger_options_value == 2) );
	obs.obs_property_set_visible( color_marker_a_prop, ( config_value == 2 and trigger_options_value == 2 ) );
	obs.obs_property_set_visible( color_marker_b_prop, ( config_value == 2 and trigger_options_value == 2 ) );
	obs.obs_property_set_visible( media_playback_limit_prop, ( config_value == 2 and trigger_options_value == 2) );
	obs.obs_property_set_visible( c_note_prop, ( config_value == 2 and enable_marker_notes_value ~= 1 and trigger_options_value == 2 ) );
	obs.obs_property_set_visible( w_note_prop, ( config_value == 2 and enable_marker_notes_value ~= 1 and trigger_options_value == 2 ) );
	obs.obs_property_set_visible( cn_source_prop, ( config_value == 2 and enable_marker_notes_value ~= 1 and trigger_options_value == 2 ) );
	obs.obs_property_set_visible( wn_source_prop, ( config_value == 2 and enable_marker_notes_value ~= 1 and trigger_options_value == 2 ) );
	obs.obs_property_set_visible( duration_marker_a_prop, ( config_value == 2 and trigger_options_value == 2 and media_playback_limit_value == 2 ) );
	obs.obs_property_set_visible( duration_marker_b_prop, ( config_value == 2 and trigger_options_value == 2 and media_playback_limit_value == 2 ) );
	obs.obs_property_set_visible( reset_text_marker_a_prop, ( config_value == 2 and trigger_options_value == 2 ) );
	obs.obs_property_set_visible( reset_text_marker_b_prop, ( config_value == 2 and trigger_options_value == 2 ) );
	obs.obs_property_set_visible( duration_marker_end_prop, ( in_table( {"TIMER END TEXT", "Select"}, next_scene_value ) and config_value == 2 and trigger_options_value == 2 and media_playback_limit_value == 2 ) );
	obs.obs_property_set_visible( backup_mode_prop, ( config_value == 2 ));
	obs.obs_property_set_visible( import_list_prop, backup_mode_value and config_value == 2 );
	obs.obs_property_set_visible( export_button_prop, backup_mode_value and config_value == 2 );
	obs.obs_property_set_visible( import_button_prop, backup_mode_value and config_value == 2 );
	obs.obs_property_set_visible( export_folder_prop, backup_mode_value and config_value == 2 );
	obs.obs_property_set_visible( import_button_prop, import_list_value ~= "select" and  import_list_value ~= "" and config_value == 2 );
	obs.obs_property_set_visible( disable_script_prop, config_value == 2 );
	obs.obs_property_set_visible( enable_direction_toggle_prop, config_value == 2 and ( timer_mode_value == 2 and countdown_type_value == 2 or timer_mode_value == 1 ) ); 
	obs.obs_property_set_visible( prevent_negative_time_prop, enable_direction_toggle and config_value == 2 and ( timer_mode_value == 2 and countdown_type_value == 2 or timer_mode_value == 1 ) );
	obs.obs_property_set_visible( start_on_visible_prop, config_value == 2 and not start_on_scene_active );
	obs.obs_property_set_visible( force_reset_on_visible_prop, config_value == 2 and start_on_visible );
	obs.obs_property_set_visible( force_reset_on_scene_active_prop, config_value == 2 and start_on_scene_active );
	obs.obs_property_set_visible( start_on_scene_active_prop, config_value == 2 and not start_on_visible );
	if ( in_table( {timer_source_value, split_source_value, active_source_value, note_source_marker_b_value}, note_source_marker_a_value ) ) then
		obs.obs_data_set_string( settings, "note_source_marker_a", "select" ); 
	end 
	if ( in_table( {timer_source_value, split_source_value, active_source_value, note_source_marker_a_value}, note_source_marker_b_value ) ) then
		obs.obs_data_set_string( settings, "note_source_marker_b", "select" ); 
	end 	
	if ( in_table( {timer_source_value, split_source_value, note_source_marker_a_value, note_source_marker_b_value}, active_source_value ) ) then
		obs.obs_data_set_string( settings, "active_source", "select" ); 
	end
	if countdown_type_value == 1 and month_value ~= 1 and day_value == 0 then
		obs.obs_data_set_int( settings, "day", 1 ); 
	end	
	if start_on_scene_active then
		obs.obs_data_set_bool( settings, "force_reset_on_visible", false ); 
	end
	if start_on_visible then
		obs.obs_data_set_bool( settings, "force_reset_on_scene_active", false ); 
	end	
	if( minute_format ~= nil ) then
		obs.obs_property_int_set_limits( sw_minutes_saved_prop, 0, ( minute_format - 1 ), 1 );	
	else
		obs.obs_property_int_set_limits( sw_minutes_saved_prop, 0, 59, 1 );	
	end
	obs.obs_property_int_set_limits( day_prop, 1, 31, 1 );
	if ( month_value == 5 or month_value == 7 or month_value == 10 or month_value == 12 ) then
		obs.obs_property_int_set_limits( day_prop, 1, 30, 1 );
	elseif ( month_value == 3 ) then
		local leap = 28;
		if is_leap_year(year_value) then
			 leap = 29;
		else
			 leap = 28;
		end	
		obs.obs_property_int_set_limits( day_prop, 1, leap, 1 );
	end;
	if show_mili then
		obs.obs_property_set_description( mili_button_prop, "Hide Milliseconds" );
	else
		obs.obs_property_set_description( mili_button_prop, "Show Milliseconds" );
	end;
	if timer_mode_value == 2 then
		obs.obs_property_set_description( reset_button_prop, "Reset Countdown" );
	else
		obs.obs_property_set_description( reset_button_prop, "Reset Stopwatch" );	
	end;
	if timer_mode_value == 2 then
			obs.obs_property_set_description( direction_button_prop, "Count Up" );
		if timer_active then
			obs.obs_property_set_description( pause_button_prop, "Start/Pause Countdown" );
		else
			obs.obs_property_set_description( pause_button_prop, "Start Countdown" );
		end;
	else
			obs.obs_property_set_description( direction_button_prop, "Count Down" );
		if timer_active then
			obs.obs_property_set_description( pause_button_prop, "Start/Pause Stopwatch" );
		else
			obs.obs_property_set_description( pause_button_prop, "Start Stopwatch" );
		end;
	end;
	if tableHasKey( selected_source_list, property_name ) then 	
		local sources = obs.obs_enum_sources();
			for i,v in pairs( {timer_source_prop, split_source_prop, active_source_prop, note_source_marker_a_prop, note_source_marker_b_prop, sub_limit_note_source_prop, add_limit_note_source_prop} ) do 
				local reference = obs.obs_property_name( v ) 
				obs.obs_property_list_clear( v );
				obs.obs_property_list_add_string( v, "Select", "select" );
				list = {} 
				if sources ~= nil then
					for _, source in ipairs( sources ) do
						source_id = obs.obs_source_get_unversioned_id( source ); 
						if source_id == "text_gdiplus" or source_id == "text_ft2_source" then 
							local name = obs.obs_source_get_name( source );
							if not source_selected( name, reference ) then
								list[name] = name;
							else
							end;
						end;
					end;
						obs.bfree(source); 
					for key, value in pairsByKeys(list) do
						obs.obs_property_list_add_string( v, value, value );
					end
				end			
			end	
		obs.source_list_release( sources ); 
	end	
	if sec_add_limit > 1 then
		obs.obs_property_int_set_suffix( sec_add_limit_prop, " Calls" );
	end	
	if sec_add_limit == 1 then
		obs.obs_property_int_set_suffix( sec_add_limit_prop, " Call" );
	end
	if sec_add_limit == 0 then
		obs.obs_property_int_set_suffix( sec_add_limit_prop, "     Zero allow infinite calls" );
	end	
	if sec_sub_limit > 1 then
		obs.obs_property_int_set_suffix( sec_sub_limit_prop, " Calls" );
	end	
	if sec_sub_limit == 1 then
		obs.obs_property_int_set_suffix( sec_sub_limit_prop, " Call" );
	end
	if sec_sub_limit == 0 then
		obs.obs_property_int_set_suffix( sec_sub_limit_prop, "     Zero allow infinite calls" );
	end	
	local filenames = get_filenames( backup_folder, ".json" );
	local has_file_list = ( table.getn( filenames ) > 0 );
	if obs.os_file_exists( backup_folder ) then	
		obs.obs_property_list_clear( import_list_prop );
		obs.obs_property_list_add_string( import_list_prop, "Select", "select" );
		if has_file_list then
			for i,v in pairs( filenames ) do 
				obs.obs_property_list_add_string( import_list_prop, v, v );
			end;
		end;
	end;
  return true;
end
local function cycle_source_list( source_type )
		reset( true ); 
		cycle_source_list_by_source_type( source_type );
		pause( true ); 
end
function timer_end_media_end_callback( )
	set_visible( media['source_name_audio_marker_end'], false );
	obs.remove_current_callback();
end
function timer_ended( source_name )
	activate( false ); 
	record( 1, 100 );
	stop_looping_media( "marker_a" );
	stop_looping_media( "marker_b" );
	if not in_table( {"TIMER END TEXT", "Source List", "Scene List", "Select"}, next_scene ) then
		set_visible( timer_source, false ); 
		local source = obs.obs_get_source_by_name( next_scene );
		if source ~= nil then
			obs.obs_frontend_set_current_scene( source );
			obs.obs_source_release( source );
			update_timer_settings( true ); 
		end
		timer_expired = true;
		timer_active = false;
	end
	if next_scene == "Source List" then
		cycle_source_list( "source" );
	end	
	if next_scene == "Scene List" then
		cycle_source_list( "scene" );
	end	
	if next_scene == "TIMER END TEXT" then
		local text = stop_text;
		set_text( source_name, text );
	end
		if in_table( {"TIMER END TEXT", "Select"}, next_scene ) then
			if not in_table( ignore_list, media["source_name_audio_marker_end"] ) then
			set_visible( media["source_name_audio_marker_end"], true ); 
			disconnect_after_media_end( "marker_end" ); 
			if media["duration_marker_end"] ~= 0 and media_playback_limit ~= 1 then
				obs.timer_add( timer_end_media_end_callback, math.floor( media["duration_marker_end"] * 1000 ) ); 
			end;
		end;
	end;
end	
function script_properties()
	props = obs.obs_properties_create(); 
	ctx.propsDef = props; 
	local p_1 = obs.obs_properties_add_list( ctx.propsDef, "timer_mode", "<b>Timer Type</b>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT );
  	t_type = {"Stopwatch", "Countdown"}; 
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_1, v, i ) end 
	local p_2 = obs.obs_properties_add_list( ctx.propsDef, "config", "<font color=".. font_dimmed ..">Configuration</font>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT );
  	t_type = {"Basic", "Advanced"}; 
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_2, v, i ) end 
	local p_3 = obs.obs_properties_add_list( ctx.propsDef, "timer_options", "<font color=".. font_dimmed .."><b>Timer Settings</b></font>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT );
	 t_type = {"Hidden", "Expanded"}; 
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_3, v, i ) end 
	obs.obs_property_set_long_description( p_3, "\nExpand or hide additional timer options.\n" ); 
	local sources = obs.obs_enum_sources();
	local p_4 = obs.obs_properties_add_list( ctx.propsDef, "timer_source", "<i>Timer Source</i>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING );
	obs.obs_property_list_add_string( p_4, "Select", "select" ); 
	local list = {}; 
	if sources ~= nil then
		for _, source in ipairs( sources ) do 
			source_id = obs.obs_source_get_unversioned_id( source ); 
			if source_id == "text_gdiplus" or source_id == "text_ft2_source" then 
				local name = obs.obs_source_get_name( source ); 
				local reference = "timer_source";
				if not source_selected( name, reference ) then 
					list[name] = name;
				else
				end
			end
		end
			obs.bfree(source); 
		for key, value in pairsByKeys( list ) do
			obs.obs_property_list_add_string( p_4, value, value ); 
		end
	end
	local p_5 = obs.obs_properties_add_list( ctx.propsDef, "countdown_type", "<font color=".. font_dimmed ..">Countdown Type</font>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT );
  	t_type = {"Specific Date & Time", "Hours, Minutes, Seconds"}; 
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_5, v, i ) end; 
	local p_6 = obs.obs_properties_add_text( ctx.propsDef, "day_text", "<font color=".. font_dimmed ..">Day Text Format</font>", obs.OBS_TEXT_DEFAULT );
	obs.obs_property_set_long_description( p_6, "\nUsed to distinguish between singular and plural days format. Use this for singular.\n" ); 
	local p_7 = obs.obs_properties_add_text( ctx.propsDef, "days_text", "<font color=".. font_dimmed ..">Days Text Format</font>", obs.OBS_TEXT_DEFAULT );
	obs.obs_property_set_long_description( p_7, "\nUsed to distinguish between singular and plural days format. Use this for plural.\n" ); 
	local p_8 = obs.obs_properties_add_list( ctx.propsDef, "month", "<font color=".. font_dimmed ..">Month</font>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT );
  	t_type = {"Select", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"}; 
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_8, v, i ) end; 
	local p_9 = obs.obs_properties_add_int( ctx.propsDef, "year", "<font color=".. font_dimmed ..">Year</font>", 2022, 212021221, 1 );
	local p_10 = obs.obs_properties_add_int( ctx.propsDef, "day", "<font color=".. font_dimmed ..">Day</font>", 1, 31, 1 );
	local p_11 = obs.obs_properties_add_int( ctx.propsDef, "hours", "<font color=".. font_dimmed ..">Hours</font>", 0, 23, 1 );
	obs.obs_property_int_set_suffix( p_11, " Hours" );
	local p_12 = obs.obs_properties_add_int( ctx.propsDef, "minutes", "<font color=".. font_dimmed ..">Minutes</font>", 0, 59, 1 );
	obs.obs_property_int_set_suffix( p_12, " Minutes" );
	local p_13 = obs.obs_properties_add_int( ctx.propsDef, "seconds", "<font color=".. font_dimmed ..">Seconds</font>", 0, 59, 1 );
	obs.obs_property_int_set_suffix( p_13, " Seconds" );
	local p_14 = obs.obs_properties_add_list( ctx.propsDef, "timer_format", "Timer Format", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT );
	t_type = {"Display full format", "No leading zeros", "No leading zeros, no split seconds", "No split seconds", "Custom Time Format"}; 
	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_14, v, i ) end; 
	local p_15 = obs.obs_properties_add_text( ctx.propsDef, "custom_time_format", "<font color=".. font_dimmed ..">Time Format</font>", obs.OBS_TEXT_DEFAULT );
	obs.obs_property_set_long_description( p_15, "\n Timestamp is represented by $D = day, $H = hour, $M = minute, $S = second, $F = split second. \n\n Add 'M' and number enclosed in '{}' to adjust minute format: {M90} will display 90 minutes units.\n\n To trim leading zeros, include $T = truncate leading zeros. This will ONLY affect a format matching '$D:$H:$M:$S,$F' (00:00:00:00,00)\n" ); 
	local p_16 = obs.obs_properties_add_text( ctx.propsDef, "toggle_mili_trigger", "<font color=".. font_dimmed ..">Toggle Milliseconds</font>", obs.OBS_TEXT_DEFAULT );
	obs.obs_property_set_long_description( p_16, "\nUse format 00:00:00 ( hoursa:minutes:seconds )\n" ); 
	local p_17 = obs.obs_properties_add_list( ctx.propsDef, "timer_display", "Display", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT );
  	t_type = {"Show expired time stamp", "Remove expired time stamp"}; 
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_17, v, i ) end; 
	local p_18 = obs.obs_properties_add_list( ctx.propsDef, "split_source", "<i>Split Source</i>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING );
	obs.obs_property_list_add_string( p_18, "Select", "select" );  
	list = {} 
	if sources ~= nil then
		for _, source in ipairs( sources ) do
			source_id = obs.obs_source_get_unversioned_id( source ); 
			if source_id == "text_gdiplus" or source_id == "text_ft2_source" then 
				local name = obs.obs_source_get_name( source );
				local reference = "split_source";
				if not source_selected( name, reference ) then
					list[name] = name;
				else
				end
			end
		end
			obs.bfree(source); 
		for key, value in pairsByKeys(list) do
			obs.obs_property_list_add_string( p_18, value, value );
		end
	end	
	local p_19 = obs.obs_properties_add_list( ctx.propsDef, "split_type", "Split Type", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT );
  	t_type = {"Interval", "Mark", "Mark Interval", "Interval Mark"}; 
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_19, v, i ) end; 
	obs.obs_property_set_long_description( p_19, "\nInterval = Time between current and previous split.\n\nMark = Time of split\n" ); 
	local p_20 = obs.obs_properties_add_list( ctx.propsDef, "trigger_options", "<font color=".. font_dimmed .."><b>Marker Settings</b></font>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT );
	 t_type = {"Hidden", "Expanded"}; 
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_20, v, i ) end; 
	obs.obs_property_set_long_description( p_20, "\nExpand or hide additional options triggered by time stamps.\n" ); 
	local p_21 = obs.obs_properties_add_editable_list( ctx.propsDef, "text_arr_marker_a", "Marker A Time", obs.OBS_EDITABLE_LIST_TYPE_STRINGS, nil, nil );
	local p_22 = obs.obs_properties_add_editable_list( ctx.propsDef, "text_arr_marker_b", "Marker B Time", obs.OBS_EDITABLE_LIST_TYPE_STRINGS, nil, nil );
	obs.obs_properties_add_int_slider( ctx.propsDef, "reset_text_marker_a", "Reset Marker A Text", 0, 10800, 1 );
	obs.obs_properties_add_int_slider( ctx.propsDef, "reset_text_marker_b", "Reset Marker A Text", 0, 10800, 1 );
	local p_23 = obs.obs_properties_add_list( ctx.propsDef, "audio_marker_a", "<font color=".. font_dimmed ..">Marker A Audio</font>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING );
	obs.obs_property_set_long_description( p_23, "\nSelect available media source to activate on defined time stamp.\n" ); 
	obs.obs_property_list_add_string( p_23, "None", "none" ); 
	obs.obs_property_list_add_string( p_23, "Allow Multiple Selections", "list" ); 
	if sources ~= nil then
		for _, source in ipairs( sources ) do
			source_id = obs.obs_source_get_unversioned_id( source ); 
			if source_id == "ffmpeg_source" then 
				local name = obs.obs_source_get_name( source );
				obs.obs_property_list_add_string( p_23, name, name );
			end
		end
			obs.bfree(source); 
	end	
	local p_23a = obs.obs_properties_add_editable_list( ctx.propsDef, "audio_marker_a_arr", "Marker A Audio List", obs.OBS_EDITABLE_LIST_TYPE_STRINGS, nil, nil );
	local p_24 = obs.obs_properties_add_list( ctx.propsDef, "audio_marker_b", "<font color=".. font_dimmed ..">Marker B Audio</font>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING );
	obs.obs_property_set_long_description( p_24, "\nSelect available media source to activate on defined time stamp.\n" ); 
	obs.obs_property_list_add_string( p_24, "None", "none" ); 
	obs.obs_property_list_add_string( p_24, "Allow Multiple Selections", "list" ); 
	if sources ~= nil then
		for _, source in ipairs( sources ) do
			source_id = obs.obs_source_get_unversioned_id( source ); 
			if source_id == "ffmpeg_source" then 
				local name = obs.obs_source_get_name( source );
				obs.obs_property_list_add_string( p_24, name, name );
			end
		end
			obs.bfree(source); 
	end	
	local p_24a = obs.obs_properties_add_editable_list( ctx.propsDef, "audio_marker_b_arr", "Marker B Audio List", obs.OBS_EDITABLE_LIST_TYPE_STRINGS, nil, nil );
	local p_25 = obs.obs_properties_add_list( ctx.propsDef, "audio_marker_end", "<font color=".. font_dimmed ..">Timer Expired Audio</font>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING )
	obs.obs_property_set_long_description( p_25, "\nSelect available media source to activate when the timer expired.\n" ) 
	obs.obs_property_list_add_string( p_25, "None", "none" ) 
	if sources ~= nil then
		for _, source in ipairs( sources ) do
			source_id = obs.obs_source_get_unversioned_id( source ) 
			if source_id == "ffmpeg_source" then 
				local name = obs.obs_source_get_name( source )
				obs.obs_property_list_add_string( p_25, name, name )
			end
		end
			obs.bfree(source) 
	end
	local p_26 = obs.obs_properties_add_list( ctx.propsDef, "media_playback_limit", "<i>Media Playback Limit</i>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT );
	 t_type = {"Disabled", "Enabled"}; 
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_26, v, i ) end; 
	obs.obs_property_set_long_description( p_26, "\nSet a maximum time limit for media playback.\n" ); 
	obs.obs_properties_add_int_slider( ctx.propsDef, "duration_marker_a", "Marker A Duration", 0, 10800, 1 );
	obs.obs_properties_add_int_slider( ctx.propsDef, "duration_marker_b", "Marker B Duration", 0, 10800, 1 );
	obs.obs_properties_add_int_slider( ctx.propsDef, "duration_marker_end", "End Audio Duration", 0, 10800, 1 );
	obs.obs_properties_add_color( ctx.propsDef, "color_normal", "Normal Color" );
	obs.obs_properties_add_color( ctx.propsDef, "color_marker_a", "Marker A Color" );
	obs.obs_properties_add_color( ctx.propsDef, "color_marker_b", "Marker B Color" );
	local p_27 = obs.obs_properties_add_list( ctx.propsDef, "enable_marker_notes", "<i>Marker Notes</i>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT );
	 t_type = {"Disabled", "Enabled"}; 
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_27, v, i ) end; 
	obs.obs_property_set_long_description( p_27, "\nAllows a note to be displayed when the timer match Marker A and Marker B timestamps.\n" ); 
	local p_28 = obs.obs_properties_add_list( ctx.propsDef, "note_source_marker_a", "<i>Marker A Note Source</i>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING );
	obs.obs_property_list_add_string( p_28, "Select", "select" );  
	list = {} 
	if sources ~= nil then
		for _, source in ipairs( sources ) do
			source_id = obs.obs_source_get_unversioned_id( source ); 
			if source_id == "text_gdiplus" or source_id == "text_ft2_source" then 
				local name = obs.obs_source_get_name( source );
				local reference = "note_source_marker_a";
				if not source_selected( name, reference ) then
					list[name] = name;
				else
				end
			end
		end
			obs.bfree(source); 
		for key, value in pairsByKeys( list ) do
			obs.obs_property_list_add_string( p_28, value, value );
		end
	end
	local p_29 = obs.obs_properties_add_list( ctx.propsDef, "note_source_marker_b", "<i>Marker B Note Source</i>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING );
	obs.obs_property_list_add_string( p_29, "Select", "select" );  
	list = {}; 
	if sources ~= nil then
		for _, source in ipairs( sources ) do
			source_id = obs.obs_source_get_unversioned_id( source ); 
			if source_id == "text_gdiplus" or source_id == "text_ft2_source" then 
				local name = obs.obs_source_get_name( source );
				local reference = "note_source_marker_b";
				if not source_selected( name, reference ) then
					list[name] = name;
				else
				end;
			end;
		end;
			obs.bfree( source ); 
		for key, value in pairsByKeys( list ) do
			obs.obs_property_list_add_string( p_29, value, value ); 
		end
	end	
	local p_30 = obs.obs_properties_add_text( ctx.propsDef, "note_marker_a", "<font color=".. font_dimmed ..">Marker A Note</font>", obs.OBS_TEXT_DEFAULT );
	obs.obs_property_set_long_description( p_30, "\nDisplay a note when Marker A is Activated.\n" ); 
	local p_31 = obs.obs_properties_add_text( ctx.propsDef, "note_marker_b", "<font color=".. font_dimmed ..">Marker B Note</font>", obs.OBS_TEXT_DEFAULT );
	obs.obs_property_set_long_description( p_31, "\nDisplay a note when Marker B is Activated.\n" ); 
	local p_32 = obs.obs_properties_add_list( ctx.propsDef, "start_recording", "Auto Recording", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT );
	obs.obs_property_set_long_description( p_32, "\nEnable recording options\n" ); 
	t_type = {"Yes", "No"}; 
	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_32, v, i ) end; 
	local p_33 = obs.obs_properties_add_list( ctx.propsDef, "recording_type", "Recording", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT );
	obs.obs_property_set_long_description( p_33, "\nSelect whne to start recording\n" ); 
  	t_type = {"Timer Expires", "Marker A Time", "Marker B Time", "Timer Visible", "Timer Start"}; 
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_33, v, i ) end; 
	local p_34 = obs.obs_properties_add_text( ctx.propsDef, "text_prefix", "<font color=#fefceb>Timer Prefix</font>", obs.OBS_TEXT_DEFAULT );
	obs.obs_property_set_long_description( p_34, "\nDefine text placed before the Timer\n" ); 
	local p_35 = obs.obs_properties_add_text( ctx.propsDef, "text_suffix", "<font color=#fefceb>Timer Suffix</font>", obs.OBS_TEXT_DEFAULT );
	obs.obs_property_set_long_description( p_35, "\nDefine text placed after the Timer\n" ); 
	local p_36 = obs.obs_properties_add_list( ctx.propsDef, "active_source", "<i>Active Source</i>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING );
	obs.obs_property_set_long_description( p_36, "\nSelect a text source, that will be used to show the name for the current active Source or Scene\n" ); 
	obs.obs_property_list_add_string( p_36, "Select", "select" );  
	list = {} 
	if sources ~= nil then
		for _, source in ipairs( sources ) do
			source_id = obs.obs_source_get_unversioned_id( source ); 
			if source_id == "text_gdiplus" or source_id == "text_ft2_source" then 
				local name = obs.obs_source_get_name( source );
				local reference = "active_source";
				if not source_selected( name, reference ) then
					list[name] = name;
				else
				end;
			end;
		end;
			obs.bfree(source); 
		for key, value in pairsByKeys( list ) do
			obs.obs_property_list_add_string( p_36, value, value ); 
		end;
	end;
	local p_37 = obs.obs_properties_add_list( ctx.propsDef, "next_scene", "<i>Next Scene</i>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING );
	obs.obs_property_set_long_description( p_37, "\nDefine what happens afater timer ends\n" ); 
	t_type = {"Select", "TIMER END TEXT", "Source List", "Scene List"}; 
	for i,v in ipairs( t_type ) do 
	obs.obs_property_list_add_string( p_37, v, v ); 
	end;
	local scenes = obs.obs_frontend_get_scene_names();
	if scenes ~= nil then
		for i, scene in ipairs( scenes ) do
			obs.obs_property_list_add_string( p_37, scene, scene ); 
		end;
		obs.bfree( scene ); 
	end;
	local p_38 = obs.obs_properties_add_text( ctx.propsDef, "stop_text", "<font color=#fef1eb>Timer End Text</font>", obs.OBS_TEXT_DEFAULT );
	obs.obs_property_set_long_description( p_38, "\nDefine text displayed when timer ended\n" ); 
	local p_39 = obs.obs_properties_add_editable_list( ctx.propsDef, "cycle_list", "Cycle List", obs.OBS_EDITABLE_LIST_TYPE_STRINGS, nil, nil );
	local p_40 = obs.obs_properties_add_list( ctx.propsDef, "cycle_direction", "<i>Cycle Direction</i>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT );
	 t_type = {"Ascending", "Descending"}; 
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_40, v, i ) end; 
	obs.obs_property_set_long_description( p_40, "\nSelect the rotation direction of lists.\n" ); 
	local p_ab = obs.obs_properties_add_list( ctx.propsDef, "timer_manipulation", "<font color=".. font_dimmed .."><b>Timer Manipulation</b></font>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT );
	 t_type = {"Hidden", "Expanded", "Disabled"}; 
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_ab, v, i ) end; 
	obs.obs_property_set_long_description( p_ab, "\nExpand or hide additional options for time adjustments.\n" ); 
	local group_props_2 = obs.obs_properties_create();
	obs.obs_properties_add_group( ctx.propsDef, "_group_2", "Add Seconds to time (Initiate with Hotkey)", obs.OBS_GROUP_NORMAL, group_props_2 );
	local p_a1 = obs.obs_properties_add_int( group_props_2, "sec_add_1", "Set 1", 5, 259200, 15 );
	obs.obs_property_int_set_suffix( p_a1, " Seconds added to time per call" );
	local p_a2 = obs.obs_properties_add_int( group_props_2, "sec_add_2", "Set 2", 15, 259200, 15 );
	obs.obs_property_int_set_suffix( p_a2, " Seconds added to time per call" );
	local p_a3 = obs.obs_properties_add_int( group_props_2, "sec_add_3", "Set 3", 30, 259200, 15 );
	obs.obs_property_int_set_suffix( p_a3, " Seconds added to time per call" );
	local p_a4 = obs.obs_properties_add_int( group_props_2, "sec_add_limit", "Limit", 0, 1000, 1 );
	obs.obs_property_int_set_suffix( p_a4, "     Zero allow infinite calls" );
	local p_a5 = obs.obs_properties_add_int( group_props_2, "sec_add_limit_used", "Used", 0, 1000, 1 );
	obs.obs_property_int_set_suffix( p_a5, "     Refesh to update form" );
	obs.obs_property_set_long_description( p_a5, "\nClick the refresh button the update and show the used limits.\n" ); 
	local p_a6 = obs.obs_properties_add_list( group_props_2, "add_limit_note_source", "<i>Subtract Note</i>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING );
	obs.obs_property_set_long_description( p_a6, "\nSelect a text source, that will be used to show a message when the limit was reached.\n" ); 
	obs.obs_property_list_add_string( p_a6, "Select", "select" )  
	list = {} 
	if sources ~= nil then
		for _, source in ipairs( sources ) do
			source_id = obs.obs_source_get_unversioned_id( source ); 
			if source_id == "text_gdiplus" or source_id == "text_ft2_source" then 
				local name = obs.obs_source_get_name( source );
				local reference = "add_limit_note_source";
				if not source_selected( name, reference ) then
					list[name] = name;
				else
				end;
			end;
		end;
			obs.bfree(source); 
		for key, value in pairsByKeys( list ) do
			obs.obs_property_list_add_string( p_a5, value, value ); 
		end;
	end;
	local p_b7 = obs.obs_properties_add_int( group_props_2, "add_limit_note_source_visible", "Note visible", 0, 36000, 1 );
	obs.obs_property_int_set_suffix( p_b7, "     milliseconds visible, 0 is infinite" );
	local p_a8 = obs.obs_properties_add_button( group_props_2, "sec_add_refresh", "Refresh to update form", refresh_properties );
	local group_props_3 = obs.obs_properties_create();
	obs.obs_properties_add_group( ctx.propsDef, "_group_3", "Subtract Seconds from time (Initiate with Hotkey)", obs.OBS_GROUP_NORMAL, group_props_3 );
	local p_b1 = obs.obs_properties_add_int( group_props_3, "sec_sub_1", "Set 1", 5, 259200, 15 );
	obs.obs_property_int_set_suffix( p_b1, " Seconds subtracted from time per call" );
	local p_b2 = obs.obs_properties_add_int( group_props_3, "sec_sub_2", "Set 2", 15, 259200, 15 );
	obs.obs_property_int_set_suffix( p_b2, " Seconds subtracted from time per call" );
	local p_b3 = obs.obs_properties_add_int( group_props_3, "sec_sub_3", "Set 3", 30, 259200, 15 );
	obs.obs_property_int_set_suffix( p_b3, " Seconds subtracted from time per call" );
	local p_b4 = obs.obs_properties_add_int( group_props_3, "sec_sub_limit", "Limit", 0, 1000, 1 );
	obs.obs_property_int_set_suffix( p_b4, "     Zero allow infinite calls" );
	local p_b5 = obs.obs_properties_add_int( group_props_3, "sec_sub_limit_used", "Used", 0, 1000, 1 );
	obs.obs_property_int_set_suffix( p_b5, "     Refesh to update form" );
	obs.obs_property_set_long_description( p_b5, "\nClick the refresh button the update and show the used limits.\n" ); 
	local p_b6 = obs.obs_properties_add_list( group_props_3, "sub_limit_note_source", "<i>Subtract Note</i>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING );
	obs.obs_property_set_long_description( p_b6, "\nSelect a text source, that will be used to show a message when the limit was reached.\n" ); 
	obs.obs_property_list_add_string( p_b6, "Select", "select" )  
	list = {} 
	if sources ~= nil then
		for _, source in ipairs( sources ) do
			source_id = obs.obs_source_get_unversioned_id( source ); 
			if source_id == "text_gdiplus" or source_id == "text_ft2_source" then 
				local name = obs.obs_source_get_name( source );
				local reference = "sub_limit_note_source";
				if not source_selected( name, reference ) then
					list[name] = name;
				else
				end;
			end;
		end;
			obs.bfree(source); 
		for key, value in pairsByKeys( list ) do
			obs.obs_property_list_add_string( p_b5, value, value ); 
		end;
	end;
	local p_b7 = obs.obs_properties_add_int( group_props_3, "sub_limit_note_source_visible", "Note visible", 0, 36000, 1 );
	obs.obs_property_int_set_suffix( p_b7, "     milliseconds visible, 0 is infinite" );
	local p_b8 = obs.obs_properties_add_button( group_props_3, "sec_sub_refresh", "Refresh to update form", refresh_properties );
	local group_props_1 = obs.obs_properties_create();
	obs.obs_properties_add_group( ctx.propsDef, "_group_1", "Stopwatch Start Point", obs.OBS_GROUP_NORMAL, group_props_1 );
	local p_41 = obs.obs_properties_add_int( group_props_1, "sw_hours_saved", "HH", 0, 23, 1);
	local p_42 = obs.obs_properties_add_int( group_props_1, "sw_minutes_saved", "MM", 0, 59, 1);
	local p_43 = obs.obs_properties_add_int( group_props_1, "sw_seconds_saved", "SS", 0, 59, 1);
	local p_44 = obs.obs_properties_add_int( group_props_1, "sw_milliseconds_saved", "FF", 0, 99, 1);
	local p_45 = obs.obs_properties_add_bool( group_props_1, "load_saved_time", "Autoload last time stamp when OBS starts" );
	local p_46 = obs.obs_properties_add_button( group_props_1, "sw_button", "Set", sw_saved_button_clicked );
	local p_47 = obs.obs_properties_add_float( group_props_1, "sw_current_seconds", "Saved Seconds", 0, 3600000000, 0.1);
	obs.obs_property_set_visible( p_47 , false );
	local p_48 = obs.obs_properties_add_button( ctx.propsDef, "pause_button", "Start", pause_button_clicked );
	obs.obs_properties_add_button( ctx.propsDef, "split_button", "Split Time", split_button_clicked );
	local p_49 = obs.obs_properties_add_button( ctx.propsDef, "mili_button", "Show Milliseconds", mili_button_clicked );
	local p_50 = obs.obs_properties_add_button( ctx.propsDef, "direction_button", "Count Up/Down", direction_button_clicked );
	local p_51 = obs.obs_properties_add_button( ctx.propsDef, "reset_button", "Reset Stopwatch", reset_button_clicked );
	local p_52 = obs.obs_properties_add_bool( ctx.propsDef, "set_stopwatch", "Set Stopwatch" );	
    local p_53 = obs.obs_properties_add_bool( ctx.propsDef, "start_on_visible", "Start Timer on Source Visible" );
    obs.obs_properties_add_bool( ctx.propsDef, "force_reset_on_visible", "Reset Timer on Source Visible" );
    obs.obs_properties_add_bool( ctx.propsDef, "active_source_force_visible", "Toggle Active Source Visibility" );
    local p_54 = obs.obs_properties_add_bool( ctx.propsDef, "start_on_scene_active", "Start Timer on Scene Active" );
    obs.obs_properties_add_bool( ctx.propsDef, "force_reset_on_scene_active", "Reset timer on Scene Active" );
    obs.obs_properties_add_bool( ctx.propsDef, "disable_script", "Disable Script" );
    local p_55 = obs.obs_properties_add_bool( ctx.propsDef, "enable_direction_toggle", "Enable Timer Direction Toggle" );
    obs.obs_properties_add_bool( ctx.propsDef, "prevent_negative_time", "Prevent Negative Time Value" );
	local p_56 = obs.obs_properties_add_bool( ctx.propsDef, "backup_mode", "Backup Mode" );
	local p_57 = obs.obs_properties_add_path( ctx.propsDef, "backup_folder", "Backup Folder", obs.OBS_PATH_DIRECTORY, nil, nil);
	local p_58 = obs.obs_properties_add_list( ctx.propsDef, "import_list", "<i>Load Settings</i>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING );
	obs.obs_property_list_add_string( p_58, "Select ", "select" ); 
	obs.obs_property_set_long_description( p_58, "\nSelect the Settings file to import.\n" ); 
	local filenames = get_filenames( path, ".json" ); 
	if table.getn( filenames ) > 0 then
  		for i,v in pairs( filenames ) do 
			obs.obs_property_list_add_string( p_58, v, v ); 
		end;
	end;
	local p_59 = obs.obs_properties_add_button( ctx.propsDef, "export_button", "Export Settings", export_button_clicked );
	local p_60 = obs.obs_properties_add_button( ctx.propsDef, "import_button", "Import Settings", import_button_clicked );
	local p_61 = obs.obs_properties_add_bool( ctx.propsDef, "script_ready", "Script Ready" );
	obs.obs_property_set_visible( p_61 , false );
	obs.source_list_release( sources ); 
	--
  	obs.obs_property_set_modified_callback( p_ab, property_onchange );		
  	obs.obs_property_set_modified_callback( p_a4, property_onchange );		
  	obs.obs_property_set_modified_callback( p_b4, property_onchange );		
  	obs.obs_property_set_modified_callback( p_a6, property_onchange );		
  	obs.obs_property_set_modified_callback( p_b6, property_onchange );		
  	obs.obs_property_set_modified_callback( p_1, property_onchange );		
  	obs.obs_property_set_modified_callback( p_2, property_onchange );		
	obs.obs_property_set_modified_callback( p_3, property_onchange );		
  	obs.obs_property_set_modified_callback( p_4, property_onchange );		
  	obs.obs_property_set_modified_callback( p_5, property_onchange );		
  	obs.obs_property_set_modified_callback( p_8, property_onchange );		
  	obs.obs_property_set_modified_callback( p_9, property_onchange );		
  	obs.obs_property_set_modified_callback( p_11, property_onchange );		
  	obs.obs_property_set_modified_callback( p_12, property_onchange );		
  	obs.obs_property_set_modified_callback( p_13, property_onchange );		
  	obs.obs_property_set_modified_callback( p_14, property_onchange );		
  	obs.obs_property_set_modified_callback( p_15, property_onchange );		
  	obs.obs_property_set_modified_callback( p_16, property_onchange );		
	obs.obs_property_set_modified_callback( p_17, property_onchange );		
	obs.obs_property_set_modified_callback( p_18, property_onchange );		
	obs.obs_property_set_modified_callback( p_20, property_onchange );		
	obs.obs_property_set_modified_callback( p_23, property_onchange );		
	obs.obs_property_set_modified_callback( p_24, property_onchange );		
	obs.obs_property_set_modified_callback( p_26, property_onchange );		
  	obs.obs_property_set_modified_callback( p_27, property_onchange );		
  	obs.obs_property_set_modified_callback( p_28, property_onchange );		
  	obs.obs_property_set_modified_callback( p_29, property_onchange );		
  	obs.obs_property_set_modified_callback( p_32, property_onchange );		
  	obs.obs_property_set_modified_callback( p_36, property_onchange );		
  	obs.obs_property_set_modified_callback( p_37, property_onchange );		
	obs.obs_property_set_modified_callback( p_52, property_onchange );		
	obs.obs_property_set_modified_callback( p_45, property_onchange );		
	obs.obs_property_set_modified_callback( p_53, property_onchange );		
	obs.obs_property_set_modified_callback( p_54, property_onchange );		
	obs.obs_property_set_modified_callback( p_55, property_onchange );		
	obs.obs_property_set_modified_callback( p_56, property_onchange );		
	obs.obs_property_set_modified_callback( p_57, property_onchange );		
	obs.obs_property_set_modified_callback( p_58, property_onchange );		
	obs.obs_property_set_modified_callback( p_60, import_properties );		
  	obs.obs_properties_apply_settings( ctx.propsDef, ctx.propsSet );
	return ctx.propsDef;
end
function update_source_list()
	selected_source_list["timer_source"] = timer_source; 
	selected_source_list["split_source"] = split_source;
	selected_source_list["active_source"] = active_source;
	selected_source_list["note_source_marker_a"] = note_source_marker_a;
	selected_source_list["note_source_marker_b"] = note_source_marker_b;
	selected_source_list["sub_limit_note_source"] = sub_limit_note_source;
	selected_source_list["add_limit_note_source"] = add_limit_note_source;
end
function source_selected( input_value, reference )
	if in_table( {'Select, select'}, input_value ) or selected_source_list[reference] == input_value then return false end;
	return in_table( selected_source_list, input_value );
end
function script_update( settings )
	remove_all_timers();
  	ctx.propsSet = settings;
	count_sources();
	assign_default_frequency();
	load_settings_globals( settings ); 
	reset_mili( ); 
	reset( true ); 
	update_timer_settings( false ); 
	minute_format = get_minutes_allocation( custom_time_format );
end
function script_defaults( settings )
	assign_default_frequency();
	obs.obs_data_set_default_int( settings, "sec_add_limit", 0 );
	obs.obs_data_set_default_int( settings, "sec_add_limit_used", 0 );
	obs.obs_data_set_default_int( settings, "sec_sub_limit", 0 );
	obs.obs_data_set_default_int( settings, "sec_sub_limit_used", 0 );
	obs.obs_data_set_default_int( settings, "hours", 0 );
	obs.obs_data_set_default_int( settings, "config", 1 );
	obs.obs_data_set_default_int( settings, "minutes", 0 );
	obs.obs_data_set_default_int( settings, "seconds", 0 );
	obs.obs_data_set_default_int( settings, "sec_add_1", 5 );
	obs.obs_data_set_default_int( settings, "sec_add_2", 15 );
	obs.obs_data_set_default_int( settings, "sec_add_3", 30 );
	obs.obs_data_set_default_int( settings, "sec_sub_1", 5 );
	obs.obs_data_set_default_int( settings, "sec_sub_2", 15 );
	obs.obs_data_set_default_int( settings, "sec_sub_3", 30 );
	obs.obs_data_set_default_int( settings, "split_type", 2 );
	obs.obs_data_set_default_int( settings, "timer_mode", 1 );
	obs.obs_data_set_default_int( settings, "timer_format", 1 );
	obs.obs_data_set_default_int( settings, "timer_display", 1 );
	obs.obs_data_set_default_int( settings, "timer_options", 1 );
	obs.obs_data_set_default_int( settings, "sw_hours_saved", 0 );
	obs.obs_data_set_default_int( settings, "countdown_type", 2 );
	obs.obs_data_set_default_int( settings, "recording_type", 5 );
	obs.obs_data_set_default_int( settings, "sw_minutes_saved", 0 );
	obs.obs_data_set_default_int( settings, "sw_seconds_saved", 0 );
	obs.obs_data_set_default_int( settings, "cycle_direction", 1 );
	obs.obs_data_set_default_int( settings, "start_recording", 2 );
	obs.obs_data_set_default_int( settings, "reset_text_marker_a", 3 );
	obs.obs_data_set_default_int( settings, "reset_text_marker_b", 3 );
	obs.obs_data_set_default_int( settings, "duration_marker_a", 5 );
	obs.obs_data_set_default_int( settings, "duration_marker_b", 5 );
	obs.obs_data_set_default_int( settings, "timer_manipulation", 3 );
	obs.obs_data_set_default_int( settings, "duration_marker_end", 5 );
	obs.obs_data_set_default_int( settings, "enable_marker_notes", 1 );
	obs.obs_data_set_default_int( settings, "media_playback_limit", 1 );
	obs.obs_data_set_default_int( settings, "sw_milliseconds_saved", 0 );
	obs.obs_data_set_default_int( settings, "year", os.date("%Y", os.time()) );
	obs.obs_data_set_default_int( settings, "add_limit_note_source_visible", 0 )
	obs.obs_data_set_default_int( settings, "sub_limit_note_source_visible", 0 )
	obs.obs_data_set_default_int( settings, "color_normal", media["color_normal"] );
	obs.obs_data_set_default_int( settings, "color_marker_a", media["color_marker_a"] );
	obs.obs_data_set_default_int( settings, "color_marker_b", media["color_marker_b"] );
	obs.obs_data_set_default_string( settings, "stop_text", "" );
	obs.obs_data_set_default_string( settings, "text_prefix", "" );
	obs.obs_data_set_default_string( settings, "text_suffix", "" );
	obs.obs_data_set_default_string( settings, "note_marker_a", "" );
	obs.obs_data_set_default_string( settings, "note_marker_b", "" );
	obs.obs_data_set_default_string( settings, "next_scene", "select" );
	obs.obs_data_set_default_string( settings, "day_text", "# Day \n" );
	obs.obs_data_set_default_string( settings, "audio_marker_b", "None" );
	obs.obs_data_set_default_string( settings, "audio_marker_a", "None" );
	obs.obs_data_set_default_string( settings, "audio_marker_end", "None" );
	obs.obs_data_set_default_string( settings, "days_text", "# Days \n" );
	obs.obs_data_set_default_string( settings, "split_source", "select" );
	obs.obs_data_set_default_string( settings, "timer_source", "select" );
	obs.obs_data_set_default_string( settings, "active_source", "select" );
	obs.obs_data_set_default_string( settings, "toggle_mili_trigger", "" );
	obs.obs_data_set_default_string( settings, "sub_limit_note_source", "select" );
	obs.obs_data_set_default_string( settings, "add_limit_note_source", "select" );
	obs.obs_data_set_default_string( settings, "note_source_marker_a", "select" );
	obs.obs_data_set_default_string( settings, "note_source_marker_b", "select" );
	obs.obs_data_set_default_string( settings, "custom_time_format", "$T$D:$H:$M:$S,$F" );
	obs.obs_data_set_default_bool( settings, "backup_mode", false );
	obs.obs_data_set_default_bool( settings, "set_stopwatch", false );
	obs.obs_data_set_default_bool( settings, "disable_script", false );
	obs.obs_data_set_default_bool( settings, "load_saved_time", false );
	obs.obs_data_set_default_bool( settings, "start_on_visible", false );
	obs.obs_data_set_default_bool( settings, "start_on_scene_active", false );
	obs.obs_data_set_default_bool( settings, "force_reset_on_visible", false );
	obs.obs_data_set_default_bool( settings, "enable_direction_toggle", false );
	obs.obs_data_set_default_bool( settings, "force_reset_on_scene_active", false );
	obs.obs_data_set_default_bool( settings, "prevent_negative_time", false );
	obs.obs_data_set_default_bool( settings, "active_source_force_visible", false );
	obs.obs_data_set_default_bool( settings, "script_ready", true ); 
  	ctx.propsSet = settings; 
end
function script_save( settings )
	local hotkey_save_array_reset = obs.obs_hotkey_save( hotkey_id_reset );
	obs.obs_data_set_array( settings, "reset_hotkey", hotkey_save_array_reset );
	obs.obs_data_array_release( hotkey_save_array_reset );
	local hotkey_save_array_pause = obs.obs_hotkey_save( hotkey_id_pause );
	obs.obs_data_set_array( settings, "pause_hotkey", hotkey_save_array_pause );
	obs.obs_data_array_release( hotkey_save_array_pause );
	local hotkey_save_array_split = obs.obs_hotkey_save( hotkey_id_split );
	obs.obs_data_set_array( settings, "split_hotkey", hotkey_save_array_split );
	obs.obs_data_array_release( hotkey_save_array_split );
	local hotkey_save_array_mili = obs.obs_hotkey_save( hotkey_id_mili );
	obs.obs_data_set_array( settings, "mili_hotkey", hotkey_save_array_mili );
	obs.obs_data_array_release( hotkey_save_array_mili );
	local hotkey_save_array_direction = obs.obs_hotkey_save( hotkey_id_direction );
	obs.obs_data_set_array( settings, "direction_hotkey", hotkey_save_array_direction );
	obs.obs_data_array_release( hotkey_save_array_direction );
	local hotkey_save_array_sec_add_1 = obs.obs_hotkey_save( hotkey_id_sec_add_1 );
	obs.obs_data_set_array( settings, "sec_add_1_hotkey", hotkey_save_array_sec_add_1 );
	obs.obs_data_array_release( hotkey_save_array_sec_add_1 );
	local hotkey_save_array_sec_add_2 = obs.obs_hotkey_save( hotkey_id_sec_add_2 );
	obs.obs_data_set_array( settings, "sec_add_2_hotkey", hotkey_save_array_sec_add_2 );
	obs.obs_data_array_release( hotkey_save_array_sec_add_2 );
	local hotkey_save_array_sec_add_3 = obs.obs_hotkey_save( hotkey_id_sec_add_3 );
	obs.obs_data_set_array( settings, "sec_add_3_hotkey", hotkey_save_array_sec_add_3 );
	obs.obs_data_array_release( hotkey_save_array_sec_add_3 );
	local hotkey_save_array_sec_sub_1 = obs.obs_hotkey_save( hotkey_id_sec_sub_1 );
	obs.obs_data_set_array( settings, "sec_sub_1_hotkey", hotkey_save_array_sec_sub_1 );
	obs.obs_data_array_release( hotkey_save_array_sec_sub_1 );
	local hotkey_save_array_sec_sub_2 = obs.obs_hotkey_save( hotkey_id_sec_sub_2 );
	obs.obs_data_set_array( settings, "sec_sub_2_hotkey", hotkey_save_array_sec_sub_2 );
	obs.obs_data_array_release( hotkey_save_array_sec_sub_2 );
	local hotkey_save_array_sec_sub_3 = obs.obs_hotkey_save( hotkey_id_sec_sub_3 );
	obs.obs_data_set_array( settings, "sec_sub_3_hotkey", hotkey_save_array_sec_sub_3 );
	obs.obs_data_array_release( hotkey_save_array_sec_sub_3 );
	if load_saved_time then
		obs.obs_data_set_double( ctx.propsSet, "sw_current_seconds", current_seconds );
		obslua.obs_data_apply( settings, ctx.propsSet );
	end	
end	
function script_load( settings )
	obs.obs_data_set_bool( ctx.propsSet, "script_ready", ( count_sources() ~= 0) ); 
	assign_default_frequency();
	local sh = obs.obs_get_signal_handler();
	obs.signal_handler_connect( sh, "source_load", loaded ); 
	obs.signal_handler_connect( sh, "source_deactivate", source_deactivated ); 
	obs.signal_handler_connect( sh, "source_activate", source_activated ); 
	local hotkey_name = "";
	hotkey_name = "timer_reset_" .. filename():lower():gsub("[%W%p%c%s]", "");
	hotkey_id_reset = obs.obs_hotkey_register_frontend( hotkey_name, "Reset " .. filename(), hotkey_send_reset );
	local hotkey_save_array_reset = obs.obs_data_get_array( settings, "reset_hotkey" );
	obs.obs_hotkey_load( hotkey_id_reset, hotkey_save_array_reset );
	obs.obs_data_array_release( hotkey_save_array_reset );
	hotkey_name = "timer_pause_" .. filename():lower():gsub("[%W%p%c%s]", "");
	hotkey_id_pause = obs.obs_hotkey_register_frontend( hotkey_name, "Start/Pause " .. filename(), hotkey_send_pause );
	local hotkey_save_array_pause = obs.obs_data_get_array( settings, "pause_hotkey" );
	obs.obs_hotkey_load( hotkey_id_pause, hotkey_save_array_pause );
	obs.obs_data_array_release( hotkey_save_array_pause );
	hotkey_name = "timer_split_" .. filename():lower():gsub("[%W%p%c%s]", "");
	hotkey_id_split = obs.obs_hotkey_register_frontend( hotkey_name, "Split Time " .. filename(), hotkey_send_split );
	local hotkey_save_array_split = obs.obs_data_get_array( settings, "split_hotkey" );
	obs.obs_hotkey_load( hotkey_id_split, hotkey_save_array_split );
	obs.obs_data_array_release( hotkey_save_array_split );
	hotkey_name = "timer_mili_" .. filename():lower():gsub("[%W%p%c%s]", "");
	hotkey_id_mili = obs.obs_hotkey_register_frontend( hotkey_name, "Milliseconds Toggle " .. filename(), hotkey_send_mili );
	local hotkey_save_array_mili = obs.obs_data_get_array( settings, "mili_hotkey" );
	obs.obs_hotkey_load( hotkey_id_mili, hotkey_save_array_mili );
	obs.obs_data_array_release( hotkey_save_array_mili );
	hotkey_name = "direction_change_" .. filename():lower():gsub("[%W%p%c%s]", "");
	hotkey_id_direction = obs.obs_hotkey_register_frontend( hotkey_name, "Change Timer Direction " .. filename(), hotkey_send_direction );
	local hotkey_save_array_direction = obs.obs_data_get_array( settings, "direction_hotkey" );
	obs.obs_hotkey_load( hotkey_id_direction, hotkey_save_array_direction );
	obs.obs_data_array_release( hotkey_save_array_direction );
	hotkey_name = "sec_add_1_" .. filename():lower():gsub("[%W%p%c%s]", "");
	hotkey_id_sec_add_1 = obs.obs_hotkey_register_frontend( hotkey_name, "Add Seconds Set 1 " .. filename(), hotkey_send_sec_add_1 );
	local hotkey_save_array_sec_add_1 = obs.obs_data_get_array( settings, "sec_add_1_hotkey" );
	obs.obs_hotkey_load( hotkey_id_sec_add_1, hotkey_save_array_sec_add_1 );
	obs.obs_data_array_release( hotkey_save_array_sec_add_1 );
	hotkey_name = "sec_add_2_" .. filename():lower():gsub("[%W%p%c%s]", "");
	hotkey_id_sec_add_2 = obs.obs_hotkey_register_frontend( hotkey_name, "Add Seconds Set 2 " .. filename(), hotkey_send_sec_add_2 );
	local hotkey_save_array_sec_add_2 = obs.obs_data_get_array( settings, "sec_add_2_hotkey" );
	obs.obs_hotkey_load( hotkey_id_sec_add_2, hotkey_save_array_sec_add_2 );
	obs.obs_data_array_release( hotkey_save_array_sec_add_2 );
	hotkey_name = "sec_add_3_" .. filename():lower():gsub("[%W%p%c%s]", "");
	hotkey_id_sec_add_3 = obs.obs_hotkey_register_frontend( hotkey_name, "Add Seconds Set 3 " .. filename(), hotkey_send_sec_add_3 );
	local hotkey_save_array_sec_add_3 = obs.obs_data_get_array( settings, "sec_add_3_hotkey" );
	obs.obs_hotkey_load( hotkey_id_sec_add_3, hotkey_save_array_sec_add_3 );
	obs.obs_data_array_release( hotkey_save_array_sec_add_3 );
	hotkey_name = "sec_sub_1_" .. filename():lower():gsub("[%W%p%c%s]", "");
	hotkey_id_sec_sub_1 = obs.obs_hotkey_register_frontend( hotkey_name, "Add Seconds Set 1 " .. filename(), hotkey_send_sec_sub_1 );
	local hotkey_save_array_sec_sub_1 = obs.obs_data_get_array( settings, "sec_sub_1_hotkey" );
	obs.obs_hotkey_load( hotkey_id_sec_sub_1, hotkey_save_array_sec_sub_1 );
	obs.obs_data_array_release( hotkey_save_array_sec_sub_1 );
	hotkey_name = "sec_sub_2_" .. filename():lower():gsub("[%W%p%c%s]", "");
	hotkey_id_sec_sub_2 = obs.obs_hotkey_register_frontend( hotkey_name, "Add Seconds Set 2 " .. filename(), hotkey_send_sec_sub_2 );
	local hotkey_save_array_sec_sub_2 = obs.obs_data_get_array( settings, "sec_sub_2_hotkey" );
	obs.obs_hotkey_load( hotkey_id_sec_sub_2, hotkey_save_array_sec_sub_2 );
	obs.obs_data_array_release( hotkey_save_array_sec_sub_2 );
	hotkey_name = "sec_sub_3_" .. filename():lower():gsub("[%W%p%c%s]", "");
	hotkey_id_sec_sub_3 = obs.obs_hotkey_register_frontend( hotkey_name, "Add Seconds Set 3 " .. filename(), hotkey_send_sec_sub_3 );
	local hotkey_save_array_sec_sub_3 = obs.obs_data_get_array( settings, "sec_sub_3_hotkey" );
	obs.obs_hotkey_load( hotkey_id_sec_sub_3, hotkey_save_array_sec_sub_3 );
	obs.obs_data_array_release( hotkey_save_array_sec_sub_3 );
	if not load_saved_time then
		update_prop_settings_current_seconds( 0 ) 
	end	
end