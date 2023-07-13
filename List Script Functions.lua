--[[
----------------------------------------------------------------------------------------------------------------------------------------
Open Broadcaster Software®️
OBS > Tools > Scripts
@midnight-studios
Stopwatch
***************************************************************************************************************************************

Version 0.2

Published / Released: 2023-07-13 16:11

NEW FEATURES

- 

OPTIMIZATION

- 

USER EXPERIENCE & FEATURE ENHANCEMENTS

- 

BUGS

- fixed an issue where certain file names are incorrectly validated. 

***************************************************************************************************************************************
]]
--Globals
obs           				= obslua
luafileTitle				= "Index Script Functions"
gversion 					= 0.2
luafile						= ""
obsurl						= ""
icon="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAqCAYAAADS4VmSAAAInklEQVRYhcVYeWwcVxn/3ps3O7vey7ub+Nht4nWSmq5zOtRJnAYqVUL8UYFAKWoRLaqEhBBIIFIpVPQPkAIUCEHiEH8gFIQoAlFxSM0f4RBqlDSpQIHU1EnsOFkfcezsxvYe3pnZmdn30DfHeux47QRxfLI1xzu+6/d+3zdLzpz5AwwODvywo2Pz5+A/KJzz6YmJqWeHh0cuhUJBwhgDIcR9CsiNGzf7d+zYNlKr1UqSJF1mjEmWZRFJkgQuwDWUUmg0LEKpJAjBzQWhlOA4ASDuO04opbikIYTIKUogDQDGtWujfVevjk5GoxEcJwDgWYH3wEzTiuGNYZinrlz5+9c8KyWJ2srxGQ3gvAGEUCCEoDL72vTCfYdiWRbs3Jn7VDrd9RMACORy77moafqjk5PTaiwWIb4g2HeMc27gDaU0Wq0uARopSU64PB24yFEo3HtoXpfH7ciAYRggy6zdF+X0wMCe86qqvbdYLPJ4PE45TnQiINyoADQaDSrLDAKBAJFlRgIBmciy8+/cM9+9vMa4cw0EZNufFXkmZP/+/Xtfa2sLw9JSjRNf+NAaJxeMgSRJfqAQ/x4PCk9c7qXDL21toU8cOXLolCzLoGk692ygCCI3Am6em7r8kL0fvi0E1yNm1pJwuO3Y0NDgMVRhGAZ35zo5cBQ/sKPrRECAk+K1pb09fmpgYM8ziBXTNO0UOKGgZAWy/11rcAuywcp0uvv1Xbv6D9XrhmCEgC8F3MaB58zDKvfwoyhKcqO527f3vqlp2k7m2YtHD3O3CoQrSGMjoxzC4rCwsHguHo8dBQA8Ety3l3cNA0BnLBZ7iglXIwLQI521nHvQKCDt5vNTZ4vFe31IJU5guH3KkKQ0TYfHHnv0Y93dXb/mnOusFWIfRqlDWqQZBQRXoVD07UGaxKZpGqjqI7q7lDO0zp7i0uxaBWNVOpqCJ6her3PTtIAxCXOPBQJpnEhScA1DAcc5Y6zNNZxQL70IQL8nDxINXa+LSCQCe/fu6s9kujssqwFr2+964QJ+OVo+HsDQtVDuLQZUgEoNw0D2x5yKXK7vIz09W0ai0Wh7qVQWlmWKVvu4mLDXgXPyBG00nAen9IqWHtRqmpAkKjZtSkJHx+aEZZn2+0gkchwDODY2PpbNbmFYC6rVJYFKWhnCGPOcxhItedY1PXXDRHCTWk0V5XJFdHd3SkeODH310KFBkUi0P47eptNdEAwqQ6VS+dVEop0cPPh4/YknDv0ym93agc5Uq1VhmubyuXZT4JGfTcUeCP1MiJapqmYP5HJ9kcOHD3xrcHC/FQoFvzI/v/CrxcXS2zgWDAb78To2Nv46Gjk/v3AyGAw+t2/f7rtPPnnkN9u3b+vH46frul12HYDbetwUcGAeCNEQD4S6rvN4PJbct2/38VgsepRzLpdK5W/cuHHz5MzMbCkUCkEsFoVksv3jYJOY9A72Epcu/fXlRCLxcja79bMdHZs/vXt3/x937Nj2l+vXx74+Ozs3iqUe8eyVY8QdXc0DaKRhmLBtW7Y3Fot+CQB2TE3dfv7KlX++Mj5+q4SdEp7zSCSMnP5ipVJ9a2FhEWKxiF2EpqdvoyE/mpycfj8AqKFQ8IXe3p6ncE8PZ0hIri7BfA9NDLS1hcjNm/l/aJp2OJ3u/nw2u/V8Nrt1ambmzpenp2d+MTdXQOpOAMAjpVL5JfQewZdKJeDAgf3vi8fjJ0Oh4EHTNC/m85OvqKr6BjKk11lhWhxdAptVCVYLFiRsGkZGrl+amJi6lMl0fyeb7flmJpN+LZNJn75w4e1wNrt1CJeVy5XfYyFLpbrkoaHBa1hnhBDXisV7R4eHR367uFhCrCBF02Xa9xoWgj2huI8HcB5jEo1EwvZxGhsbvzwxMfWBTCa9K5frO5FOd8U3bUq9inOnpqYNdCIWi2JEbo6Ojn/x1q38G5gO3AdPBzKecGQFCDkXgvmtWsWEwjuz0WiUmKbF8/mJdwuF4kdTqaSkKMppzvk7iqLYcwqF4kKlUvlgoXAP+0qQZYn4WrxmTfCTKvrMfPW/2fWunulGBA3BVkoUCkU+Ozv3PTRWlgMUc2qapqWqKrZdxL/OL5hzBJ7Xh9p48EAIAJqq6sgHwvkoWW6/cS9/K+6A2RmwrMaKDlTTtPvq2fI+QqiqhosrbgqA4bFCCQTk9t7enihjzC3RwvdRwr3cuV2T07ggkThh5s1mBgGJnS/WDW8fVITvTBP7QMvq7Nzc6UYAMeBYGQ6HPzMwsOdFX08v1ugLxaruqNX4evPQm4ATD95gvnjJ7v//UAhQLwX/D7GLEXYz68nSUu1vqqq+65tSNgzjTc65Bcukcg4A7noTkPk0TZ/cyCfEC12LCf1SrS4dU1Xt294rTdNH79yZewZtA9eLmZk7z9Vq6gV3fHF0dPzDlUr1xEYGIIDpei2UowBSACS+/EwClNJOD6zuycD6bwPLsqzTXV0duxmTFgDAXG9vjB5t0YQ2RQiBpNAMk9PHEclb5rAnlSilzH3+U1dX50UhRKJWU3+2vnPk/nK8Wuww0eVTxLkwKZWwlVK8TfCPUprSNM3K5ycv1+v1twzDHCmVSr/b0IBGo7Hul5xlNRqEkLblRdCpqmoBQDBwfxHRNH1ekmiOc/HT9vZ4BICcCQaVPeVy5Wqj0TBa7W2DcGUtWGuSVdY07Xy9blzQ9fo5RVE6FEXpmZ2de9o0zRvV6tInk8lEQpKk6PT07S+kUonvB4PKD5LJxI9DoVB5fn7heKu98QA0a3QrSSaTL4RCoYiu699dWqqdsiwrn8l0/1lRFF4szr8UCATmksnEWcMw7yaTiWcjkciHvK1SqeQJSlsTDVI5jIxcOygeQvD3HU845zXfSvNh9kHJ5yefx7ZcWzcHq2TVr2NNbGBEH2YfFLvMF4v3RrZsyfw8HG572vc5/d8U9IBzzocXFxfP/gtqQwz9/J6x4gAAAABJRU5ErkJggg=="
desc	    				= [[
<hr/><center><h2>]] .. luafileTitle ..[[</h2>(Version: %s)</center>
<br><center><img width=32 height=42 src=']] .. icon .. [['/></center>
<br><center><a href="https://github.com/midnight-studios/obs-lua/blob/main/]] .. luafile ..[[">Find it on GitHub</a></center>
<br><p>Index all functions found in LUA Script file</p>
<p>
<ol>
<li><tt>`Index functions names`</tt></li>
<li><tt>`Includes comment with line number where function was read.`</tt></li>
</ol></p>
<p>Find help on the <a href="https://obsproject.com/forum/resources/]] .. obsurl ..[[">OBS Forum Thread</a>.</p>
<hr/>]]

--  global context information
local ctx = {
    propsDef    = nil,  -- property definition
    propsDefSrc = nil,  -- property definition (source scene)
    propsSet    = nil,  -- property settings (model)
    propsVal    = {},   -- property values
    propsValSrc = nil,  -- property values (first source scene)
}
write_file = false;
formats={
	["lua"]={
		name="Lua",
		single="%-%-[^%[%[\n\r%]%]]+",
		multi="%-%-%[%[.-%]%]" 
	},
}
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
function script_description()
	return string.format( desc, tostring( gversion ) )
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
helper function: set status message
----------------------------------------------------------
]]
local function statusMessage( message )
	log( "message", pre_dump( message ) );
	obs.obs_data_set_string( ctx.propsSet, "statusMessage", string.format( "%s", message ) )
	obs.obs_properties_apply_settings( ctx.propsDef, ctx.propsSet )
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
function get_filenames( path )
	local filenames = {}
	local dir = obs.os_opendir( path )
	local entry
	repeat
	  entry = obs.os_readdir(dir)
	  if entry then
		local ext = obs.os_get_path_extension( entry.d_name )
		if ext == ".lua" then
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
	Description:	
	
	Credit:				

	Modified:			

	function:		
	type:			
	input type: 	
	returns:		
----------------------------------------------------------------------------------------------------------------------------------------
]]
function lookup_functions(fileName)
    if fileName ~= nil then
        local f = io.open(fileName, "r")
        local txt = f:read("*a")
        f:close()
        local extension = fileName:match("^.+%.(.+)$")
        if not extension then
            return nil
        end
        extension = extension:lower()
        if formats[extension] then
            local functionNames = {}
            local lineNumbers = {}
            local functionCount = 0
            local lineNumber = 1
            for line in txt:gmatch("[^\r\n]+") do
				
                local functionName = line:match("function%s+([%w_]+)%(")
                if functionName then
                    local variables = line:match("%b()")
                    if variables then
                        variables = variables:sub(2, -2) -- Remove the parentheses
                        table.insert(functionNames, functionName .. "(" .. variables .. ")")
                    else
                        table.insert(functionNames, functionName)
                    end
                    table.insert(lineNumbers, lineNumber)
                    functionCount = functionCount + 1
                end
                lineNumber = lineNumber + 1
            end
            
            return functionCount, lineNumbers, functionNames
        else
            return 0, {}, {}
        end
    else
        return 0, {}, {}
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
function calculate_table_item_len(tbl)
    local maxLen = 0
    local longestItem = nil
    local minLen = math.huge
    local shortestItem = nil
    for _, value in pairs(tbl) do
        if type(value) == "string" then
            local length = #value
            if length > maxLen then
                maxLen = length
                longestItem = value
            end
            if length < minLen then
                minLen = length
                shortestItem = value
            end
        end
    end
    return longestItem, maxLen, shortestItem, minLen
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
function get_contents()
    local path = obs.obs_data_get_string(ctx.propsSet, "path")
    local file = obs.obs_data_get_string(ctx.propsSet, "file")
    local inputfile = path .. "/" .. file .. ".lua"
    local contents = ""
	local list = {}
    local listLineNumbers = {}
    if obs.os_file_exists(inputfile) then
        local functionCount, lineNumbers, functions = lookup_functions(inputfile);
        contents = "Total Functions: " .. functionCount .. "\n\n"
        for i, functionName in ipairs( functions ) do
			list[i] = functionName;
			listLineNumbers[i] = lineNumbers[i]
        end
    end
	local longestItem, maxLen, shortestItem, minLen = calculate_table_item_len( list )
    local line_data
	for key, value in pairs( list ) do

		if key < #list then
			newLine = "\n"
		else
			newLine = ""
		end
		
		line_data = key .. ")" .. string.rep(" ", ((string.len(tostring(functionCount)) - string.len(tostring(key))) + 1)) .. list[key] .. string.rep(" ", #longestItem - #value) .. " -- Line: " .. listLineNumbers[key] .. newLine;
        contents = contents .. line_data
	end
    return contents
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
function write_to_file( start_write )
	write_file = start_write and true or false	
	path = obs.obs_data_get_string( ctx.propsSet, "path" )
	file = obs.obs_data_get_string( ctx.propsSet, "file" )
	local unique_stamp = string.format('%s%s' .. os.date("%d.%m.%Y.%H.%M.%S") .. '.%s%s',' - Function Index ', '(', string.sub(math.floor( (obs.os_gettime_ns()/100000000) ), 5, 7), ')')
	local inputfile = path .. "/" .. file .. ".lua"
	local outputfile = path .. "/" .. file .. unique_stamp .. ".lua"
	if obs.os_file_exists(inputfile) then
		f = get_contents(inputfile)
	else
		statusMessage('File does not exist! (' .. inputfile .. ')')
	end
	if f ~= nil then	
			newfile = io.open(outputfile, "w")
			newfile:write(f)
			newfile:close()	
			statusMessage( string.format( "%s", f ) )
	end
	write_file = false;
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
function property_onchange( props, property, settings )
	local notice = ""

	local file = obs.obs_data_get_string( settings, "file" )
	local path = obs.obs_data_get_string( settings, "path" )
	local file_prop = obs.obs_properties_get( props, "file" )
	local notice_prop = obs.obs_properties_get( props, "statusMessage" )
	local filenames = get_filenames( path )
	local has_file_list = (table.getn( filenames ) > 0)
	local button = obs.obs_properties_get( props, "action_button" )
	local inputfile = path .. "/" .. file .. ".lua"
	local has_file = obs.os_file_exists(inputfile)
	obs.obs_property_set_visible( obs.obs_properties_get( props, "action_button" ), false )
	obs.obs_property_set_visible( obs.obs_properties_get( props, "action_button" ), has_file )
	obs.obs_property_list_clear( file_prop )
	obs.obs_property_list_add_string( file_prop, 'Select', 'select' )
	if path ~= "" then
		if has_file_list then
			notice = "Folder selected, please select the file from the dropdown list."
		else
			notice = "The selected folder does not contain any valid lua files.\nPlease select a valid directory." 
		end		
	else
		notice = "Please select a folder containing your lua files."
	end	
	if file ~= "select" then
		if has_file then
			notice = "File ready for processing, please click the 'Execute' button."
		else
			notice = "Cannot find the file you selected. \nPlease check that the file exist."
		end	
	end
	if has_file_list then
  		for i,v in pairs( filenames ) do 
			obs.obs_property_list_add_string( file_prop, v, v ) 
		end
	end
	if not write_file then
  		obs.obs_data_set_string( settings, "statusMessage", notice )
	else
		
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
function script_properties()
	ctx.propsDef = obs.obs_properties_create()
    local notice = obs.obs_properties_add_text( ctx.propsDef, "statusMessage", "Notice:", obs.OBS_TEXT_MULTILINE )	
	
	local p_a = obs.obs_properties_add_path( ctx.propsDef, "path", "Select Folder", obs.OBS_PATH_DIRECTORY, nil, nil)
	local p_b = obs.obs_properties_add_list( ctx.propsDef, "file", "<i>Select file</i>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING )
	obs.obs_property_list_add_string( p_b, 'Select', 'select' )
	obs.obs_property_set_long_description( p_b, "\nSelect the file to remove the comments.\n" )
	local filenames = get_filenames( path )
	if table.getn( filenames ) > 0 then
  		for i,v in pairs( filenames ) do 
			obs.obs_property_list_add_string( p_b, v, v )
		end
	end
	obs.obs_properties_add_button( ctx.propsDef, "action_button", "Execute", write_to_file )
  	obs.obs_property_set_modified_callback( p_a, property_onchange )
  	obs.obs_property_set_modified_callback( p_b, property_onchange )
	-- Calls the callback once to set-up current visibility
  	obs.obs_properties_apply_settings( ctx.propsDef, ctx.propsSet )
	return ctx.propsDef
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
function script_update( settings )
	ctx.propsSet = settings
    ctx.propsVal.statusMessage = obs.obs_data_get_string( settings, "statusMessage" )
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
function script_defaults( settings )
	obs.obs_data_set_default_string( settings, "path", "" )
	obs.obs_data_set_default_string( settings, "file", "Select" )
	obs.obs_data_set_default_string( settings, "statusMessage", "To get started, please select the file folder." )
    obs.obs_data_set_default_string( settings, "statusMessage", "" )
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
function script_load( settings )
    --  clear status message
    --obs.obs_data_set_string( settings, "statusMessage", "" );
end