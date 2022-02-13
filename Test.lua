--[[
----------------------------------------------------------
Open Broadcaster Software®️
OBS > Tools > Scripts
@midnight-studios
----------------------------------------------------------
]]

--Globals
obs           				= obslua
gversion 					= 0.0
p_settings 					= nil
scriptname						= "Test.lua"
desc	    				= "Testing for Source Click Signal"

local bit = require("bit")

---------------------------------------------------------------------------------------------------------

local function log(name, msg)
  if msg ~= nil then
    msg = " > " .. tostring(msg)
  else
    msg = ""
  end
  obs.script_log(obs.LOG_DEBUG, name .. msg)
end

---------------------------------------------------------------------------------------------------------

function script_description()
	return string.format(desc, tostring(gversion))
end


--[[
----------------------------------------------------------
	
----------------------------------------------------------
]]
function trim_time( hour, minutes, seconds, mili, trim )
	local format_hour, 
	format_minutes, 
	format_seconds, 
	format_mili = 
	( hour and "%02d" or "" ),
	( minutes and ":%02d" or "" ),
	( seconds and ":%02d" or "" ),
	( mili and ",%02d" or "" ) 
	local time = string.format( format_hour..format_minutes..format_seconds..format_mili, hour, minutes, seconds, mili )
	if trim then
		return time
	end	
	if hour == 0 then
		time = string.format( "%02d:%02d"..format_mili, minutes, seconds, mili )
	end
	if hour == 0 and minutes == 0 then
		time = string.format( "%02d"..format_mili, seconds, mili )
	end
	if hour == 0 and minutes == 0 and seconds == 0 then
		format_mili = ( mili and "%02d" or "" )
		time = string.format( format_mili, mili )
	end
	return trim_zero( time )
end
--[[
----------------------------------------------------------
	
----------------------------------------------------------
]]
function trim_zero( int )
   while true do 
      if int:sub( 1,1 ) == '0' then 
         int = int:sub( 2 )
      else
         break
      end
   end   
   return int
end
--[[
----------------------------------------------------------
	Convert Seconds to hours:minutes:seconds:miliseconds
----------------------------------------------------------
]]
function TimeFormat( time, notrim )
	if time == nil then
		return
	end
	local trim = ( timer_trim == 1 )
	local hour, minutes, seconds, mili = 0, 0, 0, 0
	
	-- Limit time at 23:59:59
	if time >= 86399 then 
		time = 86399
	end
	
	hour = math.floor( time/3600 )
	if hour < 10 and trim then
		hour = "0"..hour
	end
	minutes = math.floor( ( time - math.floor( time/3600 )*3600 )/60 )
	if minutes < 10 and trim then
		minutes = "0"..minutes
	end
	seconds =  math.floor( time - math.floor( time/3600 )*3600 - math.floor( ( time - math.floor( time/3600 )*3600 )/60 )*60 )
	if seconds < 10 and trim then
		seconds = "0"..seconds
	end
	mili = math.floor( ( time - math.floor( time/3600 )*3600 - math.floor( ( time - math.floor( time/3600 )*3600 )/60 )*60 - math.floor( time - math.floor( time/3600 )*3600 - math.floor( ( time - math.floor( time/3600 )*3600 )/60 )*60 ) )*100 )
	if mili < 10 and trim then
		mili = "0"..mili
	end 
	if notrim then
		return trim_time( hour, minutes, seconds, nil, true )		
	end	
	return trim_time( hour, minutes, seconds, ( ( timer_trim ~= 3 ) and mili or nil ), trim )
end

--[[
----------------------------------------------------------
	
----------------------------------------------------------
]]
function LongTimeFormat( time, textformat )
	
	local c_time = time
	-- If there is more than 24 hours, remove 23:59:59 as it will be in the clock 
	if time > 86399 then -- 23:59:59
		c_time = time - 86399
	end
	local days = math.floor(c_time / 86400)
	
	return days
	
end
---------------------------------------------------------------------------------------------------------


---------------------------------------------------------------------------------------------------------

function script_update(settings)
	

	
	local time = 31449600   -- 15
	--
	--local hour = math.floor( time/3600 )
	--
	--math.floor(i / 86400)

	print(LongTimeFormat( time ) .. ' Days ' .. TimeFormat( time ) )
	
	
	p_settings = settings 
end

---------------------------------------------------------------------------------------------------------

function script_properties()
	local props = obs.obs_properties_create()
	
	
	local p_s = obs.obs_properties_add_editable_list(props, "cycle_list", "Cycle List",obs.OBS_EDITABLE_LIST_TYPE_STRINGS,nil,nil)
	
	
	return props
end









visible_index = 1


function group_loop(diff)
		

				
            local maxindex = 0
			
            local index = 1
	
	local enable = (index == visible_index)
	
	
	
			visible_index = visible_index + 1
						
			if visible_index > maxindex then

				visible_index = 1

			end
                visible_index = visible_index + diff
				
                if visible_index > maxindex then
					
                    visible_index = 1
					
                elseif visible_index < 1 then
					
                    visible_index = maxindex
					
                end
end
