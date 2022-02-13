--[[
Lua Color Source for OBS Studio
Copyright (C) 2018 iwatchtwitchsometimes

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
]]--

-- See original C source code, which is part of the OBS Studio source
-- https://raw.githubusercontent.com/obsproject/obs-studio/master/plugins/image-source/color-source.c
-- Since this is based on GPLv2 licensed code, the following licensing applies:

local bit = require("bit")
local obs = obslua
local lcolor_source = {}
lcolor_source.id = "lcolor_source"
lcolor_source.type = obs.OBS_SOURCE_TYPE_INPUT
lcolor_source.output_flags = bit.bor(obs.OBS_SOURCE_VIDEO, obs.OBS_SOURCE_INTERACTION)

lcolor_source.get_name = function()
        return "Lua Color Source"
end

function get_modifiers(ctx)
  local key_modifiers = ctx or {}
  local shift = key_modifiers.shift or false
  local control = key_modifiers.control or false
  local alt = key_modifiers.alt or false
  local command = key_modifiers.command or false
  local modifiers = 0

  if shift then modifiers = bit.bor(modifiers, INTERACT_SHIFT_KEY) end
  if control then modifiers = bit.bor(modifiers, INTERACT_CONTROL_KEY) end
  if alt then modifiers = bit.bor(modifiers, INTERACT_ALT_KEY) end
  if command then modifiers = bit.bor(modifiers, INTERACT_COMMAND_KEY) end
  return modifiers
end

function send_key(source, hotkey_id_name, key_up, key_modifiers)

    local key = obs.obs_key_from_name(hotkey_id_name);
    local vk = obs.obs_key_to_virtual_key(key);
    local event = obs.obs_key_event();
    event.native_vkey = vk;
    event.modifiers = get_modifiers(key_modifiers); -- bit or combination with interact keys
    event.native_modifiers = event.modifiers;
    event.native_scancode = vk;
    event.text = "" -- it possible to leave it blank, keys are sent
    obs.obs_source_send_key_click(source, event, key_up);
end

info.mouse_move = function(settings, source)
		-- do stuff
	print('foo')
end

lcolor_source.create = function(settings, source)
        data = {}
        data.params = {}
        data.context = source
        data.color = obs.vec4()
        lcolor_source.defaults(settings)
        lcolor_source.update(data,settings)
        return data
end

lcolor_source.update = function(data, settings)	
		local color = obs.obs_data_get_int(settings, "color")
		data.width = obs.obs_data_get_int(settings, "width")
		data.height = obs.obs_data_get_int(settings, "height")
		obs.vec4_from_rgba(data.color, color)
end

lcolor_source.get_properties = function(data)
	local props = obs.obs_properties_create()
	obs.obs_properties_add_color(props, "color","Color")
	obs.obs_properties_add_int(props, "width","Width", 0, 4096, 1)
	obs.obs_properties_add_int(props, "height","Height", 0, 4096, 1)
	return props
end

lcolor_source.video_render = function(data,effect)
	local solid = obs.obs_get_base_effect(obs.OBS_EFFECT_SOLID)
	local color = obs.gs_effect_get_param_by_name(solid, "color")
	local tech  = obs.gs_effect_get_technique(solid, "Solid")

	obs.gs_effect_set_vec4(color, data.color)
	obs.gs_technique_begin(tech)
	obs.gs_technique_begin_pass(tech, 0)
	obs.gs_draw_sprite(nil, 0, data.width, data.height)
	obs.gs_technique_end_pass(tech)
	obs.gs_technique_end(tech)
end

lcolor_source.get_width = function(data)
	return data.width
end

lcolor_source.get_height = function(data)
	return data.height
end

lcolor_source.defaults = function(settings)
	obs.obs_data_set_default_int(settings, "color", 0xFFFFFFFF)
	obs.obs_data_set_default_int(settings, "width", 400)
	obs.obs_data_set_default_int(settings, "height", 400)
end

obs.obs_register_source(lcolor_source)
