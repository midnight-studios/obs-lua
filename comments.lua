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
luafileTitle				= ""
gversion 					= 0.2
luafile						= ""
obsurl						= ""
p_settings 					= nil
icon=""
desc	    				= [[
<hr/><center><h2>]] .. luafileTitle ..[[</h2>(Version: %s)</center>
<br><center><img width=50 height=50 src=']] .. icon .. [['/></center>
<br><center><a href="https://github.com/midnight-studios/obs-lua/blob/main/]] .. luafile ..[[">Find it on GitHub</a></center>
<br><p>Title</p>
<p>Text:
<ol>
<li><tt>`Text`</tt></li>
</ol></p>
<p>Find help on the <a href="https://obsproject.com/forum/resources/]] .. obsurl ..[[">OBS Forum Thread</a>.</p>
<hr/>]]


function script_description()
	return string.format( desc, tostring( gversion ) )
end

function script_update( settings )
end
--[[
----------------------------------------------------------
	Assign a default Frequency based on the Frame Rate	
	video_info.base_width
	video_info.base_height
	video_info.fps_den
	video_info.output_width
	video_info.output_height
	video_info.range
	video_info.colorspace
----------------------------------------------------------
]]
function assign_default_frequency()
	local fps = 60 -- 60 is the maximum supported frame rate
	local video_info = obs.obs_video_info()
    if obs.obs_get_video_info(video_info) then
		fps = video_info.fps_num		
	end
	time_frequency = ( 1/fps )
end	
--[[
----------------------------------------------------------
	Used this in testing to measure accuracy

	The Text Source and the Log should produce the same value
	The Text source is updated by the time function while the dedug 
	uses start and end time stamps to get a value
----------------------------------------------------------
]]
function get_time_lapsed()
	local ns = obs.os_gettime_ns()
	local delta = ( ns/1000000000.0 ) - ( orig_time/1000000000.0 )
	return TimeFormat( delta )
end	