
--[[
----------------------------------------------------------

	https://github.com/dlrudie/Snip


----------------------------------------------------------
]]

obs = obslua
snip_path					= ""
p_settings 					= nil
current_id 					= "current_id" 
previous_id 				= "previous_id" 
snip_data = {
Snip_TrackId		= "Snip_TrackId.txt",
Snip_Album			= "Snip_Album.txt",
Snip_Artist			= "Snip_Artist.txt",
Snip_Track			= "Snip_Track.txt",
Snip_Artwork		= "Snip_Artwork.jpg"
}
interval = 1
--[[
----------------------------------------------------------
-- Use this to create a Script Log Output used in testing
----------------------------------------------------------
]]
local function log(name, msg)
  if msg ~= nil then
    msg = " > " .. tostring(msg)
  else
    msg = ""
  end
  obs.script_log(obs.LOG_DEBUG, name .. msg)
end
function script_description()
    return [[<HTML><body><center>
        <h2>Spotify Mac</h2>
        <h4>Display Now Playing Track Info</h4>
        <p>{n} = Name &nbsp;&nbsp;&nbsp; {a} = Artist</p>
        <p style="font-size: 11pt;"><i><a href="https://github.com/RayPS/obs-spotify-mac">version 1.1</a></i></p>
    </center></body></HTML>]]
end
--[[
----------------------------------------------------------
----------------------------------------------------------
]]
function timer()
update_sources()
end

--[[
----------------------------------------------------------

----------------------------------------------------------
]]
function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end
--[[
----------------------------------------------------------
----------------------------------------------------------
]]
function restart_timer(settings)
    interval = obs.obs_data_get_int(settings, "interval")
    obs.timer_remove(timer)
    obs.timer_add(timer, interval * 1000)
end

--[[
----------------------------------------------------------
	set source visibility
----------------------------------------------------------
]]
function set_visible(target_name, visible)
	local scenes = obs.obs_frontend_get_scenes()
	if scenes ~= nil then
		for i, scn in ipairs(scenes) do	
			local scene = obs.obs_scene_from_source(scn)
			local sceneitem = obs.obs_scene_find_source_recursive(scene, target_name)
			if sceneitem ~= nil then
				obs.obs_sceneitem_set_visible(sceneitem, visible)
				break	
			end	
		end --end for		
	end
end	
--[[
----------------------------------------------------------
	
----------------------------------------------------------
]]
function update_text(source, text)
	local settings = obs.obs_data_create()
	obs.obs_data_set_string(settings, "text", text)
	obs.obs_source_update(source, settings)
	obs.obs_data_release(settings)	
end

--[[
----------------------------------------------------------
	
----------------------------------------------------------
]]
function update_sources()
	local update_required = previous_id ~= current_id 
	if update_required then	
		previous_id = current_id
	end
	if snip_path ~= '' then
			for key,value in pairs(snip_data) do 
				local file_src = snip_path..'/'..value
				if file_exists(file_src) then
					file = io.open(file_src, "r")
					-- sets the default input file
					io.input(file)
					local contents = io.read()
					-- closes the open file
					io.close(file)	
					if key ~= 'Snip_TrackId' then -- Skip this file
						local source_name = string.gsub(key, '[_]+', ' ')
						local source = obs.obs_get_source_by_name(source_name)
						if source ~= nil then
							source_id = obs.obs_source_get_unversioned_id(source)
							ext = string.match(value, "^.+(%..+)$")
							if source_id == 'text_gdiplus' and ext == '.txt' then
								if update_required then	
									set_visible(source_name, false)
									update_text(source, contents)
									set_visible(source_name, true)
								end							
							end	
						else
							log(snip_path, ' The Source ['..source_name.. '] was not found.')
						end
					else
						current_id = contents
					end
					obs.obs_source_release(source)
				end	
			end	-- end for
	end	
end

--[[
----------------------------------------------------------
	Callback on list modification
----------------------------------------------------------
]]
function change_event(props, property, settings)
	local snip_path_prop = obs.obs_data_get_string(settings, "snip_path")	
	if snip_path_prop ~= '' then
		for key,value in pairs(snip_data) do 
			if key ~= 'Snip_TrackId' then
				local source_name = string.gsub(key, '[_]+', ' ')
				local source = obs.obs_get_source_by_name(source_name)
				if source ~= nil then
					source_id = obs.obs_source_get_unversioned_id(source)
					ext = string.match(value, "^.+(%..+)$")
					if source_id == 'image_source' and ext ~= '.jpg' then
					end

					if source_id == 'text_gdiplus' and ext ~= '.txt' then
					end	
					--log(snip_path_prop .. ' ' ..tostring(file_exists(snip_path_prop..'/'..value)), source_id.. ' '..source_name.. ' '..key.. ' '..value)
				else
					log(snip_path_prop, ' Source ['..source_name.. '] not found.')
				end
				obs.obs_source_release(source)				
			end
			if not file_exists(snip_path_prop..'/'..value) then
				--let's do something here
				--
				break
			end
		end	-- end for
	end
  -- IMPORTANT: returns true to trigger refresh of the properties
  return true
end

--[[
----------------------------------------------------------
	script_properties
----------------------------------------------------------
]]
function script_properties()
    local props = obs.obs_properties_create()
	local snip_path_prop = obs.obs_properties_add_path(props, "snip_path", "Snip Location",
        obs.OBS_PATH_DIRECTORY,
        nil,
        nil
    )
    obs.obs_properties_add_int(props, "interval", "Update Interval (s)", 1, 60, 1)
	obs.obs_property_set_modified_callback(snip_path_prop, change_event)
	obs.obs_properties_apply_settings(props, p_settings)
    return props
end

--[[
----------------------------------------------------------

----------------------------------------------------------
]]
function script_defaults(settings)
    obs.obs_data_set_default_int(settings, "interval", 1)
end

--[[
----------------------------------------------------------

----------------------------------------------------------
]]
function script_update(settings)
	snip_path = obs.obs_data_get_string(settings, "snip_path")	
	restart_timer(settings)
	p_settings = settings
end
