-- Open Broadcaster Software®️
-- OBS > Tools > Scripts
--
-- 30/03/2021 14:58 @midnight-studios
--
--	Globals
obs           = obslua
source_name   = ""
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
--
--
--
--
--
function source_enable()
    local scenes = obs.obs_frontend_get_scenes()
    if scenes ~= nil then
        for _, scenesource in ipairs(scenes) do
            local scenename = obs.obs_source_get_name(scenesource)
            local scene = obs.obs_scene_from_source(scenesource)
            local sceneitems = obs.obs_scene_enum_items(scene)
			local sourcename = ''
			
            for i, sceneitem in ipairs(sceneitems) do
				
                local source = obs.obs_sceneitem_get_source(sceneitem)
				
				local group = obs.obs_group_from_source(source)
				
				sourcename = obs.obs_source_get_name(source)
				
				if group ~= nil then
				
					local groupitems = obs.obs_scene_enum_items(group)	

					if groupitems ~= nil then
						
						for j, groupitem in ipairs(groupitems) do

							local groupitemsource = obs.obs_sceneitem_get_source(groupitem)

							sourcename = obs.obs_source_get_name(groupitemsource)
							
							if not obs.obs_source_enabled(groupitemsource) then
								
								log(sourcename, obs.obs_source_enabled(groupitemsource))
								obs.obs_source_set_enabled(groupitemsource,true)
							end

						end -- end for

						obs.sceneitem_list_release(groupitems)
					end
				end	
				
				if not obs.obs_source_enabled(source) then 
					
					log(sourcename, obs.obs_source_enabled(source))
					obs.obs_source_set_enabled(source,true)
					
				end
            end
            obs.sceneitem_list_release(sceneitems)
        end
        obs.source_list_release(scenes)
        --obs.obs_frontend_source_list_free(scenes)
    end
end

function script_properties()

end

function script_description()
	return "Enable all scene items"
end

function script_update(settings)
source_enable()
end

function script_defaults(settings)

end

function script_load(settings)
    script_update(settings)
end