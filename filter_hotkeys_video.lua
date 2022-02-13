-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at https://mozilla.org/MPL/2.0/.
-- Author upgradeQ , project homepage github.com/upgradeQ/obs-filter-hotkeys
local obs = obslua
local bit = require("bit")

function script_description()
  return [[Select source with filters, add "Filter hotkeys video/audio" to it. <br>
In settings bind hotkeys for each filter. <br> 
Note: 0 - means disable filter , 1 - enable , 2 - toggle, 3 - hold ]]
end

local info = {} -- obs_source_info https://obsproject.com/docs/reference-sources.html
info.id = "_filter_hotkeys_video"
info.type = obs.OBS_SOURCE_TYPE_FILTER
info.output_flags = bit.bor(obs.OBS_SOURCE_VIDEO)

info.get_name = function() return 'Filter hotkeys video by upgradeQ' end

info.create = function(settings,source) 
  local filter = {}
  filter.context = source
  filter.created_hotkeys = false
  filter.hotkeys = {}
  filter.hk = {}
  return filter
end

info.reg_htk = function(filter,settings)  -- registered in video_render
  local parent = obs.obs_filter_get_parent(filter.context)
  local source_name = obs.obs_source_get_name(parent)
  filter.target = parent
  local proceed = false
  if parent and source_name then proceed = true end
  if not proceed then return elseif filter.created_hotkeys then return end


  local result = obs.obs_source_enum_filters(filter.target)
  for k,v in pairs(result) do
    _id = obs.obs_source_get_id(v)
    if _id ~= "_filter_hotkeys_video" then
      filter_name = obs.obs_source_get_name(v)

      filter.hotkeys["1;" .. source_name .. ";" .. filter_name] = function()
        obs.obs_source_set_enabled(v,true)
      end

      filter.hotkeys["0;" .. source_name .. ";" .. filter_name] = function()
        obs.obs_source_set_enabled(v,false)
      end

      filter.hotkeys["2;" .. source_name .. ";" .. filter_name] = function()
        local switch = not obs.obs_source_enabled(v)
        obs.obs_source_set_enabled(v,switch)
      end

      filter.hotkeys["3;" .. source_name .. ";" .. filter_name] = function(pressed)
        if pressed then
          obs.obs_source_set_enabled(v,true)
        else
          obs.obs_source_set_enabled(v,false)
        end
      end

    else
      obs.obs_source_set_enabled(v,false)
    end

  end
  obs.source_list_release(result)

  for k,v in pairs(filter.hotkeys) do 
    filter.hk[k] = obs.OBS_INVALID_HOTKEY_ID
  end

  for k, v in pairs(filter.hotkeys) do 
    if k:sub(1,1) == "3" then -- for hold hotkeys which start with 3 symbol 
      filter.hk[k] = obs.obs_hotkey_register_frontend(k, k, function(pressed)
        if pressed then filter.hotkeys[k](true)
        else
          filter.hotkeys[k](false)
        end
      end)
    else
      filter.hk[k] = obs.obs_hotkey_register_frontend(k, k, function(pressed)
        if pressed then 
          filter.hotkeys[k]() 
        end 
      end)
    end
    local a = obs.obs_data_get_array(settings, k)
    obs.obs_hotkey_load(filter.hk[k], a)
    obs.obs_data_array_release(a)
  end
  if not filter.created_hotkeys then
    filter.created_hotkeys = true
  end
end

info.video_render = function(filter,_effect)
  info.reg_htk(filter,nil)
end

info.load = function(filter,settings)
  info.reg_htk(filter,settings)
end

info.save = function(filter,settings)
  if filter.created_hotkeys then filter.created_hotkeys = true end
  for k, v in pairs(filter.hotkeys) do
    local a = obs.obs_hotkey_save(filter.hk[k])
    obs.obs_data_set_array(settings, k, a)
    obs.obs_data_array_release(a)
  end
end

obs.obs_register_source(info)
