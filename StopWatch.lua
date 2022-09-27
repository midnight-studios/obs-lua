--[[
----------------------------------------------------------------------------------------------------------------------------------------
Open Broadcaster Software®️
OBS > Tools > Scripts
@midnight-studios
Stopwatch


Version 3.9

Published / Released: 2022-09

NEW FEATURES

- Added button Show / Hide Milliseconds
- Added Time Stamp trigger for Show / Hide Milliseconds
- Added Timer text output options (Still not convinvinced this makes sense)
- Added Hotkey for Show / Hide Milliseconds
- Pause Media if timer is paused
- Added option to force visibility of the 'Active Source'

OPTIMIZATION

- OBS 28 Supported
- Rebuild timer text options
- Prevented unnecessary Callback Events
- Localized functions to reduce Globals clutter
- Renamed some functions to something more sensible 
- Added and updated developer code comments
- Realigned function stacking order
- Renamed Hotkey references 
 
USER EXPERIENCE & FEATURE ENHANCEMENTS
- Added tooltip for Next Scene list
- Added tooltip for Recording list
- Items listed in Cycle Sources list will ignore incorrectly referenced sources. 
- User can now define the direction of Cycle Sources
- Cycle Sources (and toggle source visibility) with timer is now fully automated without third party plugins/scripts
- Cycle Sources now support Nested Scenes
- Added new Toggles for settings properties to hide or show certain settings

BUGS

- Fixed a Stack Overflow Crash produced by the Next Scene process.
- Fixed an issue that caused a timer feature to break.
- Fixed a critical memory leak for media sources that caused OBS to crash
- Fixed Media Playback time limit

TODO> 

- Add new function: timer reset delay. Used to delay bwteen timer 
- Testing
- No tasks outstanding 

----------------------------------------------------------------------------------------------------------------------------------------
]]
--Globals
obs           				= obslua
gversion 					= '3.9'
luafile						= 'StopWatch.lua'
obsurl						= 'comprehensive-stopwatch-countdown-timer.1364/'
patch_notes					= 'Patch Notes'
icon='data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABUAAAAVCAYAAACpF6WWAAAENElEQVQ4jY1UTUgjZxh+ksl/JuMkMYb4F40bNZqK0KJFqBZqS9ddyl76dyhdKPRQShH2sNDSnnopCz11D10KS/dSKNiDoD2I7KXFQ0XSSGpM1llFMYn5mZiMY2IymfIOhgazXfaDj5n53u975vme531fnaqqeMHxJYCvAOgAlABcAyA1jxLO1tYW1tbWoL+Kd3x8jGg0imw2C0VRWkMEYgNgBeAFYKTFRqOh7aVnE9xwFTSZTGJ7exszMzPQ6XSQZRk8z9P7YrVa/Y5hmKLBYHCpqirW63Wcn5/j7OwMHo9HA6bvNqY2mw1Op1N70qaTkxPkcjmbLMsDZrN5hOO4NxuNhlMUxTFiSCA0FEW5GQ6H/wmHwzfamDavUKlUYDKZAoFA4Gue52/r9f/9v6OjQ5uKojwpFAr3RFF8UCwWjW63OzQ/P/9yGyiBnZ6eEtN3eZ7/9XJZrlQqP2cymcf5fL4QDAbHdTrd2yzLXvd4PD9yHHdLEISFXC7nsdvtuTb3c7kcEokEJiYmhliWtaiqWs5ms4f1el0lE2lOTU0hn8/DYrF09vb23jebze9JkvRXNBqdMpvNaIJaLh1tHScAzpvsSd+joyOkUimEQiFNa4vFAlEU4Xa7HwYCgduFQuHRxsbGx5p+qqq+o/7/SF7uQSaTwcHBgZYdgiBMqKqa2dnZ8S8tLaFcLicIIR6PjzU13Qew+gzPKNEj9JJOp5tag+O41/v7+x/v7u7+sLOzc8BxHN1icXR0dMXlcn3xQhW1v7+PSCSC6enptxwOx3WWZRcbjcbTjY2NAJ1nWRYGgwHj4+OqoigFYnr/UlPlClYFwJ1arVYjU8bGxhZ8Pt9KMxiLxd5gGEbTlTSv1WqQJOmJw+G4RqCfPYfkN4qiFDs7O9HT0/Nqa4BhmKd2u10DrFaruLi4oJmncibQSUCrLHJabDlHzItGo1E7FIvFvg+FQjMmkykkCMK9eDwOivl8PvqhBspxXJAOEujfz2HazzBMdXh4OJNMJoupVGre7/cbBEGor6+vY2RkROsLlwY6jUajS5KkSGvtf0oVemUeAPiDgsFgUHMeQJ3MmZycxNzcnMZWkiT4/f67FJRl+UFrmcYB/N7y3UyLSHOBzNjb20MgEMDg4CC6urqwublJZo12d3ffVRRFEQTh4TNTqlQqaawoTShOVdOsqMPDQ8zOzmqFQK3PZrO91NPTs2U0GkmWG4lEYrWt9cViMSwvL1Ntvw9gRafT/aTX6z8AwFKcuhU5zjDMkNfr/XZgYCBKgMfHx3eSyeSqw+Fob9LEipxMp9MRp9P5uclkWuB5/hOKWa3Wvb6+vjLP8wNer5fXUkRRLkql0ofZbPY3ug019TZQ6jKU0AzD7Iqi+Josy6+4XK6P7Hb7LbvdPkS5SXpXKpU/ZVn+5ezs7FG9Xi9brVZNLr1ej38BVDs6EbSfFQsAAAAASUVORK5CYII='
desc	    				= [[
<hr/><center><h2>Advanced Stopwatch</h2>( Version: %s )</center>
<br><center><img width=38 height=42 src=']] .. icon .. [['/></center>
<br><center><a href='https://github.com/midnight-studios/obs-lua/blob/main/]] .. luafile ..[['>Find it on GitHub</a></center>
<center><a href='https://obsproject.com/forum/resources/]] .. obsurl ..[[updates]] .. patch_notes ..[['>Patch Notes</a></center>
<br><p>The Properties for this script will adjust visibility as needed. Some advanced properties will only be visible if the Configuration is set to 'Advanced'. If the Configuration is set to 'Basic' the defined values will still be used, so ensure you define those correctly.</p><p>Find help on the <a href='https://obsproject.com/forum/resources/]] .. obsurl ..[['>OBS Forum Thread</a>.</p><hr/>]]
sw_hours_saved 				= 0
sw_minutes_saved 			= 0
sw_seconds_saved 			= 0
sw_milliseconds_saved 		= 0
text_prefix 				= ''
text_suffix 				= ''
last_text    				= ''
custom_time_format			= ''
timer_source   				= ''
countdown_type 				= ''
backup_folder 				= ''
import_list 				= ''
longtimetext_s 				= ''
longtimetext_p 				= ''
last_split_data 			= ''
split_type   				= ''
split_source   				= ''
active_source  				= ''
next_scene					= ''
stop_text					= ''
toggle_mili_trigger			= ''
output_file_name 			= '-backup($date_stamp).json';
font_normal					= '#ffffff'
font_dimmed					= '#bfbbbf'
font_highlight				= '#fffdcf'
cur_seconds   				= 0
cycle_direction				= 1
--[[
	** Commment marked for removal ** 
	TODO> please identify which function need this
	OUTCOME> Now I am not sure what issue this caused
	or it has been resolved by another bug patch. Let's
	see if an issue related to this surfaces again and
	please remember to describe with comprehensive details
	of the problem (bug)
	** Commment marked for removal ** 
]]
def_seconds   				= 0
split	     				= 0
timer_year	     			= 0
timer_month	     			= 0
timer_day	     			= 0
timer_hours	     			= 0
timer_minutes 	     		= 0
timer_seconds	     		= 0
timer_type   				= 0
timer_format				= 1
timer_display  				= 1
start_recording				= 0
media_playback_limit		= 0
recording_type				= 0
trigger_text				= 1
orig_time     				= 0
time_frequency				= 0
completed_cycles			= 0
ns_last						= 0
cycle_index 				= 1
timer_cycle 				= 10 --milliseconds
split_itm					= {}
split_data					= nil
script_settings 			= nil
props 						= nil
activated     				= false
prevent_callback  			= false
timer_active  				= false
reset_activated				= false
start_on_visible  			= false
active_source_force_visible	= false
start_on_scene_active		= false
disable_script   			= false
show_mili   				= true
timer_expired  				= true
mili_toggle_triggered		= false
media = {
text_warning				= '',
text_caution				= '',
source_name_audio_warning	= '',
source_name_audio_caution	= '', 
note_source_caution 		= '',
note_source_warning 		= '',
note_caution 				= '',
note_warning 				= '',
activated_warning			= false,
activated_caution			= false, 
cur_seconds_caution			= 0,
cur_seconds_warning			= 0, 
duration_caution			= 0, 
duration_warning			= 0, 
media_ended_caution			= false, 
media_ended_warning			= false,
normal_color				= 4294967295, -- 4294967295 0xFFFFFFFF
color_caution				= 4256749, -- 4256749 0x40f3ed
color_warning				= 329050, -- 329050 0x05055a
last_state_caution			= obs.OBS_MEDIA_STATE_NONE,
last_state_warning			= obs.OBS_MEDIA_STATE_NONE
}
hotkey_id_reset			= obs.OBS_INVALID_HOTKEY_ID
hotkey_id_pause			= obs.OBS_INVALID_HOTKEY_ID
hotkey_id_split			= obs.OBS_INVALID_HOTKEY_ID
hotkey_id_mili			= obs.OBS_INVALID_HOTKEY_ID

--[[
----------------------------------------------------------------------------------------------------------------------------------------
	
	Description:	A function named script_description returns the description shown to
					the user
	
	Credit:			OBS

	Modified:		User dependent 

	function:		Script Description
	type:			OBS Core
	input type: 	data
	returns:		string
----------------------------------------------------------------------------------------------------------------------------------------
]]
function script_description()
	return string.format( desc, tostring( gversion ) )
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Dumps input to string, if input is a table it returns the expanded table
	
	Credit:			et al	

	Modified:		yes

	function:		
	type:			Support (debug tool)
	input type: 	variable
	returns:		string
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function pre_dump( input )
  if type( input ) == 'table' then
    local str = '{ '
    for key, value in pairs( input ) do
      if type( key ) ~= 'number' then key = '"' .. key .. '"' end
      str = str .. '[' .. key .. '] = ' .. pre_dump( value ) .. ','
    end
    return str .. '} '
  else
    return tostring( input )
  end
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Use this to create a Script Log Output used in testing	
	
	Credit:			et al	

	Modified:		No	

	function:		
	type:			Support (debug tool)
	input type: 	string
	returns:		print(string)
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function log( name, msg )
  if msg ~= nil then
    msg = ' > ' .. tostring( msg )
  else
    msg = ''
  end
  obs.script_log( obs.LOG_DEBUG, tostring( name ) .. msg )
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Builds a table by splitting a string by defined character or sequence of characters marking 
					the beginning or end of a unit of data. That which delimits, that separates.	
	
	Credit:			midnight-studios, et al	

	Modified:		

	function:		breaks string into sections by a reference that is returned in a table
	type:			
	input type: 	string, delimiter	
	returns:		table		
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function explode( str, delim )
   local tbl, index
   tbl = {}
   index = 0
   if( #str == 1 ) then return {str} end -- returns a table with the input string as the only value
   while true do
      local trace_index = string.find( str, delim, index, true ) -- find the next d in the string
      if trace_index ~= nil then -- if 'not not' found then..
         table.insert( tbl, string.sub( str, index, trace_index - 1 ) ) -- Save it in our array.
         index = trace_index + 1 -- save just after where we found it for searching next time.
      else
         table.insert( tbl, string.sub( str, index ) ) -- Save what's left in our array.
         break -- Break at end, as it should be, according to the lua manual.
      end
   end
   return tbl
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Gives you an iterator that moves through an 
					ordinary table (eg. string keys) but sorted 
					into key sequence.
					It does that by copying the table keys into
					a temporary table and sorting that.
					
					Possibly being string referenced the list
					will be compiled chronologically, thus the
					list names (values) may appear unordered and
					random. To reorganise and arrange the list
					alphabetically we will use pairsByKeys(). 
					This will make it easier for the user to review
					and select the desired item from the list.
	
	Credit:			https://github.com/nickgammon/mushclient/blob/master/lua/pairsbykeys.lua
					https://github.com/nickgammon/mushclient/tree/master/lua
					If you need to sort keys other than strings, see:
					See: http://lua-users.org/wiki/SortedIteration

	Modified:		Yes, minor changes

	function:		support: This prints the math functions in key order
	type:			sort table
	input type: 	table, function (optional)
	returns:		table
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function pairsByKeys( tbl, input_function )
	if type( tbl ) ~= 'table' then return tbl end -- if the input table is not of type table return input
	local temp_tbl = {} -- build temporary table of the keys
	for items in pairs( tbl ) do table.insert( temp_tbl, items ) end
	table.sort( temp_tbl, input_function ) -- sort using supplied function, if any
	local i = 0 -- iterator variable
	local iter = function () -- iterator function
		i = i + 1
		if temp_tbl[i] == nil then return nil
		else return temp_tbl[i], tbl[temp_tbl[i]]
		end
	end
	return iter
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Provides the length of a table 
					(how many items the table contains)
	
	Credit:			midnight-studios, et al	

	Modified:		Author

	function:		Create a table with unique items
	type:			Support
	input type:		table 	
	returns:		integer 		
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function tablelength( tbl )
	local count = 0
	if type( tbl ) == 'table' then -- if the input table is not of type table return 0
		for _ in pairs( tbl ) do count = count + 1 end
	end 
	return count
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Remove duplicated values from table
	
	Credit:			midnight-studios, et al	

	Modified:		Author

	function:		Create a table with unique items
	type:			Support
	input type:		table, string 	
	returns:		bool	
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function tableHasKey( tbl, key )
	if type( tbl ) ~= 'table' then return false end -- if the input table is not of type table return bool(false)
    return tbl[key] ~= nil
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Remove duplicated values from table
	
	Credit:			midnight-studios, et al	

	Modified:		Author

	function:		Create a table with unique items
	type:			Support
	input type:		table, string 	
	returns:		bool	
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function in_table( tbl, input_value )
	if type( tbl ) ~= 'table' then return false end -- if the input table is not of type table return bool(false)
	local found = false -- set result default bool (not found)
	for key, value in pairs( tbl ) do
		if value == input_value then -- compare search value against table value
			found = true -- found, update result bool
			break -- found, end and exit here
		end	
	end
	return found -- return bool
end
--[[
----------------------------------------------------------
	Description:	Remove duplicated values from table
	
	Credit:			midnight-studios, et al	

	Modified:		Author

	function:		Create a table with unique items
	type:			Support
	input type:		table 	
	returns:		table
----------------------------------------------------------
]]
local function remove_duplicates( tbl )
	if type( tbl ) ~= 'table' then return table end -- if the input table is not of type table return input
	local hash = {}
	local clean_tbl = {}
	for _, value in pairsByKeys( tbl ) do
	   if ( not hash[value] ) then
		   clean_tbl[#clean_tbl+1] = value -- you could print here instead of saving to result table if you wanted
		   hash[value] = true
	   end
	end	
	return clean_tbl -- return final result
end	
--[[
----------------------------------------------------------
	Description:	This is basically obs.obs_enum_sources()
					but 'Nested Scenes' are not listed in 'obs.obs_enum_sources()'
	
	Credit:			midnight-studios, et al	

	Modified:		Author

	function:		Used to build a list from OBS source names into a table
	type:			Support			
	input type: 	'id', 'unversioned_id', 'display_name', 'source_name'
	returns:		table default with 'source_name' or define return_ref: 'id' or 'unversioned_id' or 'display_name' or 'source_name'
----------------------------------------------------------
]]
function get_source_list( return_ref )
	
	local scenes = obs.obs_frontend_get_scenes()
	local source_list = {}
	local list = {}
	local sub = {}
	--[[
	
	
	]]
    if scenes ~= nil then
		--[[


		]]
        for key_scenesource, value_scenesource in pairs( scenes ) do
			
            local scenename = obs.obs_source_get_name( value_scenesource )
            local scene = obs.obs_scene_from_source( value_scenesource )
            local sceneitems = obs.obs_scene_enum_items( scene )
			--[[


			]]
			local index = 0
            for key_sceneitem, value_sceneitem in pairs( sceneitems ) do
				index = index + 1
				sub = {}
                local source = obs.obs_sceneitem_get_source( value_sceneitem )
				local source_name_parent = obs.obs_source_get_name( source )
				local group = obs.obs_group_from_source( source )
				local id_parent = obs.obs_source_get_id( source )
				local unversioned_id_parent = obs.obs_source_get_unversioned_id( source )
				local display_name_parent = obs.obs_source_get_display_name( id_parent )
				sub['id'] = id_parent
				sub['unversioned_id'] = unversioned_id_parent
				sub['display_name'] = display_name_parent
				sub['source_name'] = source_name_parent
				list[index] = sub
				source_list[source_name_parent] = source_name_parent -- will return this by default if return_ref not defined as the name is a unique id					
				if group ~= nil then
					local groupitems = obs.obs_scene_enum_items( group )	
					if groupitems ~= nil then
						for key_groupitem, value_groupitem in pairs( groupitems ) do
							index = index + 1
							sub = {}
							local groupitemsource = obs.obs_sceneitem_get_source( value_groupitem )
							local source_name_group = obs.obs_source_get_name( groupitemsource )
							local id_group = obs.obs_source_get_id( groupitemsource )
							local unversioned_id_group = obs.obs_source_get_unversioned_id( groupitemsource )
							local display_name_group = obs.obs_source_get_display_name( id_group )
							sub['id'] = id_group
							sub['unversioned_id'] = unversioned_id_group
							sub['display_name'] = display_name_group
							sub['source_name'] = source_name_group
							list[index] = sub
							source_list[source_name_group] = source_name_group -- will return this by default if return_ref not defined as the name is a unique id
						end -- end for
						obs.sceneitem_list_release( groupitems )
					end
				end	
            end -- end for in pairs( sceneitems )
            obs.sceneitem_list_release( sceneitems )
		end -- end for in pairs( scenes )
		--[[


		]]		
        obs.source_list_release( scenes )
    end -- scenes ~= nil
	
	--[[
			is 'return_ref' defined and a valid (existing) reference?
	]]
	local tmp_list = {}
	local found = false
	if return_ref ~= nil then
		for key, value in pairs( list ) do
			if type( list[key] ) == 'table' then
				if tableHasKey( list[key], return_ref ) then
					found = true
					tmp_list[list[key]['source_name']] = list[key][return_ref]
				end 
			end
		end
	end	
	if found then source_list = tmp_list end
	return source_list
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Function to conver OBS data array to table

	obs_data_array_to_table( settings, 'reference' )

	Description:	Grab OBS data array and return in a table
	
	Credit:			midnight-studios

	Modified:		

	function:		data array to table
	type:			Support
	input type: 	Settings, property reference 
	returns:		table
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function obs_data_array_to_table( set, item )
	
	local array = obs.obs_data_get_array( set, item );
	
	local count = obs.obs_data_array_count( array );
	
	local list = {}
	
	for i = 0, count do 
		
		local array_item = obs.obs_data_array_item( array, i );
		
		local value = obs.obs_data_get_string( array_item, 'value' );
		
		list[i] = value
	end	
	
	obs.obs_data_array_release( array )
	
	return list
end	
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	
	Description: Get the name of this script	
	
	Credit:			midnight-studios, et al	

	Modified:		

	function:		regular expression 
	type:			Support
	input type: 	string
	returns:		string
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function filename() 
	local str = debug.getinfo(2).source:sub(2) 
	return str:match('^.*/(.*).lua$') or str 
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	List files
	
	Credit:			midnight-studios

	Modified:		midnight-studios, et al	

	function:		Used to list files with target extension
	type:			directory path, file extension
	input type: 	
	returns:		table
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function get_filenames( path, file_extension )
	local filenames = {}
	local dir = obs.os_opendir( path )
	local entry
	repeat
	  entry = obs.os_readdir( dir )
	  if entry then
		local ext = obs.os_get_path_extension( entry.d_name )
		if ext == file_extension then
			local  filename = string.gsub( entry.d_name, ext, '' )
			table.insert( filenames, filename )
	  	end
	  end
	until not entry
	obs.os_closedir( dir )
	return filenames
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Convert data to json
	
	Credit:			midnight-studios, et al

	Modified:		Yes, custom params to suit targeted need

	function:		
	type:			Support
	input type: 	OBS data (Settings)
	returns:		json file
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function write_to_json( data )
	output_folder = backup_folder
	-- convert Windows path to UNIX path
	local file_name = filename() .. output_file_name:gsub('$date_stamp', os.date('%Y-%m-%d-%H%M'))
	-- set output path as the script path by default
	local script_path = script_path();
	local output_path = script_path .. file_name;
	-- if specified output path exists, then set this as the new output path
	if (output_folder ~= '') then
		output_path = output_folder .. '/' .. file_name
	else
		output_path = script_path .. file_name;
	end
	output_path = output_path:gsub([[\]], '/');
	obs.obs_data_erase( data, 'backup_folder' )
	obs.obs_data_erase( data, 'backup_mode' )
	return obs.obs_data_save_json( data, output_path )
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------

	Description:	Assign a default Frequency based on the Frame Rate	
					video_info.base_width
					video_info.base_height
					video_info.fps_den
					video_info.output_width
					video_info.output_height
					video_info.range
					video_info.colorspace
	
	Credit:			midnight-studios

	Modified:		

	function:		Get obs user defined video frame rate
	type:			Support
	input type: 	none
	returns:		double
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function assign_default_frequency()
	local fps = 60 -- 60 is the maximum supported frame rate
	local video_info = obs.obs_video_info()
    if obs.obs_get_video_info(video_info) then
		fps = video_info.fps_num		
	end
	time_frequency = ( 1/fps )
end	
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	
	Description:	Used this in testing to measure accuracy

					The Text Source and the Log should produce the same value
					The Text source is updated by the time function while the debug 
					uses start and end time stamps to get a value	
	
	Credit:			midnight-studios

	Modified:		

	function:		calculate time difference between two points in time
	type:			Support
	input type: 	none
	returns:		double
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function get_time_lapsed()
	local ns = obs.os_gettime_ns()
	local delta = ( ns/1000000000.0 ) - ( orig_time/1000000000.0 )
	return raw_time( delta )
end	
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	The true frequency between cycles varies due to script
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
	
	Credit:			midnight-studios

	Modified:		

	function:		determine the correct fraction of the split second based on frame rate
	type:			Support
	input type: 	double
	returns:		double
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function get_frequency( previous )
	local ns = obs.os_gettime_ns()
	ns_last = ns
	local f = ( ns/1000000000.0 ) - ( previous/1000000000.0 )
	if f > 1 then f = time_frequency end
	return f	
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	This was developed because some tasks were not completing
	
	Credit:			midnight-studios

	Modified:		

	function:		wait function used to allow other tasks to complete
	type:			
	input type: 	
	returns:		hold and release
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function wait( ms )
	if ms ~= nil then
		local start = math.floor( ( obs.os_gettime_ns()/1000000 ) )
		repeat until ( math.floor( ( obs.os_gettime_ns()/1000000 ) )-start ) >= ms 
	end 
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	'Timer Expires' 	= 1 
					'Caution Time' 		= 2 
					'Warning Time' 		= 3 
					'Timer Visible' 	= 4 
					'Timer Start' 		= 5
	
	
	Credit:			midnight-studios

	Modified:		

	function:		Start obs call obs_frontend_recording_start()
	type:			
	input type: 	reference, milliseconds
	returns:		none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function record( mark, ms )
	if timer_type ~= 2 then return end
	if start_recording == 1 and mark == recording_type then
		obs.obs_frontend_recording_start()
	end
	if ms ~= nil then wait( ms ) end 
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Convert hours:minutes:seconds to Seconds 
	
					When the user defines the Hours, Minutes & Seconds
					we need to convert it to seconds as the timer works
					on the value 'seconds'

					$function status: in service
		
	
	Credit:			midnight-studios

	Modified:		

	function:		convert date, hour, minutes and secods to seconds
	type:			
	input type: 	interger for date, time
	returns:		interger (seconds)
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function delta_time( year, month, day, hour, minute, second )
	local now = os.time()
	if ( year == -1 ) then
		year = os.date( '%Y', now )
	end
	if ( month == -1 ) then
		month = os.date( '%m', now )
	end
	if ( day == -1 ) then
		day = os.date( '%d', now )
	end
	local future = os.time{year=year, month=month, day=day, hour=hour, min=minute, sec=second}
	local seconds = os.difftime( future, now )
	if ( seconds < 0 ) then
		seconds = 0
	end
	return seconds 
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Take the time segments:

					Hours, Minutes, Seconds, Millisieconds

					Configure to standard format:

					HH:MM:SS:FF

					$function status: in service
	
	Credit:			midnight-studios

	Modified:		

	function:		Dependency / Support 
	type:			
	input type: 	4 variables - 'HH' 'MM' 'SS' 'FF'
	returns:		time stamp 00:00:00,00 (HH:MM:SS,FF)
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function config_time( hour, minutes, seconds, mili )
	local format_hour, 
	format_minutes, 
	format_seconds, 
	format_mili = 
	( hour and '%02d' or '' ),
	( minutes and ':%02d' or '' ),
	( seconds and ':%02d' or '' ),
	( mili and ',%02d' or '' ) 
	local time = string.format( format_hour..format_minutes..format_seconds..format_mili, hour, minutes, seconds, mili )
	--[[
		
		configure for SHOW or Hide millisonds
	
	]]
	if not show_mili then
		time = string.format( format_hour..format_minutes..format_seconds, hour, minutes, seconds )
	end
	return time
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Convert Seconds to hours:minutes:seconds:miliseconds
	
					$function status: in service	
	
	Credit:			

	Modified:		

	function:		
	type:			
	input type: 	Double (Seconds / Split Seconds)
	returns:		time stamp 00:00:00,00 (HH:MM:SS,FF)
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function raw_time( time, simplify )
	local hour, minutes, seconds, mili = 0, 0, 0, 0
	--[[
		If there is more than 24 hours in the time value
		we need to remove the additional time value to leave only a 23:59:59
		value. We will do this by calculating days
	]]
	-- If there is more than 24 hours, remove 23:59:59 as it will be in the clock 
	if time > 86399 then -- 23:59:59
		local c_time = ( math.floor( ( time ) / 86400 ) * 86400 )
		time = time - c_time
	end
	hour = math.floor( time/3600 )
	if hour < 10 and trim then
		hour = '0'..hour
	end
	minutes = math.floor( ( time - math.floor( time/3600 )*3600 )/60 )
	if minutes < 10 and trim then
		minutes = '0'..minutes
	end
	seconds =  math.floor( time - math.floor( time/3600 )*3600 - math.floor( ( time - math.floor( time/3600 )*3600 )/60 )*60 )
	if seconds < 10 and trim then
		seconds = '0'..seconds
	end
	mili = math.floor( ( time - math.floor( time/3600 )*3600 - math.floor( ( time - math.floor( time/3600 )*3600 )/60 )*60 - math.floor( time - math.floor( time/3600 )*3600 - math.floor( ( time - math.floor( time/3600 )*3600 )/60 )*60 ) )*100 )
	if mili < 10 and trim then
		mili = '0'..mili
	end
	--[[
		
		Use this to see if time stamp matches certain criteria
		This looks at HH:MM:SS only and is used to trigger stuff
		
	]]	
	if simplify then
		return config_time( hour, minutes, seconds,  nil )
	end
	
	return config_time( hour, minutes, seconds,  mili )
end	

--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Take the raw time format 'HH:MM:SS:FF' and allow the user to
					define a custom format.

					$function status: in service	
	
	Credit:			

	Modified:		midnight-studios

	function:		The timestamp is what we put in, the format is what we want this little princess to be transformed into
	type:			
	input type: 	00:00:00,00
	returns:		Whatever the format incleded: $T $D $H $M $S $F and anything inbetween
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function format_time( timestamp, format )
	--[[
			table 1, break time stamp in pieces by character reference ':' 
			input: DD:HH:MM:SS,FF
			result: [DD], [HH], [MM], [SS,FF]
	
	]]
	local table1 = explode( timestamp, ':' ) -- reference ':' 4 parts
	
	if table1 == nil then return timestamp end -- have result or return input
	
	local c = tablelength( table1 ) -- measure table parts (there should be 4: [DD], [HH], [MM], [SS,FF])
	--[[
		This does something fancy that is needed
	]]
	local _, d = timestamp:gsub(':','')
	local _, t = format:gsub('$T','')
	
	local day, hour, minute, seconds, mili = 0, 0, 0, 0, 0 -- start some blank variables that we will need
	
	if d == 3 then -- it should be 3 parts by default if the user uses a standard timestamp
		if tableHasKey( table1, 1 ) then -- day
			day = table1[1]
		end
		if tableHasKey( table1, 2 ) then -- hour
			hour = table1[2]
		end
		if tableHasKey( table1, 3 ) then -- minute
			minute = table1[3]
		end
		if tableHasKey( table1, 4 ) then -- seconds
			seconds = table1[4]
			local table2 = explode( table1[4], ',' )
			if tableHasKey( table2, 1 ) and tableHasKey( table2, 2 ) then -- milliseconds
				seconds = table2[1]
				mili = table2[2]
			end	
		end
	end
	if d == 2 then -- okay, the user is doing something fancy now and requested a non-standard timestamp
		if tableHasKey( table1, 1 ) then -- hour
			hour = table1[1]
		end
		if tableHasKey( table1, 2 ) then -- minute
			minute = table1[2]
		end
		if tableHasKey( table1, 3 ) then -- seconds
			seconds = table1[3]
			local table2 = explode( table1[3], ',' )
			if tableHasKey( table2, 1 ) and tableHasKey( table2, 2 ) then -- milliseconds
				seconds = table2[1]
				mili = table2[2]
			end	
		end
	end
	if d == 1 then -- okay, the user is doing something fancy now and requested a non-standard timestamp
		if tableHasKey( table1, 1 ) then -- minute
			minute = table1[1]
		end
		if tableHasKey( table1, 2 ) then -- seconds
			seconds = table1[2]
			local table2 = explode( table1[2], ',' )
			if tableHasKey( table2, 1 ) and tableHasKey( table2, 2 ) then -- milliseconds
				seconds = table2[1]
				mili = table2[2]
			end	
		end
	end
	if tonumber(day) < 10 then 
		day = '0'..day
	end
	--[[
		Athis stage we have some groups to work with:
		
		TRIM: identified by $T, if this is found it will remove, trim or otherwise zap all zeros
		DD: identified by (will replace) $D
		HH: identified by (will replace) $H
		MM: identified by (will replace) $M
		SS: identified by (will replace) $S
		FF: identified by (will replace) $F
	]]	
	timestamp = format:gsub('$T', ''):gsub('$D', day):gsub( '$H', hour):gsub('$M', minute):gsub('$S', seconds):gsub('$F', mili)
	
	if t ~= 0 and cur_seconds > 0.01 then
		--local reg = '^[0]+[:]?[0]+[:]?[0]+[:]?[0]?'
		local reg = '^[0:,]*' -- close, but misses 1 instance
		timestamp = timestamp:gsub(reg,'')
	end	
	if cur_seconds < 0.01 and timer_display == 1 then
		if timer_format ~= 1 then timestamp = '0' end -- the user wants the timer to end with a reminder that it is Game Over
	end	
	if cur_seconds < 0.01 and timer_display == 2 then -- else it will show 00:00:00
		timestamp = '' -- the user wants the timer to disapear
	end	
	return timestamp
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	
	
	Credit:			

	Modified:		

	function:		
	type:			
	input type: 	
	returns:
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function long_time( time )
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
----------------------------------------------------------------------------------------------------------------------------------------
	

	Description:	Callback on properties modification
	
					Show/Hide a field in the properties based on a 
					some criteria. In this case, show or hide the field 
					'Toggle Milliseconds' only when required.	
	
	Credit:			

	Modified:		Asking if miliseconds property must be shown or hidden and this is for back end UI

	function:		yer, no
	type:			Support, UI
	input type: 	properties, settings
	returns:		bool
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function show_split( props, settings )
	local config_value = obs.obs_data_get_int( settings, 'config' )
	local mode = obs.obs_data_get_int( settings, 'timer_type' )
	local shw = false
	shw = ( config_value == 2 and mode == 2 and in_table( {1, 2}, timer_format ) )
	if ( timer_format == 5 and config_value == 2 and mode == 2 ) then
		if ( string.find( custom_time_format, '$F' ) ~= nil ) then
			shw = true
		else
			shw = false
		end
	end
	return shw
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Function to set the source text
	
	Credit:			et al

	Modified:		

	function:		Update Text Source
	type:			Support, Render
	input type: 	target source by name, contents to be added to text contents
	returns:		nothing
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function set_text( source_name, text )
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
		obs.obs_data_set_string( settings, 'text', text )	
	end
		obs.obs_source_update( source, settings )
		obs.obs_data_release( settings )
		obs.obs_source_release( source )
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Change color of font for text source	
	
	Credit:			et al		

	Modified:		

	function:		Update Text Source		
	type:			Support, Render			
	input type: 	
	returns:		none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function set_text_note_color( ref )
	if media['note_source_' .. ref] == 'Select' then return end
	local source = obs.obs_get_source_by_name( media['note_source_' .. ref] )
	if source ~= nil then
		local settings = obs.obs_source_get_settings( source )
			obs.obs_data_set_string( settings, 'text', media['note_'.. ref] )
			obs.obs_data_set_int( settings, 'color', media['color_'.. ref] )
	end
	obs.obs_source_update( source, settings )
	obs.obs_data_release( settings )
	obs.obs_source_release( source )
end	
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	set source visibility	
	
	Credit:			midnight-studios, et al		

	Modified:		

	function:		Update Text Source		
	type:			Support, Render			
	input type: 	
	returns:		bool 
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function set_visible( target_name, visible )
	
	if visible == nil then visible = true end
	local action_completed = false
	if in_table( {'','None', 'Select','none', 'select'}, target_name ) then return action_completed; end
	local scenes = obs.obs_frontend_get_scenes()
	if scenes ~= nil then
		for i, scn in ipairs( scenes ) do	
			local scene = obs.obs_scene_from_source( scn )
			local sceneitem = obs.obs_scene_find_source_recursive( scene, target_name )
			if sceneitem ~= nil then
				if visible and not obs.obs_sceneitem_visible( sceneitem ) then -- only set visible if not visible
					obs.obs_sceneitem_set_visible( sceneitem, visible )
				end	
				if not visible and obs.obs_sceneitem_visible( sceneitem ) then -- only set visible if visible
					obs.obs_sceneitem_set_visible( sceneitem, visible )
				end	
				action_completed = true
				break	
			end	
		end --end for
		obs.bfree( scn )
		obs.source_list_release( scenes )		
	end
	return action_completed
end

--[[
----------------------------------------------------------
	Description:	check source visibility	
	
	Credit:			

	Modified:		

	function:		
	type:			
	input type: 	
	returns:
----------------------------------------------------------
]]
local function is_visible( target_name )
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
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	
	
	Credit:			

	Modified:		

	function:		
	type:			
	input type: 	
	returns:
----------------------------------------------------------------------------------------------------------------------------------------
]]	
local function caution_media_end_callback( )
	set_visible( media['source_name_audio_caution'], false )
	set_visible( media['source_name_audio_warning'], false )	
	obs.remove_current_callback()
end		
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	
	
	Credit:			

	Modified:		

	function:		
	type:			
	input type: 	
	returns:
----------------------------------------------------------------------------------------------------------------------------------------
]]	
local function warning_media_end_callback( )
	set_visible( media['source_name_audio_warning'], false )	
	obs.remove_current_callback()
end	
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	
	
	Credit:			

	Modified:		

	function:		
	type:			
	input type: 	
	returns:
----------------------------------------------------------------------------------------------------------------------------------------
]]	
local function signal_media_ended( cd )
	--[[
	
		Get source from CallData
	
	]]
	local source = obs.calldata_source( cd, 'source' )
	--[[
	
		Found Source?
	
	]]
	if source ~= nil then 
		local name = obs.obs_source_get_name( source )
		--[[

			Set Source Visibility to Hidden

		]]
		set_visible( name, false )
		obs.remove_current_callback()
	end	
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	
	
	Credit:			OBS, Source Signals, https://obsproject.com/docs/reference-sources.html?highlight=media_ended

	Modified:		

	function:		
	type:			Support
	input type: 	ref
	returns:		signal_media_ended
----------------------------------------------------------------------------------------------------------------------------------------
]]	
local function disconnect_after_media_end( ref )

	local source_name = media['source_name_audio_'.. ref] 
	local source = obs.obs_get_source_by_name( source_name ) -- Increments the source reference counter, use obs_source_release() to release it when complete.  	--[[
	--[[
	
		Found Source?
	
	]]
	if source ~= nil then   		
		--[[
		Create a signal handler for the source
		]]
		local sh = obs.obs_source_get_signal_handler( source )	
		--[[
			https://obsproject.com/docs/reference-sources.html?highlight=media_started
			attach event listener callback [source_signal]: Called when media has ended.
		]]	
		obs.signal_handler_connect( sh, 'media_ended', signal_media_ended )		

	end
	obs.obs_source_release( source )
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	
	
	Credit:			

	Modified:		

	function:		
	type:			
	input type: 	
	returns:
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function start_media_action( source_name, ref )
	
	
	if in_table( {'','None', 'Select','none', 'select'}, source_name ) then return end
	
	if not media['activated_'.. ref] then 
		media['cur_seconds_'.. ref] = math.ceil(cur_seconds)
		set_visible( source_name, true );
		
		--[[
		
			connect signal handler to ensure we reset the source if the media ended.
		
		]]
		disconnect_after_media_end( ref )
		media['activated_'.. ref] = true 
		
		--[[
		
			This is a fallback method to end triggered media, however this method will remove the media
			even if the timer is paused.
		
			This event is handled by stop_media_action( ref )
		
		]]	
		if media_playback_limit == 2 then
			if ref == 'caution' then
				-- do not uncomment, see stop_media_action( ref )
				--obs.timer_add( caution_media_end_callback, math.floor( media['duration_'.. ref] * 1000 ) ) --<- milliseconds
			end
			if ref == 'warning' then
				-- do not uncomment, see stop_media_action( ref )
				--obs.timer_add( warning_media_end_callback, math.floor( media['duration_'.. ref] * 1000 ) ) --<- milliseconds
			end	
		end		
	end
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	
	
	Credit:			

	Modified:		

	function:		
	type:			
	input type: 	
	returns:
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function start_media( source_name, ref )
start_media_action( source_name, ref )
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	
	
	Credit:			

	Modified:		

	function:		
	type:			
	input type: 	
	returns:
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function media_activate( settings, ref )
	--[[
	 		if the user's time stamp is for example 00:00:05
			the trigger will happen at for example 00:00:05,99
			thus it will be inaccurate by roughly 0,9 seconds
			math.ceil(cur_seconds) will round positively to 
			give an accurate trigger
	]]
	if raw_time( math.ceil( cur_seconds ), true ) == media['text_'.. ref] then
		if trigger_text ~= 1 and ref == 'caution' then 
			set_visible( media['note_source_' .. ref], true ) 
			set_visible( media['note_source_warning'], false )
			set_text_note_color( ref ) 
		end		
		if trigger_text ~= 1 and ref == 'warning' then 
			set_visible( media['note_source_' .. ref], true ) 
			set_visible( media['note_source_caution'], false ) 
			set_text_note_color( ref ) 
		end			
		obs.obs_data_set_int( settings, 'color', media['color_'.. ref] )
		start_media( media['source_name_audio_'.. ref], ref )
		if ref == 'caution' then record( 2 ) end 
		if ref == 'warning' then record( 3 ) end 
	end		
	return settings
end

--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	
	
	Credit:			

	Modified:		

	function:		
	type:			
	input type: 	
	returns:
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function get_source_looping( source_name )
	local property = 'looping'
	--[[
		Increments the source reference counter, 
		use obs_source_release() to release it when complete.
		
		we got a source name, let's see if it exist...
	]]	
	local source = obs.obs_get_source_by_name( source_name )	
	local enabled = false 
    if source ~= nil then
		local source_id = obs.obs_source_get_unversioned_id( source )
			if source_id == 'ffmpeg_source' then
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
----------------------------------------------------------------------------------------------------------------------------------------
	
	Description:	Check if the source state changed, 
					if so, set source visble = false
	
	Credit:			

	Modified:		

	function:		
	type:			
	input type: 	
	returns:
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function stop_media_action( ref )
	
	local source_name = media['source_name_audio_'.. ref]
	
	if in_table( {nil, '','None', 'Select','none', 'select'}, source_name ) and not media['media_ended_'.. ref]	then return end
	--[[
		Increments the source reference counter, 
		use obs_source_release() to release it when complete.
		
		we got a source name, let's see if it exist...
	]]
	if media['duration_'.. ref] ~= 0 and media_playback_limit ~= 1 then
		local source = obs.obs_get_source_by_name( source_name )

		if source ~= nil then -- source is valid

			local state = obs.obs_source_media_get_state( source ) -- get the current state for the source

			if media['last_state_'.. ref] ~= state then -- The state has changed
				if state == obs.OBS_MEDIA_STATE_PLAYING  then
						--[[

						]]
						local media_time_started = math.ceil( media['cur_seconds_'.. ref] )
						local media_time_limit = math.floor( media['duration_'.. ref] )
						local time_remaining = math.ceil( cur_seconds ) -- 
						local media_time_remaining = media_time_started - media_time_limit 
						local time_end = ( media_time_remaining == time_remaining )
						if time_end then
							media['last_state_'.. ref] = state
							media['media_ended_'.. ref] = true
							set_visible( source_name, false )
						end
				end			
			end	 
		end 	
	end
    obs.obs_source_release( source )	
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	
	Description:	Stop Media is designed to reset the Source to the
					starting state. In other words, make the source
					invisible again. This sould only happen if the media
					ended, or if it is looped, end the media after a
					defined time.
	
	Credit:			

	Modified:		

	function:		
	type:			
	input type: 	
	returns:
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function stop_media( ref, bypass )
	if bypass == nil then bypass = false end
	if bypass then -- No checks, just stop it
		set_visible( media['source_name_audio_'.. ref], false )
	else -- do some checks
		stop_media_action( ref )	
	end	
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Function to cycle through a list for sources or scenes
	
	Credit:			

	Modified:		

	function:		
	type:			
	input type: 	
	returns:
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function cycle_list_activate( source_type )
	--[[
	
		Create a table for a list
	
	]]	
	local i = 0
	local list = {}
	local item_list =  {}
	local data_list = obs_data_array_to_table( script_settings, 'cycle_list' )
	local direction = 1
	--[[
	
	]]	
	if source_type ~= 'source' then -- List Scenes names
		direction = 1 -- Descend Ascend change direction to 1 or 2
		local scenes = obs.obs_frontend_get_scene_names()
		if scenes ~= nil then
			for i, scene in ipairs( scenes ) do
				item_list[scene] = scene
			end
			obs.bfree( scene )
		end
	else -- List Source names
		direction = 1 -- Descend Ascend change direction to 1 or 2
		local sources = get_source_list() -- 'id' or 'unversioned_id' or 'display_name' or 'source_name'
		--sources = remove_duplicates( sources )
		for key, value in pairsByKeys( sources ) do
			item_list[value] = value
		end
	end
	--[[
	
		Build a cycle list
	
	]]		
	for key, value in pairs( data_list ) do
		if in_table( item_list, value ) then
			i = i + 1
			list[i] = value
		end
	end	
	
	local count = tablelength( list );
	
	if cycle_index > count then
		cycle_index = 1
	end	
	
	local index = 0

	if cycle_direction ~= direction then
		index = 1
	else
		index = count
	end	
	
	for i = 1, count do 
		local index_match = (index == cycle_index)
		
		--[[
			The list contains all available sources.
			The value targets the sources requested.
			Check if the requested source is available
		]]
		if list[i] ~= nil then
			--[[
				
				Type is 'Scene'
					
			]]
			if source_type ~= 'source' then --
				if index_match then
					local scene_source = obs.obs_frontend_get_current_scene()
					local name = obs.obs_source_get_name( scene_source )
					obs.obs_source_release( scene_source )
					local source = obs.obs_get_source_by_name( list[i] )
					if source ~= nil then
						obs.obs_frontend_set_current_scene( source )
					end
					obs.obs_source_release( source )
				end
			--[[
				
				Type is 'Source'
					
			]]	
			else
				set_visible( list[i], index_match )
			end
			if index_match then 
				--[[
					force the visibility 
					state of this source. 
				]]			
				if active_source_force_visible then set_visible( active_source, true ) end
				set_text( active_source, list[i] ) 
			
			end
		end	
		if cycle_direction ~= direction then
			index = index + 1
		else
			index = index - 1
		end	
	end
	cycle_index = cycle_index + 1		
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	This is basically obs.obs_enum_sources()
					but 'Nested Scenes' are not listed in 'obs.obs_enum_sources()'
	
	
	Credit:			

	Modified:		

	function:		
	type:			
	input type: 	
	returns:
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function scene_name_has_source_name( scene_name, source_name )
			scene_source = obs.obs_get_source_by_name( scene_name )
            local scenename = obs.obs_source_get_name( scene_source )
            local scene = obs.obs_scene_from_source( scene_source )
            local sceneitems = obs.obs_scene_enum_items( scene )
			local result = false
            for key_sceneitem, value_sceneitem in pairs( sceneitems ) do
                local source = obs.obs_sceneitem_get_source( value_sceneitem )
				local source_name_parent = obs.obs_source_get_name( source )
				local group = obs.obs_group_from_source( source )
				if source_name_parent == source_name then
					result = true
					break
				end				
				if group ~= nil then
					local groupitems = obs.obs_scene_enum_items( group )	
					if groupitems ~= nil then
						for key_groupitem, value_groupitem in pairs( groupitems ) do
							local groupitemsource = obs.obs_sceneitem_get_source( value_groupitem )
							local source_name_group = obs.obs_source_get_name( groupitemsource )
					
							if source_name_group == source_name then
								result = true
								break
							end
						end -- end for
						obs.sceneitem_list_release( groupitems )
					end
				end	
            end -- end for in pairs( sceneitems )
            obs.sceneitem_list_release( sceneitems )
		obs.obs_source_release( scene_source )
	return result
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Called when a scene is activated/deactivated	
	
	Credit:			

	Modified:		

	function:		make a source visible
	type:			Dependency / Support 
	input type: 	source, bool, start_on_scene_active (global), scene_name_has_source_name() 
	returns:		none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function activate_timer_on_scene( source, activating )
			--[[ 
				Reset to starting point
				if, start_on_scene_active then set to visible
		]] 
		if start_on_scene_active and activating then
			local source_id = obs.obs_source_get_id( source )
			local current_scene_source = obs.obs_frontend_get_current_scene()
			local current_scene_name = obs.obs_source_get_name( current_scene_source )
			obs.obs_source_release( current_scene_source )	
			if source_id == 'scene' then
				if scene_name_has_source_name( current_scene_name, timer_source ) then			
					if not is_visible( timer_source ) then 
						set_visible( timer_source, true )
					end
				end	
			end
		end
	
end	
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Update Properties
	
	Credit:			

	Modified:		

	function:		
	type:			
	input type: 	
	returns:
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function update_prop_settings_cur_seconds( value )
	--[[
		When this is updated it will trigger a 
		callback 'property_onchange', let's 
		disable that for a moment.
	]]
	prevent_callback = true
	obs.obs_data_set_double( script_settings, 'sw_cur_seconds', value )
	sw_cur_seconds = value
	obs.obs_properties_apply_settings( props, script_settings )
	--[[
		When this is updated it will trigger a 
		callback 'property_onchange', let's 
		enable it again
	]]
	prevent_callback = false
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Everytime the timer value is updated, 
					it will happen here
	
	Credit:			

	Modified:		

	function:		update the timer value
	type:			Dependency / Support 
	input type: 	double
	returns:		cur_seconds
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function timer_value( value, update_settings )
	
	if update_settings == nil then
		update_settings = false
	end	
	
	cur_seconds = value
	
	if update_settings then 
		update_prop_settings_cur_seconds( cur_seconds ) 
	end
	
	return cur_seconds
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Assign the correct frequency value to the timer incriment 
	
	Credit:			

	Modified:		

	function:	update the timer value
	type:			Dependency / Support			
	input type: 	
	returns:	calls timer_value()
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function calculate( update_settings )
	if timer_type ~= 2 then
		timer_value( cur_seconds + time_frequency, update_settings ) -- value, update_settings 
	else
		timer_value( cur_seconds - time_frequency, update_settings ) -- value, update_settings 
	end
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Function to set the defined time text source value 
	
	Credit:			

	Modified:		

	function:		
	type:			
	input type: 	
	returns:
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function set_time_text( source_name )
	--[[
		First Check we have a source reference
	]]
	if source_name == nil then return end
	--[[
		Force absolute zero at this point
	]]
	if cur_seconds <= 0.01 and timer_type ~= 1 then 
		timer_value( 0, false )   -- value, update_settings 
	end
	
	local l_time = long_time( cur_seconds )
	local t_time = raw_time( cur_seconds )
	--[[
		Timer Format Type: Full Format
	]]
	local text = tostring( raw_time( cur_seconds ) )
	--[[
		Timer Format Type: Remove Leading Zeros
	]]
	if timer_format == 2 then
		local system_time_format = '$T$H:$M:$S,$F'
		text = format_time( ( l_time ~= 0 ) and string.format('%s:%s', l_time, t_time ) or string.format('%s', t_time ), system_time_format )
	end	
	--[[
		Timer Format Type: No Leading Zeros, No Split Seconds
	]]
	if timer_format == 3 then
		local system_time_format = '$T$H:$M:$S'
		text = format_time( ( l_time ~= 0 ) and string.format('%s:%s', l_time, t_time ) or string.format('%s', t_time ), system_time_format )
	end
	--[[
		Timer Format Type: No Leading Zeros, No Split Seconds
	]]
	if timer_format == 4 then
		local system_time_format = '$H:$M:$S'
		text = format_time( ( l_time ~= 0 ) and string.format('%s:%s', l_time, t_time ) or string.format('%s', t_time ), system_time_format )
	end
	
	if timer_format ~= 5 then
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
			text = string.gsub(longtimetext .. text, '[#]', long_time( cur_seconds ))
		end		
	end
	--[[
		Timer Format Type: Custom Time Format
	]]
	if timer_format == 5 then
		text = format_time( ( l_time ~= 0 ) and string.format('%s:%s', l_time, t_time ) or string.format('%s', t_time ), custom_time_format )
	end	

	if timer_type ~= 2 then
		--text_prefix = ''
		--   text_suffix = ''
	end
	text = text_prefix .. text .. text_suffix	
	if text ~= last_text then
		--[[
			Increments the source reference counter, 
			use obs_source_release() to release it when complete.
		]]		
		local source = obs.obs_get_source_by_name( source_name )
		if source ~= nil then
			local settings = obs.obs_source_get_settings( source )
			obs.obs_data_set_string( settings, 'text', text )
			if not media['activated_caution'] and not media['activated_warning'] then
				obs.obs_data_set_int( settings, 'color', media['normal_color'] )
			end		
			media_activate( settings, 'caution' )
			media_activate( settings, 'warning' )
		end
		obs.obs_source_update( source, settings )
		obs.obs_data_release( settings )
		obs.obs_source_release( source )
	end
	
	--[[
		
		Check is media is playing and stop if required
	
	]]
	stop_media( 'caution' )
	stop_media( 'warning' )
	last_text = text
	--[[
		Timer Ended
	]]--
	if cur_seconds <= 0.01 and timer_type ~= 1 then
		--[[
		
			Timer is shutting down, this would be a 
			good time to reset some items.
		
		]]--
		if trigger_text ~= 1 then 
			set_visible( media['note_source_caution'], false )
			set_visible( media['note_source_warning'], false )  
		end		
		
		--[[
		
			Timer was started and now has EXPIRED
			execute any final instructions that 
			the user require on TIMER END 
		
		]]--
		if timer_active then timer_ended( source_name ) end
		--[[
		
			Now remove the timer callback
		
			'timer_ended()' offer options to
			restart the timer and may define
			a value to 'cur_seconds'. 
		
			Final check, if cur_seconds == 0 then
			deactivate (end/remove) the timer callback
		
			This is a fallback but should not be needed
			as the timer callback may be removed by 
			timer_ended() if neded
		]]--
		if cur_seconds == 0 then timer_expired = true; end
	end	
	--return true
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Decide if cur_seconds needs to reset to def_seconds
	
	Credit:			

	Modified:		

	function:		Check if cur_seconds needs to reset to def_seconds
	type:			check
	input type: 	next_scene
	returns:		bool
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function update_default_time()
	
	if next_scene == 'Source List' or next_scene == 'Scene List' then
		return true
	end	
	
	return false
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
Description:		Called if the counter is starting fresh				
					def_seconds is used for source cycling

					def_seconds: Default Seconds

					the default timer state

					This is the state of the timer that will set or
					reset the time ( cur_seconds ) 

					If the timer expires because cur_seconds == 0, 
					then the time ( cur_seconds ) will be be restarted
					from def_seconds for another function such as source cycling.

					Every instance that a timer time is defined, we must record it to def_seconds
	
	Credit:			

	Modified:		

	function:		
	type:			
	input type: 	
	returns:
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function timer_reset( reset_curent, current_settings )

	if reset_curent == nil then reset_curent = false end -- incase not defined, set default
	if current_settings == nil then current_settings = script_settings	end -- incase not defined, set default
	
	--[[
		COUNTDOWN
	]]
	if timer_type == 2 then
		
		--[[
			Countdown and a specific date.
			The specific date will be converted
			to seconds.
		]]
		local calculated_time = 0
		
		if countdown_type == 1 then
			calculated_time = ( delta_time( timer_year, timer_month, timer_day, timer_hours, timer_minutes, timer_seconds ) )
			timer_value( calculated_time, false )
		else
			calculated_time = (  
			( obs.obs_data_get_int( current_settings, 'hours' )*60*60 ) + 
			( obs.obs_data_get_int( current_settings, 'minutes' )*60 ) + 
			obs.obs_data_get_int( current_settings, 'seconds' )
				)	
		end
		
		timer_value( calculated_time, false )
		

		--[[
				Used for countdown only
				NB: This must always be called 
				last in this routine so that 
				cur_seconds can be updated first

				Used for source cycling

				def_seconds: Default Seconds

				the default timer state

				This is the state of the timer that will set or
				reset the time ( cur_seconds ) 

				If the timer expires because cur_seconds == 0, 
				then the time ( cur_seconds ) will be be restarted
				from def_seconds for another function such as source cycling.

				Every instance that a timer time is defined, we must record it to def_seconds
				In this instance a Setting may be updated, so update def_seconds
		]]		
		def_seconds = cur_seconds
		

		if reset_curent and update_default_time() then
			--[[
				Used for source cycling
			
				def_seconds: Default Seconds
		
				the default timer state
		
				This is the state of the timer that will set or
				reset the time ( cur_seconds ) 
		
				If the timer expires because cur_seconds == 0, 
				then the time ( cur_seconds ) will be be restarted
				from def_seconds for another function such as source cycling.
		
				Every instance that a timer time is defined, we must record it to def_seconds
			
				THIS WILL UPDATE cur_seconds to the value cur_seconds
			]]
			timer_value( def_seconds, false ) -- value, update_settings 
		end		
		
	end	
	--[[
	
		STOPWATCH
	
		Stopwatch must always be reset to zero
		unless if the time is loaded from a previous session
	]]
	if timer_type == 1 then
		 --[[
			Timer expired: Yes, reset, no continue
		]]
		if timer_expired then
			--[[
				Timer expired: Yes, reset, no continue
			]]
			if load_saved_time then
				timer_value( sw_cur_seconds, false ) -- value, update_settings
				update_prop_settings_cur_seconds( 0 ) -- timer time loaded from saved time, set saved time to zero
			else
				 --[[
					The timer expired, it must now be reset to zero.
				]]
				timer_value( 0, false ) -- value, update_settings
			end	
		end	
	end	
	--[[
		if reset_curent == true
		and timer_type == 2	(Countdown)
	]]	
	if reset_curent then
		--[[
			Used for source cycling

			def_seconds: Default Seconds

			the default timer state

			This is the state of the timer that will set or
			reset the time ( cur_seconds ) 

			If the timer expires because cur_seconds == 0, 
			then the time ( cur_seconds ) will be be restarted
			from def_seconds for another function such as source cycling.

			Every instance that a timer time is defined, we must record it to def_seconds

			THIS WILL UPDATE cur_seconds to the value cur_seconds
		]]
		--if reset_curent and timer_type == 2 and update_default_time() then
		--timer_value( def_seconds, false )	 -- value, update_settings 
		--end	
		timer_expired = true
		completed_cycles = 0
		split = 0
		split_itm = {}
		split_data = nil
		cur_seconds = 0 
		sw_cur_seconds = 0
	end
	
	orig_time = obs.os_gettime_ns()
	set_visible( media['note_source_caution'], false )
	set_visible( media['note_source_warning'], false ) 
	mili_toggle_triggered = false
	media['activated_caution'] 		= false
	media['activated_warning'] 		= false
	media['last_state_caution']		= obs.OBS_MEDIA_STATE_NONE
	media['last_state_warning']		= obs.OBS_MEDIA_STATE_NONE		
	--[[
		
		At this stage the timer display may need to be updated
	
	]]
	set_time_text( timer_source )
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	
	Description:	Add timer here so we have a global setting
	
	Credit:			

	Modified:		

	function:		
	type:			
	input type: 	
	returns:
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function timer_callback()
	time_frequency = get_frequency( ns_last )
	calculate( false )
	completed_cycles = completed_cycles + 1
	set_time_text( timer_source )
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Add timer here so we have a global setting
	
	Credit:			

	Modified:		

	function:		
	type:			
	input type: 	
	returns:
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function start_timer()
	record( 5, 100 ) -- wait 100 miliseconds
	timer_active = true
	timer_reset( false )
	obs.timer_add( timer_callback, timer_cycle ) --<- milliseconds 
end	
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	
	
	Credit:			

	Modified:		

	function:		
	type:			
	input type: 	
	returns:
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function activate( activating )
	--[[
	
		We skip/cancel anything requested if the 
		Script was disabled by the user.
	
	]]
	if disable_script then
		return		
	end

	--[[
	
		Pass the activating state to a globle
		variable, as this wil be used in other
		instances.
	
	]]
	activated = activating
	--[[
	
		activating will be TRUE or FALSE
		if TRUE create a TIMER (Callback) 
	
	]]
	if activating then
		--[[
			if timer is activating, it has not expired
		]]
		timer_expired = false

		start_timer() -- Timer now initiated
		--[[
			
			STOP TIMER REQUIRED
		
		]]
	else
		--[[
			
			Timer ENDED (EXPIRED) or
			PAUSED 
		
		]]	
		if timer_expired and timer_active then
			obs.timer_remove( timer_callback ) -- Removing the callback stops the timer
			set_visible( media['source_name_audio_caution'], false ) -- The timer expired, reset media.
			set_visible( media['source_name_audio_warning'], false ) -- The timer expired, reset media.
		else
			obs.timer_remove( timer_callback ) -- Removing the callback stops the timer	
		end
		--[[
		
		]]
		timer_active = false
	end
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Take the values from the properties and assign it to the timer
	
	Credit:			

	Modified:		

	function:		Used to mannually set stopwatch
	type:			Dependency / Support 	
	input type: 	none
	returns:		calls set_time_text()
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function set_stopwatch()
	time_frequency = get_frequency( ns_last )
	local hh = ( sw_hours_saved * 3600 )
	local mm = ( sw_minutes_saved * 60 )
	local ss = ( sw_seconds_saved )
	local ff = ( sw_milliseconds_saved / ( 99 + time_frequency ) )
	local time = ( hh + mm + ss + ff ) 
	timer_value( time, false )
	set_time_text( timer_source )
end	
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	This captures the split times and unpack it in the
					correct format.

					The text source only permits linebreaks ( '\n' ) this 
					limitation affects how the data can be formated  ):
	
	Credit:			

	Modified:		

	function:		split time
	type:			Dependency / Support 
	input type: 	globals
	returns:		updates global split_data
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function split_unpack()
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
			text = tostring( raw_time( interval ) )
		elseif split_type == 'Mark' then
			title = 'Mark'
			--subtitle = ''
			text = tostring( raw_time( mark ) )
		elseif split_type == 'Mark Interval' then
			title = 'Mark                     '
			subtitle = 'Interval'
			text = tostring( raw_time( mark )..'          '..raw_time( interval ) )
		else	--	'Interval Mark'
			title = 'Interval                  '
			subtitle = 'Mark'
		text = tostring( raw_time( interval )..'          '..raw_time( mark ) )
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
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	A leap year comes once in four years, 
					in which February month has 29 days. 
					With this additional day in February, 
					a year becomes a Leap year. 

					on every year that is evenly divisible by 4
					except every year that is evenly divisible by 100
					unless the year is also evenly divisible by 400
	
	Credit:			et al

	Modified:		

	function:		A leap year is a year with 366 days instead of 365
	type:			Dependency / Support, UI		
	input type: 	integer
	returns:		bool
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function is_leap_year( year )
	if year % 4 == 0 then -- A leap year comes once in four years
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
	--return year%4==0 and (year%100~=0 or year%400==0) -- shorthand
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Function to toggle milliseconds
	
	Credit:			

	Modified:		

	function:		mili_toggle
	type:			
	input type: 	globals toggle_mili_trigger, timer_type, mili_toggle_triggered, raw_time()
	returns:		none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function toggle_mili()
	--[[
		
		This feature will only activate if 'Trigger Value' is defined
		and if 'Trigger Value' matches 'Current Time' and if
		'Timer Type' is 'Countdown'
	
	]]
	if toggle_mili_trigger ~= '' and timer_type == 2 and not mili_toggle_triggered then
		local time_offset = 1 -- offset by 1 second to allow user to achieve accurate setting
		if raw_time( ( cur_seconds + time_offset ), true ) == toggle_mili_trigger then
			--[[

				The action trigger a toggle, so if the
				active state at the time of the trigger
				is 'Show' the toggle will 'Hide' and
				Vicas Versa. 

				Should we force a state? 
				To force define: show_mili = false

			]]
			mili_toggle( true )
			mili_toggle_triggered = true
		end
	end	
	--return true
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	
	
	Credit:			

	Modified:		

	function:		
	type:			
	input type: 	toggle_mili_trigger, set_time_text, timer_type
	returns:		show_mili (bool)
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function reset_mili()
	if timer_type ~= 2 then
		return true
	end	
	--[[
		
		Is the 'Trigger Value' defined
		and is 'Timer Type' set to 'Countdown'
	
	]]
	if toggle_mili_trigger ~= '' then
		show_mili = false
		set_time_text( timer_source )
	else
		show_mili = true
		set_time_text( timer_source )
	end	
	--return true
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Callback for button press
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function mili_button_clicked( props, p, settings )
	mili_toggle( true )
	return true
end	
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	
	
	Credit:			

	Modified:		

	function:		
	type:			
	input type: 	
	returns:
----------------------------------------------------------------------------------------------------------------------------------------
]]
function mili_toggle( pressed )	
	if not pressed then
		return
	end
	
	if show_mili then
		show_mili = false
	else
		show_mili = true
	end
	
	--[[
		
		The timer text will update if the timer is active
		but not if it is paused. Lets update it if in the
		paused (inactive) state.
		
	]]	
	if not timer_active then
		set_time_text( timer_source )
	end	
	--[[
		
		A button has it's own callback so we can not action anything
		on the button press through the Properties Callback, instead
		we will action it on the button Callback directly.
		
	]]
	local mode = obs.obs_data_get_int( script_settings, 'timer_type' )
	local mili_button_prop = obs.obs_properties_get( props, 'mili_button' )

	--[[
		
		We are only setting the button label depending if the timer's milliseconds
		value visibility state.
		
	]]
	if show_mili then
		obs.obs_property_set_description( mili_button_prop, 'Hide Milliseconds' )
	else
		obs.obs_property_set_description( mili_button_prop, 'Show Milliseconds' )
	end
	return true
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	
	
	Credit:			

	Modified:		

	function:		
	type:			
	input type: 	
	returns:
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function recording_callback()
	obs.timer_remove( recording_callback )
	record( 1 )
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	
	
	Credit:			

	Modified:		

	function:		
	type:			
	input type: 	
	returns:
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function delayed_recording()
	obs.timer_add( recording_callback, 100 ) --<- milliseconds 
end	
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Function to set the split time text
	
	Credit:			

	Modified:		

	function:		
	type:			
	input type: 	
	returns:
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function set_split_text( source_name )
	if source_name == 'Select' then
		return
	end	
	if reset_activated then 
		reset_activated = false
		timer_reset( true ) 
	end	
	local text = split_data
	if text ~= last_split_data then
	set_text( source_name, text )
	end
	last_split_data = text
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Play / Pause Media
	
	Credit:			OBS, midnight-studios

	Modified:		

	function:		
	type:			
	input type: 	
	returns:	none, play /pause media source
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function pause_play_media( source_name, play )
	
	if in_table( {'','None', 'Select','none', 'select'}, source_name ) or not is_visible( source_name )then return end
			
		local source = obs.obs_get_source_by_name( source_name )
	
		if source ~= nil then
			obs.obs_source_media_play_pause( source, play )
			--obs.obs_source_media_get_duration( source )
			--obs.obs_source_media_get_time( source )
			--obs.obs_source_media_restart( source )
        	--local state = obs.obs_source_media_get_state( source ) -- get the current state for the source	
			--if state == obs.OBS_MEDIA_STATE_PLAYING  then
			--end
			--if state == obs.OBS_MEDIA_STATE_PAUSED  then
			--end
		end
		obs.obs_source_release( source )
end	
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Called when a source is activated/deactivated
	
	Credit:			

	Modified:		

	function:		
	type:			
	input type: 	
	returns:
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function activate_signal( cd, activating )
	--[[
	
		Capture / Retrieve Callback Data
	
	]]
	local source = obs.calldata_source( cd, 'source' )
	
	--[[
	
		Do we have a Source?
	
	]]
	if source ~= nil then
		
		local name = obs.obs_source_get_name( source ) -- Get Source NAME
		--[[
		
		]]		
		activate_timer_on_scene( source, activating )
		--[[
		
			Check if scene has source
		
		]]
		if ( name == timer_source ) then
			if activating then record( 4, 300 ) end
			if start_on_visible or start_on_scene_active then
				timer_reset( true )
				activate( activating )
			end
		end
	end
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	
	
	Credit:			

	Modified:		

	function:		reset timer	
	type:			
	input type: 	
	returns:		none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function reset( pressed )
	if not pressed then
		return
	end
	reset_activated = true
	--[[
	
		force text update by changing last_text
	
	]]
	last_text = tostring( obs.os_gettime_ns() )

	--[[
	
		Update cur_settings
	
	]]	
	timer_reset( true ) -- based on UI Settings
	
	--[[
	
		Handle Timer Callback
	
	]]
	activate( false )
	--[[
	
		Reset timer split seconds text
	
	]]
	set_split_text( split_source )
	--[[
	
		Reset 'Active Source' text (if defined)
	
	]]
	if active_source ~= 'Select' then 
		
		set_text( active_source, '' ) 
		--[[
			force the visibility 
			state of this source. 
		]]	
		if active_source_force_visible then set_visible( active_source, false ) end
	end
	--[[
		Set visibility to first position
	]]	
	set_visible( media['source_name_audio_caution'], false )
	set_visible( media['source_name_audio_warning'], false )
	--[[
		Set bool to first position
	]]	
	media['media_ended_caution'] = false
	media['media_ended_warning'] = false
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Set the titles / labels of the Start / Pause Button
	
	Credit:			

	Modified:		

	function:		Update start/puase button label
	type:			
	input type: 	mode, timer_active
	returns:		props
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function property_button_update_start()
	--[[
		
		A button has it's own callback so we can not action anything
		on the button press through the Properties Callback, instead
		we will action it on the button Callback directly.
		
	]]
	local mode = obs.obs_data_get_int( script_settings, 'timer_type' )
	local pause_button_prop = obs.obs_properties_get( props, 'pause_button' )
	--[[
		
		We are only setting the button label depending if the timer is active
		and on the timer type.
		
	]]
	if mode == 2 then
		if timer_active then
			obs.obs_property_set_description( pause_button_prop, 'Start/Pause Countdown' )
		else
			obs.obs_property_set_description( pause_button_prop, 'Start Countdown' )
		end
	else
		if timer_active then
			obs.obs_property_set_description( pause_button_prop, 'Start/Pause Stopwatch' )
		else
			obs.obs_property_set_description( pause_button_prop, 'Start Stopwatch' )
		end
	end	
	return props
end	
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Usually called by a button or hotkey press
	
	Credit:			

	Modified:		

	function:		
	type:			
	input type: 	
	returns:
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function on_pause( pressed )
	if not pressed then
		return true
	end
	
	update_prop_settings_cur_seconds( cur_seconds ) -- update current time to last time in properties
	--[[
		
		Set timer source  visibility to visible
		
	]]	
	set_visible( timer_source, true )
	
	if timer_active then
		activate( false )
		split_unpack()
		set_split_text( split_source )
	else
		if activated == false then	
			activate( true )
		end	
	end
		pause_play_media( media['source_name_audio_caution'], not timer_active )
		pause_play_media( media['source_name_audio_warning'], not timer_active )
	return true
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Callback for button press
	
	Credit:			

	Modified:		

	function:		
	type:			
	input type: 	
	returns:
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function pause_button_clicked( props, p )
	on_pause( true )
	property_button_update_start()
	return true
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Usually called by a button or hotkey press
	
	Credit:			

	Modified:		

	function:		
	type:			
	input type: 	
	returns:
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function on_export( pressed )
	if not pressed then
		return
	end
	local file_exported = write_to_json( script_settings )
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Callback for button press
	
	Credit:			

	Modified:		

	function:		
	type:			
	input type: 	
	returns:
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function export_button_clicked( props, p )
	on_export( true )
	return false
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Callback for button press	
	
	Credit:			

	Modified:		

	function:		
	type:			
	input type: 	
	returns:
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function import_button_clicked( props, p, settings )
	return true
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Callback for button press
	
	Credit:			

	Modified:		

	function:		
	type:			
	input type: 	
	returns:
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function sw_saved_button_clicked( props, p, settings )
	if timer_type == 1 then
		set_stopwatch()
	end
	return false
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Callback for button press
	
	Credit:			

	Modified:		

	function:		
	type:			
	input type: 	
	returns:
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function reset_button_clicked( props, p, settings )
	reset( true )
	reset_mili()
	return true
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Usually called by a button or hotkey press
	
	Credit:			

	Modified:		

	function:		
	type:			
	input type: 	
	returns:
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function on_split( pressed )
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
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Callback for button press
	
	Credit:			

	Modified:		

	function:		
	type:			
	input type: 	
	returns:
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function split_button_clicked( props, p )
	on_split( true )
	return false
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	 custom function

					we use this to get a signal handler for a specific source once
					it is loaded to ensure it is connected when OBS starts up
	
	Credit:			

	Modified:		

	function:		
	type:			
	input type: 	
	returns:
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function connect_source_signal( cd )
	
	--[[
		Get source from CallData
	]]
	local source = obs.calldata_source( cd, 'source' )

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
		if ( name == timer_source ) then
			if timer_type == 1 then
				if load_saved_time then
					timer_value( sw_cur_seconds, false ) -- value, update_settings 
				else
					timer_value( 0, false )
					reset( true )	
				end	
			else
				reset( true )	
			end	
		end	
	end

end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	
	
	Credit:			

	Modified:		

	function:		
	type:			
	input type: 	
	returns:
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function source_activated( cd )
   if disable_script then
		return		
	end
	activate_signal( cd, true )
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	
	
	Credit:			

	Modified:		

	function:		
	type:			
	input type: 	
	returns:
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function source_deactivated( cd )
	activate_signal( cd, false )
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	
	
	Credit:			

	Modified:		

	function:		
	type:			
	input type: 	
	returns:
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function load_settings_globals( settings )
	
	timer_day = obs.obs_data_get_int( settings, 'day' )
	timer_year = obs.obs_data_get_int( settings, 'year' )
	timer_hours = obs.obs_data_get_int( settings, 'hours' )
	timer_month = obs.obs_data_get_int( settings, 'month' ) - 1
	timer_type = obs.obs_data_get_int( settings, 'timer_type' )
	timer_minutes = obs.obs_data_get_int( settings, 'minutes' )
	timer_seconds = obs.obs_data_get_int( settings, 'seconds' )
	trigger_text = obs.obs_data_get_int( settings, 'trigger_text' )
	timer_format = obs.obs_data_get_int( settings, 'timer_format' )
	timer_source = obs.obs_data_get_string( settings, 'timer_source' )
	timer_display = obs.obs_data_get_int( settings, 'timer_display' )
	countdown_type = obs.obs_data_get_int( settings, 'countdown_type' )
	sw_hours_saved = obs.obs_data_get_int( settings, 'sw_hours_saved' )
	cycle_direction = obs.obs_data_get_int( settings, 'cycle_direction' )
	sw_cur_seconds = obs.obs_data_get_double( settings, 'sw_cur_seconds' )
	load_saved_time = obs.obs_data_get_bool( settings, 'load_saved_time' )
	sw_minutes_saved = obs.obs_data_get_int( settings, 'sw_minutes_saved' )
	sw_seconds_saved = obs.obs_data_get_int( settings, 'sw_seconds_saved' )	
	custom_time_format = obs.obs_data_get_string( settings, 'custom_time_format' )
	toggle_mili_trigger = obs.obs_data_get_string( settings, 'toggle_mili_trigger' )
	sw_milliseconds_saved = obs.obs_data_get_int( settings, 'sw_milliseconds_saved' ) 
	media['note_source_caution'] = obs.obs_data_get_string( settings, 'note_source_caution' )
	media['note_source_warning'] = obs.obs_data_get_string( settings, 'note_source_warning' )
	longtimetext_s = string.gsub(obs.obs_data_get_string( settings, 'day_text' ), '\\([n])', {n='\n'})
	longtimetext_p = string.gsub(obs.obs_data_get_string( settings, 'days_text' ), '\\([n])', {n='\n'})
	media['note_caution'] = string.gsub(obs.obs_data_get_string( settings, 'note_caution' ), '\\([n])', {n='\n'})
	media['note_warning'] = string.gsub(obs.obs_data_get_string( settings, 'note_warning' ), '\\([n])', {n='\n'})
	--[[
				Used for source cycling
		
				def_seconds: Default Seconds
		
				the default timer state
		
				This is the state of the timer that will set or
				reset the time ( cur_seconds ) 
		
				If the timer expires because cur_seconds == 0, 
				then the time ( cur_seconds ) will be be restarted
				from def_seconds for another function such as source cycling.
		
				Every instance that a timer time is defined, we must record it to def_seconds
	]]
	def_seconds = cur_seconds 
	stop_text = obs.obs_data_get_string( settings, 'stop_text' )
	next_scene = obs.obs_data_get_string( settings, 'next_scene' )
	split_type = obs.obs_data_get_string( settings, 'split_type' )
	import_list = obs.obs_data_get_string( settings, 'import_list' )
	split_source = obs.obs_data_get_string( settings, 'split_source' )
    disable_script = obs.obs_data_get_bool( settings,'disable_script' )
	recording_type = obs.obs_data_get_int( settings, 'recording_type' )
	backup_folder = obs.obs_data_get_string( settings, 'backup_folder' )
	active_source = obs.obs_data_get_string( settings, 'active_source' )	
	start_recording = obs.obs_data_get_int( settings, 'start_recording' )
	load_saved_time = obs.obs_data_get_bool( settings, 'load_saved_time' )
    start_on_visible = obs.obs_data_get_bool( settings,'start_on_visible' )														
	media['normal_color'] = obs.obs_data_get_int( settings, 'normal_color' )
	media['color_caution'] = obs.obs_data_get_int( settings, 'color_caution' )
	media['color_warning'] = obs.obs_data_get_int( settings, 'color_warning' )							
	media['text_warning'] = obs.obs_data_get_string( settings, 'text_warning' )
	media['text_caution'] = obs.obs_data_get_string( settings, 'text_caution' )
	media_playback_limit = obs.obs_data_get_int( settings, 'media_playback_limit' )
    start_on_scene_active = obs.obs_data_get_bool( settings,'start_on_scene_active' )
	media['source_name_audio_warning'] = obs.obs_data_get_string( settings, 'audio_warning' )
	media['source_name_audio_caution'] = obs.obs_data_get_string( settings, 'audio_caution' )	
    active_source_force_visible = obs.obs_data_get_bool( settings,'active_source_force_visible' )
	text_prefix = string.gsub(obs.obs_data_get_string( settings, 'text_prefix' ), '\\([n])', {n='\n'})
	text_suffix = string.gsub(obs.obs_data_get_string( settings, 'text_suffix' ), '\\([n])', {n='\n'})
	if media_playback_limit ~= 1 then
		media['duration_caution'] = obs.obs_data_get_int( settings, 'duration_caution' )
		media['duration_warning'] = obs.obs_data_get_int( settings, 'duration_warning' )
	else
		media['duration_caution'] = 0
		media['duration_warning'] = 0
	end
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Callback on property modification
	
	Credit:			

	Modified:		

	function:		Callback for Settings import
	type:			
	input type: 	
	returns:
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function import_properties( props, property, settings )
	local import_folder = backup_folder
	-- convert Windows path to UNIX path
	import_folder = import_folder .. '/' .. import_list .. '.json'
	import_folder = import_folder:gsub([[\]], '/');
	if obs.os_file_exists( import_folder ) then
		data = obs.obs_data_create_from_json_file( import_folder )
		if data ~= nil then
			obs.obs_data_apply( settings, data )
			obs.obs_data_set_string( settings, 'import_list', 'select')
			script_settings = settings
		end	
	end
  -- IMPORTANT: returns true to trigger refresh of the properties
	return true
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Callback on property modification
	
	Credit:			

	Modified:		

	function:		
	type:			property event
	input type: 	props, property, settings
	returns: 		true to update properties
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function property_onchange( props, property, settings )
	--[[
	
		Optimization: prevent unnecessary callbacks
	
	]]
	if prevent_callback then return end
	local property_name = obs.obs_property_name( property )
	--[[
	
			 PROPERTY VALUE
	
	]]
	local day_value = obs.obs_data_get_int( script_settings, 'day' )-- -- Retrieves property value from reference
	local year_value = obs.obs_data_get_int( script_settings, 'year' )-- -- Retrieves property value from reference
	local month_value = obs.obs_data_get_int( script_settings, 'month' )-- -- Retrieves property value from reference
	local config_value = obs.obs_data_get_int( script_settings, 'config' )-- -- Retrieves property value from reference
	local timer_type_value = obs.obs_data_get_int( script_settings, 'timer_type' )-- -- Retrieves property value from reference
	local backup_mode_value = obs.obs_data_get_bool( script_settings, 'backup_mode' )-- -- Retrieves property value from reference
	local trigger_text_value = obs.obs_data_get_int( script_settings, 'trigger_text' )-- -- Retrieves property value from reference
	local import_list_value = obs.obs_data_get_string( script_settings, 'import_list' )-- -- Retrieves property value from reference
	local next_scene_value = obs.obs_data_get_string( script_settings, 'next_scene' )	-- -- Retrieves property value from reference
	local timer_options_value = obs.obs_data_get_int( script_settings, 'timer_options' )-- -- Retrieves property value from reference
	local timer_source_value = obs.obs_data_get_string( script_settings, 'timer_source' )-- -- Retrieves property value from reference
	local split_source_value = obs.obs_data_get_string( script_settings, 'split_source' )-- -- Retrieves property value from reference
	local set_stopwatch_value = obs.obs_data_get_bool( script_settings, 'set_stopwatch' )-- -- Retrieves property value from reference
	local countdown_type_value = obs.obs_data_get_int( script_settings, 'countdown_type' )-- -- Retrieves property value from reference
	local active_source_value = obs.obs_data_get_string( script_settings, 'active_source' )-- -- Retrieves property value from reference
	local start_recording_value = obs.obs_data_get_int( script_settings, 'start_recording' )-- -- Retrieves property value from reference
	local trigger_options_value = obs.obs_data_get_int( script_settings, 'trigger_options' )-- -- Retrieves property value from reference
	local note_source_caution_value = obs.obs_data_get_string( script_settings, 'note_source_caution' )-- -- Retrieves property value from reference
	local note_source_warning_value = obs.obs_data_get_string( script_settings, 'note_source_warning' )-- -- Retrieves property value from reference
	local media_playback_limit_value = obs.obs_data_get_int( script_settings, 'media_playback_limit' )-- -- Retrieves property value from reference
	--[[
	
			 BACKUP PROPERTIES
	
	]]	
	local backup_mode_prop = obs.obs_properties_get( props, 'backup_mode' )
	local import_list_prop = obs.obs_properties_get( props, 'import_list' )
	--[[
	
			 TIMER PROPERTIES
	
	]]
	local mili_button_prop = obs.obs_properties_get( props, 'mili_button' )
	local timer_source_prop = obs.obs_properties_get( props, 'timer_source' )
	local pause_button_prop = obs.obs_properties_get( props, 'pause_button' )
	local timer_options_prop = obs.obs_properties_get( props, 'timer_options' )
	local custom_time_format_prop = obs.obs_properties_get( props, 'custom_time_format' )
	local toggle_mili_trigger_prop = obs.obs_properties_get( props, 'toggle_mili_trigger' )
	--[[
	
			 STOPWATCH PROPERTIES
	
	]]
	local _group_1_prop = obs.obs_properties_get( props, '_group_1' )
	local set_stopwatch_prop = obs.obs_properties_get( props, 'set_stopwatch' )
	local timer_display_prop = obs.obs_properties_get( props, 'timer_display' )
	--[[
	
			 COUNTDOWN PROPERTIES
	
	]]	
	local day_prop = obs.obs_properties_get( props, 'day' )
	local year_prop = obs.obs_properties_get( props, 'year' )
	local month_prop = obs.obs_properties_get( props, 'month' )
	local day_text_prop = obs.obs_properties_get( props, 'day_text' )
	local days_text_prop = obs.obs_properties_get( props, 'days_text' )
	local stop_text_prop = obs.obs_properties_get( props, 'stop_text' )
	local cycle_list_prop = obs.obs_properties_get( props, 'cycle_list' )
	local text_prefix_prop = obs.obs_properties_get( props, 'text_prefix' )
	local text_suffix_prop = obs.obs_properties_get( props, 'text_suffix' )
	local active_source_prop = obs.obs_properties_get( props, 'active_source' )
	local recording_type_prop = obs.obs_properties_get( props, 'recording_type' )
	local cycle_direction_prop = obs.obs_properties_get( props, 'cycle_direction' )
	local as_visible_prop = obs.obs_properties_get( props, 'active_source_force_visible' )
	--[[
	
			 PROPERTIES
	
	]]	
	local hours_prop = obs.obs_properties_get( props, 'hours' )
	local minutes_prop = obs.obs_properties_get( props, 'minutes' )
	local seconds_prop = obs.obs_properties_get( props, 'seconds' )
	local split_type_prop = obs.obs_properties_get( props, 'split_type' )
	local next_scene_prop = obs.obs_properties_get( props, 'next_scene' )
	local split_button_prop = obs.obs_properties_get( props, 'split_button' )
	local split_source_prop = obs.obs_properties_get( props, 'split_source' )
	local timer_format_prop = obs.obs_properties_get( props, 'timer_format' )
	local normal_color_prop = obs.obs_properties_get( props, 'normal_color' )
	local reset_button_prop = obs.obs_properties_get( props, 'reset_button' )
	local countdown_type_prop = obs.obs_properties_get( props, 'countdown_type' )
	local start_recording_prop = obs.obs_properties_get( props, 'start_recording' )
	--[[
	
			 PROPERTIES
	
	]]
	local export_button_prop = obs.obs_properties_get( props, 'export_button' )
	local import_button_prop = obs.obs_properties_get( props, 'import_button' )
	local export_folder_prop = obs.obs_properties_get( props, 'backup_folder' )
	local disable_script_prop = obs.obs_properties_get( props, 'disable_script' )
	local start_on_visible_prop = obs.obs_properties_get( props, 'start_on_visible' )
	local start_on_scene_active_prop = obs.obs_properties_get( props, 'start_on_scene_active' )
	--[[
	
			WARNING & CAUTION PROPERTIES
	
	]]
	local to_prop = obs.obs_properties_get( props, 'trigger_options' )
	local c_note_prop = obs.obs_properties_get( props, 'note_caution' )
	local w_note_prop = obs.obs_properties_get( props, 'note_warning' )
	local trigger_text_prop = obs.obs_properties_get( props, 'trigger_text' )
	local text_caution_prop = obs.obs_properties_get( props, 'text_caution' )
	local text_warning_prop = obs.obs_properties_get( props, 'text_warning' )
	local color_caution_prop = obs.obs_properties_get( props, 'color_caution' )
	local color_warning_prop = obs.obs_properties_get( props, 'color_warning' )
	local audio_caution_prop = obs.obs_properties_get( props, 'audio_caution' )
	local audio_warning_prop = obs.obs_properties_get( props, 'audio_warning' )
	local cn_source_prop = obs.obs_properties_get( props, 'note_source_caution' )
	local wn_source_prop = obs.obs_properties_get( props, 'note_source_warning' )
	local duration_caution_prop = obs.obs_properties_get( props, 'duration_caution' )
	local duration_warning_prop = obs.obs_properties_get( props, 'duration_warning' )
	local media_playback_limit_prop = obs.obs_properties_get( props, 'media_playback_limit' )
	--[[
			TIMER INPUTS
	]]	
	obs.obs_property_set_visible( custom_time_format_prop, timer_format == 5 )
	obs.obs_property_set_visible( timer_options_prop, config_value == 2 )
	obs.obs_property_set_visible( timer_display_prop, config_value == 2 and timer_type_value == 2 and timer_options_value == 2  )
	--[[
	
			TIMER STOPWATCH INPUTS
			
			if config is set to basic then hide
			if config is set to advanced then check if timer_options are expanded then show
	]]	
	obs.obs_property_set_visible( split_button_prop, timer_type_value == 1 )
	obs.obs_property_set_visible( text_prefix_prop, config_value == 2 and timer_options_value == 2 )
	obs.obs_property_set_visible( text_suffix_prop, config_value == 2 and timer_options_value == 2 )
	obs.obs_property_set_visible( timer_format_prop, config_value == 2 and timer_options_value == 2 )	
	obs.obs_property_set_visible( normal_color_prop, config_value == 2 and timer_options_value == 2  )
	obs.obs_property_set_visible( set_stopwatch_prop, ( config_value == 2 and timer_type_value == 1 ) )
	obs.obs_property_set_visible( timer_source_prop, ( config_value == 2 and timer_options_value == 2 ) )
	obs.obs_property_set_visible( split_type_prop, timer_type_value == 1 and config_value == 2 and timer_options_value == 2 )
	obs.obs_property_set_visible( split_source_prop, timer_type_value == 1 and config_value == 2 and timer_options_value == 2 )
	obs.obs_property_set_visible( _group_1_prop, ( config_value == 2 and set_stopwatch_value and timer_type_value == 1 and timer_options_value == 2 ) )
	--[[
	
			TIMER COUNTDOWN INPUTS
			
			if config is set to basic then hide
			if config is set to advanced then check if timer_options are expanded then show
	]]		
	
	obs.obs_property_set_visible( recording_type_prop, false )
	obs.obs_property_set_enabled( day_prop, month_value ~= 1 )
	obs.obs_property_set_enabled( year_prop, month_value ~= 1 )
	obs.obs_property_set_visible( mili_button_prop, toggle_mili_trigger == '' and timer_type_value == 2  )
	obs.obs_property_set_visible( toggle_mili_trigger_prop, show_split( props, settings ) and timer_options_value == 2 )
	obs.obs_property_set_visible( hours_prop, config_value == 2 and timer_type_value == 2 and timer_options_value == 2  )
	obs.obs_property_set_visible( minutes_prop, config_value == 2 and timer_type_value == 2 and timer_options_value == 2  ) 
	obs.obs_property_set_visible( seconds_prop, config_value == 2 and timer_type_value == 2 and timer_options_value == 2  ) 
	obs.obs_property_set_visible( next_scene_prop, config_value == 2 and timer_type_value == 2 and timer_options_value == 2  )
	obs.obs_property_set_visible( countdown_type_prop, config_value == 2 and timer_type_value == 2 and timer_options_value == 2 )
	obs.obs_property_set_visible( start_recording_prop, config_value == 2 and timer_type_value == 2 and timer_options_value == 2 )
	obs.obs_property_set_visible( recording_type_prop, config_value == 2 and start_recording_value == 1 and timer_type_value == 2 )	
	obs.obs_property_set_visible( stop_text_prop, next_scene_value == 'TIMER END TEXT' and  timer_type_value == 2 and timer_options_value == 2 )	
	obs.obs_property_set_visible( day_prop, countdown_type_value == 1 and config_value == 2 and timer_type_value == 2 and timer_options_value == 2 )
	obs.obs_property_set_visible( year_prop, countdown_type_value == 1 and config_value == 2 and timer_type_value == 2 and timer_options_value == 2 )
	obs.obs_property_set_visible( month_prop, countdown_type_value == 1 and config_value == 2 and timer_type_value == 2 and timer_options_value == 2 )
	obs.obs_property_set_visible( day_text_prop, countdown_type_value == 1 and config_value == 2 and timer_type_value == 2 and timer_format ~= 5 and timer_options_value == 2 )
	obs.obs_property_set_visible( days_text_prop, countdown_type_value == 1 and config_value == 2 and timer_type_value == 2 and timer_format ~= 5 and timer_options_value == 2 )
	obs.obs_property_set_visible( cycle_list_prop, ( (next_scene_value == 'Source List' or next_scene_value == 'Scene List') and timer_type_value == 2 and config_value == 2 and timer_options_value == 2 ) )
	obs.obs_property_set_visible( active_source_prop, ( (next_scene_value == 'Source List' or next_scene_value == 'Scene List') and timer_type_value == 2 and config_value == 2 and timer_options_value == 2 ) )
	obs.obs_property_set_visible( as_visible_prop, ( (next_scene_value == 'Source List' or next_scene_value == 'Scene List') and timer_type_value == 2 and config_value == 2 and timer_options_value == 2 ) )
	obs.obs_property_set_visible( cycle_direction_prop, ( (next_scene_value == 'Source List' or next_scene_value == 'Scene List') and timer_type_value == 2 and config_value == 2 and timer_options_value == 2 ) )
	--[[
	
			WARNING & CAUTION INPUTS
			
			if config is set to basic then hide
			if config is set to advanced then check if trigger_options are expanded then show
	]]
	obs.obs_property_set_visible( to_prop, ( config_value == 2 ) )
	obs.obs_property_set_visible( trigger_text_prop, ( config_value == 2 and trigger_options_value == 2 ))
	obs.obs_property_set_visible( text_caution_prop, ( config_value == 2 and trigger_options_value == 2 ) )
	obs.obs_property_set_visible( text_warning_prop, ( config_value == 2 and trigger_options_value == 2 ) )
	obs.obs_property_set_visible( audio_warning_prop, ( config_value == 2 and trigger_options_value == 2) )
	obs.obs_property_set_visible( color_caution_prop, ( config_value == 2 and trigger_options_value == 2 ) )
	obs.obs_property_set_visible( color_warning_prop, ( config_value == 2 and trigger_options_value == 2 ) )
	obs.obs_property_set_visible( audio_caution_prop, ( config_value == 2 and trigger_options_value == 2 ) )
	obs.obs_property_set_visible( media_playback_limit_prop, ( config_value == 2 and trigger_options_value == 2) )
	obs.obs_property_set_visible( c_note_prop, ( config_value == 2 and trigger_text_value ~= 1 and trigger_options_value == 2 ) )
	obs.obs_property_set_visible( w_note_prop, ( config_value == 2 and trigger_text_value ~= 1 and trigger_options_value == 2 ) )
	obs.obs_property_set_visible( cn_source_prop, ( config_value == 2 and trigger_text_value ~= 1 and trigger_options_value == 2 ) )
	obs.obs_property_set_visible( wn_source_prop, ( config_value == 2 and trigger_text_value ~= 1 and trigger_options_value == 2 ) )
	obs.obs_property_set_visible( duration_caution_prop, ( config_value == 2 and trigger_options_value == 2 and media_playback_limit_value == 2 ) )
	obs.obs_property_set_visible( duration_warning_prop, ( config_value == 2 and trigger_options_value == 2 and media_playback_limit_value == 2 ) )
	--[[
	
			BACKUP SETTINGS INPUTS
	
	]]	
	obs.obs_property_set_visible( backup_mode_prop, ( config_value == 2 ))
	obs.obs_property_set_visible( import_list_prop, backup_mode_value and config_value == 2 )
	obs.obs_property_set_visible( export_button_prop, backup_mode_value and config_value == 2 )
	obs.obs_property_set_visible( import_button_prop, backup_mode_value and config_value == 2 )
	obs.obs_property_set_visible( export_folder_prop, backup_mode_value and config_value == 2 )
	obs.obs_property_set_visible( import_button_prop, import_list_value ~= 'select' and  import_list_value ~= '' and config_value == 2 )
	--[[
	
			OTHER INPUTS
	
	]]		
	obs.obs_property_set_visible( disable_script_prop, config_value == 2 )
	obs.obs_property_set_visible( start_on_visible_prop, config_value == 2 )
	obs.obs_property_set_visible( start_on_scene_active_prop, config_value == 2 )
	--[[
		
		Try to prevent reference conflicts
	
	]]	
	if ( in_table( {timer_source_value, split_source_value, active_source_value, note_source_warning_value}, note_source_caution_value ) ) then
		obs.obs_data_set_string( settings, 'note_source_caution', 'select' ) -- Don't allow timer and caution note text source to be the same
	end 
	if ( in_table( {timer_source_value, split_source_value, active_source_value, note_source_caution_value}, note_source_warning_value ) ) then
		obs.obs_data_set_string( settings, 'note_source_warning', 'select' ) -- Don't allow timer and warning note text source to be the same
	end 	
	if ( in_table( {timer_source_value, split_source_value, note_source_caution_value, note_source_warning_value}, active_source_value ) ) then
		obs.obs_data_set_string( settings, 'active_source', 'select' ) -- Don't allow timer and active text source to be the same
	end
	if countdown_type_value == 1 and month_value ~= 1 and day_value == 0 then
		obs.obs_data_set_int( settings, 'day', 1 ) -- set to at least 1, else the timer won't know it is at zero
	end	
	--[[
		
		Some Calandar Stuff
	
	]]	
	obs.obs_property_int_set_limits( day_prop, 1, 31, 1 )
	if ( month_value == 5 or month_value == 7 or month_value == 10 or month_value == 12 ) then
		obs.obs_property_int_set_limits( day_prop, 1, 30, 1 )
	elseif ( month_value == 3 ) then
		local leap = 28
		if is_leap_year(year_value) then
			 leap = 29
		else
			 leap = 28
		end	
		obs.obs_property_int_set_limits( day_prop, 1, leap, 1 )
	end
	--[[
		
		Defind same label titles
	
	]]	
	if show_mili then
		obs.obs_property_set_description( mili_button_prop, 'Hide Milliseconds' )
	else
		obs.obs_property_set_description( mili_button_prop, 'Show Milliseconds' )
	end
	--[[
		
		User defined a value for the millisecond trigger?
		If value defined, then hide millisecond button.
		If value not defined, then show millisecond button.
	
	]]	
	--[[
		
		Timer type is Countdown?
		Set button labels
	
	]]
	if timer_type_value == 2 then
		obs.obs_property_set_description( reset_button_prop, 'Reset Countdown' )
	else
		--[[

			Timer type is Stopwatch?
			Set button labels

		]]
		obs.obs_property_set_description( reset_button_prop, 'Reset Stopwatch' )	
	end	
	--[[

		Set button labels

	]]
	if timer_type_value == 2 then
		if timer_active then
			obs.obs_property_set_description( pause_button_prop, 'Start/Pause Countdown' )
		else
			obs.obs_property_set_description( pause_button_prop, 'Start Countdown' )
		end
	else
		if timer_active then
			obs.obs_property_set_description( pause_button_prop, 'Start/Pause Stopwatch' )
		else
			obs.obs_property_set_description( pause_button_prop, 'Start Stopwatch' )
		end
	end	
	--[[

		Rebuild backup file list

	]]	
	local filenames = get_filenames( backup_folder, '.json' )
	local has_file_list = ( table.getn( filenames ) > 0 )
	if obs.os_file_exists( backup_folder ) then	
		obs.obs_property_list_clear( import_list_prop )
		obs.obs_property_list_add_string( import_list_prop, 'Select', 'select' )
		if has_file_list then
			for i,v in pairs( filenames ) do 
				obs.obs_property_list_add_string( import_list_prop, v, v ) 
			end
		end
	
	end
  -- IMPORTANT: returns true to trigger refresh of the properties
  return true
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Only used in Countdown mode
	
	Credit:			

	Modified:		

	function:		
	type:			
	input type: 	
	returns:
----------------------------------------------------------------------------------------------------------------------------------------
]] 
function timer_ended( source_name )
	
	delayed_recording()
	
	--[[
		Timer expired and a scene change is requested.
	]]	
	if next_scene ~= 'TIMER END TEXT' and next_scene ~= 'Source List'  and next_scene ~= 'Scene List' and next_scene ~= 'Select' then
		--[[
			The timer expired and the timer will not restart.
		]]	
		set_visible( timer_source, false ) -- last thing, set visibility of timer to hide because we are changing to another scene
		--[[
			Increments the source reference counter, 
			use obs_source_release() to release it when complete.
		]]
		
		local source = obs.obs_get_source_by_name( next_scene )
		
		if source ~= nil then
			obs.obs_frontend_set_current_scene( source )
			obs.obs_source_release( source )
			timer_reset( true ) 	
		end
		
		--[[
			The timer expired and the timer will not restart.
		]]
		timer_expired = true
		timer_active = false
		
		--[[
			This will remove the callback.
		]]
		activate( false )
		
	end

	if next_scene == 'Source List' then
		reset( true ) -- Reset the timer
		cycle_list_activate( 'source' )
		--[[
			Set timer_active for it to self-start
		]]		
		--timer_active = false
		on_pause( true ) -- Restart the timer
	end	

	if next_scene == 'Scene List' then
		reset( true ) -- Reset the timer
		cycle_list_activate( 'scene' )
		--[[
			Set timer_active for it to self-start
		]]		
		--timer_active = false
		on_pause( true ) -- Reset the timer
	end	

	if next_scene == 'TIMER END TEXT' then
		local text = stop_text
		set_text( source_name, text )
	end
	--[[
		
		TODO> We want to update the timer start button description at this point.
		
	]]
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	A function named script_properties defines the properties that the user
					can change for the entire script module itself. The stacking order of properties detirmine 
					the order and position of the items on the UI

	Credit:			

	Modified:		

	function:		Creates UI
	type:			Properties
	input type: 	none
	returns:		props
----------------------------------------------------------------------------------------------------------------------------------------
]]
function script_properties()
	
	props = obs.obs_properties_create()	
 	--[[
		Option list: User select type of timer required.
		 
		This property is referenced to trigger an onchange event listener.
	]]	 	
	local p_1 = obs.obs_properties_add_list( props, 'timer_type', '<b>Timer Type</b>', obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT )
  	t_type = {'Stopwatch', 'Countdown'} -- Add options to the list
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_1, v, i ) end -- This list is auto indexed thus have an interger reference containing a string value
 	--[[
		Option list: User select to access Basic or Advanced Features.
		This provides UI layout options to enhance the user experience.
		Changing this setting does not impact any function or result. 
		 
		This property is referenced to trigger an onchange event listener.
	]]
	local p_2 = obs.obs_properties_add_list( props, 'config', '<font color='.. font_dimmed ..'>Configuration</font>', obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT )
  	t_type = {'Basic', 'Advanced'} -- Adds options to the list
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_2, v, i ) end -- This list is auto indexed thus have an interger reference containing a string value
 	--[[
		Option list: User select to access show or hide available features.
		This provides UI layout options to enhance the user experience.
		Changing this setting does not impact any function or result. 
		 
		This property is referenced to trigger an onchange event listener.
	]]	
	local p_3 = obs.obs_properties_add_list( props, 'timer_options', '<font color='.. font_dimmed ..'><b>Timer Options</b></font>', obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT )
	 t_type = {'Hidden', 'Expanded'} -- Add options to the list
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_3, v, i ) end -- This list is auto indexed thus have an interger reference containing a string value
	obs.obs_property_set_long_description( p_3, '\nExpand or hide additional timer options.\n' ) -- User Tip
	--[[
		Returns an array of reference-incremented sources. 
		Release with source_list_release().
	]]	
	local sources = obs.obs_enum_sources()
 	--[[
		Option list: User select <text-source> to be used as visual feedback indicating a time stamp.
		This provides function options that will impact on visual feedback to the user.
		Changing this setting will impact on the function or end result. 
	]]		
	local p_4 = obs.obs_properties_add_list( props, 'timer_source', '<i>Timer Source</i>', obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING )
	obs.obs_property_list_add_string( p_4, 'Select', 'select' ) -- Adds a default option to the list. First (top-most) list item. If selected the option is ignored. 
	local list = {} -- Define a table variable to be used to build lists that will be passed to the property list
	if sources ~= nil then
		for _, source in ipairs( sources ) do -- ipairs cycles auto incrimented items
			source_id = obs.obs_source_get_unversioned_id( source ) -- unversioned_id will not be affected by language settings
			if source_id == 'text_gdiplus' or source_id == 'text_ft2_source' then -- identify text type sources only
				local name = obs.obs_source_get_name( source ) -- Get the source name, this will be a unique identifier 
				--[[
					boolean check, is the source (name) already selected for another item? 
					This will help to limit conflicts to prevent using a single source for two sperate functions
				]]
				if not in_table( {split_source, active_source, media['note_source_caution'], media['note_source_warning']}, name ) then -- boolean check
					--[[
						add it to the (temp) table (list)
					]]		
					list[name] = name
				else
					-- continue to skip potential conflicts
				end
			end
		end
			obs.bfree(source) -- free memory, release source as it is no longer needed
		--[[
			 This property list will be a type of string referenced items with a string value.
			 The string reference must be unique or it will/may be overriden. 
			 Being string referenced the list will be compiled chronologically, thus the list 
			 names (values) may appear unordered and random. To reorganise and arrange the list
			 alphabetically we will use pairsByKeys(). This will make it easier for the user to
			 review and select the desired item from the list.
		]]
		for key, value in pairsByKeys( list ) do
			--[[
				add item to property list
			]]	
			obs.obs_property_list_add_string( p_4, value, value ) -- add the item to the property list using a string reference with a string value
		end
	end
	 --[[
		Option list: User select a reference to be used as control to switch the timer between countup and countdown.
		This provides function options that will impact operation and behaviour.
		Changing this setting will impact on the function or end result. 
		 
		This property is referenced to trigger an onchange event listener.
	]]	
	local p_5 = obs.obs_properties_add_list( props, 'countdown_type', '<font color='.. font_dimmed ..'>Countdown Type</font>', obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT )
  	t_type = {'Specific Date & Time', 'Hours, Minutes, Seconds'} -- Add options to the list
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_5, v, i ) end -- This list is auto indexed thus have an interger reference containing a string value
	--[[
		 Text Field
	]]	
	local p_6 = obs.obs_properties_add_text( props, 'day_text', '<font color='.. font_dimmed ..'>Day Text Format</font>', obs.OBS_TEXT_DEFAULT )
	obs.obs_property_set_long_description( p_6, '\nUsed to distinguish between singular and plural days format. Use this for singular.\n' ) -- User Tip
	--[[
		 Text Field
	]]	
	local p_7 = obs.obs_properties_add_text( props, 'days_text', '<font color='.. font_dimmed ..'>Days Text Format</font>', obs.OBS_TEXT_DEFAULT )
	obs.obs_property_set_long_description( p_7, '\nUsed to distinguish between singular and plural days format. Use this for plural.\n' ) -- User Tip
  	 	--[[
		Option list: User select month reference to be used as control to set a timer for a future date.
		This provides function options that will impact on function and operation of the timer.
		Changing this setting will impact on the function or end result. 
		 
		This property is referenced to trigger an onchange event listener.
	]]	
	local p_8 = obs.obs_properties_add_list( props, 'month', '<font color='.. font_dimmed ..'>Month</font>', obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT )
  	t_type = {'Select', 'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'} -- Add options to the list
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_8, v, i ) end -- This list is auto indexed thus have an interger reference containing a string value
	--[[
		 Inerger Field
		 
		This property is referenced to trigger an onchange event listener.
	]]	
	local p_9 = obs.obs_properties_add_int( props, 'year', '<font color='.. font_dimmed ..'>Year</font>', 2022, 212021221, 1 )
 	--[[
		 Inerger Field
	]]	 	
	local p_10 = obs.obs_properties_add_int( props, 'day', '<font color='.. font_dimmed ..'>Day</font>', 1, 31, 1 )
	--[[
		 Inerger Field
	]]		
	local p_11 = obs.obs_properties_add_int( props, 'hours', '<font color='.. font_dimmed ..'>Hours</font>', 0, 23, 1 )
	obs.obs_property_int_set_suffix( p_11, ' Hours' )
	--[[
		 Inerger Field
	]]		
	local p_12 = obs.obs_properties_add_int( props, 'minutes', '<font color='.. font_dimmed ..'>Minutes</font>', 0, 59, 1 )
	obs.obs_property_int_set_suffix( p_12, ' Minutes' );
	--[[
		 Inerger Field
	]]		
	local p_13 = obs.obs_properties_add_int( props, 'seconds', '<font color='.. font_dimmed ..'>Seconds</font>', 0, 59, 1 )
	obs.obs_property_int_set_suffix( p_13, ' Seconds' );
  	 	--[[
		Option list: User select a reference to be used as control format the timer timestamp.
		This provides function options that will impact on visual feedback and does not impact any function and operation of the timer.
		Changing this setting will impact on visual feedback and not function. 
		 
		This property is referenced to trigger an onchange event listener.
	]]		
	local p_14 = obs.obs_properties_add_list( props, 'timer_format', 'Timer Format', obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT )
	t_type = {'Display full format', 'No leading zeros', 'No leading zeros, no split seconds', 'No split seconds', 'Custom Time Format'} -- Add options to the list
	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_14, v, i ) end -- This list is auto indexed thus have an interger reference containing a string value
	--[[
		 Text Field
		 
		This property is referenced to trigger an onchange event listener.
	]]	
	local p_15 = obs.obs_properties_add_text( props, 'custom_time_format', '<font color='.. font_dimmed ..'>Time Format</font>', obs.OBS_TEXT_DEFAULT )
	obs.obs_property_set_long_description( p_15, '\n Timestamp is represented by $D = day, $H = hour, $M = minute, $S = second, $F = split second.\n\n To trim leading zeros, include $T = truncate leading zeros. This will ONLY affect a format matching "$D:$H:$M:$S,$F" (00:00:00:00,00)\n' ) -- User Tip
	--[[
		 Text Field
		 
		This property is referenced to trigger an onchange event listener.
	]]	
	local p_16 = obs.obs_properties_add_text( props, 'toggle_mili_trigger', '<font color='.. font_dimmed ..'>Toggle Milliseconds</font>', obs.OBS_TEXT_DEFAULT )
	obs.obs_property_set_long_description( p_16, '\nUse format 00:00:00 ( hoursa:minutes:seconds )\n' ) -- User Tip
 	--[[
		Option list: User select a reference to be used as control to show or hide the time stamp when the timer expire.
		This provides function options that will impact visual feedback but will not impact operation and behaviour.
		Changing this setting will not impact on the function or end result. 
		 
		This property is referenced to trigger an onchange event listener.
	]]		
	local p_17 = obs.obs_properties_add_list( props, 'timer_display', 'Display', obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT )
  	t_type = {'Show expired time stamp', 'Remove expired time stamp'} -- Add options to the list
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_17, v, i ) end -- This list is auto indexed thus have an interger reference containing a string value
 	--[[
		Option list: User select <text-source> to be used as visual feedback indicating a snip of the time stamp.
		This provides function options that will impact on visual feedback to the user.
		Changing this setting will not impact on the function or end result. 
	]]
	local p_18 = obs.obs_properties_add_list( props, 'split_source', '<i>Split Source</i>', obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING )
	obs.obs_property_list_add_string( p_18, 'Select', 'select' )  -- Adds a default option to the list. First (top-most) list item. If selected the option is ignored. 
	list = {} -- Reset / clear a defined table variable to be used to build lists that will be passed to the property list
	if sources ~= nil then
		for _, source in ipairs( sources ) do
			source_id = obs.obs_source_get_unversioned_id( source ) -- unversioned_id will not be affected by language settings
			if source_id == 'text_gdiplus' or source_id == 'text_ft2_source' then -- identify text type sources only
				local name = obs.obs_source_get_name( source )
			
				if not in_table( {timer_source, active_source, media['note_source_caution'], media['note_source_warning']}, name ) then
					--[[
						add it to list so that it can be reordered
					]]		
					list[name] = name
				else
					--continue 
				end
			end
		end
			obs.bfree(source) -- free memory, release source as it is no longer needed
		--[[
			 This property list will be a type of string referenced items with a string value.
			 The string reference must be unique or it will/may be overriden. 
			 Being string referenced the list will be compiled chronologically, thus the list 
			 names (values) may appear unordered and random. To reorganise and arrange the list
			 alphabetically we will use pairsByKeys(). This will make it easier for the user to
			 review and select the desired item from the list.
		]]		
		for key, value in pairsByKeys(list) do
			--[[
				add item to property list
			]]	
			obs.obs_property_list_add_string( p_18, value, value )
		end
	end	
  	
	local p_19 = obs.obs_properties_add_list( props, 'split_type', 'Split Type', obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT )
  	t_type = {'Interval', 'Mark', 'Mark Interval', 'Interval Mark'} -- Add options to the list
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_19, v, i ) end -- This list is auto indexed thus have an interger reference containing a string value
	obs.obs_property_set_long_description( p_19, '\nInterval = Time between current and previous split.\n\nMark = Time of split\n' ) -- User Tip
	 	--[[
		Option list: User select to show or hide available features.
		This provides UI layout options to enhance the user experience.
		Changing this setting does not impact any function or result. 
		 
		This property is referenced to trigger an onchange event listener.
	]]	
	local p_20 = obs.obs_properties_add_list( props, 'trigger_options', '<font color='.. font_dimmed ..'><b>Trigger Options</b></font>', obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT )
	 t_type = {'Hidden', 'Expanded'} -- Add options to the list
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_20, v, i ) end -- This list is auto indexed thus have an interger reference containing a string value
	obs.obs_property_set_long_description( p_20, '\nExpand or hide additional options triggered by time stamps.\n' ) -- User Tip
	--[[
		 Text Field
	]]	
	local p_21 = obs.obs_properties_add_text( props, 'text_caution', '<font color='.. font_dimmed ..'>Caution Time</font>', obs.OBS_TEXT_DEFAULT )
	obs.obs_property_set_long_description( p_21, '\nUse format 00:00:00 ( hoursa:minutes:seconds )\n' ) -- User Tip
	--[[
		 Text Field
	]]	
	local p_22 = obs.obs_properties_add_text( props, 'text_warning', '<font color='.. font_dimmed ..'>Warning Time</font>', obs.OBS_TEXT_DEFAULT )
	obs.obs_property_set_long_description( p_22, '\nUse format 00:00:00 ( hoursa:minutes:seconds )\n' ) -- User Tip
  	 --[[
		Option list: User select <media-source> to be used as audio visual at a defined time.
		This provides function options that will impact on audio visual feedback to the user.
		Changing this setting will impact on a function or end result. 
	]]	
	local p_23 = obs.obs_properties_add_list( props, 'audio_caution', '<font color='.. font_dimmed ..'>Caution Audio</font>', obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING )
	obs.obs_property_set_long_description( p_23, '\nSelect available media source to activate on defined time stamp.\n' ) -- User Tip
	obs.obs_property_list_add_string( p_23, 'None', 'none' ) -- Add options to the list
	if sources ~= nil then
		for _, source in ipairs( sources ) do
			source_id = obs.obs_source_get_unversioned_id( source ) -- unversioned_id will not be affected by language settings
			if source_id == 'ffmpeg_source' then -- identify media type sources only
				local name = obs.obs_source_get_name( source )
				obs.obs_property_list_add_string( p_23, name, name )
			end
		end
			obs.bfree(source) -- free memory, release source as it is no longer needed
	end	
  	 --[[
		Option list: User select <media-source> to be used as audio visual at a defined time.
		This provides function options that will impact on audio visual feedback to the user.
		Changing this setting will impact on a function or end result. 
	]]	
	local p_24 = obs.obs_properties_add_list( props, 'audio_warning', '<font color='.. font_dimmed ..'>Warning Audio</font>', obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING )
	obs.obs_property_set_long_description( p_24, '\nSelect available media source to activate on defined time stamp.\n' ) -- User Tip
	obs.obs_property_list_add_string( p_24, 'None', 'none' ) -- Add options to the list
	if sources ~= nil then
		for _, source in ipairs( sources ) do
			source_id = obs.obs_source_get_unversioned_id( source ) -- unversioned_id will not be affected by language settings
			if source_id == 'ffmpeg_source' then -- identify media type sources only
				local name = obs.obs_source_get_name( source )
				obs.obs_property_list_add_string( p_24, name, name )
			end
		end
			obs.bfree(source) -- free memory, release source as it is no longer needed
	end	
  	 --[[
		Option list: User select a reference to be used as control to enable a time limit for media playback.
		This provides function options that will impact on audio visual feedback and does impact a function and operation of the timer.
		Changing this setting will impact on audio visual feedback and function. 
		 
		This property is referenced to trigger an onchange event listener.
	]]		
	local p_25 = obs.obs_properties_add_list( props, 'media_playback_limit', '<i>Media Playback Limit</i>', obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT )
	 t_type = {'Disabled', 'Enabled'} -- Add options to the list
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_25, v, i ) end -- This list is auto indexed thus have an interger reference containing a string value
	obs.obs_property_set_long_description( p_25, '\nSet a maximum time limit for media playback.\n' ) -- User Tip
	
	--*props, *name, *description, min, max, step
	obs.obs_properties_add_int_slider( props, 'duration_caution', 'Caution Duration', 1, 10800, 1 )
	obs.obs_properties_add_int_slider( props, 'duration_warning', 'Warning Duration', 1, 10800, 1 )
	obs.obs_properties_add_color( props, 'normal_color', 'Normal Color' )
	obs.obs_properties_add_color( props, 'color_caution', 'Caution Color' )
	obs.obs_properties_add_color( props, 'color_warning', 'Warning Color' )
  	 --[[
		Option list: User select a reference to be used as control to enable text notice for the two time triggers.
		This provides UI layout options to expand feature options.
		Changing this setting will impact on UI and feature options. 
		 
		This property is referenced to trigger an onchange event listener.
	]]	
	local p_26 = obs.obs_properties_add_list( props, 'trigger_text', '<i>Trigger Text</i>', obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT )
	 t_type = {'Disabled', 'Enabled'} -- Add options to the list
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_26, v, i ) end -- This list is auto indexed thus have an interger reference containing a string value
	obs.obs_property_set_long_description( p_26, '\nDisplay a note when the timer trigger warning and caution states.\n' ) -- User Tip
	 --[[
		Option list: User select <text-source> to be used as visual feedback indicating a message at a determined time of the timer.
		This provides function options that will impact on visual feedback to the user.
		Changing this setting will not impact on the function or end result. 
	]]
	local p_27 = obs.obs_properties_add_list( props, 'note_source_caution', '<i>Caution Note Source</i>', obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING )
	obs.obs_property_list_add_string( p_27, 'Select', 'select' )  -- Adds a default option to the list. First (top-most) list item. If selected the option is ignored. 
	list = {} -- Reset / clear a defined table variable to be used to build lists that will be passed to the property list
	if sources ~= nil then
		for _, source in ipairs( sources ) do
			source_id = obs.obs_source_get_unversioned_id( source ) -- unversioned_id will not be affected by language settings
			if source_id == 'text_gdiplus' or source_id == 'text_ft2_source' then -- identify text type sources only
				local name = obs.obs_source_get_name( source )
				if not in_table( {timer_source, split_source, active_source, media['note_source_warning']}, name ) then
					--[[
						add it to list so that it can be reordered
					]]		
					list[name] = name
				else
					--continue 
				end
			end
		end
			obs.bfree(source) -- free memory, release source as it is no longer needed
		--[[
			 This property list will be a type of string referenced items with a string value.
			 The string reference must be unique or it will/may be overriden. 
			 Being string referenced the list will be compiled chronologically, thus the list 
			 names (values) may appear unordered and random. To reorganise and arrange the list
			 alphabetically we will use pairsByKeys(). This will make it easier for the user to
			 review and select the desired item from the list.
		]]	
		for key, value in pairsByKeys( list ) do
			--[[
				add item to property list
			]]	
			obs.obs_property_list_add_string( p_27, value, value )
		end
	end
	 --[[
		Option list: User select <text-source> to be used as visual feedback indicating a message at a determined time of the timer.
		This provides function options that will impact on visual feedback to the user.
		Changing this setting will not impact on the function or end result. 
	]]	
	local p_28 = obs.obs_properties_add_list( props, 'note_source_warning', '<i>Warning Note Source</i>', obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING )
	obs.obs_property_list_add_string( p_28, 'Select', 'select' )  -- Adds a default option to the list. First (top-most) list item. If selected the option is ignored. 
	list = {} -- Reset / clear a defined table variable to be used to build lists that will be passed to the property list
	if sources ~= nil then
		for _, source in ipairs( sources ) do
			source_id = obs.obs_source_get_unversioned_id( source ) -- unversioned_id will not be affected by language settings
			if source_id == 'text_gdiplus' or source_id == 'text_ft2_source' then -- identify text type sources only
				local name = obs.obs_source_get_name( source )
				if not in_table( {timer_source, split_source, active_source, media['note_source_caution']}, name ) then
					--[[
						add it to list so that it can be reordered
					]]		
					list[name] = name
				else
					--continue 
				end
			end
		end
			obs.bfree( source ) -- free memory, release source as it is no longer needed
		--[[
			 This property list will be a type of string referenced items with a string value.
			 The string reference must be unique or it will/may be overriden. 
			 Being string referenced the list will be compiled chronologically, thus the list 
			 names (values) may appear unordered and random. To reorganise and arrange the list
			 alphabetically we will use pairsByKeys(). This will make it easier for the user to
			 review and select the desired item from the list.
		]]			
		for key, value in pairsByKeys( list ) do
			--[[
				add item to property list
			]]	
			obs.obs_property_list_add_string( p_28, value, value ) -- Add options to the list
		end
	end	
	--[[
		 Text Field
	]]	
	local p_29 = obs.obs_properties_add_text( props, 'note_caution', '<font color='.. font_dimmed ..'>Caution Note</font>', obs.OBS_TEXT_DEFAULT )
	obs.obs_property_set_long_description( p_29, '\nDisplay a note when the caution trigger.\n' ) -- User Tip
	--[[
		 Text Field
	]]	
	local p_30 = obs.obs_properties_add_text( props, 'note_warning', '<font color='.. font_dimmed ..'>Warning Note</font>', obs.OBS_TEXT_DEFAULT )
	obs.obs_property_set_long_description( p_30, '\nDisplay a note when the warning trigger.\n' ) -- User Tip
	--[[
		Option list: User select a reference to be used as control to enable an auto start recording feature.
		This provides function options to change a function behaviour.
		Changing this setting will impact on features and operation. 
		 
		This property is referenced to trigger an onchange event listener.
	]]
	local p_31 = obs.obs_properties_add_list( props, 'start_recording', 'Auto Recording', obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT )
	obs.obs_property_set_long_description( p_31, '\nEnable recording options\n' ) -- User Tip
	t_type = {'Yes', 'No'} -- Add options to the list
	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_31, v, i ) end -- This list is auto indexed thus have an interger reference containing a string value
	-- Combo list filled with the options from _type
  	
	local p_32 = obs.obs_properties_add_list( props, 'recording_type', 'Recording', obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT )
	obs.obs_property_set_long_description( p_32, '\nSelect whne to start recording\n' ) -- User Tip
  	t_type = {'Timer Expires', 'Caution Time', 'Warning Time', 'Timer Visible', 'Timer Start'} -- Add options to the list
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_32, v, i ) end -- This list is auto indexed thus have an interger reference containing a string value	
	--[[
		 Text Field
	]]
	local p_33 = obs.obs_properties_add_text( props, 'text_prefix', '<font color=#fefceb>Timer Prefix</font>', obs.OBS_TEXT_DEFAULT )
	obs.obs_property_set_long_description( p_33, '\nDefine text placed before the Timer\n' ) -- User Tip
	--[[
		 Text Field
	]]
	local p_34 = obs.obs_properties_add_text( props, 'text_suffix', '<font color=#fefceb>Timer Suffix</font>', obs.OBS_TEXT_DEFAULT )
	obs.obs_property_set_long_description( p_34, '\nDefine text placed after the Timer\n' ) -- User Tip
  	--[[
		Option list: User select <text-source> to be used as visual feedback indicating a source name that is targeted.
		This provides function options that will impact on visual feedback to the user.
		Changing this setting will impact on the function or end result. 
	]]	  	
	local p_35 = obs.obs_properties_add_list( props, 'active_source', '<i>Active Source</i>', obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING )
	obs.obs_property_set_long_description( p_35, '\nSelect a text source, that will be used to show the name for the current active Source or Scene\n' ) -- User Tip
	obs.obs_property_list_add_string( p_35, 'Select', 'select' )  -- Adds a default option to the list. First (top-most) list item. If selected the option is ignored. 
	list = {} -- Reset / clear a defined table variable to be used to build lists that will be passed to the property list
	if sources ~= nil then
		for _, source in ipairs( sources ) do
			source_id = obs.obs_source_get_unversioned_id( source ) -- unversioned_id will not be affected by language settings
			if source_id == 'text_gdiplus' or source_id == 'text_ft2_source' then -- identify text type sources only
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
			obs.bfree(source) -- free memory, release source as it is no longer needed
		--[[
			 This property list will be a type of string referenced items with a string value.
			 The string reference must be unique or it will/may be overriden. 
			 Being string referenced the list will be compiled chronologically, thus the list 
			 names (values) may appear unordered and random. To reorganise and arrange the list
			 alphabetically we will use pairsByKeys(). This will make it easier for the user to
			 review and select the desired item from the list.
		]]	
		for key, value in pairsByKeys( list ) do
			--[[
				add item to property list
			]]	
			obs.obs_property_list_add_string( p_35, value, value ) -- Add options to the list
		end
	end
	
  	 --[[
		Option list: User select a reference to be used as control to enable an action que task once the timer expires.
		This provides function options to change a function behaviour.
		Changing this setting will impact on features and operation. 
		 
		This property is referenced to trigger an onchange event listener.
	]]	
	local p_36 = obs.obs_properties_add_list( props, 'next_scene', '<i>Next Scene</i>', obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING )
	obs.obs_property_set_long_description( p_36, '\nDefine what happens afater timer ends\n' ) -- User Tip
	t_type = {'Select', 'TIMER END TEXT', 'Source List', 'Scene List'} -- Add options to the list
	for i,v in ipairs( t_type ) do 
	obs.obs_property_list_add_string( p_36, v, v ) -- Add options to the list 
	end
	 --[[
		Adding a scene to become active once the timer expires is a feature included
		This will collect available scene names and list them for the user to choose from. 
		The scene names will be added into the existing option list.
	]]	
	local scenes = obs.obs_frontend_get_scene_names()
	if scenes ~= nil then
		for i, scene in ipairs( scenes ) do
			obs.obs_property_list_add_string( p_36, scene, scene ) -- Add options to the list
		end
		obs.bfree( scene ) -- free memory, release source as it is no longer needed
	end
	--[[
		 Text Field
	]]
	local p_37 = obs.obs_properties_add_text( props, 'stop_text', '<font color=#fef1eb>Timer End Text</font>', obs.OBS_TEXT_DEFAULT )
	obs.obs_property_set_long_description( p_37, '\nDefine text displayed when timer ended\n' ) -- User Tip
	 --[[
		Editable Option list: User adds a text name as an entry used as a reference to be used as inditification of a source.
		This provides function options to change feature behaviour.
		Changing this setting will impact on feature options and behaviour. 
	]]	
	local p_38 = obs.obs_properties_add_editable_list( props, 'cycle_list', 'Cycle List', obs.OBS_EDITABLE_LIST_TYPE_STRINGS, nil, nil )
	
	 --[[
		Option list: User select a reference to be used as control to determine a cycling direction.
		This provides function options to change feature behaviour.
		Changing this setting will impact on feature options. 
	]]
	local p_39 = obs.obs_properties_add_list( props, 'cycle_direction', '<i>Cycle Direction</i>', obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT )
	 t_type = {'Ascending', 'Descending'} -- Add options to the list
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_39, v, i ) end -- This list is auto indexed thus have an interger reference containing a string value
	obs.obs_property_set_long_description( p_39, '\nSelect the rotation direction of lists.\n' ) -- User Tip
	 --[[
		Wrap and group properties together.
		Thise group provides options to the user to define a custom time value used as a start point for a stopwatch to continue from
	]]		
	local group_props_1 = obs.obs_properties_create()
	obs.obs_properties_add_group( props, '_group_1', 'Stopwatch Start Point', obs.OBS_GROUP_NORMAL, group_props_1 )
	local p_40 = obs.obs_properties_add_int( group_props_1, 'sw_hours_saved', 'HH', 0, 23, 1)
	local p_41 = obs.obs_properties_add_int( group_props_1, 'sw_minutes_saved', 'MM', 0, 59, 1)
	local p_42 = obs.obs_properties_add_int( group_props_1, 'sw_seconds_saved', 'SS', 0, 59, 1)
	local p_43 = obs.obs_properties_add_int( group_props_1, 'sw_milliseconds_saved', 'FF', 0, 99, 1)
	local p_44 = obs.obs_properties_add_bool( group_props_1, 'load_saved_time', 'Load last saved time on startup' )
	local p_45 = obs.obs_properties_add_button( group_props_1, 'sw_button', 'Set', sw_saved_button_clicked )
	--[[
		Hidden Value
		We save last count in the properties for when OBS shuts down and starts again
	]]
	local p_46 = obs.obs_properties_add_float( group_props_1, 'sw_cur_seconds', 'Saved Seconds', 0, 3600000000, 0.1)
	obs.obs_property_set_visible( p_46 , true)
	 --[[
		Property Button: User interaction that will start, pause or stop a timer.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]	
	local p_47 = obs.obs_properties_add_button( props, 'pause_button', 'Start', pause_button_clicked )
	 --[[
		Property Button: User interaction that will mark a timer timestamp.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour. 
	]]		
	obs.obs_properties_add_button( props, 'split_button', 'Split Time', split_button_clicked )
	 --[[
		Property Button: User interaction that will start, pause or stop a timer.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
		 
		This property is referenced to trigger an onchange event listener.
	]]
	local p_48 = obs.obs_properties_add_button( props, 'mili_button', 'Show Milliseconds', mili_button_clicked )
	 --[[
		Property Button: User interaction that will reset a timer.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]
	local p_49 = obs.obs_properties_add_button( props, 'reset_button', 'Reset Stopwatch', reset_button_clicked )	
	 --[[
		Property Checkbox: User interaction that enable setting a custom stopwatch start timestamp.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
		 
		This property is referenced to trigger an onchange event listener.
	]]
	local p_50 = obs.obs_properties_add_bool( props, 'set_stopwatch', 'Set Stopwatch' )	
	 --[[
		Property Checkbox: User interaction that will start timer if timer source becomes visible.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]
    obs.obs_properties_add_bool( props, 'start_on_visible', 'Start Timer on Source Visible' )
	 --[[
		Property Checkbox: User interaction that will start timer if scene with timer source becomes active.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]
    obs.obs_properties_add_bool( props, 'start_on_scene_active', 'Start Timer on Scene Active' )
	 --[[
		Property Checkbox: User interaction that toggle active source visibility.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]
    obs.obs_properties_add_bool( props, 'active_source_force_visible', 'Toggle Active Source Visibility' )
	 --[[
		Property Checkbox: User interaction that will disable the plugin.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]
    obs.obs_properties_add_bool( props, 'disable_script', 'Disable Script' )
	 --[[
		Property Checkbox: User interaction that will enable backup options.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
		 
		This property is referenced to trigger an onchange event listener.
	]]
	local p_51 = obs.obs_properties_add_bool( props, 'backup_mode', 'Backup Mode' )
	 --[[
		Property Directory Path: User interaction that select a directory path.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
		 
		This property is referenced to trigger an onchange event listener.
	]]
	local p_52 = obs.obs_properties_add_path( props, 'backup_folder', 'Backup Folder', obs.OBS_PATH_DIRECTORY, nil, nil)
	--[[
		Property list: User interaction that will execute an import feature.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
		 
		This property is referenced to trigger an onchange event listener.
	]]
	local p_53 = obs.obs_properties_add_list( props, 'import_list', '<i>Load Settings</i>', obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING )
	obs.obs_property_list_add_string( p_53, 'Select ', 'select' ) -- Adds a default option to the list. First (top-most) list item. If selected the option is ignored. 
	obs.obs_property_set_long_description( p_53, '\nSelect the Settings file to import.\n' ) -- User Tip
	local filenames = get_filenames( path, '.json' ) -- list all files of type
	if table.getn( filenames ) > 0 then
  		for i,v in pairs( filenames ) do 
			obs.obs_property_list_add_string( p_53, v, v ) -- Add options to the list
		end
	end
	--[[
		Property Button: User interaction that will export all property settings to a json file.
		This provides function interaction to change feature behaviour.
		Interacting with this property will complete a feature task. 
	]]
	local p_54 = obs.obs_properties_add_button( props, 'export_button', 'Export Settings', export_button_clicked )
	 --[[
		Property Button: User interaction that will import available property settings from a json file
		and apply them to the properties.
		This provides function interaction to change feature behaviour.
		Interacting with this property will complete a feature task. 
		 
		This property is referenced to trigger an onchange event listener.
	]]
	local p_55 = obs.obs_properties_add_button( props, 'import_button', 'Import Settings', import_button_clicked )
	
	obs.source_list_release( sources ) -- free memory, release sources as it is no longer needed
	--[[ 
		Callback definitions used to check for user interaction or property changes.
		Event Listener
		Each entry provides a callback to a referenced proeprty along with a target callback handler
		]]--
  	obs.obs_property_set_modified_callback( p_1, property_onchange )		-- timer_type
  	obs.obs_property_set_modified_callback( p_2, property_onchange )		-- config
	obs.obs_property_set_modified_callback( p_3, property_onchange )		-- timer_options
  	obs.obs_property_set_modified_callback( p_5, property_onchange )		-- countdown_type
  	obs.obs_property_set_modified_callback( p_8, property_onchange )		-- month
  	obs.obs_property_set_modified_callback( p_9, property_onchange )		-- year
  	obs.obs_property_set_modified_callback( p_14, property_onchange )		-- timer_format
  	obs.obs_property_set_modified_callback( p_15, property_onchange )		-- custom_time_format
  	obs.obs_property_set_modified_callback( p_16, property_onchange )		-- toggle_mili_trigger
	obs.obs_property_set_modified_callback( p_17, property_onchange )		-- timer_display
	obs.obs_property_set_modified_callback( p_20, property_onchange )		-- trigger_options
	obs.obs_property_set_modified_callback( p_25, property_onchange )		-- media_playback_limit
  	obs.obs_property_set_modified_callback( p_26, property_onchange )		-- trigger_text
  	obs.obs_property_set_modified_callback( p_31, property_onchange )		-- start_recording
  	obs.obs_property_set_modified_callback( p_35, property_onchange )		-- active_source
  	obs.obs_property_set_modified_callback( p_36, property_onchange )		-- next_scene
	obs.obs_property_set_modified_callback( p_50, property_onchange )		-- set_stopwatch
	obs.obs_property_set_modified_callback( p_51, property_onchange )		-- backup_mode
	obs.obs_property_set_modified_callback( p_52, property_onchange )		-- backup_folder
	obs.obs_property_set_modified_callback( p_53, property_onchange )		-- import_list
	obs.obs_property_set_modified_callback( p_55, import_properties )		-- import_button
	-- Calls the callback once to set-up current visibility
  	obs.obs_properties_apply_settings( props, script_settings )
	return props
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	A function named script_update will be called when settings are changed
	
	Credit:			

	Modified:		

	function:		Called upon settings initialization and modification
	type:			
	input type: 	
	returns:
----------------------------------------------------------------------------------------------------------------------------------------
]]
function script_update( settings )
	--[[
		Get the correct frequency for splitseconds when the script loads. 
	]]
	assign_default_frequency()
	--[[
		load any property values available to globals
	]]
	load_settings_globals( settings )
	
	activate( false )

	reset_mili()
	-- Keep track of current settings
  	script_settings = settings 	
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	A function named script_defaults will be called to set the default settings
	
	Credit:			

	Modified:		

	function:		Called when the script is started for the first time or when the script settings 
					is set to default
	type:			settings
	input type: 	Called when the Script is loaded thr first time or 
	returns:		None
----------------------------------------------------------------------------------------------------------------------------------------
]]
function script_defaults( settings )
	--[[
		Get the correct frequency for splitseconds when the script loads. 
	]]
	assign_default_frequency()
	--[[
		Set property value by provided property reference.
	
		Set property INTEGER TYPES.  
	]]
	obs.obs_data_set_default_int( settings, 'hours', 0 )
	obs.obs_data_set_default_int( settings, 'config', 1 )
	obs.obs_data_set_default_int( settings, 'minutes', 0 )
	obs.obs_data_set_default_int( settings, 'seconds', 0 )
	obs.obs_data_set_default_int( settings, 'split_type', 2 )
	obs.obs_data_set_default_int( settings, 'timer_type', 1 )
	obs.obs_data_set_default_int( settings, 'trigger_text', 1 )
	obs.obs_data_set_default_int( settings, 'timer_format', 1 )
	obs.obs_data_set_default_int( settings, 'timer_display', 1 )
	obs.obs_data_set_default_int( settings, 'timer_options', 1 )
	obs.obs_data_set_default_int( settings, 'countdown_type', 2 )
	obs.obs_data_set_default_int( settings, 'recording_type', 5 )
	obs.obs_data_set_default_int( settings, 'cycle_direction', 1 )
	obs.obs_data_set_default_int( settings, 'start_recording', 2 )
	obs.obs_data_set_default_int( settings, 'duration_caution', 5 )
	obs.obs_data_set_default_int( settings, 'duration_warning', 5 )
	obs.obs_data_set_default_int( settings, 'media_playback_limit', 1 )
	obs.obs_data_set_default_int( group_props_1, 'sw_hours_saved', 0 )
	obs.obs_data_set_default_int( group_props_1, 'sw_minutes_saved', 0 )
	obs.obs_data_set_default_int( group_props_1, 'sw_seconds_saved', 0 )
	obs.obs_data_set_default_int( group_props_1, 'sw_milliseconds_saved', 0 )
	obs.obs_data_set_default_int( settings, 'year', os.date('%Y', os.time()) )
	obs.obs_data_set_default_int( settings, 'normal_color', media['normal_color'] )
	obs.obs_data_set_default_int( settings, 'color_caution', media['color_caution'] )
	obs.obs_data_set_default_int( settings, 'color_warning', media['color_warning'] )
	--[[
		Set property STRING TYPES. 
	]]
	obs.obs_data_set_default_string( settings, 'stop_text', '' )
	obs.obs_data_set_default_string( settings, 'text_prefix', '' )
	obs.obs_data_set_default_string( settings, 'text_suffix', '' )
	obs.obs_data_set_default_string( settings, 'note_caution', '' )
	obs.obs_data_set_default_string( settings, 'note_warning', '' )
	obs.obs_data_set_default_string( settings, 'text_warning', '' )
	obs.obs_data_set_default_string( settings, 'text_caution', '' )
	obs.obs_data_set_default_string( settings, 'next_scene', 'Select' )
	obs.obs_data_set_default_string( settings, 'day_text', '# Day \n' )
	obs.obs_data_set_default_string( settings, 'audio_warning', 'None' )
	obs.obs_data_set_default_string( settings, 'audio_caution', 'None' )
	obs.obs_data_set_default_string( settings, 'days_text', '# Days \n' )
	obs.obs_data_set_default_string( settings, 'split_source', 'Select' )
	obs.obs_data_set_default_string( settings, 'timer_source', 'Select' )
	obs.obs_data_set_default_string( settings, 'toggle_mili_trigger', '' )
	obs.obs_data_set_default_string( settings, 'note_source_caution', 'Select' )
	obs.obs_data_set_default_string( settings, 'note_source_warning', 'Select' )
	obs.obs_data_set_default_string( settings, 'custom_time_format', '$T$D:$H:$M:$S,$F' )
	--[[
		Set property BOOL TYPES. 
	]]
	obs.obs_data_set_default_bool( settings, 'backup_mode', false )
	obs.obs_data_set_default_bool( settings, 'set_stopwatch', false )
	obs.obs_data_set_default_bool( settings, 'disable_script', false )
	obs.obs_data_set_default_bool( settings, 'load_saved_time', false )
	obs.obs_data_set_default_bool( settings, 'start_on_visible', false )
	obs.obs_data_set_default_bool( settings, 'start_on_scene_active', false )
	obs.obs_data_set_default_bool( settings, 'active_source_force_visible', false )
	-- Keep track of current settings
  	script_settings = settings 
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:		A function named script_save will be called when the script is saved
						NOTE: This function is usually used for saving extra data ( such as in this
						case, a hotkey's save data ).  Settings set via the properties are saved
						automatically.
	
	Credit:			

	Modified:		

	function:			Called when script is saved
	type:				OBS
	input type: 		settings
	returns:			none
----------------------------------------------------------------------------------------------------------------------------------------
]]
function script_save( settings )
	--[[
		script save
		
		Reset (Timer)
	]]	
	local hotkey_save_array_reset = obs.obs_hotkey_save( hotkey_id_reset )
	obs.obs_data_set_array( settings, 'reset_hotkey', hotkey_save_array_reset )
	obs.obs_data_array_release( hotkey_save_array_reset )
	
	--[[
		script save
		
		Pause (Start/Pause Timer)
	]]	
	local hotkey_save_array_pause = obs.obs_hotkey_save( hotkey_id_pause )
	obs.obs_data_set_array( settings, 'pause_hotkey', hotkey_save_array_pause )
	obs.obs_data_array_release( hotkey_save_array_pause )
	--[[
		script save
		
		Split (available for stopwatch only)
	]]	
	local hotkey_save_array_split = obs.obs_hotkey_save( hotkey_id_split )
	obs.obs_data_set_array( settings, 'split_hotkey', hotkey_save_array_split )
	obs.obs_data_array_release( hotkey_save_array_split )
	--[[
		script is loading. register and assign hotkeys 
		
		script save
	]]
	local hotkey_save_array_mili = obs.obs_hotkey_save( hotkey_id_mili )
	obs.obs_data_set_array( settings, 'mili_hotkey', hotkey_save_array_mili )
	obs.obs_data_array_release( hotkey_save_array_mili )
end	
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	
	Description:	a function named script_load will be called on startup	
					Connect hotkey and activation/deactivation signal callbacks
					--
					NOTE: These particular script callbacks do not necessarily have to
					be disconnected, as callbacks will automatically destroy themselves
					if the script is unloaded.  So there's no real need to manually
					disconnect callbacks that are intended to last until the script is
					unloaded.
	Credit:			

	Modified:		

	function:		Called when OBS is launched or the script is added
	type:			OBS
	input type: 	settings
	returns:		none
----------------------------------------------------------------------------------------------------------------------------------------
]]
function script_load( settings )
	--[[
		Get the correct frequency for splitseconds when the script loads. 
	]]
	assign_default_frequency()
	local sh = obs.obs_get_signal_handler()
	--[[
		attach event listener callback [connect_source_signal]
		for when a source is done loading.
	]]	
	obs.signal_handler_connect( sh, 'source_load', connect_source_signal ) -- monitor for source load completed
	obs.signal_handler_connect( sh, 'source_activate', source_activated ) -- monitor source activates
	obs.signal_handler_connect( sh, 'source_deactivate', source_deactivated ) -- monitor source deactivates
	--[[
		script is loading. register and assign hotkeys 
		
		Reset (Timer)
	]]		
	hotkey_id_reset = obs.obs_hotkey_register_frontend( 'timer_reset_' .. filename():lower():gsub('[%W%p%c%s]', ''), 'Reset ' .. filename(), reset )
	local hotkey_save_array_reset = obs.obs_data_get_array( settings, 'reset_hotkey' )
	obs.obs_hotkey_load( hotkey_id_reset, hotkey_save_array_reset )
	obs.obs_data_array_release( hotkey_save_array_reset )
	--[[
		script is loading. register and assign hotkeys 
		
		Pause (Start/Pause Timer)
	]]	
	hotkey_id_pause = obs.obs_hotkey_register_frontend( 'timer_pause_' .. filename():lower():gsub('[%W%p%c%s]', ''), 'Start/Pause ' .. filename(), on_pause )
	local hotkey_save_array_pause = obs.obs_data_get_array( settings, 'pause_hotkey' )
	obs.obs_hotkey_load( hotkey_id_pause, hotkey_save_array_pause )
	obs.obs_data_array_release( hotkey_save_array_pause )
	--[[
		script is loading. register and assign hotkeys 
		
		Split (available for stopwatch only)
	]]	
	hotkey_id_split = obs.obs_hotkey_register_frontend( 'timer_split_' .. filename():lower():gsub('[%W%p%c%s]', ''), 'Split Time ' .. filename(), on_split )
	local hotkey_save_array_split = obs.obs_data_get_array( settings, 'split_hotkey' )
	obs.obs_hotkey_load( hotkey_id_split, hotkey_save_array_split )
	obs.obs_data_array_release( hotkey_save_array_split )
	--[[
		script is loading. register and assign hotkeys 
		
		Milliseconds (Show/Hide Timer Milliseconds if in Timer format)
	]]	
	hotkey_id_mili = obs.obs_hotkey_register_frontend( 'timer_mili_' .. filename():lower():gsub('[%W%p%c%s]', ''), 'Milliseconds Toggle ' .. filename(), mili_toggle )	
	local hotkey_save_array_mili = obs.obs_data_get_array( settings, 'mili_hotkey' )
	obs.obs_hotkey_load( hotkey_id_mili, hotkey_save_array_mili )
	obs.obs_data_array_release( hotkey_save_array_mili )
	--[[
		load any property values available to globals
	]]
	load_settings_globals( settings )
	--[[
		if timer is stopwatch and if user has not enabled save of last time
		we will reset the timer to default state (zero)
	]]
	if timer_type == 1 then
		if load_saved_time then
			timer_value( sw_cur_seconds, false ) -- value, update_settings 
		else
			timer_value( 0, false ) -- value, update_settings 
			reset( true )	
		end	
	else
		reset( true )	
	end	
end