local bit = require("bit");
local obs = obslua;
local info = {};
info.id = "e_color_source";

info.type = obs.OBS_SOURCE_TYPE_INPUT;

info.output_flags = bit.bor(obs.OBS_SOURCE_VIDEO, obs.OBS_SOURCE_INTERACTION);

info.get_name = function()
        return "e Color Source"
end

--[[

local event = obs.obs_mouse_event()
local mouse_up = true
local type = obs.INTERACT_MOUSE_LEFT
local event = obs.obs_key_event();
event.modifiers = get_modifiers(key_modifiers); -- bit or combination with interact keys

obs.MOUSE_LEFT = 0
obs.MOUSE_MIDDLE = 1
obs.MOUSE_RIGHT = 2

modifiers = event.modifiers
x = event.x
x = event.x
e.modifiers = modifiers;
e.x = x;
e.y = y;

e, buttonType, mouse_up, click_count

winapi = require("winapi")
require("winapi.cursor")
require("winapi.keyboard")
require("winapi.window")
require("winapi.winbase")

local mouse_down = winapi.GetAsyncKeyState(winapi.VK_LBUTTON)




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
]]

info.create = function(settings, source)
        data = {}
        data.params = {}
        data.context = source
        data.color = obs.vec4()
        info.defaults(settings)
        info.update(data,settings)
        return data
end

info.mouse_click = function()
		-- do stuff
	print('received mouse_click')

	obs.blog(obs.LOG_WARNING, string.format("'%s' Requested '%s'", tostring(info.id), tostring('key_click')))
end


info.update = function(data, settings)   
	obs.blog(obs.LOG_WARNING, string.format("'%s' Requested '%s'", tostring(info.id), tostring('update')))
        local color = obs.obs_data_get_int(settings, "color")
        data.width = obs.obs_data_get_int(settings, "width")
        data.height = obs.obs_data_get_int(settings, "height")
        obs.vec4_from_rgba(data.color, color)
end

info.get_properties = function(data)
    local props = obs.obs_properties_create()
    obs.obs_properties_add_color(props, "color","Color")
    obs.obs_properties_add_int(props, "width","Width", 0, 4096, 1)
    obs.obs_properties_add_int(props, "height","Height", 0, 4096, 1)
    return props
end

info.video_render = function(data,effect)
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

info.get_width = function(data)
    return data.width
end

info.get_height = function(data)
    return data.height
end

info.defaults = function(settings)
    obs.obs_data_set_default_int(settings, "color", 0xFFFFFFFF)
    obs.obs_data_set_default_int(settings, "width", 1920)
    obs.obs_data_set_default_int(settings, "height", 1080)
end

obs.obs_register_source(info)