obs = obslua
local bit = require("bit")



local info = {};
	info.id = "browser_source_lua";
	info.type = OBS_SOURCE_TYPE_INPUT;
	info.output_flags = obs.OBS_SOURCE_VIDEO |

			    OBS_SOURCE_CUSTOM_DRAW | OBS_SOURCE_INTERACTION |
			    OBS_SOURCE_DO_NOT_DUPLICATE | OBS_SOURCE_SRGB;
	info.get_properties = browser_source_get_properties;
	info.get_defaults = browser_source_get_defaults;
	info.icon_type = OBS_ICON_TYPE_BROWSER;

	info.get_name = function()
        return " Browser Source Lua"
	end

	info.create = function(settings, source)
		obs_browser_initialize();
		return data;
	end;

	info.destroy = function(data)
	end;

	info.missing_files = browser_source_missingfiles;

	info.update = function(data, settings)	
	end;

	info.get_width = function(data)
		return data.width
	end;

	info.get_height = function(data)
		return data.height;
	end;

	info.video_tick = function(data, float)
		data.Tick();
	end;

	info.video_render = function(data, gs_effect)
		data.Render();
	end;

	info.enum_active_sources = function(data, cb, param)(void * obs_source_enum_proc_t ,
				      void *) {
		data.EnumAudioStreams(cb, param);
	end;

	info.mouse_click = function(data, event, mouse_up, click_count)
		data.SendMouseClick(event, type, mouse_up, click_count);
	end;
	
	info.mouse_move = function(data, event, mouse_leave)
		data.SendMouseMove(event, mouse_leave);
	end;
	
	info.mouse_wheel = function(data, event, x_delta, y_delta)(void *const struct obs_mouse_event *
			      data.SendMouseWheel(event, x_delta, y_delta);
	end;
		
	info.focus = function(data, focus)
			data.SendFocus(focus);
	end;
		
	info.key_click = function(data, event, key_up)
			data.SendKeyClick(event, key_up);
	end;
		
	info.show = function(data)
			data.SetShowing(true);
	end;
		
	info.hide = function(data)
			data.SetShowing(false);
	end;
		
	info.activate = function(data)
			
		if (data.bs.restart) then
			data.bs.Refresh();
			data.bs.SetActive(true);
		end
	end;
		
	info.deactivate = function(data)
		data.SetActive(false);
	end;

	obs_register_source(&info);