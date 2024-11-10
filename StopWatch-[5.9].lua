--[[
----------------------------------------------------------------------------------------------------------------------------------------
Open Broadcaster Software®️
OBS > Tools > Scripts
@midnight-studios
Stopwatch
***************************************************************************************************************************************
Version 5.9 

Published / Released: 2024-08-17 20:43

NEW FEATURES

- Export split time to text file (opt-in) @RobertWilliams

OPTIMIZATION

- 

USER EXPERIENCE & FEATURE ENHANCEMENTS

- Updated script description @rez1coder

BUGS

- Fixed error on load for setting 'Autoload last time stamp when OBS starts' @goods0ul

NOTES



***************************************************************************************************************************************
]]
--Globals
obs           				= obslua;
gversion 					= "5.9";
luafile						= "StopWatch.lua";
obsurl						= "comprehensive-stopwatch-countdown-timer.1364/";
patch_notes					= "Patch Notes";
icon="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABUAAAAVCAYAAACpF6WWAAAENElEQVQ4jY1UTUgjZxh+ksl/JuMkMYb4F40bNZqK0KJFqBZqS9ddyl76dyhdKPRQShH2sNDSnnopCz11D10KS/dSKNiDoD2I7KXFQ0XSSGpM1llFMYn5mZiMY2IymfIOhgazXfaDj5n53u975vme531fnaqqeMHxJYCvAOgAlABcAyA1jxLO1tYW1tbWoL+Kd3x8jGg0imw2C0VRWkMEYgNgBeAFYKTFRqOh7aVnE9xwFTSZTGJ7exszMzPQ6XSQZRk8z9P7YrVa/Y5hmKLBYHCpqirW63Wcn5/j7OwMHo9HA6bvNqY2mw1Op1N70qaTkxPkcjmbLMsDZrN5hOO4NxuNhlMUxTFiSCA0FEW5GQ6H/wmHwzfamDavUKlUYDKZAoFA4Gue52/r9f/9v6OjQ5uKojwpFAr3RFF8UCwWjW63OzQ/P/9yGyiBnZ6eEtN3eZ7/9XJZrlQqP2cymcf5fL4QDAbHdTrd2yzLXvd4PD9yHHdLEISFXC7nsdvtuTb3c7kcEokEJiYmhliWtaiqWs5ms4f1el0lE2lOTU0hn8/DYrF09vb23jebze9JkvRXNBqdMpvNaIJaLh1tHScAzpvsSd+joyOkUimEQiFNa4vFAlEU4Xa7HwYCgduFQuHRxsbGx5p+qqq+o/7/SF7uQSaTwcHBgZYdgiBMqKqa2dnZ8S8tLaFcLicIIR6PjzU13Qew+gzPKNEj9JJOp5tag+O41/v7+x/v7u7+sLOzc8BxHN1icXR0dMXlcn3xQhW1v7+PSCSC6enptxwOx3WWZRcbjcbTjY2NAJ1nWRYGgwHj4+OqoigFYnr/UlPlClYFwJ1arVYjU8bGxhZ8Pt9KMxiLxd5gGEbTlTSv1WqQJOmJw+G4RqCfPYfkN4qiFDs7O9HT0/Nqa4BhmKd2u10DrFaruLi4oJmncibQSUCrLHJabDlHzItGo1E7FIvFvg+FQjMmkykkCMK9eDwOivl8PvqhBspxXJAOEujfz2HazzBMdXh4OJNMJoupVGre7/cbBEGor6+vY2RkROsLlwY6jUajS5KkSGvtf0oVemUeAPiDgsFgUHMeQJ3MmZycxNzcnMZWkiT4/f67FJRl+UFrmcYB/N7y3UyLSHOBzNjb20MgEMDg4CC6urqwublJZo12d3ffVRRFEQTh4TNTqlQqaawoTShOVdOsqMPDQ8zOzmqFQK3PZrO91NPTs2U0GkmWG4lEYrWt9cViMSwvL1Ntvw9gRafT/aTX6z8AwFKcuhU5zjDMkNfr/XZgYCBKgMfHx3eSyeSqw+Fob9LEipxMp9MRp9P5uclkWuB5/hOKWa3Wvb6+vjLP8wNer5fXUkRRLkql0ofZbPY3ug019TZQ6jKU0AzD7Iqi+Josy6+4XK6P7Hb7LbvdPkS5SXpXKpU/ZVn+5ezs7FG9Xi9brVZNLr1ej38BVDs6EbSfFQsAAAAASUVORK5CYII=";
desc	    				= 
[[
<hr/><center><h2>Advanced Timer</h2>( Version: %s )</center>
<br><center><img width=38 height=42 src="]] .. icon .. [["/></center>
<br><center><a href="https://github.com/midnight-studios/obs-lua/blob/main/]] .. luafile ..[[">Find it on GitHub</a></center>
<center><a href="https://obsproject.com/forum/resources/]] .. obsurl ..[[updates">]] .. patch_notes ..[[</a></center>
<br><p>The script's visibility adjusts with layout settings: "Advanced" shows advanced properties. "Basic" hides them but keeps values active, so set them correctly.</p><p>Find help on the <a href="https://obsproject.com/forum/resources/]] .. obsurl ..[[">OBS Forum Thread</a>.</p><hr/>
]];
debug_file							= ""
debug_file_name						= "Debug Log"
text_prefix 						= "";
text_suffix 						= "";
text_prefix_validated				= "";
text_suffix_validated				= "";
last_text    						= "";
custom_time_format					= "";
timer_source   						= "";
timer_activation_source				= "";
countdown_type 						= "";
backup_folder 						= "";
import_list 						= "";
longtimetext_s 						= "";
longtimetext_p 						= "";
last_split_data 					= "";
split_source   						= "";
active_source  						= "";
timer_expire_event					= "";
cycle_source_children				= "";
stop_text							= "";
toggle_mili_trigger					= "";
sec_add_1							= "";
sec_add_2							= "";
sec_add_3							= "";
sec_sub_1							= "";
sec_sub_2							= "";
sec_sub_3							= "";
output_file_name 					= "-backup($date_stamp)";
output_file_ext 					= ".json";
font_normal							= "#ffffff";
font_dimmed							= "#bfbbbf";
font_highlight						= "#fffdcf";
add_limit_note_source 				= "";
sub_limit_note_source 				= ""; 
note_source_marker_a 				= "";
note_source_marker_b 				= "";
audio_marker_a						= "";
audio_marker_b						= "";
current_count_direction				= "UP";
count_orientation					= "NORMAL";
timer_activation					= 1;
timer_reset							= 0;
debug_entry							= 0;
debug_entry							= 0;
add_limit_note_source_visible		= 0;
sub_limit_note_source_visible		= 0;
sources_loaded 						= 0;
timer_manipulation					= 1;
sec_add_limit						= 0;
sec_add_limit_used					= 0;
sec_sub_limit_used					= 0;
sec_sub_limit						= 0;
total_sources 						= 0;
sw_days_saved 						= 0;
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
start_recording						= 1;
media_playback_limit				= 0;
enable_marker_notes					= 1;
orig_time     						= 0;
time_frequency						= 0;
completed_cycles					= 0;
ns_last								= 0;
cycle_index 						= 1;
timer_cycle 						= 10; --milliseconds
split_itm							= {};
connectedHandlers					= {};
presuf								= {
text_marker_a						= "",
text_marker_b						= ""
}
ignore_list							= {
"",
"none",
"None",
"Select",
"select",
"list"
};
split_data							= nil;
hour_format							= nil;
minute_format						= nil;
local ctx = {
    propsDef    = nil,  -- property definition
    propsDefSrc = nil,  -- property definition (source scene)
    propsSet    = nil,  -- property settings (model)
    propsVal    = {},   -- property values
    propsValSrc = nil,  -- property values (first source scene)
};
props								= nil;
enable_property_toggle_mili_trigger	= true;
set_visible_properties				= false;
enable_property_color_normal		= true;
enable_property_color_marker_a		= true;
enable_property_color_marker_b		= true;
enable_property_split_source		= true;
enable_property_trigger_options		= true;
enable_property_start_recording		= true;
enable_property_text_prefix			= true;
enable_property_text_suffix			= true;
enable_property_timer_manipulation	= true;
enable_property_timer_activation	= true;
enable_property_debug				= true;
enable_property_backup				= true;
timer_event_active					= false;
timer_mode_changed 					= false;
debug_enabled	 					= false; -- careful, may use more system memory 
script_ready 						= false;
set_timer_activated					= false;
color_normal_updated 				= false;
activated     						= false;
prevent_callback  					= false;
timer_active  						= false;
reset_activated						= false;
active_source_force_visible			= false;
split_startpause					= false;
disable_script   					= false;
enable_direction_toggle  			= false;
backup_split_time		  			= false;
show_mili   						= true;
timer_expired  						= true;
mili_toggle_triggered				= false; 
direction_changed					= false; 
prevent_negative_time  				= false;
record_timer_set  					= false;
media = {							-- table start
text_marker_a						= "",
text_marker_b						= "",
source_name_audio_marker_a			= "",
source_name_audio_marker_b			= "",
source_name_audio_marker_end		= "", 
note_source_marker_a 				= "",
note_source_marker_b 				= "",
note_source_unversioned_id_marker_a = "";
note_source_unversioned_id_marker_b = "";
note_marker_a 						= "",
note_marker_b 						= "",
activated_marker_a					= false, 
activated_marker_b					= false,
activated_media_marker_a			= false, 
activated_media_marker_b			= false,
activated_time_marker_a				= 0, 
activated_time_marker_b				= 0,
cycle_direction_marker_a			= 2;
cycle_direction_marker_b			= 2;
cycle_index_marker_a				= 1; -- index from 1-based table
cycle_index_marker_b				= 1; -- index from 1-based table
cycle_index_note_marker_a			= 1; -- index from 1-based table
cycle_index_note_marker_b			= 1; -- index from 1-based table
current_seconds_marker_a			= 0,
current_seconds_marker_b			= 0, 
duration_marker_a					= 0, 
duration_marker_b					= 0, 
reset_text_marker_a					= 0, 
reset_text_marker_b					= 0,
hide_note_marker_a					= 0, 
hide_note_marker_b					= 0, 
duration_marker_end					= 0, 
last_orientation_marker_a			= "NORMAL";
last_orientation_marker_b			= "NORMAL";
media_ended_marker_a				= false, 
media_ended_marker_b				= false,
last_state_marker_a					= obs.OBS_MEDIA_STATE_NONE,
last_state_marker_b					= obs.OBS_MEDIA_STATE_NONE
};									-- table end
selected_source_list				= {};
hotkey_id_set						= obs.OBS_INVALID_HOTKEY_ID;
hotkey_id_reset						= obs.OBS_INVALID_HOTKEY_ID;
hotkey_id_start						= obs.OBS_INVALID_HOTKEY_ID;
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
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	
	Description: Function to detect the operating system
	Credit:			
	Modified:		
	function:		
	type:			
	input type: 	
	returns:		
----------------------------------------------------------------------------------------------------------------------------------------
]]
function detectOS()
    local os = os.getenv("OS")
    if os and os:lower():match("windows") then
        return "Windows"
    else
        return "Mac"
    end
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	
	Description: Assign OS type to variable
	Credit:			
	Modified:		
	function:		
	type:			
	input type: 	
	returns:		
----------------------------------------------------------------------------------------------------------------------------------------
]]
osType = detectOS()
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	
	Description: Compatibility Sequence Variable. Assign operating system specific variable
	Credit:			
	Modified:		
	function:		
	type:			
	input type: 	
	returns:		
----------------------------------------------------------------------------------------------------------------------------------------
]]
if osType == "Windows" then
    text_source_unversioned_id = "text_gdiplus"
    text_source_id = "text_gdiplus_v2"
	media = {							-- table start
			color_normal						= 4294967295, -- 0xFFFFFFFF
			color_marker_a						= 4256749, -- 0x40f3ed
			color_marker_b						= 329050 -- 0x05055a	
	}
else
    text_source_unversioned_id = "text_ft2_source"
    text_source_id = "text_ft2_source_v2"
	media = {							-- table start
			color_normal						= 4294967295,
			color_marker_a						= 4282446829,
			color_marker_b						= 4278519130	
	}
end
required_sources = {
"ffmpeg_source", 
text_source_id, 
"color_source_v3"
}
--[[
	deque implementation - First item in is firs item out

	With a deque, removing items from both ends is fast regardless of the size of the deque.

	Deque.new(): Creates a new deque. 
	Initially, the first index is set to 0 and the last index is set to -1, meaning the deque is empty.
	pushleft(value): Adds a new value to the front of the deque. It does this by decreasing the first 
	index by 1 and storing the value at this new index.
	popright(): Removes a value from the end of the deque. 
	It does this by taking the value at the last index, removing this value from the deque, and decreasing 
	the last index by 1. The function then returns the removed value.

	Whenever a new item is used, it's added to the deque with pushleft(). 
	When required it removes the oldest item with popright().

]] 
local Deque = {} -- Declare the Deque table to act as the class
Deque.__index = Deque -- Set the __index of Deque to itself to allow method lookups.
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	
	Description: This function creates a new Deque instance (i.e., an object)	
				 Constructor for creating a new instance of Deque
				 Initializes an empty Deque with the first index at 0 and the last index at -1.
	Credit:			
	Modified:		
	function:		
	type:			
	input type: 	
	returns:		
----------------------------------------------------------------------------------------------------------------------------------------
]]
function Deque.new()
    -- Sets the first index at 0 and the last index at -1 indicating an empty Deque
    -- The metatable is set to Deque, so methods can be invoked on this instance
    return setmetatable({first = 0, last = -1}, Deque)
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	We create a new instance of Deque to store items.		
----------------------------------------------------------------------------------------------------------------------------------------
]]
media["used_note_source_marker_a"] = Deque.new()
media["used_note_source_marker_b"] = Deque.new()
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	
	Description: This method adds a value to the start (left) of the Deque	
				 Method to add a value to the front (left) of the Deque.
	
	Credit:			
	Modified:		
	function:		
	type:			
	input type: 	
	returns:		
----------------------------------------------------------------------------------------------------------------------------------------
]]
function Deque:pushleft(value)
    -- We decrease the index for the 'first' element.
    local first = self.first - 1
    -- Assign the new index as our new 'first' index.
    self.first = first
    -- Assign the passed value at the new 'first' position.
    self[first] = value
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	
	Description: This method removes a value from the end (right) of the Deque and returns it
				 This method also returns the removed value.
	
	Credit:			
	Modified:		
	function:		
	type:			
	input type: 	
	returns:		
----------------------------------------------------------------------------------------------------------------------------------------
]]
function Deque:popright()
    -- We store the 'last' index in a local variable.
    local last = self.last
    -- If 'first' index is greater than 'last', then the Deque is empty.
    if self.first > last then error("deque is empty") end
    -- We store the value at the 'last' index in a local variable.
    local value = self[last]
    -- Remove the value from the Deque.
    self[last] = nil
    -- Decrease the 'last' index by one, moving it one step to the left.
    self.last = last - 1
    -- Return the removed value.
    return value
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
	debug_log( 'script_description() -- function variable names: ' )
	return string.format( desc, tostring( gversion ) );
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
	local str = debug.getinfo(2).source:sub(2);
	return str:match("^.*/(.*).lua$") or str;
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
local function pre_dump(input, visited)
    visited = visited or {}
  
    if type(input) ~= "table" then
      return tostring(input)
    elseif visited[input] then
      return "<circular reference>"
    else
      visited[input] = true
  
      local tbl = {}
      for key, value in pairs(input) do
        local keyStr = (type(key) ~= "number") and "'" .. tostring(key) .. "'" or tostring(key)
        tbl[#tbl + 1] = "[" .. keyStr .. "] = " .. "'" .. pre_dump(value, visited) .. "'"
      end
  
      visited[input] = nil -- Remove the current table from visited to allow for other references
      return "{ " .. table.concat(tbl, ", ") .. " }"
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
    msg = " > " .. tostring( msg );
  else
    msg = "";
  end;
  obs.script_log( obs.LOG_DEBUG, tostring( name ) .. msg );
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
function debug_log( content )
	if disable_script then return; end;
	if not debug_enabled or not enable_property_debug then
		return
	end	
	if debug_file == "" then
		debug_file = create_debug_file( debug_file_name, content ) 
	else
		update_debug_file( debug_file, content )
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
function create_debug_file( input_file_name, content )
	if disable_script then return; end;
	content = content or string.format( "%s [%s]\n", "Debug Information", os.date("%Y-%m-%d_%H.%M.%S"))
	local file_name = string.format( "%s-%s[%s]%s", filename(), input_file_name, os.date("%Y-%m-%d_%H.%M.%S"), ".txt");
	-- set output path as the script path by default
	local script_path = script_path();
	local output_path = script_path .. file_name;
	-- if specified output path exists, then set this as the new output path
	output_path = script_path .. file_name;
	output_path = output_path:gsub( [[\]], "/" );	
	log( "create_debug_file", output_path )
    -- Open file in write mode, this will create the file if it does not exist
    local file = io.open( output_path, "w" )
    -- If the file has been opened successfully
    if file then
        -- Write content to the file
        file:write( content )
        -- Close the file
        file:close()
    else
        -- Print error message
        print("Failed to open file " .. file_name .. " for writing")
    end
	return output_path;
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
function rewrite_line_debug_file( filename, line_num, content )
	if disable_script then return; end;
    -- Store all lines in memory
    local lines = {}

    -- Open the file in read mode
    local file = io.open(filename, 'r')

    -- If the file has been opened successfully
    if file then
        -- Loop over all lines in the file
        for line in file:lines() do
            table.insert(lines, line)
        end
        -- Close the file
        file:close()
    else
        -- Print error message
        print("Failed to open file " .. filename .. " for reading")
    end

    -- Replace the line at the specified line number
    if line_num <= #lines then
        lines[line_num] = content
    end

    -- Open the file in write mode
    file = io.open(filename, 'w')

    -- If the file has been opened successfully
    if file then
        for i = 1, #lines do
            -- Only add a newline if it's not the last line
            if i < #lines then
                file:write(lines[i] .. "\n")
            else
                file:write(lines[i])
            end
        end
        -- Close the file
        file:close()
    else
        -- Print error message
        print("Failed to open file " .. filename .. " for writing")
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
function update_debug_file( filename, content )
	if disable_script then return; end;
	if filename ~= nil then
		debug_entry = debug_entry + 1
		content = tostring(debug_entry) .. ") " .. string.rep( " ", string.len(debug_entry) ) .. content
		-- Open file in append mode
		local file = io.open( filename, "a" )
		-- If the file has been opened successfully
		if file then
			-- Write new content on a new line
			file:write( "\n" .. content )
			-- Close the file
			file:close()
		else
			-- Print error message
			print("Failed to open file " .. tostring(filename) .. " for appending. Could not add content: " .. pre_dump(content))
		end
		-- adds unnecessary processing 
		--rewrite_line_debug_file( filename, 2, "Last item entered: " .. content )
	else
		--print("Failed " .. tostring(filename) .. " Does not exist. Could not add content: " .. pre_dump(content))
	end	
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
local function explode_alt( str, delim )
    debug_log( 'explode_alt(' .. pre_dump(str) .. ", " .. pre_dump(delim) .. ') -- function variable names:  str, delim ' )
   local tbl, index;
   tbl = {};
   index = 0;
   if( #str == 1 ) then return {str} end; -- returns a table with the input string as the only value
   while true do
      local trace_index = string.find( str, delim, index, true ); -- find the next d in the string
      if trace_index ~= nil then -- if "not not" found then..
         table.insert( tbl, string.sub( str, index, trace_index - 1 ) ); -- Save it in our array.
         index = trace_index + 1; -- save just after where we found it for searching next time.
      else
         table.insert( tbl, string.sub( str, index ) ); -- Save what's left in our array.
         break; -- Break at end, as it should be, according to the lua manual.
      end;
   end;
   return tbl;
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
local function explode( str, div )
    debug_log( 'explode(' .. pre_dump(str) .. ", " .. pre_dump(delim) .. ') -- function variable names:  str, delim ' )
	if ( div == nil or div == '' ) or ( str == nil or str == '' ) then return {} end
	local pos, arr = 0, {}
	for st, sp in function() return string.find(str, div, pos, true) end do
		table.insert(arr, string.sub(str, pos, st - 1))
		pos = sp + 1
	end
	table.insert(arr, string.sub(str, pos))
	return arr
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
    debug_log( 'pairsByKeys(' .. pre_dump( tbl ) .. ", " .. pre_dump( input_function ) .. ')')
    if type( tbl ) ~= "table" then return tbl end

    -- instead of creating a new table and inserting all items into it, just get the keys
    local keys = {}
    for k in pairs(tbl) do keys[#keys+1] = k end

    table.sort( keys, input_function )

    local i = 0 
    local iter = function ()
        i = i + 1
        if keys[i] == nil then 
            return nil
        else 
            -- use keys[i] to get value from tbl
            return keys[i], tbl[keys[i]]
        end
    end
    return iter
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
function reverseTable( tbl )
	if type( tbl ) ~= "table" then return nil, "Provided variable is not valid Table"; end
    -- Determine the base of the table (0 or 1)
    local base = (tbl[0] ~= nil) and 0 or 1
    
    -- Determine the number of elements in the table
    local n = base
    while tbl[n] ~= nil do
        n = n + 1
    end
    n = n - 1
    
    -- Reverse the table
    for i = base, base + math.floor((n - base) / 2) do
        tbl[i], tbl[n - i + base] = tbl[n - i + base], tbl[i]
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
function getTableBase( tbl )
	if type( tbl ) ~= "table" then return nil, "Provided variable is not valid Table"; end
    -- Check if index 0 is non-nil
    if tbl[0] ~= nil then
        return 0
    elseif tbl[1] ~= nil then
        return 1
    else
        return nil, "Table is empty or does not have consecutive integer keys starting from 0 or 1";
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
function tableHasValue( table )
    debug_log( 'tableHasValue(' .. pre_dump( table ) .. ') -- function variable names:  table ' )
    if type( table ) ~= "table" then return false end
	return next(table) ~= nil
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
    debug_log( 'tablelength(' .. pre_dump(tbl) .. ') -- function variable names:  tbl ' )
	local count = 0;
	if type( tbl ) == "table" then -- if the input table is not of type table return 0
		for _ in pairs( tbl ) do count = count + 1 end;
	end;
	return count;
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
    debug_log( 'tableHasKey(' .. pre_dump(tbl) .. ", " .. pre_dump(key) .. ') -- function variable names:  tbl, key ' )
	
	if type( tbl ) ~= "table" or key == nil then return false end; -- if the input table is not of type table return bool(false)
	
    return tbl[key] ~= nil;
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
local function in_table(tbl, input_value)
    debug_log( 'in_table(' .. pre_dump( tbl ) .. ", " .. pre_dump(input_value) .. ') -- function variable names:  tbl, input_value ' )
    if type(tbl) ~= "table" or input_value == nil then
        return false
    end

    for _, value in pairs(tbl) do
        if value == input_value then
            return true
        elseif type(value) == "table" and in_table(value, input_value) then
            return true
        end
    end

    return false
end
--[[
----------------------------------------------------------
	Description:	Function to connect a signal handler and store its information
				 
				https://obsproject.com/docs/reference-sources.html?highlight=media_started
				attach event listener callback [source_signal]: Called when media has ended.
			
	Credit:			
	Modified:		
	function:		
	type:			
	input type:		 	
	returns:		
----------------------------------------------------------
]]
function connectSignalHandler( source, signal, callback )
    local sh = obs.obs_source_get_signal_handler( source )
    if sh then
        local sourceId = obs.obs_source_get_id( source )
        
        -- Check if the signal handler is already connected for this source
        if not connectedHandlers[sourceId] then
            connectedHandlers[sourceId] = {}
        end
        
        local isAlreadyConnected = false
        for _, handler in ipairs( connectedHandlers[sourceId] ) do
            if handler.signal == signal and handler.callback == callback then
                isAlreadyConnected = true
                break
            end
        end
        
        if not isAlreadyConnected then
            -- Store the connected signal handler in the table
            table.insert( connectedHandlers[sourceId], {signal = signal, callback = callback} )
            -- Connect the signal handler
            obs.signal_handler_connect( sh, signal, callback )
        end
    end
end
--[[
----------------------------------------------------------
	Description:	
	
	Credit:			
	Modified:		
	function:		
	type:			
	input type:		 	
	returns:		
----------------------------------------------------------
]]
function refresh_properties()
    debug_log( 'refresh_properties() -- function variable names: ' )
	return true;
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
function checkTimeString( str )
  debug_log( 'checkTimeString(' .. pre_dump( str ) .. ') -- function variable names: str' )
  if str == nil then return false end
  -- Pattern to match the format '00:00:00'
  local pattern = "^%d%d:%d%d:%d%d$"
  -- Check if the string matches the pattern
  if string.match( str, pattern ) then
    return true
  else
    return false
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
function removeDuplicates( tbl ) 
    debug_log( 'removeDuplicates(' .. pre_dump( tbl ) .. ') -- function variable names: tbl' )
if type( tbl ) ~= "table" or tbl == nil then return tbl end; -- if the input table is not of type table return input
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
function convertToSeconds(timeString)
    debug_log( 'convertToSeconds(' .. pre_dump(timeString) .. ') -- function variable names: timeString' )
  local hours, minutes, seconds = string.match(timeString, "(%d%d):(%d%d):(%d%d)")
  
  -- Convert hours, minutes, and seconds to integers
  hours = tonumber(hours)
  minutes = tonumber(minutes)
  seconds = tonumber(seconds)
  
  -- Calculate the total seconds
  local totalSeconds = (hours * 3600) + (minutes * 60) + seconds
  
  return totalSeconds
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
function get_source_type_by_name( source_name )
		local source = obs.obs_get_source_by_name( source_name );
		local result
		if source ~= nil then
			result = obs.obs_source_get_type( source )
		end
		obs.obs_source_release( source );
	return result
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
function get_source_unversioned_id_by_name( source_name )
		local source = obs.obs_get_source_by_name( source_name );
		local result
		if source ~= nil then
			result = obs.obs_source_get_unversioned_id( source )
		end
		obs.obs_source_release( source );
	return result
end	
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: 	Take the provided source_name for a Scene Item and search for it.
					If the provided source name exists, find any children
					sources. This applies to groups or scenes.
	
	Credit:			
	Modified:		
	function:		
	type:			
	input type: 	
	returns:
----------------------------------------------------------------------------------------------------------------------------------------
]]	
function list_source_children_by_source_name( source_name, filter_unversioned_id ) 
	
	--[[
			we use this part more than once
	]]
	local function get_group_children_from_source( group, list )

		if group then -- is it a group, if not see elseif
			
			local group_items = obs.obs_scene_enum_items( group ) -- the source is a group, get children if any

			if group_items then -- group has children?

				for _, group_item in ipairs( group_items ) do -- iterate children items one by one

					local group_items_source = obs.obs_sceneitem_get_source( group_item ) -- grab the source of the group child item

					if group_items_source then  -- if we successfully retrieved a source 

						local source_name_group = obs.obs_source_get_name( group_items_source ) -- this is what we need, 
						
						local source_name_type = obs.obs_source_get_unversioned_id( group_items_source )
						
						if filter_unversioned_id ~= nil and filter_unversioned_id == source_name_type then
							table.insert( list, source_name_group ) -- save the name for retrieval
						else
							table.insert( list, source_name_group ) -- save the name for retrieval
						end	
					end
					
				end -- end for group_item

				obs.sceneitem_list_release( group_items ) -- completed checking group, free memory, release all items 
			end	
		
		end
			
	end 	
	
	--[[
			start
	]]
	local list = {}
	
	local scenes = obs.obs_frontend_get_scenes() -- get all scenes
	
	if scenes then -- we have scenes
		
		for _, scn in ipairs( scenes ) do -- iterate scenes 1 by 1	
			
			local scene = obs.obs_scene_from_source( scn ) -- load the scene from the current source
			
			local scene_item = obs.obs_scene_find_source_recursive( scene, source_name ) -- check if current scene has the source we are looking for, yes no?
			
			if scene_item then -- we found the scene item we are looking for
				
				local source = obs.obs_sceneitem_get_source( scene_item ) -- grab the source of the scene item

				if source then -- if we successfully retrieved a source
					
					local group = obs.obs_group_from_source( source ) -- check if the found source is a 'group'
						
					if group then -- is it a group, if not see elseif
							
						get_group_children_from_source( group, list )

					elseif obs.obs_source_get_type( source ) == obs.OBS_SOURCE_TYPE_SCENE then -- check if the found source is a nested scene
						
						local scene = obs.obs_scene_from_source( source ) -- load the original scene
						
						local scene_items = obs.obs_scene_enum_items( scene ) -- check if the scene has any children 

						for _, scene_item_source in ipairs( scene_items ) do -- iterate children items one by one 
							
							local item_source = obs.obs_sceneitem_get_source( scene_item_source ) -- grab the source of the scene child item

							if item_source then -- if we successfully retrieved a source
								
								local source_name_parent = obs.obs_source_get_name( item_source ) -- get the source name, we will save it for later
								
								local group = obs.obs_group_from_source( item_source )
								local source_name_type = obs.obs_source_get_unversioned_id( item_source )
								if group then
									get_group_children_from_source( group, list )
								else
									if filter_unversioned_id ~= nil and filter_unversioned_id == source_name_type then
										table.insert( list, source_name_parent ) -- save the name for retrieval
									else
										table.insert( list, source_name_parent ) -- save the name for retrieval
									end	
								end
									
							end	
								
						end
						
						obs.sceneitem_list_release( scene_items )
						
					end
				end
			end
		end

		obs.source_list_release( scenes )
	end
		
	reverseTable( list )
	
	return list 
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
function frontend_get_current_scene()
    -- Get the current scene
    local current_scene = obs.obs_frontend_get_current_scene()

    -- Get the name of the current scene
    local scene_name = obs.obs_source_get_name( current_scene )

    -- Release the reference to the scene (important for memory management)
    obs.obs_source_release( current_scene )

    debug_log( ' frontend_get_current_scene() return: ' .. pre_dump(scene_name) )
    return scene_name
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
function frontend_set_current_scene( scene_name )
	local source = obs.obs_get_source_by_name( scene_name );
	if source ~= nil then
		obs.obs_frontend_remove_event_callback( on_event )
		obs.obs_frontend_set_current_scene( source )
		obs.obs_frontend_add_event_callback( on_event )						
	end
	obs.obs_source_release( source );	
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
    debug_log( 'set_visible(' .. pre_dump(source_name) .. ", " .. pre_dump(visible) .. ') -- function variable names:  source_name, visible ' )
    visible = visible or false;
	local action_completed = false;
	
    if source_name == nil then 
		debug_log( 'set_visible: ' .. pre_dump(action_completed)   )
		return action_completed;	
	end;

	if in_table( ignore_list, source_name ) then
			debug_log( 'ignore_list set_visible: ' .. pre_dump(action_completed)   )
		return action_completed;
	end;
	
	local scenes = obs.obs_frontend_get_scenes();
	if scenes ~= nil then
	 debug_log( 'got scenes set_visible' )
		for i, scn in ipairs( scenes ) do	
			local scene = obs.obs_scene_from_source( scn );
			local sceneitem = obs.obs_scene_find_source_recursive( scene, source_name );
			if sceneitem ~= nil then
	 			debug_log( 'got sceneitem set_visible' )
				if visible and not obs.obs_sceneitem_visible( sceneitem ) then -- only set visible if not visible
					obs.obs_sceneitem_set_visible( sceneitem, visible );
				end	
				if not visible and obs.obs_sceneitem_visible( sceneitem ) then -- only hide if visible
					obs.obs_sceneitem_set_visible( sceneitem, visible );
				end;	
				action_completed = true;
				break;	
			end;
		end; --end for
		obs.bfree( scn );
		obs.source_list_release( scenes );		
	end;
	return action_completed;
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
    debug_log( 'is_visible(' .. pre_dump(source_name) .. ') -- function variable names:  source_name ' )
	
    if source_name == nil or in_table( ignore_list, source_name ) then 
		debug_log( 'is_visible: ' .. pre_dump(source_name)   )	
		return false; 
	end;	
	local isvisible = false;
	if source_name ~= nil then 
		local scenes = obs.obs_frontend_get_scenes();
		if scenes ~= nil then
			for i, scn in ipairs( scenes ) do	
				local scene = obs.obs_scene_from_source( scn );
				local sceneitem = obs.obs_scene_find_source_recursive( scene, source_name );
				if sceneitem ~= nil then
					isvisible = obs.obs_sceneitem_visible( sceneitem );
					break;	
				end;	
			end; --end for
			obs.bfree( scn );
			obs.source_list_release( scenes );		
		end; --end scenes ~= nil	
	end;
	debug_log( 'is_visible: ' .. pre_dump(isvisible) )
	return isvisible;
end	
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Function to compare two time strings
	
	Credit:			
	Modified:		
	function:		
	type:			
	input type: 	
	returns:
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function compareTimeStrings( timeString1, timeString2 )
    debug_log( 'compareTimeStrings(' .. pre_dump(timeString1) .. ", " .. pre_dump(timeString2) .. ') -- function variable names: timeString1, timeString2' )
  -- Extract hours, minutes, and seconds from time strings
  local hours1, minutes1, seconds1 = string.match(timeString1, "(%d%d):(%d%d):(%d%d)")
  local hours2, minutes2, seconds2 = string.match(timeString2, "(%d%d):(%d%d):(%d%d)")
  
  -- Convert hours, minutes, and seconds to integers
  hours1 = tonumber(hours1)
  minutes1 = tonumber(minutes1)
  seconds1 = tonumber(seconds1)
  hours2 = tonumber(hours2)
  minutes2 = tonumber(minutes2)
  seconds2 = tonumber(seconds2)
  
  -- Calculate the total seconds for each time string
  local totalSeconds1 = (hours1 * 3600) + (minutes1 * 60) + seconds1
  local totalSeconds2 = (hours2 * 3600) + (minutes2 * 60) + seconds2
  
  -- Compare the total seconds
  return totalSeconds1 < totalSeconds2
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Function to sort the table items
	
	Credit:			
	Modified:		
	function:		
	type:			
	input type: 	
	returns:
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function sortTimeTable( tbl )
    debug_log( 'sortTimeTable(' .. pre_dump(tbl) .. ') -- function variable names: tbl' )

	if type( tbl ) ~= "table" or tbl == nil then return tbl end; -- if the input table is not of type table return input
	
  table.sort(tbl, compareTimeStrings)
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	custom function
					we use this to get a count of essential sources
	
	Credit:			
	Modified:		
	function:		
	type:			
	input type: 	
	returns:	interger
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function count_required_sources()
    debug_log( 'count_required_sources() -- function variable names: ' )
	local sources = obs.obs_enum_sources();
	local i = 0;
	if sources ~= nil then
		for _, source in ipairs( sources ) do -- ipairs cycles auto incrimented items
			local name = obs.obs_source_get_name( source ); -- Get the source name, this will be a unique identifier 
			local id = obs.obs_source_get_id( source )
			if in_table( required_sources, id ) then
				i = i + 1;
			end
		end
		obs.bfree(source); -- free memory, release source as it is no longer needed
	end;
	obs.source_list_release( sources ); -- free memory, release 
	total_sources = i;
	return i;
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
function getNextItemMatchingTime( tbl, currentTime )
	debug_log( 'getNextItemMatchingTime(' .. pre_dump(tbl) .. ", " .. pre_dump(currentTime) .. ') -- function variable names:  tbl, currentTime ' )

	if type( tbl ) ~= "table" or tbl == nil then return nil end; -- if the input table is not of type table return input

	local nextItem = nil
	local currentTimeString = string.format( "%02d:%02d:%02d", math.floor( currentTime / 3600 ), math.floor( ( currentTime % 3600 ) / 60 ), currentTime % 60 )
	for _, value in ipairs( tbl ) do		
	if value > currentTimeString then
	  nextItem = value
	  break
	end	
	end	
	if tbl[1] ~= nil and nextItem == nil then
		-- loop to first item
		nextItem = tbl[1]
	end		
	return nextItem
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
function getPreviousItemMatchingTime( table, currentTime )
    debug_log( 'getPreviousItemMatchingTime(' .. pre_dump(table) .. ", " .. pre_dump(currentTime) .. ') -- function variable names:  table, currentTime ' )
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
		-- loop to last item
		--previousItem = table[#table] 
	end	
  return previousItem
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
    debug_log( 'obs_data_array_to_table(' .. pre_dump(set) .. ", " .. pre_dump(item) .. ') -- function variable names:  set, item ' )
	
	local array = obs.obs_data_get_array( set, item );
	
	local count = obs.obs_data_array_count( array );
	
	local list = {};
	
	for i = 1, count do 
		
		local array_item = obs.obs_data_array_item( array, i-1 );
		
		local value = obs.obs_data_get_string( array_item, "value" );

		table.insert( list, value )
	end;
	
	obs.obs_data_array_release( array );
	
	return list;
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
local function getMarkerTime( ref, currentTime )
    debug_log( 'getMarkerTime(' .. pre_dump(ref) .. ", " .. pre_dump(currentTime) .. ') -- function variable names:  ref, currentTime ' )
	--[[
		Create a table for a list
	]]	
	local result 	= nil
	local i 		= 0;		-- create interger variable 
	local list 		= {}; 		-- create temporary table variable 
	local data_list = obs_data_array_to_table( ctx.propsSet, "text_arr_" .. ref ); -- fetch obs userdata from property settings and return in table
	--[[
		Build a cycle list
		We only include valid string formats '00:00:00'
		any other format will be excluded	
	]]		
	for key, value in pairs( data_list ) do
		if value ~= nil and value ~= "" then
			if checkTimeString( value ) then
				i = i + 1;
				table.insert( list, value )
			end			
		end	
	end
	list = removeDuplicates( list ); -- Ensure there are no duplicates
	sortTimeTable( list ); -- Time runs linear, so order the list to be linear
	local count = tablelength( list ); -- get how many items are listed
	
	if #list >= 1 then
		media["activated_media_".. ref] = false; 	-- Signal media has not yet been activated because we now have a new media item.
	end
	
	if current_count_direction == "UP" then 
		result = getNextItemMatchingTime( list, currentTime ); -- basically, see what will be the next marker time
	else
		result = getPreviousItemMatchingTime( list, currentTime ); -- basically, see what will be the next marker time
	end	
	return result
end	
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Function to cycle through a table list containing strings
	
	Credit:			
	Modified:		
	function:		
	type:			
	input type: 	string
	returns:		nothing
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function source_exists( source_name )
    debug_log( 'source_exists_alt(' .. pre_dump(source_name) .. ') -- function variable names:  source_name ' )
	local sourceFound = false
	if source_name == nil or in_table( ignore_list, source_name ) then
		return sourceFound;
	end	
	local sources = obs.obs_enum_sources();
	local i = 0;
	if sources ~= nil then
		for _, source in ipairs( sources ) do -- ipairs cycles auto incrimented items
			local name = obs.obs_source_get_name( source );
			if name == source_name then
			sourceFound = true
			end	
		end
		obs.bfree(source); -- free memory, release source as it is no longer needed
	end;
	obs.source_list_release( sources ); -- free memory, release 
    debug_log( 'source_exists: ' .. pre_dump(sourceFound) )
	return sourceFound
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
local function is_valid_type_source( source_name, unversioned_id )
    debug_log( 'is_valid_type_source(' .. pre_dump(source_name) .. ', ' .. pre_dump(unversioned_id) .. ') -- function variable names:  source_name ' )
	local is_valid = false;
	
	if source_name == nil or in_table( ignore_list, source_name ) then
		return is_valid;
	end	
	--[[
		Increments the source reference counter, 
		use obs_source_release() to release it when complete.

		we got a source name, let's see if it exist...
	]]	
	local source = obs.obs_get_source_by_name( source_name ); -- get source by name	
		debug_log( 'is_valid_type_source get source: ' )
	if source ~= nil then -- continue if we have a source
		debug_log( 'is_valid_type_source we have a source: ' )
		local source_id = obs.obs_source_get_unversioned_id( source ); -- get source id

			debug_log( 'is_valid_type_source check if source_id is matching: ' .. pre_dump(source_id) )	

			if source_id == unversioned_id then -- check if source id match that of type we need to focus on
				is_valid = true
			end;
	end;
	obs.obs_source_release( source ); -- release source	
	
	debug_log( 'is_valid_type_source END result: ' .. pre_dump(is_valid) )	
	return is_valid; -- bool
end	
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	
	
	editable_list_has_values( property_name ) -- text_arr_marker_a text_arr_marker_b audio_marker_a_arr audio_marker_b_arr

	Credit:			
	Modified:		
	function:		
	type:			
	input type: 	
	returns:		
----------------------------------------------------------------------------------------------------------------------------------------
]]	
function editable_list_has_values( property_name )
    debug_log( 'editable_list_has_values(' .. pre_dump( property_name ) .. ') -- function variable names:  property_name ' )
	local data_list = obs_data_array_to_table( ctx.propsSet, property_name )
	return next(data_list) ~= nil
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
function reset_group_note_sources( group_source_name )
	-- Convert data array to table
	local itemTable = list_source_children_by_source_name( group_source_name, "group" )
		if itemTable ~= nil and type( itemTable ) == "table" then
		for _, source_name in pairs( itemTable ) do
			if source_exists( source_name ) then
				set_visible( source_name, false );
			end
		end
	end
end	
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	A single function, named 'assign_marker_note_source_name(ref)', is responsible for performing a task on 
					two different types of lists. This function utilizes one String Type variable: 'ref'.
					The variable 'ref' indicates the location where the function is applied. 
	
	Credit:			
	Modified:		
	function:		
	type:			
	input type: 	string
	returns:		nothing
----------------------------------------------------------------------------------------------------------------------------------------
]]
function assign_marker_note_source_name( ref )
    debug_log( 'assign_marker_note_source_name('  .. pre_dump( ref ) .. ') -- function variable names:  property_name, ref ' )

	--[[
			First determin if the selected name is check if the provided name is for user required to show items nested in the option requested is	
	]]
	local source_name = obs.obs_data_get_string( ctx.propsSet, "note_source_".. ref );
	
	--[[
		The option selected may be 'select' 
	]]
	if in_table( ignore_list, source_name ) or not source_exists( source_name ) then
		media["note_source_".. ref] = source_name
	end
	
	note_source_unversioned_id = get_source_unversioned_id_by_name( source_name )
	
	--[[
		We may have a 'group' or even a nested scene?
		if we do not have a group, then exit
	]]
	if note_source_unversioned_id ~= "group" then
		media["note_source_".. ref] = source_name
	else

		--[[
			 We need a list of source names
			 Get the group children names and 
			 return only those that are text type
		]]
		-- Convert data array to table
		local data_list = list_source_children_by_source_name( source_name, "group" )
		
		-- Create a table to hold the purified data list
		local itemTable = {}
		-- Iterate over the data list and validate each source
		-- Use pairs instead of ipairs because ipairs assumes 1-based array		
		for i, source_name in pairs( data_list ) do
			if is_valid_type_source( source_name, text_source_unversioned_id ) then
			  table.insert( itemTable, source_name )
			end
		end
		-- Get index of last assigned item
		local current_index = media["cycle_index_note_".. ref]
		--[[
				signal there was a change since the last orientation
				this function is used by both Marker A & B, so 
				orientation should be individually assigned
		]]
		if media["last_orientation_" .. ref] ~= count_orientation then
			current_index = count_orientation == "NORMAL" and current_index + 1 or current_index - 1;
			media["last_orientation_" .. ref] = count_orientation
		end	

		if current_count_direction == "DOWN" and current_index < 1 then
			current_index = #itemTable
		end	
		if current_count_direction == "UP" and current_index > #itemTable then
			current_index = 1
		end	

		if count_orientation == "NORMAL" then -- count_orientation == "NORMAL" or "INVERTED"
			media["note_source_".. ref] = itemTable[current_index]  -- '+1' because itemTable is 1-based
		end

		-- Depending on the 'count_orientation', set the next index.
		if count_orientation == "NORMAL" then -- count_orientation == "NORMAL" or "INVERTED"
		  current_index = ( current_index % #itemTable ) + 1
		else
		  current_index = ( current_index - 2 + #itemTable ) % #itemTable + 1
		end
		-- Store the selected index and source_name in global 'media' table
		media["cycle_index_note_".. ref] = current_index
		if count_orientation == "INVERTED" then -- count_orientation == "NORMAL" or "INVERTED"
			media["note_source_".. ref] = itemTable[current_index]
		end	
		
		-- We add the new item to the start of deque.
        media["used_note_source_".. ref]:pushleft( media["note_source_".. ref] ) 
				
		debug_log( "assign_marker_note_source_name '" .. ref .. "', Timer: ".. "["..count_orientation .."], Direction: [" .. current_count_direction .."], Text Source: [" .. tostring(media["note_source_" .. ref]) .. "], Next: [" .. pre_dump(media["text_" .. ref] and media["text_" .. ref] or "out-of-range (nil)") .. "] Index: [" ..pre_dump(media["cycle_index_note_" .. ref]) .. "]" .. " Shown Next: " .. pre_dump( media["note_source_".. ref] ) .. " Currently listed" .. pre_dump(media["used_note_source_".. ref]) )
	end	
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	A single function, named 'assign_audio_source_name(property_name, ref)', is responsible for performing a task on 
					two different types of lists. This function utilizes two String Type variables: 'property_name' and 	'ref'.
					The 'property_name' variable indicates the specific list object that will be required, while 'ref' indicates the 
					location where the function is applied. Within the function, there is a method called 
					'obs_data_array_to_table(ctx.propsSet, property_name)'. This method retrieves the referenced list object and converts 
					it into a table format that is assigned to the variable 'data_list', which is then used within the function for 
					further processing.
	
	Credit:			
	Modified:		
	function:		
	type:			
	input type: 	string
	returns:		nothing
----------------------------------------------------------------------------------------------------------------------------------------
]]
function assign_audio_source_name( property_name, ref )
    debug_log( 'assign_audio_source_name(' .. pre_dump( property_name ) .. ", " .. pre_dump( ref ) .. ') -- function variable names:  property_name, ref ' )
	-- Convert data array to table
	local data_list = obs_data_array_to_table( ctx.propsSet, property_name )
	-- Create a table to hold the purified data list
	local itemTable = {}
	-- Iterate over the data list and validate each source
	-- Use pairs instead of ipairs because ipairs assumes 1-based array
	for i, source_name in pairs( data_list ) do
		if is_valid_type_source( source_name, "ffmpeg_source" ) then
		  table.insert( itemTable, source_name )
		end
	end
	
	-- Get index of last assigned item
	local current_index = media["cycle_index_".. ref]

	--[[
			signal there was a change since the last orientation
			this function is used by both Marker A & B, so 
			orientation should be individually assigned
	]]
	if media["last_orientation_" .. ref] ~= count_orientation then
		current_index = count_orientation == "NORMAL" and current_index + 1 or current_index - 1;
		media["last_orientation_" .. ref] = count_orientation
	end	

	if current_count_direction == "DOWN" and current_index < 1 then
		current_index = #itemTable
	end	
	if current_count_direction == "UP" and current_index > #itemTable then
		current_index = 1
	end	
	
	if count_orientation == "NORMAL" then -- count_orientation == "NORMAL" or "INVERTED"
		media["source_name_audio_".. ref] = itemTable[current_index]  -- '+1' because itemTable is 1-based
	end

	-- Depending on the 'count_orientation', set the next index.
	if count_orientation == "NORMAL" then -- count_orientation == "NORMAL" or "INVERTED"
	  current_index = ( current_index % #itemTable ) + 1
	else
	  current_index = ( current_index - 2 + #itemTable ) % #itemTable + 1
	end
	-- Store the selected index and source_name in global 'media' table
	media["cycle_index_".. ref] = current_index
	if count_orientation == "INVERTED" then -- count_orientation == "NORMAL" or "INVERTED"
		media["source_name_audio_".. ref] = itemTable[current_index] 
	end	
	
	debug_log( "assign_audio_source_name '" .. ref .. "', Timer: ".. "["..count_orientation .."], Direction: [" .. current_count_direction .."], Media: [" .. tostring(media["source_name_audio_" .. ref]) .. "], Next: [" .. pre_dump(media["text_" .. ref] and media["text_" .. ref] or "out-of-range (nil)") .. "] Index: [" ..pre_dump(media["cycle_index_" .. ref]) .. "]" )
	
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Function to cycle through a table list containing strings
	
	Credit:			
	Modified:		
	function:		
	type:			
	input type: 	string
	returns:		nothing
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function reset_audio_source_visibility( property_name, ref )
    debug_log( 'reset_audio_source_visibility(' .. pre_dump(property_name) .. ", " .. pre_dump(ref) .. ') -- function variable names:  property_name, ref ' )
	local data_list = obs_data_array_to_table( ctx.propsSet, property_name ); -- fetch obs userdata from property settings and return in table
	if data_list ~= nil then	
		for key, value in pairs( data_list ) do
			if is_valid_type_source( value, "ffmpeg_source" ) then
					set_visible( value, false );
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
function reset_audio_marker_arr()
    debug_log( 'reset_audio_marker_arr() -- function variable names: ' )
	audio_marker_a = obs.obs_data_get_string( ctx.propsSet, "audio_marker_a" );
	if audio_marker_a == "list" then
		reset_audio_source_visibility( "audio_marker_a_arr", "marker_a" );
	end
	audio_marker_b = obs.obs_data_get_string( ctx.propsSet, "audio_marker_b" );
	if audio_marker_b == "list" then
		reset_audio_source_visibility( "audio_marker_b_arr", "marker_b" );
	end
end	
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	This function asigns a variable to a global
	
	Credit:			
	Modified:		
	function:		
	type:			
	input type: 	
	returns:
----------------------------------------------------------------------------------------------------------------------------------------
]]	
function update_time_markers( currentTime ) 	
    debug_log( 'update_time_markers(' .. pre_dump(currentTime) .. ') -- function variable names:  currentTime ' )
		
	media["text_marker_a"] = getMarkerTime( "marker_a", currentTime );			
	media["text_marker_b"] = getMarkerTime( "marker_b", currentTime );
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
function update_media_names( position_reset )
    debug_log( 'update_media_names(' .. pre_dump(position_reset) .. ') -- function variable names:  position_reset ' )
	-- If position_reset is not provided, set it to false
  	position_reset = position_reset or false
	--[[
		If we do not force a complete reset when required, then
		media names will cycle each time the function is called
		during the startup or reset stages
	]]
	if position_reset then
		media["cycle_index_marker_a"] = 1; -- index from 1-based table
		media["cycle_index_marker_b"] = 1; -- index from 1-based table
	end
	--[[
		If Marker Audio is set to "Allow Multiple Selections"
		then it will cycle any strings listed in the Marker Audio List
	]]
	if audio_marker_a == "list" then
		assign_audio_source_name( "audio_marker_a_arr", "marker_a" );
	end
	if audio_marker_b == "list" then
		assign_audio_source_name( "audio_marker_b_arr", "marker_b" );
	end

end	
--[[
----------------------------------------------------------
	Description:	Check if a source is a child of a group
	
	Credit:				
	Modified:		
	function:		
	type:						
	input type: 	
	returns:		
----------------------------------------------------------
]]

function is_child_of_group( source_name )
	
	if source_name == nil then return nil end
	
	local all_sources = get_source_list( "*" );	
	
	if tableHasValue( all_sources ) then
		
		for _, sub in ipairs( all_sources ) do
			
			if source_name == sub["source_name"] then
				return sub["source_name_parent"] 
			end	
		
		end;
	
		obs.bfree(sub); -- free memory, release source as it is no longer needed		
	end

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
function get_source_list( trg_key )
    debug_log( 'get_source_list(' .. pre_dump(trg_key) .. ') -- function variable names:  return_ref ' )
	trg_key = trg_key or "source_name"
	local scenes = obs.obs_frontend_get_scenes();
	local source_list = {};
	--[[
	
	]]
    if scenes ~= nil then
		--[[
		]]
        for _, value_scenesource in pairs( scenes ) do
			
            local scene = obs.obs_scene_from_source( value_scenesource );
            local scene_items = obs.obs_scene_enum_items( scene );
			--[[
			]]
			local index = 0;
            for _, scene_item_value in ipairs( scene_items ) do
				index = index + 1;
				local sub = {};
                local source = obs.obs_sceneitem_get_source( scene_item_value );
				local source_name_parent = obs.obs_source_get_name( source );
				local group = obs.obs_group_from_source( source );
				local id_parent = obs.obs_source_get_id( source );
				local unversioned_id_parent = obs.obs_source_get_unversioned_id( source );
				local display_name_parent = obs.obs_source_get_display_name( id_parent );
				local type_parent = obs.obs_source_get_type( source )
				
				sub["position"] = "parent";
				sub["nested"] = ( type_parent == obs.OBS_SOURCE_TYPE_SCENE );
				sub["type"] = type_parent;
				sub["id"] = id_parent;
				sub["unversioned_id"] = unversioned_id_parent;
				sub["display_name"] = display_name_parent;
				sub["source_name"] = source_name_parent;
				sub["source"] = source;
				
				table.insert( source_list, sub )	
				
				if group then
					local group_items = obs.obs_scene_enum_items( group );	
					if group_items then
						for _, group_item_value in ipairs( group_items ) do
							index = index + 1;
							sub = {};
							local group_item_source = obs.obs_sceneitem_get_source( group_item_value );
							local source_name_group = obs.obs_source_get_name( group_item_source );
							local id_group = obs.obs_source_get_id( group_item_source );
							local unversioned_id_group = obs.obs_source_get_unversioned_id( group_item_source );
							local display_name_group = obs.obs_source_get_display_name( id_group );
							local type_parent = obs.obs_source_get_type( group_item_source )
							
							sub["position"] = "child";
							sub["nested"] = ( type_parent == obs.OBS_SOURCE_TYPE_SCENE );
							sub["type"] = type_parent;
							sub["id"] = id_group;
							sub["unversioned_id"] = unversioned_id_group;
							sub["display_name"] = display_name_group;
							sub["source_name"] = source_name_group;
							sub["source_name_parent"] = source_name_parent;
							sub["source"] = group_item_source;
							
							table.insert( source_list, sub )
							
						end -- end for
						obs.sceneitem_list_release( group_items );
					end
				end	
            end -- end for in pairs( sceneitems )
            obs.sceneitem_list_release( scene_items );
		end -- end for in pairs( scenes )
		--[[
		]]		
        obs.source_list_release( scenes );
    end; -- scenes ~= nil
	
	if trg_key ~= "*" then
		local tmp_list = {}
		for _, value in ipairs(source_list) do
			if value and value[trg_key] then
				tmp_list[value[trg_key]] = value
			end
		end
		source_list = tmp_list
	end 	
	return source_list;
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
	local filenames = {};
	
	if path == nil or path == "" then 
		 debug_log( 'error: [path == nil or empty ] get_filenames(' .. pre_dump(path) .. ", " .. pre_dump(file_extension) .. ') -- function variable names:  path, file_extension ' )
		return filenames; 
	end
	
    debug_log( 'get_filenames(' .. pre_dump(path) .. ", " .. pre_dump(file_extension) .. ') -- function variable names:  path, file_extension ' )
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
local function write_to_json( data, file_name )
    debug_log( 'write_to_json(' .. pre_dump(data) .. ') -- function variable names:  data ' )
	output_folder = backup_folder;
	-- convert Windows path to UNIX path
	file_name = filename() .. (file_name or output_file_name:gsub("$date_stamp", os.date("%Y-%m-%d-%H%M"))) .. output_file_ext
	-- set output path as the script path by default
	local script_path = script_path();
	local output_path = script_path .. file_name;
	-- if specified output path exists, then set this as the new output path
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
--[[ 
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Convert data to file
	
	Credit:			midnight-studios, et al
	Modified:		Yes, custom params to suit targeted need
	function:		
	type:			Support
	input type: 	OBS data (Settings)
	returns:		json file
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function write_to_file( file_type, content, file_name )
    debug_log( 'write_to_file(' .. pre_dump(data) .. ') -- function variable names:  data ' )
	output_folder = backup_folder;
	file_type = file_type or output_file_ext
	-- convert Windows path to UNIX path
	file_name = filename() .. (file_name or output_file_name:gsub("$date_stamp", os.date("%Y-%m-%d-%H%M"))) .. file_type 
	-- set output path as the script path by default
	local script_path = script_path();
	local output_path = script_path .. file_name;
	-- if specified output path exists, then set this as the new output path
	if (output_folder ~= "") then
		output_path = output_folder .. "/" .. file_name;
	else
		output_path = script_path .. file_name;
	end
	output_path = output_path:gsub([[\]], "/");
    -- Open file in write mode, this will create the file if it does not exist
    local file = io.open( output_path, "w" )
    -- If the file has been opened successfully
	content = content or 'no content'
    if file then
        -- Write content to the file
        file:write( content )
        -- Close the file
        file:close()
    else
        -- Print error message
        print("Failed to open file " .. file_name .. " for writing")
    end
	return output_path;
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
    debug_log( 'assign_default_frequency() -- function variable names: ' )
	local fps = 60; -- 60 is the maximum supported frame rate
	local video_info = obs.obs_video_info();
    if obs.obs_get_video_info(video_info) then
		fps = video_info.fps_num;		
	end;
	time_frequency = ( 1/fps );
    debug_log( 'assign default frequency: ' .. pre_dump(time_frequency) )
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:
					Local variables format_hour, format_minutes, format_seconds, format_mili are initialized to the strings that define the format of hour, minutes, seconds and mili based on whether they are present or not.
					"time" variable is initialized with the formatted string using string.format and the values of format_hour, format_minutes, format_seconds, format_mili and the input arguments hour, minutes, seconds, and mili.
					If show_mili is false, then time is re-initialized with the formatted string using string.format and values of format_hour, format_minutes, format_seconds and input arguments hour, minutes, and seconds.
					Return time.
					Take the time segments:
					Hours, Minutes, Seconds, Millisieconds
					Configure to standard format:
					HH:MM:SS:FF
					$function status: in service
	
	Credit:			midnight-studios
	Modified:		
	function:		Dependency / Support 
	type:			
	input type: 	4 variables - "HH" "MM" "SS" "FF"
	returns:		formatted time string: time stamp 00:00:00,00 (HH:MM:SS,FF)
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function config_time( hour, minutes, seconds, mili )
    debug_log( 'config_time(' .. pre_dump(hour) .. ", " .. pre_dump(minutes) .. ", " .. pre_dump(seconds) .. ", " .. pre_dump(mili) .. ') -- function variable names:  hour, minutes, seconds, mili ' )
	local format_hour, 
	format_minutes, 
	format_seconds, 
	format_mili = 
	( hour and "%02d" or "" ),
	( minutes and ":%02d" or "" ),
	( seconds and ":%02d" or "" ),
	( mili and ",%02d" or "" ); 
	local time = string.format( format_hour..format_minutes..format_seconds..format_mili, hour, minutes, seconds, mili );
	--[[
		
		configure for SHOW or Hide millisonds
	
	]]
	if not show_mili then
		time = string.format( format_hour..format_minutes..format_seconds, hour, minutes, seconds );
	end;
	debug_log( 'config time: ' .. pre_dump(time) )
	return time;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Convert Seconds to hours:minutes:seconds:miliseconds
	
					$function status: in service
					Local variables hour, minutes, seconds, and mili are initialized to 0.
					
					If time is greater than 86399 (23:59:59), c_time is calculated as the nearest multiple of 86400 that is less than time and time is updated by subtracting c_time from it.
					Hour is calculated as the floor division of time by 3600.
					If hour is less than 10 and trim is true, hour is updated with a leading zero.
					Minutes are calculated based on whether the custom_time_format has a value of 90.
					If minutes are greater than or equal to 60, minutes are updated as the remainder after dividing by 90.
					If minutes are less than 10 and trim is true, minutes are updated with a leading zero.
					
					Seconds are calculated as the floor value of time minus the product of hour and 3600 and the product of minutes and 60.
					If seconds are less than 10 and trim is true, seconds are updated with a leading zero.
					Miliseconds are calculated as the floor value of time minus the product of hour and 3600 and the product of minutes and 60 and the value of seconds.
					If miliseconds are less than 10 and trim is true, miliseconds are updated with a leading zero.
					Local variable "output" is initialized to an empty string.
					If simplify is true, "output" is updated with the result of calling config_time with hour, minutes, seconds and nil.
					"output" is updated with the result of calling config_time with hour, minutes, seconds, and miliseconds.
					Return "output".
	
	Credit:			
	Modified:		
	function:		
	type:			
	input type: 	Double (Seconds / Split Seconds)
	returns:		time stamp 00:00:00,00 (HH:MM:SS,FF)
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function raw_time( time, simplify )
    debug_log( 'raw_time(' .. pre_dump(time) .. ", " .. pre_dump(simplify) .. ') -- function variable names:  time, simplify ' )
	
	local hours, minutes, seconds, mili = 0, 0, 0, 0;

	--[[
		There may be a custom hour time 
	]]
	if hour_format ~= nil then
		hours = math.floor( time/3600 );
		hours = hours % hour_format;
	else	
		--[[
			If there is more than 24 hours in the time value
			we need to remove the additional time value to leave only a 23:59:59
			value. We will do this by calculating days
		]]
		-- If there is more than 24 hours, remove 23:59:59 as it will be in the clock 
		if time > 86399 then -- 23:59:59
			local c_time = ( math.floor( ( time ) / 86400 ) * 86400 );
			time = time - c_time;
		end;

		hours = math.floor( time/3600 );
	end		
	if hours < 10 and trim then
		hours = "0"..hours;
	end;
	--[[
			check flag: custom_time_format
			if flag assign a 90 minute unit then apply it, else use default 60 minute unit
	
			If there is a use case, this could potentially be expanded here but we will have to make sure the code checks out.
	]]
	if minute_format ~= nil then
		minutes = math.floor( ( ( time/3600 ) * 3600 ) / 60 );
		minutes = minutes % minute_format;
	else
		minutes = math.floor( ( time - math.floor( time/3600 ) * 3600 ) / 60 );
	end	

	if minutes < 10 and trim then
		minutes = "0"..minutes;
	end;
	--[[
	
	]]
	seconds =  math.floor( time - math.floor( time/3600 )*3600 - math.floor( ( time - math.floor( time/3600 )*3600 )/60 )*60 );
	if seconds < 10 and trim then
		seconds = "0"..seconds;
	end;
	--[[
	
	]]
	mili = math.floor( ( time - math.floor( time/3600 )*3600 - math.floor( ( time - math.floor( time/3600 )*3600 )/60 )*60 - math.floor( time - math.floor( time/3600 )*3600 - math.floor( ( time - math.floor( time/3600 )*3600 )/60 )*60 ) )*100 );
	if mili < 10 and trim then
		mili = "0"..mili;
	end
	--[[
		
		Use this to see if the time stamp matches certain criteria
		This looks at HH:MM:SS only and is used to match the 
		timer's current time stamp against a user defined time mark that
		will for example activate Mark A or Mark B
		
	]]	
	local output = "";
	if simplify then
		output = config_time( hours, minutes, seconds,  nil );
	else
		output = config_time( hours, minutes, seconds,  mili );
	end;

	debug_log( 'raw time output: ' .. pre_dump(output) )
	return output;
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
    debug_log( 'get_time_lapsed() -- function variable names: ' )
	local ns = obs.os_gettime_ns();
	local delta = ( ns/1000000000.0 ) - ( orig_time/1000000000.0 );
	return raw_time( delta );
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
    debug_log( 'get_frequency(' .. pre_dump(previous) .. ') -- function variable names:  previous ' )
	local ns = obs.os_gettime_ns();
	ns_last = ns;
	local f = ( ns/1000000000.0 ) - ( previous/1000000000.0 );
	if f > 1 then f = time_frequency end;
    debug_log( 'frequency: ' .. pre_dump(f) )
	return f;	
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	
	
	Credit:			midnight-studios
	Modified:		
	function:		
	type:			
	input type: 	
	returns:		
----------------------------------------------------------------------------------------------------------------------------------------
]]	
function timer_remove( input )
    debug_log( 'timer_remove(' .. pre_dump(input) .. ') -- function variable names: input' )
 if type( input ) ~= "table" then
	if input ~= nil and type( input ) == "function" then	
		obs.timer_remove( input );
		debug_log( 'removed timer (' .. pre_dump(input) .. ')' )
	else
		debug_log( 'requested timer for removal does not exist. Aborting.' )	
	end				
  else
    debug_log( 'timer remove items: (' .. pre_dump(#input) .. ')' )
    for key, value in pairs( input ) do
		if value ~= nil and type( input ) == "function" then
			obs.timer_remove( value );
    		debug_log( 'removed timer (' .. pre_dump(value) .. ')' )
		else
			debug_log( 'requested timer for removal does not exist. Aborting.' )	
		end		
    end;
  end;
end	
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	
	
	Credit:			midnight-studios
	Modified:		
	function:		
	type:			
	input type: 	
	returns:		
----------------------------------------------------------------------------------------------------------------------------------------
]]	
function timer_add( input, ms )
    debug_log( 'timer_add(' .. pre_dump(input) .. ", " .. pre_dump(ms) .. ') -- function variable names: input' )
 	obs.timer_add( input, ms );
end	
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	
	
	Credit:			midnight-studios
	Modified:		
	function:		
	type:			
	input type: 	
	returns:		
----------------------------------------------------------------------------------------------------------------------------------------
]]	
function remove_all_timers()
    debug_log( 'remove_all_timers() -- function variable names: ' )
	local timerNames = {}
	table.insert( timerNames, timer_callback );
	table.insert( timerNames, sal_timer_callback );
	table.insert( timerNames, ssl_timer_callback );
	table.insert( timerNames, timer_end_media_end_callback );
	table.insert( timerNames, frontend_recording_start_callback );
	table.insert( timerNames, reset_text_a_colour_timer_callback );
	table.insert( timerNames, reset_text_b_colour_timer_callback );
	table.insert( timerNames, hide_note_a_timer_callback );
	table.insert( timerNames, hide_note_b_timer_callback );
	table.insert( timerNames, marker_a_media_end_callback );
	table.insert( timerNames, marker_b_media_end_callback );
	timer_remove( timerNames )
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	This was developed because some tasks were not completing
	
	Credit:			midnight-studios
	Modified:		

	function:		delayed recording task to allow other tasks to complete
	type:			
	input type: 	

	returns:		
----------------------------------------------------------------------------------------------------------------------------------------
]]	
local function frontend_recording_start_callback( )
    debug_log( 'frontend_recording_start_callback() -- function variable names:  ' )
	if not record_timer_set then return end;
	if not obs.obs_frontend_recording_active() then
		obs.obs_frontend_recording_start();
	end;
	timer_remove( frontend_recording_start_callback );
	record_timer_set = false;
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
    debug_log( 'record(' .. pre_dump(mark) .. ", " .. pre_dump(ms) .. ') -- function variable names:  mark, ms ' )
	if not enable_property_start_recording then return end;
	if obs.obs_frontend_recording_active() then -- if already recording, remove and reset timer
		frontend_recording_start_callback( );
		return;
	end;
	if timer_mode ~= 2 or obs.obs_frontend_recording_active() then return end; -- if not countdown or timer active, then exit
	if start_recording ~= 1 and start_recording == mark then	
		if not record_timer_set then
			timer_remove( frontend_recording_start_callback ); -- Remove any existing callbacks if they exist before assigning a new callback
			timer_add( frontend_recording_start_callback, ms ); --< milliseconds
			record_timer_set = true; 	
		end;
	end;
    debug_log( 'record [End]' )
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
    debug_log( 'delta_time(' .. pre_dump(year) .. ", " .. pre_dump(month) .. ", " .. pre_dump(day) .. ", " .. pre_dump(hour) .. ", " .. pre_dump(minute) .. ", " .. pre_dump(second) .. ') -- function variable names:  year, month, day, hour, minute, second ' )
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
    debug_log( 'format_time(' .. pre_dump(timestamp) .. ", " .. pre_dump(format) .. ') -- function variable names:  timestamp, format ' )
	local days, hours, minutes, seconds, mili = "00", "00", "00", "00", "00";
	local timeTable = explode( timestamp, ":" ) or {timestamp}; -- reference ":" 4 parts
	local trim = format:find("$T");	
	local replacements = {}
	if #timeTable == 4 then
        days, hours, minutes, seconds = unpack(timeTable)
        seconds, mili = unpack(explode(seconds, ","))
    elseif #timeTable == 3 then
        hours, minutes, seconds = unpack(timeTable)
        seconds, mili = unpack(explode(seconds, ","))
    elseif #timeTable == 2 then
        minutes, seconds = unpack(timeTable)
        seconds, mili = unpack(explode(seconds, ","))
    elseif #timeTable == 1 then
        seconds = unpack(timeTable)
        seconds, mili = unpack(explode(seconds, ","))
    end
	if tonumber(days) < 10 then 
		days = "0"..days;
	end;
	
	local replacements = { ["$D"]=days, ["$H"]=hours, ["$M"]=minutes, ["$S"]=seconds }
	
	timestamp = format:gsub("$T", "")
	
	if show_mili then
		replacements["$F"]=mili
	else
		timestamp = timestamp:gsub("$F", "")
	end
	
    for k, v in pairs(replacements) do
        timestamp = timestamp:gsub(k, v)
    end
	
	local epsilon = 0.0001  -- tolerance value
	--[[
			If format requires leading zeros removed, and;
			current_seconds is equal to zero, or less than tolerance value
			remove leading zeros.
	]]
	if trim and ( math.abs( current_seconds ) > epsilon or math.abs( current_seconds ) == 0 ) then
		local reg = "^[0:,]*" -- close, but misses 1 instance
		timestamp = timestamp:gsub(reg, "");
	end
	
    if math.abs( current_seconds ) < epsilon and timestamp:find("^0") then
        --timestamp = timestamp:gsub("^0+:", "")
    end
		
    debug_log( 'format_time timestamp:' .. pre_dump(timestamp) )
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
    debug_log( 'long_time(' .. pre_dump(time) .. ') -- function variable names:  time ' )
	local c_time = time;
	-- If there is more than 24 hours, remove 23:59:59 as it will be in the clock 
	if time > 86399 then -- 23:59:59
		c_time = math.floor( ( time ) / 86400 );
	end;
	if time < 86400 then
		c_time = 0;
	end;
	return c_time;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	
	Description:	This function checks if a string contains "{" and "}" 
					
					If the string meets these conditions, the function returns any value string in the brackets
				
	
	Credit:			
	Modified:		
	function:		
	type:			
	input type: 	
	returns:		
----------------------------------------------------------------------------------------------------------------------------------------
]]
function extract_from_brackets( str, reg )
    -- Find the first occurrence of a balanced pair of braces in the string
	reg = reg or "{.-%}" -- "%b{}"-- "{.-%}"
	
    debug_log( 'extract_from_brackets(' .. pre_dump( str ) .. ', ' .. pre_dump( reg ) .. ') -- function variable names:  str, reg ' )
	
    local start_index, end_index = string.find( str, reg ) 
    -- If no balanced pair of braces is found, return nil
    if start_index == nil then
        return nil
    end
    -- Extract the substring between the braces
    local instructions = string.sub( str, start_index + 1, end_index - 1 )
    
    return instructions, start_index, end_index
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	
	Description:	This function checks if a string contains the characters "{" and "}" and the character "M" followed 
					by a numeric value
					If the string meets these conditions, the function returns the numeric value
					Check to see if a user defined a custom time format and if the format defined a minute allocation.
	
					If the user need the minute clock to be for example 90 minutes instead of 60 then the user could add the expression as followes:
					
					{M90} will assign a 90 minute value
					Note, the M90 must be inside brackets to be considered. 
	
	Credit:			
	Modified:		Asking if miliseconds property must be shown or hidden and this is for back end UI
	function:		yer, no
	type:			Support, UI
	input type: 	properties, settings
	returns:		bool
----------------------------------------------------------------------------------------------------------------------------------------

]]
function get_unit_allocation(str, target_char)

    debug_log( 'get_unit_allocation(' .. pre_dump( str ) .. ') -- function variable names:  str ' )
    -- Ensure that the target character is a single uppercase letter
    if not target_char:match("%u") or #target_char ~= 1 then
        return nil, "Invalid target character. Must be a single uppercase letter."
    end

    -- Extract the substring between the braces
    local instructions = extract_from_brackets(str)
    -- Not found, return nil
    if instructions == nil then
        return nil
    end

    -- Find the first occurrence of the target character followed by one or more digits
    local pattern = target_char .. "%d+"
    local match = instructions:match(pattern)

    -- If the target character and numeric value are not found, return nil
    if match == nil then
        return nil
    end

    -- Extract and return the numeric part
    local number = match:match("%d+")

    return tonumber(number)
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Check if there are instructions included in the text for additional supported behaviour. 
					Instructions must be provided in '{}' and may contain two paramaters for example {param1:param2}
					param1 may be one of three possible designations. It must be a numeric value of either 1 or 2 or a time stamp matching the format for
					HH:MM:SS. If param1 is set to 1 it will pull time markers entries from the list for Marker A
					and if param1 is set to 2 to it will pull time markers entries from the list for Marker B. 
					If param1 is defined with a time marker matching the format HH:MM:SS it will use this time marker instead.
	
	Credit:			
	Modified:		
	function:		accepts  string, string
	type:			
	input type: 	
	returns:		3 variable [boolean, String, Interger] true or false if input contains a match to the pattern, param 1, param 2
----------------------------------------------------------------------------------------------------------------------------------------
]]
function get_presuf_allocation( str, reg )
    -- Find the first occurrence of a balanced pair of braces in the string
    reg = reg or "{.-%}" -- "%b{}"-- "{.-%}"
	
      debug_log( 'get_presuf_allocation(' .. pre_dump( str ) .. ', ' .. pre_dump( reg ) .. ') -- function variable names:  str, reg ' )
	
    local instructions = extract_from_brackets( str, reg )

    if instructions then
        if instructions == "1" then -- only referencing 1
            return true, "a", nil
        elseif instructions == "2" then -- only referencing 2
            return true, "b", nil
        end

        -- Check if the instructions specified a time stamp
        start_timestamp, end_timestamp = instructions:find( "%d%d:%d%d:%d%d" )
        
        if start_timestamp and end_timestamp then -- we have a defined time stamp
            local timestamp = instructions:sub( start_timestamp, end_timestamp )            
            local timer_units
            -- Check if there's a character following the timestamp
            if end_timestamp < #instructions then
                timer_units = instructions:sub(end_timestamp):match(",(%d*)")
                if timer_units == "" then timer_units = nil end
            end
            return true, timestamp, timer_units and tonumber( timer_units ) or nil
        else -- no time stamp
            local flag, timer_units = instructions:match( "(%d+),(%d*)" )

            if flag == "1" then
                return true, "a", timer_units ~= "" and tonumber( timer_units ) or nil
            elseif flag == "2" then
                return true, "b", timer_units ~= "" and tonumber( timer_units ) or nil
            end
        end    
    end
    return false, nil, nil
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	
	Description:	
	Credit:			
	Modified:		
	function:		yer, no
	type:			Support, UI
	input type: 	properties, settings
	returns:		bool
----------------------------------------------------------------------------------------------------------------------------------------
]]
function hasBrackets( str )
    debug_log( 'hasBrackets(' .. pre_dump( str ) .. ') -- function variable names: str' )
    local start_index, end_index = string.find( str, "%b{}" )
    return start_index ~= nil 
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	
	Description:	This function uses the string.find function to find the first occurrence of a balanced pair of braces 
					(%b{}) in the input string str. If no such pair is found, the function returns the input string as is.
					If a pair of braces is found, the function uses string.sub to extract the substrings of str before and 
					after the pair of braces, concatenates them using the .. operator, and returns the result.
	
	Credit:			
	Modified:		Asking if miliseconds property must be shown or hidden and this is for back end UI
	function:		yer, no
	type:			Support, UI
	input type: 	properties, settings
	returns:		bool
----------------------------------------------------------------------------------------------------------------------------------------
]]
function removeBrackets( str )
    debug_log( 'removeBrackets(' .. pre_dump( str ) .. ') -- function variable names: str' )
    local start_index, end_index = string.find( str, "%b{}" )
    if start_index == nil then
        return str
    end
    return string.sub(str, 1, start_index - 1) .. string.sub(str, end_index + 1)
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	
	
	Credit:			et al		
	Modified:		
	function:				
	type:			Support, Render			
	input type: 	Integer
	returns:		none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function get_text_color( source_name )
    debug_log( 'get_timer_text_color(' .. pre_dump(int) .. ') -- function variable names:  int ' )
	local color
	if source_name == nil or in_table( ignore_list, source_name ) then return color end; -- if timer_source not defined, then return
	local source = obs.obs_get_source_by_name( source_name ); -- get source by name
	if source ~= nil then -- continue if we have a source
		local source_id = obs.obs_source_get_unversioned_id( source ); -- get source id
		if source_id == text_source_unversioned_id then -- identify text type sources only
			if settings ~= nil then
				--[[
					Operating compatibility MacOSX / Windows
					The settings key for color 
					Win = "color"
					Mac = "color2" and "color3"
				]]
				if osType == "Windows" then
					color = obs.obs_data_get_int( settings, "color", color ); -- update source settings
				else
					color = obs.obs_data_get_int( settings, "color1", color ); -- update source settings
					if not color then
						color = obs.obs_data_get_int( settings, "color2", color ); -- update source settings
					end		
					if not color then
						color  = 4294967295	-- default is white
					end		
				end
			end				
				
		end
	end
	obs.obs_source_update( source, settings ); -- save source new settings
	obs.obs_data_release( settings ); -- release settings
	obs.obs_source_release( source ); -- release source
	return color
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
local function set_timer_text_color( color )
    debug_log( 'set_timer_text_color(' .. pre_dump(color) .. ') -- function variable names:  int ' )
	if in_table( {"Select", "select"}, timer_source ) then return end; -- if timer_source not defined, then return
	local source = obs.obs_get_source_by_name( timer_source ); -- get source by name
	if source ~= nil then -- continue if we have a source
		local settings = obs.obs_source_get_settings( source ); -- get source settings
		if settings ~= nil then
			--[[
				Operating compatibility MacOSX / Windows
				The settings key for color 
				Win = "color"
				Mac = "color2" and "color3"
			]]
			obs.obs_data_set_int( settings, "color", color ); -- compatibility for settings transfer
			obs.obs_data_set_int( settings, "color1", color ); -- update source settings
			obs.obs_data_set_int( settings, "color2", color ); -- update source settings
		end	
		obs.obs_source_update( source, settings ); -- save source new settings
		obs.obs_data_release( settings ); -- release settings
		obs.obs_source_release( source ); -- release source
	end
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
local function reset_text_a_colour_timer_callback()
    debug_log( 'reset_text_a_colour_timer_callback() -- function variable names: ' )	
	set_timer_text_color( media["color_normal"] ); 
	timer_remove( reset_text_a_colour_timer_callback );
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
local function reset_text_a_colour_end_timer()
    debug_log( 'reset_text_a_colour_end_timer() -- function variable names: ' )
	timer_remove( reset_text_a_colour_timer_callback ); -- Removing the callback stops the timer	
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
local function reset_text_b_colour_timer_callback()
    debug_log( 'reset_text_b_colour_timer_callback() -- function variable names: ' )
	set_timer_text_color( media["color_normal"] );
	timer_remove( reset_text_b_colour_timer_callback );
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
local function reset_text_b_colour_end_timer()
    debug_log( 'reset_text_b_colour_end_timer() -- function variable names: ' )
	timer_remove( reset_text_b_colour_timer_callback ); -- Removing the callback stops the timer	
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
local function hide_note_a_timer_callback()
    debug_log( 'hide_note_a_timer_callback() -- function variable names: ' )
	if media["note_source_unversioned_id_marker_a"] == text_source_unversioned_id then
		set_visible( media["note_source_marker_a"], false );  -- Set hiden the source for the note for marker a
	end		
	if media["note_source_unversioned_id_marker_a"] == "group" then -- Hide Sources from a list
		local source_to_use = media["used_note_source_marker_a"]:popright()
		if source_to_use ~= nil then set_visible( source_to_use, false ); end  -- Set hiden the source for the note for marker b
	end	
	timer_remove( hide_note_a_timer_callback );
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
local function hide_note_a_colour_end_timer()
    debug_log( 'hide_note_a_colour_end_timer() -- function variable names: ' )
	timer_remove( hide_note_a_timer_callback ); -- Removing the callback stops the timer	
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
local function hide_note_b_timer_callback()
    debug_log( 'hide_note_b_timer_callback() -- function variable names: ' )
	if media["note_source_unversioned_id_marker_b"] == text_source_unversioned_id then
		set_visible( media["note_source_marker_b"], false );  -- Set hiden the source for the note for marker b
	end
	if media["note_source_unversioned_id_marker_b"] == "group" then
		local source_to_use = media["used_note_source_marker_b"]:popright()
		if source_to_use ~= nil then set_visible( source_to_use, false ); end  --   -- Set hiden the source for the note for marker b
	end	
	timer_remove( hide_note_b_timer_callback );
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
local function hide_note_b_colour_end_timer()
    debug_log( 'hide_note_b_colour_end_timer() -- function variable names: ' )
	timer_remove( hide_note_b_timer_callback ); -- Removing the callback stops the timer	
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
local function reset_marker_text_colour_start_timer( int, ref )
    debug_log( 'reset_marker_text_colour_start_timer(' .. pre_dump(int) .. ", " .. pre_dump(ref) .. ') -- function variable names:  int, ref ' )
	if int ~= 0 then
		if ref == "marker_a" then
			timer_remove( reset_text_a_colour_timer_callback ); -- Remove any existing callbacks if they exist before assigning a new callback
			timer_add( reset_text_a_colour_timer_callback, int ); --<- milliseconds 
		end
		if ref == "marker_b" then
			timer_remove( reset_text_b_colour_timer_callback ); -- Remove any existing callbacks if they exist before assigning a new callback
			timer_add( reset_text_b_colour_timer_callback, int ); --<- milliseconds 
		end
	end
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
local function hide_note_start_timer( int, ref )
    debug_log( 'hide_note_start_timer(' .. pre_dump(int) .. ", " .. pre_dump(ref) .. ') -- function variable names:  int, ref ' )
	if int ~= 0 then
		if ref == "marker_a" then
			timer_remove( hide_note_a_timer_callback ); -- Remove any existing callbacks if they exist before assigning a new callback
			timer_add( hide_note_a_timer_callback, int ); --<- milliseconds 
		end
		if ref == "marker_b" then
			timer_remove( hide_note_b_timer_callback ); -- Remove any existing callbacks if they exist before assigning a new callback
			timer_add( hide_note_b_timer_callback, int ); --<- milliseconds 
		end
	end
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
    debug_log( 'show_split(' .. pre_dump(props) .. ", " .. pre_dump(settings) .. ') -- function variable names:  props, settings ' )
	local layout_value = obs.obs_data_get_int( settings, "layout" );
	local mode = obs.obs_data_get_int( settings, "timer_mode" );
	local shw = false;
	shw = ( layout_value == 2 and mode == 2 and in_table( {1, 2}, timer_format ) );
	if ( timer_format == 5 and layout_value == 2 and mode == 2 ) then
		if ( string.find( custom_time_format, "$F" ) ~= nil ) then
			shw = true;
		else
			shw = false;
		end;
	end;
	return shw;
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
    debug_log( 'set_text(' .. pre_dump(source_name) .. ", " .. pre_dump(text) .. ') -- function variable names:  source_name, text ' )
	
	if source_name == nil or in_table( ignore_list, source_name ) then
		return
	end	
	
	--[[
		Increments the source reference counter, 
		use obs_source_release() to release it when complete.
	]]
	local source = obs.obs_get_source_by_name( source_name );
	if source ~= nil then
		local settings = obs.obs_source_get_settings( source );
		obs.obs_data_set_string( settings, "text", text );
	end;
	obs.obs_source_update( source, settings );
	obs.obs_data_release( settings );
	obs.obs_source_release( source );
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
    debug_log( 'marker_a_media_end_callback() -- function variable names:  ' )
	set_visible( media["source_name_audio_marker_a"], false );
	timer_remove( marker_a_media_end_callback );
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
    debug_log( 'marker_b_media_end_callback() -- function variable names:  ' )
	set_visible( media["source_name_audio_marker_b"], false );	
	timer_remove( marker_b_media_end_callback );
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
    debug_log( 'signal_media_ended(' .. pre_dump(cd) .. ') -- function variable names:  cd ' )
	--[[
	
		Get source from CallData
	
	]]
	local source = obs.calldata_source( cd, "source" );
	--[[
	
		Found Source?
	
	]]
	if source ~= nil then 
		local name = obs.obs_source_get_name( source );
		--[[
			Set Source Visibility to Hidden
		]]
		set_visible( name, false );
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
    debug_log( 'disconnect_after_media_end(' .. pre_dump(ref) .. ') -- function variable names:  ref ' )
	
	local source_name = media["source_name_audio_".. ref]; 
	
	if source_name == nil or in_table( ignore_list, source_name ) then
		debug_log( 'disconnect_after_media_end source_name nil ' )
		return
	end	
	
	local source = obs.obs_get_source_by_name( source_name ); -- Increments the source reference counter, use obs_source_release() to release it when complete.
	--[[
		Found Source?
	]]
	if source ~= nil then  
		local source_id = obs.obs_source_get_unversioned_id( source ); -- get source id
		if source_id == "ffmpeg_source" then -- check if source id match that of type we need to focus on
			--[[
				Create a signal handler for the source
			]]
			local sh = obs.obs_source_get_signal_handler( source );	
			--[[ 
				https://obsproject.com/docs/reference-sources.html?highlight=media_started
				attach event listener callback [source_signal]: Called when media has ended.
			]]	
			obs.signal_handler_connect( sh, "media_ended", signal_media_ended );	
		end;
	end;
	obs.obs_source_release( source );
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
    debug_log( 'start_media_action(' .. pre_dump(source_name) .. ", " .. pre_dump(ref) .. ') -- function variable names:  source_name, ref ' )
	if in_table( ignore_list, source_name ) then return end;
	
	if not timer_active then return end; -- only start_media_action if the timer is active
	
	if not media["activated_media_".. ref] then 
		media["current_seconds_".. ref] = math.ceil( current_seconds );
		set_visible( source_name, true );
		--[[
			media must be avtive now, or have been made active started
		]]

		
		--[[
		
			connect signal handler to ensure we reset the source if the media ended.
		
		]]
		disconnect_after_media_end( ref );
		media["activated_media_".. ref] = true; 	
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
    debug_log( 'start_media(' .. pre_dump(source_name) .. ", " .. pre_dump(ref) .. ') -- function variable names:  source_name, ref ' )
	start_media_action( source_name, ref );
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
	if disable_script then return; end;
    debug_log( 'set_text_note_color(' .. pre_dump(ref) .. ') -- function variable names:  ref ' )
	--[[
		Only control colour if source is a text source
	]]
	if media["note_source_unversioned_id_" .. ref] ~= text_source_unversioned_id then return end

	local source_name = media["note_source_" .. ref];
	local text = media["note_".. ref];
	local color  = media["color_".. ref];
	
	if source_name == nil or in_table( ignore_list, source_name ) then
		return
	end	
	if ref == nil then
		return
	end	
	if in_table( ignore_list, source_name ) then return end;
	if in_table( ignore_list, ref ) then return end;
	local source = obs.obs_get_source_by_name( source_name ); -- get source by name
	if source ~= nil then -- continue if we have a source
		local settings = obs.obs_source_get_settings( source ) -- get source settings
		if settings ~= nil then
			obs.obs_data_set_string( settings, "text", text ); -- update source settings
			if ( enable_property_color_marker_a and ref == "marker_a" ) or ( enable_property_color_marker_b and ref == "marker_b" ) then
				--[[
					Operating compatibility MacOSX / Windows
					The settings key for color 
					Win = "color"
					Mac = "color2" and "color3"
				]]
				obs.obs_data_set_int( settings, "color", color ); -- compatibility for settings transfer
				obs.obs_data_set_int( settings, "color1", color ); -- update source settings
				obs.obs_data_set_int( settings, "color2", color ); -- update source settings
			end				
		end	
	end;
	obs.obs_source_update( source, settings ); -- save source new settings
	obs.obs_data_release( settings ); -- release settings
	obs.obs_source_release( source ); -- release source
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
function roundSeconds()
    debug_log( 'roundSeconds() -- function variable names: ' )
	
		local round_seconds = math.ceil( current_seconds ); -- round to nearset upper value
	--[[
	 	if not Count Down so target Count Up, or
		if the count direction changed and the count direction is positive
	]]
	
	if current_count_direction == "UP" then
		round_seconds = math.floor( current_seconds ); -- round to nearset lower value
	end		
	return round_seconds
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
function prep_presuf()
	if hasBrackets( text_prefix ) then
		local text_prefix_cleaned = removeBrackets( text_prefix )
		text_prefix_validated = ""
	else
		text_prefix_validated = text_prefix;
	end
	if hasBrackets( text_suffix ) then
		local text_suffix_cleaned = removeBrackets( text_suffix )
		text_suffix_validated = ""
	else
		text_suffix_validated = text_suffix;
	end
end	
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	validate instructions
	
	Credit:			
	Modified:		
	function:		
	type:			
	input type: 	
	returns:		
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function validate_presuf()
    debug_log( 'validate_presuf() -- function variable names: ' )
	local p1,p2,p3 = get_presuf_allocation( text_prefix )
	local s1,s2,s3 = get_presuf_allocation( text_suffix )
	local text_prefix_cleaned = removeBrackets( text_prefix )
	local text_suffix_cleaned = removeBrackets( text_suffix )
	local round_seconds = roundSeconds();
	local function get_seconds_from_timestamp( timeString )
		local result
		if timeString ~= nil and checkTimeString( timeString ) then
			result = convertToSeconds( timeString )
		end
		return result
	end	
	local function isSecondsInRange( min, max )
	if min == nil and max == nil then
        return false
    	elseif min == nil then
			return round_seconds < max
		elseif max == nil then
			return round_seconds >= min
		else
			return min <= round_seconds and round_seconds < max
		end	
	end
	local function get_set_seconds( set, text )
		local seconds
		if set == "a" then
			if text == "" then
				presuf["text_marker_a"] = media["text_marker_a"];				
			end
			seconds = get_seconds_from_timestamp( presuf["text_marker_a"] );
		elseif set == "b" then
			if text == "" then
				presuf["text_marker_b"] = media["text_marker_b"];
			end
			seconds =  get_seconds_from_timestamp( presuf["text_marker_b"] );
		elseif set ~= "a" and set ~= "b" then	
			seconds =  get_seconds_from_timestamp( set );
		end
		return seconds
	end
	local min, max = nil, nil
	if p1 then -- nothing required, add available text
		s = get_set_seconds( p2, text_prefix_validated )
		if s ~= nil then
			if current_count_direction == "UP" then
				min = s
				if p3 ~= nil then
					max = ( s + p3 )
				end	
			else
				max = s
				if p3 ~= nil then
					min = ( s - p3 )
				end	
			end			
		end	
		local in_range = isSecondsInRange( min, max )
		if in_range then	
			text_prefix_validated = text_prefix_cleaned
		else
			text_prefix_validated = ""
		end	
	end
	min, max = nil, nil
	if s1 then -- nothing required, add available text
		s = get_set_seconds( s2, text_suffix_validated )
		if s ~= nil then
			if current_count_direction == "UP" then
				min = s
				if s3 ~= nil then
					max = ( s + s3 )
				end	
			else
				max = s
				if s3 ~= nil then
					min = ( s - s3 )
				end	
			end
		end	
		local in_range = isSecondsInRange( min, max )
		if in_range then	
			text_suffix_validated = text_suffix_cleaned
		else
			text_suffix_validated = ""
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
local function time_mark_check( ref )
    debug_log( 'time_mark_check(' .. pre_dump(ref) .. ') -- function variable names:  ref ' )
	
	if not timer_active then return end; -- only allow mark checks if the timer is active
	--[[
	 		Make sure the trigger is as accurate as possible depending
			if the timer is counting up or down.
	]]
	local round_seconds = roundSeconds();
	local activation_time = media["activated_time_".. ref];
	local text_marker = media["text_".. ref];

	if activation_time == nil or text_marker == nil then 	
		--return; 
	end; -- nothing to activate further

	if activation_time == nil or text_marker == nil then 	
		--return; 
	end; -- nothing to activate further

	if activation_time ~= nil then 
		if ( current_count_direction == "UP" and activation_time < round_seconds ) or ( current_count_direction == "DOWN"and activation_time > round_seconds ) then -- a second or more passed
			media["activated_".. ref] = false; 
		end
	else
		-- Handle the case where activation_time is nil-- For example, you could set a default value or skip the comparison
	end
	
	validate_presuf()
	
	if raw_time( round_seconds, true ) == text_marker and not media["activated_".. ref] then -- compare current time with marker
		--[[
			Only do this stuff once when first activated, prevent wastage of resources
		]]
		media["activated_".. ref] = true; -- signal already started
		media["activated_time_".. ref] = round_seconds; -- signal already started
		
		if media["reset_text_".. ref] ~= 0 then 
			reset_marker_text_colour_start_timer( math.floor( media["reset_text_".. ref] * 1000 ), ref );
		end	
		
		if media["hide_note_".. ref] ~= 0 then 
			hide_note_start_timer( math.floor( media["hide_note_".. ref] * 1000 ), ref );
		end	
		--[[
			If Marker notes is enabled and the reference provided
			match to Marker A, complete some tasks
		]]	
		if enable_marker_notes ~= 1 and ref == "marker_a" then -- marker notes is enabled and the input reference matches	
			if media["note_source_unversioned_id_" .. ref] == "group" then
				assign_marker_note_source_name( ref )
			end
			
			local source_name = media["note_source_" .. ref]
			local parent_source_name = is_child_of_group( source_name )
			if parent_source_name ~= nil then
				set_visible( parent_source_name, true );  -- Set visble the source for the note for marker a
			end
			
 			set_visible( source_name, true );  -- Set visble the source for the note for marker a
			
			if media["note_source_unversioned_id_" .. ref] == text_source_unversioned_id then
				if media["hide_note_marker_b"] == 0 then	
					set_visible( media["note_source_marker_b"], false );  -- Set hiden the source for the note for marker b (only show one note at a time)
				end	
				set_text_note_color( ref ); -- Update the note text font to match the font colour defined for marker a
			end	
		end;		
		--[[
			If Marker notes is enabled and the reference provided
			match to Marker B, complete some tasks
		]]		
		if enable_marker_notes ~= 1 and ref == "marker_b" then -- marker notes is enabled and the input reference matches	
			if media["note_source_unversioned_id_" .. ref] == "group" then
				assign_marker_note_source_name( ref )
			end
			local source_name = media["note_source_" .. ref]
			local parent_source_name = is_child_of_group( source_name )
			if parent_source_name ~= nil then
				set_visible( parent_source_name, true );  -- Set visble the source for the note for marker b
			end
			
 			set_visible( source_name, true ); -- Set visble the source for the note for marker b
			if media["note_source_unversioned_id_" .. ref] == text_source_unversioned_id then
				if media["hide_note_marker_a"] == 0 then	
					set_visible( media["note_source_marker_a"], false ); -- Set hiden the source for the note for marker a (only show one note at a time)
				end	
				set_text_note_color( ref );  -- Update the note text font to match the font colour defined for marker b
			end	
		end;	
		--[[
			Update the timer text source font colour to match the defined font colour for the referenced marker
			This will ensure that the timer text font matches the font colour of the currently displayed note.
		]]
		if ( enable_property_color_marker_a and ref == "marker_a" ) or ( enable_property_color_marker_b and ref == "marker_b" ) then
			set_timer_text_color( media["color_".. ref] );
		end
		
		--[[
		
		]]
		start_media( media["source_name_audio_".. ref], ref );
		--[[
			if the user wants OBS to start recording when the marker activates
			check the reference and activate the timer to initiate recording 
			
			start_recording:
		
			1 = "Disabled" 
			2 = "Timer Expires", 
			3 = "Marker A Time", 
			4 = "Marker B Time", 
			5 = "Timer Visible", 
			6 = "Timer Start"
			
		]]
		
		--[[
			There may be more markers, if so check if there are and upddate variables
		]]		
		update_time_markers( round_seconds );
		update_media_names(); -- we don't reset because here the list must cycle
		
		if ref == "marker_a" then record( 3, 100 ) end; -- an integer reference used to compare with start_recording
		if ref == "marker_b" then record( 4, 100 ) end; -- an integer reference used to compare with start_recording
	end;		
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
    debug_log( 'get_source_looping(' .. pre_dump(source_name) .. ') -- function variable names:  source_name ' )
	local property = "looping"; -- we want to check this property setting
	if source_name == nil or in_table( ignore_list, source_name ) then
		return
	end		
	--[[
		Increments the source reference counter, 
		use obs_source_release() to release it when complete.
		
		we got a source name, let's see if it exist...
	]]	
	local source = obs.obs_get_source_by_name( source_name ); -- get source by name	
	local enabled = false;
    if source ~= nil then -- continue if we have a source
		local source_id = obs.obs_source_get_unversioned_id( source ); -- get source id
			if source_id == "ffmpeg_source" then -- check if source id match that of type we need to focus on
				local settings = obs.obs_source_get_settings( source ); -- get source settings
				enabled = obs.obs_data_get_bool( settings, property ); -- check if media source has playback looping enabled
			end;
	end;
	obs.obs_data_release( settings ); -- release settings
	obs.obs_source_release( source ); -- release source
	return enabled; -- bool
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
    debug_log( 'stop_media_action(' .. pre_dump(ref) .. ') -- function variable names:  ref ' )
	
	local source_name = media["source_name_audio_".. ref]; -- assign local variable 
	if source_name == nil or in_table( ignore_list, source_name ) then
		return
	end	
	
	if not media["media_ended_".. ref]	then return end; -- if source not defined, then return
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
		local source = obs.obs_get_source_by_name( source_name );
		if source ~= nil then -- source is valid
			local state = obs.obs_source_media_get_state( source ); -- get the current state for the source
			
			if media["last_state_".. ref] ~= state then -- The state has changed
			
				if state == obs.OBS_MEDIA_STATE_PLAYING then
						--[[
								time remaining is calculated differently depending on the timer_mode (count is up or down)
						]]
						local media_time_started = math.ceil( media["current_seconds_".. ref] );  -- round to nearset upper value
						local media_time_limit = math.floor( media["duration_".. ref] ); -- round to nearset lower value
						
						local time_currently = math.ceil( current_seconds );  -- round to nearset upper value
						local media_time_remaining = 0; -- set integer variable with default value
						local time_end = false; -- set bool variable with default value
					
						if timer_mode == 1 then -- count direction is positive
							media_time_remaining = media_time_started + media_time_limit; -- time media became active and add playback time limit
							time_end = ( time_currently >= media_time_remaining  ); -- time is equal to or greater than the limit
						end						
						if timer_mode == 2 then -- count direction is negative
							media_time_remaining = media_time_started - media_time_limit; -- time media became active and subtract playback time limit
							time_end = ( time_currently <= media_time_remaining  ); -- time is equal to or less than the limit
						end
					
						if time_end then -- bool, has the time limit been reached?
							media["last_state_".. ref] = state; -- update the ref state global variable because we need to track it 
							media["media_ended_".. ref] = true; -- update the ref media end global variable because we need to track it 
							set_visible( source_name, false ); -- The source visibility must now be changed to hidden
						end
				end	;
			else -- The state has not changed
				media["last_state_".. ref] = state; -- update the ref state global variable because we need to track it 
				-- the state is currently either stopped or completed, then reset source visibility to hidden
				if state == obs.OBS_MEDIA_STATE_STOPPED or state == obs.OBS_MEDIA_STATE_ENDED then -- state match?
					set_visible( source_name, false ); -- The source visibility must now be changed to hidden
				end;
			end;	 -- source state check end
		end; -- 	source ~= nil
    	obs.obs_source_release( source ); -- release source from the reference counter	
	end;
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
    debug_log( 'stop_media_playback(' .. pre_dump(source_name) .. ') -- function variable names:  source_name ' )
	
	if in_table( ignore_list, source_name ) or not is_visible( source_name ) then return end;
			
		local source = obs.obs_get_source_by_name( source_name );
	
		if source ~= nil then
			local source_id = obs.obs_source_get_unversioned_id( source ); -- unversioned_id will not be affected by language settings
			if source_id ~= "ffmpeg_source" then return end; -- apply this to media type sources only
			local state = obs.obs_source_media_get_state( source ) -- get the current state for the source
			if state == obs.OBS_MEDIA_STATE_PLAYING or obs.OBS_MEDIA_STATE_PAUSED then
				obs.obs_source_media_stop( source );
			end;
			--obs.obs_source_media_get_duration( source )
			--obs.obs_source_media_get_time( source )
			--obs.obs_source_media_restart( source )
		end;
		obs.obs_source_release( source );
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
    debug_log( 'pause_play_media(' .. pre_dump(source_name) .. ", " .. pre_dump(play) .. ') -- function variable names:  source_name, play ' )
	
	if in_table( ignore_list, source_name ) or not is_visible( source_name ) then return end;
			
		local source = obs.obs_get_source_by_name( source_name );
	
		if source ~= nil then
			local source_id = obs.obs_source_get_unversioned_id( source ); -- unversioned_id will not be affected by language settings
			if source_id ~= "ffmpeg_source" then return end; -- apply this to media type sources only
			obs.obs_source_media_play_pause( source, play );
			--obs.obs_source_media_get_duration( source )
			--obs.obs_source_media_get_time( source )
			--obs.obs_source_media_restart( source )
        	--local state = obs.obs_source_media_get_state( source ) -- get the current state for the source	
			--if state == obs.OBS_MEDIA_STATE_PLAYING  then
			--end
			--if state == obs.OBS_MEDIA_STATE_PAUSED  then
			--end
		end
		obs.obs_source_release( source );
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
    debug_log( 'stop_looping_media(' .. pre_dump(ref) .. ') -- function variable names:  ref ' )
	local source_name = media["source_name_audio_".. ref];
	
	if source_name == nil or in_table( ignore_list, source_name ) then
		return
	end	
	if get_source_looping( source_name ) then 
		stop_media_playback( source_name );
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
	bypass = bypass or false;
    debug_log( 'stop_media(' .. pre_dump(ref) .. ", " .. pre_dump(bypass) .. ') -- function variable names:  ref, bypass ' )
	if bypass then -- No checks, just stop it
		set_visible( media["source_name_audio_".. ref], false );  -- Set the media source state to hidden
	else -- do some checks
		stop_media_action( ref ); -- handle this request elsewhere
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
local function get_cycle_source_list( source_type )
	--[[
	
		Create a table for a list
	
	]]	
	local list = {}; 		-- create temporary table variable 
	local item_list =  {}; 	-- A list containing the available source names
	local data_list = obs_data_array_to_table( ctx.propsSet, "cycle_list" ); -- fetch obs userdata from property settings and return in table (the list source name list the user defined)
	--[[
		Create a list with either all the scene or source names
	]]	
	if source_type ~= "source" then -- string is not equal to "source" as it should be "scene"
		local scenes = obs.obs_frontend_get_scene_names(); -- List Scenes names
		if scenes ~= nil then
			for _, scene in ipairs( scenes ) do -- cycle through list items one at a time 
				item_list[scene] = scene;		-- add scene name (string) to the table
			end
			obs.bfree( scene ); -- free memory, release source as it is no longer needed
		end
	else -- List Source names
		local sources = get_source_list(); -- "id" or "unversioned_id" or "display_name" or "source_name"
		for key, value in pairsByKeys( sources ) do
			item_list[value] = value;
		end
	end
	--[[
	
		Create a clean list, compare the user name list with the available source name list 
		if the source exist (it must be listed in item_list) then add it to the output list and disregard
		all other items. This will filter out all mispelled or non existent items that are listed
	]]		
	for key, value in pairs( data_list ) do
		if in_table( item_list, value ) then
			table.insert( list, value )
		end
	end	
	
	return list
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
local function source_list_set_by_index( source_list, source_type, index, visible )
    debug_log( 'source_list_set_by_index(' .. pre_dump(source_type) .. ', '.. pre_dump(index).. ') -- function variable names:  source_type, index ' )
		--[[
			The list contains all available sources.
			The value targets the sources requested.
			Check if the requested source is available
		]]
		local source_name = source_list[index]
	
		if source_name ~= nil then
		
			--[[
				Type is "Scene"	
			]]
			if source_type == "scene" and visible then 
				frontend_set_current_scene( source_name )
			end
		
			if source_type == "source" then 
				set_visible( source_name, visible );
			end
	
			set_text( active_source, source_name ); 
			--[[
				force the visibility 
				state of this source. 
			]]			
			if active_source_force_visible then 
				set_visible( active_source, true ) 
			end;

		end;
	
	return source_name;
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
local function cycle_source_list_by_source_type( source_list, source_type, ctrl_index )
    debug_log( 'cycle_source_list_by_source_type(' .. pre_dump(source_type) .. ',' .. pre_dump(ctrl) .. ') -- function variable names:  source_type ' )
	if source_list == nil then 
		return ctrl_index, nil
	end	
	local source_name;
	for index = 1, #source_list do 
		local visible = ( index == ctrl_index );
		local temp_name = source_list_set_by_index( source_list, source_type, index, visible )
		if visible then source_name = temp_name end 
	end;
	--[[
		1: Ascending
		2: Desceneding
		Depending on the 'cycle_direction', set the next index.
	]]
	if cycle_direction == 2 then -- 
		ctrl_index = ( ctrl_index % #source_list ) + 1
	else
		ctrl_index = ( ctrl_index - 2 + #source_list ) % #source_list + 1
	end	
	return ctrl_index, source_list
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
local function cycle_source_list_by_source_name( source_list, ctrl_index )
    debug_log( 'cycle_source_list_by_source_name(' .. pre_dump(source_name) .. ', ' .. pre_dump(ctrl) .. ') -- function variable names:  source_name ' )
	if source_list == nil then 
		return ctrl_index, nil
	end

	for index = 1, #source_list do 
		local visible = ( index == ctrl_index );
		source_list_set_by_index( source_list, "source", index, visible )	
	end;
	
	--[[
		1: Ascending
		2: Desceneding
		Depending on the 'cycle_direction', set the next index.
	]]
	if cycle_direction == 2 then -- 
	  ctrl_index = ( ctrl_index % #source_list ) + 1
	else
	  ctrl_index = ( ctrl_index - 2 + #source_list ) % #source_list + 1
	end	
	
	return ctrl_index, source_list
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
local function reset_cycle_source_list()
    debug_log( 'reset_cycle_source_list(' .. pre_dump(source_type) .. ') -- function variable names:  source_type ' )
	
	if timer_mode ~= 2 then return end -- return if count up
	if not in_table( {"Source List", "Auto List", "Scene List"}, timer_expire_event ) then return end -- return if Timer Expire Event not in range
		
	local source_type = ( timer_expire_event == "Source List" or timer_expire_event == "Auto List" )  and "source" or "scene" 
	
	local source_list
	if in_table( {"Source List", "Scene List"}, timer_expire_event ) then
		source_list = get_cycle_source_list( source_type );
	end 
	
	if in_table( {"Auto List"}, timer_expire_event ) and not in_table( ignore_list, cycle_source_children ) then
		local source_name = cycle_source_children
		local source_list = list_source_children_by_source_name( source_name )
		if source_list ~= nil and tableHasValue( source_list ) and not in_table( ignore_list, source_name ) then
            set_visible( cycle_source_children, true ); 	
            -- Hide all children	
            for _, child_name in ipairs( source_list ) do
                    set_visible( child_name, false );
            end
			--cycle_index, source_list = cycle_source_list_by_source_name( source_list, cycle_index );
		end
	end
	
	if source_list == nil then return end
	--[[
		1: Ascending
		2: Desceneding
		Set initial 'cycle_direction', then update the next index.
	]]	
	if cycle_direction == 2 then -- 
		cycle_index = #source_list
	else
		cycle_index = 1
	end		
	--[[
		Should the item be activated on reset?
		For now, it should not, because it is
		assumed it must only be active on event expire
	]]
	for index = 1, #source_list do 
		--source_list_set_by_index( source_list, source_type, index, ( index == cycle_index ) )
		-- hide all
		source_list_set_by_index( source_list, source_type, index, false )
	end;
	--[[
		1: Ascending
		2: Desceneding
		Depending on the 'cycle_direction', set the next index.
	]]	
	if cycle_direction == 2 then -- 
		cycle_index = ( cycle_index % #source_list ) + 1
	else
		cycle_index = ( cycle_index - 2 + #source_list ) % #source_list + 1
	end	
	
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
    debug_log('scene_name_has_source_name(' .. pre_dump(scene_name) .. ", " .. pre_dump(source_name) .. ') -- function variable names:  scene_name, source_name ')
	local result = false;
    local scene_source = obs.obs_get_source_by_name( scene_name )
    local scene = obs.obs_scene_from_source( scene_source )
    local scene_items = obs.obs_scene_enum_items( scene )

    for _, scene_item in pairs( scene_items) do
        local item_source = obs.obs_sceneitem_get_source( scene_item )
        local item_source_name = obs.obs_source_get_name( item_source )
        if item_source_name == source_name then
            result = true;
			break	
        end
        local group = obs.obs_group_from_source( item_source )
        if group then
            local group_items = obs.obs_scene_enum_items( group )
            for _, group_item in pairs( group_items ) do
                local group_item_source_name = obs.obs_source_get_name( obs.obs_sceneitem_get_source( group_item ) )
                if group_item_source_name == source_name then
                    result = true;
					break;
                end
            end
            obs.sceneitem_list_release( group_items )
        end
    end
    obs.sceneitem_list_release( scene_items )
    obs.obs_source_release( scene_source )
    return result;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Called when a scene is activated/deactivated	
	
	Credit:			midnight-studios, et al
	Modified:		
	function:		make a source visible
	type:			Dependency / Support 
	input type: 	source, bool, timer_activation (global), scene_name_has_source_name() 
	returns:		none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function activate_timer_on_scene( source, activating )
    debug_log( 'activate_timer_on_scene(' .. pre_dump(source) .. ", " .. pre_dump(activating) .. ') -- function variable names:  source, activating ' )
		--[[ 
				Reset to starting point
				if, timer_activation == 2 then set to visible
		]] 
		if timer_activation == 3 and activating then
			local source_id = obs.obs_source_get_id( source );
			local current_scene_name = frontend_get_current_scene()
			if source_id == "scene" then
				if scene_name_has_source_name( current_scene_name, timer_source ) then			
					if not is_visible( timer_source ) then 
						set_visible( timer_source, true );
					end;
				end;
			end;
		end;
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
local function update_properties_setting_int( reference, value )
    debug_log( 'update_properties_setting_int(' .. pre_dump(reference) .. ", " .. pre_dump(value) .. ') -- function variable names:  reference, value ' )
	--[[
		When this is updated it will trigger a 
		callback "property_onchange", let's 
		disable that for a moment.
	]]
	--prevent_callback = true;
	
	obs.obs_data_set_int( ctx.propsSet, reference, value );
		
	obs.obs_properties_apply_settings( ctx.propsDef, ctx.propsSet );
	--[[
		When this is updated it will trigger a 
		callback "property_onchange", let's 
		enable it again
	]]
	--prevent_callback = false;
	
	return true
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
    debug_log( 'update_prop_settings_current_seconds(' .. pre_dump(value) .. ') -- function variable names:  value ' )
	--[[
		When this is updated it will trigger a 
		callback "property_onchange", let's 
		disable that for a moment.
	]]
	prevent_callback = true;
	
	obs.obs_data_set_double( ctx.propsSet, "sw_current_seconds", value );
	sw_current_seconds = value;
	obs.obs_properties_apply_settings( ctx.propsDef, ctx.propsSet );
	--[[
		When this is updated it will trigger a 
		callback "property_onchange", let's 
		enable it again
	]]
	prevent_callback = false;
	
	return true;
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
local function timer_value( value )
    debug_log( 'timer_value(' .. pre_dump(value) .. ') -- function variable names:  value ' )
	
	current_seconds = value;
	
	return current_seconds;
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
local function set_time_direction( )
    debug_log( 'set_time_direction() -- function variable names:  ' )
	--[[
	
	]]
	local t = 0;
	--[[
	
	]]	
	if direction_changed then -- normal function suspended
		if current_count_direction == "UP" then
			t = ( current_seconds + time_frequency ); -- value
		else	
			t = ( current_seconds - time_frequency ); -- value
		end
	else -- normal function active	
		--[[
		]]	
		if timer_mode ~= 2 then
			t = ( current_seconds + time_frequency ); -- value
		else
			t = ( current_seconds - time_frequency ); -- value
		end
	end
	--[[
		update the timer value
	]]
	timer_value( t ); -- value
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
    debug_log( 'update_timer_display(' .. pre_dump(source_name) .. ", " .. pre_dump(text) .. ') -- function variable names:  source_name, text ' )
	--[[
		Increments the source reference counter, 
		use obs_source_release() to release it when complete.
	]]			
	if source_name == nil or in_table( ignore_list, source_name ) then
		return
	end	
	local source = obs.obs_get_source_by_name( source_name );
	if source ~= nil then
		local settings = obs.obs_source_get_settings( source );
		if settings ~= nil then
			if not media["activated_media_marker_a"] and not media["activated_media_marker_b"] and not color_normal_updated then
				--[[
					Operating compatibility MacOSX / Windows
					The settings key for color 
					Win = "color"
					Mac = "color2" and "color3"
				]]
				obs.obs_data_set_int( settings, "color", media["color_normal"] ); -- compatibility for settings transfer
				obs.obs_data_set_int( settings, "color1", media["color_normal"] ); -- update source settings
				obs.obs_data_set_int( settings, "color2", media["color_normal"] ); -- update source settings
				color_normal_updated = true;
			end	
			time_mark_check( "marker_a" );
			time_mark_check( "marker_b" );
			obs.obs_data_set_string( settings, "text", text );				
		end	
	end
	obs.obs_source_update( source, settings );
	obs.obs_data_release( settings );
	obs.obs_source_release( source );
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
    debug_log( 'toggle_mili() -- function variable names: ' )
	if not enable_property_toggle_mili_trigger then return end
	--[[
		This feature will only activate if "Trigger Value" is defined
		and if "Trigger Value" matches "Current Time" and if
		"Timer Type" is "Count Down"
	]]
	if toggle_mili_trigger ~= "" and timer_mode == 2 and not mili_toggle_triggered then
		local time_offset = 1; -- offset by 1 second to allow user to achieve accurate setting
		if raw_time( ( current_seconds + time_offset ), true ) == toggle_mili_trigger then
			--[[
				The action trigger a toggle, so if the
				active state at the time of the trigger
				is "Show" the toggle will "Hide" and
				Vicas Versa. 
				Should we force a state? 
				To force define: show_mili = false
			]]
			mili( true );
			mili_toggle_triggered = true;
		end;
	end;
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
    debug_log( 'set_time_text(' .. pre_dump(source_name) .. ') -- function variable names:  source_name ' )
	--[[
		First Check we have a source reference
	]]
	if source_name == nil or in_table( ignore_list, source_name ) then
		return
	end	
	--[[
		Force absolute zero at this point
	]]
	if current_seconds <= 0.01 and ( timer_mode ~= 1 or ( direction_changed and current_count_direction == "DOWN" and prevent_negative_time ) ) then 
		timer_value( 0 );   -- value, update_settings 
	end;
	
	if timer_active then toggle_mili(); end -- careful becuase this could cause a stack overflow (death loop)
	
	local l_time = long_time( current_seconds );
	local t_time = raw_time( current_seconds );

	--[[
		Timer Format Type: Full Format
	]]
	local text = tostring( raw_time( current_seconds ) );
	--[[
		Timer Format Type: Remove Leading Zeros
	]]
	if timer_format == 2 then
		local system_time_format = "$T$H:$M:$S,$F";
		text = format_time( ( l_time ~= 0 ) and string.format( "%s:%s", l_time, t_time ) or string.format( "%s", t_time ), system_time_format );
	end	
	--[[
		Timer Format Type: No Leading Zeros, No Split Seconds
	]]
	if timer_format == 3 then
		local system_time_format = "$T$H:$M:$S";
		text = format_time( ( l_time ~= 0 ) and string.format( "%s:%s", l_time, t_time ) or string.format( "%s", t_time ), system_time_format );
	end
	--[[
		Timer Format Type: No Leading Zeros, No Split Seconds
	]]
	if timer_format == 4 then
		local system_time_format = "$H:$M:$S";
		text = format_time( ( l_time ~= 0 ) and string.format( "%s:%s", l_time, t_time ) or string.format( "%s", t_time ), system_time_format );
	end
	
	if timer_format ~= 5 then
		--[[
			Format the Text "Day/Days"
		]]
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
	
	
	--[[
		Timer Format Type: Custom Time Format
	]]
	
	if timer_format == 5 then
		text = format_time( ( l_time ~= 0 ) and string.format( "%s:%s", l_time, t_time ) or string.format( "%s", t_time ), removeBrackets(custom_time_format) );
	end	
	
	if timer_mode ~= 2 then
		--text_prefix = ""
		--   text_suffix = ""
	end
	if not enable_property_text_prefix then text_prefix_validated = "" end
	if not enable_property_text_suffix then text_suffix_validated = "" end
	text = text_prefix_validated .. text .. text_suffix_validated ;
	if text ~= last_text then 
		update_timer_display( timer_source, text );
	end
	
	--[[
		
		Check is media is playing and stop if required
	
	]]
	stop_media( "marker_a" );
	stop_media( "marker_b" );
	last_text = text;
	--[[
		Timer Ended
	]]
	local epsilon = 0.0001  -- tolerance value
	if math.abs(current_seconds) <= epsilon and ( timer_mode ~= 1 or ( direction_changed and current_count_direction == "DOWN" and prevent_negative_time ) ) then
		--[[
		
			Timer is shutting down, this would be a 
			good time to reset some items.
		
		]]--
		if enable_marker_notes ~= 1 then 
			set_visible( media["note_source_marker_a"], false );
			set_visible( media["note_source_marker_b"], false );  
		end		
		
		--[[
		
			Timer was started and now has EXPIRED
			execute any final instructions that 
			the user require on TIMER END 
		
		]]--
		if timer_active then timer_ended( source_name ) end;
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
		if math.abs(current_seconds) < epsilon then 
			timer_expired = true 
		end;	
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
    debug_log( 'split_unpack() -- function variable names: ' )
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
		--[[
			"Interval"			= 1
			"Mark"				= 2
			"Mark Interval"		= 3
			"Interval Mark"		= 4
		
		]]
		if split_type == 1 then
			title = "Interval";
			--subtitle = ""
			text = tostring( raw_time( interval ) );
		elseif split_type == 2 then
			title = "Mark";
			--subtitle = ""
			text = tostring( raw_time( mark ) );
		elseif split_type == 3 then
			title = "Mark                     ";
			subtitle = "Interval";
			text = tostring( raw_time( mark ).."          "..raw_time( interval ) );
		else	--	"Interval Mark"
			title = "Interval                  ";
			subtitle = "Mark";
		text = tostring( raw_time( interval ).."          "..raw_time( mark ) );
		end;
		-- data collection here
		local n = i --formatting the index number
		if i < 10 then n = "0"..tostring( i ) end;
		if data ~= nil then 	
			data = data .. "\n" .. n.." )    "..text;
		else
			data = "#       "..title..subtitle.."\n"..line.."\n\n"..n.." )    "..text;
		end
	end	-- end for
	split_data = data;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Decide if current_seconds needs to reset to default_seconds
	
	Credit:			
	Modified:		
	function:		Check if current_seconds needs to reset to default_seconds
	type:			check
	input type: 	timer_expire_event
	returns:		bool
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function update_default_time()
    debug_log( 'update_default_time() -- function variable names: ' )
	if timer_expire_event == "Source List" or timer_expire_event == "Scene List" or timer_expire_event == "Auto List" then
		return true;
	end	
	return false;
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
    debug_log( 'set_split_text(' .. pre_dump(source_name) .. ') -- function variable names:  source_name ' )
	if source_name == nil or in_table( ignore_list, source_name ) then
		return
	end	
	local text = split_data;
	if text ~= last_split_data then
		set_text( source_name, text );
		if backup_split_time then 
			write_to_file( '.txt', text, '-split-time' )
		end
	end
	last_split_data = text;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	
	Description:	Used when we need to set some globals for the timer to default state
	
	Credit:			
	Modified:		
	function:		
	type:			
	input type: 	
	returns:
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function default_timer_globals( set_to_default )
    debug_log( 'default_timer_globals(' .. pre_dump(set_to_default) .. ') -- function variable names:  set_to_default ' )
	
	--[[
		if set_to_default == true
		and timer_mode == 2	(Count Down)
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
		--timer_value( default_seconds )	 -- value, update_settings 
		--end	
		--[[
			If timer is Count Up type and user pressed "reset" the timer must always be reset to zero
		]]
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
	if media["note_source_unversioned_id_marker_a"] == text_source_unversioned_id then
		set_visible( media["note_source_marker_a"], false );
	end	
	if media["note_source_unversioned_id_marker_b"] == text_source_unversioned_id then
		set_visible( media["note_source_marker_b"], false );
	end	
	
	
	
	--[[
		-- TODO hide all note sources if nested in group
		-- TODO do we need to show the group here?
	
	]]
	if media["note_source_unversioned_id_marker_a"] == "group" then
		-- TODO set_visible( media["note_source_marker_a"], false );
	end	
	if media["note_source_unversioned_id_marker_b"] == "group" then
		-- TODO set_visible( media["note_source_marker_b"], false );
	end	
	mili_toggle_triggered = false;
	media["last_state_marker_a"]		= obs.OBS_MEDIA_STATE_NONE;
	media["last_state_marker_b"]		= obs.OBS_MEDIA_STATE_NONE;
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
    debug_log( 'reset_mili() -- function variable names:  ' )
	if not enable_property_toggle_mili_trigger then return end
	if timer_mode ~= 2 then
		return true;
	end	
	--[[
		
		Is the "Trigger Value" defined
		and is "Timer Type" set to "Count Down"
	
	]]
	if toggle_mili_trigger ~= "" then
		show_mili = false;
	else
		show_mili = true;
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
    debug_log( 'update_timer_settings(' .. pre_dump(set_to_default) .. ", " .. pre_dump(new_settings) .. ') -- function variable names:  set_to_default, new_settings ' )
	local update_timer_display = false;
	set_to_default = set_to_default or false; -- incase not defined, set default
	new_settings = new_settings or ctx.propsSet; -- incase not defined, set default
	--[[
	
	]]	
	reset_mili( );
	--[[
	
		STOPWATCH
	
	
		We will look at some tasks if the timer mode is set to stopwatch
	
		Count Up must always be reset to zero
		unless if the time is loaded from a previous session
	]]	
	if timer_mode == 1 then
		update_timer_display = true;
		--[[
			In case the mode is switched, alwasy start with a reset of the timer time
		]]
		if timer_mode_changed or timer_reset == 2 then timer_value( 0 ) end;  -- value, update_settings
		--[[
			We may require timer globals to be reset to defaults
		]]
		default_timer_globals( set_to_default );	
	end		
	--[[
		COUNTDOWN
	
		We will look at some tasks if the timer mode is set to countdown
	]]
	if timer_mode == 2 then		
		--[[
			In case the mode is switched, alwasy start with a reset of the timer time
		]]
		if timer_mode_changed then timer_value( 0 ) end; -- value, update_settings
		
		 update_timer_display = true;
		--[[
			Count Down and a specific date.
			The specific date will be converted
			to seconds.
		]]
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
			in_table( {"Source List", "Scene List", "Auto List"}, timer_expire_event )
			or
			timer_mode_changed
		);
		--[[
		
		
		
		]]
		if do_update then	
			--[[
				update timer time
			]]
			timer_value( calculated_time ); -- 
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
			default_seconds = current_seconds;
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
		if set_to_default and update_default_time() or reset_activated or ( timer_reset == 2 and set_to_default ) then	
			--[[
				update timer time
			]]
			timer_value( default_seconds ); -- value
		end	
		--[[
			We may require timer globals to be reset to defaults
		]]
		default_timer_globals( set_to_default );		
	end
	--[[
		At this stage the timer display may need to be update
	]]
	if update_timer_display then 	
		--[[
			update timer display
		]]
		set_time_text( timer_source );
	end
	update_timer_display = false;
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
    debug_log( 'timer_callback() -- function variable names: ' )
	time_frequency = get_frequency( ns_last );
	set_time_direction( );
	completed_cycles = completed_cycles + 1; -- we just keeping track of these for debugging, if needed.
	--[[
			We need to update the timer display here to create the timer animation,
			technically the timer updates the text source every x seconds to create 
			the animation effect. 
	]]
	set_time_text( timer_source );
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
    debug_log( 'end_timer() -- function variable names: ' )
	timer_active = false;
	timer_remove( timer_callback ); -- Removing the callback stops the timer	
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
    debug_log( 'start_timer() -- function variable names: ' )
	record( 6, 100 ); -- wait 100 miliseconds
	timer_active = true;
	timer_remove( timer_callback ); -- Remove any existing callbacks if they exist before assigning a new callback
	timer_add( timer_callback, timer_cycle ); --<- milliseconds 
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
    debug_log( 'activate(' .. pre_dump(activating) .. ') -- function variable names:  activating ' )
	--[[
		We skip/cancel anything requested if the 
		Script was disabled by the user.
	]]
	if disable_script then
		return;
	end
	
	if timer_active and not activating then
		--[[
		]]	
		split_unpack();
		--[[
		]]	
		set_split_text( split_source );
	end
	--[[
		Pass the activating state to a globle
		variable, as this wil be used in other
		instances.
	]]
	activated = activating;
	--[[
	
		activating will be TRUE or FALSE
		if TRUE create a TIMER (Callback) 
	
	]]
	if activating then
		--[[
			if timer is activating, it has not expired
		]]
		timer_expired = false;
		--[[
			Once the timer started, this setting will default
		]]
		set_timer_activated = false;
		
		start_timer(); -- Timer now initiated
		--[[
			STOP TIMER REQUIRED
		]]
	else
		--[[
			
			Timer ENDED (EXPIRED) or
			PAUSED 
		]]	
			reset_text_a_colour_end_timer();
			reset_text_b_colour_end_timer();
			hide_note_a_colour_end_timer();
			hide_note_b_colour_end_timer();
		
		if timer_expired and timer_active then
			end_timer() -- Removing the callback stops the timer
			set_visible( media["source_name_audio_marker_a"], false ); -- The timer expired, reset media.
			set_visible( media["source_name_audio_marker_b"], false ); -- The timer expired, reset media.
		else
			end_timer(); -- Removing the callback stops the timer
		end
		--[[
			update_timer_settings:
			
			timer_mode: countdown only
		
			timer_active: timer not running
		
			define > set_to_default: (false) * we are receiving new settings, so we do not want to set the settings to default.
			define > new_settings: not required here because we will use the global (ctx.propsSet)
		
			purpose: User is changing the countdown time settings and we need to provide instant feedback output to the timer display (timer text source)
		]]
		if not timer_active then -- update timer display when the timer settings changed
			--update_timer_settings( false ) -- optional inputs: set_to_default(bool), new_settings(obs_property_data/obs_userdata) < BUG
		end;
	end;
	
    debug_log( 'END of function activate()') -- function variable names:  activating ' )
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
local function start( pressed )
    debug_log( 'start(' .. pre_dump(pressed) .. ') -- function variable names:  pressed ' )
	if not pressed then 
		return;
	end
	--[[
		Set timer source  visibility to visible
	]]	
	set_visible( timer_source, true );
	
	if not timer_active and activated == false then
		activate( true );
	end;
	pause_play_media( media["source_name_audio_marker_a"], not timer_active );
	pause_play_media( media["source_name_audio_marker_b"], not timer_active );
	return;
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
local function pause( pressed )
    debug_log( 'pause(' .. pre_dump(pressed) .. ') -- function variable names:  pressed ' )
	if not pressed then 
		return;
	end
	--[[
		Set timer source  visibility to visible
	]]	
	set_visible( timer_source, true );

	if timer_active then
		activate( false );
	end;
	pause_play_media( media["source_name_audio_marker_a"], not timer_active );
	pause_play_media( media["source_name_audio_marker_b"], not timer_active );
	return;
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
local function startpause( pressed, force_activate )
    debug_log( 'startpausepause(' .. pre_dump(pressed) .. ') -- function variable names:  pressed ' )
	if not pressed then 
		return;
	end
	force_activate = force_activate or false
	--[[
		Set timer source  visibility to visible
	]]	
	if not is_visible( timer_source ) then 
		set_visible( timer_source, true );
	end
	
	if timer_active then
		activate( false );
	else
		if activated == false and ( not split_startpause or force_activate ) then	
			activate( true );
		end;
	end;
	pause_play_media( media["source_name_audio_marker_a"], not timer_active );
	pause_play_media( media["source_name_audio_marker_b"], not timer_active );
	return;
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
local function hotkey_send_start( pressed )
    debug_log( 'hotkey_send_start(' .. pre_dump(pressed) .. ') -- function variable names:  pressed ' )
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
		return; -- uncomment 'return' to ignore the call when key is released
	end;
	if split_startpause then
		start( pressed );
	else
		startpause( pressed );
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
local function hotkey_send_pause( pressed )
    debug_log( 'hotkey_send_pause(' .. pre_dump(pressed) .. ') -- function variable names:  pressed ' )
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
		return; -- uncomment 'return' to ignore the call when key is released
	end;
	startpause( pressed );
end	
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Take the values from the properties and assign it to the timer
	
	Credit:			
	Modified:		
	function:		Used to manually set stopwatch
	type:			Dependency / Support 	
	input type: 	none
	returns:		calls set_time_text()
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function set_stopwatch()
    debug_log( 'set_stopwatch() -- function variable names: ' )
	time_frequency = get_frequency( ns_last );
	local dd = ( sw_days_saved * 86400 )
	local hh = ( sw_hours_saved * 3600 );
	local mm = ( sw_minutes_saved * 60 );
	local ss = ( sw_seconds_saved );
	local ff = ( sw_milliseconds_saved / ( 99 + time_frequency ) );
	local time = ( dd + hh + mm + ss + ff ); 
	timer_value( time ); -- Update the last saved time here
	set_time_text( timer_source );
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
    debug_log( 'is_leap_year(' .. pre_dump(year) .. ') -- function variable names:  year ' )
	if year % 4 == 0 then -- A leap year comes once in four years
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
	--return year%4==0 and (year%100~=0 or year%400==0) -- shorthand
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Callback for button press
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function mili_button_clicked( props, p, settings )
    debug_log( 'mili_button_clicked(' .. pre_dump(props) .. ", " .. pre_dump(p) .. ", " .. pre_dump(settings) .. ') -- function variable names:  props, p, settings ' )
	if not enable_property_toggle_mili_trigger then return end
	mili( true );
	return true;
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
local function update_button_label( props )
    debug_log( 'update_button_label(' .. pre_dump(props) .. ') -- function variable names:  props ' )
	--[[
		A button has it's own callback so we can not action anything
		on the button press through the Properties Callback, instead
		we will action it on the button Callback directly.
	]]
	local mode = obs.obs_data_get_int( ctx.propsSet, "timer_mode" );
	local direction_button_prop = obs.obs_properties_get( props, "direction_button" );
	--[[
		We are only setting the button label depending if the timer is active
		and on the timer type.
	]]
	if current_count_direction == "DOWN" then
		obs.obs_property_set_description( direction_button_prop, "Toggle: Count Up" );
	else
		obs.obs_property_set_description( direction_button_prop, "Toggle: Count Down" );
	end	
	return true;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Callback for button press
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function direction_button_clicked( props, p, settings )
    debug_log( 'direction_button_clicked(' .. pre_dump(props) .. ", " .. pre_dump(p) .. ", " .. pre_dump(settings) .. ') -- function variable names:  props, p, settings ' )
	--[[
		Only allow if enable 
	]]
	if not enable_direction_toggle then
		return;
	end	
	update_timer_direction( true );
	update_button_label( props );
	return true;
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
function update_timer_direction( pressed )	
    debug_log( 'update_timer_direction(' .. pre_dump(pressed) .. ') -- function variable names:  pressed ' )
	if not pressed and not enable_direction_toggle then
		return;
	end
	--[[
		Signal that the feature is in use, this will indicate that 'normal operation'
		is suspended. It will be reset if 'Reset' is called.
	]] 
	--[[
		Change direction each time the feature is activated
	]]
	current_count_direction = ( current_count_direction == "UP" and "DOWN" or "UP")
	--[[
	 		Make sure the trigger is as accurate as possible depending
			if the timer is counting up or down.
	]]
	
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
		update_media_names(); -- we don't reset because here the list must cycle
	return true;
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
function mili( pressed )	
    debug_log( 'mili(' .. pre_dump(pressed) .. ') -- function variable names:  pressed ' )
	if not pressed then
		return;
	end
	if show_mili then
		show_mili = false;
	else
		show_mili = true;
	end
	
	if not enable_property_toggle_mili_trigger then return end
	
	--[[
		The timer text will update if the timer is active
		but not if it is paused. Lets update it if in the
		paused (inactive) state.
	]]	
	if not timer_active then
		set_time_text( timer_source );
	end	
	--[[
		A button has it's own callback so we can not action anything
		on the button press through the Properties Callback, instead
		we will action it on the button Callback directly.
	]]
	local mode = obs.obs_data_get_int( ctx.propsSet, "timer_mode" );
	local mili_button_prop = obs.obs_properties_get( props, "mili_button" ); -- should it not be ctx.propsDef
	--[[
		We are only setting the button label depending if the timer"s milliseconds
		value visibility state.
	]]
	if show_mili then
		obs.obs_property_set_description( mili_button_prop, "Hide Milliseconds" );
	else
		obs.obs_property_set_description( mili_button_prop, "Show Milliseconds" );
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
	returns:		none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function hotkey_send_mili( pressed )
    debug_log( 'hotkey_send_mili(' .. pre_dump(pressed) .. ') -- function variable names:  pressed ' )
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
		return -- uncomment 'return' to ignore the call when key is released
	end
	mili( pressed )
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	
	
	Credit:			
	Modified:		
	function:		
	type:			
	input type: 	
	returns:		none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function hotkey_send_direction( pressed )
    debug_log( 'hotkey_send_direction(' .. pre_dump(pressed) .. ') -- function variable names:  pressed ' )
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
		return -- uncomment 'return' to ignore the call when key is released
	end
	
	if not enable_direction_toggle then return end
	update_timer_direction( true )
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	
	
	Credit:			
	Modified:		
	function:		
	type:			
	input type: 	
	returns:		none
----------------------------------------------------------------------------------------------------------------------------------------
]]
function sal_timer_callback()
    debug_log( 'sal_timer_callback() -- function variable names: ' )
	if not enable_property_timer_manipulation then return end
	if timer_manipulation == 3 then return end;
	set_visible( add_limit_note_source, false );
	timer_remove( sal_timer_callback );
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	
	
	Credit:			
	Modified:		
	function:		
	type:			
	input type: 	
	returns:		none
----------------------------------------------------------------------------------------------------------------------------------------
]]
function start_sal_timer()
    debug_log( 'start_sal_timer() -- function variable names: ' )
	if not enable_property_timer_manipulation then return end
	if timer_manipulation == 3 then return end;
	set_visible( add_limit_note_source, true );
	if add_limit_note_source_visible == 0 then return end;
	timer_remove( sal_timer_callback ); -- Remove any existing callbacks if they exist before assigning a new callback
	timer_add( sal_timer_callback, add_limit_note_source_visible );
end	
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	
	
	Credit:			
	Modified:		
	function:		
	type:			
	input type: 	
	returns:		none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function sal_check( )
    debug_log( 'sal_check() -- function variable names:  ' )
	if not enable_property_timer_manipulation then return end
	if timer_manipulation == 3 then return end;
	if sec_add_limit == 0 then return end;
	if sec_add_limit_used >= sec_add_limit then
		start_sal_timer();
	else
		set_visible( add_limit_note_source, false );
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
	returns:		none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function sec_add_1_update( )
    debug_log( 'sec_add_1_update() -- function variable names:  ' )
	if not enable_property_timer_manipulation then return end
	if timer_manipulation == 3 then return end;
	if sec_add_limit ~= 0 and sec_add_limit_used >= sec_add_limit then
	-- do nothing
	else 
		timer_value( current_seconds + sec_add_1  );
		local update_value = sec_add_limit_used + 1;
		sec_add_limit_used = update_value;
		update_properties_setting_int( "sec_add_limit_used", update_value );
	end;
	sal_check( );
	return true;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	
	
	Credit:			
	Modified:		
	function:		
	type:			
	input type: 	
	returns:		none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function sec_add_2_update( )
    debug_log( 'sec_add_2_update() -- function variable names:  ' )
	if not enable_property_timer_manipulation then return end
	if timer_manipulation == 3 then return end;
	if sec_add_limit ~= 0 and sec_add_limit_used >= sec_add_limit then
	-- do nothing
	else 
		timer_value( current_seconds + sec_add_2  );
		local update_value = sec_add_limit_used + 1;
		sec_add_limit_used = update_value;
		update_properties_setting_int( "sec_add_limit_used", update_value );
	end;
	sal_check( );
	return true;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	
	
	Credit:			
	Modified:		
	function:		
	type:			
	input type: 	
	returns:		none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function sec_add_3_update( )
    debug_log( 'sec_add_3_update() -- function variable names:  ' )
	if not enable_property_timer_manipulation then return end
	if timer_manipulation == 3 then return end;
	if sec_add_limit ~= 0 and sec_add_limit_used >= sec_add_limit then
	-- do nothing
	else 
		timer_value( current_seconds + sec_add_3  );
		local update_value = sec_add_limit_used + 1;
		sec_add_limit_used = update_value;
		update_properties_setting_int( "sec_add_limit_used", update_value );	
	end;
	sal_check( );
	return true;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	
	
	Credit:			
	Modified:		
	function:		
	type:			
	input type: 	
	returns:		none
----------------------------------------------------------------------------------------------------------------------------------------
]]
function ssl_timer_callback()
    debug_log( 'ssl_timer_callback() -- function variable names: ' )
	if not enable_property_timer_manipulation then return end
	if timer_manipulation == 3 then return end;
	set_visible( sub_limit_note_source, false );
	timer_remove( ssl_timer_callback );
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	
	
	Credit:			
	Modified:		
	function:		
	type:			
	input type: 	
	returns:		none
----------------------------------------------------------------------------------------------------------------------------------------
]]
function start_ssl_timer()
    debug_log( 'start_ssl_timer() -- function variable names: ' )
	if not enable_property_timer_manipulation then return end
	if timer_manipulation == 3 then return end;
	set_visible( sub_limit_note_source, true );
	if sub_limit_note_source_visible == 0 then return end;
	timer_remove( ssl_timer_callback ); -- Remove any existing callbacks if they exist before assigning a new callback
	timer_add( ssl_timer_callback, sub_limit_note_source_visible );
end	
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	
	
	Credit:			
	Modified:		
	function:		
	type:			
	input type: 	
	returns:		none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function ssl_check( )
    debug_log( 'ssl_check() -- function variable names:  ' )
	if not enable_property_timer_manipulation then return end
	if timer_manipulation == 3 then return end;
	if sec_sub_limit == 0 then return end;
	if sec_sub_limit_used >= sec_sub_limit then
		start_ssl_timer();
	else
		set_visible( sub_limit_note_source, false );
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
	returns:		none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function sec_sub_1_update( )
    debug_log( 'sec_sub_1_update() -- function variable names:  ' )
	if not enable_property_timer_manipulation then return end
	if timer_manipulation == 3 then return end;
	if sec_sub_limit ~= 0 and sec_sub_limit_used >= sec_sub_limit then
	-- do nothing
	else 
		timer_value( current_seconds - sec_sub_1  );
		local update_value = sec_sub_limit_used + 1;
		sec_sub_limit_used = update_value;
		update_properties_setting_int( "sec_sub_limit_used", update_value );
	end;
	ssl_check( );
	return true;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	
	
	Credit:			
	Modified:		
	function:		
	type:			
	input type: 	
	returns:		none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function sec_sub_2_update( )
    debug_log( 'sec_sub_2_update() -- function variable names:  ' )
	if not enable_property_timer_manipulation then return end
	if timer_manipulation == 3 then return end;
	if sec_sub_limit ~= 0 and sec_sub_limit_used >= sec_sub_limit then
	-- do nothing
	else 
		timer_value( current_seconds - sec_sub_2  );
		local update_value = sec_sub_limit_used + 1;
		sec_sub_limit_used = update_value;
		update_properties_setting_int( "sec_sub_limit_used", update_value );	
	end;
	ssl_check( );
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	
	
	Credit:			
	Modified:		
	function:		
	type:			
	input type: 	
	returns:		none
----------------------------------------------------------------------------------------------------------------------------------------
]]

local function sec_sub_3_update( )
    debug_log( 'sec_sub_3_update() -- function variable names:  ' )
	if not enable_property_timer_manipulation then return end
	if timer_manipulation == 3 then return end;
	if sec_sub_limit ~= 0 and sec_sub_limit_used >= sec_sub_limit then
	-- do nothing
	else 
		timer_value( current_seconds - sec_sub_3  );
		local update_value = sec_sub_limit_used + 1;
		sec_sub_limit_used = update_value;
		update_properties_setting_int( "sec_sub_limit_used", update_value );
	end;
	ssl_check( );
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	
	
	Credit:			
	Modified:		
	function:		
	type:			
	input type: 	
	returns:		none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function hotkey_send_sec_add_1( pressed )
    debug_log( 'hotkey_send_sec_add_1(' .. pre_dump(pressed) .. ') -- function variable names:  pressed ' )
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
		return; -- uncomment 'return' to ignore the call when key is released
	end;
	sec_add_1_update( );
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	
	
	Credit:			
	Modified:		
	function:		
	type:			
	input type: 	
	returns:		none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function hotkey_send_sec_add_2( pressed )
    debug_log( 'hotkey_send_sec_add_2(' .. pre_dump(pressed) .. ') -- function variable names:  pressed ' )
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
		return; -- uncomment 'return' to ignore the call when key is released
	end;
	sec_add_2_update( );
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	
	
	Credit:			
	Modified:		
	function:		
	type:			
	input type: 	
	returns:		none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function hotkey_send_sec_add_3( pressed )
    debug_log( 'hotkey_send_sec_add_3(' .. pre_dump(pressed) .. ') -- function variable names:  pressed ' )
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
		return; -- uncomment 'return' to ignore the call when key is released
	end;
	sec_add_3_update( );
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	
	
	Credit:			
	Modified:		
	function:		
	type:			
	input type: 	
	returns:		none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function hotkey_send_sec_sub_1( pressed )
    debug_log( 'hotkey_send_sec_sub_1(' .. pre_dump(pressed) .. ') -- function variable names:  pressed ' )
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
		return; -- uncomment 'return' to ignore the call when key is released
	end;
	sec_sub_1_update( );
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	
	
	Credit:			
	Modified:		
	function:		
	type:			
	input type: 	
	returns:		none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function hotkey_send_sec_sub_2( pressed )
    debug_log( 'hotkey_send_sec_sub_2(' .. pre_dump(pressed) .. ') -- function variable names:  pressed ' )
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
		return; -- uncomment 'return' to ignore the call when key is released
	end
	sec_sub_2_update( );
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	
	
	Credit:			
	Modified:		
	function:		
	type:			
	input type: 	
	returns:		none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function hotkey_send_sec_sub_3( pressed )
    debug_log( 'hotkey_send_sec_sub_3(' .. pre_dump(pressed) .. ') -- function variable names:  pressed ' )
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
		return; -- uncomment 'return' to ignore the call when key is released
	end;
	sec_sub_3_update( );
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
    debug_log( 'reset(' .. pre_dump(pressed) .. ') -- function variable names:  pressed ' )
	if not script_ready then return end
	reset_activated = true; -- notify timer settings a reset call is in process
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
	set_visible( media["source_name_audio_marker_a"], false );
	set_visible( media["source_name_audio_marker_b"], false );
	set_visible( media["source_name_audio_marker_end"], false );
	media["cycle_index_marker_a"] = 1; -- index from 1-based table
	media["cycle_index_marker_b"] = 1; -- index from 1-based table
	media["cycle_index_note_marker_a"] = 1; -- index from 1-based table
	media["cycle_index_note_marker_b"] = 1; -- index from 1-based table
	media["cycle_direction_marker_a"] = 2;
	media["cycle_direction_marker_b"] = 2;
	prep_presuf()
	--[[
		This is only required because technically the timer is still active
	]]
	if not timer_event_active then
		reset_cycle_source_list();
	end	
	
	set_visible( add_limit_note_source, false );
	set_visible( sub_limit_note_source, false );
	obs.obs_data_set_int( ctx.propsSet, "sec_add_limit_used", 0 );
	obs.obs_data_set_int( ctx.propsSet, "sec_sub_limit_used", 0 );
	--[[
			Why: obs_properties_apply_settings
			
	]]
	--obs.obs_properties_apply_settings( ctx.propsDef, ctx.propsSet ); -- BUG> Failed to call timer_cb for timer_call: attempt to call a nil value
	sec_add_limit_used					= 0;
	sec_sub_limit_used					= 0;
	--[[
		Set bool to first position
	]]	
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
	set_text_note_color( "marker_a" );
	set_text_note_color( "marker_b" );
	media["used_note_source_marker_a"] = Deque.new()
	media["used_note_source_marker_b"] = Deque.new()
	reset_group_note_sources( note_source_marker_a )
	reset_group_note_sources( note_source_marker_b )
	--[[
		Reset the current_count_direction
		If the timer is in Count Up mode the
		timer is counting up
	]]
	
	count_orientation = "NORMAL"
	last_orientation = "NORMAL"
	if timer_mode == 1 then
		current_count_direction = "UP";
	else
		current_count_direction = "DOWN";
	end		
	--[[
	
		force text update by changing last_text
	
	]]
	last_text = tostring( obs.os_gettime_ns() );
	--[[
		timer_mode: eiher
		timer_active: either
		define > set_to_default: (true) * User requested a reset, so we do not want to set the settings to default.
		define > new_settings: not required here because we will use the global (ctx.propsSet)
		purpose: User is resetting the timer settings and we need to provide instant feedback output to the timer display (timer text source)
	]]
	update_timer_settings( true ); -- optional inputs: set_to_default(bool), new_settings(obs_property_data/obs_userdata) -- based on UI Settings
	--[[
	
		Handle Timer Callback
	
	]]
	activate( false ); -- start or stop the timer, in this case, stop the timer and get it ready start again
	--[[
	
		Reset timer split seconds text
	
	]]
	set_split_text( split_source );
	--[[
	
		Reset "Active Source" text (if defined)
	
	]]
	if active_source ~= "Select" then 
		
		set_text( active_source, "" ); 
		--[[
			force the visibility 
			state of this source. 
		]]	
		if active_source_force_visible then set_visible( active_source, false ) end;
	end
	
	--[[
	 		Make sure the trigger is as accurate as possible depending
			if the timer is counting up or down.
	]]
	reset_audio_marker_arr();
	local round_seconds = roundSeconds();
	update_time_markers( round_seconds );		
	update_media_names( true );	
	reset_activated = false; -- notify timer settings a reset call ended
	
	debug_log( 'END of function reset') -- function variable names:  activating ' )
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
local function timer_activation_source_activate_signal( cd, connected )
    debug_log( 'timer_activation_source_activate_signal(' .. pre_dump(cd) .. ", " .. pre_dump(connected) .. ') -- function variable names:  cd, connected ' )
	--[[
		Capture / Retrieve Callback Data
	]]	
	if timer_activation_source == "select" then return end
	
	if timer_activation == 5 then

		local source = obs.calldata_source( cd, "source" );
		--[[
			Do we have a Source?
		]]
		if source ~= nil then
			local name = obs.obs_source_get_name( source ); -- Get Source NAME
			if ( name == timer_activation_source ) then
				if connected then
					debug_log( 'Activate Timer: Source Shown' )
					if timer_reset == 2 then reset( true ) end
					start( true )
				else
					debug_log( 'De-activate Timer: Source Hiden' )
					pause( true )
				end
			end;
		end;
	end	
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
    debug_log( 'activate_signal(' .. pre_dump(cd) .. ", " .. pre_dump(connected) .. ') -- function variable names:  cd, connected ' )
	--[[
	
		Capture / Retrieve Callback Data
	
	]]
	local source = obs.calldata_source( cd, "source" );
	--[[
	
		Do we have a Source?
	
	]]
	if source ~= nil then
		
		local name = obs.obs_source_get_name( source ); -- Get Source NAME
		--[[
		
		]]		
		activate_timer_on_scene( source, connected );
		--[[
		
			Check if scene has source
		
		]]
		if ( name == timer_source ) then
			if connected then record( 5, 300 ) end;
			
			if in_table( {2,3}, timer_activation ) then 
				--[[
					Source visibility was set to hidden
				]]
				if not connected then				
					pause_play_media( media["source_name_audio_marker_a"], true );
					pause_play_media( media["source_name_audio_marker_b"], true );
				end
				--[[
					timer_mode: either
					timer_active: timer not running
					define > set_to_default: (true) * we are starting the timer from the default position and therfore want to set the settings to default.
					define > new_settings: not required here because we will use the global (ctx.propsSet)
					purpose: User requires the timer to intiate.
				]]
				if not set_timer_activated and ( timer_reset == 2 ) then
					update_timer_settings( true ); -- optional inputs: set_to_default(bool), new_settings(obs_property_data/obs_userdata)
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
local function activate_set( pressed )
    debug_log( 'activate_set(' .. pre_dump(pressed) .. ') -- function variable names:  pressed ' )
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
		return; -- uncomment 'return' to ignore the call when key is released
	end
	reset( pressed );
end	
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	
	
	Credit:			
	Modified:		
	function:		set timer	
	type:			
	input type: 	
	returns:		none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function hotkey_send_set( pressed )
    debug_log( 'hotkey_send_set(' .. pre_dump(pressed) .. ') -- function variable names:  pressed ' )
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
		return; -- uncomment 'return' to ignore the call when key is released
	end
	if timer_mode == 1 then
		set_stopwatch();
		set_timer_activated = true;
	end;
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
local function activate_reset( pressed )
    debug_log( 'activate_reset(' .. pre_dump(pressed) .. ') -- function variable names:  pressed ' )
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
		return; -- uncomment 'return' to ignore the call when key is released
	end
	reset( pressed );
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
local function hotkey_send_reset( pressed )
    debug_log( 'hotkey_send_reset(' .. pre_dump(pressed) .. ') -- function variable names:  pressed ' )
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
		return; -- uncomment 'return' to ignore the call when key is released
	end
	activate_reset( pressed );
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
local function property_button_update_start( props )
    debug_log( 'property_button_update_start(' .. pre_dump(props) .. ') -- function variable names:  props ' )
	--[[
		A button has it's own callback so we can not action anything
		on the button press through the Properties Callback, instead
		we will action it on the button Callback directly.
	]]
	local mode = obs.obs_data_get_int( ctx.propsSet, "timer_mode" );
	local pause_button_prop = obs.obs_properties_get( props, "pause_button" );
	local start_button_prop = obs.obs_properties_get( props, "start_button" );
	local direction_button_prop = obs.obs_properties_get( props, "direction_button" );
	--[[
		We are only setting the button label depending if the timer is active
		and on the timer type.
	]]
	if mode == 2 then
			obs.obs_property_set_description( direction_button_prop, "Toggle: Count Up" );
		if timer_active then
			if split_startpause then
				obs.obs_property_set_description( start_button_prop, "Start Count Down Timer" );
				obs.obs_property_set_description( pause_button_prop, "Pause Count Down Timer" );
			else
				obs.obs_property_set_description( pause_button_prop, "Start/Pause Count Down Timer" );
			end	
		else
			if split_startpause then
				obs.obs_property_set_description( start_button_prop, "Start Count Down Timer" );
				obs.obs_property_set_description( pause_button_prop, "Pause Count Down Timer" );
			else
				obs.obs_property_set_description( pause_button_prop, "Start Count Down Timer" );
			end	
		end;
	else
			obs.obs_property_set_description( direction_button_prop, "Toggle: Count Down" );
		if timer_active then
			
			if split_startpause then
				obs.obs_property_set_description( start_button_prop, "Start Count Up Timer" );
				obs.obs_property_set_description( pause_button_prop, "Pause Count Up Timer" );
			else
				obs.obs_property_set_description( pause_button_prop, "Start/Pause Count Up Timer" );
			end	
		else
			if split_startpause then
				obs.obs_property_set_description( start_button_prop, "Start Count Up Timer" );
				obs.obs_property_set_description( pause_button_prop, "Pause Count Up Timer" );
			else
				obs.obs_property_set_description( pause_button_prop, "Start Count Up Timer" );
			end	
		end;
	end;
	return props;
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
local function start_button_clicked( props, p )
    debug_log( 'start_button_clicked(' .. pre_dump(props) .. ", " .. pre_dump(p) .. ') -- function variable names:  props, p ' )
	start( true );
	property_button_update_start( props );
	return true;
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
    debug_log( 'pause_button_clicked(' .. pre_dump(props) .. ", " .. pre_dump(p) .. ') -- function variable names:  props, p ' )
	startpause( true );
	property_button_update_start( props );
	return true;
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
local function sec_add_1_button_clicked( props, p )
    debug_log( 'sec_add_1_button_clicked(' .. pre_dump(props) .. ", " .. pre_dump(p) .. ') -- function variable names:  props, p ' )
	sec_add_1_update( );
	return true;
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
local function sec_add_2_button_clicked( props, p )
    debug_log( 'sec_add_2_button_clicked(' .. pre_dump(props) .. ", " .. pre_dump(p) .. ') -- function variable names:  props, p ' )
	sec_add_2_update( );
	return true;
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
local function sec_add_3_button_clicked( props, p )
    debug_log( 'sec_add_3_button_clicked(' .. pre_dump(props) .. ", " .. pre_dump(p) .. ') -- function variable names:  props, p ' )
	sec_add_3_update( );
	return true;
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
local function sec_sub_1_button_clicked( props, p )
    debug_log( 'sec_sub_1_button_clicked(' .. pre_dump(props) .. ", " .. pre_dump(p) .. ') -- function variable names:  props, p ' )
	sec_sub_1_update( );
	return true;
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
local function sec_sub_2_button_clicked( props, p )
    debug_log( 'sec_sub_2_button_clicked(' .. pre_dump(props) .. ", " .. pre_dump(p) .. ') -- function variable names:  props, p ' )
	sec_sub_2_update( );
	return true;
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
local function sec_sub_3_button_clicked( props, p )
    debug_log( 'sec_sub_3_button_clicked(' .. pre_dump(props) .. ", " .. pre_dump(p) .. ') -- function variable names:  props, p ' )
	sec_sub_3_update( );
	return true;
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
local function export( pressed )
    debug_log( 'export(' .. pre_dump(pressed) .. ') -- function variable names:  pressed ' )
	if not pressed then
		return;
	end;
	local file_exported = write_to_json( ctx.propsSet );
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
    debug_log( 'export_button_clicked(' .. pre_dump(props) .. ", " .. pre_dump(p) .. ') -- function variable names:  props, p ' )
	export( true );
	return false;
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
    debug_log( 'import_properties(' .. pre_dump(props) .. ", " .. pre_dump(property) .. ", " .. pre_dump(settings) .. ') -- function variable names:  props, property, settings ' )
	local property_name = obs.obs_property_name( property );
	local import_folder = backup_folder
	-- convert Windows path to UNIX path
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
  -- IMPORTANT: returns true to trigger refresh of the properties
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
local function import_button_clicked( props, property, settings )
    debug_log( 'import_button_clicked(' .. pre_dump(props) .. ", " .. pre_dump(property) .. ", " .. pre_dump(settings) .. ') -- function variable names:  props, p, settings ' )	
	local property_name = obs.obs_property_name( property );
  -- IMPORTANT: returns true to trigger refresh of the properties	
	return true;
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
    debug_log( 'sw_saved_button_clicked(' .. pre_dump(props) .. ", " .. pre_dump(p) .. ", " .. pre_dump(settings) .. ') -- function variable names:  props, p, settings ' )
	if timer_mode == 1 then
		set_stopwatch();
		set_timer_activated = true;
	end;
	return false;
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
    debug_log( 'reset_button_clicked(' .. pre_dump(props) .. ", " .. pre_dump(p) .. ", " .. pre_dump(settings) .. ') -- function variable names:  props, p, settings ' )
	activate_reset( true );
	return true;
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
local function split_time( pressed )
    debug_log( 'split_time(' .. pre_dump(pressed) .. ') -- function variable names:  pressed ' )
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
local function hotkey_send_split( pressed )
    debug_log( 'hotkey_send_split(' .. pre_dump(pressed) .. ') -- function variable names:  pressed ' )
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
		return; -- uncomment 'return' to ignore the call when key is released
	end
	split_time( pressed );
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
    debug_log( 'split_button_clicked(' .. pre_dump(props) .. ", " .. pre_dump(p) .. ') -- function variable names:  props, p ' )
	split_time( true );
	return false;
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
    debug_log( 'load_settings_globals(' .. pre_dump(settings) .. ') -- function variable names:  settings ' )

	enable_property_color_normal = obs.obs_data_get_bool( settings, "enable_property_color_normal" ); 
	enable_property_color_marker_a = obs.obs_data_get_bool( settings, "enable_property_color_marker_a" ); 
	enable_property_color_marker_b = obs.obs_data_get_bool( settings, "enable_property_color_marker_b" ); 
	enable_property_toggle_mili_trigger = obs.obs_data_get_bool( settings, "enable_property_toggle_mili_trigger" ); 
	enable_property_split_source = obs.obs_data_get_bool( settings, "enable_property_split_source" ); 
	enable_property_trigger_options = obs.obs_data_get_bool( settings, "enable_property_trigger_options" ); 
	enable_property_start_recording = obs.obs_data_get_bool( settings, "enable_property_start_recording" ); 
	enable_property_text_prefix = obs.obs_data_get_bool( settings, "enable_property_text_prefix" ); 
	enable_property_text_suffix = obs.obs_data_get_bool( settings, "enable_property_text_suffix" ); 
	enable_property_timer_manipulation = obs.obs_data_get_bool( settings, "enable_property_timer_manipulation" ); 
	enable_property_timer_activation = obs.obs_data_get_bool( settings, "enable_property_timer_activation" ); 
	enable_property_debug = obs.obs_data_get_bool( settings, "enable_property_debug" ); 
	enable_property_backup = obs.obs_data_get_bool( settings, "enable_property_backup" ); 
	last_timer_mode = timer_mode;
	timer_day = obs.obs_data_get_int( settings, "day" );
	timer_year = obs.obs_data_get_int( settings, "year" );
	timer_hours = obs.obs_data_get_int( settings, "hours" );
	timer_month = obs.obs_data_get_int( settings, "month" ) - 1;
	
	--[[
			"Default" 
			"Timer Source Visible" 
			"Timer Scene Active" 
			"Specific Scene Active"
	
			"Manual"
			"Auto"
	]]
	
	timer_activation = obs.obs_data_get_int( settings, "timer_activation" );
	timer_reset = obs.obs_data_get_int( settings, "timer_reset" );
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
	timer_activation_source = obs.obs_data_get_string( settings, "timer_activation_source" );
	countdown_type = obs.obs_data_get_int( settings, "countdown_type" );
	sw_days_saved = obs.obs_data_get_int( settings, "sw_days_saved" );
	sw_hours_saved = obs.obs_data_get_int( settings, "sw_hours_saved" );
	cycle_direction = obs.obs_data_get_int( settings, "cycle_direction" );
	sw_current_seconds = obs.obs_data_get_double( settings, "sw_current_seconds" );
	load_saved_time = obs.obs_data_get_bool( settings, "load_saved_time" );
	backup_split_time = obs.obs_data_get_bool( settings, "backup_split_time" );
	sw_minutes_saved = obs.obs_data_get_int( settings, "sw_minutes_saved" );
	sw_seconds_saved = obs.obs_data_get_int( settings, "sw_seconds_saved" );
	custom_time_format = obs.obs_data_get_string( settings, "custom_time_format" );
	toggle_mili_trigger = obs.obs_data_get_string( settings, "toggle_mili_trigger" );
	sw_milliseconds_saved = obs.obs_data_get_int( settings, "sw_milliseconds_saved" );
	prevent_negative_time = obs.obs_data_get_bool( settings, "prevent_negative_time" );
	note_source_marker_a = obs.obs_data_get_string( settings, "note_source_marker_a" );
	note_source_marker_b = obs.obs_data_get_string( settings, "note_source_marker_b" );
	media["note_source_unversioned_id_marker_a"] = get_source_unversioned_id_by_name( note_source_marker_a )
	media["note_source_unversioned_id_marker_b"] = get_source_unversioned_id_by_name( note_source_marker_b )
	media["note_source_marker_a"] = note_source_marker_a;
	media["note_source_marker_b"] = note_source_marker_b;
	longtimetext_s = string.gsub(obs.obs_data_get_string( settings, "day_text" ), "\\([n])", {n="\n"});
	longtimetext_p = string.gsub(obs.obs_data_get_string( settings, "days_text" ), "\\([n])", {n="\n"});
	media["note_marker_a"] = string.gsub(obs.obs_data_get_string( settings, "note_marker_a" ), "\\([n])", {n="\n"});
	media["note_marker_b"] = string.gsub(obs.obs_data_get_string( settings, "note_marker_b" ), "\\([n])", {n="\n"});
	script_ready = obs.obs_data_get_bool( settings, "script_ready" );-- -- Retrieves property value from reference
	debug_log( 'load_settings_globals get script_ready (' .. pre_dump(script_ready) .. ') ' )
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
	default_seconds = current_seconds;
	split_type = obs.obs_data_get_int( settings, "split_type" );
	stop_text = obs.obs_data_get_string( settings, "stop_text" );
	timer_expire_event = obs.obs_data_get_string( settings, "timer_expire_event" );
	cycle_source_children = obs.obs_data_get_string( settings, "cycle_source_children" );
	import_list = obs.obs_data_get_string( settings, "import_list" );
	split_source = obs.obs_data_get_string( settings, "split_source" );
    disable_script = obs.obs_data_get_bool( settings, "disable_script" );
    debug_enabled = obs.obs_data_get_bool( settings, "debug_enabled" );
    enable_direction_toggle = obs.obs_data_get_bool( settings, "enable_direction_toggle" );
	backup_folder = obs.obs_data_get_string( settings, "backup_folder" );
	active_source = obs.obs_data_get_string( settings, "active_source" );
	start_recording = obs.obs_data_get_int( settings, "start_recording" );												
	media["color_normal"] = enable_property_color_normal and obs.obs_data_get_int( settings, "color_normal" ) or get_text_color( timer_source );
	media["color_marker_a"] = obs.obs_data_get_int( settings, "color_marker_a" );
	media["color_marker_b"] = obs.obs_data_get_int( settings, "color_marker_b" );
	audio_marker_a = obs.obs_data_get_string( ctx.propsSet, "audio_marker_a" );
	audio_marker_b = obs.obs_data_get_string( ctx.propsSet, "audio_marker_b" );
	if audio_marker_a ~= "list" then
		media["source_name_audio_marker_a"] = audio_marker_a
	end	
	if audio_marker_b ~= "list" then
		media["source_name_audio_marker_b"] = audio_marker_b
	end	
	media_playback_limit = obs.obs_data_get_int( settings, "media_playback_limit" );
     active_source_force_visible = obs.obs_data_get_bool( settings, "active_source_force_visible" );
    split_startpause = obs.obs_data_get_bool( settings, "split_startpause" );
	media["source_name_audio_marker_end"] = obs.obs_data_get_string( settings, "audio_marker_end" );	
	text_prefix = string.gsub(obs.obs_data_get_string( settings, "text_prefix" ), "\\([n])", {n="\n"});
	text_suffix = string.gsub(obs.obs_data_get_string( settings, "text_suffix" ), "\\([n])", {n="\n"});
	media["reset_text_marker_a"] = obs.obs_data_get_int( settings, "reset_text_marker_a" );
	media["reset_text_marker_b"] = obs.obs_data_get_int( settings, "reset_text_marker_b" );
	media["hide_note_marker_a"] = obs.obs_data_get_int( settings, "hide_note_marker_a" );
	media["hide_note_marker_b"] = obs.obs_data_get_int( settings, "hide_note_marker_b" );
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
	--[[
	 		Make sure the trigger is as accurate as possible depending
			if the timer is counting up or down.
	]]
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
local function init()
		debug_log( 'init' )
		obs.obs_data_set_bool( ctx.propsSet, "script_ready", true ); -- set to signal ready state.
		debug_log( 'loaded set script_ready (' .. pre_dump(true) .. ') ' )
		--[[
			load any property values available to globals
		]]
		load_settings_globals( ctx.propsSet );	
		
		set_visible( media["source_name_audio_marker_a"], false ); -- set hidden just in case
		set_visible( media["source_name_audio_marker_b"], false ); -- set hidden just in case
		set_visible( media["source_name_audio_marker_end"], false ); -- set hidden just in case
		set_visible( add_limit_note_source, false );	-- set hidden just in case
		set_visible( sub_limit_note_source, false ); -- set hidden just in case
		if timer_activation == 2 then -- Timer source visible
			set_visible( timer_source, false ) -- set hidden as a starting point, the user can start the timer by setting it to visible
		end	
		if timer_mode == 1 then
			if load_saved_time then
				timer_value( sw_current_seconds ); -- value
			else

				timer_value( 0 );
				reset( true );	-- <BUG signal handler crash on startup?	
			end;
		else
			reset( true );	-- <BUG signal handler crash on startup?	
		end;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	custom function
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
    debug_log( 'loaded(' .. pre_dump(cd) .. ') -- function variable names:  cd ' )
	
	obs.obs_data_set_bool( settings, "script_ready", false ); -- set false to signal that the script is not yet ready.
	debug_log( 'loaded set script_ready (' .. pre_dump(false) .. ') ' )
	
	local all_sources_loaded = false;
	--[[
		Get source from CallData
	]]
	local source = obs.calldata_source( cd, "source" );
	--[[
		Found Source:
	]]

	if source ~= nil then 
				
		local name = obs.obs_source_get_name( source ); -- Get the source name, this will be a unique identifier 
		local id = obs.obs_source_get_id( source )
		debug_log( 'loaded source: (' .. pre_dump(name) .. ')' )		
		--[[
			Does the name match the property value?
		]] 
		if ( name == timer_source ) then
			if timer_activation == 2 then -- timer source visible
				set_visible( timer_source, false ); -- set hidden as a starting point, the user can start the timer by setting it to visible
			end;
		end;
		
		if in_table( required_sources, id ) then
			sources_loaded = sources_loaded + 1; -- add this to the loaded sopurce tally
		end;	
	end;
	--[[
		Check if all sources are loaded
	]]	
	local current_source_count = count_required_sources()
	all_sources_loaded = ( sources_loaded == current_source_count );
	
		debug_log( 'all_sources_loaded source: (' .. pre_dump(all_sources_loaded) .. ' loaded: ' .. pre_dump(sources_loaded) .. " of "  .. pre_dump(current_source_count) .. ')' )
	
	--[[
		Some of the functions included requires the source to be loaded, 
		so check that all sources are loaded before continuing
	]]
	if all_sources_loaded then
		debug_log( 'all_sources_loaded are now loaded!' )
		init();	
	end;	
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
local function source_show( cd )
    debug_log( 'source_show(' .. pre_dump(cd) .. ') -- function variable names:  cd ' )
	activate_signal( cd, false );
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
local function source_hide( cd )
	debug_log( 'source_hide(' .. pre_dump(cd) .. ') -- function variable names:  cd ' )
	activate_signal( cd, true );
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
	debug_log( 'source_activated(' .. pre_dump(cd) .. ') -- function variable names:  cd ' )
	activate_signal( cd, true );
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
    debug_log( 'source_deactivated(' .. pre_dump(cd) .. ') -- function variable names:  cd ' )
	activate_signal( cd, false );
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
local function timer_activation_source_activated( cd )
	debug_log( 'timer_activation_source_activated(' .. pre_dump(cd) .. ') -- function variable names:  cd ' )
	timer_activation_source_activate_signal( cd, true );
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
local function timer_activation_source_deactivated( cd )
    debug_log( 'timer_activation_source_deactivated(' .. pre_dump(cd) .. ') -- function variable names:  cd ' )
	timer_activation_source_activate_signal( cd, false );
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
local function timer_activation_source_media( cd )
    debug_log( 'timer_activation_source_media(' .. pre_dump(cd) .. ", " .. pre_dump(connected) .. ') -- function variable names:  cd, connected ' )
	--[[
		Capture / Retrieve Callback Data
	]]	
	if timer_activation_source == "select" then return end
	
	if timer_activation == 6 then

		local source = obs.calldata_source( cd, "source" );
		--[[
			Do we have a Source?
		]]
		if source ~= nil then
			local source_id = obs.obs_source_get_unversioned_id( source ); -- unversioned_id will not be affected by language settings
			if source_id ~= "ffmpeg_source" then return end; -- apply this to media type sources only
			local name = obs.obs_source_get_name( source ); -- Get Source NAME
			if ( name == timer_activation_source ) then
				if timer_reset == 2 then reset( true ) end
				start( true )
			end;
		end;
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
local function timer_activation_source_media_started( cd )
    debug_log( 'timer_activation_source_media_started(' .. pre_dump(cd) .. ') -- function variable names:  cd ' )
	timer_activation_source_media( cd );
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
function timer_activation_signals()
    debug_log( 'timer_activation_signals(' .. pre_dump(settings) .. ') -- function variable names:  settings ' )
		if timer_activation_source ~= "select" then
			if timer_activation == 5 then
				local source = obs.obs_get_source_by_name( timer_activation_source ); -- Increments the source reference counter, use obs_source_release() to release it when complete.
				--[[
					Found Source?
				]]
				if source ~= nil then  
					connectSignalHandler( source, "activate", timer_activation_source_activated )
					connectSignalHandler( source, "deactivate", timer_activation_source_deactivated )
				end;
				obs.obs_source_release( source );		
			end	
			if timer_activation == 6 then
				local source = obs.obs_get_source_by_name( timer_activation_source ); -- Increments the source reference counter, use obs_source_release() to release it when complete.
				--[[
					Found Source?
				]]
				if source ~= nil then  
					connectSignalHandler( source, "media_started", timer_activation_source_media_started ) -- Called when media has started.
				end;
				obs.obs_source_release( source );		
			end	
		end	
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
	if disable_script then return; end;
    debug_log( 'property_onchange(' .. pre_dump(props) .. ", " .. pre_dump(property) .. ", " .. pre_dump(settings) .. ') -- function variable names:  props, property, settings ' )
	--[[
	
		Optimization: prevent unnecessary callbacks
	
	]]
	local property_name = obs.obs_property_name( property );
	if prevent_callback then return end
	--[[
	
			 PROPERTY VALUE
	
	]]
	local script_ready_value = obs.obs_data_get_bool( settings, "script_ready" );-- -- Retrieves property value from reference
	--[[
		 	let's make sure we are not responding to nil values during a script refresh
			The form has been marked as ready, this happens during script load, so if
			the Property script_ready_value is equal to nil then we return.
	]]
	if script_ready and not script_ready_value then
		return
	end	
	
	local day_value = obs.obs_data_get_int( settings, "day" );-- -- Retrieves property value from reference
	local year_value = obs.obs_data_get_int( settings, "year" );-- -- Retrieves property value from reference
	local month_value = obs.obs_data_get_int( settings, "month" );-- -- Retrieves property value from reference
	local layout_value = obs.obs_data_get_int( settings, "layout" );-- -- Retrieves property value from reference
	local timer_mode_value = obs.obs_data_get_int( settings, "timer_mode" );-- -- Retrieves property value from reference
	local backup_mode_value = obs.obs_data_get_bool( settings, "backup_mode" );-- -- Retrieves property value from reference
	local enable_marker_notes_value = obs.obs_data_get_int( settings, "enable_marker_notes" );-- -- Retrieves property value from reference
	local import_list_value = obs.obs_data_get_string( settings, "import_list" );-- -- Retrieves property value from reference
	local timer_expire_event_value = obs.obs_data_get_string( settings, "timer_expire_event" );	-- -- Retrieves property value from reference
	local timer_options_value = obs.obs_data_get_int( settings, "timer_options" );-- -- Retrieves property value from reference
	local timer_source_value = obs.obs_data_get_string( settings, "timer_source" );-- -- Retrieves property value from reference	
	local trigger_options_value = obs.obs_data_get_int( settings, "trigger_options" );-- -- Retrieves property value from reference
	local split_source_value = obs.obs_data_get_string( settings, "split_source" );-- -- Retrieves property value from reference
	local set_stopwatch_value = obs.obs_data_get_bool( settings, "set_stopwatch" );-- -- Retrieves property value from reference
	local countdown_type_value = obs.obs_data_get_int( settings, "countdown_type" );-- -- Retrieves property value from reference
	local active_source_value = obs.obs_data_get_string( settings, "active_source" );-- -- Retrieves property value from reference
	local start_recording_value = obs.obs_data_get_int( settings, "start_recording" );-- -- Retrieves property value from reference
	local note_source_marker_a_value = obs.obs_data_get_string( settings, "note_source_marker_a" );-- -- Retrieves property value from reference
	local note_source_marker_b_value = obs.obs_data_get_string( settings, "note_source_marker_b" );-- -- Retrieves property value from reference
	local audio_marker_a_value = obs.obs_data_get_string( settings, "audio_marker_a" );-- -- Retrieves property value from reference
	local audio_marker_b_value = obs.obs_data_get_string( settings, "audio_marker_b" );-- -- Retrieves property value from reference
	local media_playback_limit_value = obs.obs_data_get_int( settings, "media_playback_limit" );-- -- Retrieves property value from reference
	local select_features = obs.obs_data_get_bool( settings, "select_features" );-- -- Retrieves property value from reference
	--[[
	
			 BACKUP PROPERTIES
	
	]]	
	local backup_mode_prop = obs.obs_properties_get( props, "backup_mode" );
	local backup_split_time_prop = obs.obs_properties_get( props, "backup_split_time" );
	local debug_enabled_prop = obs.obs_properties_get( props, "debug_enabled" );
	local import_list_prop = obs.obs_properties_get( props, "import_list" );
	--[[
	
			 TIMER PROPERTIES
	
	]]
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
	local timer_activation_prop = obs.obs_properties_get( props, "timer_activation" );
	local timer_activation_source_prop = obs.obs_properties_get( props, "timer_activation_source" );
	local timer_reset_prop = obs.obs_properties_get( props, "timer_reset" );
	local start_button_prop = obs.obs_properties_get( props, "start_button" );
	local pause_button_prop = obs.obs_properties_get( props, "pause_button" );
	local reset_button_prop = obs.obs_properties_get( props, "reset_button" );
	local direction_button_prop = obs.obs_properties_get( props, "direction_button" );
	local timer_options_prop = obs.obs_properties_get( props, "timer_options" );
	local custom_time_format_prop = obs.obs_properties_get( props, "custom_time_format" );
	local toggle_mili_trigger_prop = obs.obs_properties_get( props, "toggle_mili_trigger" );
	local add_limit_note_source_visible_prop = obs.obs_properties_get( props, "add_limit_note_source_visible" );
	local sub_limit_note_source_visible_prop = obs.obs_properties_get( props, "sub_limit_note_source_visible" );
	--[[
	
			 STOPWATCH PROPERTIES
	
	]]
	local _group_1_prop = obs.obs_properties_get( props, "_group_1" );
	local _group_2_prop = obs.obs_properties_get( props, "_group_2" );
	local _group_3_prop = obs.obs_properties_get( props, "_group_3" );
	local sw_hours_saved_prop = obs.obs_properties_get( props, "sw_hours_saved" );
	local sw_minutes_saved_prop = obs.obs_properties_get( props, "sw_minutes_saved" );
	local set_stopwatch_prop = obs.obs_properties_get( props, "set_stopwatch" );
	--[[
	
			 COUNTDOWN PROPERTIES
	
	]]	
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
	
	local cycle_direction_prop = obs.obs_properties_get( props, "cycle_direction" );
	local as_visible_prop = obs.obs_properties_get( props, "active_source_force_visible" );
	local split_startpause_prop = obs.obs_properties_get( props, "split_startpause" );
	--[[
	
			 PROPERTIES
	
	]]	
	local hours_prop = obs.obs_properties_get( props, "hours" );
	local minutes_prop = obs.obs_properties_get( props, "minutes" );
	local seconds_prop = obs.obs_properties_get( props, "seconds" );
	local split_type_prop = obs.obs_properties_get( props, "split_type" );
	local timer_expire_event_prop = obs.obs_properties_get( props, "timer_expire_event" );
	local cycle_source_children_prop = obs.obs_properties_get( props, "cycle_source_children" );
	local split_button_prop = obs.obs_properties_get( props, "split_button" );
	local split_source_prop = obs.obs_properties_get( props, "split_source" );
	local timer_format_prop = obs.obs_properties_get( props, "timer_format" );
	local color_normal_prop = obs.obs_properties_get( props, "color_normal" );
	local countdown_type_prop = obs.obs_properties_get( props, "countdown_type" );
	local start_recording_prop = obs.obs_properties_get( props, "start_recording" );
	local select_features_prop = obs.obs_properties_get( props, "select_features" );
	local _group_4_prop = obs.obs_properties_get( props, "_group_4" );
	--[[
	
			 PROPERTIES
	
	]]
	local export_button_prop = obs.obs_properties_get( props, "export_button" );
	local import_button_prop = obs.obs_properties_get( props, "import_button" );
	local export_folder_prop = obs.obs_properties_get( props, "backup_folder" );
	local disable_script_prop = obs.obs_properties_get( props, "disable_script" );
	local enable_direction_toggle_prop = obs.obs_properties_get( props, "enable_direction_toggle" );
	local prevent_negative_time_prop = obs.obs_properties_get( props, "prevent_negative_time" );
	--[[
	
			WARNING & CAUTION PROPERTIES
	
	]]
	local to_prop = obs.obs_properties_get( props, "trigger_options" );
	local a_note_prop = obs.obs_properties_get( props, "note_marker_a" );
	local b_note_prop = obs.obs_properties_get( props, "note_marker_b" );
	local enable_marker_notes_prop = obs.obs_properties_get( props, "enable_marker_notes" );
	local text_marker_tip_prop = obs.obs_properties_get( props, "text_marker_tip" );
	local text_arr_marker_a_prop = obs.obs_properties_get( props, "text_arr_marker_a" );
	local text_arr_marker_b_prop = obs.obs_properties_get( props, "text_arr_marker_b" );
	local color_marker_a_prop = obs.obs_properties_get( props, "color_marker_a" );
	local color_marker_b_prop = obs.obs_properties_get( props, "color_marker_b" );
	local audio_marker_a_prop = obs.obs_properties_get( props, "audio_marker_a" );
	local audio_marker_b_prop = obs.obs_properties_get( props, "audio_marker_b" );
	local audio_marker_a_arr_prop = obs.obs_properties_get( props, "audio_marker_a_arr" );
	local audio_marker_b_arr_prop = obs.obs_properties_get( props, "audio_marker_b_arr" );
	local audio_marker_end_prop = obs.obs_properties_get( props, "audio_marker_end" );
	local a_source_prop = obs.obs_properties_get( props, "note_source_marker_a" );
	local b_source_prop = obs.obs_properties_get( props, "note_source_marker_b" );
	local duration_marker_a_prop = obs.obs_properties_get( props, "duration_marker_a" );
	local duration_marker_b_prop = obs.obs_properties_get( props, "duration_marker_b" );
	local reset_text_marker_a_prop = obs.obs_properties_get( props, "reset_text_marker_a" );
	local reset_text_marker_b_prop = obs.obs_properties_get( props, "reset_text_marker_b" );
	local hide_note_marker_a_prop = obs.obs_properties_get( props, "hide_note_marker_a" );
	local hide_note_marker_b_prop = obs.obs_properties_get( props, "hide_note_marker_b" );
	local duration_marker_end_prop = obs.obs_properties_get( props, "duration_marker_end" );
	local media_playback_limit_prop = obs.obs_properties_get( props, "media_playback_limit" );
	--[[
			TIMER INPUTS
	]]	
	obs.obs_property_set_visible( timer_options_prop, layout_value == 2 );
	obs.obs_property_set_visible( timer_manipulation_prop, enable_property_timer_manipulation and layout_value == 2 and timer_options_value == 2 and not in_table( ignore_list, timer_source_value ) );
	obs.obs_property_set_visible( direction_button_prop, layout_value == 2 and enable_direction_toggle and ( timer_mode_value == 2 and countdown_type_value == 2 or timer_mode_value == 1 ) and not in_table( ignore_list, timer_source_value ) ); --  
	obs.obs_property_set_visible( custom_time_format_prop, timer_format == 5 and not in_table( ignore_list, timer_source_value ) and layout_value == 2 and timer_options_value == 2 );
	obs.obs_property_set_visible( add_limit_note_source_visible_prop, add_limit_note_source ~= "select" and not in_table( ignore_list, timer_source_value ) );

	obs.obs_property_set_visible( timer_activation_prop, enable_property_timer_activation and layout_value == 2 and timer_options_value == 2 and not in_table( ignore_list, timer_source_value ) );
	obs.obs_property_set_visible( timer_reset_prop, enable_property_timer_activation and layout_value == 2 and timer_options_value == 2 and timer_activation ~= 1 and not in_table( ignore_list, timer_source_value ) );
	obs.obs_property_set_visible( timer_activation_source_prop, enable_property_timer_activation and layout_value == 2 and timer_options_value == 2 and in_table( {4,5,6}, timer_activation ) and not in_table( ignore_list, timer_source_value ) );
	--[[
	
			TIMER STOPWATCH INPUTS
			
			if layout is set to basic then hide
			if layout is set to advanced then check if timer_options are expanded then show
	]]	
	obs.obs_property_set_visible( split_button_prop, enable_property_split_source and ( timer_mode_value == 1 and not in_table( ignore_list, split_source_value ) ) );
	obs.obs_property_set_visible( text_prefix_prop, enable_property_text_prefix and layout_value == 2 and timer_options_value == 2 and not in_table( ignore_list, timer_source_value ) );
	obs.obs_property_set_visible( text_suffix_prop, enable_property_text_suffix and layout_value == 2 and timer_options_value == 2 and not in_table( ignore_list, timer_source_value ) );
	obs.obs_property_set_visible( timer_format_prop, layout_value == 2 and timer_options_value == 2 and not in_table( ignore_list, timer_source_value ) );	
	obs.obs_property_set_visible( color_normal_prop, enable_property_color_normal and layout_value == 2 and timer_options_value == 2 and not in_table( ignore_list, timer_source_value )  );
	obs.obs_property_set_visible( set_stopwatch_prop, ( layout_value == 2 and timer_mode_value == 1 and timer_options_value == 2 and not in_table( ignore_list, timer_source_value ) ) );
	obs.obs_property_set_visible( timer_source_prop, ( layout_value == 2 and timer_options_value == 2 ) );
	obs.obs_property_set_visible( split_type_prop, enable_property_split_source and timer_mode_value == 1 and not in_table( ignore_list, split_source_value ) and layout_value == 2 and timer_options_value == 2 );
	obs.obs_property_set_visible( split_source_prop, enable_property_split_source and timer_mode_value == 1 and layout_value == 2 and timer_options_value == 2 and not in_table( ignore_list, timer_source_value ) );
	obs.obs_property_set_visible( _group_1_prop, ( layout_value == 2 and set_stopwatch_value and timer_mode_value == 1 and timer_options_value == 2 and not in_table( ignore_list, timer_source_value ) ) );
	obs.obs_property_set_visible( _group_2_prop, ( layout_value == 2 and timer_options_value == 2 and enable_property_timer_manipulation  and timer_manipulation == 2 and not in_table( ignore_list, timer_source_value ) ) );
	obs.obs_property_set_visible( _group_3_prop, ( layout_value == 2 and timer_options_value == 2 and enable_property_timer_manipulation and timer_manipulation == 2 and not in_table( ignore_list, timer_source_value )  ) );
	--[[
	
			TIMER COUNTDOWN INPUTS
			
			if layout is set to basic then hide
			if layout is set to advanced then check if timer_options are expanded then show
	]]		
	obs.obs_property_set_enabled( day_prop, month_value ~= 1 );
	obs.obs_property_set_enabled( year_prop, month_value ~= 1 );
	obs.obs_property_set_visible( mili_button_prop, enable_property_toggle_mili_trigger and show_split( props, settings ) and ( toggle_mili_trigger == "" ) and not in_table( ignore_list, timer_source_value ) );
	obs.obs_property_set_visible( toggle_mili_trigger_prop, enable_property_toggle_mili_trigger and show_split( props, settings ) and timer_options_value == 2 and not in_table( ignore_list, timer_source_value ) );
	obs.obs_property_set_visible( hours_prop, layout_value == 2 and timer_mode_value == 2 and timer_options_value == 2 and not in_table( ignore_list, timer_source_value ) );
	obs.obs_property_set_visible( minutes_prop, layout_value == 2 and timer_mode_value == 2 and timer_options_value == 2 and not in_table( ignore_list, timer_source_value )  ); 
	obs.obs_property_set_visible( seconds_prop, layout_value == 2 and timer_mode_value == 2 and timer_options_value == 2 and not in_table( ignore_list, timer_source_value )  ); 
	obs.obs_property_set_visible( split_startpause_prop, layout_value == 2 and timer_options_value == 2 and not in_table( ignore_list, timer_source_value ) ); 
	obs.obs_property_set_visible( start_button_prop, split_startpause and not in_table( ignore_list, timer_source_value ) );
	obs.obs_property_set_visible( pause_button_prop, not in_table( ignore_list, timer_source_value ) );
	obs.obs_property_set_visible( reset_button_prop, not in_table( ignore_list, timer_source_value ) );
	obs.obs_property_set_visible( timer_expire_event_prop, layout_value == 2 and timer_mode_value == 2 and timer_options_value == 2 and not in_table( ignore_list, timer_source_value ) );
	obs.obs_property_set_visible( countdown_type_prop, layout_value == 2 and timer_mode_value == 2 and timer_options_value == 2 and not in_table( ignore_list, timer_source_value ) );
	obs.obs_property_set_visible( start_recording_prop, enable_property_start_recording	and layout_value == 2 and timer_mode_value == 2 and timer_options_value == 2 and not in_table( ignore_list, timer_source_value ) );	
	obs.obs_property_set_visible( stop_text_prop, timer_expire_event_value == "TIMER END TEXT" and  timer_mode_value == 2 and timer_options_value == 2 and not in_table( ignore_list, timer_source_value ) );	
	obs.obs_property_set_visible( day_prop, countdown_type_value == 1 and layout_value == 2 and timer_mode_value == 2 and timer_options_value == 2 and not in_table( ignore_list, timer_source_value ) );
	obs.obs_property_set_visible( year_prop, countdown_type_value == 1 and layout_value == 2 and timer_mode_value == 2 and timer_options_value == 2 and not in_table( ignore_list, timer_source_value ) );
	obs.obs_property_set_visible( month_prop, countdown_type_value == 1 and layout_value == 2 and timer_mode_value == 2 and timer_options_value == 2 and not in_table( ignore_list, timer_source_value ) );
	obs.obs_property_set_visible( day_text_prop, countdown_type_value == 1 and layout_value == 2 and timer_mode_value == 2 and timer_format ~= 5 and timer_options_value == 2 and not in_table( ignore_list, timer_source_value ) );
	obs.obs_property_set_visible( days_text_prop, countdown_type_value == 1 and layout_value == 2 and timer_mode_value == 2 and timer_format ~= 5 and timer_options_value == 2 and not in_table( ignore_list, timer_source_value ) );
	obs.obs_property_set_visible( cycle_list_prop, ( (timer_expire_event_value == "Source List" or timer_expire_event_value == "Scene List" ) and timer_mode_value == 2 and layout_value == 2 and timer_options_value == 2 ) and not in_table( ignore_list, timer_source_value ) );
	obs.obs_property_set_visible( active_source_prop, ( (timer_expire_event_value == "Source List" or timer_expire_event_value == "Scene List" or timer_expire_event_value == "Auto List") and timer_mode_value == 2 and layout_value == 2 and timer_options_value == 2 ) and not in_table( ignore_list, timer_source_value ) );
	obs.obs_property_set_visible( as_visible_prop, ( (timer_expire_event_value == "Source List" or timer_expire_event_value == "Scene List" or timer_expire_event_value == "Auto List") and not in_table( ignore_list, active_source_value ) and timer_mode_value == 2 and layout_value == 2 and timer_options_value == 2 ) and not in_table( ignore_list, timer_source_value ) );
	obs.obs_property_set_visible( cycle_direction_prop, ( (timer_expire_event_value == "Source List" or timer_expire_event_value == "Scene List" or timer_expire_event_value == "Auto List") and timer_mode_value == 2 and layout_value == 2 and timer_options_value == 2 ) and not in_table( ignore_list, timer_source_value ) );
	obs.obs_property_set_visible( cycle_source_children_prop, ( (timer_expire_event_value == "Auto List") and timer_mode_value == 2 and layout_value == 2 and timer_options_value == 2 ) and not in_table( ignore_list, timer_source_value ) );
	--[[
	 
			WARNING & CAUTION INPUTS
			
			if layout is set to basic then hide
			if layout is set to advanced then check if trigger_options are expanded then show
	]]
	obs.obs_property_set_visible( to_prop, enable_property_trigger_options and ( layout_value == 2 and not in_table( ignore_list, timer_source_value ) ) );
	obs.obs_property_set_visible( enable_marker_notes_prop, ( layout_value == 2 and enable_property_trigger_options and trigger_options_value == 2 and ( editable_list_has_values( "text_arr_marker_a" ) or editable_list_has_values( "text_arr_marker_b" ) ) ));
	obs.obs_property_set_visible( text_marker_tip_prop, ( layout_value == 2 and enable_property_trigger_options and trigger_options_value == 2 ) );
	obs.obs_property_set_visible( text_arr_marker_a_prop, ( layout_value == 2 and enable_property_trigger_options and trigger_options_value == 2 ) );
	obs.obs_property_set_visible( text_arr_marker_b_prop, ( layout_value == 2 and enable_property_trigger_options and trigger_options_value == 2 ) );
	obs.obs_property_set_visible( audio_marker_a_prop, ( layout_value == 2 and enable_property_trigger_options and trigger_options_value == 2 and editable_list_has_values( "text_arr_marker_a" ) ) ); -- text_arr_marker_b  audio_marker_b_arr
	obs.obs_property_set_visible( audio_marker_b_prop, ( layout_value == 2 and enable_property_trigger_options and trigger_options_value == 2 and editable_list_has_values( "text_arr_marker_b" ) ) );
	obs.obs_property_set_visible( audio_marker_a_arr_prop, ( layout_value == 2 and enable_property_trigger_options and trigger_options_value == 2 and audio_marker_a_value == 'list' and editable_list_has_values( "text_arr_marker_a" ) ) );
	obs.obs_property_set_visible( audio_marker_b_arr_prop, ( layout_value == 2 and enable_property_trigger_options and trigger_options_value == 2 and audio_marker_b_value == 'list' and editable_list_has_values( "text_arr_marker_b" ) ) );
	obs.obs_property_set_visible( audio_marker_end_prop, ( in_table( {"TIMER END TEXT", "Select"}, timer_expire_event_value ) and layout_value == 2 and enable_property_trigger_options and trigger_options_value == 2) );
	obs.obs_property_set_visible( color_marker_a_prop, enable_property_color_marker_a and ( layout_value == 2 and enable_property_trigger_options and trigger_options_value == 2 and editable_list_has_values( "text_arr_marker_a" ) ) );
	obs.obs_property_set_visible( color_marker_b_prop, enable_property_color_marker_b and ( layout_value == 2 and enable_property_trigger_options and trigger_options_value == 2 and editable_list_has_values( "text_arr_marker_b" ) ) );
	obs.obs_property_set_visible( media_playback_limit_prop, ( layout_value == 2 and enable_property_trigger_options and trigger_options_value == 2 ) and ( editable_list_has_values( "text_arr_marker_a" ) or editable_list_has_values( "text_arr_marker_b" ) ) and not ( in_table( {'none'}, audio_marker_a_value ) and in_table( {'none'}, audio_marker_b_value ) )  );
	obs.obs_property_set_visible( duration_marker_a_prop, ( layout_value == 2 and enable_property_trigger_options and trigger_options_value == 2 and media_playback_limit_value == 2 ) and ( not in_table( {'none'}, audio_marker_a_value ) ) and editable_list_has_values( "text_arr_marker_a" ) );
	obs.obs_property_set_visible( duration_marker_b_prop, ( layout_value == 2 and enable_property_trigger_options and trigger_options_value == 2 and media_playback_limit_value == 2 ) and ( not in_table( {'none'}, audio_marker_b_value ) ) and editable_list_has_values( "text_arr_marker_b" ) );
	obs.obs_property_set_visible( a_note_prop, ( media["note_source_unversioned_id_marker_a"] == text_source_unversioned_id and layout_value == 2 and enable_marker_notes_value ~= 1 and enable_property_trigger_options and trigger_options_value == 2 and not in_table( ignore_list, note_source_marker_a_value ) and editable_list_has_values( "text_arr_marker_a" ) ) );
	obs.obs_property_set_visible( b_note_prop, ( media["note_source_unversioned_id_marker_b"] == text_source_unversioned_id and layout_value == 2 and enable_marker_notes_value ~= 1 and enable_property_trigger_options and trigger_options_value == 2 and not in_table( ignore_list, note_source_marker_b_value ) and editable_list_has_values( "text_arr_marker_b" ) ) );
	obs.obs_property_set_visible( a_source_prop, ( layout_value == 2 and enable_marker_notes_value ~= 1 and enable_property_trigger_options and trigger_options_value == 2 and editable_list_has_values( "text_arr_marker_a" ) ) );
	obs.obs_property_set_visible( b_source_prop, ( layout_value == 2 and enable_marker_notes_value ~= 1 and enable_property_trigger_options and trigger_options_value == 2 and editable_list_has_values( "text_arr_marker_b" ) ) );
	obs.obs_property_set_visible( reset_text_marker_a_prop, ( layout_value == 2 and enable_property_trigger_options and trigger_options_value == 2 and editable_list_has_values( "text_arr_marker_a" ) ) );
	obs.obs_property_set_visible( reset_text_marker_b_prop, ( layout_value == 2 and enable_property_trigger_options and trigger_options_value == 2 and editable_list_has_values( "text_arr_marker_b" ) ) );
	obs.obs_property_set_visible( hide_note_marker_a_prop, ( layout_value == 2 and enable_property_trigger_options and trigger_options_value == 2 and enable_marker_notes_value ~= 1 and not in_table( ignore_list, note_source_marker_a_value ) and editable_list_has_values( "text_arr_marker_a" ) ) );
	obs.obs_property_set_visible( hide_note_marker_b_prop, ( layout_value == 2 and enable_property_trigger_options and trigger_options_value == 2 and enable_marker_notes_value ~= 1 and not in_table( ignore_list, note_source_marker_b_value ) and editable_list_has_values( "text_arr_marker_b" ) ) );
	obs.obs_property_set_visible( duration_marker_end_prop, ( in_table( {"TIMER END TEXT", "Select"}, timer_expire_event_value ) and layout_value == 2 and enable_property_trigger_options and trigger_options_value == 2 and media_playback_limit_value == 2 ) );
	--[[
	
			BACKUP SETTINGS INPUTS
	
	]]
	obs.obs_property_set_visible( debug_enabled_prop, enable_property_debug and ( layout_value == 2 ) and timer_options_value == 2 );
	obs.obs_property_set_visible( backup_mode_prop, enable_property_backup and ( layout_value == 2 ) and not in_table( ignore_list, timer_source_value ) and timer_options_value == 2 );
	obs.obs_property_set_visible( backup_split_time_prop, enable_property_backup and ( layout_value == 2 ) and backup_mode_value and not in_table( ignore_list, timer_source_value ) and timer_options_value == 2 );
	obs.obs_property_set_visible( import_list_prop, enable_property_backup and backup_mode_value and backup_folder ~= "" and backup_folder ~= nil and layout_value == 2 and not in_table( ignore_list, timer_source_value ) and timer_options_value == 2 );
	obs.obs_property_set_visible( export_button_prop, enable_property_backup and backup_mode_value and backup_folder ~= "" and backup_folder ~= nil  and layout_value == 2 and not in_table( ignore_list, timer_source_value ) );
	obs.obs_property_set_visible( import_button_prop, enable_property_backup and backup_mode_value and layout_value == 2 and not in_table( ignore_list, timer_source_value ) and timer_options_value == 2 );
	obs.obs_property_set_visible( export_folder_prop, enable_property_backup and backup_mode_value and layout_value == 2 and not in_table( ignore_list, timer_source_value ) and timer_options_value == 2 );
	obs.obs_property_set_visible( import_button_prop, import_list_value ~= "select" and import_list_value ~= "none" and import_list_value ~= "" and layout_value == 2 and not in_table( ignore_list, timer_source_value ) and timer_options_value == 2 );
	--[[
	
			OTHER INPUTS
	
	]]		
	obs.obs_property_set_visible( disable_script_prop, layout_value == 2 );
	obs.obs_property_set_visible( enable_direction_toggle_prop, layout_value == 2 and timer_options_value == 2 and ( timer_mode_value == 2 and countdown_type_value == 2 or timer_mode_value == 1 ) and not in_table( ignore_list, timer_source_value ) ); 
	obs.obs_property_set_visible( prevent_negative_time_prop, enable_direction_toggle and layout_value == 2 and ( timer_mode_value == 2 and countdown_type_value == 2 or timer_mode_value == 1 ) and not in_table( ignore_list, timer_source_value ) and timer_options_value == 2 );
	
	obs.obs_property_set_visible( _group_4_prop, select_features and timer_options_value == 2 and layout_value == 2 );
	obs.obs_property_set_visible( select_features_prop, layout_value == 2 and timer_options_value == 2 );
	--[[
		
		Try to prevent reference conflicts
	
	]]	
	if ( in_table( {timer_source_value, split_source_value, active_source_value, note_source_marker_b_value}, note_source_marker_a_value ) ) then
		obs.obs_data_set_string( settings, "note_source_marker_a", "select" ); -- Don"t allow timer and marker_a note text source to be the same
	end 
	if ( in_table( {timer_source_value, split_source_value, active_source_value, note_source_marker_a_value}, note_source_marker_b_value ) ) then
		obs.obs_data_set_string( settings, "note_source_marker_b", "select" ); -- Don"t allow timer and marker_b note text source to be the same
	end 	
	if ( in_table( {timer_source_value, split_source_value, note_source_marker_a_value, note_source_marker_b_value}, active_source_value ) ) then
		obs.obs_data_set_string( settings, "active_source", "select" ); -- Don"t allow timer and active text source to be the same
	end
	if countdown_type_value == 1 and month_value ~= 1 and day_value == 0 then
		obs.obs_data_set_int( settings, "day", 1 ); -- set to at least 1, else the timer won"t know it is at zero
	end	
	
	--[[
		
		Some Calandar Stuff
	
	]]	

	local adjsut_limit = (timer_mode == 2 and countdown_type ~= 1 or timer_mode ~= 2 )

	if( hour_format ~= nil and adjsut_limit) then
		obs.obs_property_int_set_limits( hours_prop, 0, ( hour_format - 1 ), 1 );	
		obs.obs_property_int_set_limits( sw_hours_saved_prop, 0, ( hour_format - 1 ), 1 );
	else
		if(timer_hours > 23) then timer_hours = 23;	end
		obs.obs_property_int_set_limits( hours_prop, 0, 23, 1 );	
		obs.obs_property_int_set_limits( sw_hours_saved_prop, 0, 23, 1 );	
	end
	if( minute_format ~= nil and adjsut_limit) then
		obs.obs_property_int_set_limits( minutes_prop, 0, ( minute_format - 1 ), 1 );	
		obs.obs_property_int_set_limits( sw_minutes_saved_prop, 0, ( minute_format - 1 ), 1 );	
	else
		if(timer_minutes > 59) then timer_minutes = 59;	end
		obs.obs_property_int_set_limits( minutes_prop, 0, 59, 1 );	
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
	--[[
		
		Defind same label titles
	
	]]	
	if show_mili then
		obs.obs_property_set_description( mili_button_prop, "Hide Milliseconds" );
	else
		obs.obs_property_set_description( mili_button_prop, "Show Milliseconds" );
	end;
	--[[
		
		User defined a value for the millisecond trigger?
		If value defined, then hide millisecond button.
		If value not defined, then show millisecond button.
	
	]]	
	--[[
		
		Timer type is Count Down?
		Set button labels
	
	]]
	if timer_mode_value == 2 then
		obs.obs_property_set_description( reset_button_prop, "Reset Count Down Timer" );
	else
		--[[
			Timer type is Count Up?
			Set button labels
		]]
		obs.obs_property_set_description( reset_button_prop, "Reset Count Up Timer" );	
	end;
	--[[
		Set button labels
	]]
	if timer_mode_value == 2 then
			obs.obs_property_set_description( direction_button_prop, "Count Up" );
		if timer_active then
			if split_startpause then
				obs.obs_property_set_description( start_button_prop, "Start Count Down Timer" );
				obs.obs_property_set_description( pause_button_prop, "Pause Count Down Timer" );
			else
				obs.obs_property_set_description( pause_button_prop, "Start/Pause Count Down Timer" );
			end
		else
			
			if split_startpause then
				obs.obs_property_set_description( start_button_prop, "Start Count Down Timer" );
				obs.obs_property_set_description( pause_button_prop, "Pause Count Down Timer" );
			else
				obs.obs_property_set_description( pause_button_prop, "Start Count Down Timer" );
			end
			
		end;
	else
			obs.obs_property_set_description( direction_button_prop, "Toggle: Count Down" );
		if timer_active then
			if split_startpause then
				obs.obs_property_set_description( start_button_prop, "Start Count Up Timer" );
				obs.obs_property_set_description( pause_button_prop, "Pause Count Up Timer" );
			else
				obs.obs_property_set_description( pause_button_prop, "Start/Pause Count Up Timer" );
			end
		else
			if split_startpause then
				obs.obs_property_set_description( start_button_prop, "Start Count Up Timer" );
				obs.obs_property_set_description( pause_button_prop, "Pause Count Up Timer" );
			else
				obs.obs_property_set_description( pause_button_prop, "Start Count Up Timer" );
			end
		end;
	end;
	--[[
		Rebuild timer activation source lists
	]]	
	obs.obs_property_list_clear( timer_activation_source_prop );
	obs.obs_property_list_add_string( timer_activation_source_prop, "Select", "select" );
	--[[
		Returns an array of reference-incremented sources. 
		Release with source_list_release().
	]]	
	local all_sources = get_source_list( "*" );

	if enable_property_timer_activation and timer_activation == 4 then -- Build a Scene List
		local scenes = obs.obs_frontend_get_scene_names();
		if scenes ~= nil then	
			for i, scene in ipairs( scenes ) do
				obs.obs_property_list_add_string( timer_activation_source_prop, scene, scene ); -- Add options to the list
			end;
			obs.bfree( scene ); -- free memory, release source as it is no longer needed
		end;
	elseif enable_property_timer_activation and timer_activation == 5 then -- Build a Source List
		list = {} -- Reset / clear a defined table variable to be used to build lists that will be passed to the property list
		if tableHasValue( all_sources ) then
			for _, sub in ipairs( all_sources ) do
				local source_id = sub["unversioned_id"];	
				local source_nested = sub["nested"];
				local name = sub["source_name"]	
				if not in_table( { "group", "scene", "ffmpeg_source" }, source_id ) then -- identify text type sources only
					--[[
						add it to list so that it can be reordered
					]]		
					list[name] = name;
				end;
				if source_id == "scene" and source_nested then -- identify text type sources only
					list[name] = name .. " [Scene]";
				end;
				if source_id == "group" and source_nested then -- identify text type sources only
					list[name] = name .. " [Group]";
				end;
			end;
			obs.bfree(sub); -- free memory, release source as it is no longer needed
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
				obs.obs_property_list_add_string( timer_activation_source_prop, value, key );
			end
		end			
	elseif enable_property_timer_activation and timer_activation == 6 then -- Build a Media List
		list = {} -- Reset / clear a defined table variable to be used to build lists that will be passed to the property list
		if tableHasValue( all_sources ) then
			for _, sub in ipairs( all_sources ) do
				local source_id = sub["unversioned_id"];	
				local source_nested = sub["nested"];
				local name = sub["source_name"]	
				if in_table( { "ffmpeg_source" }, source_id ) then -- identify text type sources only
					--[[
						add it to list so that it can be reordered
					]]		
					list[name] = name;
				end;
			end;
			obs.bfree(sub); -- free memory, release source as it is no longer needed
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
				obs.obs_property_list_add_string( timer_activation_source_prop, value, key );
			end
		end	
	else
		obs.obs_data_set_string( settings, "timer_activation_source", "select" ); -- Don"t allow timer and active text source to be the same
	end
	
	if not enable_property_timer_activation then
		obs.obs_data_set_string( settings, "timer_activation_source", "select" ); -- Don"t allow timer and active text source to be the same
		obs.obs_data_set_int( settings, "timer_activation", 1 ); -- Don"t allow timer and active text source to be the same
		obs.obs_data_set_int( settings, "timer_reset", 1 ); -- Don"t allow timer and active text source to be the same
	end	
	
	--[[
		Rebuild text source lists
	]]
	if tableHasKey( selected_source_list, property_name ) then 	
			for i,v in pairs( {timer_source_prop, split_source_prop, active_source_prop, sub_limit_note_source_prop, note_source_marker_a_prop, note_source_marker_b_prop, add_limit_note_source_prop} ) do 
				local reference = obs.obs_property_name( v ) 
				obs.obs_property_list_clear( v );
				obs.obs_property_list_add_string( v, "Select", "select" );
				list = {} -- Reset / clear a defined table variable to be used to build lists that will be passed to the property list
				if tableHasValue( all_sources ) then
					for _, sub in ipairs( all_sources ) do
						local source_id = sub["unversioned_id"];	
						local source_nested = sub["nested"];
						local name = sub["source_name"]	
						if source_id == text_source_unversioned_id or source_id == "text_ft2_source" then -- identify text type sources only
							if not source_selected( name, reference ) then
								--[[
									add it to list so that it can be reordered
								]]		
								list[name] = name;
							else
								--continue 
							end;
						end;
						if in_table( {"note_source_marker_a", "note_source_marker_b"}, reference ) and in_table( { "group", "scene" }, source_id ) and source_nested then -- identify text type sources only
							list[name] = name .. " [Group]";
						end;
					end;
					obs.bfree(sub); -- free memory, release source as it is no longer needed
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
						obs.obs_property_list_add_string( v, value, key );
					end
				end			
			end
	end	
	--[[
		Other fancy stuff
	]]

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
	--[[
		Rebuild backup file list
	]]	
	local filenames = get_filenames( backup_folder, ".json" );
	local has_file_list = ( table.getn( filenames ) > 0 );
	if obs.os_file_exists( backup_folder ) then	
		obs.obs_property_list_clear( import_list_prop );
		obs.obs_property_list_add_string( import_list_prop, "No Files Found", "none" );
		if has_file_list then
		obs.obs_property_list_clear( import_list_prop );
		obs.obs_property_list_add_string( import_list_prop, "Auto Import   [ select file ]", "select" );
			for i,v in pairs( filenames ) do 
				obs.obs_property_list_add_string( import_list_prop, v, v );
			end;	
		end;
	end;
	--[[
		If the timer source value changed, check things
	]]
	if property_name == "timer_source" and in_table( ignore_list, timer_source_value ) then
		obs.obs_data_set_int( settings, "trigger_options", 1 ); 
		if enable_property_timer_manipulation then obs.obs_data_set_int( settings, "timer_manipulation", ( ( timer_manipulation == 2 ) and 1 or 3 )  ); end	
	end
	if timer_expire_event_value == "invalid" then
		obs.obs_data_set_string( settings, "timer_expire_event", "select" );
	end
	
  -- IMPORTANT: returns true to trigger refresh of the properties
  return true;
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
local function timer_expire_event_cycle_source_list( source_type )
	if disable_script then return; end;
    debug_log( 'timer_expire_event_cycle_source_list(' .. pre_dump(source_type) .. ') -- function variable names:  source_type ' )
	local hasMultipleItems = false
    local source_list
	--[[
		The folowing section will only update cycle_index
		this is used to determine what the next item must be
	]]			
	if timer_mode == 2 and source_type == "source" then
		source_list = get_cycle_source_list( source_type );
        if source_list ~= nil and tableHasValue( source_list ) then 
			cycle_index, source_list = cycle_source_list_by_source_type( source_list, source_type, cycle_index );
		end	
	end	
	--[[
		The folowing section will only update cycle_index
		this is used to determine what the next item must be
	]]	
	if timer_mode == 2 and source_type == "scene" then
		source_list = get_cycle_source_list( source_type );
		if source_list ~= nil and tableHasValue( source_list ) then 
			cycle_index, source_list = cycle_source_list_by_source_type( source_list, source_type, cycle_index );
		end	
	end		
    
	--[[
		The folowing section will only update cycle_index
		this is used to determine what the next item must be
	]]
	if timer_mode == 2 and source_type == "auto" and not in_table( ignore_list, cycle_source_children ) then
		local source_name = cycle_source_children
		source_list = list_source_children_by_source_name( source_name )
		if source_list ~= nil and tableHasValue( source_list ) and not in_table( ignore_list, source_name ) then 
            set_visible( cycle_source_children, true ); 	
			cycle_index, source_list = cycle_source_list_by_source_name( source_list, cycle_index );
		end	
	end
    
    hasMultipleItems = (tablelength( source_list ) > 1 )
	--[[
		Set timer_active for it to self-start
	]]	
	--timer_active = false
	if hasMultipleItems then 
        timer_event_active = true
		reset( true ); -- Reset the timer
		timer_event_active = false
        startpause( true, true ); 
    end -- Restart the timer
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
function timer_end_media_end_callback( )
	if disable_script then return; end;
    debug_log( 'timer_end_media_end_callback() -- function variable names:  ' )
	set_visible( media['source_name_audio_marker_end'], false );
	timer_remove( timer_end_media_end_callback );
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	Only used in Count Down mode
	
	Credit:			
	Modified:		
	function:		
	type:			
	input type: 	
	returns:
----------------------------------------------------------------------------------------------------------------------------------------
]] 
function timer_ended( source_name )
	if disable_script then return; end;
    debug_log( 'timer_ended(' .. pre_dump(source_name) .. ') -- function variable names:  source_name ' )
	
	if source_name == nil or in_table( ignore_list, source_name ) then
		return
	end	
	--[[
		stop the timer
	]]
	activate( false ); -- This will remove the callback.
	--[[
		If user wants recording to start when timer ended, now is a good timer to initiate recording
		NOTE: Recording will only be started, if it is not already recording
	]]	
	record( 2, 100 );
	--[[
		Force media playback to end, if the media is looping
	]]		
	stop_looping_media( "marker_a" );
	stop_looping_media( "marker_b" );
	
	--[[
		Timer expired and a scene change is requested.
	]]	
	if timer_mode == 2 and not in_table( {"TIMER END TEXT", "Source List", "Scene List", "Auto List", "Select"}, timer_expire_event ) then
		
		
		--[[
			The timer expired and the timer will not restart.
		]]	
		set_visible( timer_source, false ); -- last thing, set visibility of timer to hide because we are changing to another scene
		--[[
			Increments the source reference counter, 
			use obs_source_release() to release it when complete.
		]]
		
		local source = obs.obs_get_source_by_name( timer_expire_event );
		
		if source ~= nil then
			obs.obs_frontend_remove_event_callback( on_event )
			obs.obs_frontend_set_current_scene( source )
			obs.obs_frontend_add_event_callback( on_event )	
			obs.obs_source_release( source );
			--[[
				timer_mode: countdown only
				timer_active: timer not running
				define > set_to_default: (true) * Timer time expired and the timer time needs to be set to the default state, so we do want to set the settings to default.
				define > new_settings: not required here because we will use the global (ctx.propsSet)
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
			update_timer_settings( true ); -- optional inputs: set_to_default(bool), new_settings(obs_property_data/obs_userdata) 
		end
		--[[
			The timer expired and the timer will not restart.
		]]
		timer_expired = true;
		timer_active = false;
	end

	if timer_mode == 2 and in_table( { "Scene List", "Source List", "Auto List" }, timer_expire_event ) then
       
        -- assign source_type here
        local source_type

        if timer_expire_event == "Scene List" then
            source_type = "scene"
        elseif timer_expire_event == "Source List" then
            source_type = "source"
        elseif timer_expire_event == "Auto List" then
            source_type = "auto"
        else
            -- Handle unexpected case, if needed
            source_type = "unknown"
        end

		timer_expire_event_cycle_source_list( source_type );
	end	
	
	if timer_mode == 2 and timer_expire_event == "TIMER END TEXT" then
		local text = stop_text;
		set_text( source_name, text );
	end
	
		--[[
			for now, only limit the timer end media playback
			for these settings:
		]]	
		if timer_mode == 2 and in_table( {"TIMER END TEXT", "Select"}, timer_expire_event ) then
			--[[
		
				if a Media source has not been defined, then ignore
			]]
			if not in_table( ignore_list, media["source_name_audio_marker_end"] ) then
				set_visible( media["source_name_audio_marker_end"], true ); -- play the media
				disconnect_after_media_end( "marker_end" ); -- attach a signal handler to set source hidden when media playback ends
				--[[
					If the user wants the media to stop after defined duration
					we need to add this timer callback
				]]
				if media["duration_marker_end"] ~= 0 and media_playback_limit ~= 1 then
					timer_remove( timer_end_media_end_callback ); -- Remove any existing callbacks if they exist before assigning a new callback
					timer_add( timer_end_media_end_callback, math.floor( media["duration_marker_end"] * 1000 ) ); --<- milliseconds
				end;
			end;
		end;
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
    debug_log( 'script_properties() -- function variable names: ' )
	
	props = obs.obs_properties_create(); -- save original object	
	ctx.propsDef = props; -- this becomes a data object	
 	--[[
		Option list: User select type of timer required.
		 
		This property is referenced to trigger an onchange event listener.
	]]	 	
	local p_1 = obs.obs_properties_add_list( ctx.propsDef, "timer_mode", "<b>Timer Mode</b>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT );
  	t_type = {"Count Up", "Count Down"}; -- Add options to the list
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_1, v, i ) end -- This list is auto indexed thus have an interger reference containing a string value
 	--[[
		Option list: User select to access Basic or Advanced Features.
		This provides UI layout options to enhance the user experience.
		Changing this setting does not impact any function or result. 
		 
		This property is referenced to trigger an onchange event listener.
	]]
	local p_2 = obs.obs_properties_add_list( ctx.propsDef, "layout", "<font color=".. font_highlight ..">Layout</font>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT );
  	t_type = {"Basic", "Advanced"}; -- Adds options to the list
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_2, v, i ) end -- This list is auto indexed thus have an interger reference containing a string value
 	--[[
		Option list: User select to access show or hide available features.
		This provides UI layout options to enhance the user experience.
		Changing this setting does not impact any function or result. 
		 
		This property is referenced to trigger an onchange event listener.
	]]	
	local p_3 = obs.obs_properties_add_list( ctx.propsDef, "timer_options", "<font color=".. font_highlight .."><b>Timer Settings</b></font>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT );
	 t_type = {"Hidden", "Expanded"}; -- Add options to the list
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_3, v, i ) end -- This list is auto indexed thus have an interger reference containing a string value
	obs.obs_property_set_long_description( p_3, "\nExpand or hide additional timer options.\n" ); -- User Tip
	--[[
		Returns an array of reference-incremented sources. 
		Release with source_list_release().
	]]	
	local sources = obs.obs_enum_sources();
	
	--[[
		Returns table with all sources, including nested scenes. 
	]]	
	local all_sources = get_source_list( "*" );
 	--[[
		Option list: User select <text-source> to be used as visual feedback indicating a time stamp.
		This provides function options that will impact on visual feedback to the user.
		Changing this setting will impact on the function or end result. 
	]]		
	local p_4 = obs.obs_properties_add_list( ctx.propsDef, "timer_source", "<i>Timer Source</i>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING );
	obs.obs_property_list_add_string( p_4, "Select", "select" ); -- Adds a default option to the list. First (top-most) list item. If selected the option is ignored. 
	local list = {}; -- Define a table variable to be used to build lists that will be passed to the property list
	if sources ~= nil then
		for _, source in ipairs( sources ) do -- ipairs cycles auto incrimented items
			source_id = obs.obs_source_get_unversioned_id( source ); -- unversioned_id will not be affected by language settings
			if source_id == text_source_unversioned_id then -- identify text type sources only
				local name = obs.obs_source_get_name( source ); -- Get the source name, this will be a unique identifier
				--[[
					boolean check, is the source (name) already selected for another item? 
					This will help to limit conflicts to prevent using a single source for two sperate functions
				]]
				local reference = "timer_source";
				if not source_selected( name, reference ) then -- boolean check
					--[[
						add it to the (temp) table (list)
					]]		
					list[name] = name;
				else
					-- continue to skip potential conflicts
				end
			end
		end
			obs.bfree(source); -- free memory, release source as it is no longer needed
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
			obs.obs_property_list_add_string( p_4, value, value ); -- add the item to the property list using a string reference with a string value
		end
	end
	 --[[
		Option list: User select a reference to be used as control to switch the timer between countup and countdown.
		This provides function options that will impact operation and behaviour.
		Changing this setting will impact on the function or end result. 
		 
		This property is referenced to trigger an onchange event listener.
	]]	
	local p_5 = obs.obs_properties_add_list( ctx.propsDef, "countdown_type", "<font color=".. font_dimmed ..">Count Down Type</font>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT );
  	t_type = {"Specific Date & Time", "Hours, Minutes, Seconds"}; -- Add options to the list
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_5, v, i ) end; -- This list is auto indexed thus have an interger reference containing a string value
	--[[
		 Text Field
	]]	
	local p_6 = obs.obs_properties_add_text( ctx.propsDef, "day_text", "<font color=".. font_dimmed ..">Day Text Format</font>", obs.OBS_TEXT_DEFAULT );
	obs.obs_property_set_long_description( p_6, "\nUsed to distinguish between singular and plural days format. Use this for singular.\n" ); -- User Tip
	--[[
		 Text Field
	]]	
	local p_7 = obs.obs_properties_add_text( ctx.propsDef, "days_text", "<font color=".. font_dimmed ..">Days Text Format</font>", obs.OBS_TEXT_DEFAULT );
	obs.obs_property_set_long_description( p_7, "\nUsed to distinguish between singular and plural days format. Use this for plural.\n" ); -- User Tip
  	 	--[[
		Option list: User select month reference to be used as control to set a timer for a future date.
		This provides function options that will impact on function and operation of the timer.
		Changing this setting will impact on the function or end result. 
		 
		This property is referenced to trigger an onchange event listener.
	]]	
	local p_8 = obs.obs_properties_add_list( ctx.propsDef, "month", "<font color=".. font_dimmed ..">Month</font>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT );
  	t_type = {"Select", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"}; -- Add options to the list
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_8, v, i ) end; -- This list is auto indexed thus have an interger reference containing a string value
	--[[
		 Inerger Field
		 
		This property is referenced to trigger an onchange event listener.
	]]	
	local p_9 = obs.obs_properties_add_int( ctx.propsDef, "year", "<font color=".. font_dimmed ..">Year</font>", 2022, 212021221, 1 );
 	--[[
		 Inerger Field
	]]	 	
	local p_10 = obs.obs_properties_add_int( ctx.propsDef, "day", "<font color=".. font_dimmed ..">Day</font>", 1, 31, 1 );
	--[[
		 Inerger Field
	]]		
	local p_11 = obs.obs_properties_add_int( ctx.propsDef, "hours", "<font color=".. font_dimmed ..">Hours</font>", 0, 23, 1 );
	obs.obs_property_int_set_suffix( p_11, " Hours" );
	--[[
		 Inerger Field
	]]		
	local p_12 = obs.obs_properties_add_int( ctx.propsDef, "minutes", "<font color=".. font_dimmed ..">Minutes</font>", 0, 59, 1 );
	obs.obs_property_int_set_suffix( p_12, " Minutes" );
	--[[
		 Inerger Field
	]]		
	local p_13 = obs.obs_properties_add_int( ctx.propsDef, "seconds", "<font color=".. font_dimmed ..">Seconds</font>", 0, 59, 1 );
	obs.obs_property_int_set_suffix( p_13, " Seconds" );
  	 	--[[
		Option list: User select a reference to be used as control format the timer timestamp.
		This provides function options that will impact on visual feedback and does not impact any function and operation of the timer.
		Changing this setting will impact on visual feedback and not function. 
		 
		This property is referenced to trigger an onchange event listener.
	]]		
	local p_14 = obs.obs_properties_add_list( ctx.propsDef, "timer_format", "Timer Format", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT );
	t_type = {"Display full format", "No leading zeros", "No leading zeros, no split seconds", "No split seconds", "Custom Time Format"}; -- Add options to the list
	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_14, v, i ) end; -- This list is auto indexed thus have an interger reference containing a string value
	--[[
		 Text Field
		 
		This property is referenced to trigger an onchange event listener.
	]]	
	local p_15 = obs.obs_properties_add_text( ctx.propsDef, "custom_time_format", "<font color=".. font_dimmed ..">Time Format</font>", obs.OBS_TEXT_DEFAULT );
	obs.obs_property_set_long_description( p_15, "\n Timestamp is represented by $D = day, $H = hour, $M = minute, $S = second, $F = split second. \n\n Add 'M' and number enclosed in '{}' to adjust minute format: {M90} will display 90 minutes units.\n\n To trim leading zeros, include $T = truncate leading zeros. This will ONLY affect a format matching '$D:$H:$M:$S,$F' (00:00:00:00,00)\n" ); -- User Tip
	
	
	
	
	
	--[[
		Option list: User select to show or hide available features.
		This provides UI layout options to enhance the user experience.
		Changing this setting does not impact any function or result. 
		 
		This property is referenced to trigger an onchange event listener.
	]]	
	local p_65 = obs.obs_properties_add_list( ctx.propsDef, "timer_activation", "<font color=".. font_dimmed ..">Timer Activation</font>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT );
	 t_type = {"Manually", "Timer Source Visible", "Timer Scene Active", "Specific Scene Active", "Specific Source Active", "Specific Media Active", "Recording Started", "Streaming Started"}; -- Add options to the list
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_65, v, i ) end; -- This list is auto indexed thus have an interger reference containing a string value
	obs.obs_property_set_long_description( p_65, "\nConfigure how the timer is activated.\n" ); -- User Tip
	
	--[[
		Option list: User select <option> to be used.
	]]
	local p_65_a = obs.obs_properties_add_list( ctx.propsDef, "timer_activation_source", "<i>Activation Source</i>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING );
	obs.obs_property_list_add_string( p_65_a, "Select", "select" );  -- Adds a default option to the list. First (top-most) list item. If selected the option is ignored. 
	obs.obs_property_set_long_description( p_65_b, "\nSelect a trigger source that activates the timer upon its visibility or display.\n" ); -- User Tip
	
	--[[
		Option list: User select to show or hide available features.
		This provides UI layout options to enhance the user experience.
		Changing this setting does not impact any function or result. 
		 
		This property is referenced to trigger an onchange event listener.
	]]	
	local p_65_b = obs.obs_properties_add_list( ctx.propsDef, "timer_reset", "<font color=".. font_dimmed ..">Timer Reset</font>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT );
	 t_type = {"Manual", "Auto"}; -- Add options to the list
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_65_b, v, i ) end; -- This list is auto indexed thus have an interger reference containing a string value
	obs.obs_property_set_long_description( p_65_b, "\nChoose how the timer resets: manually by you, or automatically based on specific actions.\n" ); -- User Tip
	
	--[[
		 Text Field
		 
		This property is referenced to trigger an onchange event listener.
	]]	
	local p_16 = obs.obs_properties_add_text( ctx.propsDef, "toggle_mili_trigger", "<font color=".. font_dimmed ..">Toggle Milliseconds</font>", obs.OBS_TEXT_DEFAULT );
	obs.obs_property_set_long_description( p_16, "\nUse format 00:00:00 ( hours:minutes:seconds ) \nSetting to determine when to show Milliseconds\n" ); -- User Tip
 	--[[
		Option list: User select <text-source> to be used as visual feedback indicating a snip of the time stamp.
		This provides function options that will impact on visual feedback to the user.
		Changing this setting will not impact on the function or end result. 
	]]
	local p_18 = obs.obs_properties_add_list( ctx.propsDef, "split_source", "<i>Split Source</i>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING );
	obs.obs_property_list_add_string( p_18, "Select", "select" );  -- Adds a default option to the list. First (top-most) list item. If selected the option is ignored. 
	list = {} -- Reset / clear a defined table variable to be used to build lists that will be passed to the property list
	if sources ~= nil then
		for _, source in ipairs( sources ) do
			source_id = obs.obs_source_get_unversioned_id( source ); -- unversioned_id will not be affected by language settings
			if source_id == text_source_unversioned_id then -- identify text type sources only
				local name = obs.obs_source_get_name( source );
				local reference = "split_source";
				if not source_selected( name, reference ) then
					--[[
						add it to list so that it can be reordered
					]]		
					list[name] = name;
				else
					--continue 
				end
			end
		end
			obs.bfree(source); -- free memory, release source as it is no longer needed
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
			obs.obs_property_list_add_string( p_18, value, value );
		end
	end	
  	
	local p_19 = obs.obs_properties_add_list( ctx.propsDef, "split_type", "Split Type", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT );
  	t_type = {"Interval", "Mark", "Mark Interval", "Interval Mark"}; -- Add options to the list
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_19, v, i ) end; -- This list is auto indexed thus have an interger reference containing a string value
	obs.obs_property_set_long_description( p_19, "\nInterval = Time between current and previous split.\n\nMark = Time of split\n" ); -- User Tip
	--[[
		Option list: User select to show or hide available features.
		This provides UI layout options to enhance the user experience.
		Changing this setting does not impact any function or result. 
		 
		This property is referenced to trigger an onchange event listener.
	]]	
	local p_20 = obs.obs_properties_add_list( ctx.propsDef, "trigger_options", "<font color=".. font_highlight .."><b>Marker Settings</b></font>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT );
	 t_type = {"Hidden", "Expanded"}; -- Add options to the list
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_20, v, i ) end; -- This list is auto indexed thus have an interger reference containing a string value
	obs.obs_property_set_long_description( p_20, "\nExpand or hide additional options triggered by time stamps.\n" ); -- User Tip
	
    local p_21_n = obs.obs_properties_add_text( ctx.propsDef, "text_marker_tip", "<font color=".. font_dimmed ..">Tip</font>", obs.OBS_TEXT_DEFAULT );
	obs.obs_property_set_long_description( p_21_n, "\nUse format 00:00:00 ( hours:minutes:seconds )\n" ); -- User Tip
    obs.obs_property_set_enabled( p_21_n, false );
    --[[
		Editable Option list: User adds a text time stamp that will trigger time Marker functions.
		This provides function options to change feature behaviour.
		Changing this setting will impact on feature behaviour. 
	]]	
	local p_21 = obs.obs_properties_add_editable_list( ctx.propsDef, "text_arr_marker_a", "Marker A Time", obs.OBS_EDITABLE_LIST_TYPE_STRINGS, nil, nil );
	obs.obs_property_set_long_description( p_21, "\nExpand or hide additional options triggered by time stamps.\n" ); -- User Tip
    obs.obs_property_set_long_description( p_21, "\nUse format 00:00:00 ( hours:minutes:seconds )\n" ); -- User Tip

    --[[
		Editable Option list: User adds a text time stamp that will trigger time Marker functions.
		This provides function options to change feature behaviour.
		Changing this setting will impact on feature behaviour. 
	]]	
	local p_22 = obs.obs_properties_add_editable_list( ctx.propsDef, "text_arr_marker_b", "Marker B Time", obs.OBS_EDITABLE_LIST_TYPE_STRINGS, nil, nil );
	--*props, *name, *description, min, max, step
	obs.obs_properties_add_int_slider( ctx.propsDef, "reset_text_marker_a", "Reset Marker A Text", 0, 10800, 1 );
	obs.obs_properties_add_int_slider( ctx.propsDef, "reset_text_marker_b", "Reset Marker B Text", 0, 10800, 1 );
  	 --[[
		Option list: User select <media-source> to be used as audio visual at a defined time.
		This provides function options that will impact on audio visual feedback to the user.
		Changing this setting will impact on a function or end result. 
	]]	
	local p_23 = obs.obs_properties_add_list( ctx.propsDef, "audio_marker_a", "<font color=".. font_dimmed ..">Marker A Audio</font>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING );
	obs.obs_property_set_long_description( p_23, "\nSelect available media source to activate on defined time stamp.\n" ); -- User Tip
	obs.obs_property_list_add_string( p_23, "None", "none" ); -- Add options to the list
	obs.obs_property_list_add_string( p_23, "Allow Multiple Selections", "list" ); -- Add options to the list
	if sources ~= nil then
		for _, source in ipairs( sources ) do
			source_id = obs.obs_source_get_unversioned_id( source ); -- unversioned_id will not be affected by language settings
			if source_id == "ffmpeg_source" then -- identify media type sources only
				local name = obs.obs_source_get_name( source );
				obs.obs_property_list_add_string( p_23, name, name );
			end
		end
			obs.bfree(source); -- free memory, release source as it is no longer needed
	end	
	--[[
	]]	
	
	local p_23a = obs.obs_properties_add_editable_list( ctx.propsDef, "audio_marker_a_arr", "Marker A Audio List", obs.OBS_EDITABLE_LIST_TYPE_STRINGS, nil, nil );
  	 --[[
		Option list: User select <media-source> to be used as audio visual at a defined time.
		This provides function options that will impact on audio visual feedback to the user.
		Changing this setting will impact on a function or end result. 
	]]	
	local p_24 = obs.obs_properties_add_list( ctx.propsDef, "audio_marker_b", "<font color=".. font_dimmed ..">Marker B Audio</font>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING );
	obs.obs_property_set_long_description( p_24, "\nSelect available media source to activate on defined time stamp.\n" ); -- User Tip
	obs.obs_property_list_add_string( p_24, "None", "none" ); -- Add options to the list
	obs.obs_property_list_add_string( p_24, "Allow Multiple Selections", "list" ); -- Add options to the list
	if sources ~= nil then
		for _, source in ipairs( sources ) do
			source_id = obs.obs_source_get_unversioned_id( source ); -- unversioned_id will not be affected by language settings
			if source_id == "ffmpeg_source" then -- identify media type sources only
				local name = obs.obs_source_get_name( source );
				obs.obs_property_list_add_string( p_24, name, name );
			end
		end
			obs.bfree(source); -- free memory, release source as it is no longer needed
	end	
	--[[
	]]	
	
	local p_24a = obs.obs_properties_add_editable_list( ctx.propsDef, "audio_marker_b_arr", "Marker B Audio List", obs.OBS_EDITABLE_LIST_TYPE_STRINGS, nil, nil );
  	 --[[
		Option list: User select <media-source> to be used as audio visual at a defined time.
		This provides function options that will impact on audio visual feedback to the user.
		Changing this setting will impact on a function or end result. 
	]]	
	local p_25 = obs.obs_properties_add_list( ctx.propsDef, "audio_marker_end", "<font color=".. font_dimmed ..">Timer Expired Audio</font>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING )
	obs.obs_property_set_long_description( p_25, "\nSelect available media source to activate when the timer expired.\n" ) -- User Tip
	obs.obs_property_list_add_string( p_25, "None", "none" ) -- Add options to the list
	if sources ~= nil then
		for _, source in ipairs( sources ) do
			source_id = obs.obs_source_get_unversioned_id( source ) -- unversioned_id will not be affected by language settings
			if source_id == "ffmpeg_source" then -- identify media type sources only
				local name = obs.obs_source_get_name( source )
				obs.obs_property_list_add_string( p_25, name, name )
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
	local p_26 = obs.obs_properties_add_list( ctx.propsDef, "media_playback_limit", "<i>Media Playback Limit</i>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT );
	 t_type = {"Disabled", "Enabled"}; -- Add options to the list
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_26, v, i ) end; -- This list is auto indexed thus have an interger reference containing a string value
	obs.obs_property_set_long_description( p_26, "\nSet a maximum time limit for media playback.\n" ); -- User Tip
	--*props, *name, *description, min, max, step
	obs.obs_properties_add_int_slider( ctx.propsDef, "duration_marker_a", "Marker A Duration", 0, 10800, 1 );
	obs.obs_properties_add_int_slider( ctx.propsDef, "duration_marker_b", "Marker B Duration", 0, 10800, 1 );
	
	obs.obs_properties_add_int_slider( ctx.propsDef, "duration_marker_end", "End Audio Duration", 0, 10800, 1 );
	obs.obs_properties_add_color( ctx.propsDef, "color_normal", "Normal Color" );
	obs.obs_properties_add_color( ctx.propsDef, "color_marker_a", "Marker A Color" );
	obs.obs_properties_add_color( ctx.propsDef, "color_marker_b", "Marker B Color" );
  	 --[[
		Option list: User select a reference to be used as control to enable text notice for the two time triggers.
		This provides UI layout options to expand feature options.
		Changing this setting will impact on UI and feature options. 
		 
		This property is referenced to trigger an onchange event listener.
	]]	
	local p_27 = obs.obs_properties_add_list( ctx.propsDef, "enable_marker_notes", "<i>Marker Notes</i>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT );
	 t_type = {"Disabled", "Enabled"}; -- Add options to the list
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_27, v, i ) end; -- This list is auto indexed thus have an interger reference containing a string value
	obs.obs_property_set_long_description( p_27, "\nAllows a note to be displayed when the timer match Marker A and Marker B timestamps.\n" ); -- User Tip
	 --[[
		Option list: User select <text-source> to be used as visual feedback indicating a message at a determined time of the timer.
		This provides function options that will impact on visual feedback to the user.
		Changing this setting will not impact on the function or end result. 
	]]
	local p_28 = obs.obs_properties_add_list( ctx.propsDef, "note_source_marker_a", "<i>Marker A Note Source</i>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING );
	obs.obs_property_list_add_string( p_28, "Select", "select" );  -- Adds a default option to the list. First (top-most) list item. If selected the option is ignored. 
	list = {} -- Reset / clear a defined table variable to be used to build lists that will be passed to the property list
	if sources ~= nil then
		for _, source in ipairs( sources ) do
			source_id = obs.obs_source_get_unversioned_id( source ); -- unversioned_id will not be affected by language settings
			if source_id == text_source_unversioned_id then -- identify text type sources only
				local name = obs.obs_source_get_name( source );
				local reference = "note_source_marker_a";
				if not source_selected( name, reference ) then
					--[[
						add it to list so that it can be reordered
					]]		
					list[name] = name;
				else
					--continue 
				end
			end
		end
		
		if tableHasValue( all_sources ) then
			for _, sub in pairs( all_sources ) do	
				local source_id = sub["id"];	
				local source_nested = sub["nested"];
				local name = sub["source_name"]	
				if in_table( { "group", "scene" }, source_id ) and source_nested then -- identify text type sources only
					list[name] = name .. " [Group]";
				end;
			end;
		end;	

		obs.bfree(source); -- free memory, release source as it is no longer needed
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
			obs.obs_property_list_add_string( p_28, value, value );
		end
	end
	 --[[
		Option list: User select <text-source> to be used as visual feedback indicating a message at a determined time of the timer.
		This provides function options that will impact on visual feedback to the user.
		Changing this setting will not impact on the function or end result. 
	]]	
	local p_29 = obs.obs_properties_add_list( ctx.propsDef, "note_source_marker_b", "<i>Marker B Note Source</i>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING );
	obs.obs_property_list_add_string( p_29, "Select", "select" );  -- Adds a default option to the list. First (top-most) list item. If selected the option is ignored. 
	list = {}; -- Reset / clear a defined table variable to be used to build lists that will be passed to the property list
	if sources ~= nil then
		for _, source in ipairs( sources ) do
			source_id = obs.obs_source_get_unversioned_id( source ); -- unversioned_id will not be affected by language settings
			if source_id == text_source_unversioned_id then -- identify text type sources only
				local name = obs.obs_source_get_name( source );
				local reference = "note_source_marker_b";
				if not source_selected( name, reference ) then
					--[[
						add it to list so that it can be reordered
					]]		
					list[name] = name;
				else
					--continue 
				end;
			end;
		end;

		if tableHasValue( all_sources ) then
			for _, sub in pairs( all_sources ) do	
				local source_id = sub["id"];	
				local source_nested = sub["nested"];
				local name = sub["source_name"]	
				if in_table( { "group", "scene" }, source_id ) and source_nested then -- identify text type sources only
					list[name] = name .. " [Group]";
				end;
			end;
		end;
		
		obs.bfree( source ); -- free memory, release source as it is no longer needed
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
			obs.obs_property_list_add_string( p_29, value, value ); -- Add options to the list
		end
	end	
	--[[
		 Text Field
	]]	
	local p_30 = obs.obs_properties_add_text( ctx.propsDef, "note_marker_a", "<font color=".. font_dimmed ..">Marker A Note</font>", obs.OBS_TEXT_DEFAULT );
	obs.obs_property_set_long_description( p_30, "\nDisplay a note when Marker A is Activated.\n" ); -- User Tip
	--[[
		 Text Field
	]]	
	local p_31 = obs.obs_properties_add_text( ctx.propsDef, "note_marker_b", "<font color=".. font_dimmed ..">Marker B Note</font>", obs.OBS_TEXT_DEFAULT );
	obs.obs_property_set_long_description( p_31, "\nDisplay a note when Marker B is Activated.\n" ); -- User Tip
	
	obs.obs_properties_add_int_slider( ctx.propsDef, "hide_note_marker_a", "Hide Marker A Note", 0, 10800, 1 );
	obs.obs_properties_add_int_slider( ctx.propsDef, "hide_note_marker_b", "Hide Marker B Note", 0, 10800, 1 );
	
	
	--[[
		Option list: User select a reference to be used as control to enable an auto start recording feature.
		This provides function options to change a function behaviour.
		Changing this setting will impact on features and operation. 
		 
		This property is referenced to trigger an onchange event listener.
	]]
	local p_32 = obs.obs_properties_add_list( ctx.propsDef, "start_recording", "Auto Recording", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT );
	obs.obs_property_set_long_description( p_32, "\nEnable recording options\n" ); -- User Tip
	t_type = {"Disabled", "Timer Expires", "Marker A Time", "Marker B Time", "Timer Visible", "Timer Start"}; -- Add options to the list
	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_32, v, i ) end; -- This list is auto indexed thus have an interger reference containing a string value
	--[[
		 Text Field
	]]
	local p_34 = obs.obs_properties_add_text( ctx.propsDef, "text_prefix", "<font color=#fefceb>Timer Prefix</font>", obs.OBS_TEXT_DEFAULT );
	obs.obs_property_set_long_description( p_34, "\nDefine text placed before the Timer\n" ); -- User Tip
	--[[
		 Text Field
	]]
	local p_35 = obs.obs_properties_add_text( ctx.propsDef, "text_suffix", "<font color=#fefceb>Timer Suffix</font>", obs.OBS_TEXT_DEFAULT );
	obs.obs_property_set_long_description( p_35, "\nDefine text placed after the Timer\n" ); -- User Tip
  	--[[
		Option list: User select <text-source> to be used as visual feedback indicating a source name that is targeted.
		This provides function options that will impact on visual feedback to the user.
		Changing this setting will impact on the function or end result. 
	]]	  	
	local p_36 = obs.obs_properties_add_list( ctx.propsDef, "active_source", "<i>Active Source</i>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING );
	obs.obs_property_set_long_description( p_36, "\nSelect a text source, that will be used to show the name for the current active Source or Scene\n" ); -- User Tip
	obs.obs_property_list_add_string( p_36, "Select", "select" );  -- Adds a default option to the list. First (top-most) list item. If selected the option is ignored. 
	list = {} -- Reset / clear a defined table variable to be used to build lists that will be passed to the property list
	if sources ~= nil then
		for _, source in ipairs( sources ) do
			source_id = obs.obs_source_get_unversioned_id( source ); -- unversioned_id will not be affected by language settings
			if source_id == text_source_unversioned_id then -- identify text type sources only
				local name = obs.obs_source_get_name( source );
				local reference = "active_source";
				if not source_selected( name, reference ) then
					--[[
						add it to list so that it can be reordered
					]]		
					list[name] = name;
				else
					--continue 
				end;
			end;
		end;
			obs.bfree(source); -- free memory, release source as it is no longer needed
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
			obs.obs_property_list_add_string( p_36, value, value ); -- Add options to the list
		end;
	end;
	
  	 --[[
		Option list: User select a reference to be used as control to enable an action que task once the timer expires.
		This provides function options to change a function behaviour.
		Changing this setting will impact on features and operation. 
		 
		This property is referenced to trigger an onchange event listener.
	]]	
	local p_37 = obs.obs_properties_add_list( ctx.propsDef, "timer_expire_event", "<i>Timer Expire Event</i>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING );
	obs.obs_property_set_long_description( p_37, "\nDefine what happens afater timer ends\n" ); -- User Tip
	obs.obs_property_list_add_string( p_37, "Select", "select" );  -- Adds a default options
	obs.obs_property_list_add_string( p_37, "TIMER END TEXT", "TIMER END TEXT" );  -- Adds a default options
	obs.obs_property_list_add_string( p_37, "--[ Select Lists ]--", "invalid" );  -- Adds a default option to the list. First (top-most) list item. If selected the option is ignored.
	t_type = {"Source List", "Scene List", "Auto List"}; -- Add options to the list
	
	for i,v in ipairs( t_type ) do 
	obs.obs_property_list_add_string( p_37, v, v ); -- Add options to the list 
	end;
	 --[[
		Adding a scene to become active once the timer expires is a feature included
		This will collect available scene names and list them for the user to choose from. 
		The scene names will be added into the existing option list.
	]]	
	local scenes = obs.obs_frontend_get_scene_names();
	if scenes ~= nil then	
		obs.obs_property_list_add_string( p_37, "--[ Select Scene ]--", "invalid" );  -- Adds a default option to the list. First (top-most) list item. If selected the option is ignored.
		for i, scene in ipairs( scenes ) do
			obs.obs_property_list_add_string( p_37, scene, scene ); -- Add options to the list
		end;
		obs.bfree( scene ); -- free memory, release source as it is no longer needed
		obs.obs_property_list_add_string( p_37, "--[ End of Scenes ]--", "invalid" );  -- Adds a default option to the list. First (top-most) list item. If selected the option is ignored.
	end;
	
  	--[[
		Option list: User select <text-source> to be used as visual feedback indicating a source name that is targeted.
		This provides function options that will impact on visual feedback to the user.
		Changing this setting will impact on the function or end result. 
	]]	  	
	local p_33 = obs.obs_properties_add_list( ctx.propsDef, "cycle_source_children", "<i>Auto List</i>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING );
	obs.obs_property_set_long_description( p_33, "\nSelect a source, that have items (children) to be used in cycle list.\n" ); -- User Tip
	obs.obs_property_list_add_string( p_33, "Select", "select" );  -- Adds a default option to the list. First (top-most) list item. If selected the option is ignored. 
	list = {} -- Reset / clear a defined table variable to be used to build lists that will be passed to the property list
	if tableHasValue( all_sources ) then
		for _, sub in pairs( all_sources ) do	
			local source_id = sub["id"];	
			local source_nested = sub["nested"];
			local name = sub["source_name"]	

			if in_table( { "group", "scene" }, source_id ) and source_nested then -- identify text type sources only
				list[name] = name;
			end;
		end;
			obs.bfree(source); -- free memory, release source as it is no longer needed
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
			obs.obs_property_list_add_string( p_33, value, value ); -- Add options to the list
		end;
	end;	
	
	--[[
		 Text Field
	]]
	local p_38 = obs.obs_properties_add_text( ctx.propsDef, "stop_text", "<font color=#fef1eb>Timer Expired Text</font>", obs.OBS_TEXT_DEFAULT );
	obs.obs_property_set_long_description( p_38, "\nDefine text displayed when timer ended\n" ); -- User Tip
	 --[[
		Editable Option list: User adds a text name as an entry used as a reference to be used as inditification of a source.
		This provides function options to change feature behaviour.
		Changing this setting will impact on feature options and behaviour. 
	]]	
	local p_39 = obs.obs_properties_add_editable_list( ctx.propsDef, "cycle_list", "Cycle List", obs.OBS_EDITABLE_LIST_TYPE_STRINGS, nil, nil );
	
	 --[[
		Option list: User select a reference to be used as control to determine a cycling direction.
		This provides function options to change feature behaviour.
		Changing this setting will impact on feature options. 
	]]
	local p_40 = obs.obs_properties_add_list( ctx.propsDef, "cycle_direction", "<i>Cycle Direction</i>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT );
	 t_type = {"Ascending", "Descending"}; -- Add options to the list
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_40, v, i ) end; -- This list is auto indexed thus have an interger reference containing a string value
	obs.obs_property_set_long_description( p_40, "\nSelect the rotation direction of lists.\n" ); -- User Tip
	--[[
		Option list: User select to show or hide available features.
		This provides UI layout options to enhance the user experience.
		Changing this setting does not impact any function or result. 
		 
		This property is referenced to trigger an onchange event listener.
	]]	
	local p_ab = obs.obs_properties_add_list( ctx.propsDef, "timer_manipulation", "<font color=".. font_highlight .."><b>Timer Manipulation</b></font>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT );
	 t_type = {"Hidden", "Expanded", "Disabled"}; -- Add options to the list
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( p_ab, v, i ) end; -- This list is auto indexed thus have an interger reference containing a string value
	obs.obs_property_set_long_description( p_ab, "\nExpand or hide additional options for time adjustments.\n" ); -- User Tip
	 --[[
		Wrap and group properties together.
		Thise group provides options to the user to define a custom time value used as a start point for a stopwatch to continue from
	]]		
	local group_props_2 = obs.obs_properties_create();
	obs.obs_properties_add_group( ctx.propsDef, "_group_2", "Add Seconds to time (Initiate with Hotkey)", obs.OBS_GROUP_NORMAL, group_props_2 );
	-- obs_properties_t *props, const char *name, const char *description, int min, int max, int step
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
	obs.obs_property_set_long_description( p_a5, "\nClick the refresh button the update and show the used limits.\n" ); -- User Tip
	local p_a6 = obs.obs_properties_add_list( group_props_2, "add_limit_note_source", "<i>Limit Note</i>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING );
	obs.obs_property_set_long_description( p_a6, "\nSelect a text source, that will be used to show a message when the limit was reached.\n" ); -- User Tip
	obs.obs_property_list_add_string( p_a6, "Select", "select" )  -- Adds a default option to the list. First (top-most) list item. If selected the option is ignored. 
	list = {} -- Reset / clear a defined table variable to be used to build lists that will be passed to the property list
	if sources ~= nil then
		for _, source in ipairs( sources ) do
			source_id = obs.obs_source_get_unversioned_id( source ); -- unversioned_id will not be affected by language settings
			if source_id == text_source_unversioned_id then -- identify text type sources only
				local name = obs.obs_source_get_name( source );
				local reference = "add_limit_note_source";
				if not source_selected( name, reference ) then
					--[[
						add it to list so that it can be reordered
					]]		
					list[name] = name;
				else
					--continue 
				end;
			end;
		end;
			obs.bfree(source); -- free memory, release source as it is no longer needed
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
			obs.obs_property_list_add_string( p_a5, value, value ); -- Add options to the list
		end;

	end;
	local p_b7 = obs.obs_properties_add_int( group_props_2, "add_limit_note_source_visible", "Note visible", 0, 36000, 1 );
	obs.obs_property_int_set_suffix( p_b7, "     milliseconds visible, 0 is infinite" );
	local p_a8 = obs.obs_properties_add_button( group_props_2, "sec_add_refresh", "Refresh to update form", refresh_properties );
	 --[[
		Wrap and group properties together.
		Thise group provides options to the user to define a custom time value used as a start point for a stopwatch to continue from
	]]		
	local group_props_3 = obs.obs_properties_create();
	obs.obs_properties_add_group( ctx.propsDef, "_group_3", "Subtract Seconds from time (Initiate with Hotkey)", obs.OBS_GROUP_NORMAL, group_props_3 );
	-- obs_properties_t *props, const char *name, const char *description, int min, int max, int step
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
	obs.obs_property_set_long_description( p_b5, "\nClick the refresh button the update and show the used limits.\n" ); -- User Tip
	local p_b6 = obs.obs_properties_add_list( group_props_3, "sub_limit_note_source", "<i>Limit Note</i>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING );
	obs.obs_property_set_long_description( p_b6, "\nSelect a text source, that will be used to show a message when the limit was reached.\n" ); -- User Tip
	obs.obs_property_list_add_string( p_b6, "Select", "select" )  -- Adds a default option to the list. First (top-most) list item. If selected the option is ignored. 
	list = {} -- Reset / clear a defined table variable to be used to build lists that will be passed to the property list
	if sources ~= nil then
		for _, source in ipairs( sources ) do
			source_id = obs.obs_source_get_unversioned_id( source ); -- unversioned_id will not be affected by language settings
			if source_id == text_source_unversioned_id then -- identify text type sources only
				local name = obs.obs_source_get_name( source );
				local reference = "sub_limit_note_source";
				if not source_selected( name, reference ) then
					--[[
						add it to list so that it can be reordered
					]]		
					list[name] = name;
				else
					--continue 
				end;
			end;
		end;
			obs.bfree(source); -- free memory, release source as it is no longer needed
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
			obs.obs_property_list_add_string( p_b5, value, value ); -- Add options to the list
		end;
	end;
	local p_b7 = obs.obs_properties_add_int( group_props_3, "sub_limit_note_source_visible", "Note visible", 0, 36000, 1 );
	obs.obs_property_int_set_suffix( p_b7, "     milliseconds visible, 0 is infinite" );
	
	local p_b8 = obs.obs_properties_add_button( group_props_3, "sec_sub_refresh", "Refresh to update form", refresh_properties );
	 --[[
		Wrap and group properties together.
		Thise group provides options to the user to define a custom time value used as a start point for a stopwatch to continue from
	]]		
	local group_props_1 = obs.obs_properties_create();
	obs.obs_properties_add_group( ctx.propsDef, "_group_1", "Manually set timer", obs.OBS_GROUP_NORMAL, group_props_1 ); -- Count Up 
	--[[
		 Inerger Field
	]]	 	
	local p_gp_1 = obs.obs_properties_add_int( group_props_1, "sw_days_saved", "DD", 0, 7300, 1 );
	local p_gp_2 = obs.obs_properties_add_int( group_props_1, "sw_hours_saved", "HH", 0, 23, 1);
	local p_gp_3 = obs.obs_properties_add_int( group_props_1, "sw_minutes_saved", "MM", 0, 59, 1);
	local p_gp_4 = obs.obs_properties_add_int( group_props_1, "sw_seconds_saved", "SS", 0, 59, 1);
	local p_gp_5 = obs.obs_properties_add_int( group_props_1, "sw_milliseconds_saved", "FF", 0, 99, 1);
	local p_gp_6 = obs.obs_properties_add_bool( group_props_1, "load_saved_time", "Autoload last time stamp when OBS starts" );
	local p_gp_7 = obs.obs_properties_add_button( group_props_1, "sw_button", "Set", sw_saved_button_clicked );
	--[[ 
		Hidden Value
		We save last count in the properties for when OBS shuts down and starts again
	]]
	local p_47 = obs.obs_properties_add_float( group_props_1, "sw_current_seconds", "Saved Seconds", 0, 3600000000, 0.1);
	obs.obs_property_set_visible( p_47 , set_visible_properties );
	 --[[
		Property Button: User interaction that will start, pause or stop a timer.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]	
	obs.obs_properties_add_button( ctx.propsDef, "start_button", "Start", start_button_clicked );
	 --[[
		Property Button: User interaction that will start, pause or stop a timer.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]	
	local p_48 = obs.obs_properties_add_button( ctx.propsDef, "pause_button", "Start", pause_button_clicked );
	 --[[
		Property Button: User interaction that will mark a timer timestamp.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour. 
	]]		
	obs.obs_properties_add_button( ctx.propsDef, "split_button", "Split Time", split_button_clicked );
	 --[[
		Property Button: User interaction that will start, pause or stop a timer.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
		 
		This property is referenced to trigger an onchange event listener.
	]]
	local p_49 = obs.obs_properties_add_button( ctx.propsDef, "mili_button", "Show Milliseconds", mili_button_clicked );
	 --[[
		Property Button: User interaction that will reset a timer.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]
	local p_50 = obs.obs_properties_add_button( ctx.propsDef, "direction_button", "Count Up/Down", direction_button_clicked );
	 --[[
		Property Button: User interaction that will reset a timer.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]
	local p_51 = obs.obs_properties_add_button( ctx.propsDef, "reset_button", "Reset Count Up Timer", reset_button_clicked );
	 --[[
		Property Checkbox: User interaction that enable setting a custom stopwatch start timestamp.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
		 
		This property is referenced to trigger an onchange event listener.
	]]
	local p_62 = obs.obs_properties_add_bool( ctx.propsDef, "split_startpause", "Split Start Pause Button" );	-- count up only
	 --[[
		Property Checkbox: User interaction that enable setting a custom stopwatch start timestamp.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
		 
		This property is referenced to trigger an onchange event listener.
	]]
	local p_52 = obs.obs_properties_add_bool( ctx.propsDef, "set_stopwatch", "Adjust timer manually" );	-- count up only
	 --[[
		Property Checkbox: User interaction that toggle active source visibility.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]
    obs.obs_properties_add_bool( ctx.propsDef, "active_source_force_visible", "Active Source Force Visibility" );
	 --[[
		Property Checkbox: User interaction that will disable the plugin.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]
    local p_55 = obs.obs_properties_add_bool( ctx.propsDef, "enable_direction_toggle", "Enable Timer Direction Toggle" );
	 --[[
		Property Checkbox: User interaction that will disable the plugin.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]
    obs.obs_properties_add_bool( ctx.propsDef, "prevent_negative_time", "Prevent Negative Time Value" );
	 --[[
		Property Checkbox: User interaction that will enable backup options.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
		 
		This property is referenced to trigger an onchange event listener.
	]]
	local p_56 = obs.obs_properties_add_bool( ctx.propsDef, "backup_mode", "Backup Mode" );
	 --[[
		Property Checkbox: User interaction that will enable backup options.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
		 
		This property is referenced to trigger an onchange event listener.
	]]
	obs.obs_properties_add_bool( ctx.propsDef, "debug_enabled", "Enable debug logging" );
	 --[[
		Property Directory Path: User interaction that select a directory path.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
		 
		This property is referenced to trigger an onchange event listener.
	]]
	local p_57 = obs.obs_properties_add_path( ctx.propsDef, "backup_folder", "Backup Folder", obs.OBS_PATH_DIRECTORY, nil, nil);
	--[[
		Property list: User interaction that will execute an import feature.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
		 
		This property is referenced to trigger an onchange event listener.
	]]
	local p_58 = obs.obs_properties_add_list( ctx.propsDef, "import_list", "<i>Load Settings</i>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING );
	obs.obs_property_list_add_string( p_58, "No Files Found", "none" ); -- Adds a default option to the list. First (top-most) list item. If selected the option is ignored. 
	obs.obs_property_set_long_description( p_58, "\nSelect the Settings file to import.\n" ); -- User Tip
	-- This can ony be populated if backup_folder is defined
	local filenames = get_filenames( backup_folder, ".json" ); -- list all files of type
	if table.getn( filenames ) > 0 then
  		for i,v in pairs( filenames ) do 
			obs.obs_property_list_add_string( p_58, v, v ); -- Add options to the list
		end;
	end;
	obs.obs_properties_add_bool( ctx.propsDef, "backup_split_time", "Export Split Time" );
	--[[
	   Property Directory Path: User interaction that select a directory path.
	   This provides function interaction to change feature behaviour.
	   Interacting with this property will impact on feature options and behaviour.
		
	   This property is referenced to trigger an onchange event listener.
   ]]
	 --[[
		Property Button: User interaction that will import available property settings from a json file
		and apply them to the properties.
		This provides function interaction to change feature behaviour.
		Interacting with this property will complete a feature task. 
		 
		This property is referenced to trigger an onchange event listener.
	]]
	local p_59 = obs.obs_properties_add_button( ctx.propsDef, "import_button", "Import Settings", import_button_clicked );
	
	--[[
		Property Button: User interaction that will export all property settings to a json file.
		This provides function interaction to change feature behaviour.
		Interacting with this property will complete a feature task. 
	]]
	local p_60 = obs.obs_properties_add_button( ctx.propsDef, "export_button", "Export Settings", export_button_clicked );
	
	 --[[
		SCRIPT READY
		MUST BE HIDDEN
	]]
	local p_61 = obs.obs_properties_add_bool( ctx.propsDef, "script_ready", "Script Ready" );
	obs.obs_property_set_visible( p_61 , set_visible_properties );
	
	
	 --[[
		Property Checkbox: User interaction that will disable the plugin.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]
    obs.obs_properties_add_bool( ctx.propsDef, "disable_script", "Disable Script" );
	
	 --[[
		Property Checkbox: User interaction that will disable the plugin.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]
    local p_63 = obs.obs_properties_add_bool( ctx.propsDef, "select_features", "Disable Featues" );
	
	 --[[
		Wrap and group properties together.
		Thise group provides options to the user to define a custom time value used as a start point for a stopwatch to continue from
	]]		
	local group_props_4 = obs.obs_properties_create();
	local p_64 = obs.obs_properties_add_group( ctx.propsDef, "_group_4", "Disable or Enable Plugin Features - Check [x] = enabled", obs.OBS_GROUP_NORMAL, group_props_4 );
	 --[[
		Property Checkbox: User interaction that will disable the plugin.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]
    local p_64_0 = obs.obs_properties_add_bool( group_props_4, "enable_property_toggle_mili_trigger", "Split Seconds Toggle" );
	 --[[
		Property Checkbox: User interaction that will disable the plugin.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]
    local p_64_1 = obs.obs_properties_add_bool( group_props_4, "enable_property_split_source", "Timer Time Split/Lap" );
	
	 --[[
		Property Checkbox: User interaction that will disable the plugin.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]
    local p_64_2 = obs.obs_properties_add_bool( group_props_4, "enable_property_trigger_options", "Marker Settings" );
	
	 --[[
		Property Checkbox: User interaction that will disable the plugin.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]
    local p_64_3 = obs.obs_properties_add_bool( group_props_4, "enable_property_color_normal", "Text Colour [Normal]" );
	
	 --[[
		Property Checkbox: User interaction that will disable the plugin.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]
    local p_64_4 = obs.obs_properties_add_bool( group_props_4, "enable_property_color_marker_a", "Text Colour [Marker A]" );
	
	 --[[
		Property Checkbox: User interaction that will disable the plugin.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]
    local p_64_5 = obs.obs_properties_add_bool( group_props_4, "enable_property_color_marker_b", "Text Colour [Marker B]" );
	
	
	 --[[
		Property Checkbox: User interaction that will disable the plugin.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]
    local p_64_6 = obs.obs_properties_add_bool( group_props_4, "enable_property_start_recording", "Recording" );
	
	
	 --[[
		Property Checkbox: User interaction that will disable the plugin.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]
    local p_64_7 = obs.obs_properties_add_bool( group_props_4, "enable_property_text_prefix", "Timer Text Prefix" );
	
	
	 --[[
		Property Checkbox: User interaction that will disable the plugin.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]
    local p_64_8 = obs.obs_properties_add_bool( group_props_4, "enable_property_text_suffix", "Timer Text Suffix" );
	
	
	 --[[
		Property Checkbox: User interaction that will disable the plugin.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]
    local p_64_9 = obs.obs_properties_add_bool( group_props_4, "enable_property_timer_activation", "Timer Activation" );
	
	
	 --[[
		Property Checkbox: User interaction that will disable the plugin.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]
    local p_64_10 = obs.obs_properties_add_bool( group_props_4, "enable_property_timer_manipulation", "Timer Manipulation" );
	
	
	 --[[
		Property Checkbox: User interaction that will disable the plugin.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]
    local p_64_11 = obs.obs_properties_add_bool( group_props_4, "enable_property_debug", "Debugging" );
	
	 --[[
		Property Checkbox: User interaction that will disable the plugin.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]
    local p_64_12 = obs.obs_properties_add_bool( group_props_4, "enable_property_backup", "Backup" );
	
	
	obs.source_list_release( sources ); -- free memory, release sources as it is no longer needed
	--[[ 
		Callback definitions used to check for user interaction or property changes.
		Event Listener
		Each entry provides a callback to a referenced proeprty along with a target callback handler
	
	
	timer_source, split_source, active_source, note_source_marker_a, note_source_marker_b, sub_limit_note_source, add_limit_note_source
	
	
	]]--
  	obs.obs_property_set_modified_callback( p_ab, property_onchange );		-- timer_manipulation
  	obs.obs_property_set_modified_callback( p_a4, property_onchange );		-- sec_add_limit
  	obs.obs_property_set_modified_callback( p_b4, property_onchange );		-- sec_sub_limit
  	obs.obs_property_set_modified_callback( p_a6, property_onchange );		-- add_limit_note_source
  	obs.obs_property_set_modified_callback( p_b6, property_onchange );		-- sub_limit_note_source
  	obs.obs_property_set_modified_callback( p_1, property_onchange );		-- timer_mode
  	obs.obs_property_set_modified_callback( p_2, property_onchange );		-- layout
	obs.obs_property_set_modified_callback( p_3, property_onchange );		-- timer_options
  	obs.obs_property_set_modified_callback( p_4, property_onchange );		-- timer_source
  	obs.obs_property_set_modified_callback( p_5, property_onchange );		-- countdown_type
  	obs.obs_property_set_modified_callback( p_8, property_onchange );		-- month
  	obs.obs_property_set_modified_callback( p_9, property_onchange );		-- year
  	obs.obs_property_set_modified_callback( p_11, property_onchange );		-- hours
  	obs.obs_property_set_modified_callback( p_12, property_onchange );		-- minutes
  	obs.obs_property_set_modified_callback( p_13, property_onchange );		-- seconds
  	obs.obs_property_set_modified_callback( p_14, property_onchange );		-- timer_format
  	obs.obs_property_set_modified_callback( p_15, property_onchange );		-- custom_time_format
  	obs.obs_property_set_modified_callback( p_16, property_onchange );		-- toggle_mili_trigger
	obs.obs_property_set_modified_callback( p_18, property_onchange );		-- split_source
	obs.obs_property_set_modified_callback( p_20, property_onchange );		-- text_arr_marker_a
	obs.obs_property_set_modified_callback( p_21, property_onchange );		-- text_arr_marker_b
	obs.obs_property_set_modified_callback( p_22, property_onchange );		-- trigger_options
	obs.obs_property_set_modified_callback( p_23, property_onchange );		-- audio_marker_a
	obs.obs_property_set_modified_callback( p_24, property_onchange );		-- audio_marker_b
	obs.obs_property_set_modified_callback( p_26, property_onchange );		-- media_playback_limit
  	obs.obs_property_set_modified_callback( p_27, property_onchange );		-- enable_marker_notes
  	obs.obs_property_set_modified_callback( p_28, property_onchange );		-- note_source_marker_a
  	obs.obs_property_set_modified_callback( p_29, property_onchange );		-- note_source_marker_b
  	obs.obs_property_set_modified_callback( p_32, property_onchange );		-- start_recording
  	obs.obs_property_set_modified_callback( p_33, property_onchange );		-- cycle_source_children
  	obs.obs_property_set_modified_callback( p_36, property_onchange );		-- active_source
  	obs.obs_property_set_modified_callback( p_37, property_onchange );		-- timer_expire_event
	obs.obs_property_set_modified_callback( p_52, property_onchange );		-- set_stopwatch
	obs.obs_property_set_modified_callback( p_gp_6, property_onchange );		-- load_saved_time
	obs.obs_property_set_modified_callback( p_55, property_onchange );		-- enable_direction_toggle
	obs.obs_property_set_modified_callback( p_56, property_onchange );		-- backup_mode
	obs.obs_property_set_modified_callback( p_57, property_onchange );		-- backup_folder
	obs.obs_property_set_modified_callback( p_58, property_onchange );		-- import_list
	obs.obs_property_set_modified_callback( p_59, import_properties );		-- import_button
	obs.obs_property_set_modified_callback( p_62, property_onchange );		-- split_startpause
	obs.obs_property_set_modified_callback( p_63, property_onchange );		-- select_features
	obs.obs_property_set_modified_callback( p_64_0, property_onchange );		-- select_features
	obs.obs_property_set_modified_callback( p_64_1, property_onchange );		-- select_features
	obs.obs_property_set_modified_callback( p_64_2, property_onchange );		-- select_features
	obs.obs_property_set_modified_callback( p_64_3, property_onchange );		-- select_features
	obs.obs_property_set_modified_callback( p_64_4, property_onchange );		-- select_features
	obs.obs_property_set_modified_callback( p_64_5, property_onchange );		-- select_features
	obs.obs_property_set_modified_callback( p_64_6, property_onchange );		-- select_features
	obs.obs_property_set_modified_callback( p_64_7, property_onchange );		-- select_features
	obs.obs_property_set_modified_callback( p_64_8, property_onchange );		-- select_features
	obs.obs_property_set_modified_callback( p_64_9, property_onchange );		-- select_features
	obs.obs_property_set_modified_callback( p_64_10, property_onchange );		-- select_features
	obs.obs_property_set_modified_callback( p_64_11, property_onchange );		-- select_features
	obs.obs_property_set_modified_callback( p_64_12, property_onchange );		-- select_features
	obs.obs_property_set_modified_callback( p_65, property_onchange );			-- timer_activation
	obs.obs_property_set_modified_callback( p_65_a, property_onchange );		-- timer_activation_source
	obs.obs_property_set_modified_callback( p_65_b, property_onchange );		-- timer_reset
	-- Calls the callback once to set-up current visibility
  	obs.obs_properties_apply_settings( ctx.propsDef, ctx.propsSet );
	
	return ctx.propsDef;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	We use this to keep track of what text type sources was assigned/selected in properties
	
	Credit:			
	Modified:		
	function:		Called upon settings initialization and modification
	type:			
	input type: 	

	returns:
----------------------------------------------------------------------------------------------------------------------------------------
]]
function update_source_list()
	if disable_script then return; end;
    debug_log( 'update_source_list() -- function variable names: ' )
	selected_source_list["timer_source"] = timer_source; 
	selected_source_list["split_source"] = split_source;
	selected_source_list["active_source"] = active_source;
	selected_source_list["note_source_marker_a"] = note_source_marker_a;
	selected_source_list["note_source_marker_b"] = note_source_marker_b;
	selected_source_list["sub_limit_note_source"] = sub_limit_note_source;
	selected_source_list["add_limit_note_source"] = add_limit_note_source;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description:	We use this to keep track of what text type sources was assigned/selected in properties
	
	Credit:			
	Modified:		
	function:		Called upon settings initialization and modification
	type:			
	input type: 	
	returns:
----------------------------------------------------------------------------------------------------------------------------------------
]]
function source_selected( input_value, reference )
	if disable_script then return; end;
    debug_log( 'source_selected(' .. pre_dump(input_value) .. ", " .. pre_dump(reference) .. ') -- function variable names:  input_value, reference ' )
	if in_table( {'Select, select'}, input_value ) or selected_source_list[reference] == input_value then return false end;
	return in_table( selected_source_list, input_value );
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
    debug_log( 'script_update(' .. pre_dump(settings) .. ') -- function variable names:  settings ' )
	--[[
		something changed, remove all timers. 
	]]
	remove_all_timers();
	
  	ctx.propsSet = settings;-- Keep track of current settings
	
	--[[
		Update a gloabl in case something changed. 
	]]
	count_required_sources();
	--[[
		Get the correct frequency for splitseconds when the script loads. 
	]]
	assign_default_frequency();
	--[[
		load any property values available to globals
	]]
	load_settings_globals( settings ); -- load all property settings to globals
	reset_mili( ); -- ensure mili hide/show settings are updated
	
	reset( true ); -- anything could have changed so reset everything
	--[[
		If setting changed, update timer
	]]
	update_timer_settings( false ); -- optional inputs: set_to_default(bool), new_settings(obs_property_data/obs_userdata)	
	
	hour_format = get_unit_allocation( custom_time_format, 'H' );

	minute_format = get_unit_allocation( custom_time_format, 'M' );
	--[[
	 		Make sure the trigger is as accurate as possible depending
			if the timer is counting up or down.
	]]
	timer_activation_signals()
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
    debug_log( 'script_defaults(' .. pre_dump(settings) .. ') -- function variable names:  settings ' )
	
	
	--[[
		Get the correct frequency for splitseconds when the script loads. 
	]]
	assign_default_frequency();
	--[[
		Set property value by provided property reference.
	
		Set property INTEGER TYPES.  
	]]
	
	obs.obs_data_set_default_int( settings, "sec_add_limit", 0 );
	obs.obs_data_set_default_int( settings, "sec_add_limit_used", 0 );
	obs.obs_data_set_default_int( settings, "sec_sub_limit", 0 );
	obs.obs_data_set_default_int( settings, "sec_sub_limit_used", 0 );
	obs.obs_data_set_default_int( settings, "hours", 0 );
	obs.obs_data_set_default_int( settings, "layout", 1 );
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
	obs.obs_data_set_default_int( settings, "timer_activation", 1 );
	obs.obs_data_set_default_int( settings, "timer_reset", 1 );
	obs.obs_data_set_default_int( settings, "timer_options", 1 );
	obs.obs_data_set_default_int( settings, "countdown_type", 2 );
	obs.obs_data_set_default_int( settings, "sw_days_saved", 0 );
	obs.obs_data_set_default_int( settings, "sw_hours_saved", 0 );
	obs.obs_data_set_default_int( settings, "sw_minutes_saved", 0 );
	obs.obs_data_set_default_int( settings, "sw_seconds_saved", 0 );
	obs.obs_data_set_default_int( settings, "sw_milliseconds_saved", 0 );
	obs.obs_data_set_default_int( settings, "cycle_direction", 1 );
	obs.obs_data_set_default_int( settings, "start_recording", 1 );
	obs.obs_data_set_default_int( settings, "reset_text_marker_a", 3 );
	obs.obs_data_set_default_int( settings, "reset_text_marker_b", 3 );
	obs.obs_data_set_default_int( settings, "hide_note_marker_a", 3 );
	obs.obs_data_set_default_int( settings, "hide_note_marker_b", 3 );
	obs.obs_data_set_default_string( settings, "text_marker_tip", "Use format 00:00:00 ( hours:minutes:seconds )" );
	obs.obs_data_set_default_int( settings, "duration_marker_a", 5 );
	obs.obs_data_set_default_int( settings, "duration_marker_b", 5 );
	obs.obs_data_set_default_int( settings, "timer_manipulation", 3 );
	obs.obs_data_set_default_int( settings, "duration_marker_end", 5 );
	obs.obs_data_set_default_int( settings, "enable_marker_notes", 1 );
	obs.obs_data_set_default_int( settings, "media_playback_limit", 1 );
	obs.obs_data_set_default_int( settings, "year", os.date("%Y", os.time()) );
	obs.obs_data_set_default_int( settings, "add_limit_note_source_visible", 0 )
	obs.obs_data_set_default_int( settings, "sub_limit_note_source_visible", 0 )
	obs.obs_data_set_default_int( settings, "color_normal", media["color_normal"] );
	obs.obs_data_set_default_int( settings, "color_marker_a", media["color_marker_a"] );
	obs.obs_data_set_default_int( settings, "color_marker_b", media["color_marker_b"] );
	--[[
		Set property STRING TYPES. 
	]]
	obs.obs_data_set_default_string( settings, "stop_text", "" );
	obs.obs_data_set_default_string( settings, "text_prefix", "" );
	obs.obs_data_set_default_string( settings, "text_suffix", "" );
	obs.obs_data_set_default_string( settings, "note_marker_a", "" );
	obs.obs_data_set_default_string( settings, "note_marker_b", "" );
	-- upgraded obs.obs_data_set_default_string( settings, "text_marker_a", "" );
	-- upgraded obs.obs_data_set_default_string( settings, "text_marker_b", "" );
	obs.obs_data_set_default_string( settings, "timer_expire_event", "select" );
	obs.obs_data_set_default_string( settings, "cycle_source_children", "select" );
	obs.obs_data_set_default_string( settings, "day_text", "# Day \n" );
	obs.obs_data_set_default_string( settings, "audio_marker_a", "None" );
	obs.obs_data_set_default_string( settings, "audio_marker_b", "None" );
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
	--[[
		Set property BOOL TYPES. 
	]]
	obs.obs_data_set_default_bool( settings, "backup_mode", false );
	obs.obs_data_set_default_bool( settings, "backup_split_time", false );
	obs.obs_data_set_default_bool( settings, "set_stopwatch", false );
	obs.obs_data_set_default_bool( settings, "disable_script", false );
	obs.obs_data_set_default_bool( settings, "debug_enabled", false );
	obs.obs_data_set_default_bool( settings, "load_saved_time", false );
	obs.obs_data_set_default_bool( settings, "backup_split_time", false );
	obs.obs_data_set_default_bool( settings, "enable_direction_toggle", false );
	obs.obs_data_set_default_bool( settings, "prevent_negative_time", false );
	obs.obs_data_set_default_bool( settings, "active_source_force_visible", false );
	obs.obs_data_set_default_bool( settings, "split_startpause", false );
		
	obs.obs_data_set_default_bool( settings, "select_features", false );
	obs.obs_data_set_default_bool( settings, "enable_property_toggle_mili_trigger", true );
	obs.obs_data_set_default_bool( settings, "enable_property_color_normal", true ); 
	obs.obs_data_set_default_bool( settings, "enable_property_color_marker_a", true ); 
	obs.obs_data_set_default_bool( settings, "enable_property_color_marker_b", true ); 
	obs.obs_data_set_default_bool( settings, "enable_property_split_source", true ); 
	obs.obs_data_set_default_bool( settings, "enable_property_trigger_options", true ); 
	obs.obs_data_set_default_bool( settings, "enable_property_start_recording", true ); 
	obs.obs_data_set_default_bool( settings, "enable_property_text_prefix", true ); 
	obs.obs_data_set_default_bool( settings, "enable_property_text_suffix", true ); 
	obs.obs_data_set_default_bool( settings, "enable_property_timer_activation", true ); 
	obs.obs_data_set_default_bool( settings, "enable_property_timer_manipulation", true ); 
	obs.obs_data_set_default_bool( settings, "enable_property_debug", true ); 
	obs.obs_data_set_default_bool( settings, "enable_property_backup", true ); 
	
	debug_log( 'loaded get default script_ready (' .. pre_dump(true) .. ') ' )
	-- Keep track of current settings
  	ctx.propsSet = settings; 
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
    debug_log( 'script_save(' .. pre_dump(settings) .. ') -- function variable names:  settings ' )
	--[[
		script save
		
		Set (Timer)
	]]	
	local hotkey_save_array_set = obs.obs_hotkey_save( hotkey_id_set );
	obs.obs_data_set_array( settings, "set_hotkey", hotkey_save_array_set );
	obs.obs_data_array_release( hotkey_save_array_set );
	
	--[[
		script save
		
		Reset (Timer)
	]]	
	local hotkey_save_array_reset = obs.obs_hotkey_save( hotkey_id_reset );
	obs.obs_data_set_array( settings, "reset_hotkey", hotkey_save_array_reset );
	obs.obs_data_array_release( hotkey_save_array_reset );
	
	--[[
		script save
		
		Start Timer
	]]	
	local hotkey_save_array_start = obs.obs_hotkey_save( hotkey_id_start );
	obs.obs_data_set_array( settings, "start_hotkey", hotkey_save_array_start );
	obs.obs_data_array_release( hotkey_save_array_start );
	
	--[[
		script save
		
		Pause (Start/Pause Timer)
	]]	
	local hotkey_save_array_pause = obs.obs_hotkey_save( hotkey_id_pause );
	obs.obs_data_set_array( settings, "pause_hotkey", hotkey_save_array_pause );
	obs.obs_data_array_release( hotkey_save_array_pause );
	--[[
		script save
		
		Split (available for stopwatch only)
	]]	
	local hotkey_save_array_split = obs.obs_hotkey_save( hotkey_id_split );
	obs.obs_data_set_array( settings, "split_hotkey", hotkey_save_array_split );
	obs.obs_data_array_release( hotkey_save_array_split );
	--[[
		script is loading. register and assign hotkeys 
		
		script save
	]]
	local hotkey_save_array_mili = obs.obs_hotkey_save( hotkey_id_mili );
	obs.obs_data_set_array( settings, "mili_hotkey", hotkey_save_array_mili );
	obs.obs_data_array_release( hotkey_save_array_mili );
	--[[
	]]
	local hotkey_save_array_direction = obs.obs_hotkey_save( hotkey_id_direction );
	obs.obs_data_set_array( settings, "direction_hotkey", hotkey_save_array_direction );
	obs.obs_data_array_release( hotkey_save_array_direction );
	--[[
	
	]]
	local hotkey_save_array_sec_add_1 = obs.obs_hotkey_save( hotkey_id_sec_add_1 );
	obs.obs_data_set_array( settings, "sec_add_1_hotkey", hotkey_save_array_sec_add_1 );
	obs.obs_data_array_release( hotkey_save_array_sec_add_1 );
	--[[
	
	]]
	local hotkey_save_array_sec_add_2 = obs.obs_hotkey_save( hotkey_id_sec_add_2 );
	obs.obs_data_set_array( settings, "sec_add_2_hotkey", hotkey_save_array_sec_add_2 );
	obs.obs_data_array_release( hotkey_save_array_sec_add_2 );
	--[[
	
	]]
	local hotkey_save_array_sec_add_3 = obs.obs_hotkey_save( hotkey_id_sec_add_3 );
	obs.obs_data_set_array( settings, "sec_add_3_hotkey", hotkey_save_array_sec_add_3 );
	obs.obs_data_array_release( hotkey_save_array_sec_add_3 );
	--[[
	
	]]
	local hotkey_save_array_sec_sub_1 = obs.obs_hotkey_save( hotkey_id_sec_sub_1 );
	obs.obs_data_set_array( settings, "sec_sub_1_hotkey", hotkey_save_array_sec_sub_1 );
	obs.obs_data_array_release( hotkey_save_array_sec_sub_1 );
	--[[
	
	]]
	local hotkey_save_array_sec_sub_2 = obs.obs_hotkey_save( hotkey_id_sec_sub_2 );
	obs.obs_data_set_array( settings, "sec_sub_2_hotkey", hotkey_save_array_sec_sub_2 );
	obs.obs_data_array_release( hotkey_save_array_sec_sub_2 );
	--[[
	
	]]
	local hotkey_save_array_sec_sub_3 = obs.obs_hotkey_save( hotkey_id_sec_sub_3 );
	obs.obs_data_set_array( settings, "sec_sub_3_hotkey", hotkey_save_array_sec_sub_3 );
	obs.obs_data_array_release( hotkey_save_array_sec_sub_3 );
	--[[
		It is really important that this the last item in this routine
	]]
	--obs.obs_properties_set_flags( ctx.propsDef, obs.obs_properties_get_flags( ctx.propsDef ) or obs.OBS_PROPERTIES_DEFER_UPDATE)
	if load_saved_time then
		obs.obs_data_set_double( ctx.propsSet, "sw_current_seconds", current_seconds );
		obslua.obs_data_apply( settings, ctx.propsSet );
	end	
	
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
function assign_hotkeys( settings, load_globals )
	debug_log( 'assign_hotkeys(' .. pre_dump(settings) .. ') -- function variable names:  settings ' )
	--if load_globals then load_settings_globals( settings ) end
	local hotkey_name = "";
	
	--[[
		
		%s: This is a special sequence which matches all whitespace characters.
		%c: This is a special sequence which matches all control characters (\n, \t, \r, ...).
		%p: This is a special sequence which matches all punctuation characters (!, ?, &, ...).
		%w: This is a special sequence which matches all alphanumeric characters (A-Z, a-z, 0-9).
		see also: 	https://riptutorial.com/lua/example/20315/lua-pattern-matching
	]]
	--[[
		script is loading. register and assign hotkeys 
		
		Reset (Timer)
	]]	
	hotkey_name = "timer_set_" .. filename():lower():gsub("[%W%p%c%s]", "");
	hotkey_id_set = obs.obs_hotkey_register_frontend( hotkey_name, "Set " .. filename(), hotkey_send_set );
	local hotkey_save_array_set = obs.obs_data_get_array( settings, "set_hotkey" );
	obs.obs_hotkey_load( hotkey_id_set, hotkey_save_array_set );
	obs.obs_data_array_release( hotkey_save_array_set );
	--[[
		script is loading. register and assign hotkeys 
		
		Reset (Timer)
	]]	
	hotkey_name = "timer_reset_" .. filename():lower():gsub("[%W%p%c%s]", "");
	hotkey_id_reset = obs.obs_hotkey_register_frontend( hotkey_name, "Reset " .. filename(), hotkey_send_reset );
	local hotkey_save_array_reset = obs.obs_data_get_array( settings, "reset_hotkey" );
	obs.obs_hotkey_load( hotkey_id_reset, hotkey_save_array_reset );
	obs.obs_data_array_release( hotkey_save_array_reset );
	--[[
		script is loading. register and assign hotkeys 
		
		Pause (Start/Pause Timer)
	]]	
	hotkey_name = "timer_start_" .. filename():lower():gsub("[%W%p%c%s]", "");
	hotkey_id_start = obs.obs_hotkey_register_frontend( hotkey_name, "Start " .. filename(), hotkey_send_start );
	local hotkey_save_array_start = obs.obs_data_get_array( settings, "start_hotkey" );
	obs.obs_hotkey_load( hotkey_id_start, hotkey_save_array_start );
	obs.obs_data_array_release( hotkey_save_array_start );
	--[[
		script is loading. register and assign hotkeys 
		
		Pause (Start/Pause Timer)
	]]	
	local title = split_startpause and "Pause " or "Start/Pause "
	hotkey_name = "timer_pause_" .. filename():lower():gsub("[%W%p%c%s]", "");
	hotkey_id_pause = obs.obs_hotkey_register_frontend( hotkey_name, title .. filename(), hotkey_send_pause );
	local hotkey_save_array_pause = obs.obs_data_get_array( settings, "pause_hotkey" );
	obs.obs_hotkey_load( hotkey_id_pause, hotkey_save_array_pause );
	obs.obs_data_array_release( hotkey_save_array_pause );
	--[[
		script is loading. register and assign hotkeys 
		
		Split (available for stopwatch only)
	]]	
	hotkey_name = "timer_split_" .. filename():lower():gsub("[%W%p%c%s]", "");
	hotkey_id_split = obs.obs_hotkey_register_frontend( hotkey_name, "Split Time " .. filename(), hotkey_send_split );
	local hotkey_save_array_split = obs.obs_data_get_array( settings, "split_hotkey" );
	obs.obs_hotkey_load( hotkey_id_split, hotkey_save_array_split );
	obs.obs_data_array_release( hotkey_save_array_split );
	--[[
		script is loading. register and assign hotkeys 
		
		Milliseconds (Show/Hide Timer Milliseconds if in Timer format)
	]]
	hotkey_name = "timer_mili_" .. filename():lower():gsub("[%W%p%c%s]", "");
	hotkey_id_mili = obs.obs_hotkey_register_frontend( hotkey_name, "Milliseconds Toggle " .. filename(), hotkey_send_mili );
	local hotkey_save_array_mili = obs.obs_data_get_array( settings, "mili_hotkey" );
	obs.obs_hotkey_load( hotkey_id_mili, hotkey_save_array_mili );
	obs.obs_data_array_release( hotkey_save_array_mili );
	--[[
		script is loading. register and assign hotkeys 
		
		Change Timer Count Direction (Show/Hide Timer Milliseconds if in Timer format)
	]]
	hotkey_name = "direction_change_" .. filename():lower():gsub("[%W%p%c%s]", "");
	hotkey_id_direction = obs.obs_hotkey_register_frontend( hotkey_name, "Change Timer Direction " .. filename(), hotkey_send_direction );
	local hotkey_save_array_direction = obs.obs_data_get_array( settings, "direction_hotkey" );
	obs.obs_hotkey_load( hotkey_id_direction, hotkey_save_array_direction );
	obs.obs_data_array_release( hotkey_save_array_direction );
	--[[
		script is loading. register and assign hotkeys 
		
		Add Seconds to Timer
	]]
	hotkey_name = "sec_add_1_" .. filename():lower():gsub("[%W%p%c%s]", "");
	hotkey_id_sec_add_1 = obs.obs_hotkey_register_frontend( hotkey_name, "Add Seconds Set 1 " .. filename(), hotkey_send_sec_add_1 );
	local hotkey_save_array_sec_add_1 = obs.obs_data_get_array( settings, "sec_add_1_hotkey" );
	obs.obs_hotkey_load( hotkey_id_sec_add_1, hotkey_save_array_sec_add_1 );
	obs.obs_data_array_release( hotkey_save_array_sec_add_1 );
	--[[
		script is loading. register and assign hotkeys 
		
		Add Seconds to Timer
	]]
	hotkey_name = "sec_add_2_" .. filename():lower():gsub("[%W%p%c%s]", "");
	hotkey_id_sec_add_2 = obs.obs_hotkey_register_frontend( hotkey_name, "Add Seconds Set 2 " .. filename(), hotkey_send_sec_add_2 );
	local hotkey_save_array_sec_add_2 = obs.obs_data_get_array( settings, "sec_add_2_hotkey" );
	obs.obs_hotkey_load( hotkey_id_sec_add_2, hotkey_save_array_sec_add_2 );
	obs.obs_data_array_release( hotkey_save_array_sec_add_2 );
	--[[
		script is loading. register and assign hotkeys 
		
		Add Seconds to Timer
	]]
	hotkey_name = "sec_add_3_" .. filename():lower():gsub("[%W%p%c%s]", "");
	hotkey_id_sec_add_3 = obs.obs_hotkey_register_frontend( hotkey_name, "Add Seconds Set 3 " .. filename(), hotkey_send_sec_add_3 );
	local hotkey_save_array_sec_add_3 = obs.obs_data_get_array( settings, "sec_add_3_hotkey" );
	obs.obs_hotkey_load( hotkey_id_sec_add_3, hotkey_save_array_sec_add_3 );
	obs.obs_data_array_release( hotkey_save_array_sec_add_3 );
	--[[
		script is loading. register and assign hotkeys 
		
		Add Seconds to Timer
	]]
	hotkey_name = "sec_sub_1_" .. filename():lower():gsub("[%W%p%c%s]", "");
	hotkey_id_sec_sub_1 = obs.obs_hotkey_register_frontend( hotkey_name, "Subtract Seconds Set 1 " .. filename(), hotkey_send_sec_sub_1 );
	local hotkey_save_array_sec_sub_1 = obs.obs_data_get_array( settings, "sec_sub_1_hotkey" );
	obs.obs_hotkey_load( hotkey_id_sec_sub_1, hotkey_save_array_sec_sub_1 );
	obs.obs_data_array_release( hotkey_save_array_sec_sub_1 );
	--[[
		script is loading. register and assign hotkeys 
		
		Add Seconds to Timer
	]]
	hotkey_name = "sec_sub_2_" .. filename():lower():gsub("[%W%p%c%s]", "");
	hotkey_id_sec_sub_2 = obs.obs_hotkey_register_frontend( hotkey_name, "Subtract Seconds Set 2 " .. filename(), hotkey_send_sec_sub_2 );
	local hotkey_save_array_sec_sub_2 = obs.obs_data_get_array( settings, "sec_sub_2_hotkey" );
	obs.obs_hotkey_load( hotkey_id_sec_sub_2, hotkey_save_array_sec_sub_2 );
	obs.obs_data_array_release( hotkey_save_array_sec_sub_2 );
	--[[
		script is loading. register and assign hotkeys 
		
		Add Seconds to Timer
	]]
	hotkey_name = "sec_sub_3_" .. filename():lower():gsub("[%W%p%c%s]", "");
	hotkey_id_sec_sub_3 = obs.obs_hotkey_register_frontend( hotkey_name, "Subtract Seconds Set 3 " .. filename(), hotkey_send_sec_sub_3 );
	local hotkey_save_array_sec_sub_3 = obs.obs_data_get_array( settings, "sec_sub_3_hotkey" );
	obs.obs_hotkey_load( hotkey_id_sec_sub_3, hotkey_save_array_sec_sub_3 );
	obs.obs_data_array_release( hotkey_save_array_sec_sub_3 );
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
	debug_log( 'script_load(' .. pre_dump(settings) .. ') -- function variable names:  settings ' )
	local status = count_required_sources()
	debug_log( 'script_load sources ready (' .. pre_dump(status) .. ') ' )
	status = ( status ~= 0)
	obs.obs_data_set_bool( ctx.propsSet, "script_ready", status ); -- set to signal ready state.
	debug_log( 'script_load set script_ready (' .. pre_dump(status) .. ') ' )		
	--[[
		Get the correct frequency for splitseconds when the script loads. 
	]]
	assign_default_frequency();
	local sh = obs.obs_get_signal_handler();
	--[[
		attach event listener callback [loaded]
		for when a source is done loading.
	]]	
	obs.signal_handler_connect( sh, "source_load", loaded ); -- monitor for source load completed	
	obs.signal_handler_connect( sh, "source_deactivate", source_deactivated ); -- monitor source deactivates signal_handler_disconnect
	obs.signal_handler_connect( sh, "source_activate", source_activated ); -- monitor source activates
	--[[
		Adds a callback that will be called when a frontend event occurs. 
		See obs_frontend_event on what sort of events can be triggered.
	]]
	obs.obs_frontend_add_event_callback( on_event )
	
	--[[
		Define Hotkeys
	]]
	assign_hotkeys( settings, true )
	--[[
		If the user is not loading saved time, clear it
	]]	
end
--[[
--------------------------------------------------------------------
 custom function

	Adds a callback that will be called when a frontend event occurs.
	obslua.obs_frontend_add_event_callback(callback, private_data)
	obs.remove_current_callback()
	obslua.OBS_FRONTEND_EVENT_EXIT = 17
	obslua.OBS_FRONTEND_EVENT_FINISHED_LOADING = 26
	obslua.OBS_FRONTEND_EVENT_PREVIEW_SCENE_CHANGED = 24
	obslua.OBS_FRONTEND_EVENT_PROFILE_CHANGED = 15
	obslua.OBS_FRONTEND_EVENT_PROFILE_LIST_CHANGED = 16
	obslua.OBS_FRONTEND_EVENT_RECORDING_PAUSED = 27
	obslua.OBS_FRONTEND_EVENT_RECORDING_STARTED = 5
	obslua.OBS_FRONTEND_EVENT_RECORDING_STARTING = 4
	obslua.OBS_FRONTEND_EVENT_RECORDING_STOPPED = 7
	obslua.OBS_FRONTEND_EVENT_RECORDING_STOPPING = 6
	obslua.OBS_FRONTEND_EVENT_RECORDING_UNPAUSED = 28
	obslua.OBS_FRONTEND_EVENT_REPLAY_BUFFER_STARTED = 19
	obslua.OBS_FRONTEND_EVENT_REPLAY_BUFFER_STARTING = 18
	obslua.OBS_FRONTEND_EVENT_REPLAY_BUFFER_STOPPED = 21
	obslua.OBS_FRONTEND_EVENT_REPLAY_BUFFER_STOPPING = 20
	obslua.OBS_FRONTEND_EVENT_SCENE_CHANGED = 8
	obslua.OBS_FRONTEND_EVENT_SCENE_COLLECTION_CHANGED = 13
	obslua.OBS_FRONTEND_EVENT_SCENE_COLLECTION_CLEANUP = 25
	obslua.OBS_FRONTEND_EVENT_SCENE_COLLECTION_LIST_CHANGED = 14
	obslua.OBS_FRONTEND_EVENT_SCENE_LIST_CHANGED = 9
	obslua.OBS_FRONTEND_EVENT_STREAMING_STARTED = 1
	obslua.OBS_FRONTEND_EVENT_STREAMING_STARTING = 0
	obslua.OBS_FRONTEND_EVENT_STREAMING_STOPPED = 3
	obslua.OBS_FRONTEND_EVENT_STREAMING_STOPPING = 2
	obslua.OBS_FRONTEND_EVENT_STUDIO_MODE_DISABLED = 23
	obslua.OBS_FRONTEND_EVENT_STUDIO_MODE_ENABLED = 22
	obslua.OBS_FRONTEND_EVENT_TRANSITION_CHANGED = 10
	obslua.OBS_FRONTEND_EVENT_TRANSITION_DURATION_CHANGED = 29
	obslua.OBS_FRONTEND_EVENT_TRANSITION_LIST_CHANGED = 12
	obslua.OBS_FRONTEND_EVENT_TRANSITION_STOPPED = 11
	obslua.OBS_FRONTEND_EVENT_SCRIPTING_SHUTDOWN = 
--------------------------------------------------------------------
]]
function on_event( event ) 
	debug_log( 'on_event( ' .. pre_dump(event) .. ' ) -- function variable names: event' )
	if event == obs.OBS_FRONTEND_EVENT_FINISHED_LOADING then
		debug_log( 'Event: Finished Loading' )
		init();	-- redudency
		if not load_saved_time then
			update_prop_settings_current_seconds( 0 ) -- update current time to last time in properties 
		end	
	elseif event == obs.OBS_FRONTEND_EVENT_SCENE_LIST_CHANGED then
		debug_log( 'Event: Scene List Changed' )
	elseif event == obs.OBS_FRONTEND_EVENT_SCENE_CHANGED then
		debug_log( 'Event: Scene Changed' )
		local current_scene_name = frontend_get_current_scene()	
		if timer_activation == 4 then 
			if timer_activation_source == current_scene_name then
				debug_log( 'Activate Timer: Scene Changed' )
				if timer_reset == 2 then reset( true ) end
				start( true )
			else
				debug_log( 'De-activate Timer: Scene Changed' )
				pause( true )
			end
		end
	elseif event == obs.OBS_FRONTEND_EVENT_RECORDING_STARTED then
		debug_log( 'Event: Recording Started' )	
		if timer_activation == 7 then 
			if timer_reset == 2 then reset( true ) end
			start( true )
		end
	elseif event == obs.OBS_FRONTEND_EVENT_RECORDING_PAUSED then
		debug_log( 'Event: Recording Paused' )
		if timer_activation == 7 then 
			pause( true )
		end
	elseif event == obs.OBS_FRONTEND_EVENT_RECORDING_UNPAUSED then
		debug_log( 'Event: Recording Unpaused' )
		if timer_activation == 7 then 
			start( true )
		end
	elseif event == obs.OBS_FRONTEND_EVENT_RECORDING_STOPPED then
		debug_log( 'Event: Recording Stopped' )
		if timer_activation == 7 then 
			pause( true )
		end
	elseif event == obs.OBS_FRONTEND_EVENT_STREAMING_STARTED then
		debug_log( 'Event: Streaming Started' )
		if timer_activation == 8 then 
			if timer_reset == 2 then reset( true ) end
			start( true )
		end	
	elseif event == obs.OBS_FRONTEND_EVENT_STREAMING_STOPPED then
		debug_log( 'Event: Streaming Stopped' )	
		if timer_activation == 8 then 
			pause( true )
		end
	elseif event == obs.OBS_FRONTEND_EVENT_EXIT then
	elseif event == obs.OBS_FRONTEND_EVENT_SCRIPTING_SHUTDOWN then
	elseif event == obs.OBS_FRONTEND_EVENT_SCENE_COLLECTION_CLEANUP then
	end	
end
