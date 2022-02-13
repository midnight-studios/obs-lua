obs = obslua
local ffi = require("ffi")
local bit = require("bit")

function on_event(event)
    if event == obs.OBS_FRONTEND_EVENT_FINISHED_LOADING then
        
    end
end
        
function script_properties()
    local properties = obs.obs_properties_create();

    return properties;
end

function script_defaults(settings)
end

function create_source()
    local info = {};
    info.id = "my_source_id";
    info.type = obs.OBS_SOURCE_TYPE_INPUT;
    info.output_flags = obs.OBS_SOURCE_VIDEO;

    info.get_name = function()
            return "My Source";
    end

    info.mouse_move = function(settings, source)
            -- do stuff
		print('Move')
    end

    info.key_click = function(settings, source)
            -- do stuff
		
		print('Click')
    end

    -- register the source
    obs.obs_register_source(info);
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

function send_mouse_move(source, x, y, key_modifiers)
  local event = obs.obs_mouse_event()
  event.modifiers = get_modifiers(key_modifiers)
  event.x = x -- top left is [0,0] 
  event.y = y
  obs.obs_source_send_mouse_move(source,event,false) -- do not leave
end

function script_update(settings)
    
    --[[--]]
	
	local sources = obs.obs_enum_sources();
    if sources ~= nil then
        for _, source in ipairs(sources) do
            local source_id = obs.obs_source_get_id(source);
            local source_name = obs.obs_source_get_display_name(source_id);
            local source_flags = obs.obs_source_get_output_flags(source);
            
            -- bitwise left shift: 1 << 5
            local OBS_SOURCE_INTERACTION = bit.lshift(1, 5);
            
            -- bitwise and: source_flags & OBS_SOURCE_INTERACTION
            -- AFAIK sources created in GUI are interactible by default
            -- so getting flags and checking for OBS_SOURCE_INTERACTION is not necessary
            if bit.band(source_flags, OBS_SOURCE_INTERACTION)  then
                print("interactible");
                print(string.format("%s (%s): %s", tostring(source_name), tostring(source_id), tostring(source_flags)));
                
                send_key(source, "OBS_KEY_Q", false);
                send_mouse_move(source, 5, 10);
            end
        end
    end
    obs.source_list_release(sources);

    --local source = obs.obs_get_source_by_name(text_source);
    
    local source = create_source();
    send_key(source, "OBS_KEY_Q", false);
    send_mouse_move(source, 5, 10);
    
    return 
end

function script_description()
    return "xx"
end

function script_load(settings)
    print("script loaded");
    obs.obs_frontend_add_event_callback(on_event);
end