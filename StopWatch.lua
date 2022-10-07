--[[
----------------------------------------------------------------------------------------------------------------------------------------
Open Broadcaster Software®️
OBS > Tools > Scripts
@midnight-studios
Stopwatch

***************************************************************************************************************************************

Version 4.2

Published / Released: 2022-10.07 18:34

NEW FEATURES

- 

OPTIMIZATION

- 

USER EXPERIENCE & FEATURE ENHANCEMENTS

- Changed Property Setting label 'Trigger Text' to 'Marker Notes'


BUGS

- Reverted and applied new Fix for timer Reset issue
- Fixed an issue for recording call when recording is already active
- Fixed switching "split type" does not reset the timer display
- Fixed changing "Mark Time" does not reset the timer display
- Fixed timer display color reset after Mark A & B conditions were met
- Fixed stopping Media playback if media is set to loop when the timer expires
- Fixed a routine issue on sources loaded
- Fixed a timer reset issue (for activate timer on visible)
- Fixed a load 'last saved time' issue (for activate timer on visible)
- Fixed a 'set stopwatch' issue (for activate timer on visible)

***************************************************************************************************************************************

Version 4.1

Published / Released: 2022-10.06 15:23

NEW FEATURES

- 

OPTIMIZATION

- 

USER EXPERIENCE & FEATURE ENHANCEMENTS
- 

BUGS

- Fixed timer Reset issue

***************************************************************************************************************************************

Version 4.0

Published / Released: 2022-10.06 12:26

NEW FEATURES

- 

OPTIMIZATION

- Backend updates

USER EXPERIENCE & FEATURE ENHANCEMENTS
- 

BUGS

- Fixed a signal handler crash due to an unloaded source
- Fixed a bug that triggered the Media when the timer was not active

***************************************************************************************************************************************

Version 3.9

Published / Released: 2022-10.10 15:15

NEW FEATURES

- Added button Show / Hide Milliseconds
- Added Time Stamp trigger for Show / Hide Milliseconds
- Added Timer text output options (Still not convinvinced this makes sense)
- Added Hotkey for Show / Hide Milliseconds
- Pause Media if timer is paused
- Added option to force visibility of the "Active Source"

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
- Fixed Split time outputs for Stopwatch

***************************************************************************************************************************************
TODO> 

- Testing
- No tasks outstanding 

TESTING REPORT:

PROPERTIES UI TEST:

- Advanced Basic swicth hides and shows features																				not tested
- Timer Settings visible in advanced mode																						not tested
- Marker Settings visible in advanced mode																						not tested


HOTKEY
	
- Hotkeys work on duplicated script:																							not tested
- Hotkeys work for Start / Pause Timer:																							not tested
- Hotkeys work for Reset Timer:																									not tested
- Hotkeys work for Split Time:																									not tested
- Hotkeys work for Show / Hide Miliseconds:																						not tested


PROPERTIES BACKUP TEST:

- Backup options visible if enabled: 																							not tested
- Backup options hidden if disabled: 																							not tested
- if 'export settings' button activated the property settings are exported to json file:										not tested
- 'load setting' list auto update if settings refreshed																			not tested
- 'load setting' list auto update if folder is selected containing valid settings files:										not tested
- 'Import Button' becomes visible if a valid settings file is selected from the list:											not tested
- 'Import Button' becomes hidden if a valid settings file is not selected from the list:										not tested

TIMER TEST:

- 'Start Timer on Source Visible' checkbox hidden visible by config:															not tested
- 'Start Timer on Scene Active' checkbox hidden visible by config:																not tested
- 'Disable Script' checkbox by hidden visible config:																			not tested
- 'Backup Mode' checkbox by hidden visible config:																				not tested
- Timestamp prefix operational:																									not tested
- Timestamp suffix operational:																									not tested
- Timestamp Marker A text font colour operational:																				not tested
- Timestamp Marker B text font colour operational:																				not tested
- Timestamp Marker A note source select operational:																			not tested
- Timestamp Marker B note source select operational:																			not tested
- Timestamp Marker A note source text contents operational:																		not tested
- Timestamp Marker B note source text contents operational:																		not tested
- Timestamp Marker A note hides on reset:																						not tested
- Timestamp Marker B note hides on reset:																						not tested
- Timestamp Marker A media source select operational:																			not tested
- Timestamp Marker B media source select operational:																			not tested
- Marker A media pause on timer pause:																							not tested
- Marker B media pause on timer pause:																							not tested
- Marker A media unpause on timer pause:																						not tested
- Marker B media unpause on timer pause:																						not tested
- Marker A media source visibilty hidden when timer ends:																		not tested
- Marker B media source visibilty hidden when timer ends:																		not tested
- Marker A media source visibilty hidden when media ends:																		not tested
- Marker B media source visibilty hidden when media ends:																		not tested
- Media Playback limit enable / disable show hides limit sliders:																not tested
- Auto Recording expands options if enabled:																					not tested
- Auto Recording available in Countdown Mode only:																				not tested


STOPWATCH TEST:

- Stopwatch Marker A media ends if media playback limit enabled and time limit is met:											not tested
- Stopwatch Marker B media ends if media playback limit enabled and time limit is met:											not tested
- Save last timestamp: Auto loads last saved timestamp, if enabled: 															not tested
- Save last timestamp: Continue from last saved timestamp, if enabled:															not tested
- Save last timestamp: timestamp set to zero, if reset activated, if enabled:													not tested
- Save last timestamp: Cleared if feature not enabled:																			not tested 
- Save last timestamp: 'last saved' timestamp property field hidden:															not tested
- Set Stopwatch: timestamp is adjusted to defined time if set button is clicked:												not tested 	
- Set Stopwatch: Continue from set a timestamp, if enabled:																		not tested	
- Set Stopwatch: set timestamp options hidden if not enabled:																	not tested
- Set Stopwatch: set timestamp checkbox hidden if timer not stopwatch or timer settings hidden or not in advanced mode:			not tested
- 'Start Timer on Source Visible' Timer starts if text source visibility is set to visible:										not tested
- 'Start Timer on Source Visible' Timer starts if text source visibility is set to visible, from a Set time:					not tested
- Stopwatch: Timer does not auto start if text source visibility is set to visible, if disabled:								not tested
- Stopwatch: auto start if enabled for scene with timer text source is active:													not tested
- Stopwatch: start timer on scene active when enabled auto starts the timer when scene becomes active:							not tested
- Stopwatch: start timer on scene active when not enabled won't start the timer when scene becomes active:						not tested
- Stopwatch: if script is disabled the timer wont initiate:																		not tested	
- Stopwatch: timer continue on start / stop:																					not tested
- Stopwatch: on reset the timer resets:																							not tested
- Stopwatch: Marker A timestamp activation is accurate:																			not tested
- Stopwatch: Marker B timestamp activation is accurate:																			not tested
- Stopwatch: Marker A media play on timestamp:																					not tested
- Stopwatch: Marker B media play on timestamp:																					not tested
- Stopwatch: Marker A media play reset on reset:																				not tested
- Stopwatch: Marker B media play reset on reset:																				not tested
- Stopwatch: Marker A media play stops when playback limit is enabled and time limit expires:									not tested
- Stopwatch: Marker B media play stops when playback limit is enabled and time limit expires:									not tested
- Split: Selects the correct source:																							not tested
- Split: Adds new entry on button interaction:																					not tested
- Split: Inteval Setting Adds new Interval entry on button interaction:															not tested
- Split: Mark Setting Adds new Mark entry on button interaction:																not tested
- Split: Mark Inteval Setting Adds new Mark Interval entry on button interaction:												not tested
- Split: Inteval Mark Setting Adds new Inteval Mark entry on button interaction:												not tested
- Timestamp: 'Custom Format' displays correctly:																				not tested
- Timestamp: 'Display Full Format' displays correctly:																			not tested
- Timestamp: 'No leading Zeros' Format displays correctly:																		not tested
- Timestamp: 'No leading Zeros, No split seconds' Format displays correctly:													not tested
- Timestamp: 'No split seconds' Format displays correctly:																		not tested
																				

COUNTDOWN
	
- Auto Recording activates if enabled for 'Timer Starts':																		not tested
- Auto Recording activates if enabled for 'Timer Visible':																		not tested
- Auto Recording activates if enabled for 'Marker A Time':																		not tested
- Auto Recording activates if enabled for 'Marker B Time':																		not tested
- Auto Recording activates if enabled for 'Timer Expires':																		not tested
- Countdown mode Marker A media ends if media playback limit enabled and time limit is met:										not tested
- Countdown mode Marker B media ends if media playback limit enabled and time limit is met:										not tested
- Countdown timer continue on start / stop:																						not tested
- Countdown timer time updates instantly in the timer display when modified:													not tested
- Timestamp Marker A media play on timestamp:																					not tested
- Timestamp Marker B media play on timestamp:																					not tested
- 
----------------------------------------------------------------------------------------------------------------------------------------
]]
--Globals
obs           				= obslua
gversion 					= "4.2"
luafile						= "StopWatch.lua"
obsurl						= "comprehensive-stopwatch-countdown-timer.1364/"
patch_notes					= "Patch Notes"
icon="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABUAAAAVCAYAAACpF6WWAAAENElEQVQ4jY1UTUgjZxh+ksl/JuMkMYb4F40bNZqK0KJFqBZqS9ddyl76dyhdKPRQShH2sNDSnnopCz11D10KS/dSKNiDoD2I7KXFQ0XSSGpM1llFMYn5mZiMY2IymfIOhgazXfaDj5n53u975vme531fnaqqeMHxJYCvAOgAlABcAyA1jxLO1tYW1tbWoL+Kd3x8jGg0imw2C0VRWkMEYgNgBeAFYKTFRqOh7aVnE9xwFTSZTGJ7exszMzPQ6XSQZRk8z9P7YrVa/Y5hmKLBYHCpqirW63Wcn5/j7OwMHo9HA6bvNqY2mw1Op1N70qaTkxPkcjmbLMsDZrN5hOO4NxuNhlMUxTFiSCA0FEW5GQ6H/wmHwzfamDavUKlUYDKZAoFA4Gue52/r9f/9v6OjQ5uKojwpFAr3RFF8UCwWjW63OzQ/P/9yGyiBnZ6eEtN3eZ7/9XJZrlQqP2cymcf5fL4QDAbHdTrd2yzLXvd4PD9yHHdLEISFXC7nsdvtuTb3c7kcEokEJiYmhliWtaiqWs5ms4f1el0lE2lOTU0hn8/DYrF09vb23jebze9JkvRXNBqdMpvNaIJaLh1tHScAzpvsSd+joyOkUimEQiFNa4vFAlEU4Xa7HwYCgduFQuHRxsbGx5p+qqq+o/7/SF7uQSaTwcHBgZYdgiBMqKqa2dnZ8S8tLaFcLicIIR6PjzU13Qew+gzPKNEj9JJOp5tag+O41/v7+x/v7u7+sLOzc8BxHN1icXR0dMXlcn3xQhW1v7+PSCSC6enptxwOx3WWZRcbjcbTjY2NAJ1nWRYGgwHj4+OqoigFYnr/UlPlClYFwJ1arVYjU8bGxhZ8Pt9KMxiLxd5gGEbTlTSv1WqQJOmJw+G4RqCfPYfkN4qiFDs7O9HT0/Nqa4BhmKd2u10DrFaruLi4oJmncibQSUCrLHJabDlHzItGo1E7FIvFvg+FQjMmkykkCMK9eDwOivl8PvqhBspxXJAOEujfz2HazzBMdXh4OJNMJoupVGre7/cbBEGor6+vY2RkROsLlwY6jUajS5KkSGvtf0oVemUeAPiDgsFgUHMeQJ3MmZycxNzcnMZWkiT4/f67FJRl+UFrmcYB/N7y3UyLSHOBzNjb20MgEMDg4CC6urqwublJZo12d3ffVRRFEQTh4TNTqlQqaawoTShOVdOsqMPDQ8zOzmqFQK3PZrO91NPTs2U0GkmWG4lEYrWt9cViMSwvL1Ntvw9gRafT/aTX6z8AwFKcuhU5zjDMkNfr/XZgYCBKgMfHx3eSyeSqw+Fob9LEipxMp9MRp9P5uclkWuB5/hOKWa3Wvb6+vjLP8wNer5fXUkRRLkql0ofZbPY3ug019TZQ6jKU0AzD7Iqi+Josy6+4XK6P7Hb7LbvdPkS5SXpXKpU/ZVn+5ezs7FG9Xi9brVZNLr1ej38BVDs6EbSfFQsAAAAASUVORK5CYII="
desc	    				= 
[[
<hr/><center><h2>Advanced Stopwatch</h2>( Version: %s )</center>
<br><center><img width=38 height=42 src="]] .. icon .. [["/></center>
<br><center><a href="https://github.com/midnight-studios/obs-lua/blob/main/]] .. luafile ..[[">Find it on GitHub</a></center>
<center><a href="https://obsproject.com/forum/resources/]] .. obsurl ..[[updates]] .. patch_notes ..[[">Patch Notes</a></center>
<br><p>The Properties for this script will adjust visibility as needed. Some advanced properties will only be visible if the Configuration is set to "Advanced". If the Configuration is set to "Basic" the defined values will still be used, so ensure you define those correctly.</p><p>Find help on the <a href="https://obsproject.com/forum/resources/]] .. obsurl ..[[">OBS Forum Thread</a>.</p><hr/>
]]
sources_loaded 				= 0
total_sources 				= 0
sw_hours_saved 				= 0
sw_minutes_saved 			= 0
sw_seconds_saved 			= 0
sw_milliseconds_saved 		= 0
split_type   				= 2
text_prefix 				= ""
text_suffix 				= ""
last_text    				= ""
custom_time_format			= ""
timer_source   				= ""
countdown_type 				= ""
backup_folder 				= ""
import_list 				= ""
longtimetext_s 				= ""
longtimetext_p 				= ""
last_split_data 			= ""
split_source   				= ""
active_source  				= ""
next_scene					= ""
stop_text					= ""
toggle_mili_trigger			= ""
output_file_name 			= "-backup($date_stamp).json";
font_normal					= "#ffffff"
font_dimmed					= "#bfbbbf"
font_highlight				= "#fffdcf"
current_seconds   			= 0
cycle_direction				= 1
default_seconds   			= 0
split	     				= 0
timer_year	     			= 0
timer_month	     			= 0
timer_day	     			= 0
timer_hours	     			= 0
timer_minutes 	     		= 0
timer_seconds	     		= 0
timer_mode   				= 0
last_timer_mode   			= 0
timer_format				= 1
timer_display  				= 1
start_recording				= 0
media_playback_limit		= 0
recording_type				= 0
enable_marker_notes			= 1
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
timer_mode_changed 			= false
set_timer_activated			= false
color_normal_updated 		= false
activated     				= false
prevent_callback  			= false
timer_active  				= false
reset_activated				= false
start_on_visible  			= false
force_reset_on_visible		= false
active_source_force_visible	= false
start_on_scene_active		= false
disable_script   			= false
show_mili   				= true
timer_expired  				= true
mili_toggle_triggered		= false
media = {
text_marker_b				= "",
text_marker_a				= "",
source_name_audio_marker_b	= "",
source_name_audio_marker_a	= "", 
note_source_marker_a 		= "",
note_source_marker_b 		= "",
note_marker_a 				= "",
note_marker_b 				= "",
activated_marker_b			= false,
activated_marker_a			= false, 
current_seconds_marker_a	= 0,
current_seconds_marker_b	= 0, 
duration_marker_a			= 0, 
duration_marker_b			= 0, 
media_ended_marker_a		= false, 
media_ended_marker_b		= false,
color_normal				= 4294967295, -- 4294967295 0xFFFFFFFF
color_marker_a				= 4256749, -- 4256749 0x40f3ed
color_marker_b				= 329050, -- 329050 0x05055a
last_state_marker_a			= obs.OBS_MEDIA_STATE_NONE,
last_state_marker_b			= obs.OBS_MEDIA_STATE_NONE
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
  if type( input ) == "table" then
    local str = "{ "
    for key, value in pairs( input ) do
      if type( key ) ~= "number" then key = "'" .. key .. "'" end
      str = str .. "[" .. key .. "] = " .. pre_dump( value ) .. ","
    end
    return str .. "} "
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
    msg = " > " .. tostring( msg )
  else
    msg = ""
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
      if trace_index ~= nil then -- if "not not" found then..
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
	if type( tbl ) ~= "table" then return tbl end -- if the input table is not of type table return input
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
	if type( tbl ) == "table" then -- if the input table is not of type table return 0
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
	if type( tbl ) ~= "table" then return false end -- if the input table is not of type table return bool(false)
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
	if type( tbl ) ~= "table" then return false end -- if the input table is not of type table return bool(false)
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
	if type( tbl ) ~= "table" then return table end -- if the input table is not of type table return input
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
					but "Nested Scenes" are not listed in "obs.obs_enum_sources()"
	
	Credit:			midnight-studios, et al	

	Modified:		Author

	function:		Used to build a list from OBS source names into a table
	type:			Support			
	input type: 	"id", "unversioned_id", "display_name", "source_name"
	returns:		table default with "source_name" or define return_ref: "id" or "unversioned_id" or "display_name" or "source_name"
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
				sub["id"] = id_parent
				sub["unversioned_id"] = unversioned_id_parent
				sub["display_name"] = display_name_parent
				sub["source_name"] = source_name_parent
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
							sub["id"] = id_group
							sub["unversioned_id"] = unversioned_id_group
							sub["display_name"] = display_name_group
							sub["source_name"] = source_name_group
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
			is "return_ref" defined and a valid (existing) reference?
	]]
	local tmp_list = {}
	local found = false
	if return_ref ~= nil then
		for key, value in pairs( list ) do
			if type( list[key] ) == "table" then
				if tableHasKey( list[key], return_ref ) then
					found = true
					tmp_list[list[key]["source_name"]] = list[key][return_ref]
				end 
			end
		end
	end	
	if found then source_list = tmp_list end
	return source_list
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Function to convert OBS data array to table

	obs_data_array_to_table( settings, "reference" )

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
		
		local value = obs.obs_data_get_string( array_item, "value" );
		
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
	return str:match("^.*/(.*).lua$") or str 
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
			local  filename = string.gsub( entry.d_name, ext, "" )
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
	local file_name = filename() .. output_file_name:gsub("$date_stamp", os.date("%Y-%m-%d-%H%M"))
	-- set output path as the script path by default
	local script_path = script_path();
	local output_path = script_path .. file_name;
	-- if specified output path exists, then set this as the new output path
	if (output_folder ~= "") then
		output_path = output_folder .. "/" .. file_name
	else
		output_path = script_path .. file_name;
	end
	output_path = output_path:gsub([[\]], "/");
	obs.obs_data_erase( data, "backup_folder" )
	obs.obs_data_erase( data, "backup_mode" )
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
	Description:	"Timer Expires" 	= 1 
					"Marker A Time" 	= 2 
					"Marker B Time" 	= 3 
					"Timer Visible" 	= 4 
					"Timer Start" 		= 5
	
	
	Credit:			midnight-studios

	Modified:		

	function:		Start obs call obs_frontend_recording_start()
	type:			
	input type: 	reference, milliseconds
	returns:		none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function record( mark, ms )
	if timer_mode ~= 2 then return end
	if start_recording == 1 and mark == recording_type then
		
		--[[
				recording should only be started if it is not already recording
		
		]]
		
		if not obs.obs_frontend_recording_active() then
			obs.obs_frontend_recording_start()
		end
	end
	if ms ~= nil then wait( ms ) end 
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Convert hours:minutes:seconds to Seconds 
	
					When the user defines the Hours, Minutes & Seconds
					we need to convert it to seconds as the timer works
					on the value "seconds"

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
		year = os.date( "%Y", now )
	end
	if ( month == -1 ) then
		month = os.date( "%m", now )
	end
	if ( day == -1 ) then
		day = os.date( "%d", now )
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
	input type: 	4 variables - "HH" "MM" "SS" "FF"
	returns:		time stamp 00:00:00,00 (HH:MM:SS,FF)
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function config_time( hour, minutes, seconds, mili )
	local format_hour, 
	format_minutes, 
	format_seconds, 
	format_mili = 
	( hour and "%02d" or "" ),
	( minutes and ":%02d" or "" ),
	( seconds and ":%02d" or "" ),
	( mili and ",%02d" or "" ) 
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
	--[[
		
		Use this to see if the time stamp matches certain criteria
		This looks at HH:MM:SS only and is used to match the 
		timer's current time stamp against a user defined time mark that
		will for example activate Mark A or Mark B
		
	]]	
	if simplify then
		return config_time( hour, minutes, seconds,  nil )
	end
	
	return config_time( hour, minutes, seconds,  mili )
end	

--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Take the raw time format "HH:MM:SS:FF" and allow the user to
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
			table 1, break time stamp in pieces by character reference ":" 
			input: DD:HH:MM:SS,FF
			result: [DD], [HH], [MM], [SS,FF]
	
	]]
	local table1 = explode( timestamp, ":" ) -- reference ":" 4 parts
	
	if table1 == nil then return timestamp end -- have result or return input
	
	local c = tablelength( table1 ) -- measure table parts (there should be 4: [DD], [HH], [MM], [SS,FF])
	--[[
		This does something fancy that is needed
	]]
	local _, d = timestamp:gsub(":","")
	local _, t = format:gsub("$T","")
	
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
			local table2 = explode( table1[4], "," )
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
			local table2 = explode( table1[3], "," )
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
			local table2 = explode( table1[2], "," )
			if tableHasKey( table2, 1 ) and tableHasKey( table2, 2 ) then -- milliseconds
				seconds = table2[1]
				mili = table2[2]
			end	
		end
	end
	if tonumber(day) < 10 then 
		day = "0"..day
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
	timestamp = format:gsub("$T", ""):gsub("$D", day):gsub( "$H", hour):gsub("$M", minute):gsub("$S", seconds):gsub("$F", mili)
	
	if t ~= 0 and current_seconds > 0.01 then
		--local reg = "^[0]+[:]?[0]+[:]?[0]+[:]?[0]?"
		local reg = "^[0:,]*" -- close, but misses 1 instance
		timestamp = timestamp:gsub(reg,"")
	end	
	if current_seconds < 0.01 and timer_display == 1 then
		if timer_format ~= 1 then timestamp = "0" end -- the user wants the timer to end with a reminder that it is Game Over
	end	
	if current_seconds < 0.01 and timer_display == 2 then -- else it will show 00:00:00
		timestamp = "" -- the user wants the timer to disapear
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
					"Toggle Milliseconds" only when required.	
	
	Credit:			

	Modified:		Asking if miliseconds property must be shown or hidden and this is for back end UI

	function:		yer, no
	type:			Support, UI
	input type: 	properties, settings
	returns:		bool
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function show_split( props, settings )
	local config_value = obs.obs_data_get_int( settings, "config" )
	local mode = obs.obs_data_get_int( settings, "timer_mode" )
	local shw = false
	shw = ( config_value == 2 and mode == 2 and in_table( {1, 2}, timer_format ) )
	if ( timer_format == 5 and config_value == 2 and mode == 2 ) then
		if ( string.find( custom_time_format, "$F" ) ~= nil ) then
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
	if source_name == "Select" or  source_name == "select"then
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
local function set_visible( source_name, visible )
	
	if visible == nil then visible = true end
	local action_completed = false
	if in_table( {"","None", "Select","none", "select"}, source_name ) then return action_completed; end
	local scenes = obs.obs_frontend_get_scenes()
	if scenes ~= nil then
		for i, scn in ipairs( scenes ) do	
			local scene = obs.obs_scene_from_source( scn )
			local sceneitem = obs.obs_scene_find_source_recursive( scene, source_name )
			if sceneitem ~= nil then
				if visible and not obs.obs_sceneitem_visible( sceneitem ) then -- only set visible if not visible
					obs.obs_sceneitem_set_visible( sceneitem, visible )
				end	
				if not visible and obs.obs_sceneitem_visible( sceneitem ) then -- only hide if visible
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
	
	Credit:			midnight-studios, et al	

	Modified:		

	function:		Check source visibility state by name 
	type:			
	input type: 	source name (string)
	returns:		boolean 
----------------------------------------------------------
]]
local function is_visible( source_name )
	local isvisible = false
	local scenes = obs.obs_frontend_get_scenes()
	if scenes ~= nil then
		for i, scn in ipairs( scenes ) do	
			local scene = obs.obs_scene_from_source( scn )
			local sceneitem = obs.obs_scene_find_source_recursive( scene, source_name )
			if sceneitem ~= nil then
				isvisible = obs.obs_sceneitem_visible( sceneitem )
				break	
			end	
		end --end for
		obs.bfree( scn )
		obs.source_list_release( scenes )		
	end --end scenes ~= nil
	return isvisible
end	
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Set source visibility to hidden
	
	Credit:			

	Modified:		

	function:		a callback for a timer used to set a source visibility to hidden 
	type:			
	input type: 	none
	returns:		none
----------------------------------------------------------------------------------------------------------------------------------------
]]	
local function marker_a_media_end_callback( )
	set_visible( media["source_name_audio_marker_a"], false )
	obs.remove_current_callback()
end		
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Set source visibility to hidden
	
	Credit:			

	Modified:		

	function:		a callback for a timer used to set a source visibility to hidden 
	type:			
	input type: 	none
	returns:		none
----------------------------------------------------------------------------------------------------------------------------------------
]]	
local function marker_b_media_end_callback( )
	set_visible( media["source_name_audio_marker_b"], false )	
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
	local source = obs.calldata_source( cd, "source" )
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

	local source_name = media["source_name_audio_".. ref] 
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
		obs.signal_handler_connect( sh, "media_ended", signal_media_ended )		

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
	
	if in_table( {"","None", "Select","none", "select"}, source_name ) then return end
	
	if not media["activated_".. ref] then 
		media["current_seconds_".. ref] = math.ceil( current_seconds )
		set_visible( source_name, true );
		
		--[[
		
			connect signal handler to ensure we reset the source if the media ended.
		
		]]
		disconnect_after_media_end( ref )
		media["activated_".. ref] = true 	
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
	Description:	Change color of font for text source	
	
	Credit:			et al		

	Modified:		

	function:		Update Text Source (timer text source)		
	type:			Support, Render			
	input type: 	Integer
	returns:		none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function set_text_timer_color( int )
	if in_table( {"Select", "select"}, timer_source ) then return end -- if timer_source not defined, then return
	local source = obs.obs_get_source_by_name( timer_source ) -- get source by name
	if source ~= nil then -- continue if we have a source
		local settings = obs.obs_source_get_settings( source ) -- get source settings
		obs.obs_data_set_int( settings, "color", int ) -- update source settings
	end
	obs.obs_source_update( source, settings ) -- save source new settings
	obs.obs_data_release( settings ) -- release settings
	obs.obs_source_release( source ) -- release source
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
	if media["note_source_" .. ref] == "Select" then return end -- if source not defined, then return
	local source = obs.obs_get_source_by_name( media["note_source_" .. ref] ) -- get source by name
	if source ~= nil then -- continue if we have a source
		local settings = obs.obs_source_get_settings( source ) -- get source settings
			obs.obs_data_set_string( settings, "text", media["note_".. ref] ) -- update source settings
			obs.obs_data_set_int( settings, "color", media["color_".. ref] ) -- update source settings
	end
	obs.obs_source_update( source, settings ) -- save source new settings
	obs.obs_data_release( settings ) -- release settings
	obs.obs_source_release( source ) -- release source
end	
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Comapre current time with a time mark reference. 
					If the marker match, then complete required
					tasks. 
					
					The tasks include changing the timer text source
					font colour as defined, setting linked text sources 
					visible or/and hidden and changing linked text 
					sources font colour.
					
					enable_marker_notes must be equal to 2 to be used.
					enable_marker_notes equal to 1 is disabled
	
	Credit:			

	Modified:		

	function:		
	type:			
	input type: 	
	returns:		
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function time_mark_check( ref )
	
	if not timer_active then return end -- only allow mark checks if the timer is active
	--[[
	 		Make sure the trigger is as accurate as possible depending
			if the timer is counting up or down.
	]]
	local round_seconds = math.ceil( current_seconds ) -- round to nearset upper value
	if timer_type ~= 1 then -- if not Stopwatch so target Countdown
		round_seconds = math.floor( current_seconds ) -- round to nearset lower value
	end	
	
	if raw_time( round_seconds, true ) == media["text_".. ref] then -- compare current time with marker
		--[[
			If Marker notes is enabled and the reference provided
			match to Marker A, complete some tasks
		]]
		if enable_marker_notes ~= 1 and ref == "marker_a" then -- marker notes is enabled and the input reference matches
			set_visible( media["note_source_" .. ref], true )  -- Set visble the source for the note for marker a
			set_visible( media["note_source_marker_b"], false )  -- Set hiden the source for the note for marker b (only show one note at a time)
			set_text_note_color( ref ) -- Update the note text font to match the font colour defined for marker a
		end		
		--[[
			If Marker notes is enabled and the reference provided
			match to Marker B, complete some tasks
		]]		
		if enable_marker_notes ~= 1 and ref == "marker_b" then -- marker notes is enabled and the input reference matches
			set_visible( media["note_source_" .. ref], true ) -- Set visble the source for the note for marker b
			set_visible( media["note_source_marker_a"], false ) -- Set hiden the source for the note for marker a (only show one note at a time)
			set_text_note_color( ref )  -- Update the note text font to match the font colour defined for marker b
		end	
		--[[
			Update the timer text source font colour to match the defined font colour for the referenced marker
			This will ensure that the timer text font matches the font colour of the currently displayed note.
		]]
		set_text_timer_color( media["color_".. ref] )
		--[[
		
		]]
		start_media( media["source_name_audio_".. ref], ref )
		--[[
			if the user wants OBS to start recording when the marker activates
			check the reference and activate the timer to initiate recording 
			
			recording_type:
			
			1 = "Timer Expires", 
			2 = "Marker A Time", 
			3 = "Marker B Time", 
			4 = "Timer Visible", 
			5 = "Timer Start"
			
		]]	
		if ref == "marker_a" then record( 2 ) end -- an integer reference used to compare with recording_type
		if ref == "marker_b" then record( 3 ) end -- an integer reference used to compare with recording_type
	end		
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Check source type of media if the media is set to loop
					The source is referenced by name.
	Credit:			

	Modified:		

	function:		
	type:			
	input type: 	reference (string)
	returns:		bool
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function get_source_looping( source_name )
	local property = "looping" -- we want to check this property setting
	--[[
		Increments the source reference counter, 
		use obs_source_release() to release it when complete.
		
		we got a source name, let's see if it exist...
	]]	
	local source = obs.obs_get_source_by_name( source_name ) -- get source by name	
	local enabled = false 
    if source ~= nil then -- continue if we have a source
		local source_id = obs.obs_source_get_unversioned_id( source ) -- get source id
			if source_id == "ffmpeg_source" then -- check if source id match that of type we need to focus on
				local settings = obs.obs_source_get_settings( source ) -- get source settings
				enabled = obs.obs_data_get_bool( settings, property ) -- check if media source has playback looping enabled
			end
	end
	obs.obs_data_release( settings ) -- release settings
	obs.obs_source_release( source ) -- release source
	return enabled -- bool
end	
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	
	Description:	Check if the source state changed, 
					if so, set source visble = false
	
	Credit:			

	Modified:		

	function:		
	type:			tasks
	input type: 	ref (string)
	returns:		none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function stop_media_action( ref )
	
	local source_name = media["source_name_audio_".. ref] -- assign local variable 
	
	if in_table( {nil, "","None", "Select","none", "select"}, source_name ) and not media["media_ended_".. ref]	then return end -- if source not defined, then return
	--[[
	
		ref is either Mark A or B
		
		Check if ref has duration set and check if media_playback_limit is enabled
	
	]]
	if media["duration_".. ref] ~= 0 and media_playback_limit ~= 1 then
		--[[
			Increments the source reference counter, 
			use obs_source_release() to release it when complete.
			
			we got a source name, let's see if it exist...
		]]	
		local source = obs.obs_get_source_by_name( source_name )

		if source ~= nil then -- source is valid

			local state = obs.obs_source_media_get_state( source ) -- get the current state for the source
			
			if media["last_state_".. ref] ~= state then -- The state has changed
			
				if state == obs.OBS_MEDIA_STATE_PLAYING then
						--[[
								time remaining is calculated differently depending on the timer_mode (count is up or down)
						]]
						local media_time_started = math.ceil( media["current_seconds_".. ref] )  -- round to nearset upper value
						local media_time_limit = math.floor( media["duration_".. ref] ) -- round to nearset lower value
						
						local time_currently = math.ceil( current_seconds )  -- round to nearset upper value
						local media_time_remaining = 0 -- set integer variable with default value
						local time_end = false -- set bool variable with default value
					
						if timer_mode == 1 then -- count direction is positive
							media_time_remaining = media_time_started + media_time_limit -- time media became active and add playback time limit
							time_end = ( time_currently >= media_time_remaining  ) -- time is equal to or greater than the limit
						end						
						if timer_mode == 2 then -- count direction is negative
							media_time_remaining = media_time_started - media_time_limit -- time media became active and subtract playback time limit
							time_end = ( time_currently <= media_time_remaining  ) -- time is equal to or less than the limit
						end
					
						if time_end then -- bool, has the time limit been reached?
							media["last_state_".. ref] = state -- update the ref state global variable because we need to track it 
							media["media_ended_".. ref] = true -- update the ref media end global variable because we need to track it 
							set_visible( source_name, false ) -- The source visibility must now be changed to hidden
						end
				end	
			else -- The state has not changed
				media["last_state_".. ref] = state -- update the ref state global variable because we need to track it 
				-- the state is currently either stopped or completed, then reset source visibility to hidden
				if state == obs.OBS_MEDIA_STATE_STOPPED or state == obs.OBS_MEDIA_STATE_ENDED then -- state match?
					set_visible( source_name, false ) -- The source visibility must now be changed to hidden
				end
			end	 -- source state check end
		end -- 	source ~= nil
	end
    obs.obs_source_release( source ) -- release source from the reference counter	
end	
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Stop Media Playback
	
	Credit:			OBS, midnight-studios

	Modified:		

	function:		
	type:			
	input type: 	
	returns:	none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function stop_media_playback( source_name )
	
	if in_table( {"","None", "Select","none", "select"}, source_name ) or not is_visible( source_name ) then return end
			
		local source = obs.obs_get_source_by_name( source_name )
	
		if source ~= nil then
			local source_id = obs.obs_source_get_unversioned_id( source ) -- unversioned_id will not be affected by language settings
			if source_id ~= "ffmpeg_source" then return end -- apply this to media type sources only
			local state = obs.obs_source_media_get_state( source ) -- get the current state for the source
			if state == obs.OBS_MEDIA_STATE_PLAYING or obs.OBS_MEDIA_STATE_PAUSED then
				obs.obs_source_media_stop( source )
			end
			--obs.obs_source_media_get_duration( source )
			--obs.obs_source_media_get_time( source )
			--obs.obs_source_media_restart( source )
		end
		obs.obs_source_release( source )
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
	
	if in_table( {"","None", "Select","none", "select"}, source_name ) or not is_visible( source_name ) then return end
			
		local source = obs.obs_get_source_by_name( source_name )
	
		if source ~= nil then
			local source_id = obs.obs_source_get_unversioned_id( source ) -- unversioned_id will not be affected by language settings
			if source_id ~= "ffmpeg_source" then return end -- apply this to media type sources only
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
	
	Description:	Stop Media is designed to reset the source to its
					starting state. In other words, make the source
					invisible again. This sould only happen if the media
					ended, or if it is looped, then end the media after a
					defined time.
	
	Credit:			

	Modified:		

	function:		
	type:			
	input type: 	
	returns:
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function stop_looping_media( ref )
	local source_name = media["source_name_audio_".. ref]
	if get_source_looping( source_name ) then 
		stop_media_playback( source_name )
		--[[
			We don't need this because we have already
			attached a source signal hanlder for 'media_ended'
			that will hide the source if it is ended
		]]
		--set_visible( source_name, false ) -- Set the media source state to hidden.  
	end 
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	
	Description:	Stop Media is designed to reset the source to its
					starting state. In other words, make the source
					invisible again. This sould only happen if the media
					ended, or if it is looped, then end the media after a
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
		set_visible( media["source_name_audio_".. ref], false )  -- Set the media source state to hidden
	else -- do some checks
		stop_media_action( ref ) -- handle this request elsewhere
	end	
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Function to cycle through a list for sources or scenes
	
	Credit:			


	Modified:		

	function:		
	type:			
	input type: 	string
	returns:		nothing
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function cycle_source_list_by_source_type( source_type )
	--[[
	
		Create a table for a list
	
	]]	
	local i = 0				-- create interger variable 
	local list = {} 		-- create temporary table variable 
	local item_list =  {} 	-- create temporary table variable 
	local data_list = obs_data_array_to_table( script_settings, "cycle_list" ) -- fetch obs userdata from property settings and return in table
	local direction = 1		-- create interger variable 
	--[[
		handle scenes
	]]	
	if source_type ~= "source" then -- string is not equal to "source" as it should be "scene"
		direction = 1 -- Descend Ascend change direction to 1 or 2
		local scenes = obs.obs_frontend_get_scene_names() -- List Scenes names
		if scenes ~= nil then
			for _, scene in ipairs( scenes ) do -- cycle through list items one at a time 
				item_list[scene] = scene		-- add scene name (string) to the table
			end
			obs.bfree( scene ) -- free memory, release source as it is no longer needed
		end
	else -- List Source names
		direction = 1 -- Descend Ascend change direction to 1 or 2
		local sources = get_source_list() -- "id" or "unversioned_id" or "display_name" or "source_name"
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
		local index_match = ( index == cycle_index )
		
		--[[
			The list contains all available sources.
			The value targets the sources requested.
			Check if the requested source is available
		]]
		if list[i] ~= nil then
			--[[
				
				Type is "Scene"
					
			]]
			if source_type ~= "source" then --
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
				
				Type is "Source"
					
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
	Description:	Check if a scene with a specific name has a source with a specific name 
	
	
	Credit:			midnight-studios, et al

	Modified:		

	function:		check true or false
	type:			Dependency / Support
	input type: 	string, string
	returns:		bool
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
	
	Credit:			midnight-studios, et al

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
			if source_id == "scene" then
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
local function update_prop_settings_current_seconds( value )
	--[[
		When this is updated it will trigger a 
		callback "property_onchange", let's 
		disable that for a moment.
	]]
	prevent_callback = true
	obs.obs_data_set_double( script_settings, "sw_current_seconds", value )
	sw_current_seconds = value
	obs.obs_properties_apply_settings( props, script_settings )
	--[[
		When this is updated it will trigger a 
		callback "property_onchange", let's 
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
	returns:		current_seconds
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function timer_value( value, update_settings )
	
	if update_settings == nil then
		update_settings = false
	end	
	
	current_seconds = value
	
	if update_settings then 
		update_prop_settings_current_seconds( current_seconds ) 
	end
	
	return current_seconds
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Assign the correct frequency value to the timer incriment 
					depending on if timer is counting up or down
	
	Credit:			

	Modified:		

	function:		update the timer value
	type:			Dependency / Support			
	input type: 	
	returns:		calls timer_value()
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function set_time_direction( update_settings )
	if timer_mode ~= 2 then
		timer_value( current_seconds + time_frequency, update_settings ) -- value, update_settings 
	else
		timer_value( current_seconds - time_frequency, update_settings ) -- value, update_settings 
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
function update_timer_display( source_name, text )
	--[[
		Increments the source reference counter, 
		use obs_source_release() to release it when complete.
	]]		
	local source = obs.obs_get_source_by_name( source_name )
	
	if source ~= nil then
	
		local settings = obs.obs_source_get_settings( source )
		if not media["activated_marker_a"] and not media["activated_marker_b"] and not color_normal_updated then
			obs.obs_data_set_int( settings, "color", media["color_normal"] )
			color_normal_updated = true
		end	
		
		time_mark_check( "marker_a" )
		time_mark_check( "marker_b" )
		obs.obs_data_set_string( settings, "text", text )	
	end
	obs.obs_source_update( source, settings )
	obs.obs_data_release( settings )
	obs.obs_source_release( source )
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Function to toggle milliseconds
	
	Credit:			

	Modified:		

	function:		mili_toggle
	type:			
	input type: 	globals: toggle_mili_trigger, timer_mode, mili_toggle_triggered, raw_time()
	returns:		none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function toggle_mili()
	--[[
		
		This feature will only activate if "Trigger Value" is defined
		and if "Trigger Value" matches "Current Time" and if
		"Timer Type" is "Countdown"
	
	]]
	if toggle_mili_trigger ~= "" and timer_mode == 2 and not mili_toggle_triggered then
		local time_offset = 1 -- offset by 1 second to allow user to achieve accurate setting
		if raw_time( ( current_seconds + time_offset ), true ) == toggle_mili_trigger then
			--[[

				The action trigger a toggle, so if the
				active state at the time of the trigger
				is "Show" the toggle will "Hide" and
				Vicas Versa. 

				Should we force a state? 
				To force define: show_mili = false

			]]
			on_mili( true )
			mili_toggle_triggered = true
		end
	end	
	--return true
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
	if current_seconds <= 0.01 and timer_mode ~= 1 then 
		timer_value( 0, false )   -- value, update_settings 
	end
	
	toggle_mili()
	
	local l_time = long_time( current_seconds )
	local t_time = raw_time( current_seconds )
	--[[
		Timer Format Type: Full Format
	]]
	local text = tostring( raw_time( current_seconds ) )
	--[[
		Timer Format Type: Remove Leading Zeros
	]]
	if timer_format == 2 then
		local system_time_format = "$T$H:$M:$S,$F"
		text = format_time( ( l_time ~= 0 ) and string.format( "%s:%s", l_time, t_time ) or string.format( "%s", t_time ), system_time_format )
	end	
	--[[
		Timer Format Type: No Leading Zeros, No Split Seconds
	]]
	if timer_format == 3 then
		local system_time_format = "$T$H:$M:$S"
		text = format_time( ( l_time ~= 0 ) and string.format( "%s:%s", l_time, t_time ) or string.format( "%s", t_time ), system_time_format )
	end
	--[[
		Timer Format Type: No Leading Zeros, No Split Seconds
	]]
	if timer_format == 4 then
		local system_time_format = "$H:$M:$S"
		text = format_time( ( l_time ~= 0 ) and string.format( "%s:%s", l_time, t_time ) or string.format( "%s", t_time ), system_time_format )
	end
	
	if timer_format ~= 5 then
		--[[
			Format the Text "Day/Days"
		]]
		if timer_mode == 2 and countdown_type == 1 and current_seconds ~= 0 then
			local longtimetext = longtimetext_p
			if math.floor( current_seconds / 86400 ) <= 1 then
				longtimetext = longtimetext_s
			end
			if math.floor( current_seconds / 86400 ) <= 0 then
				longtimetext = longtimetext_p
			end		
			text = string.gsub(longtimetext .. text, "[#]", long_time( current_seconds ))
		end		
	end
	--[[
		Timer Format Type: Custom Time Format
	]]
	if timer_format == 5 then
		text = format_time( ( l_time ~= 0 ) and string.format( "%s:%s", l_time, t_time ) or string.format( "%s", t_time ), custom_time_format )
	end	

	if timer_mode ~= 2 then
		--text_prefix = ""
		--   text_suffix = ""
	end
	text = text_prefix .. text .. text_suffix	
	if text ~= last_text then 
		update_timer_display( timer_source, text )
	end
	
	--[[
		
		Check is media is playing and stop if required
	
	]]
	stop_media( "marker_a" )
	stop_media( "marker_b" )
	last_text = text
	--[[
		Timer Ended
	]]--
	if current_seconds <= 0.01 and timer_mode ~= 1 then
		--[[
		
			Timer is shutting down, this would be a 
			good time to reset some items.
		
		]]--
		if enable_marker_notes ~= 1 then 
			set_visible( media["note_source_marker_a"], false )
			set_visible( media["note_source_marker_b"], false )  
		end		
		
		--[[
		
			Timer was started and now has EXPIRED
			execute any final instructions that 
			the user require on TIMER END 
		
		]]--
		if timer_active then timer_ended( source_name ) end
		--[[
		
			Now remove the timer callback
		
			"timer_ended()" offer options to
			restart the timer and may define
			a value to "current_seconds". 
		
			Final check, if current_seconds == 0 then
			deactivate (end/remove) the timer callback
		
			This is a fallback but should not be needed
			as the timer callback may be removed by 
			timer_ended() if needed
		]]--
		if current_seconds == 0 then timer_expired = true; end
	end	
	--return true
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	This captures the split times and unpack it in the
					correct format.

					The text source only permits linebreaks ( "\n" ) this 
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
	local text = ""
	local title = ""
	local subtitle = ""
	local line = "______________________________"
    for i = 1,c do 
		local mark = split_itm[i]
		local interval = mark
		if i > 1 then
			local j = i - 1 
			interval = split_itm[i] - split_itm[j]
		end
		--[[
			"Interval"			= 1
			"Mark"				= 2
			"Mark Interval"		= 3
			"Interval Mark"		= 4
		
		]]
		if split_type == 1 then
			title = "Interval"
			--subtitle = ""
			text = tostring( raw_time( interval ) )
		elseif split_type == 2 then
			title = "Mark"
			--subtitle = ""
			text = tostring( raw_time( mark ) )
		elseif split_type == 3 then
			title = "Mark                     "
			subtitle = "Interval"
			text = tostring( raw_time( mark ).."          "..raw_time( interval ) )
		else	--	"Interval Mark"
			title = "Interval                  "
			subtitle = "Mark"
		text = tostring( raw_time( interval ).."          "..raw_time( mark ) )
		end	
		-- data collection here
		local n = i --formatting the index number
		if i < 10 then n = "0"..tostring( i ) end
		if data ~= nil then 	
			data = data .. "\n" .. n.." )    "..text
		else
			data = "#       "..title..subtitle.."\n"..line.."\n\n"..n.." )    "..text
		end
	end	-- end for
	split_data = data
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Decide if current_seconds needs to reset to default_seconds
	
	Credit:			

	Modified:		

	function:		Check if current_seconds needs to reset to default_seconds
	type:			check
	input type: 	next_scene
	returns:		bool
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function update_default_time()
	
	if next_scene == "Source List" or next_scene == "Scene List" then
		return true
	end	
	
	return false
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
	if in_table( {"","None", "Select","none", "select"}, source_name ) then return end
	local text = split_data
	if text ~= last_split_data then
		set_text( source_name, text )
	end
	last_split_data = text
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	
	Description:	Used when we need to set some gloabsl for the timer to default state
	
	Credit:			

	Modified:		

	function:		
	type:			
	input type: 	
	returns:
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function default_timer_globals( set_to_default )
	
	--[[
		if set_to_default == true
		and timer_mode == 2	(Countdown)
	]]	
	if set_to_default then
		--[[
			Used for source cycling

			default_seconds: Default Seconds

			the default timer state

			This is the state of the timer that will set or
			reset the time ( current_seconds ) 

			If the timer expires because current_seconds == 0, 
			then the time ( current_seconds ) will be be restarted
			from default_seconds for another function such as source cycling.

			Every instance that a timer time is defined, we must record it to default_seconds

			THIS WILL UPDATE current_seconds to the value current_seconds
		]]
		--if set_to_default and timer_mode == 2 and update_default_time() then
		--timer_value( default_seconds, false )	 -- value, update_settings 
		--end	
		--[[
		
			If timer is Stopwatch type and user pressed "reset" the timer must always be reset to zero

		]]
		if timer_mode == 1 and reset_activated then
			update_prop_settings_current_seconds( 0 ) 
			current_seconds = 0 
			sw_current_seconds = 0
		end	
		color_normal_updated = false
		media["activated_marker_a"] 		= false
		media["activated_marker_b"] 		= false
	end
	timer_expired = true
	completed_cycles = 0
	split = 0
	split_itm = {}
	split_data = nil
	
	set_split_text( split_source )
	orig_time = obs.os_gettime_ns()
	set_visible( media["note_source_marker_a"], false )
	set_visible( media["note_source_marker_b"], false ) 
	mili_toggle_triggered = false
	media["last_state_marker_a"]		= obs.OBS_MEDIA_STATE_NONE
	media["last_state_marker_b"]		= obs.OBS_MEDIA_STATE_NONE
end

--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	
	
	Credit:			

	Modified:		

	function:		
	type:			
	input type: 	toggle_mili_trigger, set_time_text, timer_mode
	returns:		show_mili (bool)
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function reset_mili( )
	if timer_mode ~= 2 then
		return true
	end	
	--[[
		
		Is the "Trigger Value" defined
		and is "Timer Type" set to "Countdown"
	
	]]
	if toggle_mili_trigger ~= "" then
		show_mili = false
	else
		show_mili = true
	end	
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
Description:		Called if the timer setting change and needsto be updated.

					default_seconds is used for source cycling

					default_seconds: Default Seconds

					the default timer state

					This is the state of the timer that will set or
					reset the time ( current_seconds ) 

					If the timer expires because current_seconds == 0, 
					then the time ( current_seconds ) will be be restarted
					from default_seconds for another function such as source cycling.

					Every instance that a timer time is defined, we must record it to default_seconds
	
	Credit:			

	Modified:		

	function:		
	type:			
	input type: 	
	returns:
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function update_timer_settings( set_to_default, new_settings ) -- optional inputs: set_to_default(bool), new_settings(obs_property_data/obs_userdata)
	local update_timer_display = false
	
	if set_to_default == nil then set_to_default = false end -- incase not defined, set default
	if new_settings == nil then new_settings = script_settings end -- incase not defined, set default
	--[[

	
	]]	
	reset_mili( )
	--[[
	
		STOPWATCH
	
	
		We will look at some tasks if the timer mode is set to stopwatch
	
		Stopwatch must always be reset to zero
		unless if the time is loaded from a previous session
	]]	
	if timer_mode == 1 then
		update_timer_display = true
		--[[
			In case the mode is switched, alwasy start with a reset of the timer time
		]]
		if timer_mode_changed then timer_value( 0, false ) end  -- value, update_settings
		 --[[
			Timer expired: Yes, reset, no continue
		]]
		if timer_expired then
			--[[
				Timer expired: Yes, reset, no continue
			]]
			if load_saved_time then
				timer_value( sw_current_seconds, false ) -- value, update_settings
			else
				 --[[
					The timer expired, it must now be reset to zero.
				]]
				timer_value( 0, false ) -- value, update_settings
				--[[
					Feature not enabled, set zero
				
				]]
				update_prop_settings_current_seconds( 0 ) 
			end	
		end	
		--[[
		
			We may require timer globals to be reset to defaults
		]]
		default_timer_globals( set_to_default )	
	end		
	--[[
		COUNTDOWN
	
		We will look at some tasks if the timer mode is set to countdown
	]]
	if timer_mode == 2 then		
		--[[
			In case the mode is switched, alwasy start with a reset of the timer time
		]]
		if timer_mode_changed then timer_value( 0, false ) end -- value, update_settings
		
		 update_timer_display = true 
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
			( obs.obs_data_get_int( new_settings, "hours" )*60*60 ) + 
			( obs.obs_data_get_int( new_settings, "minutes" )*60 ) + 
			obs.obs_data_get_int( new_settings, "seconds" )
				)	
		end
		--[[
			This setting must only be applied in the following conditions:
		
			1)	 When the timer is resting and the user is setting a new time.
		
			2)	The timer completed a cycle and needs to be rest to start the next cycle.
				This will only be required if the "next scene" is set to 'source list' or 'scene list'
			
		]]		
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
		)

		--[[
		
		
		
		]]
		if do_update then	
			--[[
				update timer time
			]]
			timer_value( calculated_time, false )
				--[[
					Used for countdown only
					NB: This must always be called 
					last in this routine so that 
					current_seconds can be updated first

					Used for source cycling

					default_seconds: Default Seconds

					the default timer state

					This is the state of the timer that will set or
					reset the time ( current_seconds ) 

					If the timer expires because current_seconds == 0, 
					then the time ( current_seconds ) will be be restarted
					from default_seconds for another function such as source cycling.

					Every instance that a timer time is defined, we must record it to default_seconds
					In this instance a Setting may be updated, so update default_seconds
			]]		
			default_seconds = current_seconds
		end	
			--[[
				*Used when timer has been reset
			
				*Used for source cycling
			
				default_seconds: Default Seconds
		
				the default timer state
		
				This is the state of the timer that will set or
				reset the time ( current_seconds ) 
		
				If the timer expires because current_seconds == 0, 
				then the time ( current_seconds ) will be be restarted
				from default_seconds for another function such as source cycling.
		
				Every instance that a timer time is defined, we must record it to default_seconds
			
				THIS WILL UPDATE current_seconds to the value current_seconds
			]]
		if set_to_default and update_default_time() or reset_activated then	
			--[[
				update timer time
			]]
			timer_value( default_seconds, false ) -- value, update_settings 
		end	
		--[[
		
			We may require timer globals to be reset to defaults
		]]
		default_timer_globals( set_to_default )		
	end
	--[[

		At this stage the timer display may need to be updated

	]]
	if update_timer_display then 	
		--[[
			update timer display
		]]
		set_time_text( timer_source ) 
	end

	update_timer_display = false
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
	set_time_direction( false )
	completed_cycles = completed_cycles + 1 -- we just keeping track of these for debugging, if needed.
	--[[
			We need to update the timer display here to create the timer animation,
			technically the timer updates the text source every x seconds to create 
			the animation effect. 
	]]
	set_time_text( timer_source )
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Remove timer here so we have a global setting
	
	Credit:			

	Modified:		

	function:		
	type:			
	input type: 	
	returns:
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function end_timer()
	timer_active = false
	obs.timer_remove( timer_callback ) -- Removing the callback stops the timer	
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
	
	if timer_active and not activating then
		--[[
			moved from function on_pause( pressed )
		
			more information needed
		]]	
		split_unpack()
		--[[
			moved from function on_pause( pressed )
		
			more information needed
		]]	
		set_split_text( split_source )	
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
		
		--[[
			Once the timer started, this setting will default
		]]
		set_timer_activated = false
		
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
			end_timer() -- Removing the callback stops the timer
			set_visible( media["source_name_audio_marker_a"], false ) -- The timer expired, reset media.
			set_visible( media["source_name_audio_marker_b"], false ) -- The timer expired, reset media.
		else
			end_timer() -- Removing the callback stops the timer	
		end
		--[[
			update_timer_settings:
			
			timer_mode: countdown only
		
			timer_active: timer not running
		
			define > set_to_default: (false) * we are receiving new settings, so we do not want to set the settings to default.
			define > new_settings: not required here because we will use the global (script_settings)
		
			purpose: User is changing the countdown time settings and we need to provide instant feedback output to the timer display (timer text source)
		]]
		if not timer_active then -- update timer display when the timer settings changed
			--update_timer_settings( false ) -- optional inputs: set_to_default(bool), new_settings(obs_property_data/obs_userdata) < BUG
		end			
	end
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
	
	update_prop_settings_current_seconds( current_seconds ) -- update current time to last time in properties
	--[[
		
		Set timer source  visibility to visible
		
	]]	
	set_visible( timer_source, true )
	
	if timer_active then
		activate( false )
	else
		if activated == false then	
			activate( true )
		end	
	end
		pause_play_media( media["source_name_audio_marker_a"], not timer_active )
		pause_play_media( media["source_name_audio_marker_b"], not timer_active )
	return true
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
	timer_value( time, true ) -- Update the last saved time here
	set_time_text( timer_source )
	
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
	Callback for button press
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function mili_button_clicked( props, p, settings )
	on_mili( true )
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
function on_mili( pressed )	
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
	local mode = obs.obs_data_get_int( script_settings, "timer_mode" )
	local mili_button_prop = obs.obs_properties_get( props, "mili_button" )

	--[[
		
		We are only setting the button label depending if the timer"s milliseconds
		value visibility state.
		
	]]
	if show_mili then
		obs.obs_property_set_description( mili_button_prop, "Hide Milliseconds" )
	else
		obs.obs_property_set_description( mili_button_prop, "Show Milliseconds" )
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
	Description:	Called when a source is activated/deactivated
	
	Credit:			

	Modified:		

	function:		
	type:			
	input type: 	
	returns:
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function activate_signal( cd, connected )
	--[[
	
		Capture / Retrieve Callback Data
	
	]]
	local source = obs.calldata_source( cd, "source" )
	
	--[[
	
		Do we have a Source?
	
	]]
	if source ~= nil then
		
		local name = obs.obs_source_get_name( source ) -- Get Source NAME
		--[[
		
		]]		
		activate_timer_on_scene( source, connected )
		--[[
		
			Check if scene has source
		
		]]
		if ( name == timer_source ) then
			if connected then record( 4, 300 ) end
			
			if start_on_visible or start_on_scene_active then
				--[[
					Source visibility was set to hidden
				]]
				if not connected then

					update_prop_settings_current_seconds( current_seconds ) -- update current time to last time in properties
					
				--if timer_mode == 1 and reset_activated then
				--	update_prop_settings_current_seconds( 0 ) 
				--	current_seconds = 0 
				--	sw_current_seconds = 0
				--end	
					
					
					
					
					
					
					
					
					pause_play_media( media["source_name_audio_marker_a"], true )
					pause_play_media( media["source_name_audio_marker_b"], true )
				end

				--[[

					timer_mode: either

					timer_active: timer not running

					define > set_to_default: (true) * we are starting the timer from the default position and therfore want to set the settings to default.
					define > new_settings: not required here because we will use the global (script_settings)

					purpose: User requires the timer to intiate.
				]]
				if not set_timer_activated and force_reset_on_visible then
					update_timer_settings( true ) -- optional inputs: set_to_default(bool), new_settings(obs_property_data/obs_userdata)
				end
				
				if connected then	
					activate( true )
				else
					activate( false )
				end		
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
	--[[
		For hotkeys: This is called on key down & key up. A bool check: 
		
		pressed = true (key down)
		pressed = false (key up)
	
		When a hotkeys is pressed the callback checks if the key state 
		is currently pressed 'true' or 'false' (released)
		so a hotkey key press has a dual function: key down, key up

	]]
	if pressed then -- key is currently down
		--return -- uncomment 'return' to ignore the call while key is down
	else -- key was released 
		--return -- uncomment 'return' to ignore the call when key is released
	end

	--[[
		Set visibility to first position
	]]	
	set_visible( media["source_name_audio_marker_a"], false )
	set_visible( media["source_name_audio_marker_b"], false )
	--[[
		Set bool to first position
	]]	
	media["media_ended_marker_a"] = false
	media["media_ended_marker_b"] = false
	color_normal_updated 		  = false 
	set_timer_activated 		  = false 	
	--[[
	
		force text update by changing last_text
	
	]]
	last_text = tostring( obs.os_gettime_ns() )
	--[[

		timer_mode: eiher

		timer_active: either

		define > set_to_default: (true) * User requested a reset, so we do not want to set the settings to default.
		define > new_settings: not required here because we will use the global (script_settings)

		purpose: User is resetting the timer settings and we need to provide instant feedback output to the timer display (timer text source)
	]]
	update_timer_settings( true ) -- optional inputs: set_to_default(bool), new_settings(obs_property_data/obs_userdata) -- based on UI Settings
	
	--[[
	
		Handle Timer Callback
	
	]]
	activate( false ) -- start or stop the timer, in this case, stop the timer and get it ready start again
	--[[
	
		Reset timer split seconds text
	
	]]
	set_split_text( split_source )
	--[[
	
		Reset "Active Source" text (if defined)
	
	]]
	if active_source ~= "Select" then 
		
		set_text( active_source, "" ) 
		--[[
			force the visibility 
			state of this source. 
		]]	
		if active_source_force_visible then set_visible( active_source, false ) end
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
local function on_reset( pressed )
	--[[
		For hotkeys: This is called on key down & key up. A bool check: 
		
		pressed = true (key down)
		pressed = false (key up)
	
		When a hotkeys is pressed the callback checks if the key state 
		is currently pressed 'true' or 'false' (released)
		so a hotkey key press has a dual function: key down, key up

	]]
	if pressed then -- key is currently down
		--return -- uncomment 'return' to ignore the call while key is down
	else -- key was released 
		--return -- uncomment 'return' to ignore the call when key is released
	end
	reset_activated = true -- notify timer settings a reset call is in process
	reset( pressed )
	reset_activated = false -- notify timer settings a reset call ended
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
	local mode = obs.obs_data_get_int( script_settings, "timer_mode" )
	local pause_button_prop = obs.obs_properties_get( props, "pause_button" )
	--[[
		
		We are only setting the button label depending if the timer is active
		and on the timer type.
		
	]]
	if mode == 2 then
		if timer_active then
			obs.obs_property_set_description( pause_button_prop, "Start/Pause Countdown" )
		else
			obs.obs_property_set_description( pause_button_prop, "Start Countdown" )
		end
	else
		if timer_active then
			obs.obs_property_set_description( pause_button_prop, "Start/Pause Stopwatch" )
		else
			obs.obs_property_set_description( pause_button_prop, "Start Stopwatch" )
		end
	end	
	return props
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
	if timer_mode == 1 then
		set_stopwatch()
		set_timer_activated = true
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
	on_reset( true )
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
		split_itm[split] = current_seconds
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
	Description:	custom function

					we use this to get a count of all sources
	
	Credit:			

	Modified:		

	function:		
	type:			
	input type: 	
	returns:	interger
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function count_sources()
	local sources = obs.obs_enum_sources()
	local i = 0
	if sources ~= nil then
		for _, source in ipairs( sources ) do -- ipairs cycles auto incrimented items
			i = i + 1 
		end
		obs.bfree(source) -- free memory, release source as it is no longer needed
	end
	obs.source_list_release( sources ) -- free memory, release 
	total_sources = i
	return i
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
local function loaded( cd )
	local all_sources_loaded = false
	--[[
		Get source from CallData
	]]
	local source = obs.calldata_source( cd, "source" )

	--[[
		Found Source:
	]]
	if source ~= nil then 
		
		local name = obs.obs_source_get_name( source ) -- Get the source name, this will be a unique identifier 
		--[[
			Does the name match the property value?
		]] 
		if ( name == timer_source ) then
			if start_on_visible and not start_on_scene_active then
				set_visible( timer_source, false ) -- set hidden as a starting point, the user can start the timer by setting it to visible
			end	
		end	
		
		if obs.obs_source_get_id( source ) ~= "scene" then
			sources_loaded = sources_loaded + 1 -- add this to the loaded sopurce tally
		end	
	end
	--[[
		Check if all sources are loaded
	]]	
	all_sources_loaded = ( sources_loaded == count_sources() )
	--[[
		Some of the functions included requires the source to be loaded, 
		so check that all sources are loaded before continuing
	]]
	if all_sources_loaded then
		
		set_visible( media["source_name_audio_marker_a"], false ) -- set hidden just in case
		set_visible( media["source_name_audio_marker_b"], false ) -- set hidden just in case
		if start_on_visible and not start_on_scene_active then
			set_visible( timer_source, false ) -- set hidden as a starting point, the user can start the timer by setting it to visible
		end	
		if timer_mode == 1 then
			if load_saved_time then
				timer_value( sw_current_seconds, false ) -- value, update_settings 
			else
				timer_value( 0, false )
				reset( true )	
			end	
		else
			reset( true )	
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
	
	last_timer_mode = timer_mode
	timer_day = obs.obs_data_get_int( settings, "day" )
	timer_year = obs.obs_data_get_int( settings, "year" )
	timer_hours = obs.obs_data_get_int( settings, "hours" )
	timer_month = obs.obs_data_get_int( settings, "month" ) - 1
	timer_mode = obs.obs_data_get_int( settings, "timer_mode" )
	timer_minutes = obs.obs_data_get_int( settings, "minutes" )
	timer_seconds = obs.obs_data_get_int( settings, "seconds" )
	enable_marker_notes = obs.obs_data_get_int( settings, "enable_marker_notes" )
	timer_format = obs.obs_data_get_int( settings, "timer_format" )
	timer_source = obs.obs_data_get_string( settings, "timer_source" )
	timer_display = obs.obs_data_get_int( settings, "timer_display" )
	countdown_type = obs.obs_data_get_int( settings, "countdown_type" )
	sw_hours_saved = obs.obs_data_get_int( settings, "sw_hours_saved" )
	cycle_direction = obs.obs_data_get_int( settings, "cycle_direction" )
	sw_current_seconds = obs.obs_data_get_double( settings, "sw_current_seconds" )
	load_saved_time = obs.obs_data_get_bool( settings, "load_saved_time" )
	sw_minutes_saved = obs.obs_data_get_int( settings, "sw_minutes_saved" )
	sw_seconds_saved = obs.obs_data_get_int( settings, "sw_seconds_saved" )	
	custom_time_format = obs.obs_data_get_string( settings, "custom_time_format" )
	toggle_mili_trigger = obs.obs_data_get_string( settings, "toggle_mili_trigger" )
	sw_milliseconds_saved = obs.obs_data_get_int( settings, "sw_milliseconds_saved" ) 
	media["note_source_marker_a"] = obs.obs_data_get_string( settings, "note_source_marker_a" )
	media["note_source_marker_b"] = obs.obs_data_get_string( settings, "note_source_marker_b" )
	longtimetext_s = string.gsub(obs.obs_data_get_string( settings, "day_text" ), "\\([n])", {n="\n"})
	longtimetext_p = string.gsub(obs.obs_data_get_string( settings, "days_text" ), "\\([n])", {n="\n"})
	media["note_marker_a"] = string.gsub(obs.obs_data_get_string( settings, "note_marker_a" ), "\\([n])", {n="\n"})
	media["note_marker_b"] = string.gsub(obs.obs_data_get_string( settings, "note_marker_b" ), "\\([n])", {n="\n"})
	--[[
				Used for source cycling
		
				default_seconds: Default Seconds
		
				the default timer state
		
				This is the state of the timer that will set or
				reset the time ( current_seconds ) 
		
				If the timer expires because current_seconds == 0, 
				then the time ( current_seconds ) will be be restarted
				from default_seconds for another function such as source cycling.
		
				Every instance that a timer time is defined, we must record it to default_seconds
	]]
	default_seconds = current_seconds 
	split_type = obs.obs_data_get_int( settings, "split_type" )
	stop_text = obs.obs_data_get_string( settings, "stop_text" )
	next_scene = obs.obs_data_get_string( settings, "next_scene" )
	import_list = obs.obs_data_get_string( settings, "import_list" )
	split_source = obs.obs_data_get_string( settings, "split_source" )
    disable_script = obs.obs_data_get_bool( settings,"disable_script" )
	recording_type = obs.obs_data_get_int( settings, "recording_type" )
	backup_folder = obs.obs_data_get_string( settings, "backup_folder" )
	active_source = obs.obs_data_get_string( settings, "active_source" )	
	start_recording = obs.obs_data_get_int( settings, "start_recording" )
	load_saved_time = obs.obs_data_get_bool( settings, "load_saved_time" )
    start_on_visible = obs.obs_data_get_bool( settings,"start_on_visible" )														
	media["color_normal"] = obs.obs_data_get_int( settings, "color_normal" )
	media["color_marker_b"] = obs.obs_data_get_int( settings, "color_marker_b" )
	media["color_marker_a"] = obs.obs_data_get_int( settings, "color_marker_a" )
	media["text_marker_a"] = obs.obs_data_get_string( settings, "text_marker_a" )							
	media["text_marker_b"] = obs.obs_data_get_string( settings, "text_marker_b" )
	media_playback_limit = obs.obs_data_get_int( settings, "media_playback_limit" )
    start_on_scene_active = obs.obs_data_get_bool( settings,"start_on_scene_active" )
    force_reset_on_visible = obs.obs_data_get_bool( settings,"force_reset_on_visible" )	
	media["source_name_audio_marker_a"] = obs.obs_data_get_string( settings, "audio_marker_a" )
	media["source_name_audio_marker_b"] = obs.obs_data_get_string( settings, "audio_marker_b" )	
    active_source_force_visible = obs.obs_data_get_bool( settings,"active_source_force_visible" )
	text_prefix = string.gsub(obs.obs_data_get_string( settings, "text_prefix" ), "\\([n])", {n="\n"})
	text_suffix = string.gsub(obs.obs_data_get_string( settings, "text_suffix" ), "\\([n])", {n="\n"})
	if media_playback_limit ~= 1 then
		media["duration_marker_a"] = obs.obs_data_get_int( settings, "duration_marker_a" )
		media["duration_marker_b"] = obs.obs_data_get_int( settings, "duration_marker_b" )
	else
		media["duration_marker_a"] = 0
		media["duration_marker_b"] = 0
	end
	
	timer_mode_changed = ( last_timer_mode ~= timer_mode )
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
	import_folder = import_folder .. "/" .. import_list .. ".json"
	import_folder = import_folder:gsub([[\]], "/");
	if obs.os_file_exists( import_folder ) then
		data = obs.obs_data_create_from_json_file( import_folder )
		if data ~= nil then
			obs.obs_data_apply( settings, data )
			obs.obs_data_set_string( settings, "import_list", "select")
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
	local day_value = obs.obs_data_get_int( settings, "day" )-- -- Retrieves property value from reference
	local year_value = obs.obs_data_get_int( settings, "year" )-- -- Retrieves property value from reference
	local month_value = obs.obs_data_get_int( settings, "month" )-- -- Retrieves property value from reference
	local config_value = obs.obs_data_get_int( settings, "config" )-- -- Retrieves property value from reference
	local timer_mode_value = obs.obs_data_get_int( settings, "timer_mode" )-- -- Retrieves property value from reference
	local backup_mode_value = obs.obs_data_get_bool( settings, "backup_mode" )-- -- Retrieves property value from reference
	local enable_marker_notes_value = obs.obs_data_get_int( settings, "enable_marker_notes" )-- -- Retrieves property value from reference
	local import_list_value = obs.obs_data_get_string( settings, "import_list" )-- -- Retrieves property value from reference
	local next_scene_value = obs.obs_data_get_string( settings, "next_scene" )	-- -- Retrieves property value from reference
	local timer_options_value = obs.obs_data_get_int( settings, "timer_options" )-- -- Retrieves property value from reference
	local timer_source_value = obs.obs_data_get_string( settings, "timer_source" )-- -- Retrieves property value from reference
	local split_source_value = obs.obs_data_get_string( settings, "split_source" )-- -- Retrieves property value from reference
	local set_stopwatch_value = obs.obs_data_get_bool( settings, "set_stopwatch" )-- -- Retrieves property value from reference
	local countdown_type_value = obs.obs_data_get_int( settings, "countdown_type" )-- -- Retrieves property value from reference
	local active_source_value = obs.obs_data_get_string( settings, "active_source" )-- -- Retrieves property value from reference
	local start_recording_value = obs.obs_data_get_int( settings, "start_recording" )-- -- Retrieves property value from reference
	local trigger_options_value = obs.obs_data_get_int( settings, "trigger_options" )-- -- Retrieves property value from reference
	local note_source_marker_a_value = obs.obs_data_get_string( settings, "note_source_marker_a" )-- -- Retrieves property value from reference
	local note_source_marker_b_value = obs.obs_data_get_string( settings, "note_source_marker_b" )-- -- Retrieves property value from reference
	local media_playback_limit_value = obs.obs_data_get_int( settings, "media_playback_limit" )-- -- Retrieves property value from reference
	--[[
	
			 BACKUP PROPERTIES
	
	]]	
	local backup_mode_prop = obs.obs_properties_get( props, "backup_mode" )
	local import_list_prop = obs.obs_properties_get( props, "import_list" )
	--[[
	
			 TIMER PROPERTIES
	
	]]
	local mili_button_prop = obs.obs_properties_get( props, "mili_button" )
	local timer_source_prop = obs.obs_properties_get( props, "timer_source" )
	local pause_button_prop = obs.obs_properties_get( props, "pause_button" )
	local timer_options_prop = obs.obs_properties_get( props, "timer_options" )
	local custom_time_format_prop = obs.obs_properties_get( props, "custom_time_format" )
	local toggle_mili_trigger_prop = obs.obs_properties_get( props, "toggle_mili_trigger" )
	--[[
	
			 STOPWATCH PROPERTIES
	
	]]
	local _group_1_prop = obs.obs_properties_get( props, "_group_1" )
	local set_stopwatch_prop = obs.obs_properties_get( props, "set_stopwatch" )
	local timer_display_prop = obs.obs_properties_get( props, "timer_display" )
	--[[
	
			 COUNTDOWN PROPERTIES
	
	]]	
	local day_prop = obs.obs_properties_get( props, "day" )
	local year_prop = obs.obs_properties_get( props, "year" )
	local month_prop = obs.obs_properties_get( props, "month" )
	local day_text_prop = obs.obs_properties_get( props, "day_text" )
	local days_text_prop = obs.obs_properties_get( props, "days_text" )
	local stop_text_prop = obs.obs_properties_get( props, "stop_text" )
	local cycle_list_prop = obs.obs_properties_get( props, "cycle_list" )
	local text_prefix_prop = obs.obs_properties_get( props, "text_prefix" )
	local text_suffix_prop = obs.obs_properties_get( props, "text_suffix" )
	local active_source_prop = obs.obs_properties_get( props, "active_source" )
	local recording_type_prop = obs.obs_properties_get( props, "recording_type" )
	local cycle_direction_prop = obs.obs_properties_get( props, "cycle_direction" )
	local as_visible_prop = obs.obs_properties_get( props, "active_source_force_visible" )
	--[[
	
			 PROPERTIES
	
	]]	
	local hours_prop = obs.obs_properties_get( props, "hours" )
	local minutes_prop = obs.obs_properties_get( props, "minutes" )
	local seconds_prop = obs.obs_properties_get( props, "seconds" )
	local split_type_prop = obs.obs_properties_get( props, "split_type" )
	local next_scene_prop = obs.obs_properties_get( props, "next_scene" )
	local split_button_prop = obs.obs_properties_get( props, "split_button" )
	local split_source_prop = obs.obs_properties_get( props, "split_source" )
	local timer_format_prop = obs.obs_properties_get( props, "timer_format" )
	local color_normal_prop = obs.obs_properties_get( props, "color_normal" )
	local reset_button_prop = obs.obs_properties_get( props, "reset_button" )
	local countdown_type_prop = obs.obs_properties_get( props, "countdown_type" )
	local start_recording_prop = obs.obs_properties_get( props, "start_recording" )
	--[[
	
			 PROPERTIES
	
	]]
	local export_button_prop = obs.obs_properties_get( props, "export_button" )
	local import_button_prop = obs.obs_properties_get( props, "import_button" )
	local export_folder_prop = obs.obs_properties_get( props, "backup_folder" )
	local disable_script_prop = obs.obs_properties_get( props, "disable_script" )
	local start_on_visible_prop = obs.obs_properties_get( props, "start_on_visible" )
	local force_reset_on_visible_prop = obs.obs_properties_get( props, "force_reset_on_visible" )
	local start_on_scene_active_prop = obs.obs_properties_get( props, "start_on_scene_active" )
	--[[
	
			WARNING & CAUTION PROPERTIES
	
	]]
	local to_prop = obs.obs_properties_get( props, "trigger_options" )
	local c_note_prop = obs.obs_properties_get( props, "note_marker_a" )
	local w_note_prop = obs.obs_properties_get( props, "note_marker_b" )
	local enable_marker_notes_prop = obs.obs_properties_get( props, "enable_marker_notes" )
	local text_marker_a_prop = obs.obs_properties_get( props, "text_marker_a" )
	local text_marker_b_prop = obs.obs_properties_get( props, "text_marker_b" )
	local color_marker_a_prop = obs.obs_properties_get( props, "color_marker_a" )
	local color_marker_b_prop = obs.obs_properties_get( props, "color_marker_b" )
	local audio_marker_a_prop = obs.obs_properties_get( props, "audio_marker_a" )
	local audio_marker_b_prop = obs.obs_properties_get( props, "audio_marker_b" )
	local cn_source_prop = obs.obs_properties_get( props, "note_source_marker_a" )
	local wn_source_prop = obs.obs_properties_get( props, "note_source_marker_b" )
	local duration_marker_a_prop = obs.obs_properties_get( props, "duration_marker_a" )
	local duration_marker_b_prop = obs.obs_properties_get( props, "duration_marker_b" )
	local media_playback_limit_prop = obs.obs_properties_get( props, "media_playback_limit" )
	--[[
			TIMER INPUTS
	]]	
	obs.obs_property_set_visible( custom_time_format_prop, timer_format == 5 )
	obs.obs_property_set_visible( timer_options_prop, config_value == 2 )
	obs.obs_property_set_visible( timer_display_prop, config_value == 2 and timer_mode_value == 2 and timer_options_value == 2  )
	--[[
	
			TIMER STOPWATCH INPUTS
			
			if config is set to basic then hide
			if config is set to advanced then check if timer_options are expanded then show
	]]	
	obs.obs_property_set_visible( split_button_prop, timer_mode_value == 1 )
	obs.obs_property_set_visible( text_prefix_prop, config_value == 2 and timer_options_value == 2 )
	obs.obs_property_set_visible( text_suffix_prop, config_value == 2 and timer_options_value == 2 )
	obs.obs_property_set_visible( timer_format_prop, config_value == 2 and timer_options_value == 2 )	
	obs.obs_property_set_visible( color_normal_prop, config_value == 2 and timer_options_value == 2  )
	obs.obs_property_set_visible( set_stopwatch_prop, ( config_value == 2 and timer_mode_value == 1 and timer_options_value == 2 ) )
	obs.obs_property_set_visible( timer_source_prop, ( config_value == 2 and timer_options_value == 2 ) )
	obs.obs_property_set_visible( split_type_prop, timer_mode_value == 1 and config_value == 2 and timer_options_value == 2 )
	obs.obs_property_set_visible( split_source_prop, timer_mode_value == 1 and config_value == 2 and timer_options_value == 2 )
	obs.obs_property_set_visible( _group_1_prop, ( config_value == 2 and set_stopwatch_value and timer_mode_value == 1 and timer_options_value == 2 ) )
	--[[
	
			TIMER COUNTDOWN INPUTS
			
			if config is set to basic then hide
			if config is set to advanced then check if timer_options are expanded then show
	]]		
	
	obs.obs_property_set_visible( recording_type_prop, false )
	obs.obs_property_set_enabled( day_prop, month_value ~= 1 )
	obs.obs_property_set_enabled( year_prop, month_value ~= 1 )
	obs.obs_property_set_visible( mili_button_prop, toggle_mili_trigger == "" and timer_mode_value == 2  )
	obs.obs_property_set_visible( toggle_mili_trigger_prop, show_split( props, settings ) and timer_options_value == 2 )
	obs.obs_property_set_visible( hours_prop, config_value == 2 and timer_mode_value == 2 and timer_options_value == 2  )
	obs.obs_property_set_visible( minutes_prop, config_value == 2 and timer_mode_value == 2 and timer_options_value == 2  ) 
	obs.obs_property_set_visible( seconds_prop, config_value == 2 and timer_mode_value == 2 and timer_options_value == 2  ) 
	obs.obs_property_set_visible( next_scene_prop, config_value == 2 and timer_mode_value == 2 and timer_options_value == 2  )
	obs.obs_property_set_visible( countdown_type_prop, config_value == 2 and timer_mode_value == 2 and timer_options_value == 2 )
	obs.obs_property_set_visible( start_recording_prop, config_value == 2 and timer_mode_value == 2 and timer_options_value == 2 )
	obs.obs_property_set_visible( recording_type_prop, config_value == 2 and start_recording_value == 1 and timer_mode_value == 2 )	
	obs.obs_property_set_visible( stop_text_prop, next_scene_value == "TIMER END TEXT" and  timer_mode_value == 2 and timer_options_value == 2 )	
	obs.obs_property_set_visible( day_prop, countdown_type_value == 1 and config_value == 2 and timer_mode_value == 2 and timer_options_value == 2 )
	obs.obs_property_set_visible( year_prop, countdown_type_value == 1 and config_value == 2 and timer_mode_value == 2 and timer_options_value == 2 )
	obs.obs_property_set_visible( month_prop, countdown_type_value == 1 and config_value == 2 and timer_mode_value == 2 and timer_options_value == 2 )
	obs.obs_property_set_visible( day_text_prop, countdown_type_value == 1 and config_value == 2 and timer_mode_value == 2 and timer_format ~= 5 and timer_options_value == 2 )
	obs.obs_property_set_visible( days_text_prop, countdown_type_value == 1 and config_value == 2 and timer_mode_value == 2 and timer_format ~= 5 and timer_options_value == 2 )
	obs.obs_property_set_visible( cycle_list_prop, ( (next_scene_value == "Source List" or next_scene_value == "Scene List") and timer_mode_value == 2 and config_value == 2 and timer_options_value == 2 ) )
	obs.obs_property_set_visible( active_source_prop, ( (next_scene_value == "Source List" or next_scene_value == "Scene List") and timer_mode_value == 2 and config_value == 2 and timer_options_value == 2 ) )
	obs.obs_property_set_visible( as_visible_prop, ( (next_scene_value == "Source List" or next_scene_value == "Scene List") and timer_mode_value == 2 and config_value == 2 and timer_options_value == 2 ) )
	obs.obs_property_set_visible( cycle_direction_prop, ( (next_scene_value == "Source List" or next_scene_value == "Scene List") and timer_mode_value == 2 and config_value == 2 and timer_options_value == 2 ) )
	--[[
	
			WARNING & CAUTION INPUTS
			
			if config is set to basic then hide
			if config is set to advanced then check if trigger_options are expanded then show
	]]
	obs.obs_property_set_visible( to_prop, ( config_value == 2 ) )
	obs.obs_property_set_visible( enable_marker_notes_prop, ( config_value == 2 and trigger_options_value == 2 ))
	obs.obs_property_set_visible( text_marker_a_prop, ( config_value == 2 and trigger_options_value == 2 ) )
	obs.obs_property_set_visible( text_marker_b_prop, ( config_value == 2 and trigger_options_value == 2 ) )
	obs.obs_property_set_visible( audio_marker_a_prop, ( config_value == 2 and trigger_options_value == 2 ) )
	obs.obs_property_set_visible( audio_marker_b_prop, ( config_value == 2 and trigger_options_value == 2) )
	obs.obs_property_set_visible( color_marker_a_prop, ( config_value == 2 and trigger_options_value == 2 ) )
	obs.obs_property_set_visible( color_marker_b_prop, ( config_value == 2 and trigger_options_value == 2 ) )
	obs.obs_property_set_visible( media_playback_limit_prop, ( config_value == 2 and trigger_options_value == 2) )
	obs.obs_property_set_visible( c_note_prop, ( config_value == 2 and enable_marker_notes_value ~= 1 and trigger_options_value == 2 ) )
	obs.obs_property_set_visible( w_note_prop, ( config_value == 2 and enable_marker_notes_value ~= 1 and trigger_options_value == 2 ) )
	obs.obs_property_set_visible( cn_source_prop, ( config_value == 2 and enable_marker_notes_value ~= 1 and trigger_options_value == 2 ) )
	obs.obs_property_set_visible( wn_source_prop, ( config_value == 2 and enable_marker_notes_value ~= 1 and trigger_options_value == 2 ) )
	obs.obs_property_set_visible( duration_marker_a_prop, ( config_value == 2 and trigger_options_value == 2 and media_playback_limit_value == 2 ) )
	obs.obs_property_set_visible( duration_marker_b_prop, ( config_value == 2 and trigger_options_value == 2 and media_playback_limit_value == 2 ) )
	--[[
	
			BACKUP SETTINGS INPUTS
	
	]]	
	obs.obs_property_set_visible( backup_mode_prop, ( config_value == 2 ))
	obs.obs_property_set_visible( import_list_prop, backup_mode_value and config_value == 2 )
	obs.obs_property_set_visible( export_button_prop, backup_mode_value and config_value == 2 )
	obs.obs_property_set_visible( import_button_prop, backup_mode_value and config_value == 2 )
	obs.obs_property_set_visible( export_folder_prop, backup_mode_value and config_value == 2 )
	obs.obs_property_set_visible( import_button_prop, import_list_value ~= "select" and  import_list_value ~= "" and config_value == 2 )
	--[[
	
			OTHER INPUTS
	
	]]		
	obs.obs_property_set_visible( disable_script_prop, config_value == 2 )
	obs.obs_property_set_visible( start_on_visible_prop, config_value == 2 )
	obs.obs_property_set_visible( force_reset_on_visible_prop, config_value == 2 and start_on_visible )
	obs.obs_property_set_visible( start_on_scene_active_prop, config_value == 2 )
	--[[
		
		Try to prevent reference conflicts
	
	]]	
	if ( in_table( {timer_source_value, split_source_value, active_source_value, note_source_marker_b_value}, note_source_marker_a_value ) ) then
		obs.obs_data_set_string( settings, "note_source_marker_a", "select" ) -- Don"t allow timer and marker_a note text source to be the same
	end 
	if ( in_table( {timer_source_value, split_source_value, active_source_value, note_source_marker_a_value}, note_source_marker_b_value ) ) then
		obs.obs_data_set_string( settings, "note_source_marker_b", "select" ) -- Don"t allow timer and marker_b note text source to be the same
	end 	
	if ( in_table( {timer_source_value, split_source_value, note_source_marker_a_value, note_source_marker_b_value}, active_source_value ) ) then
		obs.obs_data_set_string( settings, "active_source", "select" ) -- Don"t allow timer and active text source to be the same
	end
	if countdown_type_value == 1 and month_value ~= 1 and day_value == 0 then
		obs.obs_data_set_int( settings, "day", 1 ) -- set to at least 1, else the timer won"t know it is at zero
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
		obs.obs_property_set_description( mili_button_prop, "Hide Milliseconds" )
	else
		obs.obs_property_set_description( mili_button_prop, "Show Milliseconds" )
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
	if timer_mode_value == 2 then
		obs.obs_property_set_description( reset_button_prop, "Reset Countdown" )
	else
		--[[

			Timer type is Stopwatch?
			Set button labels

		]]
		obs.obs_property_set_description( reset_button_prop, "Reset Stopwatch" )	
	end	
	--[[

		Set button labels

	]]
	if timer_mode_value == 2 then
		if timer_active then
			obs.obs_property_set_description( pause_button_prop, "Start/Pause Countdown" )
		else
			obs.obs_property_set_description( pause_button_prop, "Start Countdown" )
		end
	else
		if timer_active then
			obs.obs_property_set_description( pause_button_prop, "Start/Pause Stopwatch" )
		else
			obs.obs_property_set_description( pause_button_prop, "Start Stopwatch" )
		end
	end	
	--[[

		Rebuild backup file list

	]]	
	local filenames = get_filenames( backup_folder, ".json" )
	local has_file_list = ( table.getn( filenames ) > 0 )
	if obs.os_file_exists( backup_folder ) then	
		obs.obs_property_list_clear( import_list_prop )
		obs.obs_property_list_add_string( import_list_prop, "Select", "select" )
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
	Description:	

	Credit:			

	Modified:		

	function:		
	type:			
	input type: 	
	returns:		
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function cycle_source_list( source_type )
		reset( true ) -- Reset the timer
		cycle_source_list_by_source_type( source_type )
		--[[
			Set timer_active for it to self-start
		]]	
		--timer_active = false
		on_pause( true ) -- Restart the timer
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
	--[[
		If user wants recording to start when timer ended, now is a good timer to initiate recording
		NOTE: Recording will only be started, if it is not already recording
	]]	
	delayed_recording()
	--[[
		Force media playback to end, if the media is looping
	]]		
	stop_looping_media( "marker_a" )
	stop_looping_media( "marker_b" )
	--[[
		Timer expired and a scene change is requested.
	]]	
	if not in_table( {"TIMER END TEXT", "Source List", "Scene List", "Select"}, next_scene ) then
		
		
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
			--[[

				timer_mode: countdown only

				timer_active: timer not running

				define > set_to_default: (true) * Timer time expired and the timer time needs to be set to the default state, so we do want to set the settings to default.
				define > new_settings: not required here because we will use the global (script_settings)

				purpose: The timer is completed and we need to provide instant feedback output to the timer display (timer text source)
			]]
			
			--[[
			
				used to be fresh_start
				set_to_default: 	true		false
				timer_active: 		true		false
				activated:			true		false
				timer_expired:		false		true
				update_timer_settings ---> set_time_text ---> timer_ended ---> update_timer_settings -- death loop
			]]
			update_timer_settings( true ) -- optional inputs: set_to_default(bool), new_settings(obs_property_data/obs_userdata) 
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

	if next_scene == "Source List" then
		cycle_source_list( "source" )
	end	

	if next_scene == "Scene List" then
		cycle_source_list( "scene" )
	end	

	if next_scene == "TIMER END TEXT" then
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
	local p_1 = obs.obs_properties_add_list( props, "timer_mode", "<b>Timer Type</b>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT )
  	t_type = {"Stopwatch", "Countdown"} -- Add options to the list
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_1, v, i ) end -- This list is auto indexed thus have an interger reference containing a string value
 	--[[
		Option list: User select to access Basic or Advanced Features.
		This provides UI layout options to enhance the user experience.
		Changing this setting does not impact any function or result. 
		 
		This property is referenced to trigger an onchange event listener.
	]]
	local p_2 = obs.obs_properties_add_list( props, "config", "<font color=".. font_dimmed ..">Configuration</font>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT )
  	t_type = {"Basic", "Advanced"} -- Adds options to the list
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_2, v, i ) end -- This list is auto indexed thus have an interger reference containing a string value
 	--[[
		Option list: User select to access show or hide available features.
		This provides UI layout options to enhance the user experience.
		Changing this setting does not impact any function or result. 
		 
		This property is referenced to trigger an onchange event listener.
	]]	
	local p_3 = obs.obs_properties_add_list( props, "timer_options", "<font color=".. font_dimmed .."><b>Timer Settings</b></font>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT )
	 t_type = {"Hidden", "Expanded"} -- Add options to the list
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_3, v, i ) end -- This list is auto indexed thus have an interger reference containing a string value
	obs.obs_property_set_long_description( p_3, "\nExpand or hide additional timer options.\n" ) -- User Tip
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
	local p_4 = obs.obs_properties_add_list( props, "timer_source", "<i>Timer Source</i>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING )
	obs.obs_property_list_add_string( p_4, "Select", "select" ) -- Adds a default option to the list. First (top-most) list item. If selected the option is ignored. 
	local list = {} -- Define a table variable to be used to build lists that will be passed to the property list
	if sources ~= nil then
		for _, source in ipairs( sources ) do -- ipairs cycles auto incrimented items
			source_id = obs.obs_source_get_unversioned_id( source ) -- unversioned_id will not be affected by language settings
			if source_id == "text_gdiplus" or source_id == "text_ft2_source" then -- identify text type sources only
				local name = obs.obs_source_get_name( source ) -- Get the source name, this will be a unique identifier 
				--[[
					boolean check, is the source (name) already selected for another item? 
					This will help to limit conflicts to prevent using a single source for two sperate functions
				]]
				if not in_table( {split_source, active_source, media["note_source_marker_a"], media["note_source_marker_b"]}, name ) then -- boolean check
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
	local p_5 = obs.obs_properties_add_list( props, "countdown_type", "<font color=".. font_dimmed ..">Countdown Type</font>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT )
  	t_type = {"Specific Date & Time", "Hours, Minutes, Seconds"} -- Add options to the list
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_5, v, i ) end -- This list is auto indexed thus have an interger reference containing a string value
	--[[
		 Text Field
	]]	
	local p_6 = obs.obs_properties_add_text( props, "day_text", "<font color=".. font_dimmed ..">Day Text Format</font>", obs.OBS_TEXT_DEFAULT )
	obs.obs_property_set_long_description( p_6, "\nUsed to distinguish between singular and plural days format. Use this for singular.\n" ) -- User Tip
	--[[
		 Text Field
	]]	
	local p_7 = obs.obs_properties_add_text( props, "days_text", "<font color=".. font_dimmed ..">Days Text Format</font>", obs.OBS_TEXT_DEFAULT )
	obs.obs_property_set_long_description( p_7, "\nUsed to distinguish between singular and plural days format. Use this for plural.\n" ) -- User Tip
  	 	--[[
		Option list: User select month reference to be used as control to set a timer for a future date.
		This provides function options that will impact on function and operation of the timer.
		Changing this setting will impact on the function or end result. 
		 
		This property is referenced to trigger an onchange event listener.
	]]	
	local p_8 = obs.obs_properties_add_list( props, "month", "<font color=".. font_dimmed ..">Month</font>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT )
  	t_type = {"Select", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"} -- Add options to the list
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_8, v, i ) end -- This list is auto indexed thus have an interger reference containing a string value
	--[[
		 Inerger Field
		 
		This property is referenced to trigger an onchange event listener.
	]]	
	local p_9 = obs.obs_properties_add_int( props, "year", "<font color=".. font_dimmed ..">Year</font>", 2022, 212021221, 1 )
 	--[[
		 Inerger Field
	]]	 	
	local p_10 = obs.obs_properties_add_int( props, "day", "<font color=".. font_dimmed ..">Day</font>", 1, 31, 1 )
	--[[
		 Inerger Field
	]]		
	local p_11 = obs.obs_properties_add_int( props, "hours", "<font color=".. font_dimmed ..">Hours</font>", 0, 23, 1 )
	obs.obs_property_int_set_suffix( p_11, " Hours" )
	--[[
		 Inerger Field
	]]		
	local p_12 = obs.obs_properties_add_int( props, "minutes", "<font color=".. font_dimmed ..">Minutes</font>", 0, 59, 1 )
	obs.obs_property_int_set_suffix( p_12, " Minutes" );
	--[[
		 Inerger Field
	]]		
	local p_13 = obs.obs_properties_add_int( props, "seconds", "<font color=".. font_dimmed ..">Seconds</font>", 0, 59, 1 )
	obs.obs_property_int_set_suffix( p_13, " Seconds" );
  	 	--[[
		Option list: User select a reference to be used as control format the timer timestamp.
		This provides function options that will impact on visual feedback and does not impact any function and operation of the timer.
		Changing this setting will impact on visual feedback and not function. 
		 
		This property is referenced to trigger an onchange event listener.
	]]		
	local p_14 = obs.obs_properties_add_list( props, "timer_format", "Timer Format", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT )
	t_type = {"Display full format", "No leading zeros", "No leading zeros, no split seconds", "No split seconds", "Custom Time Format"} -- Add options to the list
	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_14, v, i ) end -- This list is auto indexed thus have an interger reference containing a string value
	--[[
		 Text Field
		 
		This property is referenced to trigger an onchange event listener.
	]]	
	local p_15 = obs.obs_properties_add_text( props, "custom_time_format", "<font color=".. font_dimmed ..">Time Format</font>", obs.OBS_TEXT_DEFAULT )
	obs.obs_property_set_long_description( p_15, "\n Timestamp is represented by $D = day, $H = hour, $M = minute, $S = second, $F = split second.\n\n To trim leading zeros, include $T = truncate leading zeros. This will ONLY affect a format matching '$D:$H:$M:$S,$F' (00:00:00:00,00)\n" ) -- User Tip
	--[[
		 Text Field
		 
		This property is referenced to trigger an onchange event listener.
	]]	
	local p_16 = obs.obs_properties_add_text( props, "toggle_mili_trigger", "<font color=".. font_dimmed ..">Toggle Milliseconds</font>", obs.OBS_TEXT_DEFAULT )
	obs.obs_property_set_long_description( p_16, "\nUse format 00:00:00 ( hoursa:minutes:seconds )\n" ) -- User Tip
 	--[[
		Option list: User select a reference to be used as control to show or hide the time stamp when the timer expire.
		This provides function options that will impact visual feedback but will not impact operation and behaviour.
		Changing this setting will not impact on the function or end result. 
		 
		This property is referenced to trigger an onchange event listener.
	]]		
	local p_17 = obs.obs_properties_add_list( props, "timer_display", "Display", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT )
  	t_type = {"Show expired time stamp", "Remove expired time stamp"} -- Add options to the list
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_17, v, i ) end -- This list is auto indexed thus have an interger reference containing a string value
 	--[[
		Option list: User select <text-source> to be used as visual feedback indicating a snip of the time stamp.
		This provides function options that will impact on visual feedback to the user.
		Changing this setting will not impact on the function or end result. 
	]]
	local p_18 = obs.obs_properties_add_list( props, "split_source", "<i>Split Source</i>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING )
	obs.obs_property_list_add_string( p_18, "Select", "select" )  -- Adds a default option to the list. First (top-most) list item. If selected the option is ignored. 
	list = {} -- Reset / clear a defined table variable to be used to build lists that will be passed to the property list
	if sources ~= nil then
		for _, source in ipairs( sources ) do
			source_id = obs.obs_source_get_unversioned_id( source ) -- unversioned_id will not be affected by language settings
			if source_id == "text_gdiplus" or source_id == "text_ft2_source" then -- identify text type sources only
				local name = obs.obs_source_get_name( source )
			
				if not in_table( {timer_source, active_source, media["note_source_marker_a"], media["note_source_marker_b"]}, name ) then
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
  	
	local p_19 = obs.obs_properties_add_list( props, "split_type", "Split Type", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT )
  	t_type = {"Interval", "Mark", "Mark Interval", "Interval Mark"} -- Add options to the list
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_19, v, i ) end -- This list is auto indexed thus have an interger reference containing a string value
	obs.obs_property_set_long_description( p_19, "\nInterval = Time between current and previous split.\n\nMark = Time of split\n" ) -- User Tip
	--[[
		Option list: User select to show or hide available features.
		This provides UI layout options to enhance the user experience.
		Changing this setting does not impact any function or result. 
		 
		This property is referenced to trigger an onchange event listener.
	]]	
	local p_20 = obs.obs_properties_add_list( props, "trigger_options", "<font color=".. font_dimmed .."><b>Marker Settings</b></font>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT )
	 t_type = {"Hidden", "Expanded"} -- Add options to the list
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_20, v, i ) end -- This list is auto indexed thus have an interger reference containing a string value
	obs.obs_property_set_long_description( p_20, "\nExpand or hide additional options triggered by time stamps.\n" ) -- User Tip
	--[[
		 Text Field
	]]	
	local p_21 = obs.obs_properties_add_text( props, "text_marker_a", "<font color=".. font_dimmed ..">Marker A Time</font>", obs.OBS_TEXT_DEFAULT )
	obs.obs_property_set_long_description( p_21, "\nUse format 00:00:00 ( hoursa:minutes:seconds )\n" ) -- User Tip
	--[[
		 Text Field
	]]	
	local p_22 = obs.obs_properties_add_text( props, "text_marker_b", "<font color=".. font_dimmed ..">Marker B Time</font>", obs.OBS_TEXT_DEFAULT )
	obs.obs_property_set_long_description( p_22, "\nUse format 00:00:00 ( hoursa:minutes:seconds )\n" ) -- User Tip
  	 --[[
		Option list: User select <media-source> to be used as audio visual at a defined time.
		This provides function options that will impact on audio visual feedback to the user.
		Changing this setting will impact on a function or end result. 
	]]	
	local p_23 = obs.obs_properties_add_list( props, "audio_marker_a", "<font color=".. font_dimmed ..">Marker A Audio</font>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING )
	obs.obs_property_set_long_description( p_23, "\nSelect available media source to activate on defined time stamp.\n" ) -- User Tip
	obs.obs_property_list_add_string( p_23, "None", "none" ) -- Add options to the list
	if sources ~= nil then
		for _, source in ipairs( sources ) do
			source_id = obs.obs_source_get_unversioned_id( source ) -- unversioned_id will not be affected by language settings
			if source_id == "ffmpeg_source" then -- identify media type sources only
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
	local p_24 = obs.obs_properties_add_list( props, "audio_marker_b", "<font color=".. font_dimmed ..">Marker B Audio</font>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING )
	obs.obs_property_set_long_description( p_24, "\nSelect available media source to activate on defined time stamp.\n" ) -- User Tip
	obs.obs_property_list_add_string( p_24, "None", "none" ) -- Add options to the list
	if sources ~= nil then
		for _, source in ipairs( sources ) do
			source_id = obs.obs_source_get_unversioned_id( source ) -- unversioned_id will not be affected by language settings
			if source_id == "ffmpeg_source" then -- identify media type sources only
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
	local p_25 = obs.obs_properties_add_list( props, "media_playback_limit", "<i>Media Playback Limit</i>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT )
	 t_type = {"Disabled", "Enabled"} -- Add options to the list
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_25, v, i ) end -- This list is auto indexed thus have an interger reference containing a string value
	obs.obs_property_set_long_description( p_25, "\nSet a maximum time limit for media playback.\n" ) -- User Tip
	
	--*props, *name, *description, min, max, step
	obs.obs_properties_add_int_slider( props, "duration_marker_a", "Marker A Duration", 1, 10800, 1 )
	obs.obs_properties_add_int_slider( props, "duration_marker_b", "Marker B Duration", 1, 10800, 1 )
	obs.obs_properties_add_color( props, "color_normal", "Normal Color" )
	obs.obs_properties_add_color( props, "color_marker_a", "Marker A Color" )
	obs.obs_properties_add_color( props, "color_marker_b", "Marker B Color" )
  	 --[[
		Option list: User select a reference to be used as control to enable text notice for the two time triggers.
		This provides UI layout options to expand feature options.
		Changing this setting will impact on UI and feature options. 
		 
		This property is referenced to trigger an onchange event listener.
	]]	
	local p_26 = obs.obs_properties_add_list( props, "enable_marker_notes", "<i>Marker Notes</i>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT )
	 t_type = {"Disabled", "Enabled"} -- Add options to the list
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_26, v, i ) end -- This list is auto indexed thus have an interger reference containing a string value
	obs.obs_property_set_long_description( p_26, "\nAllows a note to be displayed when the timer match Marker A and Marker B timestamps.\n" ) -- User Tip
	 --[[
		Option list: User select <text-source> to be used as visual feedback indicating a message at a determined time of the timer.
		This provides function options that will impact on visual feedback to the user.
		Changing this setting will not impact on the function or end result. 
	]]
	local p_27 = obs.obs_properties_add_list( props, "note_source_marker_a", "<i>Marker A Note Source</i>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING )
	obs.obs_property_list_add_string( p_27, "Select", "select" )  -- Adds a default option to the list. First (top-most) list item. If selected the option is ignored. 
	list = {} -- Reset / clear a defined table variable to be used to build lists that will be passed to the property list
	if sources ~= nil then
		for _, source in ipairs( sources ) do
			source_id = obs.obs_source_get_unversioned_id( source ) -- unversioned_id will not be affected by language settings
			if source_id == "text_gdiplus" or source_id == "text_ft2_source" then -- identify text type sources only
				local name = obs.obs_source_get_name( source )
				if not in_table( {timer_source, split_source, active_source, media["note_source_marker_b"]}, name ) then
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
	local p_28 = obs.obs_properties_add_list( props, "note_source_marker_b", "<i>Marker B Note Source</i>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING )
	obs.obs_property_list_add_string( p_28, "Select", "select" )  -- Adds a default option to the list. First (top-most) list item. If selected the option is ignored. 
	list = {} -- Reset / clear a defined table variable to be used to build lists that will be passed to the property list
	if sources ~= nil then
		for _, source in ipairs( sources ) do
			source_id = obs.obs_source_get_unversioned_id( source ) -- unversioned_id will not be affected by language settings
			if source_id == "text_gdiplus" or source_id == "text_ft2_source" then -- identify text type sources only
				local name = obs.obs_source_get_name( source )
				if not in_table( {timer_source, split_source, active_source, media["note_source_marker_a"]}, name ) then
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
	local p_29 = obs.obs_properties_add_text( props, "note_marker_a", "<font color=".. font_dimmed ..">Marker A Note</font>", obs.OBS_TEXT_DEFAULT )
	obs.obs_property_set_long_description( p_29, "\nDisplay a note when Marker A is Activated.\n" ) -- User Tip
	--[[
		 Text Field
	]]	
	local p_30 = obs.obs_properties_add_text( props, "note_marker_b", "<font color=".. font_dimmed ..">Marker B Note</font>", obs.OBS_TEXT_DEFAULT )
	obs.obs_property_set_long_description( p_30, "\nDisplay a note when Marker B is Activated.\n" ) -- User Tip
	--[[
		Option list: User select a reference to be used as control to enable an auto start recording feature.
		This provides function options to change a function behaviour.
		Changing this setting will impact on features and operation. 
		 
		This property is referenced to trigger an onchange event listener.
	]]
	local p_31 = obs.obs_properties_add_list( props, "start_recording", "Auto Recording", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT )
	obs.obs_property_set_long_description( p_31, "\nEnable recording options\n" ) -- User Tip
	t_type = {"Yes", "No"} -- Add options to the list
	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_31, v, i ) end -- This list is auto indexed thus have an interger reference containing a string value
	-- Combo list filled with the options from _type
  	
	local p_32 = obs.obs_properties_add_list( props, "recording_type", "Recording", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT )
	obs.obs_property_set_long_description( p_32, "\nSelect whne to start recording\n" ) -- User Tip
  	t_type = {"Timer Expires", "Marker A Time", "Marker B Time", "Timer Visible", "Timer Start"} -- Add options to the list
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_32, v, i ) end -- This list is auto indexed thus have an interger reference containing a string value	
	--[[
		 Text Field
	]]
	local p_33 = obs.obs_properties_add_text( props, "text_prefix", "<font color=#fefceb>Timer Prefix</font>", obs.OBS_TEXT_DEFAULT )
	obs.obs_property_set_long_description( p_33, "\nDefine text placed before the Timer\n" ) -- User Tip
	--[[
		 Text Field
	]]
	local p_34 = obs.obs_properties_add_text( props, "text_suffix", "<font color=#fefceb>Timer Suffix</font>", obs.OBS_TEXT_DEFAULT )
	obs.obs_property_set_long_description( p_34, "\nDefine text placed after the Timer\n" ) -- User Tip
  	--[[
		Option list: User select <text-source> to be used as visual feedback indicating a source name that is targeted.
		This provides function options that will impact on visual feedback to the user.
		Changing this setting will impact on the function or end result. 
	]]	  	
	local p_35 = obs.obs_properties_add_list( props, "active_source", "<i>Active Source</i>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING )
	obs.obs_property_set_long_description( p_35, "\nSelect a text source, that will be used to show the name for the current active Source or Scene\n" ) -- User Tip
	obs.obs_property_list_add_string( p_35, "Select", "select" )  -- Adds a default option to the list. First (top-most) list item. If selected the option is ignored. 
	list = {} -- Reset / clear a defined table variable to be used to build lists that will be passed to the property list
	if sources ~= nil then
		for _, source in ipairs( sources ) do
			source_id = obs.obs_source_get_unversioned_id( source ) -- unversioned_id will not be affected by language settings
			if source_id == "text_gdiplus" or source_id == "text_ft2_source" then -- identify text type sources only
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
	local p_36 = obs.obs_properties_add_list( props, "next_scene", "<i>Next Scene</i>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING )
	obs.obs_property_set_long_description( p_36, "\nDefine what happens afater timer ends\n" ) -- User Tip
	t_type = {"Select", "TIMER END TEXT", "Source List", "Scene List"} -- Add options to the list
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
	local p_37 = obs.obs_properties_add_text( props, "stop_text", "<font color=#fef1eb>Timer End Text</font>", obs.OBS_TEXT_DEFAULT )
	obs.obs_property_set_long_description( p_37, "\nDefine text displayed when timer ended\n" ) -- User Tip
	 --[[
		Editable Option list: User adds a text name as an entry used as a reference to be used as inditification of a source.
		This provides function options to change feature behaviour.
		Changing this setting will impact on feature options and behaviour. 
	]]	
	local p_38 = obs.obs_properties_add_editable_list( props, "cycle_list", "Cycle List", obs.OBS_EDITABLE_LIST_TYPE_STRINGS, nil, nil )
	
	 --[[
		Option list: User select a reference to be used as control to determine a cycling direction.
		This provides function options to change feature behaviour.
		Changing this setting will impact on feature options. 
	]]
	local p_39 = obs.obs_properties_add_list( props, "cycle_direction", "<i>Cycle Direction</i>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT )
	 t_type = {"Ascending", "Descending"} -- Add options to the list
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_39, v, i ) end -- This list is auto indexed thus have an interger reference containing a string value
	obs.obs_property_set_long_description( p_39, "\nSelect the rotation direction of lists.\n" ) -- User Tip
	 --[[
		Wrap and group properties together.
		Thise group provides options to the user to define a custom time value used as a start point for a stopwatch to continue from
	]]		
	local group_props_1 = obs.obs_properties_create()
	obs.obs_properties_add_group( props, "_group_1", "Stopwatch Start Point", obs.OBS_GROUP_NORMAL, group_props_1 )
	local p_40 = obs.obs_properties_add_int( group_props_1, "sw_hours_saved", "HH", 0, 23, 1)
	local p_41 = obs.obs_properties_add_int( group_props_1, "sw_minutes_saved", "MM", 0, 59, 1)
	local p_42 = obs.obs_properties_add_int( group_props_1, "sw_seconds_saved", "SS", 0, 59, 1)
	local p_43 = obs.obs_properties_add_int( group_props_1, "sw_milliseconds_saved", "FF", 0, 99, 1)
	local p_44 = obs.obs_properties_add_bool( group_props_1, "load_saved_time", "Load last saved time on startup" )
	local p_45 = obs.obs_properties_add_button( group_props_1, "sw_button", "Set", sw_saved_button_clicked )
	--[[
		Hidden Value
		We save last count in the properties for when OBS shuts down and starts again
	]]
	local p_46 = obs.obs_properties_add_float( group_props_1, "sw_current_seconds", "Saved Seconds", 0, 3600000000, 0.1)
	obs.obs_property_set_visible( p_46 , false )
	 --[[
		Property Button: User interaction that will start, pause or stop a timer.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]	
	local p_47 = obs.obs_properties_add_button( props, "pause_button", "Start", pause_button_clicked )
	 --[[
		Property Button: User interaction that will mark a timer timestamp.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour. 
	]]		
	obs.obs_properties_add_button( props, "split_button", "Split Time", split_button_clicked )
	 --[[
		Property Button: User interaction that will start, pause or stop a timer.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
		 
		This property is referenced to trigger an onchange event listener.
	]]
	local p_48 = obs.obs_properties_add_button( props, "mili_button", "Show Milliseconds", mili_button_clicked )
	 --[[
		Property Button: User interaction that will reset a timer.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]
	local p_49 = obs.obs_properties_add_button( props, "reset_button", "Reset Stopwatch", reset_button_clicked )	
	 --[[
		Property Checkbox: User interaction that enable setting a custom stopwatch start timestamp.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
		 
		This property is referenced to trigger an onchange event listener.
	]]
	local p_50 = obs.obs_properties_add_bool( props, "set_stopwatch", "Set Stopwatch" )	
	 --[[
		Property Checkbox: User interaction that will start timer if timer source becomes visible.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]
    local p_51 = obs.obs_properties_add_bool( props, "start_on_visible", "Start Timer on Source Visible" )
	 --[[
		Property Checkbox: User interaction that will disable the plugin.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]
    obs.obs_properties_add_bool( props, "force_reset_on_visible", "Reset timer on Source Visible" )
	 --[[
		Property Checkbox: User interaction that will start timer if scene with timer source becomes active.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]
    obs.obs_properties_add_bool( props, "start_on_scene_active", "Start Timer on Scene Active" )
	 --[[
		Property Checkbox: User interaction that toggle active source visibility.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]
    obs.obs_properties_add_bool( props, "active_source_force_visible", "Toggle Active Source Visibility" )
	 --[[
		Property Checkbox: User interaction that will disable the plugin.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]
    obs.obs_properties_add_bool( props, "disable_script", "Disable Script" )
	 --[[
		Property Checkbox: User interaction that will enable backup options.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
		 
		This property is referenced to trigger an onchange event listener.
	]]
	local p_52 = obs.obs_properties_add_bool( props, "backup_mode", "Backup Mode" )
	 --[[
		Property Directory Path: User interaction that select a directory path.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
		 
		This property is referenced to trigger an onchange event listener.
	]]
	local p_53 = obs.obs_properties_add_path( props, "backup_folder", "Backup Folder", obs.OBS_PATH_DIRECTORY, nil, nil)
	--[[
		Property list: User interaction that will execute an import feature.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
		 
		This property is referenced to trigger an onchange event listener.
	]]
	local p_54 = obs.obs_properties_add_list( props, "import_list", "<i>Load Settings</i>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING )
	obs.obs_property_list_add_string( p_54, "Select ", "select" ) -- Adds a default option to the list. First (top-most) list item. If selected the option is ignored. 
	obs.obs_property_set_long_description( p_54, "\nSelect the Settings file to import.\n" ) -- User Tip
	local filenames = get_filenames( path, ".json" ) -- list all files of type
	if table.getn( filenames ) > 0 then
  		for i,v in pairs( filenames ) do 
			obs.obs_property_list_add_string( p_54, v, v ) -- Add options to the list
		end
	end
	--[[
		Property Button: User interaction that will export all property settings to a json file.
		This provides function interaction to change feature behaviour.
		Interacting with this property will complete a feature task. 
	]]
	local p_55 = obs.obs_properties_add_button( props, "export_button", "Export Settings", export_button_clicked )
	 --[[
		Property Button: User interaction that will import available property settings from a json file
		and apply them to the properties.
		This provides function interaction to change feature behaviour.
		Interacting with this property will complete a feature task. 
		 
		This property is referenced to trigger an onchange event listener.
	]]
	local p_56 = obs.obs_properties_add_button( props, "import_button", "Import Settings", import_button_clicked )
	
	obs.source_list_release( sources ) -- free memory, release sources as it is no longer needed
	--[[ 
		Callback definitions used to check for user interaction or property changes.
		Event Listener
		Each entry provides a callback to a referenced proeprty along with a target callback handler
		]]--
  	obs.obs_property_set_modified_callback( p_1, property_onchange )		-- timer_mode
  	obs.obs_property_set_modified_callback( p_2, property_onchange )		-- config
	obs.obs_property_set_modified_callback( p_3, property_onchange )		-- timer_options
  	obs.obs_property_set_modified_callback( p_5, property_onchange )		-- countdown_type
  	obs.obs_property_set_modified_callback( p_8, property_onchange )		-- month
  	obs.obs_property_set_modified_callback( p_9, property_onchange )		-- year
  	obs.obs_property_set_modified_callback( p_11, property_onchange )		-- hours
  	obs.obs_property_set_modified_callback( p_12, property_onchange )		-- minutes
  	obs.obs_property_set_modified_callback( p_13, property_onchange )		-- seconds
  	obs.obs_property_set_modified_callback( p_14, property_onchange )		-- timer_format
  	obs.obs_property_set_modified_callback( p_15, property_onchange )		-- custom_time_format
  	obs.obs_property_set_modified_callback( p_16, property_onchange )		-- toggle_mili_trigger
	obs.obs_property_set_modified_callback( p_17, property_onchange )		-- timer_display
	obs.obs_property_set_modified_callback( p_20, property_onchange )		-- trigger_options
	obs.obs_property_set_modified_callback( p_25, property_onchange )		-- media_playback_limit
  	obs.obs_property_set_modified_callback( p_26, property_onchange )		-- enable_marker_notes
  	obs.obs_property_set_modified_callback( p_31, property_onchange )		-- start_recording
  	obs.obs_property_set_modified_callback( p_35, property_onchange )		-- active_source
  	obs.obs_property_set_modified_callback( p_36, property_onchange )		-- next_scene
	obs.obs_property_set_modified_callback( p_50, property_onchange )		-- set_stopwatch
	obs.obs_property_set_modified_callback( p_51, property_onchange )		-- force_reset_on_visible
	obs.obs_property_set_modified_callback( p_52, property_onchange )		-- backup_mode
	obs.obs_property_set_modified_callback( p_53, property_onchange )		-- backup_folder
	obs.obs_property_set_modified_callback( p_54, property_onchange )		-- import_list
	obs.obs_property_set_modified_callback( p_56, import_properties )		-- import_button
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
		Update a gloabl in case something changed. 
	]]
	count_sources()
	--[[
		Get the correct frequency for splitseconds when the script loads. 
	]]
	assign_default_frequency()
	--[[
		load any property values available to globals
	]]
	
	load_settings_globals( settings )
	
	reset_mili( )
	
	reset( true ) -- anything could have changed so reset everything
	--[[

		If setting changed, update timer

	]]
	update_timer_settings( false ) -- optional inputs: set_to_default(bool), new_settings(obs_property_data/obs_userdata)	
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
	obs.obs_data_set_default_int( settings, "hours", 0 )
	obs.obs_data_set_default_int( settings, "config", 1 )
	obs.obs_data_set_default_int( settings, "minutes", 0 )
	obs.obs_data_set_default_int( settings, "seconds", 0 )
	obs.obs_data_set_default_int( settings, "split_type", 2 )
	obs.obs_data_set_default_int( settings, "timer_mode", 1 )
	obs.obs_data_set_default_int( settings, "enable_marker_notes", 1 )
	obs.obs_data_set_default_int( settings, "timer_format", 1 )
	obs.obs_data_set_default_int( settings, "timer_display", 1 )
	obs.obs_data_set_default_int( settings, "timer_options", 1 )
	obs.obs_data_set_default_int( settings, "countdown_type", 2 )
	obs.obs_data_set_default_int( settings, "recording_type", 5 )
	obs.obs_data_set_default_int( settings, "cycle_direction", 1 )
	obs.obs_data_set_default_int( settings, "start_recording", 2 )
	obs.obs_data_set_default_int( settings, "duration_marker_a", 5 )
	obs.obs_data_set_default_int( settings, "duration_marker_b", 5 )
	obs.obs_data_set_default_int( settings, "media_playback_limit", 1 )
	obs.obs_data_set_default_int( group_props_1, "sw_hours_saved", 0 )
	obs.obs_data_set_default_int( group_props_1, "sw_minutes_saved", 0 )
	obs.obs_data_set_default_int( group_props_1, "sw_seconds_saved", 0 )
	obs.obs_data_set_default_int( group_props_1, "sw_milliseconds_saved", 0 )
	obs.obs_data_set_default_int( settings, "year", os.date("%Y", os.time()) )
	obs.obs_data_set_default_int( settings, "color_normal", media["color_normal"] )
	obs.obs_data_set_default_int( settings, "color_marker_a", media["color_marker_a"] )
	obs.obs_data_set_default_int( settings, "color_marker_b", media["color_marker_b"] )
	--[[
		Set property STRING TYPES. 
	]]
	obs.obs_data_set_default_string( settings, "stop_text", "" )
	obs.obs_data_set_default_string( settings, "text_prefix", "" )
	obs.obs_data_set_default_string( settings, "text_suffix", "" )
	obs.obs_data_set_default_string( settings, "note_marker_a", "" )
	obs.obs_data_set_default_string( settings, "note_marker_b", "" )
	obs.obs_data_set_default_string( settings, "text_marker_b", "" )
	obs.obs_data_set_default_string( settings, "text_marker_a", "" )
	obs.obs_data_set_default_string( settings, "next_scene", "Select" )
	obs.obs_data_set_default_string( settings, "day_text", "# Day \n" )
	obs.obs_data_set_default_string( settings, "audio_marker_b", "None" )
	obs.obs_data_set_default_string( settings, "audio_marker_a", "None" )
	obs.obs_data_set_default_string( settings, "days_text", "# Days \n" )
	obs.obs_data_set_default_string( settings, "split_source", "Select" )
	obs.obs_data_set_default_string( settings, "timer_source", "Select" )
	obs.obs_data_set_default_string( settings, "toggle_mili_trigger", "" )
	obs.obs_data_set_default_string( settings, "note_source_marker_a", "Select" )
	obs.obs_data_set_default_string( settings, "note_source_marker_b", "Select" )
	obs.obs_data_set_default_string( settings, "custom_time_format", "$T$D:$H:$M:$S,$F" )
	--[[
		Set property BOOL TYPES. 
	]]
	obs.obs_data_set_default_bool( settings, "backup_mode", false )
	obs.obs_data_set_default_bool( settings, "set_stopwatch", false )
	obs.obs_data_set_default_bool( settings, "disable_script", false )
	obs.obs_data_set_default_bool( settings, "load_saved_time", false )
	obs.obs_data_set_default_bool( settings, "start_on_visible", false )
	obs.obs_data_set_default_bool( settings, "start_on_scene_active", false )
	obs.obs_data_set_default_bool( settings, "force_reset_on_visible", false )
	obs.obs_data_set_default_bool( settings, "active_source_force_visible", false )
	-- Keep track of current settings
  	script_settings = settings 
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:		A function named script_save will be called when the script is saved
						NOTE: This function is usually used for saving extra data ( such as in this
						case, a hotkey"s save data ).  Settings set via the properties are saved
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
	obs.obs_data_set_array( settings, "reset_hotkey", hotkey_save_array_reset )
	obs.obs_data_array_release( hotkey_save_array_reset )
	
	--[[
		script save
		
		Pause (Start/Pause Timer)
	]]	
	local hotkey_save_array_pause = obs.obs_hotkey_save( hotkey_id_pause )
	obs.obs_data_set_array( settings, "pause_hotkey", hotkey_save_array_pause )
	obs.obs_data_array_release( hotkey_save_array_pause )
	--[[
		script save
		
		Split (available for stopwatch only)
	]]	
	local hotkey_save_array_split = obs.obs_hotkey_save( hotkey_id_split )
	obs.obs_data_set_array( settings, "split_hotkey", hotkey_save_array_split )
	obs.obs_data_array_release( hotkey_save_array_split )
	--[[
		script is loading. register and assign hotkeys 
		
		script save
	]]
	local hotkey_save_array_mili = obs.obs_hotkey_save( hotkey_id_mili )
	obs.obs_data_set_array( settings, "mili_hotkey", hotkey_save_array_mili )
	obs.obs_data_array_release( hotkey_save_array_mili )
end	
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	
	Description:	a function named script_load will be called on startup	
					Connect hotkey and activation/deactivation signal callbacks
					--
					NOTE: These particular script callbacks do not necessarily have to
					be disconnected, as callbacks will automatically destroy themselves
					if the script is unloaded.  So there"s no real need to manually
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
		--[[
		load any property values available to globals
	]]
	load_settings_globals( settings )
	local sh = obs.obs_get_signal_handler()
	--[[
		attach event listener callback [loaded]
		for when a source is done loading.
	]]	
	obs.signal_handler_connect( sh, "source_load", loaded ) -- monitor for source load completed
	obs.signal_handler_connect( sh, "source_deactivate", source_deactivated ) -- monitor source deactivates signal_handler_disconnect
	obs.signal_handler_connect( sh, "source_activate", source_activated ) -- monitor source activates
	
	local hotkey_name = ""
	
	--[[
		script is loading. register and assign hotkeys 
		
		Reset (Timer)
	]]	
	hotkey_name = "timer_reset_" .. filename():lower():gsub("[%W%p%c%s]", "")
	hotkey_id_reset = obs.obs_hotkey_register_frontend( hotkey_name, "Reset " .. filename(), on_reset )
	local hotkey_save_array_reset = obs.obs_data_get_array( settings, "reset_hotkey" )
	obs.obs_hotkey_load( hotkey_id_reset, hotkey_save_array_reset )
	obs.obs_data_array_release( hotkey_save_array_reset )
	--[[
		script is loading. register and assign hotkeys 
		
		Pause (Start/Pause Timer)
	]]	
	hotkey_name = "timer_pause_" .. filename():lower():gsub("[%W%p%c%s]", "")
	hotkey_id_pause = obs.obs_hotkey_register_frontend( hotkey_name, "Start/Pause " .. filename(), on_pause )
	local hotkey_save_array_pause = obs.obs_data_get_array( settings, "pause_hotkey" )
	obs.obs_hotkey_load( hotkey_id_pause, hotkey_save_array_pause )
	obs.obs_data_array_release( hotkey_save_array_pause )
	--[[
		script is loading. register and assign hotkeys 
		
		Split (available for stopwatch only)
	]]	
	hotkey_name = "timer_split_" .. filename():lower():gsub("[%W%p%c%s]", "")
	hotkey_id_split = obs.obs_hotkey_register_frontend( hotkey_name, "Split Time " .. filename(), on_split )
	local hotkey_save_array_split = obs.obs_data_get_array( settings, "split_hotkey" )
	obs.obs_hotkey_load( hotkey_id_split, hotkey_save_array_split )
	obs.obs_data_array_release( hotkey_save_array_split )
	--[[
		script is loading. register and assign hotkeys 
		
		Milliseconds (Show/Hide Timer Milliseconds if in Timer format)
	]]
	hotkey_name = "timer_mili_" .. filename():lower():gsub("[%W%p%c%s]", "")
	hotkey_id_mili = obs.obs_hotkey_register_frontend( hotkey_name, "Milliseconds Toggle " .. filename(), on_mili )	
	local hotkey_save_array_mili = obs.obs_data_get_array( settings, "mili_hotkey" )
	obs.obs_hotkey_load( hotkey_id_mili, hotkey_save_array_mili )
	obs.obs_data_array_release( hotkey_save_array_mili )
end