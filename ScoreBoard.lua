--[[
----------------------------------------------------------
Open Broadcaster Software®️
OBS > Tools > Scripts
@midnight-studios
Stopwatch
----------------------------------------------------------
]]
--Globals
obs           				= obslua
gversion 					= "0.1"
luafile						= "ScoreBoard.lua"
obsurl						= "score-board.1448/"
icon="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFIAAAApCAYAAACmyX6ZAAAACXBIWXMAAC4jAAAuIwF4pT92AAAFyGlUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNi4wLWMwMDIgNzkuMTY0NDYwLCAyMDIwLzA1LzEyLTE2OjA0OjE3ICAgICAgICAiPiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIiB4bWxuczpzdEV2dD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlRXZlbnQjIiB4bWxuczpkYz0iaHR0cDovL3B1cmwub3JnL2RjL2VsZW1lbnRzLzEuMS8iIHhtbG5zOnBob3Rvc2hvcD0iaHR0cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgMjEuMiAoV2luZG93cykiIHhtcDpDcmVhdGVEYXRlPSIyMDIyLTAxLTEwVDEzOjU5OjM0KzEzOjAwIiB4bXA6TWV0YWRhdGFEYXRlPSIyMDIyLTAxLTEwVDEzOjU5OjM0KzEzOjAwIiB4bXA6TW9kaWZ5RGF0ZT0iMjAyMi0wMS0xMFQxMzo1OTozNCsxMzowMCIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDoxYmU3Y2YyMS01OGY0LTllNDQtOGQ2ZC0wZmUzNjEwYTkxMzUiIHhtcE1NOkRvY3VtZW50SUQ9ImFkb2JlOmRvY2lkOnBob3Rvc2hvcDoyZjcwNWRlMi1lYTcyLTk0NDItYTBjMS01ZjRkZDM2NGQ1ZTMiIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo2OTI4MDU3Zi1iZjU5LWQ3NGItOWNkNS1mOWUzZTFjNDFiNjgiIGRjOmZvcm1hdD0iaW1hZ2UvcG5nIiBwaG90b3Nob3A6Q29sb3JNb2RlPSIzIj4gPHhtcE1NOkhpc3Rvcnk+IDxyZGY6U2VxPiA8cmRmOmxpIHN0RXZ0OmFjdGlvbj0iY3JlYXRlZCIgc3RFdnQ6aW5zdGFuY2VJRD0ieG1wLmlpZDo2OTI4MDU3Zi1iZjU5LWQ3NGItOWNkNS1mOWUzZTFjNDFiNjgiIHN0RXZ0OndoZW49IjIwMjItMDEtMTBUMTM6NTk6MzQrMTM6MDAiIHN0RXZ0OnNvZnR3YXJlQWdlbnQ9IkFkb2JlIFBob3Rvc2hvcCAyMS4yIChXaW5kb3dzKSIvPiA8cmRmOmxpIHN0RXZ0OmFjdGlvbj0ic2F2ZWQiIHN0RXZ0Omluc3RhbmNlSUQ9InhtcC5paWQ6MWJlN2NmMjEtNThmNC05ZTQ0LThkNmQtMGZlMzYxMGE5MTM1IiBzdEV2dDp3aGVuPSIyMDIyLTAxLTEwVDEzOjU5OjM0KzEzOjAwIiBzdEV2dDpzb2Z0d2FyZUFnZW50PSJBZG9iZSBQaG90b3Nob3AgMjEuMiAoV2luZG93cykiIHN0RXZ0OmNoYW5nZWQ9Ii8iLz4gPC9yZGY6U2VxPiA8L3htcE1NOkhpc3Rvcnk+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+BkJ4vgAABmJJREFUaIHtmmlsVUUUgL/SggWqxSLGEKyCRZRYghu4lEgUFYNGSVCxGCVKokXUBjVioqYRDdWggUQQtEFMBBtDcKtKWBShasFIoD8UlxhFVEARKPSVpeX448zQefO2e997BRLfl9y8zplz58yczp3lzCAiBHj2isg4EakUkd+MrF5EOkTkkIg8ISLFokwSkSIR2S0iM0SkSjppCGgv6NMoIs8Ye+0iMkJE5ovIElOfLcbudhEZYuqzXkTKJZoZInKhiPxh0ttEZLCRWxpFpND4oNXYW2Tr0o30uROoBF4BJjnyJ4EHgBJHthm4DKjOwF48vgSuBEYAR4wdSzkwyNj9HBjs5P1s5AdMnRYDo4GIkR8CrjW6jSbvaqAMbfe75re/LTCMIyuAkZ7sO2CbV85FwExPr9A0qiCEvSA0mTpdBXwDHHbyxNRrEDAPaHDy2oBvgQ7UqTs8eRudbeoFnOuV28f83mOFYRw5Dbg/gF4D0ApscmRlwEJgbAh7Qfga7fn3mr9dthjZQrRX3ZimjXJgEbAO+AGoAy5Fe/E6qxSmh0wEioFZKfRmoz1knCNrAkaFsBWUHWiPKjM2fB5HP/dmtGemw0rgINCCDh9b0eFkILDeKmUyRrahTpsC7HPkvwIveboXoOPKcxnYS4R1oN8jhwAbjd1SdDxMRqvRs/otTt4i4A7gNKAGWI22ZY9VyK+pqQlS2bOAtcB+oB1Yg44lZ6KOmwn8DfQDPkUH7TPQnvAX2vMPoj3oqyAGQxAxNt4z6WJgO/CxqVMf4BPgDaAnsNepg23XLuB7IA/oYd6tM/r/Au8Y3d/RoavElDMT+AUgT0Sy3K7/JwXAGOA69L9xomkHlhG9jInHcGAC2V8FpIMAa/JE5ADQ+0TXxmEjscssnw3o2vFkIdINdeJUtEem+9xsChyWYTmvoeNSKnoa3UxsnWPKmpRhOVOBXok+jbPRWWog0N2Rd6AD7nJ0TRWUHuiCfgzQ18iWAl+EKCMVfYC70BVCoSMXdJJbQfwlks9AYDw6kfpsR9v+Z0yO2UdWOfvX20UkIsk5IiIPO++MM/LyOPvhuWZv6lMVR3e+iDTHkftPs9G16ZEisjNFncW8k2/eKTWySqecB0VjB8loFZHxzjtVIiL+OnI48DapP68CYC5wU4D/8CXoNqur6At8SPwe5FMFTE+Qdz0wH/16ktELqEe3wsfwHflQgIIsecCjAXW7krsJ5kRLdQL5dIKvXHoAj7gCf4wc7KU/QgMTlgFER3p8/RNBmZduInrsPYVo5/Un/hdyvpdego6JlqHALU46qu2+I/O9dD06KVgqiHZkkHXcAnQ3MBmdCLKNX+e1wFNOupjYXtidWPy2LECDHZZKoh0ZpX88FrRLzO8ousaRJwWZBC1yOOQcmSVyjswSOUdmiZwjs4Q/az+LBmQtG7z8rege3BIJYasWeMtJb0qkGJI69JTQstXLjxBdZysr9mRTiV5f+uU0euX842bmiYgYJXfhHZZS9GBrGRpRTpcKNDAyLIVeM7p+bEyhl4widG34GXruky5DgQrbI99HzyXS5QbUkXPI7B8yG7g8oG4TMCMDWwNQR9ajHSBd7sNxZAQ9yKlDAxeWp9Hwk2W40bHsQGOR9mCpBedAyGMO2uMstcQ24FCQmju6e1BnTnDki4FXnXQRuttxGU3ngV2rKacBPZexTCE6Uj8WeN5JbzY6EYgdI4egZ7aWEi+/yMvfRnDKvHf7hXg3GaVeuau8/Hwv38p8yk1ZliIvv8Qrp83NzM3aWSLnyCyRc2SWyDkyS+QcmSVSxSN7A6c76VO7sC7ZopDoOp92PIz6jmzx0q+bJxF7s1qb9PAvR1WT/ELrEfQOk79F9Nu+nuTsdxP+p70yxcs+K1KrdDlh67wKOBpHHrYta9yE78iFxAYqEvEj8GJI413BavQIOQh7gMcS5NUCPwUsZwt6dHsM35EH0fPdeUTfeXRpBd5EL5NmEqDIJpPR7ezOBPmH0bPvkcRGdSy70S3sUtQP8YigW+Rr8HY28Sab/eg152noOOI6W0h/XJxI9OldmBBcKjqAF8xTROwp4T7if84+u9BT0gLiT6wtxlYM1pG30XmpKB3OM7/V6OXOdLkipG5tBrbsbD6R1GG7ZFwMGo9cDtzKybGmbAdeJnV4bBZ6P/xkuB95FPjgP+6EW/UQJxvnAAAAAElFTkSuQmCC"
desc	    				= [[
<hr/><center><h2>ScoreBoard</h2>( Version: %s )</center>
<br><center><img width=84 height=41 src=']] .. icon .. [['/></center>
<br><center><a href="https://github.com/midnight-studios/obs-lua/blob/main/]] .. luafile ..[[">Find it on GitHub</a></center>
<br><p>Score Board for your stream. Setup Hotkeys to the point you need.</p><p>Find help on the <a href="https://obsproject.com/forum/resources/]] .. obsurl ..[[">OBS Forum Thread</a>.</p><hr/>]]
script_props				= nil
script_settings				= nil
font_normal					= "#ffffff"
font_dimmed					= "#bfbbbf"
font_1						= "#bfbbbf"
font_2						= "#bfbbbf"
font_3						= "#bfbbbf"
font_4						= "#bfbbbf"
font_5						= "#bfbbbf"
text_sources				= {}
p_h_a_value 				= 0
p_h_b_value 				= 0
p_h_c_value 				= 0
p_h_d_value 				= 0
p_h_e_value 				= 0
p_v_a_value 				= 0
p_v_b_value 				= 0
p_v_c_value 				= 0
p_v_d_value 				= 0
p_v_e_value 				= 0
p_s_a_value 				= 0
p_s_b_value 				= 0
p_s_c_value 				= 0
p_s_d_value 				= 0
p_s_e_value 				= 0
p_h_a_int 					= 1
p_h_b_int 					= 1
p_h_c_int 					= 1
p_h_d_int 					= 1
p_h_e_int 					= 1
p_v_a_int 					= 1
p_v_b_int 					= 1
p_v_c_int 					= 1
p_v_d_int 					= 1
p_v_e_int 					= 1
p_s_a_int 					= 1
p_s_b_int 					= 1
p_s_c_int 					= 1
p_s_d_int 					= 1
p_s_e_int 					= 1
p_h_a_source 				= ""
p_h_b_source 				= ""
p_h_c_source 				= ""
p_h_d_source 				= ""
p_h_e_source 				= ""
p_v_a_source 				= ""
p_v_b_source 				= ""
p_v_c_source 				= ""
p_v_d_source 				= ""
p_v_e_source 				= ""
p_s_a_source 				= ""
p_s_b_source 				= ""
p_s_c_source 				= ""
p_s_d_source 				= ""
p_s_e_source 				= ""
p_h_a_1_hotkey_id			= obs.OBS_INVALID_HOTKEY_ID
p_h_b_1_hotkey_id			= obs.OBS_INVALID_HOTKEY_ID
p_h_c_1_hotkey_id			= obs.OBS_INVALID_HOTKEY_ID
p_h_d_1_hotkey_id			= obs.OBS_INVALID_HOTKEY_ID
p_h_e_1_hotkey_id			= obs.OBS_INVALID_HOTKEY_ID
p_v_a_1_hotkey_id			= obs.OBS_INVALID_HOTKEY_ID
p_v_b_1_hotkey_id			= obs.OBS_INVALID_HOTKEY_ID
p_v_c_1_hotkey_id			= obs.OBS_INVALID_HOTKEY_ID
p_v_d_1_hotkey_id			= obs.OBS_INVALID_HOTKEY_ID
p_v_e_1_hotkey_id			= obs.OBS_INVALID_HOTKEY_ID
p_s_a_1_hotkey_id			= obs.OBS_INVALID_HOTKEY_ID
p_s_b_1_hotkey_id			= obs.OBS_INVALID_HOTKEY_ID
p_s_c_1_hotkey_id			= obs.OBS_INVALID_HOTKEY_ID
p_s_d_1_hotkey_id			= obs.OBS_INVALID_HOTKEY_ID
p_s_e_1_hotkey_id			= obs.OBS_INVALID_HOTKEY_ID
p_h_a_0_hotkey_id			= obs.OBS_INVALID_HOTKEY_ID
p_h_b_0_hotkey_id			= obs.OBS_INVALID_HOTKEY_ID
p_h_c_0_hotkey_id			= obs.OBS_INVALID_HOTKEY_ID
p_h_d_0_hotkey_id			= obs.OBS_INVALID_HOTKEY_ID
p_h_e_0_hotkey_id			= obs.OBS_INVALID_HOTKEY_ID
p_v_a_0_hotkey_id			= obs.OBS_INVALID_HOTKEY_ID
p_v_b_0_hotkey_id			= obs.OBS_INVALID_HOTKEY_ID
p_v_c_0_hotkey_id			= obs.OBS_INVALID_HOTKEY_ID
p_v_d_0_hotkey_id			= obs.OBS_INVALID_HOTKEY_ID
p_v_e_0_hotkey_id			= obs.OBS_INVALID_HOTKEY_ID
p_s_a_0_hotkey_id			= obs.OBS_INVALID_HOTKEY_ID
p_s_b_0_hotkey_id			= obs.OBS_INVALID_HOTKEY_ID
p_s_c_0_hotkey_id			= obs.OBS_INVALID_HOTKEY_ID
p_s_d_0_hotkey_id			= obs.OBS_INVALID_HOTKEY_ID
p_s_e_0_hotkey_id			= obs.OBS_INVALID_HOTKEY_ID
reset_hotkey_id				= obs.OBS_INVALID_HOTKEY_ID

--[[
----------------------------------------------------------
-- Use this to create a Script Log Output used in testing
----------------------------------------------------------
]]
local function log( name, msg )
  if msg ~= nil then
    msg = " > " .. tostring( msg )
  else
    msg = ""
  end
  obs.script_log( obs.LOG_DEBUG, name .. msg )
end
--[[
----------------------------------------------------------
-- Get the name of this script
----------------------------------------------------------
]]
function filename() 
	local str = debug.getinfo(2).source:sub(2) 
	return str:match("^.*/(.*).lua$") or str 
end
--[[
----------------------------------------------------------
	A function named script_description returns the description shown to
	the user
----------------------------------------------------------
]]
function script_description()
	return string.format( desc, tostring( gversion ) )
end


--[[
----------------------------------------------------------
	Function to set the source text
----------------------------------------------------------
]]
function set_text( source_name, text )
	if source_name == 'Select' or  source_name == 'select'then
		return
	end	
	--[[
		Increments the source reference counter, 
		use obs_source_release() to release it when complete.
	]]
	local source = obs.obs_get_source_by_name( source_name )
	if source ~= nil then
		local settings = obs.obs_source_get_settings( source )
		obs.obs_data_set_string( settings, "text", text )	
	end
		obs.obs_source_update( source, settings )
		obs.obs_data_release( settings )
		obs.obs_source_release( source )
end

--[[
--------------------------------------------------------------------
--------------------------------------------------------------------
]]
function pairsByKeys(t, f)
	local a = {}
	for n in pairs(t) do table.insert(a, n) end
	table.sort(a, f)
	local i = 0      -- iterator variable
	local iter = function ()   -- iterator function
		i = i + 1
		if a[i] == nil then return nil
		else return a[i], t[a[i]]
		end
	end
	return iter
end

--[[
--------------------------------------------------------------------
 custom function: helper
----------------------------------------------------------
]]
function in_table( tbl, value )
	local found = false
	for k, v in pairs( tbl ) do
		if value == v then
			found = true
			break
		end	
	end
	return found
end
--[[
--------------------------------------------------------------------
 custom function: helper
----------------------------------------------------------
]]

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end
--[[
--------------------------------------------------------------------
 custom function: helper
----------------------------------------------------------
]]
function remove_duplicates( tbl )
local hash = {}
local res = {}
	for _,v in ipairs( tbl ) do
	   if ( not hash[v] ) then
		   res[#res+1] = v -- you could print here instead of saving to result table if you wanted
		   hash[v] = true
	   end
	end
	
	return res
end	

--[[
----------------------------------------------------------
Callback on list modification
----------------------------------------------------------
]]
function property_onchange( props, property, settings )
	local prop_name = obs.obs_property_name( property )
	local prop_val = obs.obs_data_get_string( settings, prop_name )
	local prop = obs.obs_properties_get( props, prop_name )
	local temp_table = {}
	-- Retrieves value selected in list
	p_h_a_source = obs.obs_data_get_string( settings, "p_h_a_source" )
	p_h_b_source = obs.obs_data_get_string( settings, "p_h_b_source" )
	p_h_c_source = obs.obs_data_get_string( settings, "p_h_c_source" )
	p_h_d_source = obs.obs_data_get_string( settings, "p_h_d_source" )
	p_h_e_source = obs.obs_data_get_string( settings, "p_h_e_source" )
	p_v_a_source = obs.obs_data_get_string( settings, "p_v_a_source" )
	p_v_b_source = obs.obs_data_get_string( settings, "p_v_b_source" )
	p_v_c_source = obs.obs_data_get_string( settings, "p_v_c_source" )
	p_v_d_source = obs.obs_data_get_string( settings, "p_v_d_source" )
	p_v_e_source = obs.obs_data_get_string( settings, "p_v_e_source" )
	p_s_a_source = obs.obs_data_get_string( settings, "p_s_a_source" )
	p_s_b_source = obs.obs_data_get_string( settings, "p_s_b_source" )
	p_s_c_source = obs.obs_data_get_string( settings, "p_s_c_source" )
	p_s_d_source = obs.obs_data_get_string( settings, "p_s_d_source" )
	p_s_e_source = obs.obs_data_get_string( settings, "p_s_e_source" )
	text_sources["p_h_a_source"] = p_h_a_source
	text_sources["p_h_b_source"] = p_h_b_source
	text_sources["p_h_c_source"] = p_h_c_source
	text_sources["p_h_d_source"] = p_h_d_source
	text_sources["p_h_e_source"] = p_h_e_source
	text_sources["p_v_a_source"] = p_v_a_source
	text_sources["p_v_b_source"] = p_v_b_source
	text_sources["p_v_c_source"] = p_v_c_source
	text_sources["p_v_d_source"] = p_v_d_source
	text_sources["p_v_e_source"] = p_v_e_source
	text_sources["p_s_a_source"] = p_s_a_source
	text_sources["p_s_b_source"] = p_s_b_source
	text_sources["p_s_c_source"] = p_s_c_source
	text_sources["p_s_d_source"] = p_s_d_source
	text_sources["p_s_e_source"] = p_s_e_source
	-- Retrieves property reference
	local p_h_a_prop = obs.obs_properties_get( props, "p_h_a_source" )
	local p_h_b_prop = obs.obs_properties_get( props, "p_h_b_source" )
	local p_h_c_prop = obs.obs_properties_get( props, "p_h_c_source" )
	local p_h_d_prop = obs.obs_properties_get( props, "p_h_d_source" )
	local p_h_e_prop = obs.obs_properties_get( props, "p_h_e_source" )
	local p_v_a_prop = obs.obs_properties_get( props, "p_v_a_source" )
	local p_v_b_prop = obs.obs_properties_get( props, "p_v_b_source" )
	local p_v_c_prop = obs.obs_properties_get( props, "p_v_c_source" )
	local p_v_d_prop = obs.obs_properties_get( props, "p_v_d_source" )
	local p_v_e_prop = obs.obs_properties_get( props, "p_v_e_source" )
	local p_s_a_prop = obs.obs_properties_get( props, "p_s_a_source" )
	local p_s_b_prop = obs.obs_properties_get( props, "p_s_b_source" )
	local p_s_c_prop = obs.obs_properties_get( props, "p_s_c_source" )
	local p_s_d_prop = obs.obs_properties_get( props, "p_s_d_source" )
	local p_s_e_prop = obs.obs_properties_get( props, "p_s_e_source" )
	local p_h_a_int_prop = obs.obs_properties_get( props, "p_h_a_int")
	local p_h_b_int_prop = obs.obs_properties_get( props, "p_h_b_int")
	local p_h_c_int_prop = obs.obs_properties_get( props, "p_h_c_int")
	local p_h_d_int_prop = obs.obs_properties_get( props, "p_h_d_int")
	local p_h_e_int_prop = obs.obs_properties_get( props, "p_h_e_int")
	local p_v_a_int_prop = obs.obs_properties_get( props, "p_v_a_int")
	local p_v_b_int_prop = obs.obs_properties_get( props, "p_v_b_int")
	local p_v_c_int_prop = obs.obs_properties_get( props, "p_v_c_int")
	local p_v_d_int_prop = obs.obs_properties_get( props, "p_v_d_int")
	local p_v_e_int_prop = obs.obs_properties_get( props, "p_v_e_int")
	local p_s_a_int_prop = obs.obs_properties_get( props, "p_s_a_int")
	local p_s_b_int_prop = obs.obs_properties_get( props, "p_s_b_int")
	local p_s_c_int_prop = obs.obs_properties_get( props, "p_s_c_int")
	local p_s_d_int_prop = obs.obs_properties_get( props, "p_s_d_int")
	local p_s_e_int_prop = obs.obs_properties_get( props, "p_s_e_int")
	local p_h_a_s = ( p_h_a_source ~= "select" and p_h_a_source ~= "" )
	local p_h_b_s = ( p_h_b_source ~= "select" and p_h_b_source ~= "" )
	local p_h_c_s = ( p_h_c_source ~= "select" and p_h_c_source ~= "" )
	local p_h_d_s = ( p_h_d_source ~= "select" and p_h_d_source ~= "" )
	local p_h_e_s = ( p_h_e_source ~= "select" and p_h_e_source ~= "" )
	local p_v_a_s = ( p_v_a_source ~= "select" and p_v_a_source ~= "" )
	local p_v_b_s = ( p_v_b_source ~= "select" and p_v_b_source ~= "" )
	local p_v_c_s = ( p_v_c_source ~= "select" and p_v_c_source ~= "" )
	local p_v_d_s = ( p_v_d_source ~= "select" and p_v_d_source ~= "" )
	local p_v_e_s = ( p_v_e_source ~= "select" and p_v_e_source ~= "" )
	local p_s_a_s = ( p_s_a_source ~= "select" and p_s_a_source ~= "" )
	local p_s_b_s = ( p_s_b_source ~= "select" and p_s_b_source ~= "" )
	local p_s_c_s = ( p_s_c_source ~= "select" and p_s_c_source ~= "" )
	local p_s_d_s = ( p_s_d_source ~= "select" and p_s_d_source ~= "" )
	local p_s_e_s = ( p_s_e_source ~= "select" and p_s_e_source ~= "" )
	obs.obs_property_set_visible( p_h_b_prop, ( p_h_a_s ))
	obs.obs_property_set_visible( p_h_c_prop, ( p_h_a_s and p_h_b_s ))
	obs.obs_property_set_visible( p_h_d_prop, ( p_h_a_s and p_h_b_s and p_h_c_s ))
	obs.obs_property_set_visible( p_h_e_prop, ( p_h_a_s and p_h_b_s and p_h_c_s and p_h_d_s ))
	obs.obs_property_set_visible( p_v_b_prop, ( p_v_a_s ))
	obs.obs_property_set_visible( p_v_c_prop, ( p_v_a_s and p_v_b_s ))
	obs.obs_property_set_visible( p_v_d_prop, ( p_v_a_s and p_v_b_s and p_v_c_s ))
	obs.obs_property_set_visible( p_v_e_prop, ( p_v_a_s and p_v_b_s and p_v_c_s and p_v_d_s ))
	obs.obs_property_set_visible( p_s_b_prop, ( p_s_a_s ))
	obs.obs_property_set_visible( p_s_c_prop, ( p_s_a_s and p_s_b_s ))
	obs.obs_property_set_visible( p_s_d_prop, ( p_s_a_s and p_s_b_s and p_s_c_s ))
	obs.obs_property_set_visible( p_s_e_prop, ( p_s_a_s and p_s_b_s and p_s_c_s and p_s_d_s ))
	obs.obs_property_set_visible( p_h_b_int_prop, ( p_h_a_s ))
	obs.obs_property_set_visible( p_h_c_int_prop, ( p_h_a_s and p_h_b_s ))
	obs.obs_property_set_visible( p_h_d_int_prop, ( p_h_a_s and p_h_b_s and p_h_c_s ))
	obs.obs_property_set_visible( p_h_e_int_prop, ( p_h_a_s and p_h_b_s and p_h_c_s and p_h_d_s ))
	obs.obs_property_set_visible( p_v_b_int_prop, ( p_v_a_s ))
	obs.obs_property_set_visible( p_v_c_int_prop, ( p_v_a_s and p_v_b_s ))
	obs.obs_property_set_visible( p_v_d_int_prop, ( p_v_a_s and p_v_b_s and p_v_c_s ))
	obs.obs_property_set_visible( p_v_e_int_prop, ( p_v_a_s and p_v_b_s and p_v_c_s and p_v_d_s ))
	obs.obs_property_set_visible( p_s_b_int_prop, ( p_s_a_s ))
	obs.obs_property_set_visible( p_s_c_int_prop, ( p_s_a_s and p_s_b_s ))
	obs.obs_property_set_visible( p_s_d_int_prop, ( p_s_a_s and p_s_b_s and p_s_c_s ))
	obs.obs_property_set_visible( p_s_e_int_prop, ( p_s_a_s and p_s_b_s and p_s_c_s and p_s_d_s ))
	
	-- Prevent sources being used in more than one item
	for key, value in pairs ( text_sources )  do
		if value ~= "" and value ~= "select" and key ~= prop_name then
			temp_table[key] = value
		end
	end
	if in_table( temp_table, prop_val ) then
		obs.obs_data_set_string( settings, prop_name, 'select' ) -- Don't allow timer and caution note text source to be the same
	end
  -- IMPORTANT: returns true to trigger refresh of the properties
  return true
end

--[[
----------------------------------------------------------
	A function named script_properties defines the properties that the user
	can change for the entire script module itself
----------------------------------------------------------
]]
function script_properties()
	
	local temp_table = text_sources
	local props = obs.obs_properties_create()
	local group_props_h = obs.obs_properties_create()
	local group_props_v = obs.obs_properties_create()
	local group_props_s = obs.obs_properties_create()
	local sources = obs.obs_enum_sources()
	obs.obs_properties_add_group( props, "_group_h", "Home", obs.OBS_GROUP_NORMAL, group_props_h )
	obs.obs_properties_add_group(props, "_group_v", "Visitors", obs.OBS_GROUP_NORMAL, group_props_v)
	obs.obs_properties_add_group(props, "_group_s", "Summary", obs.OBS_GROUP_NORMAL, group_props_s)
	
	--[[
	----------------------------------------------------------
	Home Score Item 1
	----------------------------------------------------------
	]]
   	local p_h_a = obs.obs_properties_add_list( group_props_h, "p_h_a_source", "<font color=".. font_1 .."><i>1</i></font>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING )
	obs.obs_property_set_long_description( p_h_a, "\nSelect a text source, that will be used.\n" )
	obs.obs_property_list_add_string( p_h_a, "Select", "select" )
	list = {}
	if sources ~= nil then
		for _, source in ipairs( sources ) do
			source_id = obs.obs_source_get_unversioned_id( source )
			if source_id == "text_gdiplus" or source_id == "text_ft2_source" then
				local name = obs.obs_source_get_name( source )
				list[name] = name
			end
		end
			obs.bfree(source)
		for key, value in pairsByKeys(list) do
			--[[
				add item to property list
			]]	
			obs.obs_property_list_add_string( p_h_a, value, value )
		end
	end
	--[[
	----------------------------------------------------------
	Home Score Item 2
	----------------------------------------------------------
	]]
   	local p_h_b = obs.obs_properties_add_list( group_props_h, "p_h_b_source", "<font color=".. font_2 .."><i>2</i></font>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING )
	obs.obs_property_set_long_description( p_h_b, "\nSelect a text source, that will be used.\n" )
	obs.obs_property_list_add_string( p_h_b, "Select", "select" )
	list = {}
	if sources ~= nil then
		for _, source in ipairs( sources ) do
			source_id = obs.obs_source_get_unversioned_id( source )
			if source_id == "text_gdiplus" or source_id == "text_ft2_source" then
				local name = obs.obs_source_get_name( source )
				list[name] = name
			end
		end
			obs.bfree(source)
		for key, value in pairsByKeys(list) do
			--[[
				add item to property list
			]]	
			obs.obs_property_list_add_string( p_h_b, value, value )
		end
	end
	--[[
	----------------------------------------------------------
	Home Score Item 3
	----------------------------------------------------------
	]]
   	local p_h_c = obs.obs_properties_add_list( group_props_h, "p_h_c_source", "<font color=".. font_3 .."><i>3</i></font>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING )
	obs.obs_property_set_long_description( p_h_c, "\nSelect a text source, that will be used.\n" )
	obs.obs_property_list_add_string( p_h_c, "Select", "select" )
	list = {}
	if sources ~= nil then
		for _, source in ipairs( sources ) do
			source_id = obs.obs_source_get_unversioned_id( source )
			if source_id == "text_gdiplus" or source_id == "text_ft2_source" then
				local name = obs.obs_source_get_name( source )
				list[name] = name
			end
		end
			obs.bfree(source)
		for key, value in pairsByKeys(list) do
			--[[
				add item to property list
			]]	
			obs.obs_property_list_add_string( p_h_c, value, value )
		end		
	end
	--[[
	----------------------------------------------------------
	Home Score Item 4
	----------------------------------------------------------
	]]
   	local p_h_d = obs.obs_properties_add_list( group_props_h, "p_h_d_source", "<font color=".. font_4 .."><i>4</i></font>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING )
	obs.obs_property_set_long_description( p_h_d, "\nSelect a text source, that will be used.\n" )
	obs.obs_property_list_add_string( p_h_d, "Select", "select" )
	list = {}
	if sources ~= nil then
		for _, source in ipairs( sources ) do
			source_id = obs.obs_source_get_unversioned_id( source )
			if source_id == "text_gdiplus" or source_id == "text_ft2_source" then
				local name = obs.obs_source_get_name( source )
				list[name] = name
			end
		end
			obs.bfree(source)
		for key, value in pairsByKeys(list) do
			--[[
				add item to property list
			]]	
			obs.obs_property_list_add_string( p_h_d, value, value )
		end
	end
	--[[
	----------------------------------------------------------
	Home Score Item 5
	----------------------------------------------------------
	]]
   	local p_h_e = obs.obs_properties_add_list( group_props_h, "p_h_e_source", "<font color=".. font_5 .."><i>5</i></font>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING )
	obs.obs_property_set_long_description( p_h_e, "\nSelect a text source, that will be used.\n" )
	obs.obs_property_list_add_string( p_h_e, "Select", "select" )
	list = {}
	if sources ~= nil then
		for _, source in ipairs( sources ) do
			source_id = obs.obs_source_get_unversioned_id( source )
			if source_id == "text_gdiplus" or source_id == "text_ft2_source" then
				local name = obs.obs_source_get_name( source )
				list[name] = name
			end
		end
			obs.bfree(source)
		for key, value in pairsByKeys(list) do
			--[[
				add item to property list
			]]	
			obs.obs_property_list_add_string( p_h_e, value, value )
		end
	end
	
	--[[
	----------------------------------------------------------
	Visitor Score Item 1
	----------------------------------------------------------
	]]
	local p_v_a = obs.obs_properties_add_list( group_props_v, "p_v_a_source", "<font color=".. font_1 .."><i>1</i></font>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING )
	obs.obs_property_set_long_description( p_v_a, "\nSelect a text source, that will be used.\n" )
	obs.obs_property_list_add_string( p_v_a, "Select", "select" )
	list = {}
	if sources ~= nil then
		for _, source in ipairs( sources ) do
			source_id = obs.obs_source_get_unversioned_id( source )
			if source_id == "text_gdiplus" or source_id == "text_ft2_source" then
				local name = obs.obs_source_get_name( source )
				list[name] = name
			end
		end
			obs.bfree(source)
		for key, value in pairsByKeys(list) do
			--[[
				add item to property list
			]]	
			obs.obs_property_list_add_string( p_v_a, value, value )
		end
	end
	--[[
	----------------------------------------------------------
	Visitor Score Item 2
	----------------------------------------------------------
	]]
   	local p_v_b = obs.obs_properties_add_list( group_props_v, "p_v_b_source", "<font color=".. font_2 .."><i>2</i></font>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING )
	obs.obs_property_set_long_description( p_v_b, "\nSelect a text source, that will be used.\n" )
	obs.obs_property_list_add_string( p_v_b, "Select", "select" )
	list = {}
	if sources ~= nil then
		for _, source in ipairs( sources ) do
			source_id = obs.obs_source_get_unversioned_id( source )
			if source_id == "text_gdiplus" or source_id == "text_ft2_source" then
				local name = obs.obs_source_get_name( source )
				list[name] = name
			end
		end
			obs.bfree(source)
		for key, value in pairsByKeys(list) do
			--[[
				add item to property list
			]]	
			obs.obs_property_list_add_string( p_v_b, value, value )
		end
	end
	--[[
	----------------------------------------------------------
	Visitor Score Item 3
	----------------------------------------------------------
	]]
   	local p_v_c = obs.obs_properties_add_list( group_props_v, "p_v_c_source", "<font color=".. font_3 .."><i>3</i></font>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING )
	obs.obs_property_set_long_description( p_v_c, "\nSelect a text source, that will be used.\n" )
	obs.obs_property_list_add_string( p_v_c, "Select", "select" )
	list = {}
	if sources ~= nil then
		for _, source in ipairs( sources ) do
			source_id = obs.obs_source_get_unversioned_id( source )
			if source_id == "text_gdiplus" or source_id == "text_ft2_source" then
				local name = obs.obs_source_get_name( source )
				list[name] = name
			end
		end
			obs.bfree(source)
		for key, value in pairsByKeys(list) do
			--[[
				add item to property list
			]]	
			obs.obs_property_list_add_string( p_v_c, value, value )
		end
	end
	--[[
	----------------------------------------------------------
	Visitor Score Item 4
	----------------------------------------------------------
	]]
   	local p_v_d = obs.obs_properties_add_list( group_props_v, "p_v_d_source", "<font color=".. font_4 .."><i>4</i></font>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING )
	obs.obs_property_set_long_description( p_v_d, "\nSelect a text source, that will be used.\n" )
	obs.obs_property_list_add_string( p_v_d, "Select", "select" )
	list = {}
	if sources ~= nil then
		for _, source in ipairs( sources ) do
			source_id = obs.obs_source_get_unversioned_id( source )
			if source_id == "text_gdiplus" or source_id == "text_ft2_source" then
				local name = obs.obs_source_get_name( source )
				list[name] = name
			end
		end
			obs.bfree(source)
		for key, value in pairsByKeys(list) do
			--[[
				add item to property list
			]]	
			obs.obs_property_list_add_string( p_v_d, value, value )
		end
	end
	--[[
	----------------------------------------------------------
	Visitor Score Item 5
	----------------------------------------------------------
	]]
   	local p_v_e = obs.obs_properties_add_list( group_props_v, "p_v_e_source", "<font color=".. font_4 .."><i>5</i></font>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING )
	obs.obs_property_set_long_description( p_v_e, "\nSelect a text source, that will be used.\n" )
	obs.obs_property_list_add_string( p_v_e, "Select", "select" )
	list = {}
	if sources ~= nil then
		for _, source in ipairs( sources ) do
			source_id = obs.obs_source_get_unversioned_id( source )
			if source_id == "text_gdiplus" or source_id == "text_ft2_source" then
				local name = obs.obs_source_get_name( source )
				list[name] = name
			end
		end
			obs.bfree(source)
		for key, value in pairsByKeys(list) do
			--[[
				add item to property list
			]]	
			obs.obs_property_list_add_string( p_v_e, value, value )
		end
	end
	--[[
	----------------------------------------------------------
	Summary Score Item 1
	----------------------------------------------------------
	]]
	local p_s_a = obs.obs_properties_add_list( group_props_s, "p_s_a_source", "<font color=".. font_1 .."><i>1</i></font>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING )
	obs.obs_property_set_long_description( p_s_a, "\nSelect a text source, that will be used.\n" )
	obs.obs_property_list_add_string( p_s_a, "Select", "select" )
	list = {}
	if sources ~= nil then
		for _, source in ipairs( sources ) do
			source_id = obs.obs_source_get_unversioned_id( source )
			if source_id == "text_gdiplus" or source_id == "text_ft2_source" then
				local name = obs.obs_source_get_name( source )
				list[name] = name
			end
		end
			obs.bfree(source)
		for key, value in pairsByKeys(list) do
			--[[
				add item to property list
			]]	
			obs.obs_property_list_add_string( p_s_a, value, value )
		end
	end
	--[[
	----------------------------------------------------------
	Summary Score Item 2
	----------------------------------------------------------
	]]
   	local p_s_b = obs.obs_properties_add_list( group_props_s, "p_s_b_source", "<font color=".. font_2 .."><i>2</i></font>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING )
	obs.obs_property_set_long_description( p_s_b, "\nSelect a text source, that will be used.\n" )
	obs.obs_property_list_add_string( p_s_b, "Select", "select" )
	list = {}
	if sources ~= nil then
		for _, source in ipairs( sources ) do
			source_id = obs.obs_source_get_unversioned_id( source )
			if source_id == "text_gdiplus" or source_id == "text_ft2_source" then
				local name = obs.obs_source_get_name( source )
				list[name] = name
			end
		end
			obs.bfree(source)
		for key, value in pairsByKeys(list) do
			--[[
				add item to property list
			]]	
			obs.obs_property_list_add_string( p_s_b, value, value )
		end
	end
	--[[
	----------------------------------------------------------
	Summary Score Item 3
	----------------------------------------------------------
	]]
   	local p_s_c = obs.obs_properties_add_list( group_props_s, "p_s_c_source", "<font color=".. font_3 .."><i>3</i></font>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING )
	obs.obs_property_set_long_description( p_s_c, "\nSelect a text source, that will be used.\n" )
	obs.obs_property_list_add_string( p_s_c, "Select", "select" )
	list = {}
	if sources ~= nil then
		for _, source in ipairs( sources ) do
			source_id = obs.obs_source_get_unversioned_id( source )
			if source_id == "text_gdiplus" or source_id == "text_ft2_source" then
				local name = obs.obs_source_get_name( source )
				list[name] = name
			end	
		end
			obs.bfree(source)
		for key, value in pairsByKeys(list) do
			--[[
				add item to property list
			]]	
			obs.obs_property_list_add_string( p_s_c, value, value )
		end
	end
	--[[
	----------------------------------------------------------
	Summary Score Item 4
	----------------------------------------------------------
	]]
   	local p_s_d = obs.obs_properties_add_list( group_props_s, "p_s_d_source", "<font color=".. font_4 .."><i>4</i></font>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING )
	obs.obs_property_set_long_description( p_s_d, "\nSelect a text source, that will be used.\n" )
	obs.obs_property_list_add_string( p_s_d, "Select", "select" )
	list = {}
	if sources ~= nil then
		for _, source in ipairs( sources ) do
			source_id = obs.obs_source_get_unversioned_id( source )
			if source_id == "text_gdiplus" or source_id == "text_ft2_source" then
				local name = obs.obs_source_get_name( source )
				list[name] = name
			end
		end
			obs.bfree(source)
		for key, value in pairsByKeys(list) do
			--[[
				add item to property list
			]]	
			obs.obs_property_list_add_string( p_s_d, value, value )
		end
	end
	--[[
	----------------------------------------------------------
	Summary Score Item 5
	----------------------------------------------------------
	]]
   	local p_s_e = obs.obs_properties_add_list( group_props_s, "p_s_e_source", "<font color=".. font_4 .."><i>5</i></font>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING )
	obs.obs_property_set_long_description( p_s_e, "\nSelect a text source, that will be used.\n" )
	obs.obs_property_list_add_string( p_s_e, "Select", "select" )
	list = {}
	if sources ~= nil then
		for _, source in ipairs( sources ) do
			source_id = obs.obs_source_get_unversioned_id( source )
			if source_id == "text_gdiplus" or source_id == "text_ft2_source" then
				local name = obs.obs_source_get_name( source )
				list[name] = name
			end
		end
			obs.bfree(source)
		for key, value in pairsByKeys(list) do
			--[[
				add item to property list
			]]	
			obs.obs_property_list_add_string( p_s_e, value, value )
		end
	end
	obs.obs_properties_add_int_slider( group_props_h, "p_h_a_int", "1", 1, 100, 1 )
	obs.obs_properties_add_int_slider( group_props_h, "p_h_b_int", "2", 1, 100, 1 )
	obs.obs_properties_add_int_slider( group_props_h, "p_h_c_int", "3", 1, 100, 1 )
	obs.obs_properties_add_int_slider( group_props_h, "p_h_d_int", "4", 1, 100, 1 )
	obs.obs_properties_add_int_slider( group_props_h, "p_h_e_int", "5", 1, 100, 1 )
	obs.obs_properties_add_int_slider( group_props_v, "p_v_a_int", "1", 1, 100, 1 )
	obs.obs_properties_add_int_slider( group_props_v, "p_v_b_int", "2", 1, 100, 1 )
	obs.obs_properties_add_int_slider( group_props_v, "p_v_c_int", "3", 1, 100, 1 )
	obs.obs_properties_add_int_slider( group_props_v, "p_v_d_int", "4", 1, 100, 1 )
	obs.obs_properties_add_int_slider( group_props_v, "p_v_e_int", "5", 1, 100, 1 )
	obs.obs_properties_add_int_slider( group_props_s, "p_s_a_int", "1", 1, 100, 1 )
	obs.obs_properties_add_int_slider( group_props_s, "p_s_b_int", "2", 1, 100, 1 )
	obs.obs_properties_add_int_slider( group_props_s, "p_s_c_int", "3", 1, 100, 1 )
	obs.obs_properties_add_int_slider( group_props_s, "p_s_d_int", "4", 1, 100, 1 )
	obs.obs_properties_add_int_slider( group_props_s, "p_s_e_int", "5", 1, 100, 1 )
	
	obs.source_list_release( sources )
	obs.obs_properties_add_button( props, "reset_button", "Reset Scoreboard", reset_button_clicked )
    --obs.obs_properties_add_bool( props, "disable_script", "Disable Script" )
	--Sets callback upon modification of the list Basically an Event Listener
  	obs.obs_property_set_modified_callback( p_h_a, property_onchange )
  	obs.obs_property_set_modified_callback( p_h_b, property_onchange )
  	obs.obs_property_set_modified_callback( p_h_c, property_onchange )
  	obs.obs_property_set_modified_callback( p_h_d, property_onchange )
  	obs.obs_property_set_modified_callback( p_h_e, property_onchange )
  	obs.obs_property_set_modified_callback( p_v_a, property_onchange )
  	obs.obs_property_set_modified_callback( p_v_b, property_onchange )
  	obs.obs_property_set_modified_callback( p_v_c, property_onchange )
  	obs.obs_property_set_modified_callback( p_v_d, property_onchange )
  	obs.obs_property_set_modified_callback( p_v_e, property_onchange )
  	obs.obs_property_set_modified_callback( p_s_a, property_onchange )
  	obs.obs_property_set_modified_callback( p_s_b, property_onchange )
  	obs.obs_property_set_modified_callback( p_s_c, property_onchange )
  	obs.obs_property_set_modified_callback( p_s_d, property_onchange )
  	obs.obs_property_set_modified_callback( p_s_e, property_onchange )

	-- Calls the callback once to set-up current visibility
  	obs.obs_properties_apply_settings( props, script_settings )
	script_props = props
	return props
end

--[[
----------------------------------------------------------
	A function named script_update will be called when settings are changed
----------------------------------------------------------
]]
-- Called upon settings initialization and modification
function script_update( settings )
	p_h_a_source = obs.obs_data_get_string( settings, "p_h_a_source" )
	p_h_b_source = obs.obs_data_get_string( settings, "p_h_b_source" )
	p_h_c_source = obs.obs_data_get_string( settings, "p_h_c_source" )
	p_h_d_source = obs.obs_data_get_string( settings, "p_h_d_source" )
	p_h_e_source = obs.obs_data_get_string( settings, "p_h_e_source" )
	p_v_a_source = obs.obs_data_get_string( settings, "p_v_a_source" )
	p_v_b_source = obs.obs_data_get_string( settings, "p_v_b_source" )
	p_v_c_source = obs.obs_data_get_string( settings, "p_v_c_source" )
	p_v_d_source = obs.obs_data_get_string( settings, "p_v_d_source" )
	p_v_e_source = obs.obs_data_get_string( settings, "p_v_e_source" )
	p_s_a_source = obs.obs_data_get_string( settings, "p_s_a_source" )
	p_s_b_source = obs.obs_data_get_string( settings, "p_s_b_source" )
	p_s_c_source = obs.obs_data_get_string( settings, "p_s_c_source" )
	p_s_d_source = obs.obs_data_get_string( settings, "p_s_d_source" )
	p_s_e_source = obs.obs_data_get_string( settings, "p_s_e_source" )	
	p_h_a_int = obs.obs_data_get_int( settings, "p_h_a_int" )
	p_h_b_int = obs.obs_data_get_int( settings, "p_h_b_int" )
	p_h_c_int = obs.obs_data_get_int( settings, "p_h_c_int" )
	p_h_d_int = obs.obs_data_get_int( settings, "p_h_d_int" )
	p_h_e_int = obs.obs_data_get_int( settings, "p_h_e_int" )
	p_v_a_int = obs.obs_data_get_int( settings, "p_v_a_int" )
	p_v_b_int = obs.obs_data_get_int( settings, "p_v_b_int" )
	p_v_c_int = obs.obs_data_get_int( settings, "p_v_c_int" )
	p_v_d_int = obs.obs_data_get_int( settings, "p_v_d_int" )
	p_v_e_int = obs.obs_data_get_int( settings, "p_v_e_int" )
	p_s_a_int = obs.obs_data_get_int( settings, "p_s_a_int" )
	p_s_b_int = obs.obs_data_get_int( settings, "p_s_b_int" )
	p_s_c_int = obs.obs_data_get_int( settings, "p_s_c_int" )
	p_s_d_int = obs.obs_data_get_int( settings, "p_s_d_int" )
	p_s_e_int = obs.obs_data_get_int( settings, "p_s_e_int" )
	set_text( p_h_a_source, p_h_a_value )
	set_text( p_h_b_source, p_h_b_value )
	set_text( p_h_c_source, p_h_c_value )
	set_text( p_h_d_source, p_h_d_value )
	set_text( p_h_e_source, p_h_e_value )
	set_text( p_v_a_source, p_v_a_value )
	set_text( p_v_b_source, p_v_b_value )
	set_text( p_v_c_source, p_v_c_value )
	set_text( p_v_d_source, p_v_d_value )
	set_text( p_v_e_source, p_v_e_value )
	set_text( p_s_a_source, p_s_a_value )
	set_text( p_s_b_source, p_s_b_value )
	set_text( p_s_c_source, p_s_c_value )
	set_text( p_s_d_source, p_s_d_value )
	set_text( p_s_e_source, p_s_e_value )	
    --disable_script = obs.obs_data_get_bool( settings,"disable_script" )
	-- Keep track of current settings
  	script_settings = settings 
end

--[[
----------------------------------------------------------
A function named script_defaults will be called to set the default settings
----------------------------------------------------------
]]
function script_defaults( settings )
	obs.obs_data_set_default_string( settings, "p_h_a_source", "Select")
	obs.obs_data_set_default_string( settings, "p_h_b_source", "Select")
	obs.obs_data_set_default_string( settings, "p_h_c_source", "Select")
	obs.obs_data_set_default_string( settings, "p_h_d_source", "Select")
	obs.obs_data_set_default_string( settings, "p_h_e_source", "Select")
	obs.obs_data_set_default_string( settings, "p_v_a_source", "Select")
	obs.obs_data_set_default_string( settings, "p_v_b_source", "Select")
	obs.obs_data_set_default_string( settings, "p_v_c_source", "Select")
	obs.obs_data_set_default_string( settings, "p_v_d_source", "Select")
	obs.obs_data_set_default_string( settings, "p_v_e_source", "Select")
	obs.obs_data_set_default_string( settings, "p_s_a_source", "Select")
	obs.obs_data_set_default_string( settings, "p_s_b_source", "Select")
	obs.obs_data_set_default_string( settings, "p_s_c_source", "Select")
	obs.obs_data_set_default_string( settings, "p_s_d_source", "Select")
	obs.obs_data_set_default_string( settings, "p_s_e_source", "Select")
	obs.obs_data_set_default_int( settings, "p_h_a_int", 1 )
	obs.obs_data_set_default_int( settings, "p_h_b_int", 1 )
	obs.obs_data_set_default_int( settings, "p_h_c_int", 1 )
	obs.obs_data_set_default_int( settings, "p_h_d_int", 1 )
	obs.obs_data_set_default_int( settings, "p_h_e_int", 1 )
	obs.obs_data_set_default_int( settings, "p_v_a_int", 1 )
	obs.obs_data_set_default_int( settings, "p_v_b_int", 1 )
	obs.obs_data_set_default_int( settings, "p_v_c_int", 1 )
	obs.obs_data_set_default_int( settings, "p_v_d_int", 1 )
	obs.obs_data_set_default_int( settings, "p_v_e_int", 1 )
	obs.obs_data_set_default_int( settings, "p_s_a_int", 1 )
	obs.obs_data_set_default_int( settings, "p_s_b_int", 1 )
	obs.obs_data_set_default_int( settings, "p_s_c_int", 1 )
	obs.obs_data_set_default_int( settings, "p_s_d_int", 1 )
	obs.obs_data_set_default_int( settings, "p_s_e_int", 1 )	
	--obs.obs_data_set_default_bool( settings, "disable_script", false )
end

--[[
----------------------------------------------------------
	A function named script_save will be called when the script is saved
	NOTE: This function is usually used for saving extra data ( such as in this
	case, a hotkey's save data ).  Settings set via the properties are saved
	automatically.
----------------------------------------------------------
]]
function script_save( settings )
	local reset_hotkey_save_array = obs.obs_hotkey_save( reset_hotkey_id )
	obs.obs_data_set_array( settings, "reset_hotkey", reset_hotkey_save_array )
	obs.obs_data_array_release( reset_hotkey_save_array )
	local p_h_a_1_hotkey_save_array = obs.obs_hotkey_save( p_h_a_1_hotkey_id )
	local p_h_b_1_hotkey_save_array = obs.obs_hotkey_save( p_h_b_1_hotkey_id )
	local p_h_c_1_hotkey_save_array = obs.obs_hotkey_save( p_h_c_1_hotkey_id )
	local p_h_d_1_hotkey_save_array = obs.obs_hotkey_save( p_h_d_1_hotkey_id )
	local p_h_e_1_hotkey_save_array = obs.obs_hotkey_save( p_h_e_1_hotkey_id )
	local p_v_a_1_hotkey_save_array = obs.obs_hotkey_save( p_v_a_1_hotkey_id )
	local p_v_b_1_hotkey_save_array = obs.obs_hotkey_save( p_v_b_1_hotkey_id )
	local p_v_c_1_hotkey_save_array = obs.obs_hotkey_save( p_v_c_1_hotkey_id )
	local p_v_d_1_hotkey_save_array = obs.obs_hotkey_save( p_v_d_1_hotkey_id )
	local p_v_e_1_hotkey_save_array = obs.obs_hotkey_save( p_v_e_1_hotkey_id )
	local p_s_a_1_hotkey_save_array = obs.obs_hotkey_save( p_s_a_1_hotkey_id )
	local p_s_b_1_hotkey_save_array = obs.obs_hotkey_save( p_s_b_1_hotkey_id )
	local p_s_c_1_hotkey_save_array = obs.obs_hotkey_save( p_s_c_1_hotkey_id )
	local p_s_d_1_hotkey_save_array = obs.obs_hotkey_save( p_s_d_1_hotkey_id )
	local p_s_e_1_hotkey_save_array = obs.obs_hotkey_save( p_s_e_1_hotkey_id )	
	local p_h_a_0_hotkey_save_array = obs.obs_hotkey_save( p_h_a_0_hotkey_id )
	local p_h_b_0_hotkey_save_array = obs.obs_hotkey_save( p_h_b_0_hotkey_id )
	local p_h_c_0_hotkey_save_array = obs.obs_hotkey_save( p_h_c_0_hotkey_id )
	local p_h_d_0_hotkey_save_array = obs.obs_hotkey_save( p_h_d_0_hotkey_id )
	local p_h_e_0_hotkey_save_array = obs.obs_hotkey_save( p_h_e_0_hotkey_id )
	local p_v_a_0_hotkey_save_array = obs.obs_hotkey_save( p_v_a_0_hotkey_id )
	local p_v_b_0_hotkey_save_array = obs.obs_hotkey_save( p_v_b_0_hotkey_id )
	local p_v_c_0_hotkey_save_array = obs.obs_hotkey_save( p_v_c_0_hotkey_id )
	local p_v_d_0_hotkey_save_array = obs.obs_hotkey_save( p_v_d_0_hotkey_id )
	local p_v_e_0_hotkey_save_array = obs.obs_hotkey_save( p_v_e_0_hotkey_id )
	local p_s_a_0_hotkey_save_array = obs.obs_hotkey_save( p_s_a_0_hotkey_id )
	local p_s_b_0_hotkey_save_array = obs.obs_hotkey_save( p_s_b_0_hotkey_id )
	local p_s_c_0_hotkey_save_array = obs.obs_hotkey_save( p_s_c_0_hotkey_id )
	local p_s_d_0_hotkey_save_array = obs.obs_hotkey_save( p_s_d_0_hotkey_id )
	local p_s_e_0_hotkey_save_array = obs.obs_hotkey_save( p_s_e_0_hotkey_id )	
	obs.obs_data_set_array( settings, "p_h_a_1_hotkey", p_h_a_1_hotkey_save_array )
	obs.obs_data_set_array( settings, "p_h_b_1_hotkey", p_h_b_1_hotkey_save_array )
	obs.obs_data_set_array( settings, "p_h_c_1_hotkey", p_h_c_1_hotkey_save_array )
	obs.obs_data_set_array( settings, "p_h_d_1_hotkey", p_h_d_1_hotkey_save_array )
	obs.obs_data_set_array( settings, "p_h_e_1_hotkey", p_h_e_1_hotkey_save_array )
	obs.obs_data_set_array( settings, "p_v_a_1_hotkey", p_v_a_1_hotkey_save_array )
	obs.obs_data_set_array( settings, "p_v_b_1_hotkey", p_v_b_1_hotkey_save_array )
	obs.obs_data_set_array( settings, "p_v_c_1_hotkey", p_v_c_1_hotkey_save_array )
	obs.obs_data_set_array( settings, "p_v_d_1_hotkey", p_v_d_1_hotkey_save_array )
	obs.obs_data_set_array( settings, "p_v_e_1_hotkey", p_v_e_1_hotkey_save_array )
	obs.obs_data_set_array( settings, "p_s_a_1_hotkey", p_s_a_1_hotkey_save_array )
	obs.obs_data_set_array( settings, "p_s_b_1_hotkey", p_s_b_1_hotkey_save_array )
	obs.obs_data_set_array( settings, "p_s_c_1_hotkey", p_s_c_1_hotkey_save_array )
	obs.obs_data_set_array( settings, "p_s_d_1_hotkey", p_s_d_1_hotkey_save_array )
	obs.obs_data_set_array( settings, "p_s_e_1_hotkey", p_s_e_1_hotkey_save_array )	
	obs.obs_data_set_array( settings, "p_h_a_0_hotkey", p_h_a_0_hotkey_save_array )
	obs.obs_data_set_array( settings, "p_h_b_0_hotkey", p_h_b_0_hotkey_save_array )
	obs.obs_data_set_array( settings, "p_h_c_0_hotkey", p_h_c_0_hotkey_save_array )
	obs.obs_data_set_array( settings, "p_h_d_0_hotkey", p_h_d_0_hotkey_save_array )
	obs.obs_data_set_array( settings, "p_h_e_0_hotkey", p_h_e_0_hotkey_save_array )
	obs.obs_data_set_array( settings, "p_v_a_0_hotkey", p_v_a_0_hotkey_save_array )
	obs.obs_data_set_array( settings, "p_v_b_0_hotkey", p_v_b_0_hotkey_save_array )
	obs.obs_data_set_array( settings, "p_v_c_0_hotkey", p_v_c_0_hotkey_save_array )
	obs.obs_data_set_array( settings, "p_v_d_0_hotkey", p_v_d_0_hotkey_save_array )
	obs.obs_data_set_array( settings, "p_v_e_0_hotkey", p_v_e_0_hotkey_save_array )
	obs.obs_data_set_array( settings, "p_s_a_0_hotkey", p_s_a_0_hotkey_save_array )
	obs.obs_data_set_array( settings, "p_s_b_0_hotkey", p_s_b_0_hotkey_save_array )
	obs.obs_data_set_array( settings, "p_s_c_0_hotkey", p_s_c_0_hotkey_save_array )
	obs.obs_data_set_array( settings, "p_s_d_0_hotkey", p_s_d_0_hotkey_save_array )
	obs.obs_data_set_array( settings, "p_s_e_0_hotkey", p_s_e_0_hotkey_save_array )	
	obs.obs_data_array_release( p_h_a_1_hotkey_save_array )
	obs.obs_data_array_release( p_h_b_1_hotkey_save_array )
	obs.obs_data_array_release( p_h_c_1_hotkey_save_array )
	obs.obs_data_array_release( p_h_d_1_hotkey_save_array )
	obs.obs_data_array_release( p_h_e_1_hotkey_save_array )
	obs.obs_data_array_release( p_v_a_1_hotkey_save_array )
	obs.obs_data_array_release( p_v_b_1_hotkey_save_array )
	obs.obs_data_array_release( p_v_c_1_hotkey_save_array )
	obs.obs_data_array_release( p_v_d_1_hotkey_save_array )
	obs.obs_data_array_release( p_v_e_1_hotkey_save_array )
	obs.obs_data_array_release( p_s_a_1_hotkey_save_array )
	obs.obs_data_array_release( p_s_b_1_hotkey_save_array )
	obs.obs_data_array_release( p_s_c_1_hotkey_save_array )
	obs.obs_data_array_release( p_s_d_1_hotkey_save_array )
	obs.obs_data_array_release( p_s_e_1_hotkey_save_array )	
	obs.obs_data_array_release( p_h_a_0_hotkey_save_array )
	obs.obs_data_array_release( p_h_b_0_hotkey_save_array )
	obs.obs_data_array_release( p_h_c_0_hotkey_save_array )
	obs.obs_data_array_release( p_h_d_0_hotkey_save_array )
	obs.obs_data_array_release( p_h_e_0_hotkey_save_array )
	obs.obs_data_array_release( p_v_a_0_hotkey_save_array )
	obs.obs_data_array_release( p_v_b_0_hotkey_save_array )
	obs.obs_data_array_release( p_v_c_0_hotkey_save_array )
	obs.obs_data_array_release( p_v_d_0_hotkey_save_array )
	obs.obs_data_array_release( p_v_e_0_hotkey_save_array )
	obs.obs_data_array_release( p_s_a_0_hotkey_save_array )
	obs.obs_data_array_release( p_s_b_0_hotkey_save_array )
	obs.obs_data_array_release( p_s_c_0_hotkey_save_array )
	obs.obs_data_array_release( p_s_d_0_hotkey_save_array )
	obs.obs_data_array_release( p_s_e_0_hotkey_save_array )	
end

--[[
----------------------------------------------------------
	a function named script_load will be called on startup	
	Connect hotkey and activation/deactivation signal callbacks
	--
	NOTE: These particular script callbacks do not necessarily have to
	be disconnected, as callbacks will automatically destroy themselves
	if the script is unloaded.  So there's no real need to manually
	disconnect callbacks that are intended to last until the script is
	unloaded.
----------------------------------------------------------
]]
function script_load( settings )

	reset_hotkey_id = obs.obs_hotkey_register_frontend( "reset_scoreboard_" .. filename():lower():gsub('[%W%p%c%s]', ''), "Reset " .. filename(), reset )		
	local hotkey_save_array_reset = obs.obs_data_get_array( settings, "reset_hotkey" )
	obs.obs_hotkey_load( reset_hotkey_id, reset_hotkey_save_array )			
	obs.obs_data_array_release( reset_hotkey_save_array )	
	p_h_a_1_hotkey_id = obs.obs_hotkey_register_frontend( "p_h_a_1_scoreboard_" .. filename():lower():gsub('[%W%p%c%s]', ''), filename() .. " 1 Home Add ", p_h_a_1 )
	p_h_b_1_hotkey_id = obs.obs_hotkey_register_frontend( "p_h_b_1_scoreboard_" .. filename():lower():gsub('[%W%p%c%s]', ''), filename() .. " 2 Home Add ", p_h_b_1 )
	p_h_c_1_hotkey_id = obs.obs_hotkey_register_frontend( "p_h_c_1_scoreboard_" .. filename():lower():gsub('[%W%p%c%s]', ''), filename() .. " 3 Home Add ", p_h_c_1 )
	p_h_d_1_hotkey_id = obs.obs_hotkey_register_frontend( "p_h_d_1_scoreboard_" .. filename():lower():gsub('[%W%p%c%s]', ''), filename() .. " 4 Home Add ", p_h_d_1 )
	p_h_e_1_hotkey_id = obs.obs_hotkey_register_frontend( "p_h_e_1_scoreboard_" .. filename():lower():gsub('[%W%p%c%s]', ''), filename() .. " 5 Home Add ", p_h_e_1 )
	p_v_a_1_hotkey_id = obs.obs_hotkey_register_frontend( "p_v_a_1_scoreboard_" .. filename():lower():gsub('[%W%p%c%s]', ''), filename() .. " 1 Visitor Add ", p_v_a_1 )
	p_v_b_1_hotkey_id = obs.obs_hotkey_register_frontend( "p_v_b_1_scoreboard_" .. filename():lower():gsub('[%W%p%c%s]', ''), filename() .. " 2 Visitor Add ", p_v_b_1 )
	p_v_c_1_hotkey_id = obs.obs_hotkey_register_frontend( "p_v_c_1_scoreboard_" .. filename():lower():gsub('[%W%p%c%s]', ''), filename() .. " 3 Visitor Add ", p_v_c_1 )
	p_v_d_1_hotkey_id = obs.obs_hotkey_register_frontend( "p_v_d_1_scoreboard_" .. filename():lower():gsub('[%W%p%c%s]', ''), filename() .. " 4 Visitor Add ", p_v_d_1 )
	p_v_e_1_hotkey_id = obs.obs_hotkey_register_frontend( "p_v_e_1_scoreboard_" .. filename():lower():gsub('[%W%p%c%s]', ''), filename() .. " 5 Visitor Add ", p_v_e_1 )
	p_s_a_1_hotkey_id = obs.obs_hotkey_register_frontend( "p_s_a_1_scoreboard_" .. filename():lower():gsub('[%W%p%c%s]', ''), filename() .. " 1 Summary Add ", p_s_a_1 )
	p_s_b_1_hotkey_id = obs.obs_hotkey_register_frontend( "p_s_b_1_scoreboard_" .. filename():lower():gsub('[%W%p%c%s]', ''), filename() .. " 2 Summary Add ", p_s_b_1 )
	p_s_c_1_hotkey_id = obs.obs_hotkey_register_frontend( "p_s_c_1_scoreboard_" .. filename():lower():gsub('[%W%p%c%s]', ''), filename() .. " 3 Summary Add ", p_s_c_1 )
	p_s_d_1_hotkey_id = obs.obs_hotkey_register_frontend( "p_s_d_1_scoreboard_" .. filename():lower():gsub('[%W%p%c%s]', ''), filename() .. " 4 Summary Add ", p_s_d_1 )
	p_s_e_1_hotkey_id = obs.obs_hotkey_register_frontend( "p_s_e_1_scoreboard_" .. filename():lower():gsub('[%W%p%c%s]', ''), filename() .. " 5 Summary Add ", p_s_e_1 )			
	p_h_a_0_hotkey_id = obs.obs_hotkey_register_frontend( "p_h_a_0_scoreboard_" .. filename():lower():gsub('[%W%p%c%s]', ''), filename() .. " 1 Home Subtract ", p_h_a_0 )
	p_h_b_0_hotkey_id = obs.obs_hotkey_register_frontend( "p_h_b_0_scoreboard_" .. filename():lower():gsub('[%W%p%c%s]', ''), filename() .. " 2 Home Subtract ", p_h_b_0 )
	p_h_c_0_hotkey_id = obs.obs_hotkey_register_frontend( "p_h_c_0_scoreboard_" .. filename():lower():gsub('[%W%p%c%s]', ''), filename() .. " 3 Home Subtract ", p_h_c_0 )
	p_h_d_0_hotkey_id = obs.obs_hotkey_register_frontend( "p_h_d_0_scoreboard_" .. filename():lower():gsub('[%W%p%c%s]', ''), filename() .. " 4 Home Subtract ", p_h_d_0 )
	p_h_e_0_hotkey_id = obs.obs_hotkey_register_frontend( "p_h_e_0_scoreboard_" .. filename():lower():gsub('[%W%p%c%s]', ''), filename() .. " 5 Home Subtract ", p_h_e_0 )
	p_v_a_0_hotkey_id = obs.obs_hotkey_register_frontend( "p_v_a_0_scoreboard_" .. filename():lower():gsub('[%W%p%c%s]', ''), filename() .. " 1 Visitor Subtract ", p_v_a_0 )
	p_v_b_0_hotkey_id = obs.obs_hotkey_register_frontend( "p_v_b_0_scoreboard_" .. filename():lower():gsub('[%W%p%c%s]', ''), filename() .. " 2 Visitor Subtract ", p_v_b_0 )
	p_v_c_0_hotkey_id = obs.obs_hotkey_register_frontend( "p_v_c_0_scoreboard_" .. filename():lower():gsub('[%W%p%c%s]', ''), filename() .. " 3 Visitor Subtract ", p_v_c_0 )
	p_v_d_0_hotkey_id = obs.obs_hotkey_register_frontend( "p_v_d_0_scoreboard_" .. filename():lower():gsub('[%W%p%c%s]', ''), filename() .. " 4 Visitor Subtract ", p_v_d_0 )
	p_v_e_0_hotkey_id = obs.obs_hotkey_register_frontend( "p_v_e_0_scoreboard_" .. filename():lower():gsub('[%W%p%c%s]', ''), filename() .. " 5 Visitor Subtract ", p_v_e_0 )
	p_s_a_0_hotkey_id = obs.obs_hotkey_register_frontend( "p_s_a_0_scoreboard_" .. filename():lower():gsub('[%W%p%c%s]', ''), filename() .. " 1 Summary Subtract ", p_s_a_0 )
	p_s_b_0_hotkey_id = obs.obs_hotkey_register_frontend( "p_s_b_0_scoreboard_" .. filename():lower():gsub('[%W%p%c%s]', ''), filename() .. " 2 Summary Subtract ", p_s_b_0 )
	p_s_c_0_hotkey_id = obs.obs_hotkey_register_frontend( "p_s_c_0_scoreboard_" .. filename():lower():gsub('[%W%p%c%s]', ''), filename() .. " 3 Summary Subtract ", p_s_c_0 )
	p_s_d_0_hotkey_id = obs.obs_hotkey_register_frontend( "p_s_d_0_scoreboard_" .. filename():lower():gsub('[%W%p%c%s]', ''), filename() .. " 4 Summary Subtract ", p_s_d_0 )
	p_s_e_0_hotkey_id = obs.obs_hotkey_register_frontend( "p_s_e_0_scoreboard_" .. filename():lower():gsub('[%W%p%c%s]', ''), filename() .. " 5 Summary Subtract ", p_s_e_0 )				
	local p_h_a_1_hotkey_save_array = obs.obs_data_get_array( settings, "p_h_a_1_hotkey" )
	local p_h_b_1_hotkey_save_array = obs.obs_data_get_array( settings, "p_h_b_1_hotkey" )
	local p_h_c_1_hotkey_save_array = obs.obs_data_get_array( settings, "p_h_c_1_hotkey" )
	local p_h_d_1_hotkey_save_array = obs.obs_data_get_array( settings, "p_h_d_1_hotkey" )
	local p_h_e_1_hotkey_save_array = obs.obs_data_get_array( settings, "p_h_e_1_hotkey" )
	local p_v_a_1_hotkey_save_array = obs.obs_data_get_array( settings, "p_v_a_1_hotkey" )
	local p_v_b_1_hotkey_save_array = obs.obs_data_get_array( settings, "p_v_b_1_hotkey" )
	local p_v_c_1_hotkey_save_array = obs.obs_data_get_array( settings, "p_v_c_1_hotkey" )
	local p_v_d_1_hotkey_save_array = obs.obs_data_get_array( settings, "p_v_d_1_hotkey" )
	local p_v_e_1_hotkey_save_array = obs.obs_data_get_array( settings, "p_v_e_1_hotkey" )
	local p_s_a_1_hotkey_save_array = obs.obs_data_get_array( settings, "p_s_a_1_hotkey" )
	local p_s_b_1_hotkey_save_array = obs.obs_data_get_array( settings, "p_s_b_1_hotkey" )
	local p_s_c_1_hotkey_save_array = obs.obs_data_get_array( settings, "p_s_c_1_hotkey" )
	local p_s_d_1_hotkey_save_array = obs.obs_data_get_array( settings, "p_s_d_1_hotkey" )
	local p_s_e_1_hotkey_save_array = obs.obs_data_get_array( settings, "p_s_e_1_hotkey" )	
	local p_h_a_0_hotkey_save_array = obs.obs_data_get_array( settings, "p_h_a_0_hotkey" )
	local p_h_b_0_hotkey_save_array = obs.obs_data_get_array( settings, "p_h_b_0_hotkey" )
	local p_h_c_0_hotkey_save_array = obs.obs_data_get_array( settings, "p_h_c_0_hotkey" )
	local p_h_d_0_hotkey_save_array = obs.obs_data_get_array( settings, "p_h_d_0_hotkey" )
	local p_h_e_0_hotkey_save_array = obs.obs_data_get_array( settings, "p_h_e_0_hotkey" )
	local p_v_a_0_hotkey_save_array = obs.obs_data_get_array( settings, "p_v_a_0_hotkey" )
	local p_v_b_0_hotkey_save_array = obs.obs_data_get_array( settings, "p_v_b_0_hotkey" )
	local p_v_c_0_hotkey_save_array = obs.obs_data_get_array( settings, "p_v_c_0_hotkey" )
	local p_v_d_0_hotkey_save_array = obs.obs_data_get_array( settings, "p_v_d_0_hotkey" )
	local p_v_e_0_hotkey_save_array = obs.obs_data_get_array( settings, "p_v_e_0_hotkey" )
	local p_s_a_0_hotkey_save_array = obs.obs_data_get_array( settings, "p_s_a_0_hotkey" )
	local p_s_b_0_hotkey_save_array = obs.obs_data_get_array( settings, "p_s_b_0_hotkey" )
	local p_s_c_0_hotkey_save_array = obs.obs_data_get_array( settings, "p_s_c_0_hotkey" )
	local p_s_d_0_hotkey_save_array = obs.obs_data_get_array( settings, "p_s_d_0_hotkey" )
	local p_s_e_0_hotkey_save_array = obs.obs_data_get_array( settings, "p_s_e_0_hotkey" )			
	obs.obs_hotkey_load( p_h_a_1_hotkey_id, p_h_a_1_hotkey_save_array )
	obs.obs_hotkey_load( p_h_b_1_hotkey_id, p_h_b_1_hotkey_save_array )
	obs.obs_hotkey_load( p_h_c_1_hotkey_id, p_h_c_1_hotkey_save_array )
	obs.obs_hotkey_load( p_h_d_1_hotkey_id, p_h_d_1_hotkey_save_array )
	obs.obs_hotkey_load( p_h_e_1_hotkey_id, p_h_e_1_hotkey_save_array )
	obs.obs_hotkey_load( p_v_a_1_hotkey_id, p_v_a_1_hotkey_save_array )
	obs.obs_hotkey_load( p_v_b_1_hotkey_id, p_v_b_1_hotkey_save_array )
	obs.obs_hotkey_load( p_v_c_1_hotkey_id, p_v_c_1_hotkey_save_array )
	obs.obs_hotkey_load( p_v_d_1_hotkey_id, p_v_d_1_hotkey_save_array )
	obs.obs_hotkey_load( p_v_e_1_hotkey_id, p_v_e_1_hotkey_save_array )
	obs.obs_hotkey_load( p_s_a_1_hotkey_id, p_s_a_1_hotkey_save_array )
	obs.obs_hotkey_load( p_s_b_1_hotkey_id, p_s_b_1_hotkey_save_array )
	obs.obs_hotkey_load( p_s_c_1_hotkey_id, p_s_c_1_hotkey_save_array )
	obs.obs_hotkey_load( p_s_d_1_hotkey_id, p_s_d_1_hotkey_save_array )
	obs.obs_hotkey_load( p_s_e_1_hotkey_id, p_s_e_1_hotkey_save_array )	
	obs.obs_hotkey_load( p_h_a_0_hotkey_id, p_h_a_0_hotkey_save_array )
	obs.obs_hotkey_load( p_h_b_0_hotkey_id, p_h_b_0_hotkey_save_array )
	obs.obs_hotkey_load( p_h_c_0_hotkey_id, p_h_c_0_hotkey_save_array )
	obs.obs_hotkey_load( p_h_d_0_hotkey_id, p_h_d_0_hotkey_save_array )
	obs.obs_hotkey_load( p_h_e_0_hotkey_id, p_h_e_0_hotkey_save_array )
	obs.obs_hotkey_load( p_v_a_0_hotkey_id, p_v_a_0_hotkey_save_array )
	obs.obs_hotkey_load( p_v_b_0_hotkey_id, p_v_b_0_hotkey_save_array )
	obs.obs_hotkey_load( p_v_c_0_hotkey_id, p_v_c_0_hotkey_save_array )
	obs.obs_hotkey_load( p_v_d_0_hotkey_id, p_v_d_0_hotkey_save_array )
	obs.obs_hotkey_load( p_v_e_0_hotkey_id, p_v_e_0_hotkey_save_array )
	obs.obs_hotkey_load( p_s_a_0_hotkey_id, p_s_a_0_hotkey_save_array )
	obs.obs_hotkey_load( p_s_b_0_hotkey_id, p_s_b_0_hotkey_save_array )
	obs.obs_hotkey_load( p_s_c_0_hotkey_id, p_s_c_0_hotkey_save_array )
	obs.obs_hotkey_load( p_s_d_0_hotkey_id, p_s_d_0_hotkey_save_array )
	obs.obs_hotkey_load( p_s_e_0_hotkey_id, p_s_e_0_hotkey_save_array )		
	obs.obs_data_array_release( p_h_a_1_hotkey_save_array )
	obs.obs_data_array_release( p_h_b_1_hotkey_save_array )
	obs.obs_data_array_release( p_h_c_1_hotkey_save_array )
	obs.obs_data_array_release( p_h_d_1_hotkey_save_array )
	obs.obs_data_array_release( p_h_e_1_hotkey_save_array )
	obs.obs_data_array_release( p_v_a_1_hotkey_save_array )
	obs.obs_data_array_release( p_v_b_1_hotkey_save_array )
	obs.obs_data_array_release( p_v_c_1_hotkey_save_array )
	obs.obs_data_array_release( p_v_d_1_hotkey_save_array )
	obs.obs_data_array_release( p_v_e_1_hotkey_save_array )
	obs.obs_data_array_release( p_s_a_1_hotkey_save_array )
	obs.obs_data_array_release( p_s_b_1_hotkey_save_array )
	obs.obs_data_array_release( p_s_c_1_hotkey_save_array )
	obs.obs_data_array_release( p_s_d_1_hotkey_save_array )
	obs.obs_data_array_release( p_s_e_1_hotkey_save_array )	
	obs.obs_data_array_release( p_h_a_0_hotkey_save_array )
	obs.obs_data_array_release( p_h_b_0_hotkey_save_array )
	obs.obs_data_array_release( p_h_c_0_hotkey_save_array )
	obs.obs_data_array_release( p_h_d_0_hotkey_save_array )
	obs.obs_data_array_release( p_h_e_0_hotkey_save_array )
	obs.obs_data_array_release( p_v_a_0_hotkey_save_array )
	obs.obs_data_array_release( p_v_b_0_hotkey_save_array )
	obs.obs_data_array_release( p_v_c_0_hotkey_save_array )
	obs.obs_data_array_release( p_v_d_0_hotkey_save_array )
	obs.obs_data_array_release( p_v_e_0_hotkey_save_array )
	obs.obs_data_array_release( p_s_a_0_hotkey_save_array )
	obs.obs_data_array_release( p_s_b_0_hotkey_save_array )
	obs.obs_data_array_release( p_s_c_0_hotkey_save_array )
	obs.obs_data_array_release( p_s_d_0_hotkey_save_array )
	obs.obs_data_array_release( p_s_e_0_hotkey_save_array )						
end
--[[
----------------------------------------------------------
----------------------------------------------------------
]]
function reset( pressed )
	if not pressed then
		return
	end
	p_h_a_value 				= 0
	p_h_b_value 				= 0
	p_h_c_value 				= 0
	p_h_d_value 				= 0
	p_h_e_value 				= 0
	p_v_a_value 				= 0
	p_v_b_value 				= 0
	p_v_c_value 				= 0
	p_v_d_value 				= 0
	p_v_e_value 				= 0
	p_s_a_value 				= 0
	p_s_b_value 				= 0
	p_s_c_value 				= 0
	p_s_d_value 				= 0
	p_s_e_value 				= 0
	set_text( p_h_a_source, p_h_a_value )
	set_text( p_h_b_source, p_h_b_value )
	set_text( p_h_c_source, p_h_c_value )
	set_text( p_h_d_source, p_h_d_value )
	set_text( p_h_e_source, p_h_e_value )
	set_text( p_v_a_source, p_v_a_value )
	set_text( p_v_b_source, p_v_b_value )
	set_text( p_v_c_source, p_v_c_value )
	set_text( p_v_d_source, p_v_d_value )
	set_text( p_v_e_source, p_v_e_value )
	set_text( p_s_a_source, p_s_a_value )
	set_text( p_s_b_source, p_s_b_value )
	set_text( p_s_c_source, p_s_c_value )
	set_text( p_s_d_source, p_s_d_value )
	set_text( p_s_e_source, p_s_e_value )
end

--[[
----------------------------------------------------------
----------------------------------------------------------
]]
function reset_button_clicked( props, p )
	reset( true )
	return false
end
--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]	
function p_h_a_1( pressed )
	if not pressed then
		return
	end
	p_h_a_value = p_h_a_value + p_h_a_int
	set_text( p_h_a_source, p_h_a_value )
end

--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_h_b_1( pressed )
	if not pressed then
		return
	end
	p_h_b_value = p_h_b_value + p_h_b_int
	set_text( p_h_b_source, p_h_b_value )
end

--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_h_c_1( pressed )
	if not pressed then
		return
	end
	p_h_c_value = p_h_c_value + p_h_c_int
	set_text( p_h_c_source, p_h_c_value )
end
--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_h_d_1( pressed )
	if not pressed then
		return
	end
	p_h_d_value = p_h_d_value + p_h_d_int
	set_text( p_h_d_source, p_h_d_value )
end
--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_h_e_1( pressed )
	if not pressed then
		return
	end
	p_h_e_value = p_h_e_value + p_h_e_int
	set_text( p_h_e_source, p_h_e_value )
end

--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_v_a_1( pressed )
	if not pressed then
		return
	end
	p_v_a_value = p_v_a_value + p_v_a_int
	set_text( p_v_a_source, p_v_a_value )
end
--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_v_b_1( pressed )
	if not pressed then
		return
	end
	p_v_b_value = p_v_b_value + p_v_b_int
	set_text( p_v_b_source, p_v_b_value )
end
--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_v_c_1( pressed )
	if not pressed then
		return
	end
	p_v_c_value = p_v_c_value + p_v_c_int
	set_text( p_v_c_source, p_v_c_value )
end
--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_v_d_1( pressed )
	if not pressed then
		return
	end
	p_v_d_value = p_v_d_value + p_v_d_int
	set_text( p_v_d_source, p_v_d_value )
end
--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_v_e_1( pressed )
	if not pressed then
		return
	end
	p_v_e_value = p_v_e_value + p_v_e_int
	set_text( p_v_e_source, p_v_e_value )
end
--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_s_a_1( pressed )
	if not pressed then
		return
	end
	p_s_a_value = p_s_a_value + p_s_a_int
	set_text( p_s_a_source, p_s_a_value )
end
--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_s_b_1( pressed )
	if not pressed then
		return
	end
	p_s_b_value = p_s_b_value + p_s_b_int
	set_text( p_s_b_source, p_s_b_value )
end
--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_s_c_1( pressed )
	if not pressed then
		return
	end
	p_s_c_value = p_s_c_value + p_s_c_int
	set_text( p_s_c_source, p_s_c_value )
end
--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_s_d_1( pressed )
	if not pressed then
		return
	end
	p_s_d_value = p_s_d_value + p_s_d_int
	set_text( p_s_d_source, p_s_d_value )
end

--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_s_e_1( pressed )
	if not pressed then
		return
	end
	p_s_e_value = p_s_e_value + p_s_e_int
	set_text( p_s_e_source, p_s_e_value )
end
--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_h_a_0( pressed )
	if not pressed then
		return
	end
	p_h_a_value = p_h_a_value - p_h_a_int
	set_text( p_h_a_source, p_h_a_value )
end

--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_h_b_0( pressed )
	if not pressed then
		return
	end
	p_h_b_value = p_h_b_value - p_h_b_int
	set_text( p_h_b_source, p_h_b_value )
end
--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_h_c_0( pressed )
	if not pressed then
		return
	end
	p_h_c_value = p_h_c_value - p_h_c_int
	set_text( p_h_c_source, p_h_c_value )
end
--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_h_d_0( pressed )
	if not pressed then
		return
	end
	p_h_d_value = p_h_d_value - p_h_d_int
	set_text( p_h_d_source, p_h_d_value )
end

--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_h_e_0( pressed )
	if not pressed then
		return
	end
	p_h_e_value = p_h_e_value - p_h_e_int
	set_text( p_h_e_source, p_h_e_value )
end
--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_v_a_0( pressed )
	if not pressed then
		return
	end
	p_v_a_value = p_v_a_value - p_v_a_int
	set_text( p_v_a_source, p_v_a_value )
end
--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_v_b_0( pressed )
	if not pressed then
		return
	end
	p_v_b_value = p_v_b_value - p_v_b_int
	set_text( p_v_b_source, p_v_b_value )
end
--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_v_c_0( pressed )
	if not pressed then
		return
	end
	p_v_c_value = p_v_c_value - p_v_c_int
	set_text( p_v_c_source, p_v_c_value )
end
--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_v_d_0( pressed )
	if not pressed then
		return
	end
	p_v_d_value = p_v_d_value - p_v_d_int
	set_text( p_v_d_source, p_v_d_value )
end
--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_v_e_0( pressed )
	if not pressed then
		return
	end
	p_v_e_value = p_v_e_value - p_v_e_int
	set_text( p_v_e_source, p_v_e_value )
end
--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_s_a_0( pressed )
	if not pressed then
		return
	end
	p_s_a_value = p_s_a_value - p_s_a_int
	set_text( p_s_a_source, p_s_a_value )
end

--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_s_b_0( pressed )
	if not pressed then
		return
	end
	p_s_b_value = p_s_b_value - p_s_b_int
	set_text( p_s_b_source, p_s_b_value )
end
--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_s_c_0( pressed )
	if not pressed then
		return
	end
	p_s_c_value = p_s_c_value - p_s_c_int
	set_text( p_s_c_source, p_s_c_value )
end
--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_s_d_0( pressed )
	if not pressed then
		return
	end
	p_s_d_value = p_s_d_value - p_s_d_int
	set_text( p_s_d_source, p_s_d_value )
end
--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_s_e_0( pressed )
	if not pressed then
		return
	end
	p_s_e_value = p_s_e_value - p_s_e_int
	set_text( p_s_e_source, p_s_e_value )
end

--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_h_a_1_button_clicked( props, p )
	p_h_a_1( true )
	return false
end
--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_h_b_1_button_clicked( props, p )
	p_h_b_1( true )
	return false
end
--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_h_c_1_button_clicked( props, p )
	p_h_c_1( true )
	return false
end
--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_h_d_1_button_clicked( props, p )
	p_h_d_1( true )
	return false
end
--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_h_e_1_button_clicked( props, p )
	p_h_e_1( true )
	return false
end
--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_v_a_1_button_clicked( props, p )
	p_v_a_1( true )
	return false
end
--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_v_b_1_button_clicked( props, p )
	p_v_b_1( true )
	return false
end
--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_v_c_1_button_clicked( props, p )
	p_v_c_1( true )
	return false
end
--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_v_d_1_button_clicked( props, p )
	p_v_d_1( true )
	return false
end
--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_v_e_1_button_clicked( props, p )
	p_v_e_1( true )
	return false
end
--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_s_a_1_button_clicked( props, p )
	p_s_a_1( true )
	return false
end
--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_s_b_1_button_clicked( props, p )
	p_s_b_1( true )
	return false
end
--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_s_c_1_button_clicked( props, p )
	p_s_c_1( true )
	return false
end
--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_s_d_1_button_clicked( props, p )
	p_s_d_1( true )
	return false
end
--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_s_e_1_button_clicked( props, p )
	p_s_e_1( true )
	return false
end
--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_h_a_0_button_clicked( props, p )
	p_h_a_0( true )
	return false
end
--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_h_b_0_button_clicked( props, p )
	p_h_b_0( true )
	return false
end
--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_h_c_0_button_clicked( props, p )
	p_h_c_0( true )
	return false
end
--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_h_d_0_button_clicked( props, p )
	p_h_d_0( true )
	return false
end
--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_h_e_0_button_clicked( props, p )
	p_h_e_0( true )
	return false
end
--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_v_a_0_button_clicked( props, p )
	p_v_a_0( true )
	return false
end
--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_v_b_0_button_clicked( props, p )
	p_v_b_0( true )
	return false
end
--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_v_c_0_button_clicked( props, p )
	p_v_c_0( true )
	return false
end
--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_v_d_0_button_clicked( props, p )
	p_v_d_0( true )
	return false
end
--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_v_e_0_button_clicked( props, p )
	p_v_e_0( true )
	return false
end
--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_s_a_0_button_clicked( props, p )
	p_s_a_0( true )
	return false
end
--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_s_b_0_button_clicked( props, p )
	p_s_b_0( true )
	return false
end
--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_s_c_0_button_clicked( props, p )
	p_s_c_0( true )
	return false
end
--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_s_d_0_button_clicked( props, p )
	p_s_d_0( true )
	return false
end
--[[
-----------------------------------------------------------------
		
-----------------------------------------------------------------		
]]
function p_s_e_0_button_clicked( props, p )
	p_s_e_0( true )
	return false
end