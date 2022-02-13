-- https://obsproject.com/forum/threads/how-to-enumerate-script-properties-in-lua.83406/#post-397381
-- create source with name tmp , then add Color Correction filter named color
local obs = obslua
local ffi = require("ffi")
obsffi = ffi.load("obs")
local props = nil

ffi.cdef[[

struct obs_source;
struct obs_properties;
struct obs_property;
typedef struct obs_source obs_source_t;
typedef struct obs_properties obs_properties_t;
typedef struct obs_property obs_property_t;

obs_source_t *obs_get_source_by_name(const char *name);
obs_source_t *obs_source_get_filter_by_name(obs_source_t *source, const char *name);
obs_properties_t *obs_source_properties(const obs_source_t *source);
obs_property_t *obs_properties_first(obs_properties_t *props);

bool obs_property_next(obs_property_t **p);

const char *obs_property_name(obs_property_t *p);
void obs_properties_destroy(obs_properties_t *props);
void obs_source_release(obs_source_t *source);

]]

--[[
----------------------------------------------------------
-- Use this to create a Script Log Output used in testing
----------------------------------------------------------
]]
function log( name, msg )
  if msg ~= nil then
    msg = " > " .. tostring( msg )
  else
    msg = ""
  end
  obs.script_log( obs.LOG_DEBUG, name .. msg )
end



function script_properties()
	props = obs.obs_properties_create()
	obs.obs_properties_add_text( props, "a", "A", obs.OBS_TEXT_DEFAULT )
	obs.obs_properties_add_text( props, "b", "B", obs.OBS_TEXT_DEFAULT )
	obs.obs_properties_add_text( props, "c", "C", obs.OBS_TEXT_DEFAULT )
	local p_36 = obs.obs_properties_add_button( props, "import_button", "Import Settings", import_button_clicked )
	return props
end
--[[
----------------------------------------------------------
----------------------------------------------------------
]]
function import_button_clicked( props, p )
filterTest( props, p )
end
function filterTest( props, p )
	
	log("", "filterTest...")

	log("", "have props...")
			local prop = obs.obs_properties_first(props)
			local name = obs.obs_property_name(prop)
		
		
	log("first name", name)
		
			if name then
			  local propCount = 1

			  log("", string.format("Property 1 = %s", ffi.string(name)))

			  local _p = ffi.new("obs_property_t *[1]", prop)
			  local foundProp = obs.obs_property_next(_p)
			  prop = ffi.new("obs_property_t *", _p[0])
			  while foundProp do
				propCount = propCount + 1
				name = obs.obs_property_name(prop)

				log("name", string.format("Property %d = %s", propCount, ffi.string(name)))

				_p = ffi.new("obs_property_t *[1]", prop)
				foundProp = obs.obs_property_next(_p)
				prop = ffi.new("obs_property_t *", _p[0])
			  end
			
			--obsffi.obs_properties_destroy(props)
	end
end




function script_update( settings )
	filterTest()
end
