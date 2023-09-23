--[[
----------------------------------------------------------
Open Broadcaster Software®️
OBS > Tools > Scripts
@midnight-studios

Simple Source Search Tool
----------------------------------------------------------

***************************************************************************************************************************************
Version 0.7

Published / Released: 2023-09-24 01:05

NEW FEATURES

- Json Tree output
- Text File output

OPTIMIZATION

- 

USER EXPERIENCE & FEATURE ENHANCEMENTS

- 

BUGS

- 


***************************************************************************************************************************************
]]
--Globals
obs           				= obslua
icon="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAACXBIWXMAAAsTAAALEwEAmpwYAAAF8WlUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNi4wLWMwMDIgNzkuMTY0NDYwLCAyMDIwLzA1LzEyLTE2OjA0OjE3ICAgICAgICAiPiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtbG5zOmRjPSJodHRwOi8vcHVybC5vcmcvZGMvZWxlbWVudHMvMS4xLyIgeG1sbnM6cGhvdG9zaG9wPSJodHRwOi8vbnMuYWRvYmUuY29tL3Bob3Rvc2hvcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZUV2ZW50IyIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgMjEuMiAoV2luZG93cykiIHhtcDpDcmVhdGVEYXRlPSIyMDIxLTEwLTE3VDAwOjI2OjI2KzEzOjAwIiB4bXA6TW9kaWZ5RGF0ZT0iMjAyMS0xMC0xN1QxNzo1NzozNisxMzowMCIgeG1wOk1ldGFkYXRhRGF0ZT0iMjAyMS0xMC0xN1QxNzo1NzozNisxMzowMCIgZGM6Zm9ybWF0PSJpbWFnZS9wbmciIHBob3Rvc2hvcDpDb2xvck1vZGU9IjMiIHBob3Rvc2hvcDpJQ0NQcm9maWxlPSJzUkdCIElFQzYxOTY2LTIuMSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDplNTkyOWZiYS0yYzA4LTI1NDYtOTdlMC0zZDBjZjZiNWZjNmUiIHhtcE1NOkRvY3VtZW50SUQ9ImFkb2JlOmRvY2lkOnBob3Rvc2hvcDpmMjMyODU5MC03YTQ2LTVlNDItOGM4Ni1iMjZkZGVmMTA4Y2UiIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDoxZWJmNWY5Mi1kNDg5LWU0NDQtOTFlNi05MTcwOTFkODYyMDciPiA8eG1wTU06SGlzdG9yeT4gPHJkZjpTZXE+IDxyZGY6bGkgc3RFdnQ6YWN0aW9uPSJjcmVhdGVkIiBzdEV2dDppbnN0YW5jZUlEPSJ4bXAuaWlkOjFlYmY1ZjkyLWQ0ODktZTQ0NC05MWU2LTkxNzA5MWQ4NjIwNyIgc3RFdnQ6d2hlbj0iMjAyMS0xMC0xN1QwMDoyNjoyNisxMzowMCIgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWRvYmUgUGhvdG9zaG9wIDIxLjIgKFdpbmRvd3MpIi8+IDxyZGY6bGkgc3RFdnQ6YWN0aW9uPSJzYXZlZCIgc3RFdnQ6aW5zdGFuY2VJRD0ieG1wLmlpZDplNTkyOWZiYS0yYzA4LTI1NDYtOTdlMC0zZDBjZjZiNWZjNmUiIHN0RXZ0OndoZW49IjIwMjEtMTAtMTdUMTc6NTc6MzYrMTM6MDAiIHN0RXZ0OnNvZnR3YXJlQWdlbnQ9IkFkb2JlIFBob3Rvc2hvcCAyMS4yIChXaW5kb3dzKSIgc3RFdnQ6Y2hhbmdlZD0iLyIvPiA8L3JkZjpTZXE+IDwveG1wTU06SGlzdG9yeT4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4jcxTwAAAJbklEQVR4nO2de7BWVRmHn8M5HgIOoGiQDBSm2UheaKxRC4qL3XTKsoS0suliFycluxjWlKlTOhmkTaGV+UeWmmk4xmSZoxDJhJQNHaQwKIoGlFIuCnIRTn/8zjd8Z5+19rfX2mvvbzWsZ8YB1r6s95zf3nu9613vu+zo6+sjEQ9D2m1AYiBJkMhIgkRGEiQykiCRkQSJjCRIZCRBIiMJEhlJkMjocjl5y1NPVWHDCcA04GTgOGAS8GJgFLJvO7AD2AisBZ4AHgEeBfZUYVBoxo4b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"
desc	    				= [[
<hr/><center><h2>Find Source Location</h2>(Version: %s)</center>
<br><center><img width=50 height=50 src=']] .. icon .. [['/></center>
<br><center><a href="https://github.com/midnight-studios/obs-lua/blob/main/find-source-location.lua">Find it on GitHub</a></center>
<br><p>Find Source location and display results.</p><p>Find help on the <a href=
"https://obsproject.com/forum/resources/source-search-helper.1380/">
OBS Forum Thread</a>.</p><hr/></p>]]
gversion = 0.7
--  global context information
local ctx = {
    propsDef    = nil,  -- property definition
    propsDefSrc = nil,  -- property definition (source scene)
    propsSet    = nil,  -- property settings (model)
    propsVal    = {},   -- property values
    propsValSrc = nil,  -- property values (first source scene)
}
output_folder				= ""
source_name   				= ""
source_type					= ""
filter_type   				= ""
search_param				= 1
list_all 					= "List Everything"
goto 						= false
print_log			 		= false
output_json	 			= false
output_results	 			= false
search			 			= false
output_file_name 					= "-data ($date_stamp).json";
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
	if type( input ) ~= "table" then
	  return tostring( input )
	else
	  local tbl = {}
	  for key, value in pairs( input ) do
		local keyStr = ( type( key ) ~= "number" ) and "'" .. key .. "'" or tostring( key )
		tbl[#tbl + 1] = "[" .. keyStr .. "] = " .. "'" .. pre_dump( value ) .. "'"
	  end
	  return "{ " .. table.concat( tbl, ", " ) .. " }"
	end
  end
--[[
----------------------------------------------------------
--	If testing and log event writing is needed
----------------------------------------------------------
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
----------------------------------------------------------
----------------------------------------------------------
]]
function script_description()
	return string.format( desc, tostring( gversion ) )
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
	Description:	Convert data to file
	
	Credit:			midnight-studios, et al
	Modified:		Yes, custom params to suit targeted need
	function:		
	type:			Support
	input type: 	OBS data (Settings)
	returns:		json file
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function write_to_file( file_type, content, user_path, output_file_name )
	output_file_name = output_file_name or "Search Results"
	content = content or string.format( "%s [%s]\n", output_file_name, os.date("%Y-%m-%d_%H.%M.%S"))
	local file_name = string.format( "Script [%s]-%s [%s]%s", filename(), output_file_name, os.date("%Y-%m-%d_%H.%M.%S"), "." .. file_type );
	-- set output path as the script path by default
	local script_path = script_path();
	local output_path = script_path .. file_name;
	-- if specified output path exists, then set this as the new output path
	if user_path ~= "" then
		output_path = user_path .. "/" .. file_name;
	else
		output_path = script_path .. file_name;
	end
	output_path = output_path:gsub( [[\]], "/" );	
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
----------------------------------------------------------
----------------------------------------------------------
]]
function tableToObsData(myTable)
    -- Create an OBS data object
    local data = obs.obs_data_create()
    -- Check if the data object was created successfully
    if data then
        -- Loop through the table and add key-value pairs to OBS data
        for key, value in pairs(myTable) do
            if type(value) == "string" then
                obs.obs_data_set_string(data, key, value)
            elseif type(value) == "boolean" then
                obs.obs_data_set_bool(data, key, value)
            elseif type(value) == "number" then
                obs.obs_data_set_int(data, key, value)
            elseif type(value) == "table" then
                -- If the value is a nested table, recursively convert it to OBS data
                local nestedData = tableToObsData(value)
                obs.obs_data_set_obj(data, key, nestedData)
                -- Don't forget to release the nested OBS data object when done
                obs.obs_data_release(nestedData)
            else
                -- Handle other data types as needed
                print("Unsupported data type for key: " .. pre_dump(key) .. " " .. pre_dump(type(value)) )
            end
        end
        -- Return the OBS data object
        return data
    else
        print("Failed to create OBS data object")
        return nil
    end
end
--[[
----------------------------------------------------------
----------------------------------------------------------
]]
function script_properties()
	local list = {}
	ctx.propsDef = obs.obs_properties_create()
    local notice = obs.obs_properties_add_text( ctx.propsDef, "statusMessage", "Results:", obs.OBS_TEXT_MULTILINE )
	local property_sf = obs.obs_properties_add_list( ctx.propsDef, "source_type", "Source Type", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING )
	obs.obs_property_list_add_string( property_sf, list_all, list_all )	
	local source_list = get_source_list( )
	local temp_source_list = remove_duplicates( source_list )
	for key, value in pairsByKeys( temp_source_list ) do
		obs.obs_property_list_add_string( property_sf, value, value )
	end
	local property_ff = obs.obs_properties_add_list( ctx.propsDef, "filter_type", "Filter Type", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING )
		obs.obs_property_list_add_string( property_ff, list_all, list_all )	
		list = {}
		for key, value in pairsByKeys( source_list ) do
			f_source = obs.obs_get_source_by_name( key )				
			local filters = obs.obs_source_enum_filters( f_source )
			obs.obs_source_release( f_source )
			for _, f in pairs( filters ) do
				filter_name = obs.obs_source_get_name( f ) 
				filter_id = obs.obs_source_get_id( f )
				filter_display_name = obs.obs_source_get_display_name( filter_id )
				if filter_display_name ~= nil then
					list[filter_display_name] = filter_display_name
				end
			end
		end
		list = remove_duplicates( list )
		for key, value in pairsByKeys( list ) do
			obs.obs_property_list_add_string( property_ff, value, value )
		end
	
	list = {}
	local property_sn = obs.obs_properties_add_list( ctx.propsDef, "source_name", "Source Name", obs.OBS_COMBO_TYPE_EDITABLE, obs.OBS_COMBO_FORMAT_STRING )
	obs.obs_property_list_add_string( property_sn, "Select", "Select" )	
	obs.obs_property_list_add_string( property_sn, list_all, list_all )	
	
	local sources = obs.obs_enum_sources()
	if sources ~= nil then
		for _, source in ipairs( sources ) do
			local name = obs.obs_source_get_name( source )
			list[name] = name
		end	
		for key, value in pairsByKeys( list ) do
			obs.obs_property_list_add_string( property_sn, value, value )
		end
	end	
	
	local property_sp = obs.obs_properties_add_list( ctx.propsDef, "search_param", "Search Params", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT )	
	t_type = {"Sources", "Filters", "Sources & Filters"}
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( property_sp, v, i ) end
	 --[[
		Property Directory Path: User interaction that select a directory path.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
		 
		This property is referenced to trigger an onchange event listener.
	]]
	local property_of = obs.obs_properties_add_path( ctx.propsDef, "output_folder", "Output Folder", obs.OBS_PATH_DIRECTORY, nil, nil);

	obs.obs_properties_add_bool( ctx.propsDef, "goto", "Activate Found Scene" )
	local property_or = obs.obs_properties_add_bool( ctx.propsDef, "output_results", "Output results to text file" )
	local property_oj = obs.obs_properties_add_bool( ctx.propsDef, "output_json", "Output Json tree" )
	obs.obs_properties_add_bool( ctx.propsDef, "print_log", "Output results to Script Log" )
	obs.source_list_release( sources )
	
	obs.obs_properties_add_button( ctx.propsDef, "search", "Search", doSearch )
	
  	obs.obs_property_set_modified_callback( property_oj, property_onchange )
  	obs.obs_property_set_modified_callback( property_or, property_onchange )
  	obs.obs_property_set_modified_callback( property_sf, property_onchange )
  	obs.obs_property_set_modified_callback( property_sn, property_onchange )
  	obs.obs_property_set_modified_callback( property_sp, property_onchange )
  	obs.obs_property_set_modified_callback( property_ff, property_onchange )
	-- Calls the callback once to set-up current visibility
  	obs.obs_properties_apply_settings( ctx.propsDef, script_setting )
	return ctx.propsDef
end
--[[
----------------------------------------------------------
----------------------------------------------------------
]]
function script_defaults( settings )
	obs.obs_data_set_default_bool( settings, "output_json", false )
	obs.obs_data_set_default_bool( settings, "output_results", false )
	obs.obs_data_set_default_bool( settings, "goto", false )
	obs.obs_data_set_default_bool( settings, "print_log", false )
	obs.obs_data_set_default_string( settings, "source_name", list_all )
	obs.obs_data_set_default_string( settings, "source_type", list_all )
	obs.obs_data_set_default_string( settings, "filter_type", list_all )
    obs.obs_data_set_default_string( settings, "statusMessage", "" )
    obs.obs_data_set_default_int( settings, "search_param", 1 )
end
--[[
----------------------------------------------------------
----------------------------------------------------------
]]
function script_update( settings )
    --  remember settings
    ctx.propsSet = settings
	output_folder = obs.obs_data_get_string( settings, "output_folder" );
	source_name = obs.obs_data_get_string( settings, "source_name" )
	source_type = obs.obs_data_get_string( settings, "source_type" )
	search_param = obs.obs_data_get_int( settings, "search_param" )
	filter_type = obs.obs_data_get_string( settings, "filter_type" )
    goto = obs.obs_data_get_bool( settings, "goto" )
    output_json = obs.obs_data_get_bool( settings, "output_json" )
    output_results = obs.obs_data_get_bool( settings, "output_results" )
    print_log = obs.obs_data_get_bool( settings, "print_log" )
    ctx.propsVal.statusMessage = obs.obs_data_get_string( settings, "statusMessage" )
end
--[[
----------------------------------------------------------
Callback on list modification
----------------------------------------------------------
]]
function property_onchange( props, property, settings )
	--[[
			if the user modifies a search setting then reset the Result Notice
	
	]]
	if not search then
   		obs.obs_data_set_string( settings, "statusMessage", "" )
	else
		-- Got the search request ( Button clicked ) do noting.
		 -- IMPORTANT: returns true to trigger refresh of the properties
  		return true
	end
	local prop_name = obs.obs_property_name( property )
	local prop_val = obs.obs_data_get_string( settings, prop_name )
	local prop = obs.obs_properties_get( props, prop_name )
	--obs.obs_data_set_string( settings, "statusMessage", "" )
	local source_type = obs.obs_data_get_string( ctx.propsSet, "source_type" )
	local filter_type = obs.obs_data_get_string( ctx.propsSet, "filter_type" )
	local search_param = obs.obs_data_get_int( ctx.propsSet, "search_param" )
	local src_name = obs.obs_data_get_string( ctx.propsSet, "source_name" )
	local output_folder_props = obs.obs_properties_get( props, "output_folder" )
	local source_name_props = obs.obs_properties_get( props, "source_name" )
	local filter_type_props = obs.obs_properties_get( props, "filter_type" )
	obs.obs_property_set_visible( output_folder_props, output_results or output_json )
	obs.obs_property_set_visible( filter_type_props, ( search_param == 2) )
	obs.obs_property_list_clear( source_name_props )
	obs.obs_property_list_add_string( source_name_props, list_all, list_all )
	if prop_name == "source_type" then
		obs.obs_data_set_string( settings, "filter_type", list_all ) -- Don't allow timer and active text source to be the same
		obs.obs_data_set_string( settings, "source_name", list_all ) -- Don't allow timer and active text source to be the same
	end	
	if prop_name == "filter_type" then
		obs.obs_data_set_string( settings, "source_name", list_all ) -- Don't allow timer and active text source to be the same
	end
	local list = {}

	local source_list = get_source_list( )
	--source_list = remove_duplicates( source_list )
	for key, value in pairsByKeys( source_list ) do
		
		source = obs.obs_get_source_by_name( key )
		
		if source ~= nil then
				local name = obs.obs_source_get_name( source )
				local id = obs.obs_source_get_id( source )
				local display_name = obs.obs_source_get_display_name( id )
				if source_type ~= list_all then
					if display_name == source_type then	
						if filter_type ~= list_all then
							local filters = obs.obs_source_enum_filters( source )
							local found_filter = false
							for _, f in pairs( filters ) do
								filter_name = obs.obs_source_get_name( f ) 
								filter_id = obs.obs_source_get_id( f )
								filter_display_name = obs.obs_source_get_display_name( filter_id )
								if filter_display_name == filter_type then
									if not found_filter then
										list[name] = name
									end	
									found_filter = true -- if this sources has one or more match we stop the search
								end	
							end	
						else
							list[name] = name
						end
					end	
				else
					if filter_type ~= list_all then
						local filters = obs.obs_source_enum_filters( source )
						for _, f in pairs( filters ) do
							filter_name = obs.obs_source_get_name( f ) 
							filter_id = obs.obs_source_get_id( f )
							filter_display_name = obs.obs_source_get_display_name( filter_id )
							if filter_display_name == filter_type then
								list[name] = name
								break -- if this sources has one or more match we stop the search
							end	
						end	
					else
						list[name] = name
					end				
				end	
		end	
		obs.obs_source_release( source )
	end
	
	for key, value in pairsByKeys( list ) do
		obs.obs_property_list_add_string( source_name_props, value, value )
	end
	--obs.obs_property_set_visible( obs.obs_properties_get( props, "action_button" ), true )
  -- IMPORTANT: returns true to trigger refresh of the properties
  return true
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
    --  clear status message
    obs.obs_data_set_string( settings, "statusMessage", "" )

    --  react on scene list changes
    obs.obs_frontend_add_event_callback( function ( event )
        if event == obs.OBS_FRONTEND_EVENT_SCENE_LIST_CHANGED then
				--print('OBS_FRONTEND_EVENT_SCENE_LIST_CHANGED')
        end
        return true
    end )
end
--[[
----------------------------------------------------------
	This is basically obs.obs_enum_sources()
	but 'Nested Scenes' are not listed in "obs.obs_enum_sources()"
TODO> 
----------------------------------------------------------
]]
function get_source_list( )
	local scenes = obs.obs_frontend_get_scenes()
	local s_list = {}
    if scenes ~= nil then
        for key_scenesource, value_scenesource in pairs( scenes ) do
            local scenename = obs.obs_source_get_name( value_scenesource )
            local scene = obs.obs_scene_from_source( value_scenesource )
            local sceneitems = obs.obs_scene_enum_items( scene )
            for key_sceneitem, value_sceneitem in pairs( sceneitems ) do
                local source = obs.obs_sceneitem_get_source( value_sceneitem )
				local source_name_parent = obs.obs_source_get_name( source )
				local group = obs.obs_group_from_source( source )
				local id_parent = obs.obs_source_get_id( source )
				local display_name_parent = obs.obs_source_get_display_name( id_parent )
				s_list[source_name_parent] = display_name_parent					
				if group ~= nil then
					local groupitems = obs.obs_scene_enum_items( group )	
					if groupitems ~= nil then
						for key_groupitem, value_groupitem in pairs( groupitems ) do
							local groupitemsource = obs.obs_sceneitem_get_source( value_groupitem )
							local source_name_group = obs.obs_source_get_name( groupitemsource )
							local id_group = obs.obs_source_get_id( groupitemsource )
							local display_name_group = obs.obs_source_get_display_name( id_group )	
							s_list[source_name_group] = display_name_group			
						end
						obs.sceneitem_list_release( groupitems )
					end
				end	
            end 
            obs.sceneitem_list_release( sceneitems )
		end 	
        obs.source_list_release( scenes )
    end
	return s_list
end
--[[
----------------------------------------------------------
helper function: set status message
----------------------------------------------------------
]]
local function statusMessage( message )
	local l = 1
	message = "1 |"..string.gsub( message, "\n", function( s ) l = l + 1 return s..l.." |" end )
	if print_log then log( 'Results:', '\n' .. message ) end
	obs.obs_data_set_string( ctx.propsSet, "statusMessage", string.format( "%s", message ) )
	obs.obs_properties_apply_settings( ctx.propsDef, ctx.propsSet )
	return true
end
--[[
----------------------------------------------------------

----------------------------------------------------------
]]
function export_table_to_json( tbl )

	local user_path = ""
	local file_type = "json"
	output_file_name = output_file_name or "Search Results"
	
	local file_name = string.format( "Script [%s]-%s [%s]%s", filename(), output_file_name, os.date("%Y-%m-%d_%H.%M.%S"), "." .. file_type );
	-- set output path as the script path by default
	local script_path = script_path();
	local output_path = script_path .. file_name;
	-- if specified output path exists, then set this as the new output path
	if user_path ~= "" then
		output_path = user_path .. "/" .. file_name;
	else
		output_path = script_path .. file_name;
	end
	output_path = output_path:gsub( [[\]], "/" );	

	obs.obs_data_save_json( tableToObsData(tbl), output_path );
end
--[[
----------------------------------------------------------
see https://vanya.jp.net/vtree/
http://develop.agustingandara.com/public/services/uml/
https://jsoncrack.com/editor
----------------------------------------------------------
]]

function getSourcesTable()
	
    local scenes = obs.obs_frontend_get_scenes()
    local source_list = {}

    local function iterate_filters(filters)
        local filter_data = {}
        for _, f in pairs(filters) do
            local filter_name = obs.obs_source_get_name(f)
            local filter_id = obs.obs_source_get_id(f)
            local filter_display_name = obs.obs_source_get_display_name(filter_id)
            
            local filter_info = {
                filter_name = filter_name,
                filter_id = filter_id,
                filter_display_name = filter_display_name
            }
            
            table.insert(filter_data, filter_info)
        end
        return filter_data
    end

    local function process_scene_items(scene_items)
        local scene_items_data = {}
        for _, scene_item_value in ipairs(scene_items) do
            local source = obs.obs_sceneitem_get_source(scene_item_value)
            local source_name_parent = obs.obs_source_get_name(source)
            local source_enabled = obs.obs_source_enabled(source)
            local group = obs.obs_group_from_source(source)
            local id_parent = obs.obs_source_get_id(source)
            local unversioned_id_parent = obs.obs_source_get_unversioned_id(source)
            local display_name_parent = obs.obs_source_get_display_name(id_parent)
            local type_parent = obs.obs_source_get_type(source)
            local filter_count = obs.obs_source_filter_count(source)
            local filters = obs.obs_source_enum_filters(source)

            local source_info = {
                position = group and "group" or "source",
                nested_scene = (type_parent == obs.OBS_SOURCE_TYPE_SCENE and not group ),
                type = type_parent,
                id = id_parent,
                unversioned_id = unversioned_id_parent,
                display_name = display_name_parent,
                source_name = source_name_parent,
                source_enabled = source_enabled,
                filter_count = filter_count,
                filters = iterate_filters(filters),
                sources = {},
				children = 0
            }

            table.insert(scene_items_data, source_info)

            if group then
                local group_items = obs.obs_scene_enum_items(group)

                if group_items then
                    source_info.sources = process_scene_items(group_items)
					
					source_info.children = #group_items,
                    obs.sceneitem_list_release(group_items)
                end
            end
        end
        return scene_items_data
    end

    if scenes then
        for _, scene_source in pairs(scenes) do
            local scene = obs.obs_scene_from_source(scene_source)
            local scene_items = obs.obs_scene_enum_items(scene)
            local scene_source_name = obs.obs_source_get_name(scene_source)
            local source_enabled = obs.obs_source_enabled(scene_source)
            local id_scene = obs.obs_source_get_id(scene_source)
            local unversioned_id_scene = obs.obs_source_get_unversioned_id(scene_source)
            local display_name_scene = obs.obs_source_get_display_name(id_scene)
            local type_scene = obs.obs_source_get_type(scene_source)
            local filter_count = obs.obs_source_filter_count(scene_source)
            local filters = obs.obs_source_enum_filters(scene_source)
            local source_info = {
                position = "scene",
                nested_scene = false,
                type = type_scene,
                id = id_scene,
                unversioned_id = unversioned_id_scene,
                display_name = display_name_scene,
                source_name = scene_source_name,
                source_enabled = source_enabled,
                source_name_parent = "collection",
                children = #scene_items,
                filter_count = filter_count,
                filters = iterate_filters(filters),
                sources = process_scene_items(scene_items)  -- Nest scene items data
            }

            obs.sceneitem_list_release(scene_items)

            table.insert(source_list, source_info)
        end
        obs.source_list_release(scenes)
    end

    return source_list
end

--[[
----------------------------------------------------------

	--obs_filter_get_parent (C function)
	--obs_filter_get_target (C function)
	--obs_enum_filter_types (C function)
	-- obs_source_enum_filters (C function)
	--obs_source_filter_count (C function)
	--obs_source_enum_filters
	--obs_source_get_filter_by_name (C function)

TODO> found_scenename = scenename
----------------------------------------------------------
]]
function doSearch( do_search )
	if not do_search then search = false else search = true end
	local include_results = true
	local prefix_results = ""
	local results = ""
	local results_2 = ""
	local filter_name = ""
	local found_scenename = nil
	local scenes = obs.obs_frontend_get_scenes()
	local filters_found = 0
	local sources_found = 0



    -- Create a table for results
    local results_3 = {
        searchRequested = os.date("%Y-%m-%d %H:%M:%S"),
        sources = {},
        filters = {}
    }





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
            for key_sceneitem, value_sceneitem in pairs( sceneitems ) do
				
                local source = obs.obs_sceneitem_get_source( value_sceneitem )
				local source_name_parent = obs.obs_source_get_name( source )
                local filter_count = obs.obs_source_filter_count( source )
				local group = obs.obs_group_from_source( source )
				local id_parent = obs.obs_source_get_id( source )
				local display_name_parent = obs.obs_source_get_display_name( id_parent )
				local fi = 0					
				
				local include_results = true
				if source_type ~= list_all then
					include_results = false
					if display_name_parent == source_type then
						include_results = true
					end	
				end	
				--[[

						source_name is the value we are searching for
				]]		
				if source_name == source_name_parent then
					--[[
							search param 1 = Search Sources
					]]
					if search_param == 1 then
						
						--[[
							Save for later
						]]		
						found_scenename = scenename					
						
						if results ~= "" then 
								results = string.format( '%s<Source:"%s"[Type: %s]> found in <Scene:"%s">%s', results, tostring( source_name_parent ), tostring( display_name_parent ), tostring( scenename ), "\n" )
								results_2 = string.format( '%s<Source:"%s"{%s}> <Scene:"%s">%s', results_2, tostring( source_name_parent ), tostring( display_name_parent ), tostring( scenename ), "\n" )
								sources_found = sources_found + 1
						else 
								results = string.format('<Source:"%s"[Type: %s]> found in <Scene:"%s">%s', tostring( source_name_parent ), tostring( display_name_parent ), tostring( scenename ), "\n" )
								results_2 = string.format('<Source:"%s"{%s}> <Scene:"%s">%s', tostring( source_name_parent ), tostring( display_name_parent ), tostring( scenename ), "\n" )
								sources_found = sources_found + 1
						end
						table.insert(results_3.sources, {sourceName = source_name_parent, sourceType = display_name_parent, sceneName = scenename  }) -- Add source results to the table
					--[[
							search param 2 = Search Filters
							search param 3 = Search Sources and Filters	
					]]								
					else 
						if search_param ~= 2 then
							found_scenename = scenename
							if results ~= "" then 
								results = string.format( '%s< Source:  "%s" [Type: %s] [filters: %s] > found in < Scene:  "%s" >%s', results, tostring( source_name_parent ), tostring( display_name_parent ), filter_count, tostring( scenename ), "\n" )
								results_2 = string.format( '%s< Source:  "%s" {%s} [filters: %s] > ... < Scene:  "%s" >%s', results_2, tostring( source_name_parent ), tostring( display_name_parent ), filter_count, tostring( scenename ), "\n" )
								sources_found = sources_found + 1
							else 
								results = string.format( '< Source:  "%s" [Type: %s] [filters: %s] > found in < Scene:  "%s" >%s', tostring( source_name_parent ), tostring( display_name_parent ), filter_count, tostring( scenename ), "\n" )
								results_2 = string.format( '< Source:  "%s" {%s} [filters: %s] > ... < Scene:  "%s" >%s', tostring( source_name_parent ), tostring( display_name_parent ), filter_count, tostring( scenename ), "\n" )
								sources_found = sources_found + 1
							end	
							table.insert(results_3.sources, {sourceName = source_name_parent, sourceType = display_name_parent, sceneName = scenename, filtersApplied = filter_count  }) -- Add source results to the table			
						end
						local filters = obs.obs_source_enum_filters( source )
						fi = 0
						--[[
						
						
						]]
						for _, f in pairs( filters ) do							
							fi = fi + 1
							filter_name = obs.obs_source_get_name( f ) 
							filter_id = obs.obs_source_get_id( f )
							filter_display_name = obs.obs_source_get_display_name( filter_id )		
							if filter_type ~= list_all then
								if filter_display_name == filter_type then
									found_scenename = scenename
									results = string.format( '%s< Filter:  %s (%s) > added to < Source:  "%s" [Type: %s] > found in < Scene:  "%s" >%s', results, tostring( filter_name ), tostring( filter_display_name ), tostring( source_name_parent ), tostring( display_name_parent ), tostring( scenename ), "\n" )
									results_2 = string.format( '%s< Filter:  %s (%s) > ... < Source:  "%s" {%s} > ... < Scene:  "%s" >%s', results_2, tostring( filter_name ), tostring( filter_display_name ), tostring( source_name_parent ), tostring( display_name_parent ), tostring( scenename ), "\n" )
									filters_found = filters_found + 1
								end
							else
								found_scenename = scenename
								results = string.format( '%s< Filter:  %s (%s) > added to < Source:  "%s" [Type: %s] > found in < Scene:  "%s" >%s', results, tostring( filter_name ), tostring( filter_display_name ), tostring( source_name_parent ), tostring( display_name_parent ), tostring( scenename ), "\n")
								results_2 = string.format( '%s< Filter:  %s (%s) > ... < Source:  "%s" {%s} > ... < Scene:  "%s" >%s', results_2, tostring( filter_name ), tostring( filter_display_name ), tostring( source_name_parent ), tostring( display_name_parent ), tostring( scenename ), "\n")
								filters_found = filters_found + 1
							end	
							--if fi == filter_count then results = string.format('%s%s%s', results, '.......','\n') end
						end -- end for in pairs( filters )
						obs.source_list_release( filters )
					end	 -- search_param == 1

				end	-- source_name == source_name_parent
				--[[


				]]
				if source_name == list_all then		
					if search_param == 1 then
						if include_results then 
							found_scenename = scenename
							results = string.format( '%s< Source:"%s" [Type: %s] > found in <Scene:"%s" >%s', results, tostring( source_name_parent ), tostring( display_name_parent ), tostring( scenename ), "\n" )
							results_2 = string.format( '%s< Source:"%s" {%s} > <Scene:"%s" >%s', results_2, tostring( source_name_parent ), tostring( display_name_parent ), tostring( scenename ), "\n" )
							sources_found = sources_found + 1
							table.insert(results_3.sources, {sourceName = source_name_parent, sourceType = display_name_parent, sceneName = scenename}) -- Add source results to the table	
						end 
					else
						if include_results then
							if search_param ~= 2 then
								found_scenename = scenename
								results = string.format( '%s< Source:  "%s" [Type: %s] [filters: %s] > found in < Scene:  "%s" >%s', results, tostring( source_name_parent ), tostring( display_name_parent ), filter_count, tostring( scenename ), "\n" )
								results_2 = string.format( '%s< Source:  "%s" {%s} [filters: %s] > ... < Scene:  "%s" >%s', results_2, tostring( source_name_parent ), tostring( display_name_parent ), filter_count, tostring( scenename ), "\n" )
								sources_found = sources_found + 1
								table.insert(results_3.sources, {sourceName = source_name_parent, sourceType = display_name_parent, sceneName = scenename, filtersApplied = filter_count  }) -- Add source results to the table	
							end		
							local filters = obs.obs_source_enum_filters( source )
							fi = 0
							for _, f in pairs( filters ) do						
								fi = fi + 1
								filter_name = obs.obs_source_get_name( f ) 
								filter_id = obs.obs_source_get_id( f )
								filter_display_name = obs.obs_source_get_display_name( filter_id )
								if filter_type ~= list_all then
									if filter_display_name == filter_type then
										found_scenename = scenename
										results = string.format( '%s< Filter:  %s (%s) > added to < Source:  "%s" {%s} > found in < Scene:  "%s" >%s', results, tostring( filter_name ), tostring( filter_display_name ), tostring( source_name_parent ), tostring( display_name_parent ), tostring( scenename ), "\n" )
										results_2 = string.format( '%s< Filter:  %s (%s) > ... < Source:  "%s" {%s} > ... < Scene:  "%s" >%s', results_2, tostring( filter_name ), tostring( filter_display_name ), tostring( source_name_parent ), tostring( display_name_parent ), tostring( scenename ), "\n" )
										filters_found = filters_found + 1
									end	
								else
									found_scenename = scenename	
									results = string.format( '%s< Filter:  %s (%s) > added to < Source:  "%s" {%s} > found in < Scene:  "%s" >%s', results, tostring( filter_name ), tostring( filter_display_name ), tostring( source_name_parent ), tostring( display_name_parent ), tostring( scenename ), "\n" )
									results_2 = string.format( '%s< Filter:  %s (%s) > ... < Source:  "%s" {%s} > ... < Scene:  "%s" >%s', results_2, tostring( filter_name ), tostring( filter_display_name ), tostring( source_name_parent ), tostring( display_name_parent ), tostring( scenename ), "\n" )
									filters_found = filters_found + 1
								end
								--if fi == filter_count then results = string.format('%s%s%s', results, '.......','\n') end
							end
							obs.source_list_release( filters )
						end
					end	-- search_param == 1
				end -- source_name == list_all
				if group ~= nil then
					local groupitems = obs.obs_scene_enum_items( group )	
					if groupitems ~= nil then
						for key_groupitem, value_groupitem in pairs( groupitems ) do
							local groupitemsource = obs.obs_sceneitem_get_source( value_groupitem )
							local source_name_group = obs.obs_source_get_name( groupitemsource )
							local id_group = obs.obs_source_get_id( groupitemsource )
							local display_name_group = obs.obs_source_get_display_name( id_group )
                			local grp_filter_count = obs.obs_source_filter_count( source )
							local grp_fi = 0	
							local include_group_results = true
							if source_type ~= list_all then
								include_group_results = false
								if display_name_group == source_type then
									include_group_results = true
								end	
							end	
							if source_name == source_name_group then
								if search_param == 1 then
										found_scenename = scenename
										results = string.format( '%s< Source:"%s"[Type: %s] > nested inside < Group:"%s" > found in < Scene:"%s" >%s', results, tostring( source_name_group ), tostring( display_name_group ), tostring( source_name_parent ), tostring( scenename ), "\n" )
										results_2 = string.format( '%s< Source:"%s"{%s} > < Group:"%s" > < Scene:"%s" >%s', results_2, tostring( source_name_group ), tostring( display_name_group ), tostring( source_name_parent ), tostring( scenename ), "\n" )
										sources_found = sources_found + 1
										table.insert(results_3.sources, {groupSourceName = source_name_group, sourceType = display_name_group, sceneName = scenename }) -- Add source results to the table	
								else 
									if search_param ~= 2 then
										found_scenename = scenename
										results = string.format( '%s< Source:  "%s" [Type: %s] [filters: %s] > nested inside < Group:  "%s" > found in < Scene:  "%s" >%s', results, tostring( source_name_group ), tostring( display_name_group ), grp_filter_count, tostring( source_name_parent ), tostring( scenename ), "\n" )
										results_2 = string.format( '%s< Source:  "%s" {%s} [filters: %s] > ... < Group:  "%s" > ... < Scene:  "%s" >%s', results_2, tostring( source_name_group ), tostring( display_name_group ), grp_filter_count, tostring( source_name_parent ), tostring( scenename ), "\n" )
										sources_found = sources_found + 1
										table.insert(results_3.sources, {sourceName = source_name_group, sourceType = display_name_group, sceneName = scenename, filtersApplied = grp_filter_count  }) -- Add source results to the table	
									end
									local filters = obs.obs_source_enum_filters( source )
									grp_fi = 0
									for _, f in pairs( filters ) do
										grp_fi = grp_fi + 1
										filter_name = obs.obs_source_get_name( f ) 
										filter_id = obs.obs_source_get_id( f )
										filter_display_name = obs.obs_source_get_display_name( filter_id )
										if filter_type ~= list_all then
											if filter_display_name == filter_type then
												found_scenename = scenename
												results = string.format( '%s< Filter:  %s (%s) > added to < Source:  "%s" [Type: %s] > nested inside < Group:  "%s" > found in < Scene:  "%s" >%s', results, tostring( filter_name ), tostring( filter_display_name ), tostring( source_name_group ), tostring( display_name_group ), tostring( source_name_parent ), tostring( scenename ), "\n" )
												results_2 = string.format( '%s< Filter:  %s (%s) > ... < Source:  "%s" {%s} > ... < Group:  "%s" > ... < Scene:  "%s" >%s', results_2, tostring( filter_name ), tostring( filter_display_name ), tostring( source_name_group ), tostring( display_name_group ), tostring( source_name_parent ), tostring( scenename ), "\n" )
												filters_found = filters_found + 1
											end	
										else
											found_scenename = scenename
											results = string.format( '%s< Filter:  %s (%s) > added to < Source:  "%s" [Type: %s] > nested inside < Group:  "%s" > ... < Scene:  "%s" >%s', results, tostring( filter_name ), tostring( filter_display_name ), tostring( source_name_group ), tostring( display_name_group ), tostring( source_name_parent ), tostring( scenename ), "\n" )
											results_2 = string.format( '%s< Filter:  %s (%s) > ... < Source:  "%s" {%s} > ... < Group:  "%s" > ... < Scene:  "%s" >%s', results_2, tostring( filter_name ), tostring( filter_display_name ), tostring( source_name_group ), tostring( display_name_group ), tostring( source_name_parent ), tostring( scenename ), "\n" )
											filters_found = filters_found + 1
										end	
									--if grp_fi == grp_filter_count then results = string.format('%s%s%s', results, '.......','\n') end
									end
									obs.source_list_release( filters )
								end			
							end
							if source_name == list_all then
								if search_param == 1 then
									if include_group_results then
										found_scenename = scenename
										results = string.format( '%s< Source:"%s" [Type: %s]> nested inside < Group:"%s" > found in < Scene:"%s" >%s', results, tostring( source_name_group ), tostring( display_name_group ), tostring( source_name_parent ), tostring( scenename ), "\n" )
										results_2 = string.format( '%s< Source:"%s" {%s}> < Group:"%s" > < Scene:"%s" >%s', results_2, tostring( source_name_group ), tostring( display_name_group ), tostring( source_name_parent ), tostring( scenename ), "\n" )
										sources_found = sources_found + 1
										table.insert(results_3.sources, {sourceName = source_name_group, sourceType = display_name_group, sceneName = scenename, filtersApplied = grp_filter_count  }) -- Add source results to the table	
									end	
								else
									if include_group_results then
										if search_param ~= 2 then
											found_scenename = scenename
											results = string.format( '%s< Source:  "%s" [Type: %s] [filters: %s] > nested inside < Group:  "%s" > found in < Scene:  "%s" >%s', results, tostring( source_name_group ), tostring( display_name_group ), grp_filter_count, tostring( source_name_parent ), tostring( scenename ), "\n" )
											results_2 = string.format( '%s< Source:  "%s" {%s} [filters: %s] > ... < Group:  "%s" > ... < Scene:  "%s" >%s', results_2, tostring( source_name_group ), tostring( display_name_group ), grp_filter_count, tostring( source_name_parent ), tostring( scenename ), "\n" )
											sources_found = sources_found + 1
										end	
										local filters = obs.obs_source_enum_filters( source )
										grp_fi = 0
										for _, f in pairs( filters ) do
											grp_fi = grp_fi + 1
											filter_name = obs.obs_source_get_name( f ) 
											filter_id = obs.obs_source_get_id( f )
											filter_display_name = obs.obs_source_get_display_name( filter_id )
											if filter_type ~= list_all then
												if filter_display_name == filter_type then
													found_scenename = scenename
													results = string.format( '%s< Filter:  %s (%s) > added to < Source:  "%s" [Type: %s] > nested inside < Group:  "%s" > found in < Scene:  "%s" >%s', results, tostring( filter_name ), tostring( filter_display_name ), tostring( source_name_group ), tostring( display_name_group ), tostring( source_name_parent ), tostring( scenename ), "\n" )
													results_2 = string.format( '%s< Filter:  %s (%s) > ... < Source:  "%s" {%s} > ... < Group:  "%s" > ... < Scene:  "%s" >%s', results_2, tostring( filter_name ), tostring( filter_display_name ), tostring( source_name_group ), tostring( display_name_group ), tostring( source_name_parent ), tostring( scenename ), "\n" )
													filters_found = filters_found + 1
												end
											else
												found_scenename = scenename
												results = string.format( '%s< Filter:  %s (%s) > added to < Source:  "%s" [Type: %s] > nested inside < Group:  "%s" > found in < Scene:  "%s" >%s', results, tostring( filter_name ), tostring( filter_display_name ), tostring( display_name_group ), tostring( source_name_group ), tostring( source_name_parent ), tostring( scenename ), "\n" )
												results_2 = string.format( '%s< Filter:  %s (%s) > ... < Source:  "%s" {%s} > ... < Group:  "%s" > ... < Scene:  "%s" >%s', results_2, tostring( filter_name ), tostring( filter_display_name ), tostring( display_name_group ), tostring( source_name_group ), tostring( source_name_parent ), tostring( scenename ), "\n" )
												filters_found = filters_found + 1
											end
										--if grp_fi == grp_filter_count then results = string.format('%s%s%s', results, '.......','\n') end	
										end
										obs.source_list_release( filters )										
									end	
										
								end
							end					
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


	]]
	if goto and found_scenename ~= nil then
		--[[


		]]
		if print_log then log( 'Activate last found scene: ', found_scenename ) end
		set_current_scene( found_scenename )
	end	
	--[[


	]]
	if results == "" then results = " Nothing Found" end
	--[[


	]]

	prefix_results = string.format( "Search Requested: %s \n", os.date("%Y-%m-%d %H:%M:%S") );

	prefix_results = search_param ~= 2 and prefix_results .. string.format( "Sources: %s \n", sources_found ) or prefix_results .. string.format( "Sources: %s \n", "Not requested or included in search results." ) ;
	
	prefix_results = search_param ~= 1 and prefix_results .. string.format( "Filers: %s \n", filters_found ) or prefix_results .. string.format( "Filers: %s \n", "Not requested or included in search results." ) ;

	results = prefix_results .. "\n".. results
	
	results_2 = prefix_results .. "\n".. results_2

	statusMessage( string.format( "%s", results_2 ) )
	if output_results then write_to_file( "txt", results, output_folder ); end
	search = false


	if output_json then 
		local sources_table = getSourcesTable()
		export_table_to_json( sources_table )
	end
	return true
end
--[[
----------------------------------------------------------
	Only used in Countdown mode
----------------------------------------------------------
]]
function set_current_scene( source_name )
		local source = obs.obs_get_source_by_name( source_name )
		if source ~= nil then
			obs.obs_frontend_set_current_scene( source )
		end
		obs.obs_source_release( source )
end	
--[[
----------------------------------------------------------
----------------------------------------------------------
]]
function remove_duplicates( t )
local hash = {}
local res = {}
for _,v in pairsByKeys( t ) do
   if ( not hash[v] ) then
       res[#res+1] = v -- you could print here instead of saving to result table if you wanted
       hash[v] = true
   end

end	
	return res
end	

--[[
----------------------------------------------------------
----------------------------------------------------------
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