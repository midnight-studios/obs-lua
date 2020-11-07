obs           = obslua
gs            = nil
always_show   = false
disable_script   = false
--
--	OBS Script Description
--	Displayed in the User Interface
--
--
--
function script_description()
	return "Toggle the visibility of Scene Items (Sources). This Script also enables the user to link siblings (Sources) in a scene. If a file's visibility is toggled, it will affect any linked siblings. The user can specify Scene Items (Sources) to be exlused from the toggle action."
end

--
--	Settings
--	Displayed in the User Interface
--
--
--
function script_properties()
	
    local props = obs.obs_properties_create()
	
    obs.obs_properties_add_editable_list(props, "sources", "Scenes and Groups",obs.OBS_EDITABLE_LIST_TYPE_STRINGS,nil,nil)
	
    obs.obs_properties_add_editable_list(props, "exclusion", "Exclude",obs.OBS_EDITABLE_LIST_TYPE_STRINGS,nil,nil)
	
    obs.obs_properties_add_editable_list(props, "link", "Links",obs.OBS_EDITABLE_LIST_TYPE_STRINGS,nil,nil)
	
    obs.obs_properties_add_bool(props, "always_show", "Always show")
	
    obs.obs_properties_add_bool(props, "disable_script", "Disable Script")
	
	return props
end

--
--	Just a tool
--	If testing and log event writing is needed
--
--
--
local function log(name, msg)
  if msg ~= nil then
    msg = " > " .. tostring(msg)
  else
    msg = ""
  end
  obs.script_log(obs.LOG_DEBUG, name .. msg)
end

--
--	Check if an exclusion Name is in Scene / Group / Source Items
--	
--
--
--
function in_exclusion_array(itm)
	
    local matchFound = false
	
    local exclusionNames = obs.obs_data_get_array(gs, "exclusion");
	
    local count = obs.obs_data_array_count(exclusionNames);
	
    for i = 0,count do 
		
        local item = obs.obs_data_array_item(exclusionNames, i);
		
        local exclusionName = obs.obs_data_get_string(item, "value");
		
        if exclusionName ~= nil then
			
			if exclusionName == itm then
				
				matchFound = true
				
			end
			
        end
		
    end

	return matchFound
	
end


--[[
--
--	function validating value 'a' found in table 't'
--  if user define value 'b' the iteration will 
--  validate 'a' and 'b' are siblings
--  
--	data = {{"apple","kiwi","banana","pear"}}
--
--  inArray( data, 'apple', 'banana' ) return true
--  inArray( data, 'apples', 'banana' ) return false
--  
--	data = {{"alpha","bravo","charlie","delta"},{"apple","kiwi","banana","pear"},{"carrot","brocoli","cabage","potatoe"}}
--
--  inArray( data, 'apple', 'banana' ) return true
--  inArray( data, 'apple', 'brocoli' ) return false
--  inArray( data, 'apples', 'banana' ) return false
--
--  inArray( data, 'apples' ) return true
-- 
]]--
local function inArray( t, a, b )
	
    local f = false
	
	a = string.gsub(a, '^%s*(.-)%s*$', '%1')
	
	if b ~= nil and b ~= '' then b = string.gsub(b, '^%s*(.-)%s*$', '%1') end
	
    for i=1, #t do
		
        if type( t[i] ) == "table" then
			
            f = inArray( t[i], a, b )  --  return value from recursion
			
            if f then break end  --  if it returned true, break out of loop

        else
			
			if string.gsub(t[i], '^%s*(.-)%s*$', '%1') == a then -- we have a primary match
			
				if b ~= nil and b ~= '' then --we are also looking to match siblings in the data row
					
					f = false -- reset for this check
					
					for j=1, #t do
						
						f = (string.gsub(t[j], '^%s*(.-)%s*$', '%1') == b)

						if f then break end  --  if it returned true, break out of loop

					end
					
				else
					
					f = true

				end	
			
            	
				
			end
			
        end
		
    end
	
    return f
	
end

--
--	
--	
--
--
--
function split(inputstr, sep) --sep=sep or '%s' 
	
	local t={}  
	
	for field, s in string.gmatch(inputstr, "([^"..sep.."]*)("..sep.."?)") do 
		
		field = string.gsub(field, '^%s*(.-)%s*$', '%1')
		
		table.insert(t, field)  
		
		if s=="" then 
			
			return t 
		end 
	end 

end

--
--	
--	
--
--
--
function enum_links(data)
	
	local t={}
		
	if type(data) ~= 'table' and type(data) == 'string' then
		
		return split(data, ',')
		
	end	
	
	for key, value in pairs(data) do
			
		table.insert(t, split(value, ','))
		
		if value=="" then 
			
			return t 
			
		end 
   	end
	
end

--
--	
--	
--
--
--
function is_linked(a, b)
	
    local matchFound = false
	
    local links =  obs.obs_data_get_array(gs, "link");
	
    local count = obs.obs_data_array_count(links);
	
    for i = 0,count do 
		
        local item = obs.obs_data_array_item(links, i);
		
        local linked = obs.obs_data_get_string(item, "value");
		
		local links = enum_links(linked)
		
        if links ~= nil then
			
			if inArray(links, a, b) then
				
				matchFound = true
				
			end
			
        end
		
    end

	return matchFound
	
end

--[[
-- 		The user requested a specific source to be switched on.
--
-- 		This function will switch on the requested source and
-- 		all of the sources linked to it.
--
--		The function will then switched off all other 
--		sources, but will ignore all sources listed in
-- 		the the exclussion list.   
--]] 
function item_visible(calldata)
	
	
    if disable_script then return  end	

	--[[
	-- 
	-- 
	-- The 'visible' variable represents an event call
	-- intended to register a user request to switch on
	-- a new source. 
	--
	--]] 
    local visible = obs.calldata_bool(calldata,"visible")
	
	local rendered = false

    if not visible and not always_show then --[[ return --]] end

    local item = obs.calldata_sceneitem(calldata,"item")
	
    local source = obs.obs_sceneitem_get_source(item)
	
    local sourceName = obs.obs_source_get_name(source)

    local scene = obs.obs_sceneitem_get_scene(item)
	
    local sceneitems = obs.obs_scene_enum_items(scene)
	
    local found = false
	
    for i, sceneitem in ipairs(sceneitems) do
		
        local itemsource = obs.obs_sceneitem_get_source(sceneitem)
		
        local isn = obs.obs_source_get_name(itemsource)
			
		-- The source has linked files
		if is_linked(isn, sourceName) then 
			
			-- The user is hiding the source, hide all linked files that are visible
			if not visible and obs.obs_sceneitem_visible(sceneitem) then 
				
				obs.obs_sceneitem_set_visible(sceneitem, false) 

			end
			
			-- The user is showing the source, show all linked files that are visible
			if visible and not obs.obs_sceneitem_visible(sceneitem) then 
				
				obs.obs_sceneitem_set_visible(sceneitem, true)  
			
			end

		end
		
		-- Now hide all sources not excluded
		if not in_exclusion_array(sourceName) and not in_exclusion_array(isn) then 

			if visible and sourceName ~= isn and not is_linked(isn, sourceName) then
				
				if obs.obs_sceneitem_visible(sceneitem) then
					
					obs.obs_sceneitem_set_visible(sceneitem, false)

				end
				
			elseif not visible and sourceName ~= isn and obs.obs_sceneitem_visible(sceneitem) then
				
				found = true
				
			end
		
		end

	end 

    if always_show and not visible and not found then
		
       obs.obs_sceneitem_set_visible(item, true)
		
    end

    obs.sceneitem_list_release(sceneitems)
	
end

--
--	
--	
--
--
--
function script_update(settings)
	
    always_show = obs.obs_data_get_bool(settings,"always_show")
	
    disable_script = obs.obs_data_get_bool(settings,"disable_script")
	
    local sourceNames =  obs.obs_data_get_array(settings, "sources")
	
    local count = obs.obs_data_array_count(sourceNames)
	
    for i = 0,count do 
		
        local item = obs.obs_data_array_item(sourceNames, i)
		
        local sourceName = obs.obs_data_get_string(item, "value")
		
        local source = obs.obs_get_source_by_name(sourceName)
		
        if source ~= nil then
			
            local sh = obs.obs_source_get_signal_handler(source)
			
            obs.signal_handler_disconnect(sh,"item_visible",item_visible)
			
            obs.signal_handler_connect(sh,"item_visible",item_visible)
			
            obs.obs_source_release(source)
			
        end
		
    end
	
end

--
--	
--	
--
--
--
function script_defaults(settings)

end

--
--	
--	
--
--
--
function script_save(settings)

end

--
--	
--	
--
--
--
function loaded(cd)
	
    if gs == nil then
		
        return
		
    end
	
    local source = obs.calldata_source(cd, "source")
	
    local sn = obs.obs_source_get_name(source)

    local sourceNames =  obs.obs_data_get_array(gs, "sources")
	
    local count = obs.obs_data_array_count(sourceNames)
	
    for i = 0,count do 
		
        local item = obs.obs_data_array_item(sourceNames, i)
		
        local sourceName = obs.obs_data_get_string(item, "value")
		
        if sn == sourceName then
			
            local sh = obs.obs_source_get_signal_handler(source);
			
            obs.signal_handler_disconnect(sh,"item_visible",item_visible)
			
            obs.signal_handler_connect(sh,"item_visible",item_visible)
			
        end
		
    end
	
    obs.obs_data_array_release(sourceNames)

end

--
--	
--	
--
--
--
function script_load(settings)
	
    gs = settings
	
    always_show = obs.obs_data_get_bool(settings,"always_show")
	
    disable_script = obs.obs_data_get_bool(settings,"disable_script")
	
    local sh = obs.obs_get_signal_handler()
	
    obs.signal_handler_connect(sh, "source_load", loaded)
	
end

--
--	
--	
--
--
--
function script_unload()

end
