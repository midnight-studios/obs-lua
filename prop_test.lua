--[[
----------------------------------------------------------
Open Broadcaster Software®️
OBS > Tools > Scripts
@midnight-studios

Source Monitor
----------------------------------------------------------
]]

--Globals
local obs = obslua
local ffi = require("ffi")
local obsffi

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

if ffi.os == "OSX" then
    obsffi = ffi.load("obs.0.dylib")
else
    obsffi = ffi.load("obs")
end


local props = nil

function log( name, msg )
  if msg ~= nil then
    msg = " > " .. tostring( msg )
  else
    msg = ""
  end
  obs.script_log( obs.LOG_DEBUG, name .. msg )
end

function script_description()
	return "foo"
end

function script_properties()
	props = obs.obs_properties_create()
	obs.obs_properties_add_text( props, "a", "A", obs.OBS_TEXT_DEFAULT )
	obs.obs_properties_add_text( props, "b", "B", obs.OBS_TEXT_DEFAULT )
	obs.obs_properties_add_text( props, "c", "C", obs.OBS_TEXT_DEFAULT )
	return props
end

function script_update( settings )
	filterTest()
end



function filterTest()
 

                local prop = obsffi.obs_properties_first( props )
                local name = obsffi.obs_property_name( prop )
	log("name", name)
                if name then
                    local propCount = 1
                    
                    local _p = ffi.new("obs_property_t *[1]", prop)
                    local foundProp = obsffi.obs_property_next(_p)
                    prop = ffi.new("obs_property_t *", _p[0])
                    while foundProp do
                        propCount = propCount + 1
                        name = obsffi.obs_property_name(prop)
             
	log("name", name)
                        _p = ffi.new("obs_property_t *[1]", prop)
                        foundProp = obsffi.obs_property_next(_p)
                        prop = ffi.new("obs_property_t *", _p[0])
                    end
                end

end