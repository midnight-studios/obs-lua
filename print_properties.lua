-- https://obsproject.com/forum/threads/how-to-enumerate-script-properties-in-lua.83406/#post-397381
-- create source with name tmp , then add Color Correction filter named color
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


local function filterTest()
  local source = obsffi.obs_get_source_by_name("tmp")
  if source then
    local fSource = obsffi.obs_source_get_filter_by_name(source, "color")
    if fSource then
      local props = obsffi.obs_source_properties(fSource)
      if props then
        local prop = obsffi.obs_properties_first(props)
        local name = obsffi.obs_property_name(prop)
        if name then
          local propCount = 1

          obs.script_log(obs.LOG_INFO, string.format("Property 1 = %s", ffi.string(name)))

          local _p = ffi.new("obs_property_t *[1]", prop)
          local foundProp = obsffi.obs_property_next(_p)
          prop = ffi.new("obs_property_t *", _p[0])
          while foundProp do
            propCount = propCount + 1
            name = obsffi.obs_property_name(prop)

            obs.script_log(obs.LOG_INFO, string.format("Property %d = %s", propCount, ffi.string(name)))

            _p = ffi.new("obs_property_t *[1]", prop)
            foundProp = obsffi.obs_property_next(_p)
            prop = ffi.new("obs_property_t *", _p[0])
          end
        end
        obsffi.obs_properties_destroy(props)
      end
      obsffi.obs_source_release(fSource)
    end
    obsffi.obs_source_release(source)
  end
end

function on_event(event) 
  if event == obs.OBS_FRONTEND_EVENT_FINISHED_LOADING  then 
    filterTest()
  end 
end
function script_load(settings)
  obs.obs_frontend_add_event_callback(on_event)
end
