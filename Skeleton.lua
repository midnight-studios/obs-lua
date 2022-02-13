--[[
----------------------------------------------------------
Open Broadcaster Software®️
OBS > Tools > Scripts
@midnight-studios

Source Monitor
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