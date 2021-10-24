--[[
----------------------------------------------------------
Dependencies
	https://github.com/dlrudie/Snip
	https://obsproject.com/forum/resources/source-copy.1261/
----------------------------------------------------------
]]
obs = obslua
icon="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABUAAAAVCAMAAACeyVWkAAAABGdBTUEAALGPC/xhBQAAAAFzUkdCAK7OHOkAAAMAUExURQAAADVNcj1ZfjpUem+Xzm+ZzkBbhCxBZDpReGOOwTBIbDdQdjBHajBGaTxYfzdSeD5Yfy1CZTxYfz5bfzlSez1ZgC1DZk5ynTJGaUlkljNKbjdSeCU3WURhjUZdlT1YgjdSejRPeHKe3TdSfTRRdzFKck5yojZRezROdz1cilJzpG2U0D1aikRhkVN1qW6WyEJjkmuZz3yl3Vd5sG+b0kVllkBgjVp5sjxYhlh9sD1bi12DtlN2qF+EtkprnFJ1qEpqnEZmlS5DYi5DYS9EZC1CYTpWgStBYCg9Xi1CYis+XC5DYy9FZSo+WzVPdSk8WS1CZDhSeytDaClBaT5ciy5EYitBZC5EYyk9XTBHaS5EZS5EZi5HajpXgjNLbzJLbzNMdDxZhjFIazVOdDRMcDBHZz1bji9FZi9FZD5djT9ejTFJcCg6VSc5VDhTfDtYkDRNcjJJazBJcTtXgyxBYTFLcE1zrTVNckhspExyrTNMckFhkjdSe0tvqDhTfj1biThThE10sjlViU92uEJilTlViE1zsS5IdlB4u1J7u0ZpoFWAxVWAxFaCxyY5WSk8XSxCYkFgkjNLcEJikjZQeUFgkDZRiEltpzhUhylCYSc8XDNKbig9YCk/YDtZiUJjnThTezVPgy1DaDNKbUNjmy9FY01zsC1BYCQ1TzpXiyc4UzVPfi9GZSc5UzNMcTpXkDNMeTdReytAXjBHa0JiljFIbjZSfEBgkDxahTpWgFB3tDBLdS5GbDpWhEJjmjZRhj5ckD1aiS5Ic0ZonjdUf0hrpUVnozdSeTpVf050sj5ciUdqozdSiDxZlkZpqT5dnzNPeT5biDdShEVmny5Jd1N8vlB4uD5gllJ7vkJjqjdRgUtxq1R+wj9fjUVom0JipTtXk050q0RlnUJjoUFhkD5ckzlVhUhtq0FipDJNdic/ZixFby1HdFR+w0VnrDtckU51tFWBxztaiVeDyzVThVuK1FeEzV+P3UFmoTRSgkJnpFeDyV2L2EZtrDlZjzpbktWB7AYAAABCdFJOUwDaKo4hJyz5HATrpuXpaqAU8mUHoofzGYkgztnsEn5nre4I7cH7pfDwwoAw8K5oNOUTDpwf2OCL85P+ea9z47Pg8n4eNa8AAAGqSURBVBjTY2AAAwEhfh5BXm4+DgYkICrmETEhyjOin52ZEybGITXL3cnJGQic3PsY2SCC4jJzXZZmuHg6AYFzuAc7E1hU2iPDKzdnuberqytIeRiXMFBQYk6q74qctTlRqT4+4eEuod5hIgwMstkBy1f5pxT6+xTMnhQX6eTlFRAjySAf5L3Ga1PyOtfSwAV+Se7+vk4uM+UYFILS4+JLAtKTiosTIj2j45NT0hepMCjGFJYH1lRtLdqYWJcwxS020G/xZg2GoqrymhOnsg7u3bB6XubkrES3PL8CVQbl7ONuF0MaWlu2rFw4I23i1PrYvFJ1Bt2guvqQW5fO5FdULMmf1pS2PWTnHk0GvSC3J89auy6fPVZWOX3++v0NmTuCtRgML7xsaXr68Pb5c7valpUd3XegettuFgYG81d3Hz14fP9mc2dHc2NlbW11sBooHMxe33v+4l1Hz9s7N641njx8SEcJJGpi8aars6f397fPH7uvnr5yRBsSlKym7e+X9Xz9/qf3w/UrBvqwYOe0tPr578ffX/+/fDI2QooiFlsbB0c7e2tWCBcAoM+og4eNf/wAAAAASUVORK5CYII="
desc = [[
<hr/><center><h2>Snip - Spotify & iTunes</h2></center>
<br><center><img width=38 height=42 src=']] .. icon .. [['/></center>
<br><center><a href="https://github.com/midnight-studios/obs-lua/blob/main/Snip.lua">Find it on GitHub</a></center>
<br>

<p><font color=#d6faf4><em><b>Snip.exe</b></em></font> - is a small application that sits in the system tray and updates a text file with the currently playing audio track.</p>
<p><font color=#f1deff><em><b>Snip.lua</b></em></font> - reads the information from the text files for the currently playing audio track and updates 'Text Sources' in OBS.</p>

<p><font color=#d6faf4><em><b>Snip.exe</b></em></font> - will write a generic format output to a file called <tt>`Snip.txt`</tt> within the same folder as <em>`Snip.exe`</em>.</p>

<p><b>To use with <font color=#f1deff>OBS Lua</font> in this script</b> you have to choose <font color=#d6faf4>`Save information separately`</font> within the settings for <font color=#d6faf4><em><b>Snip.exe</b></em></font></p> 

<p>This will create the following files:
<ol>
<li><tt>`Snip_Artist.txt`</tt></li>
<li><tt>`Snip_Track.txt`</tt></li>
<li><tt>`Snip_Album.txt`</tt></li>
</ol></p>


<p>Use <a href="https://obsproject.com/forum/resources/source-copy.1261/"><font color=#d6faf4>Source Copy</font></a> to import Snip `Scene & Sources` from <font color=#fdfdd6><em><b>Snip.json</b></em></font></p>

<p>Find help on the <a href="https://obsproject.com/forum/resources/snip-now-playing-spotify-itunes.1377/">OBS Forum Thread</a>.</p>

<p><strong>The freeware platform</strong> for <a href="https://github.com/dlrudie/Snip/">Snip</a> is Copyright 2012-2021 David Rudie</p>

<p>Dependencies
<ol>
<li><a href="https://github.com/dlrudie/Snip">Find Snip Application on GitHub</a><br></li>
<li><a href="https://github.com/midnight-studios/obs-lua/blob/main/Snip/">Find Snip OBS Lua on GitHub</a><br></li>
<li><a href="https://obsproject.com/forum/resources/source-copy.1261/">Find OBS Source Copy</a></li><br></li>
</ol>
</p>
<hr/>
]]
snip_source 				= nil
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
validated 			= false
      -- or --
--local inspect = require 'lib.inspect'
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

--[[
----------------------------------------------------------
----------------------------------------------------------
]]
function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

--[[
----------------------------------------------------------
----------------------------------------------------------
]]
function script_description()
	return desc
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
function restart_timer(settings)
    obs.timer_remove(timer)
    obs.timer_add(timer, interval * 1000)
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
		obs.bfree(scn)
		obs.source_list_release(scenes)
	end
end	

--[[
----------------------------------------------------------
	Check source visibility
----------------------------------------------------------
]]
function is_visible(target_name)
	local v_state = nil
	if target_name ~= nil then
		local scenes = obs.obs_frontend_get_scenes()
		if scenes ~= nil then
			for i, scn in ipairs(scenes) do	
				local scene = obs.obs_scene_from_source(scn)
				local sceneitem = obs.obs_scene_find_source_recursive(scene, target_name)
				if sceneitem ~= nil then
					v_state = obs.obs_sceneitem_visible(sceneitem)
					break	
				end	
			end --end for	
			obs.bfree( scene )	
			obs.source_list_release(scenes)
		end
	end	
	return v_state
end

--[[
----------------------------------------------------------
	Check source visibility
----------------------------------------------------------
]]
function enum_sources(id_type)
	local tbl = {}
	local scenes = obs.obs_frontend_get_scenes()
	if scenes ~= nil then
		for i, scn in ipairs(scenes) do	
			local scene = obs.obs_scene_from_source(scn)
			local sceneitems = obs.obs_scene_enum_items(scene)
			for i, sceneitem in ipairs(sceneitems) do
				local source = obs.obs_sceneitem_get_source(sceneitem)
				local group = obs.obs_group_from_source(source)
				local name = obs.obs_source_get_name(source)
				local source_id = obs.obs_source_get_unversioned_id(source)
				if sceneitem ~= nil then
					if id_type ~= nil then
						if id_type == source_id then
							tbl[name] = source_id
						end
					else
						tbl[name] = source_id	
					end		
				end	
				if group ~= nil then -- The Source is nested inside a group
					local groupitems = obs.obs_scene_enum_items(group)	
					if groupitems ~= nil then
						for j, groupitem in ipairs(groupitems) do
							local groupitemsource = obs.obs_sceneitem_get_source(groupitem)
							name = obs.obs_source_get_name(groupitemsource)
							source_id = obs.obs_source_get_unversioned_id(groupitemsource)
							if sceneitem ~= nil then					
								if id_type ~= nil then
									if id_type == source_id then
										tbl[name] = source_id
									end
								else
									tbl[name] = source_id	
								end	
							end	
						end -- end for j
						obs.sceneitem_list_release(groupitems)
					end  -- end if groupitems
				end -- if group
			end	 -- end for isceneitems	
		obs.sceneitem_list_release(sceneitems)		
		end --end for	
		obs.source_list_release(scenes)	
	end
	return tbl
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
	if not validated then return end
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
									if is_visible(source_name) then
										set_visible(source_name, false)
									end		
									if contents ~= nil then
										update_text(source, contents)
										if not is_visible(source_name) then
											set_visible(source_name, true)
										end		
									end	
								end							
							end	
						else
							--log(snip_path, ' The Source ['..source_name.. '] was not found.')
						end
					else
						if contents ~= nil then
							current_id = contents
							if snip_source ~= nil then
								if not is_visible(snip_source) then
									set_visible(snip_source, true)
								end	
							end
						else
						-- check if snip is nested, if it is and Spotify is not playing, hide snip		
						if snip_source ~= nil then
							if is_visible(snip_source) then
								set_visible(snip_source, false)
							end	
						end
							current_id = "current_id"
						end
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
function validate_sources(path)
	local state = nil
	local msg = 'Plugin Enabled'
	if path ~= nil and path ~= '' then
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
				else
					state = 3
					msg = 'Plugin Disabled.  Source ['..source_name.. '] not found.'
					break
				end
				obs.obs_source_release(source)				
			end
			if not file_exists(path..'/'..value) then
				state = 4
				msg = 'Plugin Disabled.  Path ['..path..'/'..value.. '] not found.'
				break
			end
		end	-- end for
	else
		state = 5 
		msg = 'Plugin Disabled.  Source Path not defined.'
	end
	if state == nil then
		validated = true
	end	
	return state, msg
end




--[[
----------------------------------------------------------
	Callback on list modification
----------------------------------------------------------
]]
function change_event(props, property, settings)
	local path_prop = obs.obs_data_get_string(settings, "snip_path")
	local desc_path_prop = obs.obs_property_description(obs.obs_properties_get(props, "snip_path"))
	local state, msg = validate_sources(path_prop)
	local color = '#fff'
	local show_notice = false 
	if state ~= nil then
		if state ~= 0 then
			show_notice = true
		end
		if state == 3 then	
			show_notice = true
			color = '#b4d2f8'
		end
		if state == 5 then	
			show_notice = true
			color = '#f8b4b4'
		end
	else
		--show_notice = true
		local source = obs.obs_get_source_by_name('Snip Artwork')
		if source ~= nil then
			local c_path = obs.obs_data_get_string(settings, "file")
			local n_path = path_prop .. '/Snip_Artwork.jpg'
			local settings = obs.obs_source_get_settings(source)
			if c_path == '' then
				obs.obs_data_set_string(settings, "file", n_path)
			end	
		end	
			obs.obs_source_update(source, settings)
			obs.obs_data_release(settings)
	end	
	obs.obs_property_set_visible(obs.obs_properties_get(props, "notice"), show_notice)
	obs.obs_property_set_description(obs.obs_properties_get(props, "notice"), msg)
	obs.obs_property_set_description(obs.obs_properties_get(props, "snip_path"), '<font color='..color..'>'.. desc_path_prop .. '</font>')
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
	local gp = obslua.obs_properties_create()
	local notice = obs.obs_properties_add_group(props, 'notice', "Notice", obs.OBS_GROUP_NORMAL, gp)
	local snip_path_prop = obs.obs_properties_add_path(props, "snip_path", "Snip Location", obs.OBS_PATH_DIRECTORY, nil, nil)
    local p_i = obs.obs_properties_add_int(props, "interval", "Update Interval(s)", 1, 60, 1)
	obs.obs_property_int_set_suffix(p_i, " Seconds");
	obs.obs_property_set_long_description(p_i, "\nInterval = Time between checks looking for changes.")
	local sources = enum_sources('scene')
	local p_c = obs.obs_properties_add_list(props, "snip_source", "<i>Snip Source</i>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING)
	obs.obs_property_set_long_description(p_c, "\nIf using a nested 'Snip' Scene as a Source.\nThis will switch the visibility of the Source when a track is played.\n")
	if sources ~= nil then
		if tablelength(sources) > 0 then
			obs.obs_property_list_add_string(p_c, "Select", "select")
		else
			obs.obs_property_list_add_string(p_c, "Not Available", "none")
		end
		for key, value in pairs(sources) do
			if value == 'scene' then
				obs.obs_property_list_add_string(p_c, key, key)
			end
		end	
	end
	obs.source_list_release(sources)
	obs.obs_property_set_modified_callback(snip_path_prop, change_event)
	obs.obs_properties_apply_settings(props, p_settings)
    return props
end

--[[
----------------------------------------------------------

----------------------------------------------------------
]]
function script_defaults(settings)
    obs.obs_data_set_default_int(settings, "interval", 2)
end

--[[
----------------------------------------------------------

----------------------------------------------------------
]]
function script_update(settings)
	snip_path = obs.obs_data_get_string(settings, "snip_path")	
	interval = obs.obs_data_get_int(settings, "interval")
	snip_source = obs.obs_data_get_string(settings, "snip_source")
	if snip_source == "select" or snip_source == "none" then
		snip_source = nil
	end 	
	restart_timer(settings)
	p_settings = settings
end
