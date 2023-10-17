--[[
----------------------------------------------------------
Open Broadcaster Software®️
OBS > Tools > Scripts
@midnight-studios

Simple Source Search Tool
----------------------------------------------------------

***************************************************************************************************************************************
Version 1.0

Published / Released: 2023-10-18 09:59

NEW FEATURES

- 

OPTIMIZATION

- 

USER EXPERIENCE & FEATURE ENHANCEMENTS

- Expanded Filter Search Parameter 
- Expanded Result Data
- Expanded Filter Data in json data

BUGS

- Fixed an issue where json data structure malformed.


***************************************************************************************************************************************
]]
--Globals
obs           				= obslua
local bit                   = require('bit')
icon="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAACXBIWXMAAAsTAAALEwEAmpwYAAAF8WlUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNi4wLWMwMDIgNzkuMTY0NDYwLCAyMDIwLzA1LzEyLTE2OjA0OjE3ICAgICAgICAiPiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtbG5zOmRjPSJodHRwOi8vcHVybC5vcmcvZGMvZWxlbWVudHMvMS4xLyIgeG1sbnM6cGhvdG9zaG9wPSJodHRwOi8vbnMuYWRvYmUuY29tL3Bob3Rvc2hvcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZUV2ZW50IyIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgMjEuMiAoV2luZG93cykiIHhtcDpDcmVhdGVEYXRlPSIyMDIxLTEwLTE3VDAwOjI2OjI2KzEzOjAwIiB4bXA6TW9kaWZ5RGF0ZT0iMjAyMS0xMC0xN1QxNzo1NzozNisxMzowMCIgeG1wOk1ldGFkYXRhRGF0ZT0iMjAyMS0xMC0xN1QxNzo1NzozNisxMzowMCIgZGM6Zm9ybWF0PSJpbWFnZS9wbmciIHBob3Rvc2hvcDpDb2xvck1vZGU9IjMiIHBob3Rvc2hvcDpJQ0NQcm9maWxlPSJzUkdCIElFQzYxOTY2LTIuMSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDplNTkyOWZiYS0yYzA4LTI1NDYtOTdlMC0zZDBjZjZiNWZjNmUiIHhtcE1NOkRvY3VtZW50SUQ9ImFkb2JlOmRvY2lkOnBob3Rvc2hvcDpmMjMyODU5MC03YTQ2LTVlNDItOGM4Ni1iMjZkZGVmMTA4Y2UiIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDoxZWJmNWY5Mi1kNDg5LWU0NDQtOTFlNi05MTcwOTFkODYyMDciPiA8eG1wTU06SGlzdG9yeT4gPHJkZjpTZXE+IDxyZGY6bGkgc3RFdnQ6YWN0aW9uPSJjcmVhdGVkIiBzdEV2dDppbnN0YW5jZUlEPSJ4bXAuaWlkOjFlYmY1ZjkyLWQ0ODktZTQ0NC05MWU2LTkxNzA5MWQ4NjIwNyIgc3RFdnQ6d2hlbj0iMjAyMS0xMC0xN1QwMDoyNjoyNisxMzowMCIgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWRvYmUgUGhvdG9zaG9wIDIxLjIgKFdpbmRvd3MpIi8+IDxyZGY6bGkgc3RFdnQ6YWN0aW9uPSJzYXZlZCIgc3RFdnQ6aW5zdGFuY2VJRD0ieG1wLmlpZDplNTkyOWZiYS0yYzA4LTI1NDYtOTdlMC0zZDBjZjZiNWZjNmUiIHN0RXZ0OndoZW49IjIwMjEtMTAtMTdUMTc6NTc6MzYrMTM6MDAiIHN0RXZ0OnNvZnR3YXJlQWdlbnQ9IkFkb2JlIFBob3Rvc2hvcCAyMS4yIChXaW5kb3dzKSIgc3RFdnQ6Y2hhbmdlZD0iLyIvPiA8L3JkZjpTZXE+IDwveG1wTU06SGlzdG9yeT4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4jcxTwAAAJbklEQVR4nO2de7BWVRmHn8M5HgIOoGiQDBSm2UheaKxRC4qL3XTKsoS0suliFycluxjWlKlTOhmkTaGV+UeWmmk4xmSZoxDJhJQNHaQwKIoGlFIuCnIRTn/8zjd8Z5+19rfX2mvvbzWsZ8YB1r6s95zf3nu9613vu+zo6+sjEQ9D2m1AYiBJkMhIgkRGEiQykiCRkQSJjCRIZCRBIiMJEhlJkMjocjl5y1NPVWHDCcA04GTgOGAS8GJgFLJvO7AD2AisBZ4AHgEeBfZUYVBoxo4b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"
desc	    				= [[
<hr/><center><h2>Find Source Location</h2>(Version: %s)</center>
<br><center><img width=50 height=50 src=']] .. icon .. [['/></center>
<br><center><a href="https://github.com/midnight-studios/obs-lua/blob/main/find-source-location.lua">Find it on GitHub</a></center>
<br><p>Find Source location and display results.</p><p>Find help on the <a href=
"https://obsproject.com/forum/resources/source-search-helper.1380/">
OBS Forum Thread</a>.</p><hr/></p>]]
gversion = 1.0
--  global context information
local ctx = {
    propsDef    = nil,  -- property definition
    propsDefSrc = nil,  -- property definition (source scene)
    propsSet    = nil,  -- property settings (model)
    propsVal    = {},   -- property values
    propsValSrc = nil,  -- property values (first source scene)
}
local search_params = {
    searchFocus     = nil,
    sourceType      = nil,
    sourceName      = nil,
    filterFamily    = nil,
    filterType      = nil,
    filterName      = nil
}
json_data_type      = 1
output_folder				= ""
list_all 					= "List Everything"
print_log			 		= false
output_json	 			    = false
output_results	 			= false
search			 			= false
output_file_name 			= "";
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
	if type( tbl ) ~= "table" or input_value == nil then return false end; -- if the input table is not of type table return bool(false)
	for _, value in pairs( tbl ) do
		if value == input_value then	
			return true
		end;
	end;
	return false
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
----------------------------------------------------------
----------------------------------------------------------
]]
function tableToObsData(myTable)
    if type(myTable) ~= "table" then
     return  
    end  
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
function get_filter_info()
    local filters_table = {}
    local function process_filters(source, inputTable)
        local filters = obs.obs_source_enum_filters(source)
        local itemTable = {}
        for _, f in pairs(filters) do
            local f_name = obs.obs_source_get_name(f)
            local f_id = obs.obs_source_get_id(f)
            local f_display_name = obs.obs_source_get_display_name(f_id)
            local filter_info = {
                name = f_name,
                id = f_id,
                display_name = f_display_name
            }
            table.insert(inputTable, filter_info)
        end
        obs.source_list_release(filters)
        return inputTable
    end
    local function process_scene_items(scene_items, inputTable)
        for _, scene_item_value in ipairs(scene_items) do
            local source = obs.obs_sceneitem_get_source(scene_item_value)
            inputTable = process_filters(source, inputTable)
            local group = obs.obs_group_from_source(source)
			local item_type = obs.obs_source_get_type(source)
            if group then
                local group_items = obs.obs_scene_enum_items(group)
                if group_items then
                    inputTable = process_scene_items(group_items, inputTable)
                    obs.sceneitem_list_release(group_items)
                end
            end
        end
		return inputTable
    end
    local function process_scenes(scenes, inputTable)
        for _, scene_source in pairs(scenes) do
            local scene = obs.obs_scene_from_source(scene_source)
            local scene_items = obs.obs_scene_enum_items(scene)
            inputTable = process_filters(scene_source, inputTable)
            inputTable = process_scene_items(scene_items, inputTable)  -- Nest scene items data
            obs.sceneitem_list_release(scene_items)
        end
		return inputTable
    end
    local current_collection = obs.obs_frontend_get_current_scene_collection()
    if current_collection then
        local scenes = obs.obs_frontend_get_scenes()
        if scenes then
            filters_table = process_scenes(scenes, filters_table)
            obs.source_list_release(scenes)
        end
    end
    return filters_table
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
if type( tbl ) ~= "table" or tbl == nil then return tbl end; -- if the input table is not of type table return input
  local seen = {}
  local result = {}
  
  for _, value in pairs(tbl) do
    if not seen[value] then
      table.insert(result, value)
      seen[value] = true
    end
  end
  
  return result
end
--[[
----------------------------------------------------------
-- To Do > We could expand perhaps with visibility param?
----------------------------------------------------------
]]
function script_properties()
	local list = {}
	ctx.propsDef = obs.obs_properties_create()
    local notice = obs.obs_properties_add_text( ctx.propsDef, "statusMessage", "Results:", obs.OBS_TEXT_MULTILINE )
	local property_sp = obs.obs_properties_add_list( ctx.propsDef, "search_params.searchFocus", "Search Focus", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT )	
	t_type = {"Sources", "Filters", "Sources & Filters"}
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( property_sp, v, i ) end
	local property_sf = obs.obs_properties_add_list( ctx.propsDef, "search_params.sourceType", "Source Type", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING )
	obs.obs_property_list_add_string( property_sf, list_all, list_all )	
	local source_list = get_source_list( )
	local temp_source_list = remove_duplicates( source_list )
	for key, value in pairsByKeys( temp_source_list ) do
		obs.obs_property_list_add_string( property_sf, value, value )
	end
	list = {}
	local property_sn = obs.obs_properties_add_list( ctx.propsDef, "search_params.sourceName", "Source Name", obs.OBS_COMBO_TYPE_EDITABLE, obs.OBS_COMBO_FORMAT_STRING )	
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
    
	local property_ff = obs.obs_properties_add_list( ctx.propsDef, "search_params.filterFamily", "Filter Family", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING )	
	t_type = {list_all, "Audio/Video", "Effects"}
  	for key,value in pairs( t_type ) do obs.obs_property_list_add_string( property_ff, value, value ) end


	local property_ft = obs.obs_properties_add_list( ctx.propsDef, "search_params.filterType", "Filter Type", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING )
		obs.obs_property_list_add_string( property_ft, list_all, list_all )	
		list = {}
		for key, value in pairsByKeys( source_list ) do
			f_source = obs.obs_get_source_by_name( key )				
			local filters = obs.obs_source_enum_filters( f_source )
			obs.obs_source_release( f_source )
			for _, f in pairs( filters ) do
				f_name = obs.obs_source_get_name( f ) 
				f_id = obs.obs_source_get_id( f )
				f_display_name = obs.obs_source_get_display_name( f_id )
				if f_display_name ~= nil then
					list[f_display_name] = f_display_name
				end
			end
		end
		list = remove_duplicates( list )
		for key, value in pairsByKeys( list ) do
			obs.obs_property_list_add_string( property_ft, value, value )
		end
	list = {}
	local property_fn = obs.obs_properties_add_list( ctx.propsDef, "search_params.filterName", "Filter Name", obs.OBS_COMBO_TYPE_EDITABLE, obs.OBS_COMBO_FORMAT_STRING )	
	obs.obs_property_list_add_string( property_fn, list_all, list_all )	
	local filters = get_filter_info()
	if filters ~= nil then
		for _, filter in pairs( filters ) do
			if filter.name then
				if filter.name ~= filter.display_name then	 
					list[filter.name] = filter.name --.. " (" .. filter.display_name .. ")"
				else  
					list[filter.name] = filter.name --.. " (Default Name)"
				end	
			end	
		end	
		
		list = removeDuplicates(list)
		for key, value in pairsByKeys( list ) do
			obs.obs_property_list_add_string( property_fn, value, value )
		end
	end	

    
	local property_jd = obs.obs_properties_add_list( ctx.propsDef, "json_data_type", "JSON Data Type", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT )	
	t_type = {"Tree", "Stacked"}
  	for i,v in ipairs( t_type ) do obs.obs_property_list_add_int( property_jd, v, i ) end

	 --[[
		Property Directory Path: User interaction that select a directory path.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
		 
		This property is referenced to trigger an onchange event listener.
	]]
	local property_of = obs.obs_properties_add_path( ctx.propsDef, "output_folder", "Output Folder", obs.OBS_PATH_DIRECTORY, nil, nil);
	local property_or = obs.obs_properties_add_bool( ctx.propsDef, "output_results", "Output results to text file" )
	local property_oj = obs.obs_properties_add_bool( ctx.propsDef, "output_json", "Output Json data" )
	obs.obs_properties_add_bool( ctx.propsDef, "print_log", "Output results to Script Log" )
	obs.source_list_release( sources )
	obs.obs_properties_add_button( ctx.propsDef, "search", "Search", doSearch )
  	obs.obs_property_set_modified_callback( property_fn, property_onchange )
  	obs.obs_property_set_modified_callback( property_oj, property_onchange )
  	obs.obs_property_set_modified_callback( property_or, property_onchange )
  	obs.obs_property_set_modified_callback( property_sf, property_onchange )
  	obs.obs_property_set_modified_callback( property_sn, property_onchange )
  	obs.obs_property_set_modified_callback( property_sp, property_onchange )
  	obs.obs_property_set_modified_callback( property_ff, property_onchange )
  	obs.obs_property_set_modified_callback( property_ft, property_onchange )
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
	obs.obs_data_set_default_bool( settings, "print_log", false )
	obs.obs_data_set_default_string( settings, "search_params.sourceName", list_all )
	obs.obs_data_set_default_string( settings, "search_params.sourceType", list_all )
	obs.obs_data_set_default_string( settings, "search_params.filterName", list_all )
	obs.obs_data_set_default_string( settings, "search_params.filterFamily", list_all )
	obs.obs_data_set_default_string( settings, "search_params.filterType", list_all )
    obs.obs_data_set_default_string( settings, "statusMessage", "" )
    obs.obs_data_set_default_int( settings, "json_data_type", 1 )
    obs.obs_data_set_default_int( settings, "search_params.searchFocus", 3 )
end
--[[
----------------------------------------------------------
----------------------------------------------------------
]]
function script_update( settings )
    --  remember settings
    ctx.propsSet = settings
	search_params.filterName = obs.obs_data_get_string( settings, "search_params.filterName" );
	output_folder = obs.obs_data_get_string( settings, "output_folder" );
	search_params.sourceName = obs.obs_data_get_string( settings, "search_params.sourceName" )
	search_params.sourceType = obs.obs_data_get_string( settings, "search_params.sourceType" )
	search_params.searchFocus = obs.obs_data_get_int( settings, "search_params.searchFocus" )
	json_data_type = obs.obs_data_get_int( settings, "json_data_type" )
	search_params.filterFamily = obs.obs_data_get_string( settings, "search_params.filterFamily" )
	search_params.filterType = obs.obs_data_get_string( settings, "search_params.filterType" )
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
	local filterName_props = obs.obs_properties_get( props, "search_params.filterName" )
	local json_data_type_props = obs.obs_properties_get( props, "json_data_type" )
	local output_folder_props = obs.obs_properties_get( props, "output_folder" )
	local sourceName_props = obs.obs_properties_get( props, "search_params.sourceName" )
	local filterFamily_props = obs.obs_properties_get( props, "search_params.filterFamily" )
	local filterType_props = obs.obs_properties_get( props, "search_params.filterType" )
	obs.obs_property_set_visible( output_folder_props, output_results or output_json )
	obs.obs_property_set_visible( filterFamily_props, ( search_params.searchFocus ~= 1) )
	obs.obs_property_set_visible( filterName_props, ( search_params.searchFocus ~= 1) )
	obs.obs_property_set_visible( json_data_type_props, output_json )
	obs.obs_property_set_visible( filterType_props, ( search_params.searchFocus ~= 1) )
	obs.obs_property_list_clear( sourceName_props )
	obs.obs_property_list_add_string( sourceName_props, list_all, list_all )
	if prop_name == "search_params.sourceType" then
		obs.obs_data_set_string( settings, "search_params.filterType", list_all ) -- Don't allow timer and active text source to be the same
		obs.obs_data_set_string( settings, "search_params.sourceName", list_all ) -- Don't allow timer and active text source to be the same
	end	
	if prop_name == "search_params.filterType" then
		obs.obs_data_set_string( settings, "search_params.sourceName", list_all ) -- Don't allow timer and active text source to be the same
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
				if search_params.sourceType ~= list_all then
					if display_name == search_params.sourceType then	
						if search_params.filterType ~= list_all then
							local filters = obs.obs_source_enum_filters( source )
							local found_filter = false
							for _, f in pairs( filters ) do
								--f_name = obs.obs_source_get_name( f ) 
								f_id = obs.obs_source_get_id( f )
								f_display_name = obs.obs_source_get_display_name( f_id )
								if f_display_name == search_params.filterType then
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
					if search_params.filterType ~= list_all then
						local filters = obs.obs_source_enum_filters( source )
						for _, f in pairs( filters ) do
							--f_name = obs.obs_source_get_name( f ) 
							f_id = obs.obs_source_get_id( f )
							f_display_name = obs.obs_source_get_display_name( f_id )
							if f_display_name == search_params.filterType then
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
		obs.obs_property_list_add_string( sourceName_props, value, value )
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
function format_message( message )
    local l = 0
    local line_count = 0
    return string.gsub( message, "([^\n]*)\n?", function(s)
        line_count = line_count + 1
        if line_count <= 7 then
            r = s .. "\n"
        elseif s ~= "" then
            l = l + 1
            r = l .. " | " .. s .. "\n"
        else
            r = "\n" -- Preserve empty lines
        end
        return r
    end)
end   
--[[
----------------------------------------------------------
helper function: set status message
----------------------------------------------------------
]]
local function statusMessage( message )
    --message = format_message( message )
	obs.obs_data_set_string( ctx.propsSet, "statusMessage", string.format( "%s", message ) )
	obs.obs_properties_apply_settings( ctx.propsDef, ctx.propsSet )
	return true
end
--[[
----------------------------------------------------------

----------------------------------------------------------
]]
function export_table_to_json( tbl, user_path )
	local file_type = "json"
	output_file_name = "json Tree"
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

	OBS lua Script Function

	Search OBS Collection Scenes, Scene Sources including Nested Scenes, Group Sources and Group Items (Sources within group sources).
	Seach filters applied to Scenes, Scene Sources including Nested Scenes, Group Sources and Group Items (Sources within group sources)

	5 paramaters, 'List Everything' or Selected Option
	Paramaters:

	params.searchFocus (source, filters, both)
	params.sourceType (Dynamic list created from available source types, typically: 'Scene', 'Nested Scene', 'Color Source', 'Media Source', 'Text Source', 'Group', 'Audio Input Capture', 'Audio Output Capture' ... and others )
	params.sourceName (sourceType name based on names assigned by user.)
	params.filterType (Dynamic list created from available filter types, typically: 'Compressor', 'Sharpen' ... and others)
	params.filterName  (filterType name based on names assigned by user.)

	searchFocus: if 'source' is selected, all filters will be excluded
	searchFocus: if 'filters' is selected, the focus is on filters, but we need to know to which source the filter is applied.
	searchFocus: if 'both' is selected, the focus is on sources and filters.

	sourceType: Focus search on sources for selected option only
	sourceName: Focus search on sources with selected / similar name

	filterType: Focus search on filters for selected option only
	filterName: Focus search on filters with selected / similar name

]]
function getOBSTable( params )
	-- Validate params
	if not params then
		return nil, "No params provided" 
	end

	local expected_keys = {"searchFocus", "sourceType", "sourceName", "filterType", "filterName"}
	for _,key in ipairs(expected_keys) do
		if not params[key] then
			return nil, "Missing expected param key: " .. key
		else
			--print("param: " .. key.. " = " .. params[key] .. "")	
		end
	end	
	params.filters = 0
	params.sources = 0
    params.searchFilters = {}
    params.searchSceneItems = {}
    params.searchGroup = {}
    params.searchFilters.concatData = false
    params.searchGroup.concatData = false
    params.searchSceneItems.concatData = false
    local treeData = {}
    local data = {}
    -- String metatable with matchName method
    local string_mt = {
        __index = {
        matchName = function(self, search)
            -- Standardize to lower case
            local selfLower = self:lower()
            search = search:lower()
            -- Escape magic characters
            search = string.gsub(search, "([%-%.%+%[%]%(%)%^%%%?%*])", "%%%1")
            -- Replace * with Lua pattern
            search = string.gsub(search, "%*", ".*")
            -- Perform pattern match
            local matches = string.match(selfLower, search)
            return matches ~= nil
        end
        }
    }
    -- Set meta table on string class
    setmetatable(string, string_mt)
    local function get_settings_info(info, settings, unversioned_id)
        if type(info)  ~= "table" then return info end
        if settings then
            if in_table( {"ffmpeg_source", "image_source"}, unversioned_id) then
                local looping = obs.obs_data_get_bool(settings, "looping"); -- we want to check this property setting
                local unload = obs.obs_data_get_bool(settings, "unload"); -- we want to check this property setting
                local close_when_inactive = obs.obs_data_get_bool(settings, "close_when_inactive"); -- we want to check this property setting
                local local_file = obs.obs_data_get_string(settings, "local_file"); -- we want to check this property setting
                info.looping = looping and looping or nil
                info.unload = unload and unload or nil
                info.close_when_inactive = close_when_inactive and close_when_inactive or nil
                info.local_file = local_file and local_file or nil
            end    
            if in_table( {"color_source"}, unversioned_id) then
                local color = obs.obs_data_get_int(settings, "color"); -- we want to check this property setting
                local color1 = obs.obs_data_get_int(settings, "color1"); -- we want to check this property setting
                local color2 = obs.obs_data_get_int(settings, "color2"); -- we want to check this property setting
                info.color = color and color or nil
                info.color1 = color1 and color1 or nil
                info.color2 = color2 and color2 or nil
            end    
            if in_table( {"text_ft2_source", "text_gdiplus"}, unversioned_id) then
            end 

        end
        return info
    end 
    -- Function to handle filter search
    local function searchFilters(source, params, path)
        local filters = obs.obs_source_enum_filters(source)
        local total_filters = filters and #filters or 0
		local itemData = {}
        params.searchFilters.concatData = false 
        for _, item in pairs(filters) do
			local insertData = false
            local id = obs.obs_source_get_id(item)
            local name = obs.obs_source_get_name(item)
            local display_name = obs.obs_source_get_display_name(id)
            local enabled = obs.obs_source_enabled(item)
            local unversioned_id = obs.obs_source_get_unversioned_id(item)
			local parent_source = obs.obs_filter_get_parent(item)
            local parent_name = obs.obs_source_get_name(parent_source)
            local parent_type = obs.obs_source_get_type(source)
            local parent_is_group = obs.obs_source_is_group(source)
            local filterName = name:lower()
            local searchFilterName = params.filterName:lower()

            local sourceFlags = obs.obs_source_get_output_flags(source)
            local filterFlags = obs.obs_source_get_output_flags(item)

            --local audio = (bit.band(sourceFlags, obs.OBS_SOURCE_AUDIO) ~= 0);
            --local video = (bit.band(sourceFlags, obs.OBS_SOURCE_VIDEO) ~= 0);
            --local audioOnly = (bit.band(sourceFlags, obs.OBS_SOURCE_VIDEO) == 0);
            --local async = (bit.band(sourceFlags, obs.OBS_SOURCE_ASYNC) ~= 0);
            
            local filterAsync = (bit.band(filterFlags, obs.OBS_SOURCE_ASYNC) ~= 0);
            local filterAudio = (bit.band(filterFlags, obs.OBS_SOURCE_AUDIO) ~= 0);
            local filterFamily = (filterAudio and filterAsync) and "Audio/Video" or "Effects"
            -- Check if params is not nil
            local info = {
                id = id,
                name = name,
                display_name = display_name,
                enabled = enabled,
                kind = "Filter",
                parent_kind = parent_is_group and "Group" or (parent_type == obs.OBS_SOURCE_TYPE_SCENE and not parent_is_group) and "Nested Scene" or "Source",
                unversioned_id = unversioned_id,
                host = parent_name,
                location = path .. '/', -- Assign a path
                family = filterFamily,
                --filter_async = filterAsync,
                --filter_audio = filterAudio,
                --source_audio = audio,
                --source_video = video,
                --source_audio_only = audioOnly,
                --source_async = async,
            }
            if params then
                -- Check if the filter matches the search criteria
                if not params.searchFocus or params.searchFocus ~= 1 and params.searchFocus ~= 1 then -- ok
                    if not params.filterFamily or params.filterFamily == filterFamily or params.filterFamily == list_all then -- ok
                        if not params.filterType or params.filterType == display_name or params.filterType == list_all then -- ok
                            if filterName:match(searchFilterName) or params.filterName:match(list_all) or filterName:matchName(searchFilterName) then
                                insertData = true
                            end
                        end
                    end    
                end
                if insertData then 
                    table.insert(data, info)
                    params.filters = params.filters + 1 
                end       
            end
            if insertData then 
                table.insert(itemData, info)
                params.searchFilters.concatData = true             
			end
            insertData = false 
        end
        obs.source_list_release(filters)  
        return itemData, total_filters
    end   
    -- Function to handle scene item search
    local function searchGroupItems(group_items, params, path)
        -- Initialize path to an empty string
        path = path or ""
        local itemData = {}
        for _, item in ipairs(group_items) do
            local source = obs.obs_sceneitem_get_source(item)
            local id = obs.obs_source_get_id(source)
            local name = obs.obs_source_get_name(source)
            local display_name = obs.obs_source_get_display_name(id)
            local type = obs.obs_source_get_type(source)
            local visible = obs.obs_sceneitem_visible(item)
            local unversioned_id = obs.obs_source_get_unversioned_id(source)
            local installed_filters = obs.obs_source_filter_count(source)
            local kind = "Source"
            local sourceName = name:lower()
            local searchSourceName = params.sourceName:lower() 

            local info = {
                id = id,
                name = name,
                display_name = display_name,
                kind = kind,
                unversioned_id = unversioned_id,
                visible = visible,
                installed_filters = installed_filters and installed_filters or 0,
                location = path .. '/' .. name, -- Assign a path
            }

            local settings = obs.obs_source_get_settings(source); -- get source settings
            local settings_json = obslua.obs_data_get_json(settings)
            info = get_settings_info(info, settings, unversioned_id)
            obs.obs_data_release(settings); -- release settings

            local insertData = false 
            -- Check if params is not nil
            if params then
                -- Check if the source matches the search criteria
                if not params.searchFocus or params.searchFocus ~= 2 then
                    if not params.sourceType or params.sourceType == display_name or params.sourceType == list_all then
                        if sourceName:match(searchSourceName) or params.sourceName  == list_all or sourceName:matchName(searchSourceName) then
                            insertData = true
                        end
                    end
                end
                if params.searchFocus ~= 1 then
                    info.filters, info.installed_filters = searchFilters(source, params, info.location)
                end
                if insertData then 
					table.insert(data, info)
                    params.sources = params.sources + 1
				end
                if insertData or params.searchFilters.concatData then 
                    params.searchGroup.concatData = true
                    table.insert(itemData, info)
                    params.searchFilters.concatData = false
                end
            end   
            insertData = false  
        end
        return itemData
    end
    -- Function to handle scene item search
    local function searchSceneItems(scene_items, params, path)
        -- Initialize path to an empty string
        path = path or ""
        local itemData = {}
        for _, item in ipairs(scene_items) do
			local insertData = false
            local source = obs.obs_sceneitem_get_source(item)
            local id = obs.obs_source_get_id(source)
            local name = obs.obs_source_get_name(source)
            local display_name = obs.obs_source_get_display_name(id)
            local type = obs.obs_source_get_type(source)
            local visible = obs.obs_sceneitem_visible(item)
            local is_group = obs.obs_source_is_group(source)
            local unversioned_id = obs.obs_source_get_unversioned_id(source)
            local installed_filters = obs.obs_source_filter_count(source)
            local kind = is_group and "Group" or (type == obs.OBS_SOURCE_TYPE_SCENE and not is_group) and "Nested Scene" or "Source"
            local sourceName = name:lower()
            local searchSourceName = params.sourceName:lower() 
            local info = {
                id = id,
                name = name,
                display_name = display_name,
                kind = kind,
                unversioned_id = unversioned_id,
                visible = visible,
                installed_filters = installed_filters and installed_filters or 0,
                location = path .. '/' .. name, -- Assign a path
            }

            local settings = obs.obs_source_get_settings(source); -- get source settings
            local settings_json = obslua.obs_data_get_json(settings)
            info = get_settings_info(info, settings, unversioned_id)
            obs.obs_data_release(settings); -- release settings

            -- Check if params is not nil
            if params then
                -- Check if the source matches the search criteria
                if not params.searchFocus or params.searchFocus ~= 2 then
                    if not params.sourceType or params.sourceType == display_name or params.sourceType == list_all then
                        if sourceName:match(searchSourceName) or params.sourceName  == list_all or sourceName:matchName(searchSourceName) then
                            insertData = true
                        end
                    end
                end
                local subData = {} 
                
                if is_group then   
                    -- Search child sources if the source is a group
                    local group = obs.obs_group_from_source(source)
                    if group then
                        local items = obs.obs_scene_enum_items(group)
                        if items then
                            params.searchGroup.concatData = false
                            info.total_children = items and #items or 0
                            -- Search child sources if the source is a group
                            subData = searchGroupItems(items, params, info.location)
                            obs.sceneitem_list_release(items)
                        end
                    end
                end 
                -- Search current source filters
                if params.searchFocus ~= 1 then
                    info.filters, info.installed_filters = searchFilters(source, params, info.location)
                end
                if insertData then 
                    info.children = {}
                    table.insert(data, info)
                    params.sources = params.sources + 1
                end
                if insertData or params.searchGroup.concatData or params.searchFilters.concatData then -- or 
                    info.children = subData 
                    table.insert(itemData, info)
                    params.searchFilters.concatData = false
                    params.searchGroup.concatData = false
                    params.searchSceneItems.concatData = true
                end
            end 
            insertData = false 
        end
        return itemData
    end
    -- Function to handle scene search
    local function searchScenes(scenes, params, path)
        -- Initialize path to an empty string
        path = path or ""
        local itemData = {}
        for _, source in pairs(scenes) do
			local insertData = false
            local name = obs.obs_source_get_name(source)
            local id = obs.obs_source_get_id(source)
            local display_name = obs.obs_source_get_display_name(id)
            local installed_filters = obs.obs_source_filter_count(source)
            local unversioned_id = obs.obs_source_get_unversioned_id(source)
            local info = {
                id = id,
                name = name,
                display_name = display_name,
                kind = "Scene",
                unversioned_id = unversioned_id,
                installed_filters = installed_filters and installed_filters or 0,
                location = path .. '/' .. name, -- Assign a path
            }
            -- Check if params is not nil
            if params then
                -- Check if the source matches the search criteria
                if not params.searchFocus or params.searchFocus ~= 2 then
                    if not params.sourceType or params.sourceType == display_name or params.sourceType == list_all then
                        local sourceName = name:lower()
                        local searchSourceName = params.sourceName:lower()
                        if sourceName:match(searchSourceName) or params.sourceName == list_all or sourceName:matchName(searchSourceName) then
                            insertData = true
                        end
                    end
                end  
                local scene = obs.obs_scene_from_source(source)
                local items = obs.obs_scene_enum_items(scene)
                -- Search all source items
                info.total_children = items and #items or 0
                local subData = {}
                if items then
                    subData = searchSceneItems(items, params, info.location)
                end    
                -- Search current source filters
                if params.searchFocus ~= 1 then
                    info.filters, info.installed_filters = searchFilters(source, params, info.location)
                end  
				if insertData then  
                    info.children = {}
					table.insert(data, info)
                    params.sources = params.sources + 1
				end
                obs.sceneitem_list_release(items)
                if insertData or params.searchFilters.concatData or params.searchSceneItems.concatData then
                    info.children = subData
                    table.insert(itemData, info)   
                    params.searchFilters.concatData = false
                    params.searchSceneItems.concatData = false  
			    end
            end
            insertData = false 
        end
        return itemData
    end
    local name = obs.obs_frontend_get_current_scene_collection()
    -- Continue search to scenes
    local scenes = obs.obs_frontend_get_scenes()
    if name then
        local info = {
            name = name,
            kind = "Collection",
            location = name,
            total_children = scenes and #scenes or 0
        }
        table.insert(data, info)
        -- Check if params is not nil
        if params then
            local subData = {}
            if scenes then
                subData = searchScenes(scenes, params, info.location)
                info.children = subData
                obs.source_list_release(scenes)
            end
			treeData = info
        end
    end
    if params.dataStructure == "tree" then 
        return treeData
    end  
    -- Return search results as a table
    return data
end
--[[
----------------------------------------------------------

TODO> 	

----------------------------------------------------------
]]
function doSearch( do_search )
	if not do_search then search = false else search = true end
	local prefix_results = ""
	local results = ""

    function formatColumnText(text)
        -- Split the text into lines
        local lines = {}
        for line in text:gmatch("([^\n]*)\n?") do
            table.insert(lines, line)
        end
    
        local formattedLines = {}
    
        -- Find the maximum colon position among the lines
        local maxColonPos = 0
        for _, line in ipairs(lines) do
            local colonPos = line:find(":", 1, true) -- Start searching from the beginning
            if colonPos and colonPos > maxColonPos then
                maxColonPos = colonPos
            end
        end
    
        -- Add spaces after the first colon to align the text
        for _, line in ipairs(lines) do
            local colonPos = line:find(":", 1, true) -- Start searching from the beginning
            if colonPos then
                local spaces = string.rep(" ", (maxColonPos + 3) - colonPos + 1)
                local formattedLine = line:sub(1, colonPos) .. spaces .. line:sub(colonPos + 1)
                table.insert(formattedLines, formattedLine)
            else
                table.insert(formattedLines, line)
            end
        end
    
        return table.concat(formattedLines, "\n")
    end

    search_params.dataStructure = "stacked"
    local data = getOBSTable( search_params )

	prefix_results = string.format( "Search Query:%s \n", os.date("%Y-%m-%d %H:%M:%S") );
	prefix_results = prefix_results .. string.format( "Search:%s \n", (search_params.searchFocus == 1 and "Sources" or search_params.searchFocus == 2 and "Filters" or "Sources & Filters") );
	prefix_results = prefix_results .. string.format( "Source Type:%s \n", search_params.sourceType );
	prefix_results = prefix_results .. string.format( "Source Name:%s \n", search_params.sourceName );
    prefix_results = search_params.searchFocus ~= 1 and prefix_results .. string.format( "Filter Family:%s \n", search_params.filterFamily ) or prefix_results ;
    prefix_results = search_params.searchFocus ~= 1 and prefix_results .. string.format( "Filter Type:%s \n", search_params.filterType ) or prefix_results ;
    prefix_results = search_params.searchFocus ~= 1 and prefix_results .. string.format( "Filter Name:%s \n", search_params.filterName ) or prefix_results ;
	prefix_results = search_params.searchFocus ~= 2 and prefix_results .. string.format( "Sources:%s \n", search_params.sources ) or prefix_results .. string.format( "Sources:%s\n", "Not requested or included in search results." ) ;
	prefix_results = search_params.searchFocus ~= 1 and prefix_results .. string.format( "Filters:%s \n", search_params.filters ) or prefix_results .. string.format( "Filters:%s\n", "Not requested or included in search results." ) ;
    prefix_results = prefix_results .. string.format( "\n");

    prefix_results = formatColumnText(prefix_results)

    local resultString, i = prefix_results, 0
    for _, result in ipairs(data) do
      
        if result.kind == "Collection" then
            resultString = resultString .. string.format( "Kind:  \'%s\', \tName:  \'%s\'\nLocation: \"%s\"\n\n", result.kind, result.name, result.location )   
        else
            i = i + 1
            local msg = string.format(" Note: %s", "No additional notes.")

            if result.parent_kind then
                msg = string.format(" Note: %s", result.parent_kind == "Nested Scene" and "Filters applied to a scene are inherited when the scene is nested as a source!" or "No additional notes.")
            end   

            local value_1 = result.kind == "Filter" and string.format("Family:  \'%s\',  Enabled:  \'%s\' ", tostring(result.family), tostring(result.enabled)) or 
                            result.kind == "Source" and string.format("Visible:  \'%s\' ", tostring(result.visible)) or 
                            result.kind == "Group" and string.format("Visible:  \'%s\' ", tostring(result.visible)) or 
                            result.kind == "Nested Scene" and string.format("Visible: %s ", tostring(result.visible)) or ""
              
            local value_2 = in_table( {"Scene", "Source", "Group", "Nested Scene"}, result.kind ) and string.format("Filters:  \'%s\',  ", tostring(result.installed_filters and result.installed_filters or 0 )) or ""

            resultString = resultString .. string.format( "%s Kind:  \'%s\',  Name:  \'%s\',  Type:  \'%s\',  %s%s\n%s Location: \"%s\"\n%s%s\n\n", tostring(i) .. ".1", result.kind, result.name, tostring(result.display_name), value_2, value_1, tostring(i) .. ".2", result.location, tostring(i) .. ".3", msg )            
        end    
      
    end

	statusMessage( string.format( "%s", resultString ) ) 

	if output_results then 
        --resultString =  format_message( resultString )
        write_to_file( "txt", resultString, output_folder ); 
    end
    
	if print_log then 
        -- resultString =  format_message( resultString )
        log( resultString ) 
    end
	search = false
	if output_json then 
        search_params.dataStructure = json_data_type == 1 and "tree" or "stacked"
		local json_data = getOBSTable( search_params )
		export_table_to_json( json_data, output_folder )
	end
	return true
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