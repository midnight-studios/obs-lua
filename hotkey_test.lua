-- send_hotkey.lua
local obs = obslua
local bit = require('bit')

function send_hotkey(hotkey_id_name,key_modifiers)
  shift = key_modifiers.shift or false
  control = key_modifiers.control or false
  alt = key_modifiers.alt or false
  command = key_modifiers.command or false
  modifiers = 0

  if shift then modifiers = bit.bor(modifiers,obs.INTERACT_SHIFT_KEY ) end
  if control then modifiers = bit.bor(modifiers,obs.INTERACT_CONTROL_KEY ) end
  if alt then modifiers = bit.bor(modifiers,obs.INTERACT_ALT_KEY ) end
  if command then modifiers = bit.bor(modifiers,obs.INTERACT_COMMAND_KEY ) end

  combo = obs.obs_key_combination()
  combo.modifiers = modifiers
  combo.key = obs.obs_key_from_name(hotkey_id_name)

  if not modifiers and
    (combo.key == obs.OBS_KEY_NONE or combo.key >= obs.OBS_KEY_LAST_VALUE) then
    return error('invalid key-modifier combination')
  end

  obs.obs_hotkey_inject_event(combo,false)
  obs.obs_hotkey_inject_event(combo,true)
  obs.obs_hotkey_inject_event(combo,false)
end

function start(props,p)
  send_hotkey("OBS_KEY_2",{shift=true})
end

function stop(props,p)
  send_hotkey("OBS_KEY_F12",{control=true})
end

function script_properties()
  props = obs.obs_properties_create()
  obs.obs_properties_add_button(props, "button1", "Start", start)
  obs.obs_properties_add_button(props, "button2", "Stop", stop)
  return props
end