--[[
----------------------------------------------------------
Open Broadcaster Software®️
OBS > Tools > Scripts
----------------------------------------------------------
]]
--Globals
obs           				= obslua
gversion 					= 0.1
luafileTitle				= ""
luafile						= ".lua"
obsurl						= "/"
icon=""
desc	    				= [[
<hr/><center><h2>]] .. luafileTitle ..[[</h2>(Version: %s)</center>
<br><center><img width=50 height=50 src=']] .. icon .. [['/></center>
<br><center><a href="https://github.com/midnight-studios/obs-lua/blob/main/]] .. luafile ..[[">Find it on GitHub</a></center>
<br><p>Select an Item to minitor</p>
<p>Create a <b>New Scene</b> and add the following:
<ol>
<li><tt>`Colour Source`</tt></li>
<li><tt>`Text Source`</tt></li>
</ol></p>
<p>Add The New Scene to a new Source dock.</p>
<b>Dependencies</b>
<ol>
<li><a href="https://obsproject.com/forum/resources/source-dock.1317//">Source Dock</a></li><br></li>
</ol>

<p>Find help on the <a href="https://obsproject.com/forum/resources/]] .. obsurl ..[[">OBS Forum Thread</a>.</p>
<p><hr/></p>]]
script_settings 			= nil
backup_folder 				= ""
output_file_name 			= "-backup($date_stamp).json";
--  global context information
local ctx = {
    propsDef    = nil,  -- property definition
    propsDefSrc = nil,  -- property definition (source scene)
    propsSet    = nil,  -- property settings (model)
    propsVal    = {},   -- property values
    propsValSrc = nil,  -- property values (first source scene)
}
--[[
--------------------------------------------------------------------
 custom function:helper
--	If testing and log event writing is needed
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
--------------------------------------------------------------------
script_description()
--------------------------------------------------------------------
 this let OBS know this is a script
--------------------------------------------------------------------
]]
function script_description()
	return string.format( desc, tostring( gversion ) )
end

--[[
--------------------------------------------------------------------
--  helper function: set status message
--------------------------------------------------------------------
]]
local function statusMessage( type, message )
    if type == "error" then
        obs.script_log( obs.LOG_INFO, message )
        obs.obs_data_set_string( ctx.propsSet, "statusMessage", string.format( "ERROR: %s", message ) )
    else
        obs.script_log(obs.LOG_INFO, message)
        obs.obs_data_set_string( ctx.propsSet, "statusMessage", string.format( "INFO: %s", message ) )
    end
    obs.obs_properties_apply_settings( ctx.propsDef, ctx.propsSet )
    return true
end
--[[
--------------------------------------------------------------------
--  helper function: find scene by name
--------------------------------------------------------------------
]]
local function findSceneByName( name )
    local scenes = obs.obs_frontend_get_scenes()
    if scenes == nil then
        return nil
    end
    for _, scene in ipairs( scenes ) do
        local n = obs.obs_source_get_name( scene )
        if n == name then
            obs.source_list_release( scenes )
            return scene
        end
    end
    obs.source_list_release( scenes )
    return nil
end
--[[
--------------------------------------------------------------------
--  helper function: replace a string
--------------------------------------------------------------------
]]
local function stringReplace( str, from, to )
    local function regexEscape(s)
        return string.gsub( s, "[%(%)%.%%%+%-%*%?%[%^%$%]]", "%%%1" )
    end
    return string.gsub( str, regexEscape( from ), to )
end
--[[
--------------------------------------------------------------------
--  helper function: update source scenes property
--------------------------------------------------------------------
]]
local function updateSourceScenes()
    if ctx.propsDefSrc == nil then
        return
    end
    obs.obs_property_list_clear( ctx.propsDefSrc )
    local scenes = obs.obs_frontend_get_scenes()
    if scenes == nil then
        return
    end
    ctx.propsValSrc = nil
    for _, scene in ipairs( scenes ) do
        local n = obs.obs_source_get_name( scene )
        obs.obs_property_list_add_string( ctx.propsDefSrc, n, n )
        ctx.propsValSrc = n
    end
    obs.source_list_release( scenes )
end

--[[
----------------------------------------------------------
-- 
----------------------------------------------------------
]]
function write_to_json( data )
	if backup_folder == nil or backup_folder == "" then
		    --  final hint
    	statusMessage("error", "Backup Folder not defined.")
		
		return false
		
	end	
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
--------------------------------------------------------------------
--  
--------------------------------------------------------------------
]]
--[[
--------------------------------------------------------------------
--  
--------------------------------------------------------------------
]]
--[[
--------------------------------------------------------------------
--  
--------------------------------------------------------------------
]]
--[[
--------------------------------------------------------------------
--  
--------------------------------------------------------------------
]]
--[[
--------------------------------------------------------------------
--  
--------------------------------------------------------------------
]]
local function exportScene()
    --  find source scene (template)
    local sourceScene = findSceneByName(ctx.propsVal.sourceScene)
    if sourceScene == nil then
        statusMessage("error", string.format("source scene \"%s\" not found!",
            ctx.propsVal.sourceScene))
        return true
    end

	get_scene_data( sourceScene )
	
	
    return true
end


function get_scene_data( sourceScene )
	
    --  iterate over all source scene sources
	

	
	
	
	source = obs.obs_get_source_by_name( ctx.propsVal.sourceScene ) -- Increments the source reference counter, use obs_source_release() to release it when complete.
			log("source_settings", source_settings)
	--[[
		Found Source:
	]]		
	if source ~= nil then
		log("sourceScene", sourceScene)
		local source_settings = obs.obs_source_get_settings( source )
			
			log("source_settings", source_settings)
	   
	end
		--[[
			We are done with the source,
			let's release the referrence 
		]]
		obs.obs_source_release( source )
	
	
	
    
	
	
	return data
	
end

--[[
--------------------------------------------------------------------
script_properties()
--------------------------------------------------------------------
Called to define user properties associated with the script. 
These properties are used to define how to show settings 
properties to a user.

Returns: 
obs_properties_t object created via obs_properties_create().
--------------------------------------------------------------------
]]
function script_properties()
    --  create new properties
    ctx.propsDef = obs.obs_properties_create()

    --  create status field (read-only)
    local status = obs.obs_properties_add_text( ctx.propsDef, "statusMessage",
        "Status Message:", obs.OBS_TEXT_MULTILINE )
    obs.obs_property_set_enabled(status, false )
	
    --  create source scene list
    ctx.propsDefSrc = obs.obs_properties_add_list( ctx.propsDef,
        "sourceScene", "Export Scene:",
        obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING )
    updateSourceScenes()

    --  create target scene field
  --  obs.obs_properties_add_text( ctx.propsDef, "targetScene", "Target Scene (Clone):", obs.OBS_TEXT_DEFAULT )

	
	
	
	
	
	local p_44 = obs.obs_properties_add_path( ctx.propsDef, "backup_folder", "Backup Folder", obs.OBS_PATH_DIRECTORY, nil, nil)
	
	
	
	
	
    --  create clone button
    obs.obs_properties_add_button( ctx.propsDef, "exportScene",
        "Export", exportScene )
    --  apply values to definitions
    obs.obs_properties_apply_settings( ctx.propsDef, ctx.propsSet )
    return ctx.propsDef
end
--[[
--------------------------------------------------------------------
script_defaults(settings)
--------------------------------------------------------------------
Called to set default settings (if any) associated with the script. 
You would typically call Default Value Functions for the on the 
settings in order to set its default values.

Parameters
settings – Settings associated with the script.
--------------------------------------------------------------------
]]
function script_defaults(settings)
    --  update our source scene list (for propsValSrc below)
    updateSourceScenes()
    --  provide default values
    obs.obs_data_set_default_string( settings, "sourceScene",   ctx.propsValSrc )
   -- obs.obs_data_set_default_string( settings, "targetScene",   "Scene-01" )
    obs.obs_data_set_default_string( settings, "statusMessage", "" )
end
--[[
--------------------------------------------------------------------
script_update(settings)
--------------------------------------------------------------------
Called when the script’s settings (if any) have been changed by the 
user.

Parameters:
settings – Settings associated with the script.
--------------------------------------------------------------------
]]
function script_update( settings )
    --  remember settings
    ctx.propsSet = settings

    --  fetch property values
    ctx.propsVal.sourceScene   = obs.obs_data_get_string( settings, "sourceScene" )
    --ctx.propsVal.targetScene   = obs.obs_data_get_string( settings, "targetScene" )
    ctx.propsVal.statusMessage = obs.obs_data_get_string( settings, "statusMessage" )
	
	backup_folder = obs.obs_data_get_string( settings, "backup_folder" )
	-- Keep track of current settings
  	script_settings = settings 
end
--[[
----------------------------------------------------------
Callback on property modification
----------------------------------------------------------
]]
function property_onchange( props, property, settings )
  -- IMPORTANT: returns true to trigger refresh of the properties
  return true
end
--[[
--------------------------------------------------------------------
script_load(settings)
--------------------------------------------------------------------
Called on script startup with specific settings associated with the
script. 

The settings parameter provided is not typically used for settings 
that are set by the user; instead the parameter is used for any 
extra internal settings data that may be used in the script.

Parameters:
settings – Settings associated with the script.
--------------------------------------------------------------------
]]
function script_load( settings )
    --  clear status message
    obs.obs_data_set_string( settings, "statusMessage", "" )

    --  react on scene list changes
    obs.obs_frontend_add_event_callback( function( event )
        if event == obs.OBS_FRONTEND_EVENT_SCENE_LIST_CHANGED then
            --  update our source scene list
            updateSourceScenes()
        end
        return true
    end )	
	-- Keep track of current settings	
  	script_settings = settings
end

