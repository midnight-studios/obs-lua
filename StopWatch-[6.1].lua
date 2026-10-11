--[[
----------------------------------------------------------------------------------------------------------------------------------------
Open Broadcaster Software®️
OBS > Tools > Scripts
@midnight-studios
Stopwatch
***************************************************************************************************************************************
Version 6.1

Published / Released: Unreleased

Bug-fix release for 6.0, with one new option. 

NEW FEATURES

- NEW OPTION: Marker A/B note Groups can include Image (and Image Slide Show), Browser, Colour and Media (and VLC Video Source) sources, not only Text (Disable Features > "Marker note groups: include these source types"; default Text only, as before). Group items are only shown and hidden in turn

OPTIMIZATION

-

USER EXPERIENCE & FEATURE ENHANCEMENTS

-

FIXES

- With "Text Colour [Normal]" unticked, the timer text froze, the script log filled with errors, and OBS could hang when closing
- A note group with Marker Notes disabled made the hide-note timer raise 'deque is empty' every few seconds (and pop up the Script Log)
- "Timer Scene Active": a scene activating while OBS was still loading could look up a source with no name (possible OBS crash)
- Each timer text update kept a reference to the text source's settings, so they were never freed (reported as a memory leak when OBS exits)
- Marker note text and marker audio looping checks kept a reference to the source settings each time (never freed)
- Reading the marker time, marker audio and cycle lists kept a reference to every list item
- Each settings import kept the loaded file's data in memory
- Media helpers could keep a reference to a non-media source, and tried to stop media that had already ended
- Opening or changing the script's settings with no Backup Folder set leaked a little memory each time (an OBS bug on empty paths; the script no longer checks an empty folder)
- A pause, or Reset / Set followed by Start, shorter than about 1 second was counted as running time
- A frame stall longer than 1 second (OBS busy) silently dropped that running time
- The first run after loading lost about one frame at fractional frame rates (29.97, 59.94, 23.976 fps)
- Count Down to a specific date and time ended late after a delayed Start or a pause
- "No leading zeros" formats showed 0.50 s as '50', and an empty timer in the last second and at zero
- Hiding hundredths left a trailing comma ('5,')
- Frame display ({$F60} / {$F}) often showed the previous frame number
- Changing the Time Format of a stopped timer showed it with the previous units until the next change
- A custom minute unit ({M90}, {$M200}) also changed formats 1-4 and the marker check, so markers at 1 hour or later could never fire
- A custom format with $D showed '000' days below one day
- Subtract in Count Up went below zero, and negative time was shown as '-1:59:58'
- "Interval" split times were wrong (and negative) in Count Down, across overtime and after a direction change
- "Round up displayed countdown" also rounded overtime and counting up
- A timed prefix / suffix in Count Down appeared one second late
- Any settings change (even a prefix keystroke or a colour) stopped and reset a running timer, and set the Autoload time to zero
- Undo / Redo of a scene or source change could reset or stop a running timer
- "Specific Source Active" / "Specific Media Active" didn't work after an OBS restart until a setting was changed
- Changing the activation source to another source of the same type (two media sources), or re-creating it under the same name, did nothing until the script reloaded
- With Autoload, markers didn't fire after an OBS restart until Reset
- With Autoload, the timer text showed the text saved earlier until Start or an edit, not the loaded time
- Timer Expire Event "Select" (the default) hid the timer at zero, and the Timer Expired Audio never played (reported by @dippysmixtape)
- The Active Source text was empty after every list expiry (and hidden with Force Visibility)
- A marker was skipped when the time was moved into the marker second while paused (Add / Subtract / Set) with a display without hundredths
- After an expiry with "Play Timer Expired Audio first, then switch", restarting without Reset switched scene mid-run when the audio ended
- Marker audio, notes, list sources and the timer source were shown or hidden only in the first scene that contains them
- "Ascending" cycled lists last to first
- Reset didn't restart the Auto List cycle
- In overtime, a pending marker colour reset replaced the overtime (Marker B) colour
- A pending marker colour reset was dropped at expiry, so the expired timer kept the marker colour
- With "Text Colour [Normal]" off, a settings edit while a marker colour showed made that colour the new normal colour
- The first run after loading showed the second group note (or list entry) first; after an OBS start with Autoload a group note raised an error
- Reset after a direction toggle started the marker audio / note list at entry 2
- Two group notes within the hide time: the newer note was never hidden
- A FreeType 2 text source chosen as Marker Note Source on Windows showed no note text and was never hidden
- With Media Playback Limit on, a pause longer than the remaining duration ended the marker audio, and it didn't resume
- With a Marker Audio list, Pause / Start didn't pause or resume the entry that was playing
- "Timer Scene Active" / "Specific Scene Active": the timer didn't start when OBS started on that scene
- A Count Down of 0:00:00 with a Scene / Source / Auto List expire event switched about 60 times a second
- Disable Script didn't stop a running timer, and Start / Add / Reset still worked while disabled
- "Specific Scene Active": the script's own expiry scene switch paused the timer
- Re-activating a running timer (its scene going to Program again) restarted the countdown (with Auto reset) and the 'Timer Start' recording
- "Timer Source Visible" / "Timer Scene Active" with Auto reset: hiding the timer reset the time and the splits
- The Milliseconds hotkey worked with "Split Seconds Toggle" off
- Rarely, Pause / Reset raised 'Failed to call timer_cb ... attempt to call a nil value' and popped up the Script Log (an OBS race; the script no longer removes its main timer)
- "Timer Source Visible" / "Timer Scene Active": marker audio paused by hiding the timer stayed paused when the timer was shown again; during a marker pause its playback limit kept running while hidden
- Export Settings erased Backup Mode and Backup Folder from the settings (lost at the next restart)
- "Import Settings" did nothing when clicked; the selected file was imported later, on any panel rebuild
- With "Enable debug logging" on, the debug file was opened for every line (about 50 per frame), so OBS dropped frames; lines are now written about once a second
- "Activation Source" had no tooltip
- "Import Settings" stayed visible after Backup Mode was switched off, once a file had been selected
- The direction button label went back to the mode default after a toggle (on Start / Pause or reopening the settings), and read "Count Up" in Count Down
- Backup files with "json" in the name were listed wrongly and couldn't be imported
- Spelling in the settings text ("afater", "Refesh", "the update")
- The split-time export failed in a backup folder with non-ASCII characters (Windows)
- On a fresh install the audio lists held "None", a value not in the list, so OBS corrected it with an extra settings update
- With Disable Script on, the Limit Note lists offered only "Select"
- A Marker Audio list and a group note on the same marker: after a direction toggle the note list didn't step back
- Reload Scripts, removing the script, or closing OBS while a marker colour showed left that colour on the timer source (and it could become the normal colour)

BEHAVIOUR CHANGES

- Count Down to a date and time: Pause freezes the display, and Start / resume jumps to the real remaining time
- A running timer always counts the real elapsed time: after a long OBS stall, or sleep / hibernate, it jumps forward by the time that passed
- Subtract stops at zero, unless the direction was changed with "Prevent Negative Time" off; negative time shows as -00:00:02
- Custom hour / minute units and frames apply to the Custom Time Format only; markers always use plain time, and a marker saved in unit form (such as 01:90:00) is read as plain time (02:30:00)
- Elapsed overtime rounds down; "Round up displayed countdown" applies to the remaining time only
- A Count Down prefix / suffix window includes the marker second (it mirrors Count Up)
- Count Down to a date and time: an Add / Subtract is replaced by the real remaining time at the next Start or resume
- "Interval" splits measure running time: the first interval starts at the first Start (a Set or loaded time doesn't count), and Add / Subtract, direction changes and overtime don't change intervals
- Only a change to a timing setting (mode, countdown type, target date, time or duration) resets the timer; other settings changes keep the time. Only a user Reset clears the Autoload time
- Disable Script pauses a running timer and keeps the time; while disabled, Start, Pause, Add / Subtract, Set, Reset, Split, Milliseconds and Direction do nothing
- "Timer Source Visible" / "Timer Scene Active" with Auto reset: the reset happens when the timer is shown again, before it starts; hiding only pauses
- The Milliseconds hotkey does nothing while "Split Seconds Toggle" is off (like the button)
- Timer Expire Event "Select" means no expire action: the timer stays visible at zero, and the Timer Expired Audio plays if one is set
- Visibility (marker audio, notes, list sources, the timer source) applies to every scene that contains the source; a scene expire event hides the timer in every scene except the expire scene
- "Ascending" cycles lists first to last (it used to cycle last to first; pick "Descending" for the old order)
- The Media Playback Limit duration pauses and resumes with the timer (it counted real time in 6.0); while the timer is paused at a marker, or by Disable Script, the audio keeps playing and so does its limit
- A pending marker colour reset completes after expiry, unless overtime sets its own colour
- "Timer Scene Active" / "Specific Scene Active": when OBS starts, the script is added or reloaded, or the scene collection changes while the timer's scene (or the activation scene) is in Program, the timer starts at once
- Picking a backup file in "Load Settings" no longer imports it; click "Import Settings"

KNOWN LIMITS

- Windows: the debug log (Enable debug logging) is written next to the script and fails if that folder path has non-ASCII characters; Lua file access there uses the ANSI code page. The split-time and settings exports are not affected
- OBS saves the scene collection before scripts are told that OBS is closing, so a marker colour showing at exit is still saved on the timer source; the script restores the normal colour at the next start
- A scene expire event leaves the timer as it is in the expire scene only when the timer is in that scene directly or in a group; shown there through a nested scene, it is hidden
- With "Timer Scene Active", the timer is shown again in every scene that contains it after a scene expire event switches scenes

NOTES

- Legacy behaviour, unchanged: a minute unit ({M90} or {$M90}) shows the total minutes modulo the unit, so combined with $H the display mixes units (1 hour shows 01:60:00). For a long minute count, use a minute unit without $H, for example {$M200}:$S
- Credits: @dippysmixtape (Timer Expire Event "Select" and the Timer Expired Audio)

***************************************************************************************************************************************
]]
--Globals
obs                                 = obslua;
gversion                            = "6.1";
luafile                             = "StopWatch.lua";
obsurl                              = "comprehensive-stopwatch-countdown-timer.1364/";
patch_notes                         = "Patch Notes";
icon                                =
"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABUAAAAVCAYAAACpF6WWAAAENElEQVQ4jY1UTUgjZxh+ksl/JuMkMYb4F40bNZqK0KJFqBZqS9ddyl76dyhdKPRQShH2sNDSnnopCz11D10KS/dSKNiDoD2I7KXFQ0XSSGpM1llFMYn5mZiMY2IymfIOhgazXfaDj5n53u975vme531fnaqqeMHxJYCvAOgAlABcAyA1jxLO1tYW1tbWoL+Kd3x8jGg0imw2C0VRWkMEYgNgBeAFYKTFRqOh7aVnE9xwFTSZTGJ7exszMzPQ6XSQZRk8z9P7YrVa/Y5hmKLBYHCpqirW63Wcn5/j7OwMHo9HA6bvNqY2mw1Op1N70qaTkxPkcjmbLMsDZrN5hOO4NxuNhlMUxTFiSCA0FEW5GQ6H/wmHwzfamDavUKlUYDKZAoFA4Gue52/r9f/9v6OjQ5uKojwpFAr3RFF8UCwWjW63OzQ/P/9yGyiBnZ6eEtN3eZ7/9XJZrlQqP2cymcf5fL4QDAbHdTrd2yzLXvd4PD9yHHdLEISFXC7nsdvtuTb3c7kcEokEJiYmhliWtaiqWs5ms4f1el0lE2lOTU0hn8/DYrF09vb23jebze9JkvRXNBqdMpvNaIJaLh1tHScAzpvsSd+joyOkUimEQiFNa4vFAlEU4Xa7HwYCgduFQuHRxsbGx5p+qqq+o/7/SF7uQSaTwcHBgZYdgiBMqKqa2dnZ8S8tLaFcLicIIR6PjzU13Qew+gzPKNEj9JJOp5tag+O41/v7+x/v7u7+sLOzc8BxHN1icXR0dMXlcn3xQhW1v7+PSCSC6enptxwOx3WWZRcbjcbTjY2NAJ1nWRYGgwHj4+OqoigFYnr/UlPlClYFwJ1arVYjU8bGxhZ8Pt9KMxiLxd5gGEbTlTSv1WqQJOmJw+G4RqCfPYfkN4qiFDs7O9HT0/Nqa4BhmKd2u10DrFaruLi4oJmncibQSUCrLHJabDlHzItGo1E7FIvFvg+FQjMmkykkCMK9eDwOivl8PvqhBspxXJAOEujfz2HazzBMdXh4OJNMJoupVGre7/cbBEGor6+vY2RkROsLlwY6jUajS5KkSGvtf0oVemUeAPiDgsFgUHMeQJ3MmZycxNzcnMZWkiT4/f67FJRl+UFrmcYB/N7y3UyLSHOBzNjb20MgEMDg4CC6urqwublJZo12d3ffVRRFEQTh4TNTqlQqaawoTShOVdOsqMPDQ8zOzmqFQK3PZrO91NPTs2U0GkmWG4lEYrWt9cViMSwvL1Ntvw9gRafT/aTX6z8AwFKcuhU5zjDMkNfr/XZgYCBKgMfHx3eSyeSqw+Fob9LEipxMp9MRp9P5uclkWuB5/hOKWa3Wvb6+vjLP8wNer5fXUkRRLkql0ofZbPY3ug019TZQ6jKU0AzD7Iqi+Josy6+4XK6P7Hb7LbvdPkS5SXpXKpU/ZVn+5ezs7FG9Xi9brVZNLr1ej38BVDs6EbSfFQsAAAAASUVORK5CYII=";
desc                                =
    [[
<hr/><center><h2>Advanced Timer</h2>( Version: %s )</center>
<br><center><img width=38 height=42 src="]] .. icon .. [["/></center>
<br><center><a href="https://github.com/midnight-studios/obs-lua/blob/main/]] ..
    luafile .. [[">Find it on GitHub</a></center>
<center><a href="https://obsproject.com/forum/resources/]] .. obsurl .. [[updates">]] .. patch_notes .. [[</a></center>
<br><p>The script's visibility adjusts with layout settings: "Advanced" shows advanced properties. "Basic" hides them but keeps values active, so set them correctly.</p><p>Find help on the <a href="https://obsproject.com/forum/resources/]] ..
    obsurl .. [[">OBS Forum Thread</a>.</p><hr/>
]];
debug_file                          = ""
debug_file_name                     = "Debug Log"
text_prefix                         = "";
text_suffix                         = "";
text_prefix_validated               = "";
text_suffix_validated               = "";
last_text                           = "";
custom_time_format                  = "";
timer_source                        = "";
timer_activation_source             = "";
countdown_type                      = "";
backup_folder                       = "";
import_list                         = "";
longtimetext_s                      = "";
longtimetext_p                      = "";
last_split_data                     = "";
split_source                        = "";
active_source                       = "";
timer_expire_event                  = "";
cycle_source_children               = "";
stop_text                           = "";
toggle_mili_trigger                 = "";
round_up_countdown                  = true; -- F8: round up countdown display for formats without seconds
text_field_visibility_key           = {};   -- last visibility-relevant state per free-text field (B11)
sec_add_1                           = "";
sec_add_2                           = "";
sec_add_3                           = "";
sec_sub_1                           = "";
sec_sub_2                           = "";
sec_sub_3                           = "";
output_file_name                    = "-backup($date_stamp)";
output_file_ext                     = ".json";
font_normal                         = "#ffffff";
font_dimmed                         = "#bfbbbf";
font_highlight                      = "#fffdcf";
add_limit_note_source               = "";
sub_limit_note_source               = "";
note_source_marker_a                = "";
note_source_marker_b                = "";
audio_marker_a                      = "";
audio_marker_b                      = "";
current_count_direction             = "UP";
count_orientation                   = "NORMAL";
timer_activation                    = 1;
timer_reset                         = 0;
debug_entry                         = 0;
debug_entry                         = 0;
add_limit_note_source_visible       = 0;
sub_limit_note_source_visible       = 0;
sources_loaded                      = 0;
timer_manipulation                  = 1;
sec_add_limit                       = 0;
sec_add_limit_used                  = 0;
sec_sub_limit_used                  = 0;
sec_sub_limit                       = 0;
total_sources                       = 0;
sw_days_saved                       = 0;
sw_hours_saved                      = 0;
sw_minutes_saved                    = 0;
sw_seconds_saved                    = 0;
sw_milliseconds_saved               = 0;
split_type                          = 2;
current_seconds                     = 0;
cycle_direction                     = 1;
default_seconds                     = 0;
split_count                         = 0;
timer_year                          = 0;
timer_month                         = 0;
timer_day                           = 0;
timer_hours                         = 0;
timer_minutes                       = 0;
timer_seconds                       = 0;
timer_mode                          = 0;
last_timer_mode                     = 0;
timer_format                        = 1;
start_recording                     = 1;
media_playback_limit                = 0;
enable_marker_notes                 = 1;
orig_time                           = 0;
time_frequency                      = 0;
completed_cycles                    = 0;
ns_last                             = 0;
cycle_index                         = 1;
timer_cycle                         = 10; --milliseconds
split_itm                           = {};
connectedHandlers                   = {};
presuf                              = {
    text_marker_a = "",
    text_marker_b = ""
}
ignore_list                         = {
    "",
    "none",
    "None",
    "Select",
    "select",
    "list"
};
split_data                          = nil;
hour_unit                           = nil;
minute_unit                         = nil;
frame_unit                          = nil; -- F3: frames per second for $F, nil = hundredths
local ctx                           = {
    propsDef    = nil,                     -- property definition
    propsDefSrc = nil,                     -- property definition (source scene)
    propsSet    = nil,                     -- property settings (model)
    propsVal    = {},                      -- property values
    propsValSrc = nil,                     -- property values (first source scene)
};
props                               = nil;
enable_property_toggle_mili_trigger = true;
set_visible_properties              = false;
enable_property_color_normal        = true;
enable_property_color_marker_a      = true;
enable_property_color_marker_b      = true;
enable_property_split_source        = true;
enable_property_trigger_options     = true;
enable_property_start_recording     = true;
enable_property_text_prefix         = true;
enable_property_text_suffix         = true;
enable_property_timer_manipulation  = true;
enable_property_timer_activation    = true;
enable_property_debug               = true;
enable_property_backup              = true;
timer_event_active                  = false;
timer_mode_changed                  = false;
debug_enabled                       = false; -- careful, may use more system memory
script_ready                        = false;
set_timer_activated                 = false;
color_normal_updated                = false;
activated                           = false;
prevent_callback                    = false;
timer_active                        = false;
reset_activated                     = false;
active_source_force_visible         = false;
split_startpause                    = false;
disable_script                      = false;
enable_direction_toggle             = false;
backup_split_time                   = false;
show_mili                           = true;
timer_expired                       = true;
mili_toggle_triggered               = false;
direction_changed                   = false;
overtime_active                     = false; -- F2: count down reached zero and is now counting up
overtime_style                      = true;  -- F2: show "+" and the Marker B colour during overtime
expire_audio_first                  = false; -- F4: play Timer Expired Audio before switching to the expire scene
pending_expire_scene                = nil;   -- F4: scene to switch to once the Timer Expired Audio is done
marker_pause_redraw                 = false; -- F9: redraw once after a marker pause snapped the time
prevent_negative_time               = false;
record_timer_set                    = false;
media                               = { -- table start
    text_marker_a                       = "",
    text_marker_b                       = "",
    source_name_audio_marker_a          = "",
    source_name_audio_marker_b          = "",
    source_name_audio_marker_end        = "",
    note_source_marker_a                = "",
    note_source_marker_b                = "",
    note_source_unversioned_id_marker_a = "",
    note_source_unversioned_id_marker_b = "",
    note_marker_a                       = "",
    note_marker_b                       = "",
    activated_marker_a                  = false,
    activated_marker_b                  = false,
    activated_media_marker_a            = false,
    activated_media_marker_b            = false,
    activated_time_marker_a             = 0,
    activated_time_marker_b             = 0,
    cycle_direction_marker_a            = 2,
    cycle_direction_marker_b            = 2,
    cycle_index_marker_a                = 1, -- index from 1-based table
    cycle_index_marker_b                = 1, -- index from 1-based table
    cycle_index_note_marker_a           = 1, -- index from 1-based table
    cycle_index_note_marker_b           = 1, -- index from 1-based table
    current_seconds_marker_a            = 0,
    current_seconds_marker_b            = 0,
    duration_marker_a                   = 0,
    duration_marker_b                   = 0,
    reset_text_marker_a                 = 0,
    reset_text_marker_b                 = 0,
    hide_note_marker_a                  = 0,
    hide_note_marker_b                  = 0,
    duration_marker_end                 = 0,
    last_orientation_marker_a           = "NORMAL",
    last_orientation_marker_b           = "NORMAL",
    last_orientation_note_marker_a      = "NORMAL", -- O-005: the note lists' own direction state
    last_orientation_note_marker_b      = "NORMAL",
    media_ended_marker_a                = false,
    media_ended_marker_b                = false,
    last_state_marker_a                 = obs.OBS_MEDIA_STATE_NONE,
    last_state_marker_b                 = obs.OBS_MEDIA_STATE_NONE
}; -- table end
selected_source_list                = {};
hotkey_id_reset                     = obs.OBS_INVALID_HOTKEY_ID;
hotkey_id_set                       = obs.OBS_INVALID_HOTKEY_ID;
hotkey_id_start                     = obs.OBS_INVALID_HOTKEY_ID;
hotkey_id_pause                     = obs.OBS_INVALID_HOTKEY_ID;
hotkey_id_split                     = obs.OBS_INVALID_HOTKEY_ID;
hotkey_id_mili                      = obs.OBS_INVALID_HOTKEY_ID;
hotkey_id_direction                 = obs.OBS_INVALID_HOTKEY_ID;
hotkey_id_sec_add_1                 = obs.OBS_INVALID_HOTKEY_ID;
hotkey_id_sec_add_2                 = obs.OBS_INVALID_HOTKEY_ID;
hotkey_id_sec_add_3                 = obs.OBS_INVALID_HOTKEY_ID;
hotkey_id_sec_sub_1                 = obs.OBS_INVALID_HOTKEY_ID;
hotkey_id_sec_sub_2                 = obs.OBS_INVALID_HOTKEY_ID;
hotkey_id_sec_sub_3                 = obs.OBS_INVALID_HOTKEY_ID;
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Reports the operating system from the OS environment variable, so the script can pick the text source type and default colours at load.
	Scope: global; called once by the main chunk (sets osType)
	type: helper
	input type: none
	returns: string: "Windows" when OS contains "windows", otherwise "Mac"
----------------------------------------------------------------------------------------------------------------------------------------
]]
function detectOS()
    local os = os.getenv("OS")
    if os and os:lower():match("windows") then
        return "Windows"
    else
        return "Mac"
    end
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Assign OS type to variable
	Credit:
	Modified:
	function:
	type:
	input type:
	returns:
----------------------------------------------------------------------------------------------------------------------------------------
]]
osType = detectOS()
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Compatibility Sequence Variable. Assign operating system specific variable
	Credit:
	Modified:
	function:
	type:
	input type:
	returns:
----------------------------------------------------------------------------------------------------------------------------------------
]]
if osType == "Windows" then
    text_source_unversioned_id = "text_gdiplus"
    text_source_id = "text_gdiplus_v2"
    -- B-027: set only the colour keys; replacing the table discarded the media defaults above
    media.color_normal   = 4294967295; -- 0xFFFFFFFF
    media.color_marker_a = 4256749;    -- 0x40f3ed
    media.color_marker_b = 329050;     -- 0x05055a
else
    text_source_unversioned_id = "text_ft2_source"
    text_source_id = "text_ft2_source_v2"
    media.color_normal   = 4294967295; -- B-027: keep the media defaults
    media.color_marker_a = 4282446829;
    media.color_marker_b = 4278519130;
end
--[[
	Unversioned IDs: OBS 32 creates text_gdiplus_v3, which a versioned list would miss
]]
required_sources = {
    "ffmpeg_source",
    text_source_unversioned_id,
    "color_source"
}
--[[
	B-032: the Marker Note list offers both text source types (on Windows a
	FreeType 2 source still works), so the note logic accepts both.
]]
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Tells whether a source type ID is a text source that can receive marker note text and colour: this platform's text source or FreeType 2 (B-032).
	Scope: local; called by set_text_note_color, time_mark_check, default_timer_globals, property_onchange and the hide-note timer callbacks
	type: helper
	input type: id: string or nil (unversioned source ID)
	returns: bool: true for a text source ID
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function is_note_text_id(id)
    return id ~= nil and (id == text_source_unversioned_id or id == "text_ft2_source");
end
--[[
	6.1 option: which source types inside a Marker A/B note Group take part in the
	cycle (Disable Features > "Marker note groups: include these source types").
	Unversioned IDs, so every version of a source type matches. Default: Text only,
	as before. Items are only shown and hidden; nothing is written to them.
]]
local NOTE_GROUP_TYPES = {
    text    = { [text_source_unversioned_id] = true, text_ft2_source = true }, -- this platform's text sources, as before (REV7)
    image   = { image_source = true, slideshow = true },       -- Image, Image Slide Show
    browser = { browser_source = true },
    color   = { color_source = true },
    media   = { ffmpeg_source = true, vlc_source = true },     -- Media Source, VLC Video Source
};
local note_group_types = { text = true };                     -- the ticked options (load_settings_globals)
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Tells whether an item inside a Marker A/B note Group takes part in the note cycle, from its type and the ticked "Marker note groups: include these source types" options (6.1 option).
	Scope: local; called by assign_marker_note_source_name
	type: helper
	input type: id: string or nil (unversioned source ID of the group item)
	returns: bool: true when the item's type is ticked
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function is_note_group_item(id)
    if id == nil then return false end
    for option, ids in pairs(NOTE_GROUP_TYPES) do
        if note_group_types[option] and ids[id] then return true end
    end
    return false
end
--[[
	deque implementation - First item in is firs item out

	With a deque, removing items from both ends is fast regardless of the size of the deque.

	Deque.new(): Creates a new deque.
	Initially, the first index is set to 0 and the last index is set to -1, meaning the deque is empty.
	pushleft(value): Adds a new value to the front of the deque. It does this by decreasing the first
	index by 1 and storing the value at this new index.
	popright(): Removes a value from the end of the deque.
	It does this by taking the value at the last index, removing this value from the deque, and decreasing
	the last index by 1. The function then returns the removed value.

	Whenever a new item is used, it's added to the deque with pushleft().
	When required it removes the oldest item with popright().

]]
local Deque = {}      -- Declare the Deque table to act as the class
Deque.__index = Deque -- Set the __index of Deque to itself to allow method lookups.
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Creates an empty double-ended queue, used to remember which group notes are showing.
	Scope: field of the local Deque table; called by the main chunk and reset()
	type: helper (constructor)
	input type: none
	returns: table: a new deque {first = 0, last = -1}
----------------------------------------------------------------------------------------------------------------------------------------
]]
function Deque.new()
    -- Sets the first index at 0 and the last index at -1 indicating an empty Deque
    -- The metatable is set to Deque, so methods can be invoked on this instance
    return setmetatable({ first = 0, last = -1 }, Deque)
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	We create a new instance of Deque to store items.
----------------------------------------------------------------------------------------------------------------------------------------
]]
media["used_note_source_marker_a"] = Deque.new()
media["used_note_source_marker_b"] = Deque.new()
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Adds a value at the left end of the deque.
	Scope: method of Deque; called by assign_marker_note_source_name
	type: helper
	input type: value: any (a note source name)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
function Deque:pushleft(value)
    -- We decrease the index for the 'first' element.
    local first = self.first - 1
    -- Assign the new index as our new 'first' index.
    self.first = first
    -- Assign the passed value at the new 'first' position.
    self[first] = value
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Removes and returns the value at the right end of the deque; raises an error if the deque is empty (callers check first).
	Scope: method of Deque; called by the hide-note timer callbacks
	type: helper
	input type: none
	returns: any: the removed value
----------------------------------------------------------------------------------------------------------------------------------------
]]
function Deque:popright()
    -- We store the 'last' index in a local variable.
    local last = self.last
    -- If 'first' index is greater than 'last', then the Deque is empty.
    if self.first > last then error("deque is empty") end
    -- We store the value at the 'last' index in a local variable.
    local value = self[last]
    -- Remove the value from the Deque.
    self[last] = nil
    -- Decrease the 'last' index by one, moving it one step to the left.
    self.last = last - 1
    -- Return the removed value.
    return value
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Supplies the script description shown in Tools > Scripts, with the version number; empty when "Script Description" is unticked.
	Scope: global; called by OBS
	type: OBS entry point
	input type: none
	returns: string: the HTML description, or ""
	Credit: OBS
----------------------------------------------------------------------------------------------------------------------------------------
]]
function script_description()
    debug_log('script_description() -- function variable names: ')
    --[[
		F5: "Script Description" feature checkbox. OBS calls script_defaults() with the
		saved settings (which sets ctx.propsSet) just before script_description(), and
		caches the result, so the choice applies from the next script load.
	]]
    if ctx.propsSet ~= nil and not obs.obs_data_get_bool(ctx.propsSet, "enable_property_description") then
        return "";
    end
    return string.format(desc, tostring(gversion));
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Returns the script's file name without path or ".lua", taken from the calling chunk; used to name hotkeys, exports and the debug file.
	Scope: local; called by create_debug_file, write_to_json, write_to_file and assign_hotkeys
	type: helper
	input type: none
	returns: string: the file name, e.g. "StopWatch-[6.1]"
	Credit: midnight-studios, et al
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function filename()
    local str = debug.getinfo(2).source:sub(2);
    return str:match("^.*/(.*).lua$") or str;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Turns any value into a readable string for debug messages; tables are expanded recursively and cycles are marked.
	Scope: local; called by debug messages throughout the script, and recursively by itself
	type: helper (debug)
	input type: input: any (the value); visited: table or nil (tables already being printed)
	returns: string
	Credit: et al
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function pre_dump(input, visited)
    visited = visited or {}

    if type(input) ~= "table" then
        return tostring(input)
    elseif visited[input] then
        return "<circular reference>"
    else
        visited[input] = true

        local tbl = {}
        for key, value in pairs(input) do
            local keyStr = (type(key) ~= "number") and "'" .. tostring(key) .. "'" or tostring(key)
            tbl[#tbl + 1] = "[" .. keyStr .. "] = " .. "'" .. pre_dump(value, visited) .. "'"
        end

        visited[input] = nil -- Remove the current table from visited to allow for other references
        return "{ " .. table.concat(tbl, ", ") .. " }"
    end
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Writes one line to the OBS script log at debug level.
	Scope: local; called by create_debug_file
	type: helper (debug)
	input type: name: any (label); msg: any or nil (detail)
	returns: none
	Credit: et al
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function log(name, msg)
    if msg ~= nil then
        msg = " > " .. tostring(msg);
    else
        msg = "";
    end;
    obs.script_log(obs.LOG_DEBUG, tostring(name) .. msg);
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Adds a line to the debug log when "Enable debug logging" is on and the script isn't disabled; creates the debug file on first use.
	Scope: global; called throughout the script
	type: helper (debug)
	input type: content: string (the line)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
function debug_log(content)
    if disable_script then return; end;
    if not debug_enabled or not enable_property_debug then
        return
    end
    if debug_file == "" then
        debug_file = create_debug_file(debug_file_name, content)
    else
        update_debug_file(debug_file, content)
    end
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Creates the debug log file next to the script, named after the script and the current date and time, and writes the first line to it. Prints a message if the file can't be opened.
	Scope: global; called by debug_log
	type: helper (debug)
	input type: input_file_name: string (name part); content: string or nil (first line; default "Debug Information [date]")
	returns: string: the file's path
----------------------------------------------------------------------------------------------------------------------------------------
]]
function create_debug_file(input_file_name, content)
    if disable_script then return; end;
    content = content or string.format("%s [%s]\n", "Debug Information", os.date("%Y-%m-%d_%H.%M.%S"))
    local file_name = string.format("%s-%s[%s]%s", filename(), input_file_name, os.date("%Y-%m-%d_%H.%M.%S"), ".txt");
    -- set output path as the script path by default
    local script_path = script_path();
    local output_path = script_path .. file_name;
    -- if specified output path exists, then set this as the new output path
    output_path = script_path .. file_name;
    output_path = output_path:gsub([[\]], "/");
    log("create_debug_file", output_path)
    -- Open file in write mode, this will create the file if it does not exist
    local file = io.open(output_path, "w")
    -- If the file has been opened successfully
    if file then
        -- Write content to the file
        file:write(content)
        -- Close the file
        file:close()
    else
        -- Print error message
        print("Failed to open file " .. file_name .. " for writing")
    end
    return output_path;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Replaces one line of a text file by reading all lines and writing the file again. Not called by the script.
	Scope: global; not called
	type: helper (debug, unused)
	input type: filename: string (file path); line_num: number (1-based line); content: string (new line)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
function rewrite_line_debug_file(filename, line_num, content)
    if disable_script then return; end;
    -- Store all lines in memory
    local lines = {}

    -- Open the file in read mode
    local file = io.open(filename, 'r')

    -- If the file has been opened successfully
    if file then
        -- Loop over all lines in the file
        for line in file:lines() do
            table.insert(lines, line)
        end
        -- Close the file
        file:close()
    else
        -- Print error message
        print("Failed to open file " .. filename .. " for reading")
    end

    -- Replace the line at the specified line number
    if line_num <= #lines then
        lines[line_num] = content
    end

    -- Open the file in write mode
    file = io.open(filename, 'w')

    -- If the file has been opened successfully
    if file then
        for i = 1, #lines do
            -- Only add a newline if it's not the last line
            if i < #lines then
                file:write(lines[i] .. "\n")
            else
                file:write(lines[i])
            end
        end
        -- Close the file
        file:close()
    else
        -- Print error message
        print("Failed to open file " .. filename .. " for writing")
    end
end
--[[
	B-057: the timer logs about 50 lines per tick, and opening the file for each line
	cost more than a frame on the graphics thread. Lines are buffered and appended
	about once a second (and at script unload, see flush_debug_file).
]]
local debug_buffer = { lines = {}, flushed_ns = 0, failed = false };
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Appends the buffered debug lines to the debug file in one write and empties the buffer; reports a failure to open the file once (B-057).
	Scope: local; called by update_debug_file (about once a second) and script_unload
	type: helper (debug)
	input type: none
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function flush_debug_file()
    if #debug_buffer.lines == 0 or debug_file == nil or debug_file == "" then return end
    local file = io.open(debug_file, "a")
    if file then
        file:write(table.concat(debug_buffer.lines))
        file:close()
    elseif not debug_buffer.failed then
        debug_buffer.failed = true; -- report once, not once a second (for example a non-ASCII folder, B-058)
        print("Failed to open file " .. tostring(debug_file) .. " for appending; debug lines are not written")
    end
    debug_buffer.lines = {}
    debug_buffer.flushed_ns = obs.os_gettime_ns()
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Numbers a debug line and adds it to the buffer; writes the buffer when a second has passed since the last write (B-057).
	Scope: global; called by debug_log
	type: helper (debug)
	input type: filename: string or nil (the debug file; nothing is added when nil); content: string (the line)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
function update_debug_file(filename, content)
    if disable_script then return; end;
    if filename ~= nil then
        debug_entry = debug_entry + 1
        content = tostring(debug_entry) .. ") " .. string.rep(" ", string.len(debug_entry)) .. content
        debug_buffer.lines[#debug_buffer.lines + 1] = "\n" .. content -- B-057: buffered
        if obs.os_gettime_ns() - debug_buffer.flushed_ns >= 1000000000 then
            flush_debug_file()
        end
    end
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Splits a string on a plain-text delimiter (an alternative to explode). Not called by the script.
	Scope: local; not called
	type: helper (string, unused)
	input type: str: string; delim: string (plain-text delimiter)
	returns: table: the parts
	Credit: midnight-studios, et al
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function explode_alt(str, delim)
    debug_log('explode_alt(' .. pre_dump(str) .. ", " .. pre_dump(delim) .. ') -- function variable names:  str, delim ')
    local tbl, index;
    tbl = {};
    index = 0;
    if (#str == 1) then return { str } end;                             -- returns a table with the input string as the only value
    while true do
        local trace_index = string.find(str, delim, index, true);       -- find the next d in the string
        if trace_index ~= nil then                                      -- if "not not" found then..
            table.insert(tbl, string.sub(str, index, trace_index - 1)); -- Save it in our array.
            index = trace_index + 1;                                    -- save just after where we found it for searching next time.
        else
            table.insert(tbl, string.sub(str, index));                  -- Save what's left in our array.
            break;                                                      -- Break at end, as it should be, according to the lua manual.
        end;
    end;
    return tbl;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Splits a string on a plain-text delimiter.
	Scope: local; called by format_time
	type: helper (string)
	input type: str: string; div: string (plain-text delimiter)
	returns: table: the parts; {} when the string or the delimiter is empty
	Credit: midnight-studios, et al
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function explode(str, div)
    debug_log('explode(' .. pre_dump(str) .. ", " .. pre_dump(delim) .. ') -- function variable names:  str, delim ')
    if (div == nil or div == '') or (str == nil or str == '') then return {} end
    local pos, arr = 0, {}
    for st, sp in function() return string.find(str, div, pos, true) end do
        table.insert(arr, string.sub(str, pos, st - 1))
        pos = sp + 1
    end
    table.insert(arr, string.sub(str, pos))
    return arr
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Iterates over a table's entries in sorted key order, for building sorted lists in the panel.
	Scope: local; called by get_cycle_source_list, property_onchange, script_properties and fill_split_source_list
	type: helper (iterator)
	input type: tbl: table; input_function: function or nil (sort comparator for the keys)
	returns: function: an iterator returning key, value (or tbl itself if it isn't a table)
	Credit: https://github.com/nickgammon/mushclient/blob/master/lua/pairsbykeys.lua
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function pairsByKeys(tbl, input_function)
    debug_log('pairsByKeys(' .. pre_dump(tbl) .. ", " .. pre_dump(input_function) .. ')')
    if type(tbl) ~= "table" then return tbl end

    -- instead of creating a new table and inserting all items into it, just get the keys
    local keys = {}
    for k in pairs(tbl) do keys[#keys + 1] = k end

    table.sort(keys, input_function)

    local i = 0
    --[[
    ----------------------------------------------------------------------------------------------------------------------------------------
    	Description: The iterator pairsByKeys returns: gives the next key and value in sorted order.
    	Scope: local inside pairsByKeys; called by the for loop that uses pairsByKeys
    	type: helper (iterator)
    	input type: none
    	returns: key, value of the next entry, or nil at the end
    ----------------------------------------------------------------------------------------------------------------------------------------
    ]]
    local iter = function()
        i = i + 1
        if keys[i] == nil then
            return nil
        else
            -- use keys[i] to get value from tbl
            return keys[i], tbl[keys[i]]
        end
    end
    return iter
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Reverses an array in place; the array may start at index 0 or 1.
	Scope: global; called by list_source_children_by_source_name
	type: helper (table)
	input type: tbl: table (array)
	returns: none; nil and an error message if tbl isn't a table
----------------------------------------------------------------------------------------------------------------------------------------
]]
function reverseTable(tbl)
    if type(tbl) ~= "table" then return nil, "Provided variable is not valid Table"; end
    -- Determine the base of the table (0 or 1)
    local base = (tbl[0] ~= nil) and 0 or 1

    -- Determine the number of elements in the table
    local n = base
    while tbl[n] ~= nil do
        n = n + 1
    end
    n = n - 1

    -- Reverse the table
    for i = base, base + math.floor((n - base) / 2) do
        tbl[i], tbl[n - i + base] = tbl[n - i + base], tbl[i]
    end
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Tells whether an array starts at index 0 or 1. Not called by the script.
	Scope: global; not called
	type: helper (table, unused)
	input type: tbl: table
	returns: number: 0 or 1; nil and an error message when neither index exists or tbl isn't a table
----------------------------------------------------------------------------------------------------------------------------------------
]]
function getTableBase(tbl)
    if type(tbl) ~= "table" then return nil, "Provided variable is not valid Table"; end
    -- Check if index 0 is non-nil
    if tbl[0] ~= nil then
        return 0
    elseif tbl[1] ~= nil then
        return 1
    else
        return nil, "Table is empty or does not have consecutive integer keys starting from 0 or 1";
    end
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Tells whether a table has at least one entry.
	Scope: global; called by is_child_of_group, reset_cycle_source_list, property_onchange, timer_expire_event_cycle_source_list and script_properties
	type: helper (table)
	input type: table: table or any
	returns: bool: true when it is a non-empty table
----------------------------------------------------------------------------------------------------------------------------------------
]]
function tableHasValue(table)
    debug_log('tableHasValue(' .. pre_dump(table) .. ') -- function variable names:  table ')
    if type(table) ~= "table" then return false end
    return next(table) ~= nil
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Counts the entries of a table (all keys, not only the array part).
	Scope: local; called by getMarkerTime and timer_expire_event_cycle_source_list
	type: helper (table)
	input type: tbl: table or any
	returns: number: the count (0 if not a table)
	Credit: midnight-studios, et al
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function tablelength(tbl)
    debug_log('tablelength(' .. pre_dump(tbl) .. ') -- function variable names:  tbl ')
    local count = 0;
    if type(tbl) == "table" then -- if the input table is not of type table return 0
        for _ in pairs(tbl) do count = count + 1 end;
    end;
    return count;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Tells whether a table has a value for a key.
	Scope: local; called by property_onchange
	type: helper (table)
	input type: tbl: table; key: any
	returns: bool
	Credit: midnight-studios, et al
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function tableHasKey(tbl, key)
    debug_log('tableHasKey(' .. pre_dump(tbl) .. ", " .. pre_dump(key) .. ') -- function variable names:  tbl, key ')

    if type(tbl) ~= "table" or key == nil then return false end; -- if the input table is not of type table return bool(false)

    return tbl[key] ~= nil;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Tells whether a value occurs in a table, searching nested tables too; used mainly to test names against ignore_list.
	Scope: local; called throughout the script, and recursively by itself
	type: helper (table)
	input type: tbl: table; input_value: any
	returns: bool: true when found
	Credit: midnight-studios, et al
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function in_table(tbl, input_value)
    debug_log('in_table(' ..
        pre_dump(tbl) .. ", " .. pre_dump(input_value) .. ') -- function variable names:  tbl, input_value ')
    if type(tbl) ~= "table" or input_value == nil then
        return false
    end

    for _, value in pairs(tbl) do
        if value == input_value then
            return true
        elseif type(value) == "table" and in_table(value, input_value) then
            return true
        end
    end

    return false
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Connects a signal of a source to a callback once; keeps the connection under the source name with a weak reference to the source, so it can be found and disconnected later (B-034).
	Scope: global; called by timer_activation_signals
	type: helper (signals)
	input type: source: obs_source; signal: string (signal name, e.g. "activate"); callback: function (the handler)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
function connectSignalHandler(source, signal, callback)
    local sh = obs.obs_source_get_signal_handler(source)
    if sh then
        local sourceId = obs.obs_source_get_name(source) -- B-034: per source (by name), not per source type

        -- Check if the signal handler is already connected for this source
        if not connectedHandlers[sourceId] then
            connectedHandlers[sourceId] = {}
            -- B-034: a weak reference finds this source again to disconnect it (also after a
            -- rename), and tells a re-created source with the same name apart
            connectedHandlers[sourceId].weak = obs.obs_source_get_weak_source(source)
        end

        local isAlreadyConnected = false
        for _, handler in ipairs(connectedHandlers[sourceId]) do
            if handler.signal == signal and handler.callback == callback then
                isAlreadyConnected = true
                break
            end
        end

        if not isAlreadyConnected then
            -- Store the connected signal handler in the table
            table.insert(connectedHandlers[sourceId], { signal = signal, callback = callback })
            -- Connect the signal handler
            obs.signal_handler_connect(sh, signal, callback)
        end
    end
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Returns true so the properties view rebuilds the panel (the "Refresh to update form" buttons).
	Scope: global; triggered by the "Refresh to update form" buttons of the Add and Subtract limits
	type: button callback
	input type: none (OBS passes props and the button, which are not used)
	returns: bool: true (refresh the panel)
----------------------------------------------------------------------------------------------------------------------------------------
]]
function refresh_properties()
    debug_log('refresh_properties() -- function variable names: ')
    return true;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Tells whether a string is a time in the exact form "hh:mm:ss" (two digits each).
	Scope: global; called by getMarkerTime and get_seconds_from_timestamp
	type: helper (time)
	input type: str: string or nil
	returns: bool: true for "hh:mm:ss"; false otherwise, including nil
----------------------------------------------------------------------------------------------------------------------------------------
]]
function checkTimeString(str)
    debug_log('checkTimeString(' .. pre_dump(str) .. ') -- function variable names: str')
    if str == nil then return false end
    -- Pattern to match the format '00:00:00'
    local pattern = "^%d%d:%d%d:%d%d$"
    -- Check if the string matches the pattern
    if string.match(str, pattern) then
        return true
    else
        return false
    end
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Returns a copy of an array without repeated values, keeping the first occurrence of each.
	Scope: global; called by getMarkerTime
	type: helper (table)
	input type: tbl: table (array) or any
	returns: table: the new array (tbl itself if it isn't a table)
----------------------------------------------------------------------------------------------------------------------------------------
]]
function removeDuplicates(tbl)
    debug_log('removeDuplicates(' .. pre_dump(tbl) .. ') -- function variable names: tbl')
    if type(tbl) ~= "table" or tbl == nil then return tbl end; -- if the input table is not of type table return input
    local seen = {}
    local result = {}

    for _, value in ipairs(tbl) do
        if not seen[value] then
            table.insert(result, value)
            seen[value] = true
        end
    end

    return result
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Converts a time string "hh:mm:ss" to a number of seconds.
	Scope: global; called by get_seconds_from_timestamp
	type: helper (time)
	input type: timeString: string ("hh:mm:ss"; callers check the form first)
	returns: number: the total seconds
----------------------------------------------------------------------------------------------------------------------------------------
]]
function convertToSeconds(timeString)
    debug_log('convertToSeconds(' .. pre_dump(timeString) .. ') -- function variable names: timeString')
    local hours, minutes, seconds = string.match(timeString, "(%d%d):(%d%d):(%d%d)")

    -- Convert hours, minutes, and seconds to integers
    hours = tonumber(hours)
    minutes = tonumber(minutes)
    seconds = tonumber(seconds)

    -- Calculate the total seconds
    local totalSeconds = (hours * 3600) + (minutes * 60) + seconds

    return totalSeconds
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Looks up a source by name and returns its OBS source type; releases the source. Not called by the script.
	Scope: global; not called
	type: helper (sources, unused)
	input type: source_name: string (source name)
	returns: number: an OBS_SOURCE_TYPE_* value, or nil if no such source
----------------------------------------------------------------------------------------------------------------------------------------
]]
function get_source_type_by_name(source_name)
    local source = obs.obs_get_source_by_name(source_name);
    local result
    if source ~= nil then
        result = obs.obs_source_get_type(source)
    end
    obs.obs_source_release(source);
    return result
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Looks up a source by name and returns its unversioned type ID (e.g. "text_gdiplus", "group"); releases the source.
	Scope: global; called by assign_marker_note_source_name and load_settings_globals
	type: helper (sources)
	input type: source_name: string or nil (source name)
	returns: string: the unversioned ID, or nil if no such source
----------------------------------------------------------------------------------------------------------------------------------------
]]
function get_source_unversioned_id_by_name(source_name)
    local source = obs.obs_get_source_by_name(source_name);
    local result
    if source ~= nil then
        result = obs.obs_source_get_unversioned_id(source)
    end
    obs.obs_source_release(source);
    return result
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Lists the names of the items inside a group (or a nested scene) found in any scene; groups inside a nested scene are expanded. The list is reversed before it is returned. The type filter has no effect: every item is listed.
	Scope: global; called by reset_group_note_sources, assign_marker_note_source_name, reset_cycle_source_list and timer_expire_event_cycle_source_list
	type: helper (sources)
	input type: source_name: string (the group or nested scene); filter_unversioned_id: string or nil (type filter; not applied)
	returns: table: array of item names (empty if the source isn't found)
----------------------------------------------------------------------------------------------------------------------------------------
]]
function list_source_children_by_source_name(source_name, filter_unversioned_id)
    --[[
			we use this part more than once
	]]
    --[[
    ----------------------------------------------------------------------------------------------------------------------------------------
    	Description: Adds the names of all items in a group to a list.
    	Scope: local inside list_source_children_by_source_name; called by it
    	type: helper (sources)
    	input type: group: obs_scene (the group's scene) or nil; list: table (array the names are added to)
    	returns: none
    ----------------------------------------------------------------------------------------------------------------------------------------
    ]]
    local function get_group_children_from_source(group, list)
        if group then                                                                         -- is it a group, if not see elseif
            local group_items = obs.obs_scene_enum_items(group)                               -- the source is a group, get children if any

            if group_items then                                                               -- group has children?
                for _, group_item in ipairs(group_items) do                                   -- iterate children items one by one
                    local group_items_source = obs.obs_sceneitem_get_source(group_item)       -- grab the source of the group child item

                    if group_items_source then                                                -- if we successfully retrieved a source
                        local source_name_group = obs.obs_source_get_name(group_items_source) -- this is what we need,

                        local source_name_type = obs.obs_source_get_unversioned_id(group_items_source)

                        if filter_unversioned_id ~= nil and filter_unversioned_id == source_name_type then
                            table.insert(list, source_name_group) -- save the name for retrieval
                        else
                            table.insert(list, source_name_group) -- save the name for retrieval
                        end
                    end
                end                                     -- end for group_item

                obs.sceneitem_list_release(group_items) -- completed checking group, free memory, release all items
            end
        end
    end

    --[[
			start
	]]
    local list = {}

    local scenes = obs.obs_frontend_get_scenes()                                                -- get all scenes

    if scenes then                                                                              -- we have scenes
        for _, scn in ipairs(scenes) do                                                         -- iterate scenes 1 by 1
            local scene = obs.obs_scene_from_source(scn)                                        -- load the scene from the current source

            local scene_item = obs.obs_scene_find_source_recursive(scene, source_name)          -- check if current scene has the source we are looking for, yes no?

            if scene_item then                                                                  -- we found the scene item we are looking for
                local source = obs.obs_sceneitem_get_source(scene_item)                         -- grab the source of the scene item

                if source then                                                                  -- if we successfully retrieved a source
                    local group = obs.obs_group_from_source(source)                             -- check if the found source is a 'group'

                    if group then                                                               -- is it a group, if not see elseif
                        get_group_children_from_source(group, list)
                    elseif obs.obs_source_get_type(source) == obs.OBS_SOURCE_TYPE_SCENE then    -- check if the found source is a nested scene
                        local scene = obs.obs_scene_from_source(source)                         -- load the original scene

                        local scene_items = obs.obs_scene_enum_items(scene)                     -- check if the scene has any children

                        for _, scene_item_source in ipairs(scene_items) do                      -- iterate children items one by one
                            local item_source = obs.obs_sceneitem_get_source(scene_item_source) -- grab the source of the scene child item

                            if item_source then                                                 -- if we successfully retrieved a source
                                local source_name_parent = obs.obs_source_get_name(item_source) -- get the source name, we will save it for later

                                local group = obs.obs_group_from_source(item_source)
                                local source_name_type = obs.obs_source_get_unversioned_id(item_source)
                                if group then
                                    get_group_children_from_source(group, list)
                                else
                                    if filter_unversioned_id ~= nil and filter_unversioned_id == source_name_type then
                                        table.insert(list, source_name_parent) -- save the name for retrieval
                                    else
                                        table.insert(list, source_name_parent) -- save the name for retrieval
                                    end
                                end
                            end
                        end

                        obs.sceneitem_list_release(scene_items)
                    end
                end
            end
        end

        obs.source_list_release(scenes)
    end

    reverseTable(list)

    return list
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Returns the name of the current program scene.
	Scope: global; called by activate_timer_on_scene, init and on_event
	type: helper (frontend)
	input type: none
	returns: string: the scene name (nil if there is no current scene)
----------------------------------------------------------------------------------------------------------------------------------------
]]
function frontend_get_current_scene()
    -- Get the current scene
    local current_scene = obs.obs_frontend_get_current_scene()

    -- Get the name of the current scene
    local scene_name = obs.obs_source_get_name(current_scene)

    -- Release the reference to the scene (important for memory management)
    obs.obs_source_release(current_scene)

    debug_log(' frontend_get_current_scene() return: ' .. pre_dump(scene_name))
    return scene_name
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Tells whether the OBS frontend is ready, i.e. has a current scene; used to avoid frontend calls during startup and shutdown.
	Scope: global; called by autosave_timestamp, script_update and script_load
	type: helper (frontend)
	input type: none
	returns: bool: true when there is a current scene
----------------------------------------------------------------------------------------------------------------------------------------
]]
function frontend_ready()
    local current_scene = obs.obs_frontend_get_current_scene()
    if current_scene == nil then return false end
    obs.obs_source_release(current_scene)
    return true
end
autosave_last_time = 0;
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Saves the current Count Up time into the settings and asks OBS to save the scene collection, so the time survives a crash when "Autoload last time stamp when OBS starts" is on (B6). Runs at most every 30 seconds unless forced, and only for Count Up with the frontend ready.
	Scope: global; called by timer_callback and activate
	type: helper (persistence)
	input type: force: bool or nil (true: save now, ignoring the 30-second limit)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
function autosave_timestamp(force)
    if not load_saved_time or timer_mode ~= 1 then return end
    local now = os.time();
    if not force and (now - autosave_last_time) < 30 then return end
    if not frontend_ready() then return end -- never save a half-loaded scene collection
    autosave_last_time = now;
    sw_current_seconds = current_seconds;
    obs.obs_data_set_double(ctx.propsSet, "sw_current_seconds", current_seconds);
    obs.obs_frontend_save(); -- saves the scene collection; OBS calls script_save(), which stores current_seconds
end
--[[
	B-065: SCENE_CHANGED for a switch the script makes itself arrives after the
	transition, when on_event is connected again. Remember the target, so
	on_event can ignore that one event (for up to 10 s).
]]
local self_switch_scene, self_switch_ns = nil, 0;
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Records that the script itself is switching to a scene, with the time, so on_event can tell this switch from one made by the user (B-065).
	Scope: local; called by frontend_set_current_scene and switch_to_expire_scene
	type: helper (frontend)
	input type: scene_name: string (the scene being switched to)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function note_self_switch(scene_name)
    self_switch_scene, self_switch_ns = scene_name, obs.os_gettime_ns();
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Tells whether a scene change is the one the script recorded within the last 10 seconds, and clears the record (B-065).
	Scope: local; called by on_event
	type: helper (frontend)
	input type: scene_name: string (the new current scene)
	returns: bool: true when the script made this switch
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function is_self_switch(scene_name)
    local mine = self_switch_scene ~= nil and scene_name == self_switch_scene
        and (obs.os_gettime_ns() - self_switch_ns) < 10000000000;
    self_switch_scene = nil;
    return mine;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Switches the program scene by name. The frontend event callback is removed during the switch and added again, and the switch is recorded as the script's own.
	Scope: global; called by source_list_set_by_index
	type: helper (frontend)
	input type: scene_name: string (scene name; nothing happens if it doesn't exist)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
function frontend_set_current_scene(scene_name)
    local source = obs.obs_get_source_by_name(scene_name);
    if source ~= nil then
        note_self_switch(scene_name); -- B-065
        obs.obs_frontend_remove_event_callback(on_event)
        obs.obs_frontend_set_current_scene(source)
        obs.obs_frontend_add_event_callback(on_event)
    end
    obs.obs_source_release(source);
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Shows or hides a source in every scene that contains it (also inside groups and nested scenes), optionally skipping one scene. Names in ignore_list and nil are ignored.
	Scope: local; called throughout the script
	type: helper (sources)
	input type: source_name: string or nil (source name); visible: bool or nil (true: show; nil counts as false); except_scene: string or nil (scene to leave alone)
	returns: bool: true if the source was found in at least one scene
	Credit: midnight-studios, et al
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function set_visible(source_name, visible, except_scene) -- except_scene (optional): leave this scene as it is (B-031)
    debug_log('set_visible(' ..
        pre_dump(source_name) .. ", " .. pre_dump(visible) .. ') -- function variable names:  source_name, visible ')
    visible = visible or false;
    local action_completed = false;

    if source_name == nil then
        debug_log('set_visible: ' .. pre_dump(action_completed))
        return action_completed;
    end;

    if in_table(ignore_list, source_name) then
        debug_log('ignore_list set_visible: ' .. pre_dump(action_completed))
        return action_completed;
    end;

    local scenes = obs.obs_frontend_get_scenes();
    if scenes ~= nil then
        debug_log('got scenes set_visible')
        for i, scn in ipairs(scenes) do
            local scene = obs.obs_scene_from_source(scn);
            local sceneitem = nil;
            if except_scene == nil or obs.obs_source_get_name(scn) ~= except_scene then
                sceneitem = obs.obs_scene_find_source_recursive(scene, source_name);
            end
            if sceneitem ~= nil then
                debug_log('got sceneitem set_visible')
                if visible and not obs.obs_sceneitem_visible(sceneitem) then -- only set visible if not visible
                    obs.obs_sceneitem_set_visible(sceneitem, visible);
                end
                if not visible and obs.obs_sceneitem_visible(sceneitem) then -- only hide if visible
                    obs.obs_sceneitem_set_visible(sceneitem, visible);
                end;
                action_completed = true; -- B-031 (decision 2026-10-09): every scene that contains the source, no break
            end;
        end; --end for
        obs.bfree(scn);
        obs.source_list_release(scenes);
    end;
    return action_completed;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Tells whether a source is visible in any scene (also inside groups and nested scenes). Names in ignore_list and nil count as not visible.
	Scope: local; called by start_media_action, stop_media_playback and pause_play_media
	type: helper (sources)
	input type: source_name: string or nil (source name)
	returns: bool: true when visible in at least one scene
	Credit: midnight-studios, et al
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function is_visible(source_name)
    debug_log('is_visible(' .. pre_dump(source_name) .. ') -- function variable names:  source_name ')

    if source_name == nil or in_table(ignore_list, source_name) then
        debug_log('is_visible: ' .. pre_dump(source_name))
        return false;
    end;
    local isvisible = false;
    if source_name ~= nil then
        local scenes = obs.obs_frontend_get_scenes();
        if scenes ~= nil then
            for i, scn in ipairs(scenes) do
                local scene = obs.obs_scene_from_source(scn);
                local sceneitem = obs.obs_scene_find_source_recursive(scene, source_name);
                if sceneitem ~= nil and obs.obs_sceneitem_visible(sceneitem) then
                    isvisible = true; -- B-031: visible if visible in any scene
                    break;
                end;
            end; --end for
            obs.bfree(scn);
            obs.source_list_release(scenes);
        end; --end scenes ~= nil
    end;
    debug_log('is_visible: ' .. pre_dump(isvisible))
    return isvisible;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Compares two "hh:mm:ss" times; the sort order for marker times.
	Scope: local; used by sortTimeTable as the table.sort comparator
	type: helper (time)
	input type: timeString1: string ("hh:mm:ss"); timeString2: string ("hh:mm:ss")
	returns: bool: true when the first time is earlier
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function compareTimeStrings(timeString1, timeString2)
    debug_log('compareTimeStrings(' ..
        pre_dump(timeString1) ..
        ", " .. pre_dump(timeString2) .. ') -- function variable names: timeString1, timeString2')
    -- Extract hours, minutes, and seconds from time strings
    local hours1, minutes1, seconds1 = string.match(timeString1, "(%d%d):(%d%d):(%d%d)")
    local hours2, minutes2, seconds2 = string.match(timeString2, "(%d%d):(%d%d):(%d%d)")

    -- Convert hours, minutes, and seconds to integers
    hours1 = tonumber(hours1)
    minutes1 = tonumber(minutes1)
    seconds1 = tonumber(seconds1)
    hours2 = tonumber(hours2)
    minutes2 = tonumber(minutes2)
    seconds2 = tonumber(seconds2)

    -- Calculate the total seconds for each time string
    local totalSeconds1 = (hours1 * 3600) + (minutes1 * 60) + seconds1
    local totalSeconds2 = (hours2 * 3600) + (minutes2 * 60) + seconds2

    -- Compare the total seconds
    return totalSeconds1 < totalSeconds2
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Sorts an array of "hh:mm:ss" times in place, earliest first.
	Scope: local; called by getMarkerTime
	type: helper (time)
	input type: tbl: table (array of "hh:mm:ss") or any
	returns: none (tbl itself, unsorted, if it isn't a table)
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function sortTimeTable(tbl)
    debug_log('sortTimeTable(' .. pre_dump(tbl) .. ') -- function variable names: tbl')

    if type(tbl) ~= "table" or tbl == nil then return tbl end; -- if the input table is not of type table return input

    table.sort(tbl, compareTimeStrings)
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Counts the sources of the types the script works with (media, this platform's text source and colour sources: required_sources) and stores the count in total_sources.
	Scope: local; called by loaded, script_update and script_load
	type: helper (sources)
	input type: none
	returns: number: the count
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function count_required_sources()
    debug_log('count_required_sources() -- function variable names: ')
    local sources = obs.obs_enum_sources();
    local i = 0;
    if sources ~= nil then
        for _, source in ipairs(sources) do -- ipairs cycles auto incrimented items
            local id = obs.obs_source_get_unversioned_id(source)
            if in_table(required_sources, id) then
                i = i + 1;
            end
        end
    end;
    obs.source_list_release(sources); -- free memory, release
    total_sources = i;
    return i;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Finds the first marker time later than the current time (Count Up); wraps to the first marker when none is later.
	Scope: global; called by getMarkerTime
	type: helper (markers)
	input type: tbl: table (sorted array of "hh:mm:ss") or any; currentTime: number (seconds)
	returns: string: the marker time, or nil if the array is empty or tbl isn't a table
----------------------------------------------------------------------------------------------------------------------------------------
]]
function getNextItemMatchingTime(tbl, currentTime)
    debug_log('getNextItemMatchingTime(' ..
        pre_dump(tbl) .. ", " .. pre_dump(currentTime) .. ') -- function variable names:  tbl, currentTime ')

    if type(tbl) ~= "table" or tbl == nil then return nil end; -- if the input table is not of type table return input

    local nextItem = nil
    local currentTimeString = string.format("%02d:%02d:%02d", math.floor(currentTime / 3600),
        math.floor((currentTime % 3600) / 60), currentTime % 60)
    for _, value in ipairs(tbl) do
        if value > currentTimeString then
            nextItem = value
            break
        end
    end
    if tbl[1] ~= nil and nextItem == nil then
        -- loop to first item
        nextItem = tbl[1]
    end
    return nextItem
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Finds the last marker time earlier than the current time (Countdown); does not wrap.
	Scope: global; called by getMarkerTime
	type: helper (markers)
	input type: table: table (sorted array of "hh:mm:ss"); currentTime: number (seconds)
	returns: string: the marker time, or nil if none is earlier
----------------------------------------------------------------------------------------------------------------------------------------
]]
function getPreviousItemMatchingTime(table, currentTime)
    debug_log('getPreviousItemMatchingTime(' ..
        pre_dump(table) .. ", " .. pre_dump(currentTime) .. ') -- function variable names:  table, currentTime ')
    local previousItem = nil
    local currentTimeString = string.format("%02d:%02d:%02d", math.floor(currentTime / 3600),
        math.floor((currentTime % 3600) / 60), currentTime % 60)
    for _, value in ipairs(table) do
        if value < currentTimeString then
            previousItem = value
        else
            break
        end
    end
    if table[#table] ~= nil and previousItem == nil then
        -- loop to last item
        --previousItem = table[#table]
    end
    return previousItem
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Reads an editable-list setting into a Lua array of its "value" strings, releasing the OBS data objects.
	Scope: local; called by getMarkerTime, editable_list_has_values, assign_audio_source_name, reset_audio_source_visibility, get_cycle_source_list and media_choice
	type: helper (settings)
	input type: set: obs_data (the settings); item: string (the setting name)
	returns: table: array of strings (empty if the list is empty or missing)
	Credit: midnight-studios
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function obs_data_array_to_table(set, item)
    debug_log('obs_data_array_to_table(' ..
        pre_dump(set) .. ", " .. pre_dump(item) .. ') -- function variable names:  set, item ')

    local array = obs.obs_data_get_array(set, item);

    local count = obs.obs_data_array_count(array);

    local list = {};

    for i = 1, count do
        local array_item = obs.obs_data_array_item(array, i - 1);

        local value = obs.obs_data_get_string(array_item, "value");

        obs.obs_data_release(array_item); -- B-003: obs_data_array_item adds a reference

        table.insert(list, value)
    end;

    obs.obs_data_array_release(array);

    return list;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Rewrites a marker time with any number of digits per part ("h:m:s") as "hh:mm:ss", carrying overflowing minutes and seconds; other text is returned unchanged. Markers compare plain time (B-023): a marker saved in unit form by 6.0 (e.g. 01:90:00 with a {M90} format) is read as 02:30:00, so saved markers keep firing.
	Scope: local; called by getMarkerTime
	type: helper (markers)
	input type: value: string (a marker time as typed)
	returns: string: the normalised time, or value unchanged
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function normalise_marker_time(value)
    local h, m, s = string.match(value, "^(%d+):(%d+):(%d+)$");
    if h == nil then return value end
    local total = tonumber(h) * 3600 + tonumber(m) * 60 + tonumber(s);
    return string.format("%02d:%02d:%02d", math.floor(total / 3600), math.floor((total % 3600) / 60), total % 60);
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Picks the next marker time for Marker A or B from its time list: valid times are normalised, de-duplicated and sorted; the next later time when counting up, the last earlier time when counting down. Clears the marker's "media activated" flag when the list has a time.
	Scope: local; called by update_time_markers
	type: helper (markers)
	input type: ref: string ("marker_a" or "marker_b"); currentTime: number (seconds)
	returns: string: the marker time "hh:mm:ss", or nil if none applies
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function getMarkerTime(ref, currentTime)
    debug_log('getMarkerTime(' ..
        pre_dump(ref) .. ", " .. pre_dump(currentTime) .. ') -- function variable names:  ref, currentTime ')
    --[[
		Create a table for a list
	]]
    local result    = nil
    local i         = 0;                                                         -- create interger variable
    local list      = {};                                                        -- create temporary table variable
    local data_list = obs_data_array_to_table(ctx.propsSet, "text_arr_" .. ref); -- fetch obs userdata from property settings and return in table
    --[[
		Build a cycle list
		We only include valid string formats '00:00:00'
		any other format will be excluded
	]]
    for key, value in pairs(data_list) do
        if value ~= nil and value ~= "" then
            value = normalise_marker_time(value); -- B-023: unit-form markers from 6.0
            if checkTimeString(value) then
                i = i + 1;
                table.insert(list, value)
            end
        end
    end
    list = removeDuplicates(list);   -- Ensure there are no duplicates
    sortTimeTable(list);             -- Time runs linear, so order the list to be linear
    local count = tablelength(list); -- get how many items are listed

    if #list >= 1 then
        media["activated_media_" .. ref] = false; -- Signal media has not yet been activated because we now have a new media item.
    end

    if current_count_direction == "UP" then
        result = getNextItemMatchingTime(list, currentTime);     -- basically, see what will be the next marker time
    else
        result = getPreviousItemMatchingTime(list, currentTime); -- basically, see what will be the next marker time
    end
    return result
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Tells whether a source with this name exists. Names in ignore_list and nil count as not existing.
	Scope: local; called by reset_group_note_sources and assign_marker_note_source_name
	type: helper (sources)
	input type: source_name: string or nil (source name)
	returns: bool
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function source_exists(source_name)
    debug_log('source_exists_alt(' .. pre_dump(source_name) .. ') -- function variable names:  source_name ')
    local sourceFound = false
    if source_name == nil or in_table(ignore_list, source_name) then
        return sourceFound;
    end
    local sources = obs.obs_enum_sources();
    local i = 0;
    if sources ~= nil then
        for _, source in ipairs(sources) do -- ipairs cycles auto incrimented items
            local name = obs.obs_source_get_name(source);
            if name == source_name then
                sourceFound = true
            end
        end
        obs.bfree(source);            -- free memory, release source as it is no longer needed
    end;
    obs.source_list_release(sources); -- free memory, release
    debug_log('source_exists: ' .. pre_dump(sourceFound))
    return sourceFound
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Tells whether a named source exists and has the given unversioned type ID. Names in ignore_list and nil count as not valid.
	Scope: local; called by assign_audio_source_name, reset_audio_source_visibility and hide_new_media_choices
	type: helper (sources)
	input type: source_name: string or nil (source name); unversioned_id: string (type ID, e.g. "ffmpeg_source")
	returns: bool
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function is_valid_type_source(source_name, unversioned_id)
    debug_log('is_valid_type_source(' ..
        pre_dump(source_name) .. ', ' .. pre_dump(unversioned_id) .. ') -- function variable names:  source_name ')
    local is_valid = false;

    if source_name == nil or in_table(ignore_list, source_name) then
        return is_valid;
    end
    --[[
		Increments the source reference counter,
		use obs_source_release() to release it when complete.

		we got a source name, let's see if it exist...
	]]
    local source = obs.obs_get_source_by_name(source_name);          -- get source by name
    debug_log('is_valid_type_source get source: ')
    if source ~= nil then                                            -- continue if we have a source
        debug_log('is_valid_type_source we have a source: ')
        local source_id = obs.obs_source_get_unversioned_id(source); -- get source id

        debug_log('is_valid_type_source check if source_id is matching: ' .. pre_dump(source_id))

        if source_id == unversioned_id then -- check if source id match that of type we need to focus on
            is_valid = true
        end;
    end;
    obs.obs_source_release(source); -- release source

    debug_log('is_valid_type_source END result: ' .. pre_dump(is_valid))
    return is_valid; -- bool
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Tells whether an editable-list setting has at least one entry.
	Scope: global; called by property_onchange
	type: helper (settings)
	input type: property_name: string (the setting name)
	returns: bool
----------------------------------------------------------------------------------------------------------------------------------------
]]
function editable_list_has_values(property_name)
    debug_log('editable_list_has_values(' .. pre_dump(property_name) .. ') -- function variable names:  property_name ')
    local data_list = obs_data_array_to_table(ctx.propsSet, property_name)
    return next(data_list) ~= nil
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Hides every item inside a Marker note group, whatever its type.
	Scope: global; called by reset
	type: helper (markers)
	input type: group_source_name: string (the group's name)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
function reset_group_note_sources(group_source_name)
    -- Convert data array to table
    local itemTable = list_source_children_by_source_name(group_source_name, "group")
    if itemTable ~= nil and type(itemTable) == "table" then
        for _, source_name in pairs(itemTable) do
            if source_exists(source_name) then
                set_visible(source_name, false);
            end
        end
    end
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Chooses the note source Marker A or B shows next. A single source is used as it is. For a Group, the items whose type is ticked are taken in turn, one per marker, following the count direction and orientation; the chosen name is added to the marker's list of shown notes so it can be hidden later. A group with no usable item leaves the marker without a note source.
	Scope: global; called by time_mark_check
	type: helper (markers)
	input type: ref: string ("marker_a" or "marker_b")
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
function assign_marker_note_source_name(ref)
    debug_log('assign_marker_note_source_name(' ..
        pre_dump(ref) .. ') -- function variable names:  property_name, ref ')

    --[[
			First determin if the selected name is check if the provided name is for user required to show items nested in the option requested is
	]]
    local source_name = obs.obs_data_get_string(ctx.propsSet, "note_source_" .. ref);

    --[[
		The option selected may be 'select'
	]]
    if in_table(ignore_list, source_name) or not source_exists(source_name) then
        media["note_source_" .. ref] = source_name
    end

    note_source_unversioned_id = get_source_unversioned_id_by_name(source_name)

    --[[
		We may have a 'group' or even a nested scene?
		if we do not have a group, then exit
	]]
    if note_source_unversioned_id ~= "group" then
        media["note_source_" .. ref] = source_name
    else
        --[[
			 We need a list of source names
			 Get the group children names and
			 return only those that are text type
		]]
        -- Convert data array to table
        local data_list = list_source_children_by_source_name(source_name, "group")

        -- Create a table to hold the purified data list
        local itemTable = {}
        -- Iterate over the data list and validate each source
        -- Use pairs instead of ipairs because ipairs assumes 1-based array
        for i, source_name in pairs(data_list) do
            if not in_table(ignore_list, source_name) and
                is_note_group_item(get_source_unversioned_id_by_name(source_name)) then -- B-032; 6.1 option: the ticked types
                table.insert(itemTable, source_name)
            end
        end
        if #itemTable == 0 then
            -- 6.1 option (REV7): nothing eligible (empty group, or no type ticked): show nothing
            -- and keep the cycle position, so ticking a type again carries on without a Reset
            media["note_source_" .. ref] = nil
            return
        end
        -- Get index of last assigned item
        local current_index = media["cycle_index_note_" .. ref]
        --[[
				signal there was a change since the last orientation
				this function is used by both Marker A & B, so
				orientation should be individually assigned
		]]
        -- O-005: the note list keeps its own direction state; sharing the audio list's
        -- meant whichever list ran first used up the change
        if media["last_orientation_note_" .. ref] ~= count_orientation then
            current_index = count_orientation == "NORMAL" and current_index + 1 or current_index - 1;
            media["last_orientation_note_" .. ref] = count_orientation
        end

        if current_count_direction == "DOWN" and current_index < 1 then
            current_index = #itemTable
        end
        if current_count_direction == "UP" and current_index > #itemTable then
            current_index = 1
        end
        -- 6.1 option (REV7): the list can get shorter (a type unticked, an item removed);
        -- wrap an index past the end round the list. A plain modulo keeps 6.0's step after a
        -- direction toggle (index 0 there means "the item before the first"); #itemTable > 0 here
        current_index = (current_index - 1) % #itemTable + 1

        if count_orientation == "NORMAL" then                       -- count_orientation == "NORMAL" or "INVERTED"
            media["note_source_" .. ref] = itemTable[current_index] -- '+1' because itemTable is 1-based
        end

        -- Depending on the 'count_orientation', set the next index.
        if count_orientation == "NORMAL" then -- count_orientation == "NORMAL" or "INVERTED"
            current_index = (current_index % #itemTable) + 1
        else
            current_index = (current_index - 2 + #itemTable) % #itemTable + 1
        end
        -- Store the selected index and source_name in global 'media' table
        media["cycle_index_note_" .. ref] = current_index
        if count_orientation == "INVERTED" then -- count_orientation == "NORMAL" or "INVERTED"
            media["note_source_" .. ref] = itemTable[current_index]
        end

        -- We add the new item to the start of deque.
        media["used_note_source_" .. ref]:pushleft(media["note_source_" .. ref])

        debug_log("assign_marker_note_source_name '" ..
            ref ..
            "', Timer: " ..
            "[" ..
            count_orientation ..
            "], Direction: [" ..
            current_count_direction ..
            "], Text Source: [" ..
            tostring(media["note_source_" .. ref]) ..
            "], Next: [" ..
            pre_dump(media["text_" .. ref] and media["text_" .. ref] or "out-of-range (nil)") ..
            "] Index: [" ..
            pre_dump(media["cycle_index_note_" .. ref]) ..
            "]" ..
            " Shown Next: " ..
            pre_dump(media["note_source_" .. ref]) .. " Currently listed" .. pre_dump(media["used_note_source_" .. ref]))
    end
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Chooses the media source Marker A or B plays next from its media list: the valid media sources in the list are taken in turn, following the count direction and orientation.
	Scope: global; called by update_media_names and hide_new_media_choices
	type: helper (media)
	input type: property_name: string (the list setting, "audio_marker_a_arr" or "audio_marker_b_arr"); ref: string ("marker_a" or "marker_b")
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
function assign_audio_source_name(property_name, ref)
    debug_log('assign_audio_source_name(' ..
        pre_dump(property_name) .. ", " .. pre_dump(ref) .. ') -- function variable names:  property_name, ref ')
    -- Convert data array to table
    local data_list = obs_data_array_to_table(ctx.propsSet, property_name)
    -- Create a table to hold the purified data list
    local itemTable = {}
    -- Iterate over the data list and validate each source
    -- Use pairs instead of ipairs because ipairs assumes 1-based array
    for i, source_name in pairs(data_list) do
        if is_valid_type_source(source_name, "ffmpeg_source") then
            table.insert(itemTable, source_name)
        end
    end

    -- Get index of last assigned item
    local current_index = media["cycle_index_" .. ref]

    --[[
			signal there was a change since the last orientation
			this function is used by both Marker A & B, so
			orientation should be individually assigned
	]]
    if media["last_orientation_" .. ref] ~= count_orientation then
        current_index = count_orientation == "NORMAL" and current_index + 1 or current_index - 1;
        media["last_orientation_" .. ref] = count_orientation
    end

    if current_count_direction == "DOWN" and current_index < 1 then
        current_index = #itemTable
    end
    if current_count_direction == "UP" and current_index > #itemTable then
        current_index = 1
    end

    if count_orientation == "NORMAL" then                             -- count_orientation == "NORMAL" or "INVERTED"
        media["source_name_audio_" .. ref] = itemTable[current_index] -- '+1' because itemTable is 1-based
    end

    -- Depending on the 'count_orientation', set the next index.
    if count_orientation == "NORMAL" then -- count_orientation == "NORMAL" or "INVERTED"
        current_index = (current_index % #itemTable) + 1
    else
        current_index = (current_index - 2 + #itemTable) % #itemTable + 1
    end
    -- Store the selected index and source_name in global 'media' table
    media["cycle_index_" .. ref] = current_index
    if count_orientation == "INVERTED" then -- count_orientation == "NORMAL" or "INVERTED"
        media["source_name_audio_" .. ref] = itemTable[current_index]
    end

    debug_log("assign_audio_source_name '" ..
        ref ..
        "', Timer: " ..
        "[" ..
        count_orientation ..
        "], Direction: [" ..
        current_count_direction ..
        "], Media: [" ..
        tostring(media["source_name_audio_" .. ref]) ..
        "], Next: [" ..
        pre_dump(media["text_" .. ref] and media["text_" .. ref] or "out-of-range (nil)") ..
        "] Index: [" .. pre_dump(media["cycle_index_" .. ref]) .. "]")
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Hides every media source in a marker's media list.
	Scope: local; called by reset_audio_marker_arr
	type: helper (media)
	input type: property_name: string (the list setting); ref: string ("marker_a" or "marker_b"; only used in the debug message)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function reset_audio_source_visibility(property_name, ref)
    debug_log('reset_audio_source_visibility(' ..
        pre_dump(property_name) .. ", " .. pre_dump(ref) .. ') -- function variable names:  property_name, ref ')
    local data_list = obs_data_array_to_table(ctx.propsSet, property_name); -- fetch obs userdata from property settings and return in table
    if data_list ~= nil then
        for key, value in pairs(data_list) do
            if is_valid_type_source(value, "ffmpeg_source") then
                set_visible(value, false);
            end
        end
    end
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Reads the Marker A and B media modes from the settings and hides the media sources of each marker set to a list.
	Scope: global; called by reset
	type: helper (media)
	input type: none
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
function reset_audio_marker_arr()
    debug_log('reset_audio_marker_arr() -- function variable names: ')
    audio_marker_a = obs.obs_data_get_string(ctx.propsSet, "audio_marker_a");
    if audio_marker_a == "list" then
        reset_audio_source_visibility("audio_marker_a_arr", "marker_a");
    end
    audio_marker_b = obs.obs_data_get_string(ctx.propsSet, "audio_marker_b");
    if audio_marker_b == "list" then
        reset_audio_source_visibility("audio_marker_b_arr", "marker_b");
    end
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Works out the next Marker A and Marker B times from the current time and stores them for the marker check.
	Scope: global; called by time_mark_check, update_timer_direction, reset, init and script_update
	type: helper (markers)
	input type: currentTime: number (seconds)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
function update_time_markers(currentTime)
    debug_log('update_time_markers(' .. pre_dump(currentTime) .. ') -- function variable names:  currentTime ')

    media["text_marker_a"] = getMarkerTime("marker_a", currentTime);
    media["text_marker_b"] = getMarkerTime("marker_b", currentTime);
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Chooses the next media source for each marker whose media is a list, optionally starting the lists again from the first entry.
	Scope: global; called by time_mark_check, update_timer_direction, reset and init
	type: helper (media)
	input type: position_reset: bool or nil (true: go back to the first entry of each list)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
function update_media_names(position_reset)
    debug_log('update_media_names(' .. pre_dump(position_reset) .. ') -- function variable names:  position_reset ')
    -- If position_reset is not provided, set it to false
    position_reset = position_reset or false
    --[[
		If we do not force a complete reset when required, then
		media names will cycle each time the function is called
		during the startup or reset stages
	]]
    if position_reset then
        media["cycle_index_marker_a"] = 1; -- index from 1-based table
        media["cycle_index_marker_b"] = 1; -- index from 1-based table
    end
    --[[
		If Marker Audio is set to "Allow Multiple Selections"
		then it will cycle any strings listed in the Marker Audio List
	]]
    if audio_marker_a == "list" then
        assign_audio_source_name("audio_marker_a_arr", "marker_a");
    end
    if audio_marker_b == "list" then
        assign_audio_source_name("audio_marker_b_arr", "marker_b");
    end
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Finds the group a source is in, if it is a group item in any scene.
	Scope: global; called by time_mark_check
	type: helper (sources)
	input type: source_name: string or nil (source name)
	returns: string: the group's name; nil if the source isn't in a group (or is nil)
----------------------------------------------------------------------------------------------------------------------------------------
]]
function is_child_of_group(source_name)
    if source_name == nil then return nil end

    local all_sources = get_source_list("*");

    if tableHasValue(all_sources) then
        for _, sub in ipairs(all_sources) do
            if source_name == sub["source_name"] then
                return sub["source_name_parent"]
            end
        end;

        obs.bfree(sub); -- free memory, release source as it is no longer needed
    end
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Lists the items of every scene, and the items of groups in them, with their name, type, ID, display name, parent group and whether they are nested scenes.
	Scope: global; called by is_child_of_group, get_cycle_source_list, property_onchange and script_properties
	type: helper (sources)
	input type: trg_key: string or nil ("*" for a plain array; otherwise the field to key the table by, default "source_name"; a later item with the same key replaces an earlier one)
	returns: table: the item records, as an array or keyed by trg_key
	Credit: midnight-studios, et al
----------------------------------------------------------------------------------------------------------------------------------------
]]
function get_source_list(trg_key)
    debug_log('get_source_list(' .. pre_dump(trg_key) .. ') -- function variable names:  return_ref ')
    trg_key = trg_key or "source_name"
    local scenes = obs.obs_frontend_get_scenes();
    local source_list = {};
    --[[

	]]
    if scenes ~= nil then
        --[[
		]]
        for _, value_scenesource in pairs(scenes) do
            local scene = obs.obs_scene_from_source(value_scenesource);
            local scene_items = obs.obs_scene_enum_items(scene);
            --[[
			]]
            local index = 0;
            for _, scene_item_value in ipairs(scene_items) do
                index = index + 1;
                local sub = {};
                local source = obs.obs_sceneitem_get_source(scene_item_value);
                local source_name_parent = obs.obs_source_get_name(source);
                local group = obs.obs_group_from_source(source);
                local id_parent = obs.obs_source_get_id(source);
                local unversioned_id_parent = obs.obs_source_get_unversioned_id(source);
                local display_name_parent = obs.obs_source_get_display_name(id_parent);
                local type_parent = obs.obs_source_get_type(source)

                sub["position"] = "parent";
                sub["nested"] = (type_parent == obs.OBS_SOURCE_TYPE_SCENE);
                sub["type"] = type_parent;
                sub["id"] = id_parent;
                sub["unversioned_id"] = unversioned_id_parent;
                sub["display_name"] = display_name_parent;
                sub["source_name"] = source_name_parent;
                sub["source"] = source;

                table.insert(source_list, sub)

                if group then
                    local group_items = obs.obs_scene_enum_items(group);
                    if group_items then
                        for _, group_item_value in ipairs(group_items) do
                            index = index + 1;
                            sub = {};
                            local group_item_source = obs.obs_sceneitem_get_source(group_item_value);
                            local source_name_group = obs.obs_source_get_name(group_item_source);
                            local id_group = obs.obs_source_get_id(group_item_source);
                            local unversioned_id_group = obs.obs_source_get_unversioned_id(group_item_source);
                            local display_name_group = obs.obs_source_get_display_name(id_group);
                            local type_parent = obs.obs_source_get_type(group_item_source)

                            sub["position"] = "child";
                            sub["nested"] = (type_parent == obs.OBS_SOURCE_TYPE_SCENE);
                            sub["type"] = type_parent;
                            sub["id"] = id_group;
                            sub["unversioned_id"] = unversioned_id_group;
                            sub["display_name"] = display_name_group;
                            sub["source_name"] = source_name_group;
                            sub["source_name_parent"] = source_name_parent;
                            sub["source"] = group_item_source;

                            table.insert(source_list, sub)
                        end -- end for
                        obs.sceneitem_list_release(group_items);
                    end
                end
            end -- end for in pairs( sceneitems )
            obs.sceneitem_list_release(scene_items);
        end     -- end for in pairs( scenes )
        --[[
		]]
        obs.source_list_release(scenes);
    end; -- scenes ~= nil

    if trg_key ~= "*" then
        local tmp_list = {}
        for _, value in ipairs(source_list) do
            if value and value[trg_key] then
                tmp_list[value[trg_key]] = value
            end
        end
        source_list = tmp_list
    end
    return source_list;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Lists the files in a folder that have a given extension, without the extension; used to offer saved settings files for Import.
	Scope: local; called by property_onchange and script_properties
	type: helper (files)
	input type: path: string or nil (folder); file_extension: string (e.g. ".json")
	returns: table: array of file names (empty when no folder is given)
	Credit: midnight-studios
	Modified: midnight-studios, et al
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function get_filenames(path, file_extension)
    local filenames = {};

    if path == nil or path == "" then
        debug_log('error: [path == nil or empty ] get_filenames(' ..
            pre_dump(path) .. ", " .. pre_dump(file_extension) .. ') -- function variable names:  path, file_extension ')
        return filenames;
    end

    debug_log('get_filenames(' ..
        pre_dump(path) .. ", " .. pre_dump(file_extension) .. ') -- function variable names:  path, file_extension ')
    local dir = obs.os_opendir(path);
    local entry;
    repeat
        entry = obs.os_readdir(dir);
        if entry then
            local ext = obs.os_get_path_extension(entry.d_name);
            if ext == file_extension then
                local filename = entry.d_name:sub(1, #entry.d_name - #ext); -- B-054: not gsub (the extension is not a pattern)
                table.insert(filenames, filename);
            end
        end
    until not entry;
    obs.os_closedir(dir);
    return filenames;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Exports the settings to a JSON file in the backup folder (or the script's folder), without the backup folder and backup mode settings. The file is named after the script plus the given name, or the dated default name.
	Scope: local; called by export
	type: helper (files)
	input type: data: obs_data (the settings); file_name: string or nil (name part; default "-backup(<date>)")
	returns: bool: true when the file was saved
	Credit: midnight-studios, et al
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function write_to_json(data, file_name)
    debug_log('write_to_json(' .. pre_dump(data) .. ') -- function variable names:  data ')
    output_folder = backup_folder;
    -- convert Windows path to UNIX path
    file_name = filename() ..
        (file_name or output_file_name:gsub("$date_stamp", os.date("%Y-%m-%d-%H%M"))) .. output_file_ext
    -- set output path as the script path by default
    local script_path = script_path();
    local output_path = script_path .. file_name;
    -- if specified output path exists, then set this as the new output path
    if (output_folder ~= "") then
        output_path = output_folder .. "/" .. file_name;
    else
        output_path = script_path .. file_name;
    end
    output_path = output_path:gsub([[\]], "/");
    -- B-044: leave the backup keys out of the file, not out of the live settings
    local copy = obs.obs_data_create();
    obs.obs_data_apply(copy, data);
    obs.obs_data_erase(copy, "backup_folder");
    obs.obs_data_erase(copy, "backup_mode");
    local saved = obs.obs_data_save_json(copy, output_path);
    obs.obs_data_release(copy);
    return saved;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Writes text to a file in the backup folder (or the script's folder), named after the script plus the given name; line breaks become CRLF on Windows. Prints a message if the file can't be written.
	Scope: local; called by set_split_text
	type: helper (files)
	input type: file_type: string or nil (extension; default ".json"); content: string or nil (the text; default "no content"); file_name: string or nil (name part; default "-backup(<date>)")
	returns: string: the file's path
	Credit: midnight-studios, et al
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function write_to_file(file_type, content, file_name)
    debug_log('write_to_file(' .. pre_dump(data) .. ') -- function variable names:  data ')
    output_folder = backup_folder;
    file_type = file_type or output_file_ext
    -- convert Windows path to UNIX path
    file_name = filename() .. (file_name or output_file_name:gsub("$date_stamp", os.date("%Y-%m-%d-%H%M"))) .. file_type
    -- set output path as the script path by default
    local script_path = script_path();
    local output_path = script_path .. file_name;
    -- if specified output path exists, then set this as the new output path
    if (output_folder ~= "") then
        output_path = output_folder .. "/" .. file_name;
    else
        output_path = script_path .. file_name;
    end
    output_path = output_path:gsub([[\]], "/");
    content = content or 'no content'
    --[[
		B-058: OBS paths are UTF-8, but Lua's io.open uses the ANSI code page on Windows,
		so a folder such as C:/Users/José/... failed. libobs writes the whole file with a
		UTF-8 path (_wfopen on Windows). It writes in binary mode, so convert the line
		ends on Windows as io.open's text mode did (review: the file stays the same).
	]]
    if osType == "Windows" then content = content:gsub("\r?\n", "\r\n") end
    if not obs.os_quick_write_utf8_file(output_path, content, #content, false) then
        print("Failed to open file " .. file_name .. " for writing")
    end
    return output_path;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Sets the starting tick length (time_frequency) to one frame at the current OBS frame rate, or 1/60 second if the rate isn't available (B-016: fractional rates such as 29.97 are kept).
	Scope: local; called by script_update, script_defaults and script_load
	type: helper (timing)
	input type: none
	returns: none
	Credit: midnight-studios
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function assign_default_frequency()
    debug_log('assign_default_frequency() -- function variable names: ')
    local fps = 60; -- 60 is the maximum supported frame rate
    local video_info = obs.obs_video_info();
    if obs.obs_get_video_info(video_info) and video_info.fps_num > 0 and video_info.fps_den > 0 then
        fps = video_info.fps_num / video_info.fps_den; -- B-016: 29.97 fps is 30000/1001, not 30000
    end;
    time_frequency = (1 / fps);
    debug_log('assign default frequency: ' .. pre_dump(time_frequency))
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Formats hours, minutes, seconds and hundredths as "HH:MM:SS,FF"; parts that are nil are left out, and the hundredths only appear when they are shown.
	Scope: local; called by raw_time
	type: helper (time format)
	input type: hour: number or nil; minutes: number or nil; seconds: number or nil; mili: number or nil (hundredths)
	returns: string: the formatted time
	Credit: midnight-studios
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function config_time(hour, minutes, seconds, mili)
    debug_log('config_time(' ..
        pre_dump(hour) ..
        ", " ..
        pre_dump(minutes) ..
        ", " ..
        pre_dump(seconds) .. ", " .. pre_dump(mili) .. ') -- function variable names:  hour, minutes, seconds, mili ')
    local format_hour,
    format_minutes,
    format_seconds,
    format_mili =
        (hour and "%02d" or ""),
        (minutes and ":%02d" or ""),
        (seconds and ":%02d" or ""),
        (mili and ",%02d" or "");
    local time = string.format(format_hour .. format_minutes .. format_seconds .. format_mili, hour, minutes, seconds,
        mili);
    --[[

		configure for SHOW or Hide millisonds

	]]
    if not show_mili then
        time = string.format(format_hour .. format_minutes .. format_seconds, hour, minutes, seconds);
    end;
    debug_log('config time: ' .. pre_dump(time))
    return time;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Converts seconds to "HH:MM:SS,FF". Negative times get a leading "-" (B-018). Hours wrap at 24 unless the Custom Time Format sets its own hour and minute units (B-023).
	Scope: local; called by get_time_lapsed, time_mark_check, toggle_mili, set_time_text and split_unpack, and recursively by itself
	type: helper (time format)
	input type: time: number (seconds); simplify: bool or nil (true: no hundredths and no custom units, e.g. for marker comparison)
	returns: string: the formatted time
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function raw_time(time, simplify)
    debug_log('raw_time(' ..
        pre_dump(time) .. ", " .. pre_dump(simplify) .. ') -- function variable names:  time, simplify ')

    --[[
		B-018: negative time (only after a direction change with "Prevent Negative
		Time" off) is shown as the absolute time with a leading "-".
	]]
    if time < 0 then
        if time > -0.01 then -- under one hundredth: no "-00:00:00,00"
            time = 0;
        else
            return "-" .. raw_time(-time, simplify);
        end
    end
    local hours, minutes, seconds, mili = 0, 0, 0, 0;
    --[[
		B-023: custom hour/minute units belong to the Custom Time Format display
		only. Formats 1-4 and the marker comparison (simplify) use plain time.
	]]
    local h_unit, m_unit = hour_unit, minute_unit;
    if simplify or timer_format ~= 5 then h_unit, m_unit = nil, nil end

    --[[
		There may be a custom hour time
	]]
    if h_unit ~= nil then
        hours = math.floor(time / 3600);
        hours = hours % h_unit;
    else
        --[[
			If there is more than 24 hours in the time value
			we need to remove the additional time value to leave only a 23:59:59
			value. We will do this by calculating days
		]]
        -- If there is more than 24 hours, remove 23:59:59 as it will be in the clock
        if time > 86399 then -- 23:59:59
            local c_time = (math.floor((time) / 86400) * 86400);
            time = time - c_time;
        end;

        hours = math.floor(time / 3600);
    end
    if hours < 10 and trim then
        hours = "0" .. hours;
    end;
    --[[
			check flag: custom_time_format
			if flag assign a 90 minute unit then apply it, else use default 60 minute unit

			If there is a use case, this could potentially be expanded here but we will have to make sure the code checks out.
	]]
    if m_unit ~= nil then
        minutes = math.floor(((time / 3600) * 3600) / 60);
        minutes = minutes % m_unit;
    else
        minutes = math.floor((time - math.floor(time / 3600) * 3600) / 60);
    end

    if minutes < 10 and trim then
        minutes = "0" .. minutes;
    end;
    --[[

	]]
    seconds = math.floor(time - math.floor(time / 3600) * 3600 -
        math.floor((time - math.floor(time / 3600) * 3600) / 60) * 60);
    if seconds < 10 and trim then
        seconds = "0" .. seconds;
    end;
    --[[

	]]
    mili = math.floor((time - math.floor(time / 3600) * 3600 - math.floor((time - math.floor(time / 3600) * 3600) / 60) * 60 - math.floor(time - math.floor(time / 3600) * 3600 - math.floor((time - math.floor(time / 3600) * 3600) / 60) * 60)) *
        100);
    if mili < 10 and trim then
        mili = "0" .. mili;
    end
    --[[
		Use this to see if the time stamp matches certain criteria
		This looks at HH:MM:SS only and is used to match the
		timer's current time stamp against a user defined time mark that
		will for example activate Mark A or Mark B
	]]
    local output = "";
    if simplify then
        output = config_time(hours, minutes, seconds, nil);
    else
        output = config_time(hours, minutes, seconds, mili);
    end;

    debug_log('raw time output: ' .. pre_dump(output))
    return output;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Returns the time since the timer's start time (orig_time) as "HH:MM:SS,FF". Not called by the script.
	Scope: local; not called
	type: helper (timing, unused)
	input type: none
	returns: string: the formatted time
	Credit: midnight-studios
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function get_time_lapsed()
    debug_log('get_time_lapsed() -- function variable names: ')
    local ns = obs.os_gettime_ns();
    local delta = (ns / 1000000000.0) - (orig_time / 1000000000.0);
    return raw_time(delta);
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Measures the real time since the previous tick, so the timer advances by the time that actually passed; records this tick's time in ns_last. Never negative.
	Scope: local; called by timer_callback
	type: helper (timing)
	input type: previous: number (the previous tick's time in nanoseconds)
	returns: number: seconds since the previous tick
	Credit: midnight-studios
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function get_frequency(previous)
    debug_log('get_frequency(' .. pre_dump(previous) .. ') -- function variable names:  previous ')
    local ns = obs.os_gettime_ns();
    ns_last = ns;
    local f = (ns / 1000000000.0) - (previous / 1000000000.0);
    --[[
		B-060 (decision 2026-10-10): count the real elapsed time, also after a frame
		stall longer than 1 s (or sleep / hibernate), so the timer catches up.
		Start stamps ns_last (B-015), so a pause is never counted.
	]]
    if f < 0 then f = 0 end;
    debug_log('frequency: ' .. pre_dump(f))
    return f;
end
--[[
	B-015 (fix review): the running time between the last tick and a Pause, carried
	into the next Start so a pause doesn't lose it. Cleared by Reset and Set.
]]
local pause_carry_ns = 0;
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Removes one OBS timer callback, or every callback in a table; values that aren't functions are skipped.
	Scope: global; called by remove_all_timers and by the timer callbacks and helpers that stop their own timers
	type: helper (timers)
	input type: input: function or table (a timer callback, or a table of them)
	returns: none
	Credit: midnight-studios
----------------------------------------------------------------------------------------------------------------------------------------
]]
function timer_remove(input)
    debug_log('timer_remove(' .. pre_dump(input) .. ') -- function variable names: input')
    if type(input) ~= "table" then
        if input ~= nil and type(input) == "function" then
            obs.timer_remove(input);
            debug_log('removed timer (' .. pre_dump(input) .. ')')
        else
            debug_log('requested timer for removal does not exist. Aborting.')
        end
    else
        debug_log('timer remove items: (' .. pre_dump(#input) .. ')')
        for key, value in pairs(input) do
            if value ~= nil and type(value) == "function" then
                obs.timer_remove(value);
                debug_log('removed timer (' .. pre_dump(value) .. ')')
            else
                debug_log('requested timer for removal does not exist. Aborting.')
            end
        end;
    end;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Starts an OBS timer that calls a function every ms milliseconds until it is removed.
	Scope: global; called by record, start_timer, the marker colour and note timers, the media and limit helpers, and play_timer_end_audio
	type: helper (timers)
	input type: input: function (timer callback); ms: number (interval in milliseconds)
	returns: none
	Credit: midnight-studios
----------------------------------------------------------------------------------------------------------------------------------------
]]
function timer_add(input, ms)
    debug_log('timer_add(' .. pre_dump(input) .. ", " .. pre_dump(ms) .. ') -- function variable names: input')
    obs.timer_add(input, ms);
end
--[[
	Forward declarations: these one-shot callbacks are defined further down as
	locals. Without declaring them here, remove_all_timers() would see nil globals.
	Define them later as 'function name()' (not 'local function') so they assign to these.
]]
local frontend_recording_start_callback, reset_text_a_colour_timer_callback, reset_text_b_colour_timer_callback;
local hide_note_a_timer_callback, hide_note_b_timer_callback, marker_a_media_end_callback, marker_b_media_end_callback;
local activate; -- F9: time_mark_check() pauses the timer at a marker; activate() is defined further down
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Stops the script's secondary timers (the Add and Subtract limit timers, the end-media and marker-media timers, the recording-start timer, and the marker colour and note-hide timers) and clears the pending recording start. The main timer is not touched.
	Scope: global; called by script_update
	type: helper (timers)
	input type: none
	returns: none
	Credit: midnight-studios
----------------------------------------------------------------------------------------------------------------------------------------
]]
function remove_all_timers()
    debug_log('remove_all_timers() -- function variable names: ')
    local timerNames = {}
    table.insert(timerNames, sal_timer_callback);
    table.insert(timerNames, ssl_timer_callback);
    table.insert(timerNames, timer_end_media_end_callback);
    table.insert(timerNames, frontend_recording_start_callback);
    table.insert(timerNames, reset_text_a_colour_timer_callback);
    table.insert(timerNames, reset_text_b_colour_timer_callback);
    table.insert(timerNames, hide_note_a_timer_callback);
    table.insert(timerNames, hide_note_b_timer_callback);
    table.insert(timerNames, marker_a_media_end_callback);
    table.insert(timerNames, marker_b_media_end_callback);
    timer_remove(timerNames)
    record_timer_set = false; -- the pending recording start was removed, allow it to be scheduled again
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Starts the OBS recording when a delayed start is pending and OBS isn't already recording, then stops its own timer and clears the pending flag.
	Scope: local (declared in advance); a timer callback added by record, also called directly by record
	type: timer callback
	input type: none
	returns: none
	Credit: midnight-studios
----------------------------------------------------------------------------------------------------------------------------------------
]]
function frontend_recording_start_callback()
    debug_log('frontend_recording_start_callback() -- function variable names:  ')
    if not record_timer_set then return end;
    if not obs.obs_frontend_recording_active() then
        obs.obs_frontend_recording_start();
    end;
    timer_remove(frontend_recording_start_callback);
    record_timer_set = false;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Auto Recording: when the Recording feature is enabled, the timer is in Countdown mode and the event matches the chosen "Auto Recording" trigger, schedules the recording start after a short delay, once. If OBS is already recording, a pending start is cancelled instead.
	Scope: local; called by time_mark_check, start_timer, activate_signal, start_overtime and timer_ended
	type: helper (recording)
	input type: mark: number (the event: 2 timer expires, 3 Marker A, 4 Marker B, 5 timer visible, 6 timer start); ms: number (delay in milliseconds)
	returns: none
	Credit: midnight-studios
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function record(mark, ms)
    debug_log('record(' .. pre_dump(mark) .. ", " .. pre_dump(ms) .. ') -- function variable names:  mark, ms ')
    if not enable_property_start_recording then return end;
    if obs.obs_frontend_recording_active() then -- if already recording, remove and reset timer
        frontend_recording_start_callback();
        return;
    end;
    if timer_mode ~= 2 or obs.obs_frontend_recording_active() then return end; -- if not countdown or timer active, then exit
    if start_recording ~= 1 and start_recording == mark then
        if not record_timer_set then
            timer_remove(frontend_recording_start_callback);  -- Remove any existing callbacks if they exist before assigning a new callback
            timer_add(frontend_recording_start_callback, ms); --< milliseconds
            record_timer_set = true;
        end;
    end;
    debug_log('record [End]')
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Works out the seconds from now until a date and time; -1 for the year, month or day means today's value. Times in the past give 0.
	Scope: local; called by update_timer_settings and activate
	type: helper (time)
	input type: year: number (or -1); month: number (or -1); day: number (or -1); hour: number; minute: number; second: number
	returns: number: seconds until then (0 if past)
	Credit: midnight-studios
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function delta_time(year, month, day, hour, minute, second)
    debug_log('delta_time(' ..
        pre_dump(year) ..
        ", " ..
        pre_dump(month) ..
        ", " ..
        pre_dump(day) ..
        ", " ..
        pre_dump(hour) ..
        ", " ..
        pre_dump(minute) ..
        ", " .. pre_dump(second) .. ') -- function variable names:  year, month, day, hour, minute, second ')
    local now = os.time();
    if (year == -1) then
        year = os.date("%Y", now);
    end;
    if (month == -1) then
        month = os.date("%m", now);
    end;
    if (day == -1) then
        day = os.date("%d", now);
    end;
    local future = os.time { year = year, month = month, day = day, hour = hour, min = minute, sec = second };
    local seconds = os.difftime(future, now);
    if (seconds < 0) then
        seconds = 0;
    end;
    return seconds;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Zero-pads an hour or minute value to the width its custom unit needs, at least two digits: {$H100} shows 0-99, {$M200} 0-199 (B13, PR #15). Done at display time only, so marker comparisons keep two digits.
	Scope: local; called by format_time
	type: helper (time format)
	input type: value: string or number; unit: number or nil (the custom unit; nil: value unchanged)
	returns: string or the value unchanged
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function pad_unit(value, unit)
    local number = tonumber(value)
    if unit == nil or number == nil then return value end
    local width = math.max(2, #tostring(unit - 1))
    return string.format("%0" .. width .. "d", number)
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Turns "HH:MM:SS,FF" into the chosen display format by replacing $D, $H, $M, $S and $F; $T trims leading zeros. A negative time's "-" goes before the first unit shown. $F shows hundredths, or frames with a {$F} instruction in the Custom Time Format, and is removed when hundredths are hidden.
	Scope: local; called by set_time_text
	type: helper (time format)
	input type: timestamp: string ("[-]HH:MM:SS,FF", also with days or fewer parts); format: string (the format with $ placeholders); shown_seconds: number or nil (the seconds shown, for the frame count)
	returns: string: the text to display
	Modified: midnight-studios
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function format_time(timestamp, format, shown_seconds) -- shown_seconds (optional): the time shown, for frames (B-022)
    debug_log('format_time(' ..
        pre_dump(timestamp) .. ", " .. pre_dump(format) .. ') -- function variable names:  timestamp, format ')
    local days, hours, minutes, seconds, mili = "00", "00", "00", "00", "00";
    local sign = ""; -- B-018: a negative time shows its "-" in front of the first time unit
    if type(timestamp) == "string" and timestamp:sub(1, 1) == "-" then
        sign = "-";
        timestamp = timestamp:sub(2);
    end
    local timeTable = explode(timestamp, ":") or { timestamp }; -- reference ":" 4 parts
    local trim = format:find("$T");
    local replacements = {}
    if #timeTable == 4 then
        days, hours, minutes, seconds = unpack(timeTable)
        seconds, mili = unpack(explode(seconds, ","))
    elseif #timeTable == 3 then
        hours, minutes, seconds = unpack(timeTable)
        seconds, mili = unpack(explode(seconds, ","))
    elseif #timeTable == 2 then
        minutes, seconds = unpack(timeTable)
        seconds, mili = unpack(explode(seconds, ","))
    elseif #timeTable == 1 then
        seconds = unpack(timeTable)
        seconds, mili = unpack(explode(seconds, ","))
    end
    if tonumber(days) < 10 and #tostring(days) < 2 then -- B-061: the default "00" is already two digits
        days = "0" .. days;
    end;
    local custom = (timer_format == 5); -- B-023: units and frames apply to the Custom Time Format only
    hours = pad_unit(hours, custom and hour_unit or nil);
    minutes = pad_unit(minutes, custom and minute_unit or nil);

    local replacements = { ["$D"] = days, ["$H"] = hours, ["$M"] = minutes, ["$S"] = seconds }

    timestamp = format:gsub("$T", "")
    --[[
		B-018 (fix review): the "-" goes in front of the first time unit the format
		shows, not in front of the first digit (which may be in the user's text).
	]]
    if sign ~= "" then
        local first, first_at = nil, nil;
        for _, k in ipairs({ "$D", "$H", "$M", "$S" }) do
            local at = timestamp:find(k, 1, true);
            if at ~= nil and (first_at == nil or at < first_at) then first, first_at = k, at end
        end
        if first ~= nil then replacements[first] = sign .. replacements[first] end
    end
    local frames_sign = (sign ~= "" and not (timestamp:find("$D", 1, true) or timestamp:find("$H", 1, true)
        or timestamp:find("$M", 1, true) or timestamp:find("$S", 1, true))) and sign or ""; -- only $F shown
    local frames = nil; -- B-020 (fix review): $F is filled in after the trim

    if show_mili then
        --[[
			Frame display (F3): {$F60} / {F60} shows $F as frames instead of hundredths.
			With a frame unit, the frame number comes from the fractional seconds (B-022).
		]]
        if custom and frame_unit ~= nil and tonumber(mili) ~= nil then
            -- B-022: frames from the fractional seconds; the hundredths are already truncated
            local fraction = (shown_seconds ~= nil) and (math.abs(shown_seconds) % 1) or (tonumber(mili) / 100);
            local frame = math.min(math.floor(fraction * frame_unit + 0.000001), frame_unit - 1);
            mili = pad_unit(frame, frame_unit);
        end
        frames = mili
    else
        timestamp = timestamp:gsub("[,.:]?%$F", "") -- B-021: remove the separator with it
    end

    for k, v in pairs(replacements) do
        timestamp = timestamp:gsub(k, v)
    end

    local epsilon = 0.0001 -- tolerance value
    --[[
			If format requires leading zeros removed, and;
			current_seconds is equal to zero, or less than tolerance value
			remove leading zeros.
	]]
    if trim and (math.abs(current_seconds) > epsilon or math.abs(current_seconds) == 0) then
        -- B-020: strip leading zeros and colons, but keep the sign and one digit before any separator
        timestamp = timestamp:gsub("^(%-?)[0:]*(%d)", "%1%2", 1);
    end
    if frames ~= nil then timestamp = timestamp:gsub("%$F", frames_sign .. frames) end

    if math.abs(current_seconds) < epsilon and timestamp:find("^0") then
        --timestamp = timestamp:gsub("^0+:", "")
    end

    debug_log('format_time timestamp:' .. pre_dump(timestamp))
    return timestamp
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Returns the number of whole days in a time, for the $D placeholder.
	Scope: local; called by set_time_text
	type: helper (time format)
	input type: time: number (seconds)
	returns: number: whole days (0 under a day)
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function long_time(time)
    debug_log('long_time(' .. pre_dump(time) .. ') -- function variable names:  time ')
    local c_time = time;
    -- If there is more than 24 hours, remove 23:59:59 as it will be in the clock
    if time > 86399 then -- 23:59:59
        c_time = math.floor((time) / 86400);
    end;
    if time < 86400 then
        c_time = 0;
    end;
    return c_time;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Finds the first {...} block (or another pattern) in a string and returns its inside.
	Scope: global; called by get_presuf_allocation
	type: helper (string)
	input type: str: string; reg: string or nil (Lua pattern; default "{.-%}")
	returns: string, number, number: the text without the first and last character, and the start and end index; nil if not found
----------------------------------------------------------------------------------------------------------------------------------------
]]
function extract_from_brackets(str, reg)
    -- Find the first occurrence of a balanced pair of braces in the string
    reg = reg or "{.-%}" -- "%b{}"-- "{.-%}"

    debug_log('extract_from_brackets(' ..
        pre_dump(str) .. ', ' .. pre_dump(reg) .. ') -- function variable names:  str, reg ')

    local start_index, end_index = string.find(str, reg)
    -- If no balanced pair of braces is found, return nil
    if start_index == nil then
        return nil
    end
    -- Extract the substring between the braces
    local instructions = string.sub(str, start_index + 1, end_index - 1)

    return instructions, start_index, end_index
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Reads a custom unit from the Custom Time Format, e.g. 24 from {$H24}, for one placeholder letter.
	Scope: global; called by script_update
	type: helper (time format)
	input type: str: string or nil (the format); target_char: string (one uppercase letter, e.g. "H")
	returns: number: the unit; nil if there is none (or it is 0); nil and an error message for an invalid letter
----------------------------------------------------------------------------------------------------------------------------------------
]]
function get_unit_allocation(str, target_char)
    debug_log('get_unit_allocation(' .. pre_dump(str) .. ') -- function variable names:  str ')
    -- Ensure that the target character is a single uppercase letter
    if not target_char:match("%u") or #target_char ~= 1 then
        return nil, "Invalid target character. Must be a single uppercase letter."
    end

    if str == nil then return nil end
    --[[
		Look in every {} block, not just the first (B13), so all of these resolve:
			{H100}  {H100M200}  {M90}      (5.6 syntax, still supported)
			{$H100} {$H100}:{$M200}        (6.0 syntax, PR #15)
	]]
    for block in str:gmatch("%b{}") do
        local number = block:match("%$?" .. target_char .. "(%d+)")
        if number ~= nil and tonumber(number) > 0 then
            return tonumber(number)
        end
    end
    return nil
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Turns instruction blocks such as {$H24} back into the plain placeholder ($H), so the instruction never prints in the timer (B13).
	Scope: global; called by clean_time_format
	type: helper (time format)
	input type: str: string (the format)
	returns: string: the format without unit numbers
	Credit: deekei (DominikKriss, PR #15)
----------------------------------------------------------------------------------------------------------------------------------------
]]
function removeInstructions(str)
    debug_log('removeInstructions(' .. pre_dump(str) .. ') -- function variable names: str')
    local result = string.gsub(str, "{%$(%u)%d*}", "$%1")
    return result
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Removes the instruction blocks from a Custom Time Format, keeping their placeholders, so it can be used for display.
	Scope: global; called by countdown_display_seconds, show_split and set_time_text
	type: helper (time format)
	input type: str: string (the format)
	returns: string: the cleaned format
----------------------------------------------------------------------------------------------------------------------------------------
]]
function clean_time_format(str)
    local result = string.gsub(removeInstructions(str), "%b{}", "")
    return result
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Gives the time to display. With "Round up displayed countdown" on, in Countdown with a Custom Time Format that has no seconds ($S), it rounds up to the smallest unit shown ($M, $H or $D), so "$H:$M" reads 00:01 until zero (F8). Only the display changes; markers and expiry use current_seconds.
	Scope: global; called by set_time_text
	type: helper (time format)
	input type: none (reads the timer globals)
	returns: number: seconds to display
	Credit: viscountexx (feature request)
----------------------------------------------------------------------------------------------------------------------------------------
]]
function countdown_display_seconds()
    if not round_up_countdown or timer_mode ~= 2 or timer_format ~= 5 or current_seconds <= 0 then
        return current_seconds
    end
    -- B-014: only the remaining time rounds up; elapsed overtime and counting up round down
    if overtime_active or current_count_direction == "UP" then return current_seconds end
    local format = clean_time_format(custom_time_format);
    if string.find(format, "$S", 1, true) then return current_seconds end
    local unit = nil;
    if string.find(format, "$M", 1, true) then
        unit = 60;
    elseif string.find(format, "$H", 1, true) then
        unit = 3600;
    elseif string.find(format, "$D", 1, true) then
        unit = 86400;
    end
    if unit == nil then return current_seconds end
    -- small tolerance so an exact 60.0000001 does not round up to the next minute
    return math.ceil(current_seconds / unit - 0.000001) * unit
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Reads the frame instruction from the Custom Time Format (F3): {$F60} or {F60} shows $F as frames at 60 fps; {$F} or {F} without a number means the OBS output frame rate.
	Scope: global; called by script_update
	type: helper (time format)
	input type: str: string or nil (the format)
	returns: number: the frame rate, 0 (use the output rate), or nil (no frame instruction)
	Credit: Leduit (feature request)
----------------------------------------------------------------------------------------------------------------------------------------
]]
function get_frame_unit(str)
    if str == nil then return nil end
    for block in str:gmatch("%b{}") do
        local number = block:match("%$?F(%d*)")
        if number ~= nil then
            return tonumber(number) or 0
        end
    end
    return nil
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Returns the OBS output frame rate rounded to whole frames (29.97 becomes 30), or 30 if it isn't available.
	Scope: global; called by script_update
	type: helper (timing)
	input type: none
	returns: number: frames per second (at least 1)
----------------------------------------------------------------------------------------------------------------------------------------
]]
function output_fps()
    local video_info = obs.obs_video_info();
    if obs.obs_get_video_info(video_info) and video_info.fps_den > 0 then
        return math.max(1, math.floor(video_info.fps_num / video_info.fps_den + 0.5));
    end
    return 30;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Reads the display instruction in a Timer Prefix or Suffix: {1} or {2} ties it to the Marker A or B time, {HH:MM:SS} to a fixed time, and ",n" after it sets how many seconds it shows.
	Scope: global; called by validate_presuf
	type: helper (prefix/suffix)
	input type: str: string (the prefix or suffix text); reg: string or nil (Lua pattern of the block; default "{.-%}")
	returns: bool, string, number: whether there is an instruction; "a", "b" or the "HH:MM:SS" time; the seconds, or nil
----------------------------------------------------------------------------------------------------------------------------------------
]]
function get_presuf_allocation(str, reg)
    -- Find the first occurrence of a balanced pair of braces in the string
    reg = reg or "{.-%}" -- "%b{}"-- "{.-%}"

    debug_log('get_presuf_allocation(' ..
        pre_dump(str) .. ', ' .. pre_dump(reg) .. ') -- function variable names:  str, reg ')

    local instructions = extract_from_brackets(str, reg)

    if instructions then
        if instructions == "1" then     -- only referencing 1
            return true, "a", nil
        elseif instructions == "2" then -- only referencing 2
            return true, "b", nil
        end

        -- Check if the instructions specified a time stamp
        start_timestamp, end_timestamp = instructions:find("%d%d:%d%d:%d%d")

        if start_timestamp and end_timestamp then -- we have a defined time stamp
            local timestamp = instructions:sub(start_timestamp, end_timestamp)
            local timer_units
            -- Check if there's a character following the timestamp
            if end_timestamp < #instructions then
                timer_units = instructions:sub(end_timestamp):match(",(%d*)")
                if timer_units == "" then timer_units = nil end
            end
            return true, timestamp, timer_units and tonumber(timer_units) or nil
        else -- no time stamp
            local flag, timer_units = instructions:match("(%d+),(%d*)")

            if flag == "1" then
                return true, "a", timer_units ~= "" and tonumber(timer_units) or nil
            elseif flag == "2" then
                return true, "b", timer_units ~= "" and tonumber(timer_units) or nil
            end
        end
    end
    return false, nil, nil
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Tells whether a string contains a {...} block.
	Scope: global; called by prepare_text_prefix_suffix
	type: helper (string)
	input type: str: string
	returns: bool
----------------------------------------------------------------------------------------------------------------------------------------
]]
function hasBrackets(str)
    debug_log('hasBrackets(' .. pre_dump(str) .. ') -- function variable names: str')
    local start_index, end_index = string.find(str, "%b{}")
    return start_index ~= nil
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Removes the first {...} block from a string.
	Scope: global; called by prepare_text_prefix_suffix and validate_presuf
	type: helper (string)
	input type: str: string
	returns: string: the string without the block (unchanged if there is none)
----------------------------------------------------------------------------------------------------------------------------------------
]]
function removeBrackets(str)
    debug_log('removeBrackets(' .. pre_dump(str) .. ') -- function variable names: str')
    local start_index, end_index = string.find(str, "%b{}")
    if start_index == nil then
        return str
    end
    return string.sub(str, 1, start_index - 1) .. string.sub(str, end_index + 1)
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Reads the text colour of a text source of this platform's type (on other platforms the first gradient colour, or the second if the first is 0); 0 counts as white.
	Scope: local; called by load_settings_globals
	type: helper (sources)
	input type: source_name: string or nil (source name)
	returns: number: the colour (ABGR), or nil if the source is missing, ignored or not that text type
	Credit: et al
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function get_text_color(source_name)
    debug_log('get_timer_text_color(' .. pre_dump(int) .. ') -- function variable names:  int ')
    local color
    if source_name == nil or in_table(ignore_list, source_name) then return color end; -- if timer_source not defined, then return
    local source = obs.obs_get_source_by_name(source_name);                            -- get source by name
    if source ~= nil then                                                              -- continue if we have a source
        local source_id = obs.obs_source_get_unversioned_id(source);                   -- get source id
        if source_id == text_source_unversioned_id then                                -- identify text type sources only
            --[[
				B-053: read the colour from the source's own settings (the global
				'settings' used here before was never assigned, so this always
				returned nil and every redraw then failed in obs_data_set_int).
				obs_data_get_int takes 2 arguments and returns 0 when the key is not set.

				Operating compatibility MacOSX / Windows
				The settings key for color
				Win = "color"
				Mac = "color1" and "color2"
			]]
            local settings = obs.obs_source_get_settings(source);
            if settings ~= nil then
                if osType == "Windows" then
                    color = obs.obs_data_get_int(settings, "color");
                else
                    color = obs.obs_data_get_int(settings, "color1");
                    if color == 0 then
                        color = obs.obs_data_get_int(settings, "color2");
                    end
                end
                if color == 0 then
                    color = 4294967295 -- not set: the text source default is white
                end
                obs.obs_data_release(settings); -- release settings
            end
        end
        obs.obs_source_release(source);         -- release source
    end
    return color
end
--[[
	B-067: true while the script shows a colour other than the normal one (a marker
	or overtime colour), so the normal colour is not re-read from the source then.
]]
local script_colour_showing = false;
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Sets the colour of the timer text source, writing all three colour keys so it works on every platform's text source, and remembers whether a non-normal colour is showing.
	Scope: local; called by the marker colour reset callbacks, time_mark_check, restore_saved_normal_colour, start_overtime and script_unload
	type: helper (sources)
	input type: color: number or nil (ABGR colour; nil: nothing happens)
	returns: none
	Credit: et al
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function set_timer_text_color(color)
    debug_log('set_timer_text_color(' .. pre_dump(color) .. ') -- function variable names:  int ')
    if color == nil then return end;                                   -- B-053: nothing to write (unknown colour)
    script_colour_showing = (color ~= media["color_normal"]);          -- B-067
    if in_table({ "Select", "select" }, timer_source) then return end; -- if timer_source not defined, then return
    local source = obs.obs_get_source_by_name(timer_source);           -- get source by name
    if source ~= nil then                                              -- continue if we have a source
        local settings = obs.obs_source_get_settings(source);          -- get source settings
        if settings ~= nil then
            --[[
				Operating compatibility MacOSX / Windows
				The settings key for color
				Win = "color"
				Mac = "color2" and "color3"
			]]
            obs.obs_data_set_int(settings, "color", color);  -- compatibility for settings transfer
            obs.obs_data_set_int(settings, "color1", color); -- update source settings
            obs.obs_data_set_int(settings, "color2", color); -- update source settings
        end
        obs.obs_source_update(source, settings);             -- save source new settings
        obs.obs_data_release(settings);                      -- release settings
        obs.obs_source_release(source);                      -- release source
    end
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Puts the timer text back to its normal colour after the Marker A colour time, then stops its own timer.
	Scope: local (declared in advance); a timer callback added by reset_marker_text_colour_start_timer
	type: timer callback
	input type: none
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
function reset_text_a_colour_timer_callback()
    debug_log('reset_text_a_colour_timer_callback() -- function variable names: ')
    set_timer_text_color(media["color_normal"]);
    timer_remove(reset_text_a_colour_timer_callback);
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Stops the pending Marker A colour reset timer.
	Scope: local; called by activate and start_overtime
	type: helper (timers)
	input type: none
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function reset_text_a_colour_end_timer()
    debug_log('reset_text_a_colour_end_timer() -- function variable names: ')
    timer_remove(reset_text_a_colour_timer_callback); -- Removing the callback stops the timer
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Puts the timer text back to its normal colour after the Marker B colour time, then stops its own timer.
	Scope: local (declared in advance); a timer callback added by reset_marker_text_colour_start_timer
	type: timer callback
	input type: none
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
function reset_text_b_colour_timer_callback()
    debug_log('reset_text_b_colour_timer_callback() -- function variable names: ')
    set_timer_text_color(media["color_normal"]);
    timer_remove(reset_text_b_colour_timer_callback);
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Stops the pending Marker B colour reset timer.
	Scope: local; called by activate and start_overtime
	type: helper (timers)
	input type: none
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function reset_text_b_colour_end_timer()
    debug_log('reset_text_b_colour_end_timer() -- function variable names: ')
    timer_remove(reset_text_b_colour_timer_callback); -- Removing the callback stops the timer
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Hides the Marker A note when its show time is over: a text note source, or every group item shown for it (emptying the list of shown notes). Stops its own timer first.
	Scope: local (declared in advance); a timer callback added by hide_note_start_timer
	type: timer callback
	input type: none
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
function hide_note_a_timer_callback()
    debug_log('hide_note_a_timer_callback() -- function variable names: ')
    timer_remove(hide_note_a_timer_callback); -- B-029: one-shot; remove first so an error below cannot make it repeat
    if is_note_text_id(media["note_source_unversioned_id_marker_a"]) then
        set_visible(media["note_source_marker_a"], false);                  -- Set hiden the source for the note for marker a
    end
    if media["note_source_unversioned_id_marker_a"] == "group" then         -- Hide Sources from a list
        local used = media["used_note_source_marker_a"]
        while used.first <= used.last do -- B-029: nothing queued (e.g. notes disabled)
            local source_to_use = used:popright()
            if source_to_use ~= nil then set_visible(source_to_use, false); end -- B-030: hide every queued note, not only one
        end
    end
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Stops the pending Marker A note-hide timer.
	Scope: local; called by activate
	type: helper (timers)
	input type: none
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function hide_note_a_colour_end_timer()
    debug_log('hide_note_a_colour_end_timer() -- function variable names: ')
    timer_remove(hide_note_a_timer_callback); -- Removing the callback stops the timer
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Hides the Marker B note when its show time is over: a text note source, or every group item shown for it (emptying the list of shown notes). Stops its own timer first.
	Scope: local (declared in advance); a timer callback added by hide_note_start_timer
	type: timer callback
	input type: none
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
function hide_note_b_timer_callback()
    debug_log('hide_note_b_timer_callback() -- function variable names: ')
    timer_remove(hide_note_b_timer_callback); -- B-029: one-shot; remove first so an error below cannot make it repeat
    if is_note_text_id(media["note_source_unversioned_id_marker_b"]) then
        set_visible(media["note_source_marker_b"], false); -- Set hiden the source for the note for marker b
    end
    if media["note_source_unversioned_id_marker_b"] == "group" then
        local used = media["used_note_source_marker_b"]
        while used.first <= used.last do -- B-029: nothing queued (e.g. notes disabled)
            local source_to_use = used:popright()
            if source_to_use ~= nil then set_visible(source_to_use, false); end -- B-030: hide every queued note, not only one
        end
    end
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Stops the pending Marker B note-hide timer.
	Scope: local; called by activate
	type: helper (timers)
	input type: none
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function hide_note_b_colour_end_timer()
    debug_log('hide_note_b_colour_end_timer() -- function variable names: ')
    timer_remove(hide_note_b_timer_callback); -- Removing the callback stops the timer
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Starts (or restarts) the timer that puts the timer text back to its normal colour after a marker, and records when it is due so a pause can keep the time left.
	Scope: local; called by resume_marker_timers, time_mark_check and timer_ended
	type: helper (timers)
	input type: int: number (milliseconds; 0: no timer); ref: string ("marker_a" or "marker_b")
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function reset_marker_text_colour_start_timer(int, ref)
    debug_log('reset_marker_text_colour_start_timer(' ..
        pre_dump(int) .. ", " .. pre_dump(ref) .. ') -- function variable names:  int, ref ')
    if int ~= 0 then
        if ref == "marker_a" then
            timer_remove(reset_text_a_colour_timer_callback);   -- Remove any existing callbacks if they exist before assigning a new callback
            timer_add(reset_text_a_colour_timer_callback, int); --<- milliseconds
        end
        if ref == "marker_b" then
            timer_remove(reset_text_b_colour_timer_callback);   -- Remove any existing callbacks if they exist before assigning a new callback
            timer_add(reset_text_b_colour_timer_callback, int); --<- milliseconds
        end
        media["colour_due_" .. ref] = obs.os_gettime_ns() + int * 1000000; -- when it is due, so a pause can resume it
    end
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Starts (or restarts) the timer that hides a marker's note after its show time, and records when it is due so a pause can keep the time left.
	Scope: local; called by resume_marker_timers and time_mark_check
	type: helper (timers)
	input type: int: number (milliseconds; 0: no timer); ref: string ("marker_a" or "marker_b")
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function hide_note_start_timer(int, ref)
    debug_log('hide_note_start_timer(' ..
        pre_dump(int) .. ", " .. pre_dump(ref) .. ') -- function variable names:  int, ref ')
    if int ~= 0 then
        if ref == "marker_a" then
            timer_remove(hide_note_a_timer_callback);   -- Remove any existing callbacks if they exist before assigning a new callback
            timer_add(hide_note_a_timer_callback, int); --<- milliseconds
        end
        if ref == "marker_b" then
            timer_remove(hide_note_b_timer_callback);   -- Remove any existing callbacks if they exist before assigning a new callback
            timer_add(hide_note_b_timer_callback, int); --<- milliseconds
        end
        media["note_due_" .. ref] = obs.os_gettime_ns() + int * 1000000; -- when it is due, so a pause can resume it
    end
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: On pause, keeps the time each pending marker timer (text colour reset, note hide, media playback limit) still had left, and stops the media limit timers, so Start can schedule them again. Does nothing if the timer isn't running.
	Scope: local; called by activate (on pause)
	type: helper (timers)
	input type: none
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function suspend_marker_timers()
    if not timer_active then return end -- already paused: keep what the first pause stored
    local now = obs.os_gettime_ns();
    for _, ref in ipairs({ "marker_a", "marker_b" }) do
        for _, kind in ipairs({ "colour", "note", "media" }) do -- B-068: the marker audio duration pauses too
            local due = media[kind .. "_due_" .. ref];
            if due ~= nil and due > now then
                media[kind .. "_left_" .. ref] = math.floor((due - now) / 1000000); -- milliseconds
            else
                media[kind .. "_left_" .. ref] = nil;                               -- already done (or never started)
            end
            media[kind .. "_due_" .. ref] = nil;
        end
    end
    timer_remove(marker_a_media_end_callback); -- B-068: resumed with the remaining time on Start
    timer_remove(marker_b_media_end_callback);
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: On Start, schedules the marker timers that a pause suspended (text colour reset, note hide, media playback limit) again with the time they had left.
	Scope: local; called by activate (on start)
	type: helper (timers)
	input type: none
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function resume_marker_timers()
    for _, ref in ipairs({ "marker_a", "marker_b" }) do
        local left = media["colour_left_" .. ref];
        if left ~= nil and left > 0 then reset_marker_text_colour_start_timer(left, ref) end
        left = media["note_left_" .. ref];
        if left ~= nil and left > 0 then hide_note_start_timer(left, ref) end
        left = media["media_left_" .. ref];
        if left ~= nil and left > 0 then -- B-068 (decision 2026-10-10, option a)
            local end_callback = (ref == "marker_a") and marker_a_media_end_callback or marker_b_media_end_callback;
            timer_remove(end_callback);
            timer_add(end_callback, left);
            media["media_due_" .. ref] = obs.os_gettime_ns() + left * 1000000;
        end
        media["colour_left_" .. ref] = nil;
        media["note_left_" .. ref] = nil;
        media["media_left_" .. ref] = nil;
    end
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Forgets all pending and suspended marker timer times (text colour, note, media), on Reset.
	Scope: local; called by reset
	type: helper (timers)
	input type: none
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function clear_marker_timers()
    for _, ref in ipairs({ "marker_a", "marker_b" }) do
        for _, kind in ipairs({ "colour", "note", "media" }) do -- B-068
            media[kind .. "_due_" .. ref] = nil;
            media[kind .. "_left_" .. ref] = nil;
        end
    end
end
--[[
	B-068 (re-review): Pause on a timer that is already stopped (paused at a marker, or
	expired while the marker audio finishes) pauses the audio; suspend its re-armed
	limit too, so Start resumes it with the remaining time.
]]
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Keeps the time left on the marker media playback limits and stops their timers, so the limit resumes when the audio does (B-068).
	Scope: local; called by pause, startpause and activate_signal
	type: helper (media)
	input type: none
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function suspend_media_limits()
    local now = obs.os_gettime_ns();
    for _, ref in ipairs({ "marker_a", "marker_b" }) do
        local due = media["media_due_" .. ref];
        if due ~= nil then
            media["media_left_" .. ref] = math.max(0, math.floor((due - now) / 1000000)); -- milliseconds
            media["media_due_" .. ref] = nil;
        end
    end
    timer_remove(marker_a_media_end_callback);
    timer_remove(marker_b_media_end_callback);
end
--[[
	B-068 (review): where the timer stops but the marker audio keeps playing (expiry,
	"Pause timer at Marker", Disable Script), re-arm the playback limit that
	activate(false) suspended, so the audio still stops after its duration.
]]
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Schedules the suspended marker media playback limits again with their time left, where the timer stops but marker audio keeps playing (expiry, "Pause timer at Marker", Disable Script), so the audio still stops after its duration (B-068).
	Scope: local; called by time_mark_check, activate_signal, timer_ended and script_update
	type: helper (media)
	input type: none
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function rearm_media_limits()
    for _, ref in ipairs({ "marker_a", "marker_b" }) do
        local left = media["media_left_" .. ref];
        if left ~= nil and left > 0 then
            local end_callback = (ref == "marker_a") and marker_a_media_end_callback or marker_b_media_end_callback;
            timer_remove(end_callback);
            timer_add(end_callback, left);
            media["media_due_" .. ref] = obs.os_gettime_ns() + left * 1000000;
        end
        media["media_left_" .. ref] = nil;
    end
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Tells whether the panel may offer the "Toggle Milliseconds" trigger: Advanced layout, Countdown mode, and a time format that shows hundredths (formats 1-2, or a Custom Time Format with $F).
	Scope: local; called by property_onchange
	type: helper (panel)
	input type: props: obs_properties (the panel; not used); settings: obs_data (the script's settings)
	returns: bool
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function show_split(props, settings)
    debug_log('show_split(' ..
        pre_dump(props) .. ", " .. pre_dump(settings) .. ') -- function variable names:  props, settings ')
    local layout_value = obs.obs_data_get_int(settings, "layout");
    local mode = obs.obs_data_get_int(settings, "timer_mode");
    local shw = false;
    shw = (layout_value == 2 and mode == 2 and in_table({ 1, 2 }, timer_format));
    if (timer_format == 5 and layout_value == 2 and mode == 2) then
        if (string.find(clean_time_format(custom_time_format), "$F", 1, true) ~= nil) then
            shw = true;
        else
            shw = false;
        end;
    end;
    return shw;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Sets the text of a text source. Names in ignore_list and nil are ignored.
	Scope: local; called by source_list_set_by_index, set_split_text, reset and timer_ended
	type: helper (sources)
	input type: source_name: string or nil (source name); text: string (the new text)
	returns: none
	Credit: et al
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function set_text(source_name, text)
    debug_log('set_text(' ..
        pre_dump(source_name) .. ", " .. pre_dump(text) .. ') -- function variable names:  source_name, text ')

    if source_name == nil or in_table(ignore_list, source_name) then
        return
    end
    --[[
		Increments the source reference counter,
		use obs_source_release() to release it when complete.
	]]
    local source = obs.obs_get_source_by_name(source_name);
    if source ~= nil then
        --[[
			settings must be local to this block: it used to be declared inside the
			'if' and then used outside it, so update/release received nil (B9)
		]]
        local settings = obs.obs_source_get_settings(source);
        obs.obs_data_set_string(settings, "text", text);
        obs.obs_source_update(source, settings);
        obs.obs_data_release(settings);
        obs.obs_source_release(source);
    end;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Ends the Marker A media when its playback limit is reached: hides the playing source and marks the media as ended. Stops its own timer first.
	Scope: local (declared in advance); a timer callback added by start_media_action, resume_marker_timers and rearm_media_limits
	type: timer callback
	input type: none
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
function marker_a_media_end_callback()
    debug_log('marker_a_media_end_callback() -- function variable names:  ')
    timer_remove(marker_a_media_end_callback); -- one-shot
    media["media_due_marker_a"] = nil; -- B-068
    -- hide the source that was started: with a Marker Audio list the name has already moved on
    set_visible(media["playing_audio_marker_a"] or media["source_name_audio_marker_a"], false);
    media["media_ended_marker_a"] = true;
    media["playing_audio_marker_a"] = nil; -- B-076 (review): no longer playing
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Ends the Marker B media when its playback limit is reached: hides the playing source and marks the media as ended. Stops its own timer first.
	Scope: local (declared in advance); a timer callback added by start_media_action, resume_marker_timers and rearm_media_limits
	type: timer callback
	input type: none
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
function marker_b_media_end_callback()
    debug_log('marker_b_media_end_callback() -- function variable names:  ')
    timer_remove(marker_b_media_end_callback); -- one-shot
    media["media_due_marker_b"] = nil; -- B-068
    -- hide the source that was started: with a Marker Audio list the name has already moved on
    set_visible(media["playing_audio_marker_b"] or media["source_name_audio_marker_b"], false);
    media["media_ended_marker_b"] = true;
    media["playing_audio_marker_b"] = nil; -- B-076 (review): no longer playing
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Runs when a marker or end media source finishes playing: hides it and forgets it as playing. If an expire-scene switch is waiting for the end media, starts that switch.
	Scope: local; connected to the source's "media_ended" signal by disconnect_after_media_end
	type: signal handler
	input type: cd: calldata (the signal's data, with the source)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function signal_media_ended(cd)
    debug_log('signal_media_ended(' .. pre_dump(cd) .. ') -- function variable names:  cd ')
    --[[
		Get source from CallData
	]]
    local source = obs.calldata_source(cd, "source");
    --[[
		Found Source?
	]]
    if source ~= nil then
        local name = obs.obs_source_get_name(source);
        --[[
			Set Source Visibility to Hidden
		]]
        set_visible(name, false);
        for _, ref in ipairs({ "marker_a", "marker_b", "marker_end" }) do -- B-076 (review): no longer playing
            if media["playing_audio_" .. ref] == name then media["playing_audio_" .. ref] = nil end
        end
        --[[
			F4: the Timer Expired Audio finished naturally and a scene switch is waiting.
			This signal arrives on a media thread, so switch from a one-shot timer
			(the same thread the normal expiry scene switch runs on).
		]]
        if pending_expire_scene ~= nil and name == media["source_name_audio_marker_end"] then
            timer_remove(expire_scene_switch_callback);
            timer_add(expire_scene_switch_callback, 10);
        end
    end
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Connects signal_media_ended to the "media_ended" signal of the marker's media source (disconnecting first so it is connected once), so the source is hidden when it finishes.
	Scope: local; called by start_media_action and play_timer_end_audio
	type: helper (signals)
	input type: ref: string ("marker_a", "marker_b" or "marker_end")
	returns: none
	Credit: OBS, Source Signals, https://obsproject.com/docs/reference-sources.html?highlight=media_ended
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function disconnect_after_media_end(ref)
    debug_log('disconnect_after_media_end(' .. pre_dump(ref) .. ') -- function variable names:  ref ')

    local source_name = media["source_name_audio_" .. ref];

    if source_name == nil or in_table(ignore_list, source_name) then
        debug_log('disconnect_after_media_end source_name nil ')
        return
    end

    local source = obs.obs_get_source_by_name(source_name); -- Increments the source reference counter, use obs_source_release() to release it when complete.
    --[[
		Found Source?
	]]
    if source ~= nil then
        local source_id = obs.obs_source_get_unversioned_id(source); -- get source id
        if source_id == "ffmpeg_source" then                         -- check if source id match that of type we need to focus on
            --[[
				Create a signal handler for the source
			]]
            local sh = obs.obs_source_get_signal_handler(source);
            --[[
				https://obsproject.com/docs/reference-sources.html?highlight=media_started
				attach event listener callback [source_signal]: Called when media has ended.
				Disconnect first: markers can now replay (B4), and each replay would
				otherwise add another identical connection.
			]]
            obs.signal_handler_disconnect(sh, "media_ended", signal_media_ended);
            obs.signal_handler_connect(sh, "media_ended", signal_media_ended);
        end;
    end;
    obs.obs_source_release(source);
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Plays a marker's media once per marker while the timer runs: restarts it if it is already visible, shows it, starts the playback limit timer when "Media Playback Limit" is enabled with a duration, and connects the media-ended signal.
	Scope: local; called by start_media
	type: helper (media)
	input type: source_name: string (media source name); ref: string ("marker_a" or "marker_b")
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function start_media_action(source_name, ref)
    debug_log('start_media_action(' ..
        pre_dump(source_name) .. ", " .. pre_dump(ref) .. ') -- function variable names:  source_name, ref ')
    if in_table(ignore_list, source_name) then return end;

    if not timer_active then return end; -- only start_media_action if the timer is active

    if not media["activated_media_" .. ref] then
        media["current_seconds_" .. ref] = current_seconds; -- exact start time, used for the duration limit
        if is_visible(source_name) then
            --[[
				Still visible from the previous firing (audio not finished): showing it
				again would do nothing, so restart playback from the beginning (B4)
			]]
            local source = obs.obs_get_source_by_name(source_name);
            if source ~= nil then
                obs.obs_source_media_restart(source);
                obs.obs_source_release(source);
            end
        end
        set_visible(source_name, true);
        media["playing_audio_" .. ref] = source_name; -- the source to hide when the duration is up
        --[[
			Marker A/B Duration (Media Playback Limit enabled): hide the source after
			the duration with a one-shot timer, the same way "End Audio Duration" works.
			The old per-tick check in stop_media_action() never ran (inverted guard) and
			depended on the media state and on the current list entry.
		]]
        if media["duration_" .. ref] ~= 0 and media_playback_limit ~= 1 then
            local end_callback = (ref == "marker_a") and marker_a_media_end_callback or marker_b_media_end_callback;
            timer_remove(end_callback);
            timer_add(end_callback, math.floor(media["duration_" .. ref] * 1000)); --<- milliseconds
            media["media_due_" .. ref] = obs.os_gettime_ns() + math.floor(media["duration_" .. ref] * 1000) * 1000000; -- B-068
        end
        --[[
			media must be avtive now, or have been made active started
		]]


        --[[

			connect signal handler to ensure we reset the source if the media ended.

		]]
        disconnect_after_media_end(ref);
        media["activated_media_" .. ref] = true;
    end
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Starts a marker's media (see start_media_action).
	Scope: local; called by time_mark_check
	type: helper (media)
	input type: source_name: string (media source name); ref: string ("marker_a" or "marker_b")
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function start_media(source_name, ref)
    debug_log('start_media(' ..
        pre_dump(source_name) .. ", " .. pre_dump(ref) .. ') -- function variable names:  source_name, ref ')
    start_media_action(source_name, ref);
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Writes the marker note text into the marker's note text source and, if the marker's text colour feature is enabled, the marker colour. Only for text note sources (not groups), and not while the script is disabled.
	Scope: local; called by time_mark_check and reset
	type: helper (markers)
	input type: ref: string ("marker_a" or "marker_b")
	returns: none
	Credit: et al
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function set_text_note_color(ref)
    if disable_script then return; end;
    debug_log('set_text_note_color(' .. pre_dump(ref) .. ') -- function variable names:  ref ')
    --[[
		Only control colour if source is a text source
	]]
    if not is_note_text_id(media["note_source_unversioned_id_" .. ref]) then return end

    local source_name = media["note_source_" .. ref];
    local text        = media["note_" .. ref];
    local color       = media["color_" .. ref];

    if source_name == nil or in_table(ignore_list, source_name) then
        return
    end
    if ref == nil then
        return
    end
    if in_table(ignore_list, source_name) then return end;
    if in_table(ignore_list, ref) then return end;
    local source = obs.obs_get_source_by_name(source_name);  -- get source by name
    if source ~= nil then                                    -- continue if we have a source
        local settings = obs.obs_source_get_settings(source) -- get source settings
        if settings ~= nil then
            obs.obs_data_set_string(settings, "text", text); -- update source settings
            if (enable_property_color_marker_a and ref == "marker_a") or (enable_property_color_marker_b and ref == "marker_b") then
                --[[
					Operating compatibility MacOSX / Windows
					The settings key for color
					Win = "color"
					Mac = "color2" and "color3"
				]]
                obs.obs_data_set_int(settings, "color", color);  -- compatibility for settings transfer
                obs.obs_data_set_int(settings, "color1", color); -- update source settings
                obs.obs_data_set_int(settings, "color2", color); -- update source settings
            end
            -- B-002: update and release inside the block where the local 'settings' exists
            obs.obs_source_update(source, settings); -- save source new settings
            obs.obs_data_release(settings);          -- release settings
        end
        obs.obs_source_release(source);              -- release source
    end;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Rounds the current time to whole seconds: down when counting up, up when counting down.
	Scope: global; called by validate_presuf, time_mark_check, update_timer_direction, reset, init and script_update
	type: helper (time)
	input type: none
	returns: number: whole seconds
----------------------------------------------------------------------------------------------------------------------------------------
]]
function roundSeconds()
    debug_log('roundSeconds() -- function variable names: ')

    local round_seconds = math.ceil(current_seconds); -- round to nearset upper value
    --[[
	 	if not Count Down so target Count Up, or
		if the count direction changed and the count direction is positive
	]]

    if current_count_direction == "UP" then
        round_seconds = math.floor(current_seconds); -- round to nearset lower value
    end
    return round_seconds
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Sets the shown Timer Prefix and Suffix: plain text is shown as it is; text with a {...} instruction starts empty until validate_presuf shows it.
	Scope: global; called by reset, init and script_update
	type: helper (prefix/suffix)
	input type: none
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
function prepare_text_prefix_suffix()
    if hasBrackets(text_prefix) then
        local text_prefix_cleaned = removeBrackets(text_prefix)
        text_prefix_validated = ""
    else
        text_prefix_validated = text_prefix;
    end
    if hasBrackets(text_suffix) then
        local text_suffix_cleaned = removeBrackets(text_suffix)
        text_suffix_validated = ""
    else
        text_suffix_validated = text_suffix;
    end
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Shows or hides a Timer Prefix or Suffix that has a {...} instruction, depending on whether the current time is inside its window (from the marker or fixed time, for the given seconds, in the count direction).
	Scope: local; called by time_mark_check and set_time_text
	type: helper (prefix/suffix)
	input type: none
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function validate_presuf()
    debug_log('validate_presuf() -- function variable names: ')
    local p1, p2, p3 = get_presuf_allocation(text_prefix)
    local s1, s2, s3 = get_presuf_allocation(text_suffix)
    local text_prefix_cleaned = removeBrackets(text_prefix)
    local text_suffix_cleaned = removeBrackets(text_suffix)
    local round_seconds = roundSeconds();
    --[[
    ----------------------------------------------------------------------------------------------------------------------------------------
    	Description: Converts an "hh:mm:ss" time to seconds.
    	Scope: local inside validate_presuf; called by get_set_seconds
    	type: helper (time)
    	input type: timeString: string or nil
    	returns: number: seconds, or nil if not "hh:mm:ss"
    ----------------------------------------------------------------------------------------------------------------------------------------
    ]]
    local function get_seconds_from_timestamp(timeString)
        local result
        if timeString ~= nil and checkTimeString(timeString) then
            result = convertToSeconds(timeString)
        end
        return result
    end
    --[[
    ----------------------------------------------------------------------------------------------------------------------------------------
    	Description: Tells whether the rounded current time is inside a window. Counting down, the window runs (min, max]; counting up, [min, max). A missing end leaves that side open.
    	Scope: local inside validate_presuf; called by validate_presuf
    	type: helper (time)
    	input type: min: number or nil (seconds); max: number or nil (seconds)
    	returns: bool (false when both are nil)
    ----------------------------------------------------------------------------------------------------------------------------------------
    ]]
    local function isSecondsInRange(min, max)
        --[[
			B-026 (decision 2026-10-09): Count Up shows the text in [min, max);
			Count Down mirrors it with (min, max], so the marker second is included.
		]]
        local down = (current_count_direction ~= "UP");
        if min == nil and max == nil then
            return false
        elseif min == nil then
            if down then return round_seconds <= max end
            return round_seconds < max
        elseif max == nil then
            if down then return round_seconds > min end
            return round_seconds >= min
        elseif down then
            return min < round_seconds and round_seconds <= max
        else
            return min <= round_seconds and round_seconds < max
        end
    end
    --[[
    ----------------------------------------------------------------------------------------------------------------------------------------
    	Description: Gives the start time in seconds for a prefix or suffix instruction: the Marker A or B time, or the fixed time given. For a marker, the time is taken from the current marker time while the text is empty.
    	Scope: local inside validate_presuf; called by validate_presuf
    	type: helper (prefix/suffix)
    	input type: set: string ("a", "b" or "hh:mm:ss"); text: string (the prefix or suffix currently shown)
    	returns: number: seconds, or nil
    ----------------------------------------------------------------------------------------------------------------------------------------
    ]]
    local function get_set_seconds(set, text)
        local seconds
        if set == "a" then
            if text == "" then
                presuf["text_marker_a"] = media["text_marker_a"];
            end
            seconds = get_seconds_from_timestamp(presuf["text_marker_a"]);
        elseif set == "b" then
            if text == "" then
                presuf["text_marker_b"] = media["text_marker_b"];
            end
            seconds = get_seconds_from_timestamp(presuf["text_marker_b"]);
        elseif set ~= "a" and set ~= "b" then
            seconds = get_seconds_from_timestamp(set);
        end
        return seconds
    end
    local min, max = nil, nil
    if p1 then -- nothing required, add available text
        s = get_set_seconds(p2, text_prefix_validated)
        if s ~= nil then
            if current_count_direction == "UP" then
                min = s
                if p3 ~= nil then
                    max = (s + p3)
                end
            else
                max = s
                if p3 ~= nil then
                    min = (s - p3)
                end
            end
        end
        local in_range = isSecondsInRange(min, max)
        if in_range then
            text_prefix_validated = text_prefix_cleaned
        else
            text_prefix_validated = ""
        end
    end
    min, max = nil, nil
    if s1 then -- nothing required, add available text
        s = get_set_seconds(s2, text_suffix_validated)
        if s ~= nil then
            if current_count_direction == "UP" then
                min = s
                if s3 ~= nil then
                    max = (s + s3)
                end
            else
                max = s
                if s3 ~= nil then
                    min = (s - s3)
                end
            end
        end
        local in_range = isSecondsInRange(min, max)
        if in_range then
            text_suffix_validated = text_suffix_cleaned
        else
            text_suffix_validated = ""
        end
    end
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Fires Marker A or B when the running timer reaches the marker time (once, until the timer moves past it again): starts the text colour and note-hide timers, shows the note (choosing the next group item for a group) and writes the note text and colour, colours the timer text, plays the marker media, works out the next marker time and media, starts Auto Recording, and pauses the timer if "Pause timer at Marker" is set (F9). Also updates the prefix and suffix windows.
	Scope: local; called by update_timer_display (every display update)
	type: helper (markers)
	input type: ref: string ("marker_a" or "marker_b")
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function time_mark_check(ref)
    debug_log('time_mark_check(' .. pre_dump(ref) .. ') -- function variable names:  ref ')

    if not timer_active then return end; -- only allow mark checks if the timer is active
    if overtime_active then return end;  -- F2: overtime counts up from zero; count down markers must not fire again
    --[[
	 		Make sure the trigger is as accurate as possible depending
			if the timer is counting up or down.
	]]
    local round_seconds = roundSeconds();
    local activation_time = media["activated_time_" .. ref];
    local text_marker = media["text_" .. ref];

    if activation_time == nil or text_marker == nil then
        --return;
    end; -- nothing to activate further

    if activation_time == nil or text_marker == nil then
        --return;
    end; -- nothing to activate further

    if activation_time ~= nil then
        if (current_count_direction == "UP" and activation_time < round_seconds) or (current_count_direction == "DOWN" and activation_time > round_seconds) then -- a second or more passed
            media["activated_" .. ref] = false;
        end
    else
        -- Handle the case where activation_time is nil-- For example, you could set a default value or skip the comparison
    end

    validate_presuf()

    if raw_time(round_seconds, true) == text_marker and not media["activated_" .. ref] then -- compare current time with marker
        --[[
			Only do this stuff once when first activated, prevent wastage of resources
		]]
        media["activated_" .. ref] = true;               -- signal already started
        media["activated_time_" .. ref] = round_seconds; -- signal already started

        if media["reset_text_" .. ref] ~= 0 then
            reset_marker_text_colour_start_timer(math.floor(media["reset_text_" .. ref] * 1000), ref);
        end

        if media["hide_note_" .. ref] ~= 0 then
            hide_note_start_timer(math.floor(media["hide_note_" .. ref] * 1000), ref);
        end
        --[[
			If Marker notes is enabled and the reference provided
			match to Marker A, complete some tasks
		]]
        if enable_marker_notes ~= 1 and ref == "marker_a" then -- marker notes is enabled and the input reference matches
            if media["note_source_unversioned_id_" .. ref] == "group" then
                assign_marker_note_source_name(ref)
            end

            local source_name = media["note_source_" .. ref]
            local parent_source_name = is_child_of_group(source_name)
            if parent_source_name ~= nil then
                set_visible(parent_source_name, true); -- Set visble the source for the note for marker a
            end

            set_visible(source_name, true); -- Set visble the source for the note for marker a

            if is_note_text_id(media["note_source_unversioned_id_" .. ref]) then
                if media["hide_note_marker_b"] == 0 then
                    set_visible(media["note_source_marker_b"], false); -- Set hiden the source for the note for marker b (only show one note at a time)
                end
                set_text_note_color(ref);                              -- Update the note text font to match the font colour defined for marker a
            end
        end;
        --[[
			If Marker notes is enabled and the reference provided
			match to Marker B, complete some tasks
		]]
        if enable_marker_notes ~= 1 and ref == "marker_b" then -- marker notes is enabled and the input reference matches
            if media["note_source_unversioned_id_" .. ref] == "group" then
                assign_marker_note_source_name(ref)
            end
            local source_name = media["note_source_" .. ref]
            local parent_source_name = is_child_of_group(source_name)
            if parent_source_name ~= nil then
                set_visible(parent_source_name, true); -- Set visble the source for the note for marker b
            end

            set_visible(source_name, true); -- Set visble the source for the note for marker b
            if is_note_text_id(media["note_source_unversioned_id_" .. ref]) then
                if media["hide_note_marker_a"] == 0 then
                    set_visible(media["note_source_marker_a"], false); -- Set hiden the source for the note for marker a (only show one note at a time)
                end
                set_text_note_color(ref);                              -- Update the note text font to match the font colour defined for marker b
            end
        end;
        --[[
			Update the timer text source font colour to match the defined font colour for the referenced marker
			This will ensure that the timer text font matches the font colour of the currently displayed note.
		]]
        if (enable_property_color_marker_a and ref == "marker_a") or (enable_property_color_marker_b and ref == "marker_b") then
            set_timer_text_color(media["color_" .. ref]);
        end
        --[[
			B4: the marker has fired again (activated_ re-arms once the timer has moved
			past the marker), so allow its audio to play again. Before, only Reset
			cleared this flag, so the audio played once per Reset.
		]]
        media["activated_media_" .. ref] = false;
        media["media_ended_" .. ref] = false; -- re-arm the duration limit
        start_media(media["source_name_audio_" .. ref], ref);
        --[[
			if the user wants OBS to start recording when the marker activates
			check the reference and activate the timer to initiate recording

			start_recording:

			1 = "Disabled"
			2 = "Timer Expires",
			3 = "Marker A Time",
			4 = "Marker B Time",
			5 = "Timer Visible",
			6 = "Timer Start"

			There may be more markers, if so check if there are and upddate variables
		]]
        update_time_markers(round_seconds);
        update_media_names();                         -- we don't reset because here the list must cycle

        if ref == "marker_a" then record(3, 100) end; -- an integer reference used to compare with start_recording
        if ref == "marker_b" then record(4, 100) end; -- an integer reference used to compare with start_recording
        --[[
			F9: "Pause timer at Marker A/B" (e.g. football: pause at 45:00 and 90:00).
			Stop the timer only, through activate(false): pause() would also pause the
			marker audio that was just started (e.g. a half-time whistle).
			Resuming does not fire the marker again: it has already been activated.
		]]
        if media["pause_" .. ref] and timer_active then
            --[[
				Freeze on the exact marker time: the marker fires on the first tick inside
				its second (Count Up e.g. 00:00:05,06; Count Down e.g. 00:00:04,98), and
				round_seconds is exactly the marker second. Set it before activate(false)
				so the autosave (B6) stores the exact value too.
			]]
            current_seconds = round_seconds; -- what timer_value() does; it is defined further down, so not callable here
            activate(false);
            rearm_media_limits();       -- B-068 (review): the marker audio keeps playing during a marker pause, with its limit
            marker_pause_redraw = true; -- set_time_text() already built the old text; redraw once at its end
        end
    end;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Tells whether a media source has "Loop" ticked.
	Scope: local; called by stop_looping_media
	type: helper (media)
	input type: source_name: string or nil (source name)
	returns: bool: true when it loops (false for other source types); nil for nil or ignored names
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function get_source_looping(source_name)
    debug_log('get_source_looping(' .. pre_dump(source_name) .. ') -- function variable names:  source_name ')
    local property = "looping"; -- we want to check this property setting
    if source_name == nil or in_table(ignore_list, source_name) then
        return
    end
    --[[
		Increments the source reference counter,
		use obs_source_release() to release it when complete.

		we got a source name, let's see if it exist...
	]]
    local source = obs.obs_get_source_by_name(source_name);          -- get source by name
    local enabled = false;
    if source ~= nil then                                            -- continue if we have a source
        local source_id = obs.obs_source_get_unversioned_id(source); -- get source id
        if source_id == "ffmpeg_source" then                         -- check if source id match that of type we need to focus on
            local settings = obs.obs_source_get_settings(source);    -- get source settings
            enabled = obs.obs_data_get_bool(settings, property);     -- check if media source has playback looping enabled
            obs.obs_data_release(settings);                          -- B-002: release inside the block where 'settings' exists
        end;
        obs.obs_source_release(source); -- release source
    end;
    return enabled;                 -- bool
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Does nothing now: the Marker A/B Duration is handled by a one-shot timer started with the media (marker_a/b_media_end_callback), and the natural end by the media_ended signal. Kept for stop_media.
	Scope: local; called by stop_media
	type: helper (media, no-op)
	input type: ref: string ("marker_a" or "marker_b"; not used)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function stop_media_action(ref)
    debug_log('stop_media_action(' .. pre_dump(ref) .. ') -- function variable names:  ref ')
    --[[
		Marker A/B Duration is now handled by a one-shot timer started with the audio
		(start_media_action -> marker_a/b_media_end_callback), like End Audio Duration.

		The per-tick check that used to live here never ran: it began with an inverted
		guard ('if not media_ended_ then return end'), and it watched the current Marker
		Audio list entry, which moves on to the next source as soon as the audio starts.
		Natural end of playback is still handled by the media_ended signal.
	]]
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Stops a visible media source that is playing or paused.
	Scope: local; called by stop_looping_media
	type: helper (media)
	input type: source_name: string (source name)
	returns: none
	Credit: OBS, midnight-studios
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function stop_media_playback(source_name)
    debug_log('stop_media_playback(' .. pre_dump(source_name) .. ') -- function variable names:  source_name ')

    if in_table(ignore_list, source_name) or not is_visible(source_name) then return end;

    local source = obs.obs_get_source_by_name(source_name);

    if source ~= nil then
        local source_id = obs.obs_source_get_unversioned_id(source); -- unversioned_id will not be affected by language settings
        if source_id ~= "ffmpeg_source" then obs.obs_source_release(source); return end; -- B-005: media sources only; release before returning
        local state = obs.obs_source_media_get_state(source)         -- get the current state for the source
        if state == obs.OBS_MEDIA_STATE_PLAYING or state == obs.OBS_MEDIA_STATE_PAUSED then -- B-005: was always true
            obs.obs_source_media_stop(source);
        end;
        --obs.obs_source_media_get_duration( source )
        --obs.obs_source_media_get_time( source )
        --obs.obs_source_media_restart( source )
    end;
    obs.obs_source_release(source);
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Pauses or resumes a visible media source.
	Scope: local; called by start, pause, startpause and activate_signal
	type: helper (media)
	input type: source_name: string (source name); play: bool (true: pause; false: play, as obs_source_media_play_pause)
	returns: none
	Credit: OBS, midnight-studios
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function pause_play_media(source_name, play)
    debug_log('pause_play_media(' ..
        pre_dump(source_name) .. ", " .. pre_dump(play) .. ') -- function variable names:  source_name, play ')

    if in_table(ignore_list, source_name) or not is_visible(source_name) then return end;

    local source = obs.obs_get_source_by_name(source_name);

    if source ~= nil then
        local source_id = obs.obs_source_get_unversioned_id(source); -- unversioned_id will not be affected by language settings
        if source_id ~= "ffmpeg_source" then obs.obs_source_release(source); return end; -- B-005: media sources only; release before returning
        obs.obs_source_media_play_pause(source, play);
        --obs.obs_source_media_get_duration( source )
        --obs.obs_source_media_get_time( source )
        --obs.obs_source_media_restart( source )
        --local state = obs.obs_source_media_get_state( source ) -- get the current state for the source
        --if state == obs.OBS_MEDIA_STATE_PLAYING  then
        --end
        --if state == obs.OBS_MEDIA_STATE_PAUSED  then
        --end
    end
    obs.obs_source_release(source);
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Stops a marker's media if it is set to loop, so it doesn't play on after the timer ends.
	Scope: local; called by timer_ended
	type: helper (media)
	input type: ref: string ("marker_a", "marker_b" or "marker_end")
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function stop_looping_media(ref)
    debug_log('stop_looping_media(' .. pre_dump(ref) .. ') -- function variable names:  ref ')
    local source_name = media["source_name_audio_" .. ref];

    if source_name == nil or in_table(ignore_list, source_name) then
        return
    end
    if get_source_looping(source_name) then
        stop_media_playback(source_name);
        --[[
			We don't need this because we have already
			attached a source signal hanlder for 'media_ended'
			that will hide the source if it is ended
		]]
        --set_visible( source_name, false ) -- Set the media source state to hidden.
    end
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Hides a marker's media source when bypass is set; otherwise calls stop_media_action, which does nothing now.
	Scope: local; called by set_time_text
	type: helper (media)
	input type: ref: string ("marker_a" or "marker_b"); bypass: bool or nil (true: hide the source)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function stop_media(ref, bypass)
    bypass = bypass or false;
    debug_log('stop_media(' .. pre_dump(ref) .. ", " .. pre_dump(bypass) .. ') -- function variable names:  ref, bypass ')
    if bypass then                                              -- No checks, just stop it
        set_visible(media["source_name_audio_" .. ref], false); -- Set the media source state to hidden
    else                                                        -- do some checks
        stop_media_action(ref);                                 -- handle this request elsewhere
    end
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Builds the list of scenes or sources to cycle through on expiry from the "Cycle List" setting, keeping only entries that still exist, in list order.
	Scope: local; called by reset_cycle_source_list and timer_expire_event_cycle_source_list
	type: helper (expire event)
	input type: source_type: string ("scene" or "source")
	returns: table: array of names
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function get_cycle_source_list(source_type)
    --[[
		Create a table for a list
	]]
    local list = {};                                                       -- create temporary table variable
    local item_list = {};                                                  -- A list containing the available source names
    local data_list = obs_data_array_to_table(ctx.propsSet, "cycle_list"); -- fetch obs userdata from property settings and return in table (the list source name list the user defined)
    --[[
		Create a list with either all the scene or source names
	]]
    if source_type ~= "source" then                        -- string is not equal to "source" as it should be "scene"
        local scenes = obs.obs_frontend_get_scene_names(); -- List Scenes names
        if scenes ~= nil then
            for _, scene in ipairs(scenes) do              -- cycle through list items one at a time
                item_list[scene] = scene;                  -- add scene name (string) to the table
            end
            obs.bfree(scene);                              -- free memory, release source as it is no longer needed
        end
    else                                                   -- List Source names
        local sources = get_source_list();                 -- "id" or "unversioned_id" or "display_name" or "source_name"
        for key, value in pairsByKeys(sources) do
            item_list[value] = value;
        end
    end
    --[[
		Create a clean list, compare the user name list with the available source name list
		if the source exist (it must be listed in item_list) then add it to the output list and disregard
		all other items. This will filter out all mispelled or non existent items that are listed
	]]
    for key, value in pairs(data_list) do
        if in_table(item_list, value) then
            table.insert(list, value)
        end
    end

    return list
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Shows or hides one entry of the cycle list: switches to a scene, or shows or hides a source. When shown, writes its name into the Active Source text source (and shows that source if "force visible" is ticked).
	Scope: local; called by cycle_source_list_by_source_type, cycle_source_list_by_source_name and reset_cycle_source_list
	type: helper (expire event)
	input type: source_list: table (array of names); source_type: string ("scene" or "source"); index: number (1-based entry); visible: bool (true: show this entry)
	returns: string: the entry's name, or nil if there is none at that index
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function source_list_set_by_index(source_list, source_type, index, visible)
    debug_log('source_list_set_by_index(' ..
        pre_dump(source_type) .. ', ' .. pre_dump(index) .. ') -- function variable names:  source_type, index ')
    --[[
			The list contains all available sources.
			The value targets the sources requested.
			Check if the requested source is available
		]]
    local source_name = source_list[index]

    if source_name ~= nil then
        --[[
				Type is "Scene"
			]]
        if source_type == "scene" and visible then
            frontend_set_current_scene(source_name)
        end

        if source_type == "source" then
            set_visible(source_name, visible);
        end

        if visible then -- B-008: name only the entry that is shown
            set_text(active_source, source_name);
            --[[
				force the visibility
				state of this source.
			]]
            if active_source_force_visible then
                set_visible(active_source, true)
            end;
        end
    end;

    return source_name;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Shows the cycle list entry at the current index and hides the others (scenes or sources), then moves the index on by one in the Cycle Direction, wrapping around.
	Scope: local; called by timer_expire_event_cycle_source_list
	type: helper (expire event)
	input type: source_list: table or nil (array of names); source_type: string ("scene" or "source"); ctrl_index: number (current 1-based index)
	returns: number, table: the next index and the list (the index unchanged and nil if there is no list)
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function cycle_source_list_by_source_type(source_list, source_type, ctrl_index)
    debug_log('cycle_source_list_by_source_type(' ..
        pre_dump(source_type) .. ',' .. pre_dump(ctrl) .. ') -- function variable names:  source_type ')
    if source_list == nil then
        return ctrl_index, nil
    end
    local source_name;
    for index = 1, #source_list do
        local visible = (index == ctrl_index);
        local temp_name = source_list_set_by_index(source_list, source_type, index, visible)
        if visible then source_name = temp_name end
    end;
    --[[
		1: Ascending
		2: Desceneding
		Depending on the 'cycle_direction', set the next index.
	]]
    if cycle_direction == 1 then -- B-009: Ascending steps first to last
        ctrl_index = (ctrl_index % #source_list) + 1
    else
        ctrl_index = (ctrl_index - 2 + #source_list) % #source_list + 1
    end
    return ctrl_index, source_list
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Shows the child source at the current index of a group's (or nested scene's) list and hides the others, then moves the index on by one in the Cycle Direction, wrapping around.
	Scope: local; called by timer_expire_event_cycle_source_list
	type: helper (expire event)
	input type: source_list: table or nil (array of source names); ctrl_index: number (current 1-based index)
	returns: number, table: the next index and the list (the index unchanged and nil if there is no list)
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function cycle_source_list_by_source_name(source_list, ctrl_index)
    debug_log('cycle_source_list_by_source_name(' ..
        pre_dump(source_name) .. ', ' .. pre_dump(ctrl) .. ') -- function variable names:  source_name ')
    if source_list == nil then
        return ctrl_index, nil
    end

    for index = 1, #source_list do
        local visible = (index == ctrl_index);
        source_list_set_by_index(source_list, "source", index, visible)
    end;

    --[[
		1: Ascending
		2: Desceneding
		Depending on the 'cycle_direction', set the next index.
	]]
    if cycle_direction == 1 then -- B-009: Ascending steps first to last
        ctrl_index = (ctrl_index % #source_list) + 1
    else
        ctrl_index = (ctrl_index - 2 + #source_list) % #source_list + 1
    end

    return ctrl_index, source_list
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: For a Countdown with a Source List, Auto List or Scene List expire event, hides all entries of the list (for Auto List, shows the parent and hides its children) and sets the cycle index so the next expiry starts at the first entry in the Cycle Direction.
	Scope: local; called by reset
	type: helper (expire event)
	input type: none
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function reset_cycle_source_list()
    debug_log('reset_cycle_source_list(' .. pre_dump(source_type) .. ') -- function variable names:  source_type ')

    if timer_mode ~= 2 then return end                                                                -- return if count up
    if not in_table({ "Source List", "Auto List", "Scene List" }, timer_expire_event) then return end -- return if Timer Expire Event not in range

    local source_type = (timer_expire_event == "Source List" or timer_expire_event == "Auto List") and "source" or
        "scene"

    local source_list
    if in_table({ "Source List", "Scene List" }, timer_expire_event) then
        source_list = get_cycle_source_list(source_type);
    end

    if in_table({ "Auto List" }, timer_expire_event) and not in_table(ignore_list, cycle_source_children) then
        local source_name = cycle_source_children
        source_list = list_source_children_by_source_name(source_name) -- B-010: the outer source_list (a local hid it)
        if source_list ~= nil and tableHasValue(source_list) and not in_table(ignore_list, source_name) then
            set_visible(cycle_source_children, true);
            -- Hide all children
            for _, child_name in ipairs(source_list) do
                set_visible(child_name, false);
            end
            --cycle_index, source_list = cycle_source_list_by_source_name( source_list, cycle_index );
        end
    end

    if source_list == nil then return end
    --[[
		1: Ascending
		2: Desceneding
		Set initial 'cycle_direction', then update the next index.
	]]
    if cycle_direction == 1 then -- B-009: Ascending starts so that the first expiry shows entry 1
        cycle_index = #source_list
    else
        cycle_index = 1
    end
    --[[
		Should the item be activated on reset?
		For now, it should not, because it is
		assumed it must only be active on event expire
	]]
    for index = 1, #source_list do
        --source_list_set_by_index( source_list, source_type, index, ( index == cycle_index ) )
        -- hide all
        source_list_set_by_index(source_list, source_type, index, false)
    end;
    --[[
		1: Ascending
		2: Desceneding
		Depending on the 'cycle_direction', set the next index.
	]]
    if cycle_direction == 1 then -- B-009: Ascending steps first to last
        cycle_index = (cycle_index % #source_list) + 1
    else
        cycle_index = (cycle_index - 2 + #source_list) % #source_list + 1
    end
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Tells whether a scene contains a source directly or inside one of its groups.
	Scope: local; called by activate_timer_on_scene
	type: helper (sources)
	input type: scene_name: string or nil (scene name); source_name: string (source name)
	returns: bool
	Credit: midnight-studios, et al
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function scene_name_has_source_name(scene_name, source_name)
    debug_log('scene_name_has_source_name(' ..
        pre_dump(scene_name) ..
        ", " .. pre_dump(source_name) .. ') -- function variable names:  scene_name, source_name ')
    local result = false;
    -- B-039: no current scene (OBS still loading): never look up a nil name (libobs has no NULL check there)
    if scene_name == nil then return result end
    local scene_source = obs.obs_get_source_by_name(scene_name)
    local scene = obs.obs_scene_from_source(scene_source)
    local scene_items = obs.obs_scene_enum_items(scene)

    for _, scene_item in pairs(scene_items) do
        local item_source = obs.obs_sceneitem_get_source(scene_item)
        local item_source_name = obs.obs_source_get_name(item_source)
        if item_source_name == source_name then
            result = true;
            break
        end
        local group = obs.obs_group_from_source(item_source)
        if group then
            local group_items = obs.obs_scene_enum_items(group)
            for _, group_item in pairs(group_items) do
                local group_item_source_name = obs.obs_source_get_name(obs.obs_sceneitem_get_source(group_item))
                if group_item_source_name == source_name then
                    result = true;
                    break;
                end
            end
            obs.sceneitem_list_release(group_items)
        end
    end
    obs.sceneitem_list_release(scene_items)
    obs.obs_source_release(scene_source)
    return result;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: With Timer Activation "Timer Scene Active", shows the timer source when a scene containing it becomes the current scene.
	Scope: local; called by activate_signal
	type: helper (activation)
	input type: source: obs_source (the source that was activated); activating: bool (true when it became active)
	returns: none
	Credit: midnight-studios, et al
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function activate_timer_on_scene(source, activating)
    debug_log('activate_timer_on_scene(' ..
        pre_dump(source) .. ", " .. pre_dump(activating) .. ') -- function variable names:  source, activating ')
    --[[
				Reset to starting point
				if, timer_activation == 2 then set to visible
		]]
    if timer_activation == 3 and activating then
        local source_id = obs.obs_source_get_id(source);
        local current_scene_name = frontend_get_current_scene()
        if source_id == "scene" then
            if scene_name_has_source_name(current_scene_name, timer_source) then
                set_visible(timer_source, true); -- B-031 (review): only items still hidden change
            end;
        end;
    end;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Writes an integer setting into the script's settings (used to count the Add and Subtract presses).
	Scope: local; called by sec_add_1_update to sec_add_3_update and sec_sub_1_update to sec_sub_3_update
	type: helper (settings)
	input type: reference: string (setting name); value: number
	returns: bool: true
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function update_properties_setting_int(reference, value)
    debug_log('update_properties_setting_int(' ..
        pre_dump(reference) .. ", " .. pre_dump(value) .. ') -- function variable names:  reference, value ')
    --[[
		When this is updated it will trigger a
		callback "property_onchange", let's
		disable that for a moment.
	]]
    --prevent_callback = true;

    obs.obs_data_set_int(ctx.propsSet, reference, value);
    --[[
		No obs_properties_apply_settings( ctx.propsDef, ... ) here: this runs from hotkeys,
		and ctx.propsDef is destroyed when the Scripts dialog closes (B3). Writing to
		ctx.propsSet is enough; it is saved and read back by load_settings_globals().
	]]
    --[[
		When this is updated it will trigger a
		callback "property_onchange", let's
		enable it again
	]]
    --prevent_callback = false;

    return true
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Stores the current time in the "sw_current_seconds" setting and its global, with property callbacks held off while it writes.
	Scope: local; called by default_timer_globals and on_event
	type: helper (settings)
	input type: value: number (seconds)
	returns: bool: true
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function update_prop_settings_current_seconds(value)
    debug_log('update_prop_settings_current_seconds(' .. pre_dump(value) .. ') -- function variable names:  value ')
    --[[
		When this is updated it will trigger a
		callback "property_onchange", let's
		disable that for a moment.
	]]
    prevent_callback = true;

    obs.obs_data_set_double(ctx.propsSet, "sw_current_seconds", value);
    sw_current_seconds = value;
    --[[
		No obs_properties_apply_settings( ctx.propsDef, ... ) here: this runs from reset()
		and FINISHED_LOADING, when the Scripts dialog may be closed and ctx.propsDef
		destroyed. That caused "Failed to call timer_cb" and Reset working only with
		the panel open (B3, GitHub #21).
	]]
    --[[
		When this is updated it will trigger a
		callback "property_onchange", let's
		enable it again
	]]
    prevent_callback = false;

    return true;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Sets the timer's current time (current_seconds).
	Scope: local; called throughout the timer code
	type: helper (timer)
	input type: value: number (seconds)
	returns: number: the new current time
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function timer_value(value)
    debug_log('timer_value(' .. pre_dump(value) .. ') -- function variable names:  value ')

    current_seconds = value;

    return current_seconds;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Advances the time by one tick: up for Count Up (or after a direction change to up), down for Countdown (or after a change to down).
	Scope: local; called by timer_callback
	type: helper (timer)
	input type: none
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function set_time_direction()
    debug_log('set_time_direction() -- function variable names:  ')
    --[[

	]]
    local t = 0;
    --[[

	]]
    if direction_changed then                       -- normal function suspended
        if current_count_direction == "UP" then
            t = (current_seconds + time_frequency); -- value
        else
            t = (current_seconds - time_frequency); -- value
        end
    else                                            -- normal function active
        --[[
		]]
        if timer_mode ~= 2 then
            t = (current_seconds + time_frequency); -- value
        else
            t = (current_seconds - time_frequency); -- value
        end
    end
    --[[
		update the timer value
	]]
    timer_value(t); -- value
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Writes the time text into the timer source; first restores the normal text colour once if no marker media is active, and runs the Marker A and B checks.
	Scope: global; called by set_time_text
	type: helper (display)
	input type: source_name: string or nil (the timer source); text: string (the time text)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
function update_timer_display(source_name, text)
    debug_log('update_timer_display(' ..
        pre_dump(source_name) .. ", " .. pre_dump(text) .. ') -- function variable names:  source_name, text ')
    --[[
		Increments the source reference counter,
		use obs_source_release() to release it when complete.
	]]
    if source_name == nil or in_table(ignore_list, source_name) then
        return
    end
    local source = obs.obs_get_source_by_name(source_name);
    if source ~= nil then
        local settings = obs.obs_source_get_settings(source);
        if settings ~= nil then
            -- B-053: no colour to write when the normal colour is unknown (source not readable yet)
            if not media["activated_media_marker_a"] and not media["activated_media_marker_b"] and not color_normal_updated and media["color_normal"] ~= nil then
                --[[
					Operating compatibility MacOSX / Windows
					The settings key for color
					Win = "color"
					Mac = "color2" and "color3"
				]]
                obs.obs_data_set_int(settings, "color", media["color_normal"]);  -- compatibility for settings transfer
                obs.obs_data_set_int(settings, "color1", media["color_normal"]); -- update source settings
                obs.obs_data_set_int(settings, "color2", media["color_normal"]); -- update source settings
                color_normal_updated = true;
                script_colour_showing = false; -- B-067 (review): the normal colour is showing again
            end
            time_mark_check("marker_a");
            time_mark_check("marker_b");
            obs.obs_data_set_string(settings, "text", text);
            -- B-001: update and release inside the block where the local 'settings' exists
            -- (after the block the name meant an unassigned global, so one reference leaked per redraw)
            obs.obs_source_update(source, settings);
            obs.obs_data_release(settings);
        end
        obs.obs_source_release(source);
    end
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: With the "Toggle Milliseconds" trigger enabled in Countdown, toggles the hundredths (shown to hidden, or hidden to shown) once, when the time plus one second matches the trigger value.
	Scope: local; called by set_time_text (while running)
	type: helper (display)
	input type: none
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function toggle_mili()
    debug_log('toggle_mili() -- function variable names: ')
    if not enable_property_toggle_mili_trigger then return end
    --[[
		This feature will only activate if "Trigger Value" is defined
		and if "Trigger Value" matches "Current Time" and if
		"Timer Type" is "Count Down"
	]]
    if toggle_mili_trigger ~= "" and timer_mode == 2 and not mili_toggle_triggered then
        local time_offset = 1; -- offset by 1 second to allow user to achieve accurate setting
        if raw_time((current_seconds + time_offset), true) == toggle_mili_trigger then
            --[[
				The action trigger a toggle, so if the
				active state at the time of the trigger
				is "Show" the toggle will "Hide" and
				Vicas Versa.
				Should we force a state?
				To force define: show_mili = false
			]]
            mili(true);
            mili_toggle_triggered = true;
        end;
    end;
    --return true
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Builds and shows the timer text for the current time: clamps a finished countdown to 0, applies the time format (formats 1-5, the days text for a date countdown), the prefix and suffix and the overtime "+", and writes it to the timer source when it changed. When the time reaches 0 it hides text notes and starts overtime or ends the timer. Redraws once after a marker pause.
	Scope: local; called by timer_callback, update_timer_settings, set_stopwatch, mili, the Add/Subtract updates, init and script_update, and by itself (redraw)
	type: helper (display)
	input type: source_name: string or nil (the timer source)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function set_time_text(source_name)
    debug_log('set_time_text(' .. pre_dump(source_name) .. ') -- function variable names:  source_name ')
    --[[
		First Check we have a source reference
	]]
    if source_name == nil or in_table(ignore_list, source_name) then
        return
    end
    --[[
		Force absolute zero at this point
	]]
    if current_seconds <= 0.01 and not overtime_active and (timer_mode ~= 1 or (direction_changed and current_count_direction == "DOWN" and prevent_negative_time)) then -- F2: not while counting overtime up from zero
        timer_value(0); -- value, update_settings
    end;

    if timer_active then toggle_mili(); end              -- careful becuase this could cause a stack overflow (death loop)
    local display_seconds = countdown_display_seconds(); -- F8: may be rounded up; markers still use current_seconds
    local l_time = long_time(display_seconds);
    local t_time = raw_time(display_seconds);
    --[[
		Timer Format Type: Full Format
	]]
    local text = tostring(raw_time(display_seconds));
    --[[
		Timer Format Type: Remove Leading Zeros
	]]
    if timer_format == 2 then
        local system_time_format = "$T$H:$M:$S,$F";
        text = format_time((l_time ~= 0) and string.format("%s:%s", l_time, t_time) or string.format("%s", t_time),
            system_time_format, display_seconds);
    end
    --[[
		Timer Format Type: No Leading Zeros, No Split Seconds
	]]
    if timer_format == 3 then
        local system_time_format = "$T$H:$M:$S";
        text = format_time((l_time ~= 0) and string.format("%s:%s", l_time, t_time) or string.format("%s", t_time),
            system_time_format, display_seconds);
    end
    --[[
		Timer Format Type: No Leading Zeros, No Split Seconds
	]]
    if timer_format == 4 then
        local system_time_format = "$H:$M:$S";
        text = format_time((l_time ~= 0) and string.format("%s:%s", l_time, t_time) or string.format("%s", t_time),
            system_time_format, display_seconds);
    end

    if timer_format ~= 5 then
        --[[
			Format the Text "Day/Days"
		]]
        if timer_mode == 2 and countdown_type == 1 and current_seconds ~= 0 then
            local longtimetext = longtimetext_p;
            if math.floor(current_seconds / 86400) <= 1 then
                longtimetext = longtimetext_s;
            end
            if math.floor(current_seconds / 86400) <= 0 then
                longtimetext = longtimetext_p;
            end
            text = string.gsub(longtimetext .. text, "[#]", long_time(current_seconds));
        end
    end
    --[[
		Timer Format Type: Custom Time Format
	]]

    if timer_format == 5 then
        text = format_time((l_time ~= 0) and string.format("%s:%s", l_time, t_time) or string.format("%s", t_time),
            clean_time_format(custom_time_format), display_seconds);
    end

    if timer_mode ~= 2 then
        --text_prefix = ""
        --   text_suffix = ""
    end
    validate_presuf(); -- B-026: decide the prefix / suffix for the time shown now, not one tick late
    if not enable_property_text_prefix then text_prefix_validated = "" end
    if not enable_property_text_suffix then text_suffix_validated = "" end
    if overtime_active and overtime_style then text = "+" .. text end -- F2
    text = text_prefix_validated .. text .. text_suffix_validated;
    if text ~= last_text then
        update_timer_display(timer_source, text);
    end
    --[[
		Check is media is playing and stop if required
	]]
    stop_media("marker_a");
    stop_media("marker_b");
    last_text = text;
    --[[
		Timer Ended
	]]
    local epsilon = 0.0001 -- tolerance value
    if math.abs(current_seconds) <= epsilon and not overtime_active and (timer_mode ~= 1 or (direction_changed and current_count_direction == "DOWN" and prevent_negative_time)) then
        --[[
			Timer is shutting down, this would be a
			good time to reset some items.
		]] --
        if enable_marker_notes ~= 1 then
            set_visible(media["note_source_marker_a"], false);
            set_visible(media["note_source_marker_b"], false);
        end
        --[[
			Timer was started and now has EXPIRED
			execute any final instructions that
			the user require on TIMER END
		]] --
        if timer_active and timer_mode == 2 and timer_expire_event == "OVERTIME" then
            start_overtime(); -- F2: keep running and count up instead of ending
        elseif timer_active then
            timer_ended(source_name);
        end;
        --[[
			Now remove the timer callback

			"timer_ended()" offer options to
			restart the timer and may define
			a value to "current_seconds".

			Final check, if current_seconds == 0 then
			deactivate (end/remove) the timer callback

			This is a fallback but should not be needed
			as the timer callback may be removed by
			timer_ended() if needed
		]] --
        if math.abs(current_seconds) < epsilon and not overtime_active then
            timer_expired = true
        end;
    end
    --[[
		F9: a marker paused the timer and snapped it to the exact marker time during
		this call, after the text above was built. Redraw once to show the exact time.
	]]
    if marker_pause_redraw then
        marker_pause_redraw = false;
        set_time_text(source_name);
    end
    --return true
end
--[[
	B-025: the running time of this run (the sum of the timer's ticks, whichever
	way it counts, overtime included; Add / Subtract and Set don't count), and
	its value at each split. Reset clears both.
]]
local split_run_elapsed = 0;
local split_elapsed = {};
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Builds the split list text from the recorded splits, as intervals, marks, or both in the order the Split Type sets, numbered with a heading.
	Scope: local; called by activate and split_time
	type: helper (splits)
	input type: none
	returns: none (sets split_data)
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function split_unpack()
    debug_log('split_unpack() -- function variable names: ')
    local data = nil;
    local c = table.getn(split_itm);
    local text = "";
    local title = "";
    local subtitle = "";
    local line = "______________________________";
    for i = 1, c do
        local mark = split_itm[i];
        --[[
			B-025: an interval is the running time that passed since the previous
			split (the first one: since the start of the run).
		]]
        local interval = (split_elapsed[i] or 0) - (split_elapsed[i - 1] or 0);
        --[[
			"Interval"			= 1
			"Mark"				= 2
			"Mark Interval"		= 3
			"Interval Mark"		= 4

		]]
        if split_type == 1 then
            title = "Interval";
            --subtitle = ""
            text = tostring(raw_time(interval));
        elseif split_type == 2 then
            title = "Mark";
            --subtitle = ""
            text = tostring(raw_time(mark));
        elseif split_type == 3 then
            title = "Mark                     ";
            subtitle = "Interval";
            text = tostring(raw_time(mark) .. "          " .. raw_time(interval));
        else --	"Interval Mark"
            title = "Interval                  ";
            subtitle = "Mark";
            text = tostring(raw_time(interval) .. "          " .. raw_time(mark));
        end;
        -- data collection here
        local n = i --formatting the index number
        if i < 10 then n = "0" .. tostring(i) end;
        if data ~= nil then
            data = data .. "\n" .. n .. " )    " .. text;
        else
            data = "#       " .. title .. subtitle .. "\n" .. line .. "\n\n" .. n .. " )    " .. text;
        end
    end -- end for
    split_data = data;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Tells whether the Timer Expire Event cycles a list (Source List, Scene List or Auto List), so a countdown restarts from its default time.
	Scope: local; called by update_timer_settings
	type: helper (expire event)
	input type: none
	returns: bool
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function update_default_time()
    debug_log('update_default_time() -- function variable names: ')
    if timer_expire_event == "Source List" or timer_expire_event == "Scene List" or timer_expire_event == "Auto List" then
        return true;
    end
    return false;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Writes the split list into the split text source when it changed, and also to a "-split-time" text file if "Export Split Time" is ticked.
	Scope: local; called by default_timer_globals, activate, reset and split_time
	type: helper (splits)
	input type: source_name: string or nil (the split source)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function set_split_text(source_name)
    debug_log('set_split_text(' .. pre_dump(source_name) .. ') -- function variable names:  source_name ')
    if source_name == nil or in_table(ignore_list, source_name) then
        return
    end
    local text = split_data;
    if text ~= last_split_data then
        set_text(source_name, text);
        if backup_split_time then
            write_to_file('.txt', text, '-split-time')
        end
    end
    last_split_data = text;
end
local user_reset_in_progress = false; -- B-037: set by reset() while a user (button / hotkey) Reset runs
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Puts the timer's run state back to the start: on a reset, Count Up goes to 0 (and the saved time too for a user Reset, B-037) and the marker flags are cleared; always clears the splits, cycle counts and pause carry-over, sets a new start time and hides the text notes.
	Scope: local; called by update_timer_settings
	type: helper (timer)
	input type: set_to_default: bool or nil (true on a reset)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function default_timer_globals(set_to_default)
    debug_log('default_timer_globals(' .. pre_dump(set_to_default) .. ') -- function variable names:  set_to_default ')

    --[[
		if set_to_default == true
		and timer_mode == 2	(Count Down)
	]]
    if set_to_default then
        --[[
			Used for source cycling
			default_seconds: Default Seconds
			the default timer state
			This is the state of the timer that will set or
			reset the time ( current_seconds )
			If the timer expires because current_seconds == 0,
			then the time ( current_seconds ) will be be restarted
			from default_seconds for another function such as source cycling.
			Every instance that a timer time is defined, we must record it to default_seconds
			THIS WILL UPDATE current_seconds to the value current_seconds
		]]
        --if set_to_default and timer_mode == 2 and update_default_time() then
        --timer_value( default_seconds )	 -- value, update_settings
        --end
        --[[
			If timer is Count Up type and user pressed "reset" the timer must always be reset to zero
		]]
        if timer_mode == 1 and reset_activated then
            timer_value(0);
            if user_reset_in_progress then
                update_prop_settings_current_seconds(0); -- B-037: only a user Reset clears the autoload time
            end
        end
        color_normal_updated              = false;
        media["activated_media_marker_a"] = false;
        media["activated_media_marker_b"] = false;
        media["activated_marker_a"]       = false;
        media["activated_marker_b"]       = false;
        media["activated_time_marker_a"]  = 0;
        media["activated_time_marker_b"]  = 0;
    end
    timer_expired = true;
    completed_cycles = 0;
    split_count = 0;
    split_itm = {};
    split_data = nil;
    split_run_elapsed = 0; -- B-025
    split_elapsed = {};
    pause_carry_ns = 0;    -- B-015: a Reset discards the time a pause cut off
    set_split_text(split_source);
    orig_time = obs.os_gettime_ns();
    if is_note_text_id(media["note_source_unversioned_id_marker_a"]) then
        set_visible(media["note_source_marker_a"], false);
    end
    if is_note_text_id(media["note_source_unversioned_id_marker_b"]) then
        set_visible(media["note_source_marker_b"], false);
    end
    --[[
		-- TODO hide all note sources if nested in group
		-- TODO do we need to show the group here?

	]]
    if media["note_source_unversioned_id_marker_a"] == "group" then
        -- TODO set_visible( media["note_source_marker_a"], false );
    end
    if media["note_source_unversioned_id_marker_b"] == "group" then
        -- TODO set_visible( media["note_source_marker_b"], false );
    end
    mili_toggle_triggered        = false;
    media["last_state_marker_a"] = obs.OBS_MEDIA_STATE_NONE;
    media["last_state_marker_b"] = obs.OBS_MEDIA_STATE_NONE;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: With the "Toggle Milliseconds" trigger enabled in Countdown, sets the hundredths back to their state before the trigger: hidden if a trigger value is set, shown otherwise.
	Scope: local; called by update_timer_settings and script_update
	type: helper (display)
	input type: none
	returns: none (true outside Countdown)
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function reset_mili()
    debug_log('reset_mili() -- function variable names:  ')
    if not enable_property_toggle_mili_trigger then return end
    if timer_mode ~= 2 then
        return true;
    end
    --[[

		Is the "Trigger Value" defined
		and is "Timer Type" set to "Count Down"

	]]
    if toggle_mili_trigger ~= "" then
        show_mili = false;
    else
        show_mili = true;
    end
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Applies the timer settings: Count Up goes to 0 on a mode change or an Auto reset; Countdown takes its time from the date or from hours, minutes and seconds (when the timer is idle and expired, cycles a list, or the mode changed), stores it as the default time, goes back to the default time on a reset, and leaves overtime. Then resets the run state and redraws the text.
	Scope: local; called by reset, activate_signal, switch_to_expire_scene and script_update
	type: helper (timer)
	input type: set_to_default: bool or nil (true on a reset); new_settings: obs_data or nil (default: the script's settings)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function update_timer_settings(set_to_default, new_settings) -- optional inputs: set_to_default(bool), new_settings(obs_property_data/obs_userdata)
    debug_log('update_timer_settings(' ..
        pre_dump(set_to_default) ..
        ", " .. pre_dump(new_settings) .. ') -- function variable names:  set_to_default, new_settings ')
    local update_timer_display = false;
    set_to_default = set_to_default or false;    -- incase not defined, set default
    new_settings = new_settings or ctx.propsSet; -- incase not defined, set default
    --[[

	]]
    reset_mili();
    --[[

		STOPWATCH

		We will look at some tasks if the timer mode is set to stopwatch

		Count Up must always be reset to zero
		unless if the time is loaded from a previous session
	]]
    if timer_mode == 1 then
        update_timer_display = true;
        --[[
			In case the mode is switched, always start with a reset of the timer time
		]]
        if timer_mode_changed or timer_reset == 2 then timer_value(0) end; -- value, update_settings
        --[[
			We may require timer globals to be reset to defaults
		]]
        default_timer_globals(set_to_default);
    end
    --[[
		COUNTDOWN

		We will look at some tasks if the timer mode is set to countdown
	]]
    if timer_mode == 2 then
        --[[
			In case the mode is switched, always start with a reset of the timer time
		]]
        if timer_mode_changed then timer_value(0) end; -- value, update_settings

        update_timer_display = true;
        --[[
			Count Down and a specific date.
			The specific date will be converted
			to seconds.
		]]
        local calculated_time = 0;

        if countdown_type == 1 then
            calculated_time = (delta_time(timer_year, timer_month, timer_day, timer_hours, timer_minutes, timer_seconds));
            timer_value(calculated_time);
        else
            calculated_time = (
                (obs.obs_data_get_int(new_settings, "hours") * 60 * 60) +
                (obs.obs_data_get_int(new_settings, "minutes") * 60) +
                obs.obs_data_get_int(new_settings, "seconds")
            );
        end
        --[[
			This setting must only be applied in the following conditions:

			1)	 When the timer is resting and the user is setting a new time.

			2)	The timer completed a cycle and needs to be rest to start the next cycle.
				This will only be required if the "next scene" is set to 'source list' or 'scene list'

		]]
        local do_update =
            (
                timer_expired
                and
                not timer_active
                and
                not activated
                and
                not set_to_default
                or
                in_table({ "Source List", "Scene List", "Auto List" }, timer_expire_event)
                or
                timer_mode_changed
            );
        --[[

		]]
        if do_update then
            --[[
				update timer time
			]]
            timer_value(calculated_time); --
            --[[
					Used for countdown only
					NB: This must always be called

					last in this routine so that
					current_seconds can be updated first
					Used for source cycling
					default_seconds: Default Seconds
					the default timer state
					This is the state of the timer that will set or
					reset the time ( current_seconds )
					If the timer expires because current_seconds == 0,
					then the time ( current_seconds ) will be be restarted
					from default_seconds for another function such as source cycling.
					Every instance that a timer time is defined, we must record it to default_seconds
					In this instance a Setting may be updated, so update default_seconds
			]]
            default_seconds = current_seconds;
        end
        --[[
				*Used when timer has been reset

				*Used for source cycling

				default_seconds: Default Seconds

				the default timer state

				This is the state of the timer that will set or
				reset the time ( current_seconds )

				If the timer expires because current_seconds == 0,
				then the time ( current_seconds ) will be be restarted
				from default_seconds for another function such as source cycling.

				Every instance that a timer time is defined, we must record it to default_seconds

				THIS WILL UPDATE current_seconds to the value current_seconds
			]]
        if set_to_default and update_default_time() or reset_activated or (timer_reset == 2 and set_to_default) then
            --[[
				update timer time
			]]
            timer_value(default_seconds); -- value
            --[[
				F2: back at the count down start time, so overtime is over: count down again
			]]
            if overtime_active then
                overtime_active = false;
                direction_changed = false;
                count_orientation = "NORMAL";
                current_count_direction = "DOWN";
                color_normal_updated = false; -- let the display restore the normal colour
            end
        end
        --[[
			We may require timer globals to be reset to defaults
		]]
        default_timer_globals(set_to_default);
    end
    --[[
		At this stage the timer display may need to be update
	]]
    if update_timer_display then
        --[[
			update timer display
		]]
        set_time_text(timer_source);
    end
    update_timer_display = false;
end
--[[
	B-071: the main timer callback stays installed while the script is loaded.
	Pause / Reset / expiry only clear timer_active, and the callback then returns
	at once. Removing it from a hotkey callback could race OBS's lua_tick (OBS
	calls a timer that was just removed: "attempt to call a nil value").
	OBS removes it when the script unloads.
]]
local main_timer_installed = false;
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: The main timer tick: measures the real time since the last tick, adds it to the split interval, moves the time on, autosaves a Count Up time, and redraws the timer text. Does nothing while the timer is stopped.
	Scope: local; a timer callback added once by start_timer (every timer_cycle ms)
	type: timer callback
	input type: none
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function timer_callback()
    if not timer_active then return end -- B-071: paused / stopped: no work per tick
    debug_log('timer_callback() -- function variable names: ')
    time_frequency = get_frequency(ns_last);
    split_run_elapsed = split_run_elapsed + time_frequency; -- B-025: running time for split intervals
    set_time_direction();
    completed_cycles = completed_cycles + 1; -- we just keeping track of these for debugging, if needed.
    autosave_timestamp(false);               -- B6: throttled to once every 30 seconds
    --[[
			We need to update the timer display here to create the timer animation,
			technically the timer updates the text source every x seconds to create
			the animation effect.
	]]
    set_time_text(timer_source);
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Stops the timer counting and keeps the part of the tick a pause cut off, so the next start continues from it.
	Scope: local; called by activate
	type: helper (timer)
	input type: none
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function end_timer()
    debug_log('end_timer() -- function variable names: ')
    if timer_active then -- B-015: keep the running time since the last tick
        pause_carry_ns = math.max(0, obs.os_gettime_ns() - ns_last);
    end
    timer_active = false; -- B-071: the callback stays installed and does nothing while inactive
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Starts the timer counting: triggers Auto Recording "Timer Start", restarts the tick clock (with the time a pause cut off), forces a redraw, and installs the main timer callback the first time.
	Scope: local; called by activate
	type: helper (timer)
	input type: none
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function start_timer()
    debug_log('start_timer() -- function variable names: ')
    record(6, 100);                         -- wait 100 miliseconds
    ns_last = obs.os_gettime_ns() - pause_carry_ns; -- B-015: the first tick measures from Start (plus the time a pause cut off)
    pause_carry_ns = 0;
    last_text = tostring(obs.os_gettime_ns()); -- B-062: the first tick redraws and checks the markers, even if the text is unchanged
    timer_active = true;
    if not main_timer_installed then        -- B-071: install once, never removed while the script is loaded
        timer_add(timer_callback, timer_cycle); --<- milliseconds
        main_timer_installed = true;
    end
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Starts or stops the timer. Starting (not while the script is disabled) clears the expired state and a waiting expire-scene switch, recalculates a date countdown, starts counting and resumes the suspended marker timers. Stopping writes the split list, suspends and stops the marker timers, stops counting and autosaves the time if it was running.
	Scope: local (declared in advance); called by time_mark_check, start, pause, startpause, reset, activate_signal, timer_ended and script_update
	type: helper (timer)
	input type: activating: bool (true: start; false: stop)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
function activate(activating) -- assigns the forward-declared local (F9)
    debug_log('activate(' .. pre_dump(activating) .. ') -- function variable names:  activating ')
    --[[
		We skip/cancel anything requested if the
		Script was disabled by the user.
		B-042: stopping is still allowed, so Disable Script can pause a running timer.
	]]
    if disable_script and activating then
        return;
    end

    if timer_active and not activating then
        --[[
		]]
        split_unpack();
        --[[
		]]
        set_split_text(split_source);
    end
    --[[
		Pass the activating state to a global
		variable, as this wil be used in other
		instances.
	]]
    activated = activating;
    --[[

		activating will be TRUE or FALSE
		if TRUE create a TIMER (Callback)

	]]
    if activating then
        --[[
			if timer is activating, it has not expired
		]]
        timer_expired = false;
        --[[
			Once the timer started, this setting will default
		]]
        set_timer_activated = false;
        --[[
			B-017: a countdown to a date and time takes its remaining time from the
			wall clock at every Start and resume, so a late Start or a pause doesn't
			move the end time (a pause freezes the display; resume jumps to the
			real remaining time).
		]]
        pending_expire_scene = nil; -- B-063: a new run cancels a scene switch still waiting for the expiry audio
        if timer_mode == 2 and countdown_type == 1 and not overtime_active and not direction_changed then
            timer_value(delta_time(timer_year, timer_month, timer_day, timer_hours, timer_minutes, timer_seconds));
            pause_carry_ns = 0; -- B-015: the wall clock already includes the time the pause cut off
        end
        start_timer(); -- Timer now initiated
        resume_marker_timers(); -- continue any marker colour / note timers a pause interrupted
        --[[
			STOP TIMER REQUIRED
		]]
    else
        --[[

			Timer ENDED (EXPIRED) or
			PAUSED
		]]
        suspend_marker_timers(); -- keep their remaining time before removing them below
        reset_text_a_colour_end_timer();
        reset_text_b_colour_end_timer();
        hide_note_a_colour_end_timer();
        hide_note_b_colour_end_timer();

        local was_running = timer_active;                            -- B6: only a running timer that stops is worth saving
        --[[
			B-011 (decision 2026-10-09): marker audio still playing at expiry is allowed
			to finish. The former "timer expired, reset media" branch here never ran on
			an expiry (timer_expired is only already true on a Reset of a running timer,
			and reset() hides the marker audio itself).
		]]
        end_timer();                                                 -- Removing the callback stops the timer
        if was_running then autosave_timestamp(true) end             -- B6: save the time on pause / stop
        --[[
			update_timer_settings:

			timer_mode: countdown only

			timer_active: timer not running

			define > set_to_default: (false) * we are receiving new settings, so we do not want to set the settings to default.
			define > new_settings: not required here because we will use the global (ctx.propsSet)

			purpose: User is changing the countdown time settings and we need to provide instant feedback output to the timer display (timer text source)
		]]
        if not timer_active then -- update timer display when the timer settings changed
            --update_timer_settings( false ) -- optional inputs: set_to_default(bool), new_settings(obs_property_data/obs_userdata) < BUG
        end;
    end;

    debug_log('END of function activate()') -- function variable names:  activating ' )
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Start action: shows the timer source, starts the timer if it isn't running, and resumes or pauses the playing marker media to match. Ignored while the script is disabled and on key release.
	Scope: local; called by hotkey_send_start, start_button_clicked, init, on_event and the Timer Activation handlers
	type: helper (timer control)
	input type: pressed: bool (true on key down or click)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function start(pressed)
    if disable_script then return end -- B-043: Disable Script ignores user input
    debug_log('start(' .. pre_dump(pressed) .. ') -- function variable names:  pressed ')
    if not pressed then
        return;
    end
    --[[
		Set timer source  visibility to visible
	]]
    set_visible(timer_source, true);

    if not timer_active and activated == false then
        activate(true);
    end;
    -- B-072: act on the marker audio the script is playing (nil once it ended: nothing to pause or resume; REV6)
    pause_play_media(media["playing_audio_marker_a"], not timer_active);
    pause_play_media(media["playing_audio_marker_b"], not timer_active);
    return;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Pause action: shows the timer source and stops the timer; if it is already stopped, suspends the marker media limits. Then pauses or resumes the playing marker media to match. Ignored while the script is disabled and on key release.
	Scope: local; called by timer_activation_source_activate_signal and on_event
	type: helper (timer control)
	input type: pressed: bool (true on key down or click)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function pause(pressed)
    if disable_script then return end -- B-043: Disable Script ignores user input
    debug_log('pause(' .. pre_dump(pressed) .. ') -- function variable names:  pressed ')
    if not pressed then
        return;
    end
    --[[
		Set timer source  visibility to visible
	]]
    set_visible(timer_source, true);

    if timer_active then
        activate(false);
    else
        suspend_media_limits(); -- B-068 (re-review): already stopped, but the audio is paused now
    end;
    pause_play_media(media["playing_audio_marker_a"], not timer_active);
    pause_play_media(media["playing_audio_marker_b"], not timer_active);
    return;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Start/Pause toggle: shows the timer source and stops a running timer, or starts a stopped one (unless "Split Start Pause Button" is ticked and it isn't forced, in which case the media limits are suspended). Then pauses or resumes the playing marker media to match. Ignored while the script is disabled and on key release.
	Scope: local; called by hotkey_send_start, hotkey_send_pause, pause_button_clicked and timer_expire_event_cycle_source_list
	type: helper (timer control)
	input type: pressed: bool (true on key down or click); force_activate: bool or nil (true: start even when Start and Pause are split)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function startpause(pressed, force_activate)
    if disable_script then return end -- B-043: Disable Script ignores user input
    debug_log('startpausepause(' .. pre_dump(pressed) .. ') -- function variable names:  pressed ')
    if not pressed then
        return;
    end
    force_activate = force_activate or false
    --[[
		Set timer source  visibility to visible
	]]
    set_visible(timer_source, true); -- B-031 (review): is_visible means "in any scene"; set_visible only changes hidden items

    if timer_active then
        activate(false);
    else
        if activated == false and (not split_startpause or force_activate) then
            activate(true);
        else
            suspend_media_limits(); -- B-068 (re-review): stays stopped, but the audio is paused below
        end;
    end;
    pause_play_media(media["playing_audio_marker_a"], not timer_active);
    pause_play_media(media["playing_audio_marker_b"], not timer_active);
    return;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Start hotkey: Start when "Split Start Pause Button" is ticked, otherwise Start/Pause.
	Scope: local; registered by assign_hotkeys as the hotkey "Start (Start/Pause if not split)"
	type: hotkey handler
	input type: pressed: bool (true on key down, false on key up)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function hotkey_send_start(pressed)
    debug_log('hotkey_send_start(' .. pre_dump(pressed) .. ') -- function variable names:  pressed ')
    --[[
		For hotkeys: This is called on key down & key up. A bool check:

		pressed = true (key down)
		pressed = false (key up)

		When a hotkeys is pressed the callback checks if the key state
		is currently pressed 'true' or 'false' (released)
		so a hotkey key press has a dual function: key down, key up
	]]
    if pressed then -- key is currently down
        --return -- uncomment 'return' to ignore the call while key is down
    else            -- key was released
        return;     -- uncomment 'return' to ignore the call when key is released
    end;
    if split_startpause then
        start(pressed);
    else
        startpause(pressed);
    end
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Pause hotkey: Start/Pause.
	Scope: local; registered by assign_hotkeys as the hotkey "Pause (Start/Pause if not split)"
	type: hotkey handler
	input type: pressed: bool (true on key down, false on key up)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function hotkey_send_pause(pressed)
    debug_log('hotkey_send_pause(' .. pre_dump(pressed) .. ') -- function variable names:  pressed ')
    --[[
		For hotkeys: This is called on key down & key up. A bool check:

		pressed = true (key down)
		pressed = false (key up)

		When a hotkeys is pressed the callback checks if the key state
		is currently pressed 'true' or 'false' (released)
		so a hotkey key press has a dual function: key down, key up
	]]
    if pressed then -- key is currently down
        --return -- uncomment 'return' to ignore the call while key is down
    else            -- key was released
        return;     -- uncomment 'return' to ignore the call when key is released
    end;
    startpause(pressed);
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Sets the timer to the saved time from the panel (days, hours, minutes, seconds, hundredths) and redraws it. With a Custom Time Format minute or hour unit, values outside the unit are adjusted and a warning is logged.
	Scope: local; called by hotkey_send_set and sw_saved_button_clicked
	type: helper (timer control)
	input type: none
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function set_stopwatch()
    debug_log('set_stopwatch() -- function variable names: ')
    pause_carry_ns = 0; -- B-015: a Set discards the time a pause cut off
    local dd = (sw_days_saved * 86400)
    local hh = (sw_hours_saved * 3600);
    local mm = (sw_minutes_saved * 60);
    local ss = (sw_seconds_saved);
    --[[
		Custom minute unit ({M90}, {$M200}): the display shows $M as TOTAL minutes
		modulo the unit, not minutes within the hour. So MM is read the same way:
		use the total-minute count whose remainder is MM and whose hours are
		closest to HH (exact when such a count exists).
		Example {M90}: HH=1, MM=89 becomes 89 minutes and displays 01:89:00
		(nested HH*60+MM would have given 149 minutes and displayed 02:59:00).
	]]
    if minute_unit ~= nil and timer_format == 5 then -- B-023: the unit only applies to the custom format
        --[[
			The MM input accepts 0-9999 (Option A, no unit-based limits), so a value
			at or above the unit cannot be a remainder: wrap it and say so.
		]]
        local wanted_minutes = sw_minutes_saved % minute_unit;
        if wanted_minutes ~= sw_minutes_saved then
            obs.script_log(obs.LOG_WARNING, string.format(
                "Manual set: %d minutes is outside the %d minute unit (0-%d); using %d.",
                sw_minutes_saved, minute_unit, minute_unit - 1, wanted_minutes));
        end
        local total_minutes = wanted_minutes;
        local from_minutes = sw_hours_saved * 60;
        if total_minutes < from_minutes then
            total_minutes = total_minutes + math.ceil((from_minutes - total_minutes) / minute_unit) * minute_unit;
        end
        -- the candidate one unit lower may land closer to HH (e.g. {M200}, HH=99, MM=89)
        local lower_minutes = total_minutes - minute_unit;
        if lower_minutes >= 0 and
            math.abs(math.floor(lower_minutes / 60) - sw_hours_saved) < math.abs(math.floor(total_minutes / 60) - sw_hours_saved) then
            total_minutes = lower_minutes;
        end
        if math.floor(total_minutes / 60) ~= sw_hours_saved then
            obs.script_log(obs.LOG_WARNING, string.format(
                "Manual set: %02d hours with %02d minutes cannot be shown with a %d minute unit; using %d total minutes instead.",
                sw_hours_saved, wanted_minutes, minute_unit, total_minutes));
        end
        hh = 0;
        mm = (total_minutes * 60);
    end
    --[[
		Hours at or above a {H…} unit wrap on display (HH=150 with {H100} shows 50).
		The time itself is still valid, so keep it and only warn.
	]]
    if hour_unit ~= nil and timer_format == 5 and sw_hours_saved >= hour_unit then
        obs.script_log(obs.LOG_WARNING, string.format(
            "Manual set: %d hours is outside the %d hour unit (0-%d); the timer will show %02d hours.",
            sw_hours_saved, hour_unit, hour_unit - 1, sw_hours_saved % hour_unit));
    end
    local ff = (sw_milliseconds_saved / (99 + time_frequency));
    local time = (dd + hh + mm + ss + ff);
    timer_value(time); -- Update the last saved time here
    set_time_text(timer_source);
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Tells whether a year is a leap year (Gregorian rules).
	Scope: local; called by property_onchange
	type: helper (date)
	input type: year: number
	returns: bool
	Credit: et al
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function is_leap_year(year)
    debug_log('is_leap_year(' .. pre_dump(year) .. ') -- function variable names:  year ')
    if year % 4 == 0 then -- A leap year comes once in four years
        if year % 100 == 0 then
            if year % 400 == 0 then
                return true;
            else
                return false;
            end;
        else
            return true;
        end;
    else
        return false;
    end;
    --return year%4==0 and (year%100~=0 or year%400==0) -- shorthand
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: "Show/Hide Milliseconds" button: toggles the hundredths and updates the button label. Ignored while the script is disabled or the toggle feature is off.
	Scope: local; registered by script_properties as the button "mili_button"
	type: button callback
	input type: props: obs_properties (the panel); p: obs_property (the button; not used); settings: obs_data (not used)
	returns: bool: true (refresh the panel), or none when ignored
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function mili_button_clicked(props, p, settings)
    if disable_script then return end -- B-043: Disable Script ignores user input
    debug_log('mili_button_clicked(' ..
        pre_dump(props) ..
        ", " .. pre_dump(p) .. ", " .. pre_dump(settings) .. ') -- function variable names:  props, p, settings ')
    if not enable_property_toggle_mili_trigger then return end
    mili(true, props);
    return true;
end
--[[
	B-051: the direction button offers the other direction of the one actually
	counting (after a toggle too), in every place that sets its label.
]]
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Gives the label of the direction button: "Toggle: Count Up" while counting down, otherwise "Toggle: Count Down".
	Scope: local; called by update_button_label, property_button_update_start and property_onchange
	type: helper (panel)
	input type: none
	returns: string: the label
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function direction_button_label()
    return current_count_direction == "DOWN" and "Toggle: Count Up" or "Toggle: Count Down";
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Sets the direction button's label to match the current count direction.
	Scope: local; called by direction_button_clicked
	type: helper (panel)
	input type: props: obs_properties (the panel)
	returns: bool: true
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function update_button_label(props)
    debug_log('update_button_label(' .. pre_dump(props) .. ') -- function variable names:  props ')
    --[[
		A button has it's own callback so we can not action anything
		on the button press through the Properties Callback, instead
		we will action it on the button Callback directly.
	]]
    local mode = obs.obs_data_get_int(ctx.propsSet, "timer_mode");
    local direction_button_prop = obs.obs_properties_get(props, "direction_button");
    --[[
		We are only setting the button label depending if the timer is active
		and on the timer type.
	]]
    obs.obs_property_set_description(direction_button_prop, direction_button_label()); -- B-051
    return true;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: "Count Up/Down" button: reverses the count direction and updates the button label. Ignored while the script is disabled or the direction toggle is off.
	Scope: local; registered by script_properties as the button "direction_button"
	type: button callback
	input type: props: obs_properties (the panel); p: obs_property (the button; not used); settings: obs_data (not used)
	returns: bool: true (refresh the panel), or none when ignored
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function direction_button_clicked(props, p, settings)
    if disable_script then return end -- B-043: Disable Script ignores user input
    debug_log('direction_button_clicked(' ..
        pre_dump(props) ..
        ", " .. pre_dump(p) .. ", " .. pre_dump(settings) .. ') -- function variable names:  props, p, settings ')
    --[[
		Only allow if enable
	]]
    if not enable_direction_toggle then
        return;
    end
    update_timer_direction(true);
    update_button_label(props);
    return true;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Reverses the count direction, sets the orientation (normal for the mode's own direction, inverted otherwise) and works out the next marker times and media for the new direction.
	Scope: global; called by direction_button_clicked and hotkey_send_direction
	type: helper (timer control)
	input type: pressed: bool (true from a button or key down)
	returns: bool: true, or none when ignored
----------------------------------------------------------------------------------------------------------------------------------------
]]
function update_timer_direction(pressed)
    debug_log('update_timer_direction(' .. pre_dump(pressed) .. ') -- function variable names:  pressed ')
    if not pressed and not enable_direction_toggle then
        return;
    end
    --[[
		Signal that the feature is in use, this will indicate that 'normal operation'
		is suspended. It will be reset if 'Reset' is called.
	]]
    --[[
		Change direction each time the feature is activated
	]]
    current_count_direction = (current_count_direction == "UP" and "DOWN" or "UP")
    --[[
	 		Make sure the trigger is as accurate as possible depending
			if the timer is counting up or down.
	]]

    if timer_mode == 1 then
        count_orientation = current_count_direction == "UP" and "NORMAL" or "INVERTED"
    end

    if timer_mode == 2 then
        count_orientation = current_count_direction == "DOWN" and "NORMAL" or "INVERTED"
    end

    if count_orientation == "INVERTED" then
        direction_changed = true;
    else
        direction_changed = false;
    end

    local round_seconds = roundSeconds()
    update_time_markers(round_seconds)
    update_media_names(); -- we don't reset because here the list must cycle
    return true;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Gives the label of the milliseconds button: "Hide Milliseconds" while hundredths are shown, otherwise "Show Milliseconds".
	Scope: global; called by mili and script_properties
	type: helper (panel)
	input type: none
	returns: string: the label
----------------------------------------------------------------------------------------------------------------------------------------
]]
function mili_button_label()
    if show_mili then return "Hide Milliseconds" end
    return "Show Milliseconds"
end

--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Toggles the hundredths display when the toggle feature is on, redraws a stopped timer, and updates the button label when the panel is given.
	Scope: global; called by toggle_mili, mili_button_clicked and hotkey_send_mili
	type: helper (display)
	input type: pressed: bool (true from a button, key down or the trigger); button_props: obs_properties or nil (the panel)
	returns: bool: true, or none when ignored
----------------------------------------------------------------------------------------------------------------------------------------
]]
function mili(pressed, button_props)
    debug_log('mili(' .. pre_dump(pressed) .. ') -- function variable names:  pressed, button_props ')
    if not pressed then
        return;
    end
    if not enable_property_toggle_mili_trigger then return end -- B-052: feature off: the hotkey does nothing, like the button
    if show_mili then
        show_mili = false;
    else
        show_mili = true;
    end

    --[[
		The timer text will update if the timer is active
		but not if it is paused. Lets update it if in the
		paused (inactive) state.
	]]
    if not timer_active then
        set_time_text(timer_source);
    end
    --[[
		A button has it's own callback so we can not action anything
		on the button press through the Properties Callback, instead
		we will action it on the button Callback directly.
	]]
    --[[
		Only relabel the button when called from its own callback: button_props is
		then the live properties object passed in by OBS. From a hotkey or timer the
		global props may already be destroyed (B3); script_properties() sets the
		correct label the next time the panel opens.
	]]
    if button_props ~= nil then
        local mili_button_prop = obs.obs_properties_get(button_props, "mili_button");
        obs.obs_property_set_description(mili_button_prop, mili_button_label());
    end
    return true
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Milliseconds hotkey: toggles the hundredths. Ignored while the script is disabled and on key release.
	Scope: local; registered by assign_hotkeys as the hotkey "Milliseconds Toggle"
	type: hotkey handler
	input type: pressed: bool (true on key down, false on key up)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function hotkey_send_mili(pressed)
    if disable_script then return end -- B-043: Disable Script ignores user input
    debug_log('hotkey_send_mili(' .. pre_dump(pressed) .. ') -- function variable names:  pressed ')
    --[[
		For hotkeys: This is called on key down & key up. A bool check:

		pressed = true (key down)
		pressed = false (key up)

		When a hotkeys is pressed the callback checks if the key state
		is currently pressed 'true' or 'false' (released)
		so a hotkey key press has a dual function: key down, key up
	]]
    if pressed then -- key is currently down
        --return -- uncomment 'return' to ignore the call while key is down
    else            -- key was released
        return      -- uncomment 'return' to ignore the call when key is released
    end
    mili(pressed)
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Direction hotkey: reverses the count direction when the direction toggle is on. Ignored while the script is disabled and on key release.
	Scope: local; registered by assign_hotkeys as the hotkey "Change Timer Direction"
	type: hotkey handler
	input type: pressed: bool (true on key down, false on key up)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function hotkey_send_direction(pressed)
    if disable_script then return end -- B-043: Disable Script ignores user input
    debug_log('hotkey_send_direction(' .. pre_dump(pressed) .. ') -- function variable names:  pressed ')
    --[[
		For hotkeys: This is called on key down & key up. A bool check:

		pressed = true (key down)
		pressed = false (key up)

		When a hotkeys is pressed the callback checks if the key state
		is currently pressed 'true' or 'false' (released)
		so a hotkey key press has a dual function: key down, key up
	]]
    if pressed then -- key is currently down
        --return -- uncomment 'return' to ignore the call while key is down
    else            -- key was released
        return      -- uncomment 'return' to ignore the call when key is released
    end

    if not enable_direction_toggle then return end
    update_timer_direction(true)
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Hides the Add Limit note source when its show time is over, then stops its own timer.
	Scope: global; a timer callback added by start_sal_timer
	type: timer callback
	input type: none
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
function sal_timer_callback()
    debug_log('sal_timer_callback() -- function variable names: ')
    timer_remove(sal_timer_callback); -- one-shot: remove first, so an early return can't leave it repeating
    if not enable_property_timer_manipulation then return end
    if timer_manipulation == 3 then return end;
    set_visible(add_limit_note_source, false);
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Shows the Add Limit note source and, if it has a show time, starts the timer that hides it. Only when Timer Manipulation is enabled.
	Scope: global; called by sal_check
	type: helper (timer manipulation)
	input type: none
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
function start_sal_timer()
    debug_log('start_sal_timer() -- function variable names: ')
    if not enable_property_timer_manipulation then return end
    if timer_manipulation == 3 then return end;
    set_visible(add_limit_note_source, true);
    if add_limit_note_source_visible == 0 then return end;
    timer_remove(sal_timer_callback); -- Remove any existing callbacks if they exist before assigning a new callback
    timer_add(sal_timer_callback, add_limit_note_source_visible);
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: When the Add limit is reached, shows the Add Limit note; otherwise keeps it hidden. Only when Timer Manipulation is enabled and an Add limit is set.
	Scope: local; called by sec_add_1_update to sec_add_3_update
	type: helper (timer manipulation)
	input type: none
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function sal_check()
    debug_log('sal_check() -- function variable names:  ')
    if not enable_property_timer_manipulation then return end
    if timer_manipulation == 3 then return end;
    if sec_add_limit == 0 then return end;
    if sec_add_limit_used >= sec_add_limit then
        start_sal_timer();
    else
        set_visible(add_limit_note_source, false);
    end
end
local timer_manipulation_warned = false;
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Tells whether Add/Subtract Seconds may change the timer (feature on and Timer Manipulation not Disabled); logs a warning the first time it refuses, instead of failing silently (B2).
	Scope: local; called by sec_add_1_update to sec_add_3_update and sec_sub_1_update to sec_sub_3_update
	type: helper (timer manipulation)
	input type: none
	returns: bool
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function timer_manipulation_allowed()
    if enable_property_timer_manipulation and timer_manipulation ~= 3 then return true end
    if not timer_manipulation_warned then
        timer_manipulation_warned = true;
        obs.script_log(obs.LOG_WARNING,
            "Add/Subtract Seconds hotkey ignored: Timer Manipulation is set to Disabled (or the feature is turned off) in the script settings.");
    end
    return false
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Adds the "Add Seconds Set 1" seconds to the timer if allowed and the Add limit isn't reached, redraws a stopped timer, counts the use, and updates the Add Limit note.
	Scope: local; called by hotkey_send_sec_add_1 and sec_add_1_button_clicked
	type: helper (timer manipulation)
	input type: none
	returns: bool: true, or none when not allowed
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function sec_add_1_update()
    debug_log('sec_add_1_update() -- function variable names:  ')
    if not timer_manipulation_allowed() then return end
    if sec_add_limit ~= 0 and sec_add_limit_used >= sec_add_limit then
        -- do nothing
    else
        timer_value(current_seconds + sec_add_1);
        if not timer_active then set_time_text(timer_source) end -- show the change while paused (B2)
        local update_value = sec_add_limit_used + 1;
        sec_add_limit_used = update_value;
        update_properties_setting_int("sec_add_limit_used", update_value);
    end;
    sal_check();
    return true;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Adds the "Add Seconds Set 2" seconds to the timer if allowed and the Add limit isn't reached, redraws a stopped timer, counts the use, and updates the Add Limit note.
	Scope: local; called by hotkey_send_sec_add_2 and sec_add_2_button_clicked
	type: helper (timer manipulation)
	input type: none
	returns: bool: true, or none when not allowed
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function sec_add_2_update()
    debug_log('sec_add_2_update() -- function variable names:  ')
    if not timer_manipulation_allowed() then return end
    if sec_add_limit ~= 0 and sec_add_limit_used >= sec_add_limit then
        -- do nothing
    else
        timer_value(current_seconds + sec_add_2);
        if not timer_active then set_time_text(timer_source) end -- show the change while paused (B2)
        local update_value = sec_add_limit_used + 1;
        sec_add_limit_used = update_value;
        update_properties_setting_int("sec_add_limit_used", update_value);
    end;
    sal_check();
    return true;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Adds the "Add Seconds Set 3" seconds to the timer if allowed and the Add limit isn't reached, redraws a stopped timer, counts the use, and updates the Add Limit note.
	Scope: local; called by hotkey_send_sec_add_3 and sec_add_3_button_clicked
	type: helper (timer manipulation)
	input type: none
	returns: bool: true, or none when not allowed
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function sec_add_3_update()
    debug_log('sec_add_3_update() -- function variable names:  ')
    if not timer_manipulation_allowed() then return end
    if sec_add_limit ~= 0 and sec_add_limit_used >= sec_add_limit then
        -- do nothing
    else
        timer_value(current_seconds + sec_add_3);
        if not timer_active then set_time_text(timer_source) end -- show the change while paused (B2)
        local update_value = sec_add_limit_used + 1;
        sec_add_limit_used = update_value;
        update_properties_setting_int("sec_add_limit_used", update_value);
    end;
    sal_check();
    return true;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Hides the Subtract Limit note source when its show time is over, then stops its own timer.
	Scope: global; a timer callback added by start_ssl_timer
	type: timer callback
	input type: none
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
function ssl_timer_callback()
    debug_log('ssl_timer_callback() -- function variable names: ')
    timer_remove(ssl_timer_callback); -- one-shot: remove first, so an early return can't leave it repeating
    if not enable_property_timer_manipulation then return end
    if timer_manipulation == 3 then return end;
    set_visible(sub_limit_note_source, false);
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Shows the Subtract Limit note source and, if it has a show time, starts the timer that hides it. Only when Timer Manipulation is enabled.
	Scope: global; called by ssl_check
	type: helper (timer manipulation)
	input type: none
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
function start_ssl_timer()
    debug_log('start_ssl_timer() -- function variable names: ')
    if not enable_property_timer_manipulation then return end
    if timer_manipulation == 3 then return end;
    set_visible(sub_limit_note_source, true);
    if sub_limit_note_source_visible == 0 then return end;
    timer_remove(ssl_timer_callback); -- Remove any existing callbacks if they exist before assigning a new callback
    timer_add(ssl_timer_callback, sub_limit_note_source_visible);
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: When the Subtract limit is reached, shows the Subtract Limit note; otherwise keeps it hidden. Only when Timer Manipulation is enabled and a Subtract limit is set.
	Scope: local; called by sec_sub_1_update to sec_sub_3_update
	type: helper (timer manipulation)
	input type: none
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function ssl_check()
    debug_log('ssl_check() -- function variable names:  ')
    if not enable_property_timer_manipulation then return end
    if timer_manipulation == 3 then return end;
    if sec_sub_limit == 0 then return end;
    if sec_sub_limit_used >= sec_sub_limit then
        start_ssl_timer();
    else
        set_visible(sub_limit_note_source, false);
    end
end
--[[
	B-018 (decision 2026-10-09): time goes below zero only after a direction
	change with "Prevent Negative Time" off (not in overtime, which also sets
	direction_changed); otherwise Subtract stops at zero, and never raises a
	time that is already negative.
]]
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Subtracts seconds from the timer without going below zero, unless negative time is allowed (direction changed, "Prevent Negative Time Value" off, not in overtime).
	Scope: local; called by sec_sub_1_update to sec_sub_3_update
	type: helper (timer manipulation)
	input type: seconds: number (seconds to subtract)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function subtract_time(seconds)
    local value = current_seconds - seconds;
    local negative_allowed = direction_changed and not prevent_negative_time and not overtime_active;
    if value < 0 and not negative_allowed then value = math.min(0, current_seconds) end
    timer_value(value);
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Subtracts the "Subtract Seconds Set 1" seconds if allowed and the Subtract limit isn't reached, redraws a stopped timer, counts the use, and updates the Subtract Limit note.
	Scope: local; called by hotkey_send_sec_sub_1 and sec_sub_1_button_clicked
	type: helper (timer manipulation)
	input type: none
	returns: bool: true, or none when not allowed
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function sec_sub_1_update()
    debug_log('sec_sub_1_update() -- function variable names:  ')
    if not timer_manipulation_allowed() then return end
    if sec_sub_limit ~= 0 and sec_sub_limit_used >= sec_sub_limit then
        -- do nothing
    else
        subtract_time(sec_sub_1);
        if not timer_active then set_time_text(timer_source) end -- show the change while paused (B2)
        local update_value = sec_sub_limit_used + 1;
        sec_sub_limit_used = update_value;
        update_properties_setting_int("sec_sub_limit_used", update_value);
    end;
    ssl_check();
    return true;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Subtracts the "Subtract Seconds Set 2" seconds if allowed and the Subtract limit isn't reached, redraws a stopped timer, counts the use, and updates the Subtract Limit note.
	Scope: local; called by hotkey_send_sec_sub_2 and sec_sub_2_button_clicked
	type: helper (timer manipulation)
	input type: none
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function sec_sub_2_update()
    debug_log('sec_sub_2_update() -- function variable names:  ')
    if not timer_manipulation_allowed() then return end
    if sec_sub_limit ~= 0 and sec_sub_limit_used >= sec_sub_limit then
        -- do nothing
    else
        subtract_time(sec_sub_2);
        if not timer_active then set_time_text(timer_source) end -- show the change while paused (B2)
        local update_value = sec_sub_limit_used + 1;
        sec_sub_limit_used = update_value;
        update_properties_setting_int("sec_sub_limit_used", update_value);
    end;
    ssl_check();
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Subtracts the "Subtract Seconds Set 3" seconds if allowed and the Subtract limit isn't reached, redraws a stopped timer, counts the use, and updates the Subtract Limit note.
	Scope: local; called by hotkey_send_sec_sub_3 and sec_sub_3_button_clicked
	type: helper (timer manipulation)
	input type: none
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function sec_sub_3_update()
    debug_log('sec_sub_3_update() -- function variable names:  ')
    if not timer_manipulation_allowed() then return end
    if sec_sub_limit ~= 0 and sec_sub_limit_used >= sec_sub_limit then
        -- do nothing
    else
        subtract_time(sec_sub_3);
        if not timer_active then set_time_text(timer_source) end -- show the change while paused (B2)
        local update_value = sec_sub_limit_used + 1;
        sec_sub_limit_used = update_value;
        update_properties_setting_int("sec_sub_limit_used", update_value);
    end;
    ssl_check();
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: "Add Seconds Set 1" hotkey: adds the Set 1 seconds. Ignored while the script is disabled and on key release.
	Scope: local; registered by assign_hotkeys as the hotkey "Add Seconds Set 1"
	type: hotkey handler
	input type: pressed: bool (true on key down, false on key up)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function hotkey_send_sec_add_1(pressed)
    if disable_script then return end -- B-043: Disable Script ignores user input
    debug_log('hotkey_send_sec_add_1(' .. pre_dump(pressed) .. ') -- function variable names:  pressed ')
    --[[
		For hotkeys: This is called on key down & key up. A bool check:

		pressed = true (key down)
		pressed = false (key up)

		When a hotkeys is pressed the callback checks if the key state
		is currently pressed 'true' or 'false' (released)
		so a hotkey key press has a dual function: key down, key up
	]]
    if pressed then -- key is currently down
        --return -- uncomment 'return' to ignore the call while key is down
    else            -- key was released
        return;     -- uncomment 'return' to ignore the call when key is released
    end;
    sec_add_1_update();
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: "Add Seconds Set 2" hotkey: adds the Set 2 seconds. Ignored while the script is disabled and on key release.
	Scope: local; registered by assign_hotkeys as the hotkey "Add Seconds Set 2"
	type: hotkey handler
	input type: pressed: bool (true on key down, false on key up)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function hotkey_send_sec_add_2(pressed)
    if disable_script then return end -- B-043: Disable Script ignores user input
    debug_log('hotkey_send_sec_add_2(' .. pre_dump(pressed) .. ') -- function variable names:  pressed ')
    --[[
		For hotkeys: This is called on key down & key up. A bool check:

		pressed = true (key down)
		pressed = false (key up)

		When a hotkeys is pressed the callback checks if the key state
		is currently pressed 'true' or 'false' (released)
		so a hotkey key press has a dual function: key down, key up
	]]
    if pressed then -- key is currently down
        --return -- uncomment 'return' to ignore the call while key is down
    else            -- key was released
        return;     -- uncomment 'return' to ignore the call when key is released
    end;
    sec_add_2_update();
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: "Add Seconds Set 3" hotkey: adds the Set 3 seconds. Ignored while the script is disabled and on key release.
	Scope: local; registered by assign_hotkeys as the hotkey "Add Seconds Set 3"
	type: hotkey handler
	input type: pressed: bool (true on key down, false on key up)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function hotkey_send_sec_add_3(pressed)
    if disable_script then return end -- B-043: Disable Script ignores user input
    debug_log('hotkey_send_sec_add_3(' .. pre_dump(pressed) .. ') -- function variable names:  pressed ')
    --[[
		For hotkeys: This is called on key down & key up. A bool check:

		pressed = true (key down)
		pressed = false (key up)

		When a hotkeys is pressed the callback checks if the key state
		is currently pressed 'true' or 'false' (released)
		so a hotkey key press has a dual function: key down, key up
	]]
    if pressed then -- key is currently down
        --return -- uncomment 'return' to ignore the call while key is down
    else            -- key was released
        return;     -- uncomment 'return' to ignore the call when key is released
    end;
    sec_add_3_update();
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: "Subtract Seconds Set 1" hotkey: subtracts the Set 1 seconds. Ignored while the script is disabled and on key release.
	Scope: local; registered by assign_hotkeys as the hotkey "Subtract Seconds Set 1"
	type: hotkey handler
	input type: pressed: bool (true on key down, false on key up)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function hotkey_send_sec_sub_1(pressed)
    if disable_script then return end -- B-043: Disable Script ignores user input
    debug_log('hotkey_send_sec_sub_1(' .. pre_dump(pressed) .. ') -- function variable names:  pressed ')
    --[[
		For hotkeys: This is called on key down & key up. A bool check:

		pressed = true (key down)
		pressed = false (key up)

		When a hotkeys is pressed the callback checks if the key state
		is currently pressed 'true' or 'false' (released)
		so a hotkey key press has a dual function: key down, key up
	]]
    if pressed then -- key is currently down
        --return -- uncomment 'return' to ignore the call while key is down
    else            -- key was released
        return;     -- uncomment 'return' to ignore the call when key is released
    end;
    sec_sub_1_update();
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: "Subtract Seconds Set 2" hotkey: subtracts the Set 2 seconds. Ignored while the script is disabled and on key release.
	Scope: local; registered by assign_hotkeys as the hotkey "Subtract Seconds Set 2"
	type: hotkey handler
	input type: pressed: bool (true on key down, false on key up)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function hotkey_send_sec_sub_2(pressed)
    if disable_script then return end -- B-043: Disable Script ignores user input
    debug_log('hotkey_send_sec_sub_2(' .. pre_dump(pressed) .. ') -- function variable names:  pressed ')
    --[[
		For hotkeys: This is called on key down & key up. A bool check:

		pressed = true (key down)
		pressed = false (key up)

		When a hotkeys is pressed the callback checks if the key state
		is currently pressed 'true' or 'false' (released)
		so a hotkey key press has a dual function: key down, key up
	]]
    if pressed then -- key is currently down
        --return -- uncomment 'return' to ignore the call while key is down
    else            -- key was released
        return;     -- uncomment 'return' to ignore the call when key is released
    end
    sec_sub_2_update();
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: "Subtract Seconds Set 3" hotkey: subtracts the Set 3 seconds. Ignored while the script is disabled and on key release.
	Scope: local; registered by assign_hotkeys as the hotkey "Subtract Seconds Set 3"
	type: hotkey handler
	input type: pressed: bool (true on key down, false on key up)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function hotkey_send_sec_sub_3(pressed)
    if disable_script then return end -- B-043: Disable Script ignores user input
    debug_log('hotkey_send_sec_sub_3(' .. pre_dump(pressed) .. ') -- function variable names:  pressed ')
    --[[
		For hotkeys: This is called on key down & key up. A bool check:

		pressed = true (key down)
		pressed = false (key up)

		When a hotkeys is pressed the callback checks if the key state
		is currently pressed 'true' or 'false' (released)
		so a hotkey key press has a dual function: key down, key up
	]]
    if pressed then -- key is currently down
        --return -- uncomment 'return' to ignore the call while key is down
    else            -- key was released
        return;     -- uncomment 'return' to ignore the call when key is released
    end;
    sec_sub_3_update();
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Resets the timer to its starting state: hides the marker and end media, resets the media and note cycles, the prefix and suffix, the expire cycle list, the Add/Subtract limits and notes, the marker states and group notes, the direction and orientation; reapplies the timer settings, stops the timer, clears the marker timers, the split text and the Active Source text, and works out the first marker times and media. Skipped before the script is ready unless the user asked for it.
	Scope: local; called by activate_reset, init, script_update, on_event, timer_expire_event_cycle_source_list and the Timer Activation handlers
	type: helper (timer control)
	input type: pressed: bool or nil (only used in the debug message); is_user: bool or nil (true for a Reset button or hotkey; B-037)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function reset(pressed, is_user)
    debug_log('reset(' ..
        pre_dump(pressed) .. ', ' .. pre_dump(is_user) .. ') -- function variable names:  pressed, is_user ')
    --[[
		The ready guard only protects automatic/startup calls.
		A Reset from the button or hotkey must never be blocked.
	]]
    if not script_ready and not is_user then
        debug_log('reset skipped: script not ready')
        return
    end
    reset_activated = true; -- notify timer settings a reset call is in process
    user_reset_in_progress = (is_user == true); -- B-037
    --[[
		For hotkeys: This is called on key down & key up. A bool check:

		pressed = true (key down)
		pressed = false (key up)

		When a hotkeys is pressed the callback checks if the key state
		is currently pressed 'true' or 'false' (released)
		so a hotkey key press has a dual function: key down, key up
	]]
    if pressed then -- key is currently down
        --return -- uncomment 'return' to ignore the call while key is down
    else            -- key was released
        --return -- uncomment 'return' to ignore the call when key is released
    end
    --[[
		Set visibility to first position
	]]
    set_visible(media["playing_audio_marker_a"] or media["source_name_audio_marker_a"], false); -- B-076 (review): the entry playing
    set_visible(media["playing_audio_marker_b"] or media["source_name_audio_marker_b"], false);
    set_visible(media["source_name_audio_marker_end"], false);
    media["playing_audio_marker_a"] = nil;  -- B-076 (review): nothing plays after a Reset
    media["playing_audio_marker_b"] = nil;
    media["playing_audio_marker_end"] = nil;
    media["cycle_index_marker_a"] = 1;      -- index from 1-based table
    media["cycle_index_marker_b"] = 1;      -- index from 1-based table
    media["cycle_index_note_marker_a"] = 1; -- index from 1-based table
    media["cycle_index_note_marker_b"] = 1; -- index from 1-based table
    media["cycle_direction_marker_a"] = 2;
    media["cycle_direction_marker_b"] = 2;
    prepare_text_prefix_suffix()
    --[[
		This is only required because technically the timer is still active
	]]
    if not timer_event_active then
        reset_cycle_source_list();
    end
    set_visible(add_limit_note_source, false);
    set_visible(sub_limit_note_source, false);
    obs.obs_data_set_int(ctx.propsSet, "sec_add_limit_used", 0);
    obs.obs_data_set_int(ctx.propsSet, "sec_sub_limit_used", 0);
    --[[
			Why: obs_properties_apply_settings

	]]
    --obs.obs_properties_apply_settings( ctx.propsDef, ctx.propsSet ); -- BUG> Failed to call timer_cb for timer_call: attempt to call a nil value
    sec_add_limit_used = 0;
    sec_sub_limit_used = 0;
    --[[
		Set bool to first position
	]]
    media["media_ended_marker_a"]     = false;
    media["media_ended_marker_b"]     = false;
    color_normal_updated              = false;
    set_timer_activated               = false;
    direction_changed                 = false;
    overtime_active                   = false; -- F2: Reset ends overtime
    pending_expire_scene              = nil;   -- F4: Reset cancels a scene switch waiting for the audio
    media["activated_media_marker_a"] = false;
    media["activated_media_marker_b"] = false;
    media["activated_marker_a"]       = false;
    media["activated_marker_b"]       = false;
    media["activated_time_marker_a"]  = 0;
    media["activated_time_marker_b"]  = 0;
    set_text_note_color("marker_a");
    set_text_note_color("marker_b");
    media["used_note_source_marker_a"] = Deque.new()
    media["used_note_source_marker_b"] = Deque.new()
    reset_group_note_sources(note_source_marker_a)
    reset_group_note_sources(note_source_marker_b)
    --[[
		Reset the current_count_direction
		If the timer is in Count Up mode the
		timer is counting up
	]]
    count_orientation = "NORMAL"
    media["last_orientation_marker_a"] = "NORMAL"; -- B-028: the lists compare these (a global last_orientation was never read)
    media["last_orientation_marker_b"] = "NORMAL";
    media["last_orientation_note_marker_a"] = "NORMAL"; -- O-005
    media["last_orientation_note_marker_b"] = "NORMAL";
    if timer_mode == 1 then
        current_count_direction = "UP";
    else
        current_count_direction = "DOWN";
    end
    --[[

		force text update by changing last_text

	]]
    last_text = tostring(obs.os_gettime_ns());
    --[[
		timer_mode: either
		timer_active: either
		define > set_to_default: (true) * User requested a reset, so we do not want to set the settings to default.
		define > new_settings: not required here because we will use the global (ctx.propsSet)
		purpose: User is resetting the timer settings and we need to provide instant feedback output to the timer display (timer text source)
	]]
    update_timer_settings(true); -- optional inputs: set_to_default(bool), new_settings(obs_property_data/obs_userdata) -- based on UI Settings
    --[[

		Handle Timer Callback

	]]
    activate(false); -- start or stop the timer, in this case, stop the timer and get it ready start again
    pause_carry_ns = 0; -- B-015 / B-011 (review): a Reset discards the time a pause (or this stop) cut off
    clear_marker_timers(); -- Reset: do not resume marker colour / note timers from before the reset
    --[[

		Reset timer split seconds text

	]]
    set_split_text(split_source);
    --[[

		Reset "Active Source" text (if defined)

	]]
    if active_source ~= "Select" and not timer_event_active then -- B-008: the list's own reset keeps the name
        set_text(active_source, "");
        --[[
			force the visibility
			state of this source.
		]]
        if active_source_force_visible then set_visible(active_source, false) end;
    end
    --[[
	 		Make sure the trigger is as accurate as possible depending
			if the timer is counting up or down.
	]]
    reset_audio_marker_arr();
    local round_seconds = roundSeconds();
    update_time_markers(round_seconds);
    update_media_names(true);
    reset_activated = false;           -- notify timer settings a reset call ended
    user_reset_in_progress = false;

    debug_log('END of function reset') -- function variable names:  activating ' )
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: For Timer Activation "Specific Source Active": when the chosen source becomes active, resets the timer (Auto reset) and starts it; when it becomes inactive, pauses it.
	Scope: local; called by timer_activation_source_activated and timer_activation_source_deactivated
	type: helper (activation)
	input type: cd: calldata (the signal's data, with the source); connected: bool (true: activated; false: deactivated)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function timer_activation_source_activate_signal(cd, connected)
    debug_log('timer_activation_source_activate_signal(' ..
        pre_dump(cd) .. ", " .. pre_dump(connected) .. ') -- function variable names:  cd, connected ')
    --[[
		Capture / Retrieve Callback Data
	]]
    if timer_activation_source == "select" then return end

    if timer_activation == 5 then
        local source = obs.calldata_source(cd, "source");
        --[[
			Do we have a Source?
		]]
        if source ~= nil then
            local name = obs.obs_source_get_name(source); -- Get Source NAME
            if (name == timer_activation_source) then
                if connected then
                    debug_log('Activate Timer: Source Shown')
                    if timer_reset == 2 and not disable_script then reset(true) end -- B-043: disabled keeps the time
                    start(true)
                else
                    debug_log('De-activate Timer: Source Hiden')
                    pause(true)
                end
            end;
        end;
    end
end
local media_paused_by_hide = false; -- B-073: the timer source's hide paused the marker audio
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Reacts to sources being shown, hidden, activated or deactivated: handles "Timer Scene Active" and Auto Recording "Timer Visible". With Timer Activation "Timer Source Visible" or "Timer Scene Active", starts the timer when its source appears (resetting first with Auto reset) and stops it when it goes; marker media is paused while the timer is hidden and resumed with it. A timer that is already running is left alone (B-066).
	Scope: local; called by source_show, source_hide, source_activated and source_deactivated
	type: helper (activation)
	input type: cd: calldata (the signal's data, with the source); connected: bool (true: shown / activated; false: hidden / deactivated)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function activate_signal(cd, connected)
    debug_log('activate_signal(' ..
        pre_dump(cd) .. ", " .. pre_dump(connected) .. ') -- function variable names:  cd, connected ')
    --[[

		Capture / Retrieve Callback Data

	]]
    local source = obs.calldata_source(cd, "source");
    --[[

		Do we have a Source?

	]]
    if source ~= nil then
        local name = obs.obs_source_get_name(source); -- Get Source NAME
        --[[

		]]
        activate_timer_on_scene(source, connected);
        --[[

			Check if scene has source

		]]
        if (name == timer_source) then
            if connected then record(5, 300) end;
            if connected and timer_active then -- B-066: already running: don't restart it (record() itself ignores an active recording)
                media_paused_by_hide = false;      -- B-073 (review): Start while hidden already resumed the audio
                return
            end

            if in_table({ 2, 3 }, timer_activation) then
                --[[
					Source visibility was set to hidden
				]]
                if not connected then
                    -- B-073: already stopped (marker pause, expired with the audio finishing):
                    -- activate(false) below won't suspend the playback limit, so do it here
                    if not timer_active then suspend_media_limits() end
                    pause_play_media(media["playing_audio_marker_a"], true);
                    pause_play_media(media["playing_audio_marker_b"], true);
                    media_paused_by_hide = true;
                end
                --[[
					timer_mode: either
					timer_active: timer not running
					define > set_to_default: (true) * we are starting the timer from the default position and therfore want to set the settings to default.
					define > new_settings: not required here because we will use the global (ctx.propsSet)
					purpose: User requires the timer to intiate.
				]]
                if connected and not set_timer_activated and (timer_reset == 2) and not disable_script then -- B-040 / B-043: Auto reset only before a start, not on hide or while disabled
                    update_timer_settings(true); -- optional inputs: set_to_default(bool), new_settings(obs_property_data/obs_userdata)
                end

                if connected then
                    activate(true);
                else
                    activate(false);
                end;
                --[[
					B-073: resume the marker audio the hide paused, as Start does. If the timer
					didn't start again, the audio still plays on with its playback limit.
				]]
                if connected and media_paused_by_hide then
                    media_paused_by_hide = false;
                    if not timer_active then rearm_media_limits() end
                    pause_play_media(media["playing_audio_marker_a"], false);
                    pause_play_media(media["playing_audio_marker_b"], false);
                end
            end;
        end;
    end;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: User Reset: resets the timer as a user request (also before the script is ready). Ignored on key release.
	Scope: local; called by hotkey_send_reset and reset_button_clicked
	type: helper (timer control)
	input type: pressed: bool (true on key down or click)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function activate_reset(pressed)
    debug_log('activate_reset(' .. pre_dump(pressed) .. ') -- function variable names:  pressed ')
    --[[
		For hotkeys: This is called on key down & key up. A bool check:

		pressed = true (key down)
		pressed = false (key up)

		When a hotkeys is pressed the callback checks if the key state
		is currently pressed 'true' or 'false' (released)
		so a hotkey key press has a dual function: key down, key up
	]]
    if pressed then       -- key is currently down
        --return -- uncomment 'return' to ignore the call while key is down
    else                  -- key was released
        return;           -- uncomment 'return' to ignore the call when key is released
    end
    reset(pressed, true); -- user initiated: button or hotkey
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Reset hotkey: resets the timer. Ignored while the script is disabled and on key release.
	Scope: local; registered by assign_hotkeys as the hotkey "Reset"
	type: hotkey handler
	input type: pressed: bool (true on key down, false on key up)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function hotkey_send_reset(pressed)
    if disable_script then return end -- B-043: Disable Script ignores user input
    debug_log('hotkey_send_reset(' .. pre_dump(pressed) .. ') -- function variable names:  pressed ')
    --[[
		For hotkeys: This is called on key down & key up. A bool check:

		pressed = true (key down)
		pressed = false (key up)

		When a hotkeys is pressed the callback checks if the key state
		is currently pressed 'true' or 'false' (released)
		so a hotkey key press has a dual function: key down, key up
	]]
    if pressed then -- key is currently down
        --return -- uncomment 'return' to ignore the call while key is down
    else            -- key was released
        return;     -- uncomment 'return' to ignore the call when key is released
    end
    activate_reset(pressed);
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Set hotkey: in Count Up, sets the timer to the saved time from the panel. Ignored while the script is disabled and on key release.
	Scope: local; registered by assign_hotkeys as the hotkey "Set"
	type: hotkey handler
	input type: pressed: bool (true on key down, false on key up)
	returns: none
	Credit: ccpaging (PR #14)
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function hotkey_send_set(pressed)
    if disable_script then return end -- B-043: Disable Script ignores user input
    debug_log('hotkey_send_set(' .. pre_dump(pressed) .. ') -- function variable names:  pressed ')
    if pressed then         -- key is currently down
        --return -- uncomment 'return' to ignore the call while key is down
    else                    -- key was released
        return;             -- uncomment 'return' to ignore the call when key is released
    end
    if timer_mode == 1 then -- count up only
        set_stopwatch();
        set_timer_activated = true;
    end;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Sets the labels of the Start, Pause and direction buttons to match the mode, whether the timer runs, and "Split Start Pause Button".
	Scope: local; called by start_button_clicked and pause_button_clicked
	type: helper (panel)
	input type: props: obs_properties (the panel)
	returns: obs_properties: props
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function property_button_update_start(props)
    debug_log('property_button_update_start(' .. pre_dump(props) .. ') -- function variable names:  props ')
    --[[
		A button has it's own callback so we can not action anything
		on the button press through the Properties Callback, instead
		we will action it on the button Callback directly.
	]]
    local mode = obs.obs_data_get_int(ctx.propsSet, "timer_mode");
    local pause_button_prop = obs.obs_properties_get(props, "pause_button");
    local start_button_prop = obs.obs_properties_get(props, "start_button");
    local direction_button_prop = obs.obs_properties_get(props, "direction_button");
    --[[
		We are only setting the button label depending if the timer is active
		and on the timer type.
	]]
    if mode == 2 then
        obs.obs_property_set_description(direction_button_prop, direction_button_label()); -- B-051
        if timer_active then
            if split_startpause then
                obs.obs_property_set_description(start_button_prop, "Start Count Down Timer");
                obs.obs_property_set_description(pause_button_prop, "Pause Count Down Timer");
            else
                obs.obs_property_set_description(pause_button_prop, "Start/Pause Count Down Timer");
            end
        else
            if split_startpause then
                obs.obs_property_set_description(start_button_prop, "Start Count Down Timer");
                obs.obs_property_set_description(pause_button_prop, "Pause Count Down Timer");
            else
                obs.obs_property_set_description(pause_button_prop, "Start Count Down Timer");
            end
        end;
    else
        obs.obs_property_set_description(direction_button_prop, direction_button_label()); -- B-051
        if timer_active then
            if split_startpause then
                obs.obs_property_set_description(start_button_prop, "Start Count Up Timer");
                obs.obs_property_set_description(pause_button_prop, "Pause Count Up Timer");
            else
                obs.obs_property_set_description(pause_button_prop, "Start/Pause Count Up Timer");
            end
        else
            if split_startpause then
                obs.obs_property_set_description(start_button_prop, "Start Count Up Timer");
                obs.obs_property_set_description(pause_button_prop, "Pause Count Up Timer");
            else
                obs.obs_property_set_description(pause_button_prop, "Start Count Up Timer");
            end
        end;
    end;
    return props;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Start button: starts the timer and updates the button labels.
	Scope: local; registered by script_properties as the button "start_button"
	type: button callback
	input type: props: obs_properties (the panel); p: obs_property (the button; not used)
	returns: bool: true (refresh the panel)
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function start_button_clicked(props, p)
    debug_log('start_button_clicked(' ..
        pre_dump(props) .. ", " .. pre_dump(p) .. ') -- function variable names:  props, p ')
    start(true);
    property_button_update_start(props);
    return true;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Pause (or Start/Pause) button: toggles the timer and updates the button labels.
	Scope: local; registered by script_properties as the button "pause_button"
	type: button callback
	input type: props: obs_properties (the panel); p: obs_property (the button; not used)
	returns: bool: true (refresh the panel)
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function pause_button_clicked(props, p)
    debug_log('pause_button_clicked(' ..
        pre_dump(props) .. ", " .. pre_dump(p) .. ') -- function variable names:  props, p ')
    startpause(true);
    property_button_update_start(props);
    return true;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Button handler for "Add Seconds Set 1"; no panel button uses it (the panel has no Add/Subtract buttons).
	Scope: local; not registered or called
	type: button callback (unused)
	input type: props: obs_properties (not used); p: obs_property (not used)
	returns: bool: true
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function sec_add_1_button_clicked(props, p)
    debug_log('sec_add_1_button_clicked(' ..
        pre_dump(props) .. ", " .. pre_dump(p) .. ') -- function variable names:  props, p ')
    sec_add_1_update();
    return true;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Button handler for "Add Seconds Set 2"; no panel button uses it (the panel has no Add/Subtract buttons).
	Scope: local; not registered or called
	type: button callback (unused)
	input type: props: obs_properties (not used); p: obs_property (not used)
	returns: bool: true
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function sec_add_2_button_clicked(props, p)
    debug_log('sec_add_2_button_clicked(' ..
        pre_dump(props) .. ", " .. pre_dump(p) .. ') -- function variable names:  props, p ')
    sec_add_2_update();
    return true;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Button handler for "Add Seconds Set 3"; no panel button uses it (the panel has no Add/Subtract buttons).
	Scope: local; not registered or called
	type: button callback (unused)
	input type: props: obs_properties (not used); p: obs_property (not used)
	returns: bool: true
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function sec_add_3_button_clicked(props, p)
    debug_log('sec_add_3_button_clicked(' ..
        pre_dump(props) .. ", " .. pre_dump(p) .. ') -- function variable names:  props, p ')
    sec_add_3_update();
    return true;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Button handler for "Subtract Seconds Set 1"; no panel button uses it (the panel has no Add/Subtract buttons).
	Scope: local; not registered or called
	type: button callback (unused)
	input type: props: obs_properties (not used); p: obs_property (not used)
	returns: bool: true
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function sec_sub_1_button_clicked(props, p)
    debug_log('sec_sub_1_button_clicked(' ..
        pre_dump(props) .. ", " .. pre_dump(p) .. ') -- function variable names:  props, p ')
    sec_sub_1_update();
    return true;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Button handler for "Subtract Seconds Set 2"; no panel button uses it (the panel has no Add/Subtract buttons).
	Scope: local; not registered or called
	type: button callback (unused)
	input type: props: obs_properties (not used); p: obs_property (not used)
	returns: bool: true
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function sec_sub_2_button_clicked(props, p)
    debug_log('sec_sub_2_button_clicked(' ..
        pre_dump(props) .. ", " .. pre_dump(p) .. ') -- function variable names:  props, p ')
    sec_sub_2_update();
    return true;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Button handler for "Subtract Seconds Set 3"; no panel button uses it (the panel has no Add/Subtract buttons).
	Scope: local; not registered or called
	type: button callback (unused)
	input type: props: obs_properties (not used); p: obs_property (not used)
	returns: bool: true
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function sec_sub_3_button_clicked(props, p)
    debug_log('sec_sub_3_button_clicked(' ..
        pre_dump(props) .. ", " .. pre_dump(p) .. ') -- function variable names:  props, p ')
    sec_sub_3_update();
    return true;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Exports the script's settings to a JSON file (see write_to_json). Ignored on key release.
	Scope: local; called by export_button_clicked
	type: helper (files)
	input type: pressed: bool (true to export)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function export(pressed)
    debug_log('export(' .. pre_dump(pressed) .. ') -- function variable names:  pressed ')
    if not pressed then
        return;
    end;
    local file_exported = write_to_json(ctx.propsSet);
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: "Export Settings" button: exports the settings to a JSON file.
	Scope: local; registered by script_properties as the button "export_button"
	type: button callback
	input type: props: obs_properties (not used); p: obs_property (not used)
	returns: bool: false (no panel refresh)
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function export_button_clicked(props, p)
    debug_log('export_button_clicked(' ..
        pre_dump(props) .. ", " .. pre_dump(p) .. ') -- function variable names:  props, p ')
    export(true);
    return false;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Loads the settings file chosen in the import list from the backup folder into the settings, and sets the list back to "select".
	Scope: local; called by import_button_clicked
	type: helper (files)
	input type: props: obs_properties (not used); property: obs_property (the button; only its name is read); settings: obs_data (the settings to load into)
	returns: bool: true
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function import_properties(props, property, settings)
    debug_log('import_properties(' ..
        pre_dump(props) ..
        ", " ..
        pre_dump(property) .. ", " .. pre_dump(settings) .. ') -- function variable names:  props, property, settings ')
    local property_name = obs.obs_property_name(property);
    local import_folder = backup_folder
    -- convert Windows path to UNIX path
    import_folder = import_folder .. "/" .. import_list .. ".json"
    import_folder = import_folder:gsub([[\]], "/");
    if backup_folder ~= nil and backup_folder ~= "" and obs.os_file_exists(import_folder) then -- B-069: no path check without a folder
        local data = obs.obs_data_create_from_json_file(import_folder) -- B-004: local, and released below
        if data ~= nil then
            obs.obs_data_apply(settings, data)
            obs.obs_data_release(data)
            obs.obs_data_set_string(settings, "import_list", "select")
            ctx.propsSet = settings
        end
    end
    -- IMPORTANT: returns true to trigger refresh of the properties
    return true
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: "Import Settings" button: imports the chosen settings file and applies it through script_update.
	Scope: local; registered by script_properties as the button "import_button"
	type: button callback
	input type: props: obs_properties (the panel); property: obs_property (the button); settings: obs_data (not used; the script's own settings are used)
	returns: bool: true (refresh the panel)
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function import_button_clicked(props, property, settings)
    debug_log('import_button_clicked(' ..
        pre_dump(props) ..
        ", " .. pre_dump(property) .. ", " .. pre_dump(settings) .. ') -- function variable names:  props, p, settings ')
    --[[
		B-045: a button click calls only this callback (never the property's modified
		callback), so import here, once; then load the imported values like an edit.
	]]
    if ctx.propsSet ~= nil then
        import_properties(props, property, ctx.propsSet);
        _G.script_update(ctx.propsSet); -- defined below (OBS entry point)
    end
    -- IMPORTANT: returns true to trigger refresh of the properties
    return true;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: "Set" button: in Count Up, sets the timer to the saved time from the panel. Ignored while the script is disabled.
	Scope: local; registered by script_properties as the button "sw_button"
	type: button callback
	input type: props: obs_properties (not used); p: obs_property (not used); settings: obs_data (not used)
	returns: bool: false (no panel refresh), or none while disabled
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function sw_saved_button_clicked(props, p, settings)
    if disable_script then return end -- B-043: Disable Script ignores user input
    debug_log('sw_saved_button_clicked(' ..
        pre_dump(props) ..
        ", " .. pre_dump(p) .. ", " .. pre_dump(settings) .. ') -- function variable names:  props, p, settings ')
    if timer_mode == 1 then
        set_stopwatch();
        set_timer_activated = true;
    end;
    return false;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Reset button: resets the timer as a user request. Ignored while the script is disabled.
	Scope: local; registered by script_properties as the button "reset_button"
	type: button callback
	input type: props: obs_properties (not used); p: obs_property (not used); settings: obs_data (not used)
	returns: bool: true (refresh the panel), or none while disabled
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function reset_button_clicked(props, p, settings)
    if disable_script then return end -- B-043: Disable Script ignores user input
    debug_log('reset_button_clicked(' ..
        pre_dump(props) ..
        ", " .. pre_dump(p) .. ", " .. pre_dump(settings) .. ') -- function variable names:  props, p, settings ')
    activate_reset(true);
    return true;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Records a split while the timer runs (the time and the running time for the interval) and updates the split list text. Ignored on key release.
	Scope: local; called by hotkey_send_split and split_button_clicked
	type: helper (splits)
	input type: pressed: bool (true on key down or click)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function split_time(pressed)
    debug_log('split_time(' .. pre_dump(pressed) .. ') -- function variable names:  pressed ')
    if not pressed then
        return;
    end;
    if timer_active then
        split_count = split_count + 1;
        split_itm[split_count] = current_seconds;
        split_elapsed[split_count] = split_run_elapsed; -- B-025
        split_unpack();
        set_split_text(split_source);
    end;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Split hotkey: records a split. Ignored while the script is disabled and on key release.
	Scope: local; registered by assign_hotkeys as the hotkey "Split Time"
	type: hotkey handler
	input type: pressed: bool (true on key down, false on key up)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function hotkey_send_split(pressed)
    if disable_script then return end -- B-043: Disable Script ignores user input
    debug_log('hotkey_send_split(' .. pre_dump(pressed) .. ') -- function variable names:  pressed ')
    --[[
		For hotkeys: This is called on key down & key up. A bool check:

		pressed = true (key down)
		pressed = false (key up)

		When a hotkeys is pressed the callback checks if the key state
		is currently pressed 'true' or 'false' (released)
		so a hotkey key press has a dual function: key down, key up
	]]
    if pressed then -- key is currently down
        --return -- uncomment 'return' to ignore the call while key is down
    else            -- key was released
        return;     -- uncomment 'return' to ignore the call when key is released
    end
    split_time(pressed);
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: "Split Time" button: records a split. Ignored while the script is disabled.
	Scope: local; registered by script_properties as the button "split_button"
	type: button callback
	input type: props: obs_properties (not used); p: obs_property (not used)
	returns: bool: false (no panel refresh), or none while disabled
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function split_button_clicked(props, p)
    if disable_script then return end -- B-043: Disable Script ignores user input
    debug_log('split_button_clicked(' ..
        pre_dump(props) .. ", " .. pre_dump(p) .. ') -- function variable names:  props, p ')
    split_time(true);
    return false;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Copies the script's settings into the global variables the timer uses (modes, formats, sources, markers, notes, media, colours, limits, the note group types), looks up the note source types, takes the normal text colour from the timer source unless it is set in the panel or a script colour is showing, notes whether the timer mode changed, and refreshes the source list.
	Scope: local; called by init and script_update
	type: helper (settings)
	input type: settings: obs_data (the script's settings)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function load_settings_globals(settings)
    debug_log('load_settings_globals(' .. pre_dump(settings) .. ') -- function variable names:  settings ')

    enable_property_color_normal = obs.obs_data_get_bool(settings, "enable_property_color_normal");
    enable_property_color_marker_a = obs.obs_data_get_bool(settings, "enable_property_color_marker_a");
    enable_property_color_marker_b = obs.obs_data_get_bool(settings, "enable_property_color_marker_b");
    enable_property_toggle_mili_trigger = obs.obs_data_get_bool(settings, "enable_property_toggle_mili_trigger");
    enable_property_split_source = obs.obs_data_get_bool(settings, "enable_property_split_source");
    enable_property_trigger_options = obs.obs_data_get_bool(settings, "enable_property_trigger_options");
    enable_property_start_recording = obs.obs_data_get_bool(settings, "enable_property_start_recording");
    enable_property_text_prefix = obs.obs_data_get_bool(settings, "enable_property_text_prefix");
    enable_property_text_suffix = obs.obs_data_get_bool(settings, "enable_property_text_suffix");
    enable_property_timer_manipulation = obs.obs_data_get_bool(settings, "enable_property_timer_manipulation");
    enable_property_timer_activation = obs.obs_data_get_bool(settings, "enable_property_timer_activation");
    enable_property_debug = obs.obs_data_get_bool(settings, "enable_property_debug");
    enable_property_backup = obs.obs_data_get_bool(settings, "enable_property_backup");
    for option in pairs(NOTE_GROUP_TYPES) do -- 6.1 option: note group source types
        note_group_types[option] = obs.obs_data_get_bool(settings, "note_group_type_" .. option);
    end
    last_timer_mode = timer_mode;
    timer_day = obs.obs_data_get_int(settings, "day");
    timer_year = obs.obs_data_get_int(settings, "year");
    timer_hours = obs.obs_data_get_int(settings, "hours");
    timer_month = obs.obs_data_get_int(settings, "month") - 1;

    --[[
			"Default"
			"Timer Source Visible"
			"Timer Scene Active"
			"Specific Scene Active"

			"Manual"
			"Auto"
	]]

    timer_activation = obs.obs_data_get_int(settings, "timer_activation");
    timer_reset = obs.obs_data_get_int(settings, "timer_reset");
    timer_manipulation = obs.obs_data_get_int(settings, "timer_manipulation");
    sec_add_1 = obs.obs_data_get_int(settings, "sec_add_1");
    sec_add_2 = obs.obs_data_get_int(settings, "sec_add_2");
    sec_add_3 = obs.obs_data_get_int(settings, "sec_add_3");
    sec_sub_1 = obs.obs_data_get_int(settings, "sec_sub_1");
    sec_sub_2 = obs.obs_data_get_int(settings, "sec_sub_2");
    sec_sub_3 = obs.obs_data_get_int(settings, "sec_sub_3");
    sec_add_limit = obs.obs_data_get_int(settings, "sec_add_limit");
    sec_add_limit_used = obs.obs_data_get_int(settings, "sec_add_limit_used");
    sec_sub_limit = obs.obs_data_get_int(settings, "sec_sub_limit");
    sec_sub_limit_used = obs.obs_data_get_int(settings, "sec_sub_limit_used");
    timer_mode = obs.obs_data_get_int(settings, "timer_mode");
    timer_minutes = obs.obs_data_get_int(settings, "minutes");
    timer_seconds = obs.obs_data_get_int(settings, "seconds");
    add_limit_note_source = obs.obs_data_get_string(settings, "add_limit_note_source");
    sub_limit_note_source = obs.obs_data_get_string(settings, "sub_limit_note_source");
    add_limit_note_source_visible = obs.obs_data_get_int(settings, "add_limit_note_source_visible");
    sub_limit_note_source_visible = obs.obs_data_get_int(settings, "sub_limit_note_source_visible");
    enable_marker_notes = obs.obs_data_get_int(settings, "enable_marker_notes");
    timer_format = obs.obs_data_get_int(settings, "timer_format");
    timer_source = obs.obs_data_get_string(settings, "timer_source");
    timer_activation_source = obs.obs_data_get_string(settings, "timer_activation_source");
    countdown_type = obs.obs_data_get_int(settings, "countdown_type");
    sw_days_saved = obs.obs_data_get_int(settings, "sw_days_saved");
    sw_hours_saved = obs.obs_data_get_int(settings, "sw_hours_saved");
    cycle_direction = obs.obs_data_get_int(settings, "cycle_direction");
    sw_current_seconds = obs.obs_data_get_double(settings, "sw_current_seconds");
    load_saved_time = obs.obs_data_get_bool(settings, "load_saved_time");
    backup_split_time = obs.obs_data_get_bool(settings, "backup_split_time");
    sw_minutes_saved = obs.obs_data_get_int(settings, "sw_minutes_saved");
    sw_seconds_saved = obs.obs_data_get_int(settings, "sw_seconds_saved");
    custom_time_format = obs.obs_data_get_string(settings, "custom_time_format");
    round_up_countdown = obs.obs_data_get_bool(settings, "round_up_countdown"); -- F8
    toggle_mili_trigger = obs.obs_data_get_string(settings, "toggle_mili_trigger");
    sw_milliseconds_saved = obs.obs_data_get_int(settings, "sw_milliseconds_saved");
    prevent_negative_time = obs.obs_data_get_bool(settings, "prevent_negative_time");
    note_source_marker_a = obs.obs_data_get_string(settings, "note_source_marker_a");
    note_source_marker_b = obs.obs_data_get_string(settings, "note_source_marker_b");
    media["note_source_unversioned_id_marker_a"] = get_source_unversioned_id_by_name(note_source_marker_a)
    media["note_source_unversioned_id_marker_b"] = get_source_unversioned_id_by_name(note_source_marker_b)
    media["note_source_marker_a"] = note_source_marker_a;
    media["note_source_marker_b"] = note_source_marker_b;
    longtimetext_s = string.gsub(obs.obs_data_get_string(settings, "day_text"), "\\([n])", { n = "\n" });
    longtimetext_p = string.gsub(obs.obs_data_get_string(settings, "days_text"), "\\([n])", { n = "\n" });
    media["note_marker_a"] = string.gsub(obs.obs_data_get_string(settings, "note_marker_a"), "\\([n])", { n = "\n" });
    media["note_marker_b"] = string.gsub(obs.obs_data_get_string(settings, "note_marker_b"), "\\([n])", { n = "\n" });
    script_ready = obs.obs_data_get_bool(settings, "script_ready"); -- -- Retrieves property value from reference
    debug_log('load_settings_globals get script_ready (' .. pre_dump(script_ready) .. ') ')
    --[[
				Used for source cycling

				default_seconds: Default Seconds

				the default timer state

				This is the state of the timer that will set or
				reset the time ( current_seconds )

				If the timer expires because current_seconds == 0,
				then the time ( current_seconds ) will be be restarted
				from default_seconds for another function such as source cycling.

				Every instance that a timer time is defined, we must record it to default_seconds
	]]
    default_seconds = current_seconds;
    split_type = obs.obs_data_get_int(settings, "split_type");
    stop_text = obs.obs_data_get_string(settings, "stop_text");
    timer_expire_event = obs.obs_data_get_string(settings, "timer_expire_event");
    overtime_style = obs.obs_data_get_bool(settings, "overtime_style"); -- F2
    expire_audio_first = obs.obs_data_get_bool(settings, "expire_audio_first"); -- F4
    cycle_source_children = obs.obs_data_get_string(settings, "cycle_source_children");
    import_list = obs.obs_data_get_string(settings, "import_list");
    split_source = obs.obs_data_get_string(settings, "split_source");
    disable_script = obs.obs_data_get_bool(settings, "disable_script");
    debug_enabled = obs.obs_data_get_bool(settings, "debug_enabled");
    enable_direction_toggle = obs.obs_data_get_bool(settings, "enable_direction_toggle");
    backup_folder = obs.obs_data_get_string(settings, "backup_folder");
    active_source = obs.obs_data_get_string(settings, "active_source");
    start_recording = obs.obs_data_get_int(settings, "start_recording");
    if enable_property_color_normal then
        media["color_normal"] = obs.obs_data_get_int(settings, "color_normal");
    elseif not (script_colour_showing and media["color_normal"] ~= nil) then
        -- B-067 (decision 2026-10-09, option a): while a marker colour shows, keep the last
        -- captured normal colour instead of reading the marker colour back from the source
        media["color_normal"] = get_text_color(timer_source);
    end
    media["color_marker_a"] = obs.obs_data_get_int(settings, "color_marker_a");
    media["color_marker_b"] = obs.obs_data_get_int(settings, "color_marker_b");
    audio_marker_a = obs.obs_data_get_string(ctx.propsSet, "audio_marker_a");
    audio_marker_b = obs.obs_data_get_string(ctx.propsSet, "audio_marker_b");
    if audio_marker_a ~= "list" then
        media["source_name_audio_marker_a"] = audio_marker_a
    end
    if audio_marker_b ~= "list" then
        media["source_name_audio_marker_b"] = audio_marker_b
    end
    media_playback_limit = obs.obs_data_get_int(settings, "media_playback_limit");
    active_source_force_visible = obs.obs_data_get_bool(settings, "active_source_force_visible");
    split_startpause = obs.obs_data_get_bool(settings, "split_startpause");
    media["source_name_audio_marker_end"] = obs.obs_data_get_string(settings, "audio_marker_end");
    text_prefix = string.gsub(obs.obs_data_get_string(settings, "text_prefix"), "\\([n])", { n = "\n" });
    text_suffix = string.gsub(obs.obs_data_get_string(settings, "text_suffix"), "\\([n])", { n = "\n" });
    media["reset_text_marker_a"] = obs.obs_data_get_int(settings, "reset_text_marker_a");
    media["reset_text_marker_b"] = obs.obs_data_get_int(settings, "reset_text_marker_b");
    media["hide_note_marker_a"] = obs.obs_data_get_int(settings, "hide_note_marker_a");
    media["pause_marker_a"] = obs.obs_data_get_bool(settings, "pause_marker_a"); -- F9
    media["pause_marker_b"] = obs.obs_data_get_bool(settings, "pause_marker_b"); -- F9
    media["hide_note_marker_b"] = obs.obs_data_get_int(settings, "hide_note_marker_b");
    if media_playback_limit ~= 1 then
        media["duration_marker_a"] = obs.obs_data_get_int(settings, "duration_marker_a");
        media["duration_marker_b"] = obs.obs_data_get_int(settings, "duration_marker_b");
        media["duration_marker_end"] = obs.obs_data_get_int(settings, "duration_marker_end");
    else
        media["duration_marker_a"] = 0;
        media["duration_marker_b"] = 0;
        media["duration_marker_end"] = 0;
    end;

    if not load_saved_time then sw_current_seconds = 0 end;
    timer_mode_changed = (last_timer_mode ~= timer_mode);

    update_source_list();
    --[[
	 		Make sure the trigger is as accurate as possible depending
			if the timer is counting up or down.
	]]
end
--[[
	B-074: OBS saves the sources before any script code runs at exit (the exit save
	precedes SCRIPTING_SHUTDOWN, EXIT and script unload, and script_save runs after
	the sources are written). So a marker colour showing at exit is saved on the
	source; script_save records it with the normal colour, and the next start-up
	restores the normal colour before it is read from the source.
]]
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: If the script was unloaded while a marker colour showed, puts the saved normal colour back on the timer source once it exists (B-074, repair at the next start).
	Scope: local; called by init
	type: helper (persistence)
	input type: none
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function restore_saved_normal_colour()
    if ctx.propsSet == nil or not obs.obs_data_get_bool(ctx.propsSet, "sw_colour_restore_pending") then return end
    local source = obs.obs_get_source_by_name(timer_source or "");
    if source == nil then return end -- not loaded yet: the next init() tries again
    obs.obs_source_release(source);
    obs.obs_data_set_bool(ctx.propsSet, "sw_colour_restore_pending", false);
    set_timer_text_color(obs.obs_data_get_int(ctx.propsSet, "sw_colour_restore_normal"));
    script_colour_showing = false;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Prepares the script once the sources are loaded: restores a saved colour, marks the script ready, loads the settings, hides the media, limit notes and (for "Timer Source Visible") the timer, loads the saved Count Up time or resets, connects the Timer Activation signals, and starts the timer if its activation scene or source is already active.
	Scope: local; called by deferred_init_callback, loaded and on_event
	type: helper (startup)
	input type: none
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function init()
    debug_log('init')
    restore_saved_normal_colour(); -- B-074: before load_settings_globals() reads the normal colour
    obs.obs_data_set_bool(ctx.propsSet, "script_ready", true); -- set to signal ready state.
    debug_log('loaded set script_ready (' .. pre_dump(true) .. ') ')
    --[[
			load any property values available to globals
		]]
    load_settings_globals(ctx.propsSet);
    --[[
			prefix / suffix are otherwise only prepared in reset(),
			so they would be missing after an OBS restart (PR #17, brohirrim)
		]]
    prepare_text_prefix_suffix();

    set_visible(media["source_name_audio_marker_a"], false);   -- set hidden just in case
    set_visible(media["source_name_audio_marker_b"], false);   -- set hidden just in case
    set_visible(media["source_name_audio_marker_end"], false); -- set hidden just in case
    set_visible(add_limit_note_source, false);                 -- set hidden just in case
    set_visible(sub_limit_note_source, false);                 -- set hidden just in case
    if timer_activation == 2 then                              -- Timer source visible
        set_visible(timer_source, false)                       -- set hidden as a starting point, the user can start the timer by setting it to visible
    end
    if timer_mode == 1 then
        if load_saved_time then
            timer_value(sw_current_seconds); -- value
            --[[
				B-036: the reset that prepares the markers is skipped here, so
				prepare them for the loaded time (as reset() does).
			]]
            update_time_markers(roundSeconds());
            update_media_names(true);
            last_text = tostring(obs.os_gettime_ns()); -- O-004: show the loaded time now, not the text saved earlier
            set_time_text(timer_source);
        else
            timer_value(0);
            reset(true); -- <BUG signal handler crash on startup?
        end;
    else
        reset(true); -- <BUG signal handler crash on startup?
    end;
    --[[
		B-033: the activation sources exist now (script_update ran before the
		collection's sources were loaded), so connect their signals here.
	]]
    timer_activation_signals();
    --[[
		B-038 / B-059: an activation that happened while OBS was loading is undone
		by the reset above (mode 3), or its event was dropped by the frontend
		(mode 4). Check the condition again now.
	]]
    if timer_activation == 4 and timer_activation_source == frontend_get_current_scene() then
        start(true);
    elseif timer_activation == 3 then
        local source = obs.obs_get_source_by_name(timer_source);
        if source ~= nil then
            local active = obs.obs_source_active(source);
            obs.obs_source_release(source);
            if active then start(true) end
        end
    end
end
--[[
	B-035: init() from loaded() only until loading has finished. OBS also emits
	source_load later (Undo / Redo restores sources), and re-running init() then
	reset or stopped a running timer. On a scene collection switch OBS re-creates
	the script and FINISHED_LOADING doesn't come, so SCENE_COLLECTION_CHANGED runs
	init() and marks loading as finished.
]]
local loading_finished = false;
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Runs init once, shortly after the script loads into an OBS that is already running, then removes itself.
	Scope: local; a timer callback added by script_load
	type: timer callback
	input type: none
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function deferred_init_callback()
    debug_log('deferred_init_callback()')
    obs.remove_current_callback();
    init();
    loading_finished = true; -- script added while OBS runs: FINISHED_LOADING won't come
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Counts the sources of the script's types as OBS loads them, hides the timer source for "Timer Source Visible", and runs init once all of them are loaded.
	Scope: local; connected by script_load to the global "source_load" signal
	type: signal handler
	input type: cd: calldata (the signal's data, with the source)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function loaded(cd)
    debug_log('loaded(' .. pre_dump(cd) .. ') -- function variable names:  cd ')
    --[[
		No script_ready = false write here: source_load also fires in a running
		session, and clearing the flag then would block reset() again (B1)
	]]
    local all_sources_loaded = false;
    --[[
		Get source from CallData
	]]
    local source = obs.calldata_source(cd, "source");
    --[[
		Found Source:
	]]

    if source ~= nil then
        local name = obs.obs_source_get_name(source); -- Get the source name, this will be a unique identifier
        local id = obs.obs_source_get_unversioned_id(source)
        debug_log('loaded source: (' .. pre_dump(name) .. ')')
        --[[
			Does the name match the property value?
		]]
        if (name == timer_source) then
            if timer_activation == 2 then         -- timer source visible
                set_visible(timer_source, false); -- set hidden as a starting point, the user can start the timer by setting it to visible
            end;
        end;

        if in_table(required_sources, id) then
            sources_loaded = sources_loaded + 1; -- add this to the loaded source tally
        end;
    end;
    --[[
		Check if all sources are loaded
	]]
    local current_source_count = count_required_sources()
    all_sources_loaded = (sources_loaded == current_source_count);

    debug_log('all_sources_loaded source: (' ..
        pre_dump(all_sources_loaded) ..
        ' loaded: ' .. pre_dump(sources_loaded) .. " of " .. pre_dump(current_source_count) .. ')')

    --[[
		Some of the functions included requires the source to be loaded,
		so check that all sources are loaded before continuing
	]]
    if all_sources_loaded and not loading_finished then -- B-035
        debug_log('all_sources_loaded are now loaded!')
        init();
    end;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Passes a "show" event to activate_signal, but with connected = false (reversed). Not connected to any signal.
	Scope: local; not called
	type: signal handler (unused)
	input type: cd: calldata (the signal's data)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function source_show(cd)
    debug_log('source_show(' .. pre_dump(cd) .. ') -- function variable names:  cd ')
    activate_signal(cd, false);
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Passes a "hide" event to activate_signal, but with connected = true (reversed). Not connected to any signal.
	Scope: local; not called
	type: signal handler (unused)
	input type: cd: calldata (the signal's data)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function source_hide(cd)
    debug_log('source_hide(' .. pre_dump(cd) .. ') -- function variable names:  cd ')
    activate_signal(cd, true);
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: A source became active (shown in program): passes it to activate_signal.
	Scope: local; connected by script_load to the global "source_activate" signal
	type: signal handler
	input type: cd: calldata (the signal's data, with the source)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function source_activated(cd)
    debug_log('source_activated(' .. pre_dump(cd) .. ') -- function variable names:  cd ')
    activate_signal(cd, true);
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: A source stopped being active: passes it to activate_signal.
	Scope: local; connected by script_load to the global "source_deactivate" signal
	type: signal handler
	input type: cd: calldata (the signal's data, with the source)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function source_deactivated(cd)
    debug_log('source_deactivated(' .. pre_dump(cd) .. ') -- function variable names:  cd ')
    activate_signal(cd, false);
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: The "Specific Source Active" source became active: passes it to timer_activation_source_activate_signal.
	Scope: local; connected by timer_activation_signals to the source's "activate" signal
	type: signal handler
	input type: cd: calldata (the signal's data, with the source)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function timer_activation_source_activated(cd)
    debug_log('timer_activation_source_activated(' .. pre_dump(cd) .. ') -- function variable names:  cd ')
    timer_activation_source_activate_signal(cd, true);
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: The "Specific Source Active" source stopped being active: passes it to timer_activation_source_activate_signal.
	Scope: local; connected by timer_activation_signals to the source's "deactivate" signal
	type: signal handler
	input type: cd: calldata (the signal's data, with the source)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function timer_activation_source_deactivated(cd)
    debug_log('timer_activation_source_deactivated(' .. pre_dump(cd) .. ') -- function variable names:  cd ')
    timer_activation_source_activate_signal(cd, false);
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: For Timer Activation "Specific Media Active": when the chosen media source starts playing, resets the timer (Auto reset) and starts it.
	Scope: local; called by timer_activation_source_media_started
	type: helper (activation)
	input type: cd: calldata (the signal's data, with the source)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function timer_activation_source_media(cd)
    debug_log('timer_activation_source_media(' ..
        pre_dump(cd) .. ", " .. pre_dump(connected) .. ') -- function variable names:  cd, connected ')
    --[[
		Capture / Retrieve Callback Data
	]]
    if timer_activation_source == "select" then return end

    if timer_activation == 6 then
        local source = obs.calldata_source(cd, "source");
        --[[
			Do we have a Source?
		]]
        if source ~= nil then
            local source_id = obs.obs_source_get_unversioned_id(source); -- unversioned_id will not be affected by language settings
            if source_id ~= "ffmpeg_source" then return end;             -- apply this to media type sources only
            local name = obs.obs_source_get_name(source);                -- Get Source NAME
            if (name == timer_activation_source) then
                if timer_reset == 2 and not disable_script then reset(true) end -- B-043: disabled keeps the time
                start(true)
            end;
        end;
    end
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: The "Specific Media Active" source started playing: passes it to timer_activation_source_media.
	Scope: local; connected by timer_activation_signals to the source's "media_started" signal
	type: signal handler
	input type: cd: calldata (the signal's data, with the source)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function timer_activation_source_media_started(cd)
    debug_log('timer_activation_source_media_started(' .. pre_dump(cd) .. ') -- function variable names:  cd ')
    timer_activation_source_media(cd);
end
--[[
	B-034: disconnect every activation signal recorded under `name`. The source is
	found through its weak reference (a renamed source too); a deleted source is
	gone, and libobs frees its signal handler with it.
]]
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Disconnects every signal the script connected to a source and forgets it, releasing the weak reference (B-034).
	Scope: local; called by timer_activation_signals
	type: helper (signals)
	input type: name: string (the source name the connections are kept under)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function disconnect_activation_source(name)
    local handlers = connectedHandlers[name];
    if handlers == nil then return end
    local source = handlers.weak and obs.obs_weak_source_get_source(handlers.weak) or nil;
    if source ~= nil then
        local sh = obs.obs_source_get_signal_handler(source);
        if sh then
            for _, handler in ipairs(handlers) do
                obs.signal_handler_disconnect(sh, handler.signal, handler.callback);
            end
        end
        obs.obs_source_release(source);
    end
    if handlers.weak then obs.obs_weak_source_release(handlers.weak) end
    connectedHandlers[name] = nil;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Connects the signals for "Specific Source Active" (activate, deactivate) or "Specific Media Active" (media_started) to the chosen source, and disconnects the connections that no longer match the setting or the source (B-034).
	Scope: global; called by init and script_update
	type: helper (signals)
	input type: none
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
function timer_activation_signals()
    debug_log('timer_activation_signals(' .. pre_dump(settings) .. ') -- function variable names:  settings ')
    --[[
		B-034: keep the connections only while the same source object is connected
		for the same mode; disconnect everything else (another source, another mode,
		or a source deleted and re-created under the same name). Reconnecting on
		every settings update would pile up detached callbacks in obslua.
	]]
    local current = nil;
    if (timer_activation == 5 or timer_activation == 6) and timer_activation_source ~= "select" then
        current = obs.obs_get_source_by_name(timer_activation_source);
    end
    for name, handlers in pairs(connectedHandlers) do
        local same = current ~= nil and name == timer_activation_source and handlers.mode == timer_activation
            and handlers.weak ~= nil and obs.obs_weak_source_references_source(handlers.weak, current);
        if not same then disconnect_activation_source(name) end
    end
    if current ~= nil then obs.obs_source_release(current) end
    if timer_activation_source ~= "select" then
        if timer_activation == 5 then
            local source = obs.obs_get_source_by_name(timer_activation_source); -- Increments the source reference counter, use obs_source_release() to release it when complete.
            --[[
					Found Source?
				]]
            if source ~= nil then
                connectSignalHandler(source, "activate", timer_activation_source_activated)
                connectSignalHandler(source, "deactivate", timer_activation_source_deactivated)
            end;
            obs.obs_source_release(source);
        end
        if timer_activation == 6 then
            local source = obs.obs_get_source_by_name(timer_activation_source); -- Increments the source reference counter, use obs_source_release() to release it when complete.
            --[[
					Found Source?
				]]
            if source ~= nil then
                connectSignalHandler(source, "media_started", timer_activation_source_media_started) -- Called when media has started.
            end;
            obs.obs_source_release(source);
        end
        if connectedHandlers[timer_activation_source] then
            connectedHandlers[timer_activation_source].mode = timer_activation; -- B-034
        end
    end
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Updates the panel when a setting changes: shows, hides and enables fields for the current options, prevents the same text source being used twice, limits the date fields, rebuilds the source lists (text sources, and groups for the note lists), the Timer Activation list and the import file list, and corrects a few invalid choices. For the two free-text fields it refreshes only when the change affects visibility, so typing isn't interrupted (B11). Ignored while the script is disabled, during an internal write, or before the panel is ready.
	Scope: local; set by script_properties as the modified callback of many properties
	type: property callback
	input type: props: obs_properties (the panel); property: obs_property (the property that changed); settings: obs_data (the script's settings)
	returns: bool: true to rebuild the panel; false (free-text field, no visible change) or none (ignored)
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function property_onchange(props, property, settings)
    if disable_script then return; end;
    debug_log('property_onchange(' ..
        pre_dump(props) ..
        ", " ..
        pre_dump(property) .. ", " .. pre_dump(settings) .. ') -- function variable names:  props, property, settings ')
    --[[

		Optimization: prevent unnecessary callbacks

	]]
    local property_name = obs.obs_property_name(property);
    if prevent_callback then return end
    --[[
		Free-text fields (B11): returning true rebuilds the whole panel, which moved
		the cursor to the end on every keystroke. Only refresh when the text changes
		something that affects visibility:
			custom_time_format:  whether it contains "$F" (milliseconds toggle options)
			toggle_mili_trigger: whether it is empty (milliseconds button)
		Otherwise return false so typing is not interrupted.
		Do not add the {H…}/{M…} units here: their digits change on every keystroke
		while editing a unit, and each refresh moves the cursor to the end.
	]]
    if property_name == "custom_time_format" or property_name == "toggle_mili_trigger" then
        local value = obs.obs_data_get_string(settings, property_name);
        local key;
        if property_name == "custom_time_format" then
            key = (string.find(value, "$F", 1, true) ~= nil);
        else
            key = (value == "");
        end
        local changed = (text_field_visibility_key[property_name] ~= key);
        text_field_visibility_key[property_name] = key;
        if not changed then return false end
        --[[
			Visibility below reads these globals (normally loaded in script_update),
			so bring them up to date before the panel is refreshed.
		]]
        if property_name == "custom_time_format" then
            custom_time_format = value;
        else
            toggle_mili_trigger = value;
        end
    end
    --[[

			 PROPERTY VALUE

	]]
    local script_ready_value = obs.obs_data_get_bool(settings, "script_ready"); -- -- Retrieves property value from reference
    --[[
		 	let's make sure we are not responding to nil values during a script refresh
			The form has been marked as ready, this happens during script load, so if
			the Property script_ready_value is equal to nil then we return.
	]]
    if script_ready and not script_ready_value then
        return
    end

    local day_value = obs.obs_data_get_int(settings, "day");                                      -- -- Retrieves property value from reference
    local year_value = obs.obs_data_get_int(settings, "year");                                    -- -- Retrieves property value from reference
    local month_value = obs.obs_data_get_int(settings, "month");                                  -- -- Retrieves property value from reference
    local layout_value = obs.obs_data_get_int(settings, "layout");                                -- -- Retrieves property value from reference
    local timer_mode_value = obs.obs_data_get_int(settings, "timer_mode");                        -- -- Retrieves property value from reference
    local backup_mode_value = obs.obs_data_get_bool(settings, "backup_mode");                     -- -- Retrieves property value from reference
    local enable_marker_notes_value = obs.obs_data_get_int(settings, "enable_marker_notes");      -- -- Retrieves property value from reference
    local import_list_value = obs.obs_data_get_string(settings, "import_list");                   -- -- Retrieves property value from reference
    local timer_expire_event_value = obs.obs_data_get_string(settings, "timer_expire_event");     -- -- Retrieves property value from reference
    local timer_options_value = obs.obs_data_get_int(settings, "timer_options");                  -- -- Retrieves property value from reference
    local timer_source_value = obs.obs_data_get_string(settings, "timer_source");                 -- -- Retrieves property value from reference
    local trigger_options_value = obs.obs_data_get_int(settings, "trigger_options");              -- -- Retrieves property value from reference
    local split_source_value = obs.obs_data_get_string(settings, "split_source");                 -- -- Retrieves property value from reference
    local set_stopwatch_value = obs.obs_data_get_bool(settings, "set_stopwatch");                 -- -- Retrieves property value from reference
    local countdown_type_value = obs.obs_data_get_int(settings, "countdown_type");                -- -- Retrieves property value from reference
    local active_source_value = obs.obs_data_get_string(settings, "active_source");               -- -- Retrieves property value from reference
    local start_recording_value = obs.obs_data_get_int(settings, "start_recording");              -- -- Retrieves property value from reference
    local note_source_marker_a_value = obs.obs_data_get_string(settings, "note_source_marker_a"); -- -- Retrieves property value from reference
    local note_source_marker_b_value = obs.obs_data_get_string(settings, "note_source_marker_b"); -- -- Retrieves property value from reference
    local audio_marker_a_value = obs.obs_data_get_string(settings, "audio_marker_a");             -- -- Retrieves property value from reference
    local audio_marker_b_value = obs.obs_data_get_string(settings, "audio_marker_b");             -- -- Retrieves property value from reference
    local media_playback_limit_value = obs.obs_data_get_int(settings, "media_playback_limit");    -- -- Retrieves property value from reference
    local select_features = obs.obs_data_get_bool(settings, "select_features");                   -- -- Retrieves property value from reference
    --[[

			 BACKUP PROPERTIES

	]]
    local backup_mode_prop = obs.obs_properties_get(props, "backup_mode");
    local backup_split_time_prop = obs.obs_properties_get(props, "backup_split_time");
    local debug_enabled_prop = obs.obs_properties_get(props, "debug_enabled");
    local import_list_prop = obs.obs_properties_get(props, "import_list");
    --[[

			 TIMER PROPERTIES

	]]
    local sec_add_1_prop = obs.obs_properties_get(props, "sec_add_1");
    local sec_add_2_prop = obs.obs_properties_get(props, "sec_add_2");
    local sec_add_3_prop = obs.obs_properties_get(props, "sec_add_3");
    local sec_sub_1_prop = obs.obs_properties_get(props, "sec_sub_1");
    local sec_sub_2_prop = obs.obs_properties_get(props, "sec_sub_2");
    local sec_sub_3_prop = obs.obs_properties_get(props, "sec_sub_3");
    local sec_add_limit_prop = obs.obs_properties_get(props, "sec_add_limit");
    local sec_sub_limit_prop = obs.obs_properties_get(props, "sec_sub_limit");
    local timer_manipulation_prop = obs.obs_properties_get(props, "timer_manipulation");
    local mili_button_prop = obs.obs_properties_get(props, "mili_button");
    local timer_source_prop = obs.obs_properties_get(props, "timer_source");
    local timer_activation_prop = obs.obs_properties_get(props, "timer_activation");
    local timer_activation_source_prop = obs.obs_properties_get(props, "timer_activation_source");
    local timer_reset_prop = obs.obs_properties_get(props, "timer_reset");
    local start_button_prop = obs.obs_properties_get(props, "start_button");
    local pause_button_prop = obs.obs_properties_get(props, "pause_button");
    local reset_button_prop = obs.obs_properties_get(props, "reset_button");
    local direction_button_prop = obs.obs_properties_get(props, "direction_button");
    local timer_options_prop = obs.obs_properties_get(props, "timer_options");
    local custom_time_format_prop = obs.obs_properties_get(props, "custom_time_format");
    local toggle_mili_trigger_prop = obs.obs_properties_get(props, "toggle_mili_trigger");
    local add_limit_note_source_visible_prop = obs.obs_properties_get(props, "add_limit_note_source_visible");
    local sub_limit_note_source_visible_prop = obs.obs_properties_get(props, "sub_limit_note_source_visible");
    --[[

			 STOPWATCH PROPERTIES

	]]
    local _group_1_prop = obs.obs_properties_get(props, "_group_1");
    local _group_2_prop = obs.obs_properties_get(props, "_group_2");
    local _group_3_prop = obs.obs_properties_get(props, "_group_3");
    local sw_hours_saved_prop = obs.obs_properties_get(props, "sw_hours_saved");
    local sw_minutes_saved_prop = obs.obs_properties_get(props, "sw_minutes_saved");
    local set_stopwatch_prop = obs.obs_properties_get(props, "set_stopwatch");
    --[[

			 COUNTDOWN PROPERTIES

	]]
    local day_prop = obs.obs_properties_get(props, "day");
    local year_prop = obs.obs_properties_get(props, "year");
    local month_prop = obs.obs_properties_get(props, "month");
    local day_text_prop = obs.obs_properties_get(props, "day_text");
    local days_text_prop = obs.obs_properties_get(props, "days_text");
    local stop_text_prop = obs.obs_properties_get(props, "stop_text");
    local cycle_list_prop = obs.obs_properties_get(props, "cycle_list");
    local text_prefix_prop = obs.obs_properties_get(props, "text_prefix");
    local text_suffix_prop = obs.obs_properties_get(props, "text_suffix");
    local active_source_prop = obs.obs_properties_get(props, "active_source");

    local note_source_marker_a_prop  = obs.obs_properties_get(props, "note_source_marker_a");
    local note_source_marker_b_prop  = obs.obs_properties_get(props, "note_source_marker_b");
    local sub_limit_note_source_prop = obs.obs_properties_get(props, "sub_limit_note_source");
    local add_limit_note_source_prop = obs.obs_properties_get(props, "add_limit_note_source");

    local cycle_direction_prop       = obs.obs_properties_get(props, "cycle_direction");
    local as_visible_prop            = obs.obs_properties_get(props, "active_source_force_visible");
    local split_startpause_prop      = obs.obs_properties_get(props, "split_startpause");
    --[[

			 PROPERTIES

	]]
    local hours_prop = obs.obs_properties_get(props, "hours");
    local minutes_prop = obs.obs_properties_get(props, "minutes");
    local seconds_prop = obs.obs_properties_get(props, "seconds");
    local split_type_prop = obs.obs_properties_get(props, "split_type");
    local timer_expire_event_prop = obs.obs_properties_get(props, "timer_expire_event");
    local cycle_source_children_prop = obs.obs_properties_get(props, "cycle_source_children");
    local split_button_prop = obs.obs_properties_get(props, "split_button");
    local split_source_prop = obs.obs_properties_get(props, "split_source");
    local timer_format_prop = obs.obs_properties_get(props, "timer_format");
    local color_normal_prop = obs.obs_properties_get(props, "color_normal");
    local countdown_type_prop = obs.obs_properties_get(props, "countdown_type");
    local start_recording_prop = obs.obs_properties_get(props, "start_recording");
    local select_features_prop = obs.obs_properties_get(props, "select_features");
    local _group_4_prop = obs.obs_properties_get(props, "_group_4");
    --[[

			 PROPERTIES

	]]
    local export_button_prop = obs.obs_properties_get(props, "export_button");
    local import_button_prop = obs.obs_properties_get(props, "import_button");
    local export_folder_prop = obs.obs_properties_get(props, "backup_folder");
    local disable_script_prop = obs.obs_properties_get(props, "disable_script");
    local enable_direction_toggle_prop = obs.obs_properties_get(props, "enable_direction_toggle");
    local prevent_negative_time_prop = obs.obs_properties_get(props, "prevent_negative_time");
    --[[

			WARNING & CAUTION PROPERTIES

	]]
    local to_prop = obs.obs_properties_get(props, "trigger_options");
    local a_note_prop = obs.obs_properties_get(props, "note_marker_a");
    local b_note_prop = obs.obs_properties_get(props, "note_marker_b");
    local enable_marker_notes_prop = obs.obs_properties_get(props, "enable_marker_notes");
    local text_marker_tip_prop = obs.obs_properties_get(props, "text_marker_tip");
    local text_arr_marker_a_prop = obs.obs_properties_get(props, "text_arr_marker_a");
    local text_arr_marker_b_prop = obs.obs_properties_get(props, "text_arr_marker_b");
    local color_marker_a_prop = obs.obs_properties_get(props, "color_marker_a");
    local color_marker_b_prop = obs.obs_properties_get(props, "color_marker_b");
    local audio_marker_a_prop = obs.obs_properties_get(props, "audio_marker_a");
    local audio_marker_b_prop = obs.obs_properties_get(props, "audio_marker_b");
    local audio_marker_a_arr_prop = obs.obs_properties_get(props, "audio_marker_a_arr");
    local audio_marker_b_arr_prop = obs.obs_properties_get(props, "audio_marker_b_arr");
    local audio_marker_end_prop = obs.obs_properties_get(props, "audio_marker_end");
    local a_source_prop = obs.obs_properties_get(props, "note_source_marker_a");
    local b_source_prop = obs.obs_properties_get(props, "note_source_marker_b");
    local duration_marker_a_prop = obs.obs_properties_get(props, "duration_marker_a");
    local duration_marker_b_prop = obs.obs_properties_get(props, "duration_marker_b");
    local reset_text_marker_a_prop = obs.obs_properties_get(props, "reset_text_marker_a");
    local reset_text_marker_b_prop = obs.obs_properties_get(props, "reset_text_marker_b");
    local hide_note_marker_a_prop = obs.obs_properties_get(props, "hide_note_marker_a");
    local hide_note_marker_b_prop = obs.obs_properties_get(props, "hide_note_marker_b");
    local duration_marker_end_prop = obs.obs_properties_get(props, "duration_marker_end");
    local media_playback_limit_prop = obs.obs_properties_get(props, "media_playback_limit");
    --[[
			TIMER INPUTS
	]]
    obs.obs_property_set_visible(timer_options_prop, layout_value == 2);
    obs.obs_property_set_visible(timer_manipulation_prop,
        enable_property_timer_manipulation and layout_value == 2 and timer_options_value == 2 and
        not in_table(ignore_list, timer_source_value));
    obs.obs_property_set_visible(direction_button_prop,
        layout_value == 2 and enable_direction_toggle and
        (timer_mode_value == 2 and countdown_type_value == 2 or timer_mode_value == 1) and
        not in_table(ignore_list, timer_source_value)); --
    obs.obs_property_set_visible(custom_time_format_prop,
        timer_format == 5 and not in_table(ignore_list, timer_source_value) and layout_value == 2 and
        timer_options_value == 2);
    obs.obs_property_set_visible(obs.obs_properties_get(props, "round_up_countdown"),
        timer_format == 5 and timer_mode_value == 2 and not in_table(ignore_list, timer_source_value) and
        layout_value == 2 and timer_options_value == 2); -- F8: Custom Time Format, Count Down
    obs.obs_property_set_visible(add_limit_note_source_visible_prop,
        add_limit_note_source ~= "select" and not in_table(ignore_list, timer_source_value));
    obs.obs_property_set_visible(timer_activation_prop,
        enable_property_timer_activation and layout_value == 2 and timer_options_value == 2 and
        not in_table(ignore_list, timer_source_value));
    obs.obs_property_set_visible(timer_reset_prop,
        enable_property_timer_activation and layout_value == 2 and timer_options_value == 2 and timer_activation ~= 1 and
        not in_table(ignore_list, timer_source_value));
    obs.obs_property_set_visible(timer_activation_source_prop,
        enable_property_timer_activation and layout_value == 2 and timer_options_value == 2 and
        in_table({ 4, 5, 6 }, timer_activation) and not in_table(ignore_list, timer_source_value));
    --[[

			TIMER STOPWATCH INPUTS

			if layout is set to basic then hide
			if layout is set to advanced then check if timer_options are expanded then show
	]]
    obs.obs_property_set_visible(split_button_prop,
        enable_property_split_source and (timer_mode_value == 1 and not in_table(ignore_list, split_source_value)));
    obs.obs_property_set_visible(text_prefix_prop,
        enable_property_text_prefix and layout_value == 2 and timer_options_value == 2 and
        not in_table(ignore_list, timer_source_value));
    obs.obs_property_set_visible(text_suffix_prop,
        enable_property_text_suffix and layout_value == 2 and timer_options_value == 2 and
        not in_table(ignore_list, timer_source_value));
    obs.obs_property_set_visible(timer_format_prop,
        layout_value == 2 and timer_options_value == 2 and not in_table(ignore_list, timer_source_value));
    obs.obs_property_set_visible(color_normal_prop,
        enable_property_color_normal and layout_value == 2 and timer_options_value == 2 and
        not in_table(ignore_list, timer_source_value));
    obs.obs_property_set_visible(set_stopwatch_prop,
        (layout_value == 2 and timer_mode_value == 1 and timer_options_value == 2 and not in_table(ignore_list, timer_source_value)));
    obs.obs_property_set_visible(timer_source_prop, (layout_value == 2 and timer_options_value == 2));
    obs.obs_property_set_visible(split_type_prop,
        enable_property_split_source and timer_mode_value == 1 and not in_table(ignore_list, split_source_value) and
        layout_value == 2 and timer_options_value == 2);
    obs.obs_property_set_visible(split_source_prop,
        enable_property_split_source and timer_mode_value == 1 and layout_value == 2 and timer_options_value == 2 and
        not in_table(ignore_list, timer_source_value));
    obs.obs_property_set_visible(obs.obs_properties_get(props, "split_source_refresh"),
        enable_property_split_source and timer_mode_value == 1 and layout_value == 2 and timer_options_value == 2 and
        not in_table(ignore_list, timer_source_value)); -- B5: same as split_source
    obs.obs_property_set_visible(_group_1_prop,
        (layout_value == 2 and set_stopwatch_value and timer_mode_value == 1 and timer_options_value == 2 and not in_table(ignore_list, timer_source_value)));
    obs.obs_property_set_visible(_group_2_prop,
        (layout_value == 2 and timer_options_value == 2 and enable_property_timer_manipulation and timer_manipulation == 2 and not in_table(ignore_list, timer_source_value)));
    obs.obs_property_set_visible(_group_3_prop,
        (layout_value == 2 and timer_options_value == 2 and enable_property_timer_manipulation and timer_manipulation == 2 and not in_table(ignore_list, timer_source_value)));
    --[[

			TIMER COUNTDOWN INPUTS

			if layout is set to basic then hide
			if layout is set to advanced then check if timer_options are expanded then show
	]]
    obs.obs_property_set_enabled(day_prop, month_value ~= 1);
    obs.obs_property_set_enabled(year_prop, month_value ~= 1);
    obs.obs_property_set_visible(mili_button_prop,
        enable_property_toggle_mili_trigger and show_split(props, settings) and (toggle_mili_trigger == "") and
        not in_table(ignore_list, timer_source_value));
    obs.obs_property_set_visible(toggle_mili_trigger_prop,
        enable_property_toggle_mili_trigger and show_split(props, settings) and timer_options_value == 2 and
        not in_table(ignore_list, timer_source_value));
    obs.obs_property_set_visible(hours_prop,
        layout_value == 2 and timer_mode_value == 2 and timer_options_value == 2 and
        not in_table(ignore_list, timer_source_value));
    obs.obs_property_set_visible(minutes_prop,
        layout_value == 2 and timer_mode_value == 2 and timer_options_value == 2 and
        not in_table(ignore_list, timer_source_value));
    obs.obs_property_set_visible(seconds_prop,
        layout_value == 2 and timer_mode_value == 2 and timer_options_value == 2 and
        not in_table(ignore_list, timer_source_value));
    obs.obs_property_set_visible(split_startpause_prop,
        layout_value == 2 and timer_options_value == 2 and not in_table(ignore_list, timer_source_value));
    obs.obs_property_set_visible(start_button_prop, split_startpause and not in_table(ignore_list, timer_source_value));
    obs.obs_property_set_visible(pause_button_prop, not in_table(ignore_list, timer_source_value));
    obs.obs_property_set_visible(reset_button_prop, not in_table(ignore_list, timer_source_value));
    obs.obs_property_set_visible(timer_expire_event_prop,
        layout_value == 2 and timer_mode_value == 2 and timer_options_value == 2 and
        not in_table(ignore_list, timer_source_value));
    obs.obs_property_set_visible(obs.obs_properties_get(props, "overtime_style"),
        layout_value == 2 and timer_mode_value == 2 and timer_options_value == 2 and
        not in_table(ignore_list, timer_source_value) and timer_expire_event_value == "OVERTIME"); -- F2
    obs.obs_property_set_visible(obs.obs_properties_get(props, "expire_audio_first"),
        layout_value == 2 and timer_mode_value == 2 and timer_options_value == 2 and
        not in_table(ignore_list, timer_source_value) and is_expire_scene(timer_expire_event_value)); -- F4
    obs.obs_property_set_visible(countdown_type_prop,
        layout_value == 2 and timer_mode_value == 2 and timer_options_value == 2 and
        not in_table(ignore_list, timer_source_value));
    obs.obs_property_set_visible(start_recording_prop,
        enable_property_start_recording and layout_value == 2 and timer_mode_value == 2 and timer_options_value == 2 and
        not in_table(ignore_list, timer_source_value));
    obs.obs_property_set_visible(stop_text_prop,
        timer_expire_event_value == "TIMER END TEXT" and timer_mode_value == 2 and timer_options_value == 2 and
        not in_table(ignore_list, timer_source_value));
    obs.obs_property_set_visible(day_prop,
        countdown_type_value == 1 and layout_value == 2 and timer_mode_value == 2 and timer_options_value == 2 and
        not in_table(ignore_list, timer_source_value));
    obs.obs_property_set_visible(year_prop,
        countdown_type_value == 1 and layout_value == 2 and timer_mode_value == 2 and timer_options_value == 2 and
        not in_table(ignore_list, timer_source_value));
    obs.obs_property_set_visible(month_prop,
        countdown_type_value == 1 and layout_value == 2 and timer_mode_value == 2 and timer_options_value == 2 and
        not in_table(ignore_list, timer_source_value));
    obs.obs_property_set_visible(day_text_prop,
        countdown_type_value == 1 and layout_value == 2 and timer_mode_value == 2 and timer_format ~= 5 and
        timer_options_value == 2 and not in_table(ignore_list, timer_source_value));
    obs.obs_property_set_visible(days_text_prop,
        countdown_type_value == 1 and layout_value == 2 and timer_mode_value == 2 and timer_format ~= 5 and
        timer_options_value == 2 and not in_table(ignore_list, timer_source_value));
    obs.obs_property_set_visible(cycle_list_prop,
        ((timer_expire_event_value == "Source List" or timer_expire_event_value == "Scene List") and timer_mode_value == 2 and layout_value == 2 and timer_options_value == 2) and
        not in_table(ignore_list, timer_source_value));
    obs.obs_property_set_visible(active_source_prop,
        ((timer_expire_event_value == "Source List" or timer_expire_event_value == "Scene List" or timer_expire_event_value == "Auto List") and timer_mode_value == 2 and layout_value == 2 and timer_options_value == 2) and
        not in_table(ignore_list, timer_source_value));
    obs.obs_property_set_visible(as_visible_prop,
        ((timer_expire_event_value == "Source List" or timer_expire_event_value == "Scene List" or timer_expire_event_value == "Auto List") and not in_table(ignore_list, active_source_value) and timer_mode_value == 2 and layout_value == 2 and timer_options_value == 2) and
        not in_table(ignore_list, timer_source_value));
    obs.obs_property_set_visible(cycle_direction_prop,
        ((timer_expire_event_value == "Source List" or timer_expire_event_value == "Scene List" or timer_expire_event_value == "Auto List") and timer_mode_value == 2 and layout_value == 2 and timer_options_value == 2) and
        not in_table(ignore_list, timer_source_value));
    obs.obs_property_set_visible(cycle_source_children_prop,
        ((timer_expire_event_value == "Auto List") and timer_mode_value == 2 and layout_value == 2 and timer_options_value == 2) and
        not in_table(ignore_list, timer_source_value));
    --[[

			WARNING & CAUTION INPUTS

			if layout is set to basic then hide
			if layout is set to advanced then check if trigger_options are expanded then show
	]]
    obs.obs_property_set_visible(to_prop,
        enable_property_trigger_options and (layout_value == 2 and not in_table(ignore_list, timer_source_value)));
    obs.obs_property_set_visible(enable_marker_notes_prop,
        (layout_value == 2 and enable_property_trigger_options and trigger_options_value == 2 and (editable_list_has_values("text_arr_marker_a") or editable_list_has_values("text_arr_marker_b"))));
    obs.obs_property_set_visible(text_marker_tip_prop,
        (layout_value == 2 and enable_property_trigger_options and trigger_options_value == 2));
    obs.obs_property_set_visible(text_arr_marker_a_prop,
        (layout_value == 2 and enable_property_trigger_options and trigger_options_value == 2));
    obs.obs_property_set_visible(text_arr_marker_b_prop,
        (layout_value == 2 and enable_property_trigger_options and trigger_options_value == 2));
    obs.obs_property_set_visible(audio_marker_a_prop,
        (layout_value == 2 and enable_property_trigger_options and trigger_options_value == 2 and editable_list_has_values("text_arr_marker_a"))); -- text_arr_marker_b  audio_marker_b_arr
    obs.obs_property_set_visible(audio_marker_b_prop,
        (layout_value == 2 and enable_property_trigger_options and trigger_options_value == 2 and editable_list_has_values("text_arr_marker_b")));
    obs.obs_property_set_visible(obs.obs_properties_get(props, "pause_marker_a"),
        (layout_value == 2 and enable_property_trigger_options and trigger_options_value == 2 and editable_list_has_values("text_arr_marker_a"))); -- F9
    obs.obs_property_set_visible(obs.obs_properties_get(props, "pause_marker_b"),
        (layout_value == 2 and enable_property_trigger_options and trigger_options_value == 2 and editable_list_has_values("text_arr_marker_b"))); -- F9
    obs.obs_property_set_visible(audio_marker_a_arr_prop,
        (layout_value == 2 and enable_property_trigger_options and trigger_options_value == 2 and audio_marker_a_value == 'list' and editable_list_has_values("text_arr_marker_a")));
    obs.obs_property_set_visible(audio_marker_b_arr_prop,
        (layout_value == 2 and enable_property_trigger_options and trigger_options_value == 2 and audio_marker_b_value == 'list' and editable_list_has_values("text_arr_marker_b")));
    obs.obs_property_set_visible(audio_marker_end_prop,
        ((in_table({ "TIMER END TEXT", "Select", "select", "invalid", "OVERTIME" }, timer_expire_event_value) or (is_expire_scene(timer_expire_event_value) and obs.obs_data_get_bool(settings, "expire_audio_first"))) and layout_value == 2 and enable_property_trigger_options and trigger_options_value == 2));
    obs.obs_property_set_visible(color_marker_a_prop,
        enable_property_color_marker_a and
        (layout_value == 2 and enable_property_trigger_options and trigger_options_value == 2 and editable_list_has_values("text_arr_marker_a")));
    obs.obs_property_set_visible(color_marker_b_prop,
        enable_property_color_marker_b and
        (layout_value == 2 and enable_property_trigger_options and trigger_options_value == 2 and editable_list_has_values("text_arr_marker_b")));
    obs.obs_property_set_visible(media_playback_limit_prop,
        (layout_value == 2 and enable_property_trigger_options and trigger_options_value == 2) and
        (editable_list_has_values("text_arr_marker_a") or editable_list_has_values("text_arr_marker_b")) and
        not (in_table({ 'none' }, audio_marker_a_value) and in_table({ 'none' }, audio_marker_b_value)));
    obs.obs_property_set_visible(duration_marker_a_prop,
        (layout_value == 2 and enable_property_trigger_options and trigger_options_value == 2 and media_playback_limit_value == 2) and
        (not in_table({ 'none' }, audio_marker_a_value)) and editable_list_has_values("text_arr_marker_a"));
    obs.obs_property_set_visible(duration_marker_b_prop,
        (layout_value == 2 and enable_property_trigger_options and trigger_options_value == 2 and media_playback_limit_value == 2) and
        (not in_table({ 'none' }, audio_marker_b_value)) and editable_list_has_values("text_arr_marker_b"));
    obs.obs_property_set_visible(a_note_prop,
        (is_note_text_id(media["note_source_unversioned_id_marker_a"]) and layout_value == 2 and enable_marker_notes_value ~= 1 and enable_property_trigger_options and trigger_options_value == 2 and not in_table(ignore_list, note_source_marker_a_value) and editable_list_has_values("text_arr_marker_a")));
    obs.obs_property_set_visible(b_note_prop,
        (is_note_text_id(media["note_source_unversioned_id_marker_b"]) and layout_value == 2 and enable_marker_notes_value ~= 1 and enable_property_trigger_options and trigger_options_value == 2 and not in_table(ignore_list, note_source_marker_b_value) and editable_list_has_values("text_arr_marker_b")));
    obs.obs_property_set_visible(a_source_prop,
        (layout_value == 2 and enable_marker_notes_value ~= 1 and enable_property_trigger_options and trigger_options_value == 2 and editable_list_has_values("text_arr_marker_a")));
    obs.obs_property_set_visible(b_source_prop,
        (layout_value == 2 and enable_marker_notes_value ~= 1 and enable_property_trigger_options and trigger_options_value == 2 and editable_list_has_values("text_arr_marker_b")));
    obs.obs_property_set_visible(reset_text_marker_a_prop,
        (layout_value == 2 and enable_property_trigger_options and trigger_options_value == 2 and editable_list_has_values("text_arr_marker_a")));
    obs.obs_property_set_visible(reset_text_marker_b_prop,
        (layout_value == 2 and enable_property_trigger_options and trigger_options_value == 2 and editable_list_has_values("text_arr_marker_b")));
    obs.obs_property_set_visible(hide_note_marker_a_prop,
        (layout_value == 2 and enable_property_trigger_options and trigger_options_value == 2 and enable_marker_notes_value ~= 1 and not in_table(ignore_list, note_source_marker_a_value) and editable_list_has_values("text_arr_marker_a")));
    obs.obs_property_set_visible(hide_note_marker_b_prop,
        (layout_value == 2 and enable_property_trigger_options and trigger_options_value == 2 and enable_marker_notes_value ~= 1 and not in_table(ignore_list, note_source_marker_b_value) and editable_list_has_values("text_arr_marker_b")));
    obs.obs_property_set_visible(duration_marker_end_prop,
        ((in_table({ "TIMER END TEXT", "Select", "select", "invalid", "OVERTIME" }, timer_expire_event_value) or (is_expire_scene(timer_expire_event_value) and obs.obs_data_get_bool(settings, "expire_audio_first"))) and layout_value == 2 and enable_property_trigger_options and trigger_options_value == 2 and media_playback_limit_value == 2));
    --[[

			BACKUP SETTINGS INPUTS

	]]
    obs.obs_property_set_visible(debug_enabled_prop,
        enable_property_debug and (layout_value == 2) and timer_options_value == 2);
    obs.obs_property_set_visible(backup_mode_prop,
        enable_property_backup and (layout_value == 2) and not in_table(ignore_list, timer_source_value) and
        timer_options_value == 2);
    obs.obs_property_set_visible(backup_split_time_prop,
        enable_property_backup and (layout_value == 2) and backup_mode_value and
        not in_table(ignore_list, timer_source_value) and timer_options_value == 2);
    obs.obs_property_set_visible(import_list_prop,
        enable_property_backup and backup_mode_value and backup_folder ~= "" and backup_folder ~= nil and
        layout_value == 2 and not in_table(ignore_list, timer_source_value) and timer_options_value == 2);
    obs.obs_property_set_visible(export_button_prop,
        enable_property_backup and backup_mode_value and backup_folder ~= "" and backup_folder ~= nil and
        layout_value == 2 and not in_table(ignore_list, timer_source_value));
    obs.obs_property_set_visible(export_folder_prop,
        enable_property_backup and backup_mode_value and layout_value == 2 and
        not in_table(ignore_list, timer_source_value) and timer_options_value == 2);
    -- B-050: one rule (a second call used to override the Backup Mode condition)
    obs.obs_property_set_visible(import_button_prop,
        enable_property_backup and backup_mode_value and
        import_list_value ~= "select" and import_list_value ~= "none" and import_list_value ~= "" and layout_value == 2 and
        not in_table(ignore_list, timer_source_value) and timer_options_value == 2);
    --[[

			OTHER INPUTS

	]]
    obs.obs_property_set_visible(disable_script_prop, layout_value == 2);
    obs.obs_property_set_visible(enable_direction_toggle_prop,
        layout_value == 2 and timer_options_value == 2 and
        (timer_mode_value == 2 and countdown_type_value == 2 or timer_mode_value == 1) and
        not in_table(ignore_list, timer_source_value));
    obs.obs_property_set_visible(prevent_negative_time_prop,
        enable_direction_toggle and layout_value == 2 and
        (timer_mode_value == 2 and countdown_type_value == 2 or timer_mode_value == 1) and
        not in_table(ignore_list, timer_source_value) and timer_options_value == 2);

    obs.obs_property_set_visible(_group_4_prop, select_features and timer_options_value == 2 and layout_value == 2);
    obs.obs_property_set_visible(select_features_prop, layout_value == 2 and timer_options_value == 2);
    --[[

		Try to prevent reference conflicts

	]]
    if (in_table({ timer_source_value, split_source_value, active_source_value, note_source_marker_b_value }, note_source_marker_a_value)) then
        obs.obs_data_set_string(settings, "note_source_marker_a", "select"); -- Don"t allow timer and marker_a note text source to be the same
    end
    if (in_table({ timer_source_value, split_source_value, active_source_value, note_source_marker_a_value }, note_source_marker_b_value)) then
        obs.obs_data_set_string(settings, "note_source_marker_b", "select"); -- Don"t allow timer and marker_b note text source to be the same
    end
    if (in_table({ timer_source_value, split_source_value, note_source_marker_a_value, note_source_marker_b_value }, active_source_value)) then
        obs.obs_data_set_string(settings, "active_source", "select"); -- Don"t allow timer and active text source to be the same
    end
    if countdown_type_value == 1 and month_value ~= 1 and day_value == 0 then
        obs.obs_data_set_int(settings, "day", 1); -- set to at least 1, else the timer won"t know it is at zero
    end
    --[[

		Some Calandar Stuff

	]]
    local adjsut_limit = (timer_mode == 2 and countdown_type ~= 1 or timer_mode ~= 2)
    --[[
		Duration inputs (manual set, and count down "Hours, Minutes, Seconds") accept
		0-9999 whatever the Time Format says. Unit-based limits only took effect after a
		panel refresh, and refreshing while typing in Time Format moves the cursor (B11).
		Any value is a valid duration (HH=30 is 1 day 6 hours); set_stopwatch() warns
		when a value cannot be shown by a {H…}/{M…} unit.
		"Specific Date & Time" count down keeps 0-23 / 0-59: those are a time of day.
	]]
    if adjsut_limit then
        obs.obs_property_int_set_limits(hours_prop, 0, 9999, 1);
        obs.obs_property_int_set_limits(sw_hours_saved_prop, 0, 9999, 1);
    else
        if (timer_hours > 23) then timer_hours = 23; end
        obs.obs_property_int_set_limits(hours_prop, 0, 23, 1);
        obs.obs_property_int_set_limits(sw_hours_saved_prop, 0, 23, 1);
    end
    if adjsut_limit then
        obs.obs_property_int_set_limits(minutes_prop, 0, 9999, 1);
        obs.obs_property_int_set_limits(sw_minutes_saved_prop, 0, 9999, 1);
    else
        if (timer_minutes > 59) then timer_minutes = 59; end
        obs.obs_property_int_set_limits(minutes_prop, 0, 59, 1);
        obs.obs_property_int_set_limits(sw_minutes_saved_prop, 0, 59, 1);
    end

    obs.obs_property_int_set_limits(day_prop, 1, 31, 1);

    if (month_value == 5 or month_value == 7 or month_value == 10 or month_value == 12) then
        obs.obs_property_int_set_limits(day_prop, 1, 30, 1);
    elseif (month_value == 3) then
        local leap = 28;
        if is_leap_year(year_value) then
            leap = 29;
        else
            leap = 28;
        end
        obs.obs_property_int_set_limits(day_prop, 1, leap, 1);
    end;
    --[[

		Defind same label titles

	]]
    if show_mili then
        obs.obs_property_set_description(mili_button_prop, "Hide Milliseconds");
    else
        obs.obs_property_set_description(mili_button_prop, "Show Milliseconds");
    end;
    --[[

		User defined a value for the millisecond trigger?
		If value defined, then hide millisecond button.
		If value not defined, then show millisecond button.

		Timer type is Count Down?
		Set button labels

	]]
    if timer_mode_value == 2 then
        obs.obs_property_set_description(reset_button_prop, "Reset Count Down Timer");
    else
        --[[
			Timer type is Count Up?
			Set button labels
		]]
        obs.obs_property_set_description(reset_button_prop, "Reset Count Up Timer");
    end;
    --[[
		Set button labels
	]]
    if timer_mode_value == 2 then
        obs.obs_property_set_description(direction_button_prop, direction_button_label()); -- B-051
        if timer_active then
            if split_startpause then
                obs.obs_property_set_description(start_button_prop, "Start Count Down Timer");
                obs.obs_property_set_description(pause_button_prop, "Pause Count Down Timer");
            else
                obs.obs_property_set_description(pause_button_prop, "Start/Pause Count Down Timer");
            end
        else
            if split_startpause then
                obs.obs_property_set_description(start_button_prop, "Start Count Down Timer");
                obs.obs_property_set_description(pause_button_prop, "Pause Count Down Timer");
            else
                obs.obs_property_set_description(pause_button_prop, "Start Count Down Timer");
            end
        end;
    else
        obs.obs_property_set_description(direction_button_prop, direction_button_label()); -- B-051
        if timer_active then
            if split_startpause then
                obs.obs_property_set_description(start_button_prop, "Start Count Up Timer");
                obs.obs_property_set_description(pause_button_prop, "Pause Count Up Timer");
            else
                obs.obs_property_set_description(pause_button_prop, "Start/Pause Count Up Timer");
            end
        else
            if split_startpause then
                obs.obs_property_set_description(start_button_prop, "Start Count Up Timer");
                obs.obs_property_set_description(pause_button_prop, "Pause Count Up Timer");
            else
                obs.obs_property_set_description(pause_button_prop, "Start Count Up Timer");
            end
        end;
    end;
    --[[
		Rebuild timer activation source lists
	]]
    obs.obs_property_list_clear(timer_activation_source_prop);
    obs.obs_property_list_add_string(timer_activation_source_prop, "Select", "select");
    --[[
		Returns an array of reference-incremented sources.
		Release with source_list_release().
	]]
    local all_sources = get_source_list("*");

    if enable_property_timer_activation and timer_activation == 4 then -- Build a Scene List
        local scenes = obs.obs_frontend_get_scene_names();
        if scenes ~= nil then
            for i, scene in ipairs(scenes) do
                obs.obs_property_list_add_string(timer_activation_source_prop, scene, scene); -- Add options to the list
            end;
            obs.bfree(scene);                                                                 -- free memory, release source as it is no longer needed
        end;
    elseif enable_property_timer_activation and timer_activation == 5 then                    -- Build a Source List
        list = {}                                                                             -- Reset / clear a defined table variable to be used to build lists that will be passed to the property list
        if tableHasValue(all_sources) then
            for _, sub in ipairs(all_sources) do
                local source_id = sub["unversioned_id"];
                local source_nested = sub["nested"];
                local name = sub["source_name"]
                if not in_table({ "group", "scene", "ffmpeg_source" }, source_id) then -- identify text type sources only
                    --[[
						add it to list so that it can be reordered
					]]
                    list[name] = name;
                end;
                if source_id == "scene" and source_nested then -- identify text type sources only
                    list[name] = name .. " [Scene]";
                end;
                if source_id == "group" and source_nested then -- identify text type sources only
                    list[name] = name .. " [Group]";
                end;
            end;
            obs.bfree(sub); -- free memory, release source as it is no longer needed
            --[[
				 This property list will be a type of string referenced items with a string value.
				 The string reference must be unique or it will/may be overriden.
				 Being string referenced the list will be compiled chronologically, thus the list
				 names (values) may appear unordered and random. To reorganise and arrange the list
				 alphabetically we will use pairsByKeys(). This will make it easier for the user to
				 review and select the desired item from the list.
			]]
            for key, value in pairsByKeys(list) do
                --[[
					add item to property list
				]]
                obs.obs_property_list_add_string(timer_activation_source_prop, value, key);
            end
        end
    elseif enable_property_timer_activation and timer_activation == 6 then -- Build a Media List
        list = {}                                                          -- Reset / clear a defined table variable to be used to build lists that will be passed to the property list
        if tableHasValue(all_sources) then
            for _, sub in ipairs(all_sources) do
                local source_id = sub["unversioned_id"];
                local source_nested = sub["nested"];
                local name = sub["source_name"]
                if in_table({ "ffmpeg_source" }, source_id) then -- identify text type sources only
                    --[[
						add it to list so that it can be reordered
					]]
                    list[name] = name;
                end;
            end;
            obs.bfree(sub); -- free memory, release source as it is no longer needed
            --[[
				 This property list will be a type of string referenced items with a string value.
				 The string reference must be unique or it will/may be overriden.
				 Being string referenced the list will be compiled chronologically, thus the list
				 names (values) may appear unordered and random. To reorganise and arrange the list
				 alphabetically we will use pairsByKeys(). This will make it easier for the user to
				 review and select the desired item from the list.
			]]
            for key, value in pairsByKeys(list) do
                --[[
					add item to property list
				]]
                obs.obs_property_list_add_string(timer_activation_source_prop, value, key);
            end
        end
    else
        obs.obs_data_set_string(settings, "timer_activation_source", "select"); -- Don"t allow timer and active text source to be the same
    end

    if not enable_property_timer_activation then
        obs.obs_data_set_string(settings, "timer_activation_source", "select"); -- Don"t allow timer and active text source to be the same
        obs.obs_data_set_int(settings, "timer_activation", 1);                  -- Don"t allow timer and active text source to be the same
        obs.obs_data_set_int(settings, "timer_reset", 1);                       -- Don"t allow timer and active text source to be the same
    end
    --[[
		Rebuild text source lists
	]]
    if tableHasKey(selected_source_list, property_name) then
        for i, v in pairs({ timer_source_prop, split_source_prop, active_source_prop, sub_limit_note_source_prop, note_source_marker_a_prop, note_source_marker_b_prop, add_limit_note_source_prop }) do
            local reference = obs.obs_property_name(v)
            obs.obs_property_list_clear(v);
            obs.obs_property_list_add_string(v, "Select", "select");
            list = {} -- Reset / clear a defined table variable to be used to build lists that will be passed to the property list
            if tableHasValue(all_sources) then
                for _, sub in ipairs(all_sources) do
                    local source_id = sub["unversioned_id"];
                    local source_nested = sub["nested"];
                    local name = sub["source_name"]
                    if source_id == text_source_unversioned_id or source_id == "text_ft2_source" then -- identify text type sources only
                        if not source_selected(name, reference) then
                            --[[
									add it to list so that it can be reordered
								]]
                            list[name] = name;
                        else
                            --continue
                        end;
                    end;
                    if in_table({ "note_source_marker_a", "note_source_marker_b" }, reference) and in_table({ "group", "scene" }, source_id) and source_nested then -- identify text type sources only
                        list[name] = name .. " [Group]";
                    end;
                end;
                obs.bfree(sub); -- free memory, release source as it is no longer needed
                --[[
						 This property list will be a type of string referenced items with a string value.
						 The string reference must be unique or it will/may be overriden.
						 Being string referenced the list will be compiled chronologically, thus the list
						 names (values) may appear unordered and random. To reorganise and arrange the list
						 alphabetically we will use pairsByKeys(). This will make it easier for the user to
						 review and select the desired item from the list.
					]]
                for key, value in pairsByKeys(list) do
                    --[[
							add item to property list
						]]
                    obs.obs_property_list_add_string(v, value, key);
                end
            end
            if v == split_source_prop and obs.obs_property_list_item_count(v) <= 1 then
                add_no_free_source_hint(v); -- B5: only "Select" in the list
            end
        end
    end
    --[[
		Other fancy stuff
	]]
    if sec_add_limit > 1 then
        obs.obs_property_int_set_suffix(sec_add_limit_prop, " Calls");
    end
    if sec_add_limit == 1 then
        obs.obs_property_int_set_suffix(sec_add_limit_prop, " Call");
    end
    if sec_add_limit == 0 then
        obs.obs_property_int_set_suffix(sec_add_limit_prop, "     Zero allow infinite calls");
    end

    if sec_sub_limit > 1 then
        obs.obs_property_int_set_suffix(sec_sub_limit_prop, " Calls");
    end
    if sec_sub_limit == 1 then
        obs.obs_property_int_set_suffix(sec_sub_limit_prop, " Call");
    end
    if sec_sub_limit == 0 then
        obs.obs_property_int_set_suffix(sec_sub_limit_prop, "     Zero allow infinite calls");
    end
    --[[
		Rebuild backup file list
	]]
    local filenames = get_filenames(backup_folder, ".json");
    local has_file_list = (table.getn(filenames) > 0);
    -- B-069: libobs (Windows) leaks one block per os_file_exists(""); the folder is empty by default
    if backup_folder ~= nil and backup_folder ~= "" and obs.os_file_exists(backup_folder) then
        obs.obs_property_list_clear(import_list_prop);
        obs.obs_property_list_add_string(import_list_prop, "No Files Found", "none");
        if has_file_list then
            obs.obs_property_list_clear(import_list_prop);
            obs.obs_property_list_add_string(import_list_prop, "Select a file, then click Import Settings", "select"); -- B-045 (review): picking no longer imports
            for i, v in pairs(filenames) do
                obs.obs_property_list_add_string(import_list_prop, v, v);
            end;
        end;
    end;
    --[[
		If the timer source value changed, check things
	]]
    if property_name == "timer_source" and in_table(ignore_list, timer_source_value) then
        obs.obs_data_set_int(settings, "trigger_options", 1);
        if enable_property_timer_manipulation and timer_manipulation == 2 then
            --[[
				Collapse "Expanded" to "Hidden". Do not force "Disabled":
				that silently switched the Add/Subtract hotkeys off (B2).
			]]
            obs.obs_data_set_int(settings, "timer_manipulation", 1);
        end
    end
    if timer_expire_event_value == "invalid" then
        obs.obs_data_set_string(settings, "timer_expire_event", "select");
    end
    -- IMPORTANT: returns true to trigger refresh of the properties
    return true;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: On Countdown expiry with a Source List, Scene List or Auto List expire event, shows the next entry of the list (for Auto List, the next child of the chosen group or scene). If the list has more than one entry and there is a default time, resets the timer and starts it again for the next entry.
	Scope: local; called by timer_ended
	type: helper (expire event)
	input type: source_type: string ("source", "scene" or "auto")
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function timer_expire_event_cycle_source_list(source_type)
    if disable_script then return; end;
    debug_log('timer_expire_event_cycle_source_list(' ..
        pre_dump(source_type) .. ') -- function variable names:  source_type ')
    local hasMultipleItems = false
    local source_list
    --[[
		The folowing section will only update cycle_index
		this is used to determine what the next item must be
	]]
    if timer_mode == 2 and source_type == "source" then
        source_list = get_cycle_source_list(source_type);
        if source_list ~= nil and tableHasValue(source_list) then
            cycle_index, source_list = cycle_source_list_by_source_type(source_list, source_type, cycle_index);
        end
    end
    --[[
		The folowing section will only update cycle_index
		this is used to determine what the next item must be
	]]
    if timer_mode == 2 and source_type == "scene" then
        source_list = get_cycle_source_list(source_type);
        if source_list ~= nil and tableHasValue(source_list) then
            cycle_index, source_list = cycle_source_list_by_source_type(source_list, source_type, cycle_index);
        end
    end
    --[[
		The folowing section will only update cycle_index
		this is used to determine what the next item must be
	]]
    if timer_mode == 2 and source_type == "auto" and not in_table(ignore_list, cycle_source_children) then
        local source_name = cycle_source_children
        source_list = list_source_children_by_source_name(source_name)
        if source_list ~= nil and tableHasValue(source_list) and not in_table(ignore_list, source_name) then
            set_visible(cycle_source_children, true);
            cycle_index, source_list = cycle_source_list_by_source_name(source_list, cycle_index);
        end
    end

    hasMultipleItems = (tablelength(source_list) > 1)
    --[[
		Set timer_active for it to self-start
	]]
    --timer_active = false
    if hasMultipleItems and default_seconds > 0 then -- B-007: a 0 s countdown would expire and restart every frame
        timer_event_active = true
        reset(true); -- Reset the timer
        timer_event_active = false
        startpause(true, true);
    end -- Restart the timer
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Ends the Timer Expired audio after End Audio Duration: hides it, stops its own timer, and makes a waiting expire-scene switch (F4).
	Scope: global; a timer callback added by play_timer_end_audio
	type: timer callback
	input type: none
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
function timer_end_media_end_callback()
    if disable_script then return; end;
    debug_log('timer_end_media_end_callback() -- function variable names:  ')
    set_visible(media['source_name_audio_marker_end'], false);
    media["playing_audio_marker_end"] = nil; -- B-076 (review): no longer playing
    timer_remove(timer_end_media_end_callback);
    if pending_expire_scene ~= nil then switch_to_expire_scene(pending_expire_scene) end -- F4: audio done, now switch
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Plays the Timer Expired audio: shows the source, connects its media-ended signal, and starts the End Audio Duration timer when "Media Playback Limit" is enabled with a duration.
	Scope: global; called by start_overtime and timer_ended
	type: helper (media)
	input type: none
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
function play_timer_end_audio()
    --[[
		if a Media source has not been defined, then ignore
	]]
    if not in_table(ignore_list, media["source_name_audio_marker_end"]) then
        set_visible(media["source_name_audio_marker_end"], true); -- play the media
        media["playing_audio_marker_end"] = media["source_name_audio_marker_end"]; -- B-076 (review)
        disconnect_after_media_end("marker_end");                 -- attach a signal handler to set source hidden when media playback ends
        --[[
			If the user wants the media to stop after defined duration
			we need to add this timer callback
		]]
        if media["duration_marker_end"] ~= 0 and media_playback_limit ~= 1 then
            timer_remove(timer_end_media_end_callback);                                               -- Remove any existing callbacks if they exist before assigning a new callback
            timer_add(timer_end_media_end_callback, math.floor(media["duration_marker_end"] * 1000)); --<- milliseconds
        end;
    end;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Starts overtime when a countdown reaches zero with the "OVERTIME" expire event: the timer keeps running and counts up, Auto Recording "Timer Expires" and the expiry audio are triggered, and with "Overtime: show '+' and Marker B colour" the pending marker colour resets are cancelled and the Marker B colour is set (F2).
	Scope: global; called by set_time_text
	type: helper (expire event)
	input type: none
	returns: none
	Credit: AkashicStreaming (feature request)
----------------------------------------------------------------------------------------------------------------------------------------
]]
function start_overtime()
    debug_log('start_overtime()')
    overtime_active = true;
    current_count_direction = "UP";
    count_orientation = "INVERTED";
    direction_changed = true;
    record(2, 100);         -- "Timer Expires" recording trigger, as on a normal expiry
    play_timer_end_audio(); -- Timer Expired Audio, as on a normal expiry
    if overtime_style then
        --[[
			B-013 / B-012 (decision 2026-10-09): overtime sets its own colour, so a
			marker colour reset still pending is cancelled instead of painting the
			normal colour over it.
		]]
        reset_text_a_colour_end_timer();
        reset_text_b_colour_end_timer();
        for _, ref in ipairs({ "marker_a", "marker_b" }) do
            media["colour_due_" .. ref] = nil;
            media["colour_left_" .. ref] = nil;
        end
        set_timer_text_color(media["color_marker_b"]);
        color_normal_updated = true; -- stop update_timer_display() repainting the normal colour over it
    end
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Switches to the Timer Expire Event scene, hiding the timer in the other scenes and recording the switch as the script's own, then resets the timer settings. Used straight away on expiry, or (F4, "Play Timer Expired Audio first, then switch") once the audio is done.
	Scope: global; called by timer_ended, timer_end_media_end_callback and expire_scene_switch_callback
	type: helper (expire event)
	input type: scene_name: string (scene name; nothing happens if it doesn't exist)
	returns: none
	Credit: SheriMJ (feature request, F4)
----------------------------------------------------------------------------------------------------------------------------------------
]]
function switch_to_expire_scene(scene_name)
    debug_log('switch_to_expire_scene(' .. pre_dump(scene_name) .. ')')
    pending_expire_scene = nil;
    local source = obs.obs_get_source_by_name(scene_name);
    if source == nil then return end -- B-006: no such scene (renamed or deleted): keep the timer visible
    -- B-031 (decision 2026-10-11): hide the timer in every scene except the expire scene,
    -- where it may be showing the end text
    set_visible(timer_source, false, scene_name);
    note_self_switch(scene_name); -- B-065
    obs.obs_frontend_remove_event_callback(on_event)
    obs.obs_frontend_set_current_scene(source)
    obs.obs_frontend_add_event_callback(on_event)
    obs.obs_source_release(source);
    --[[
		used to be fresh_start
		set_to_default: 	true		false
		timer_active: 		true		false
		activated:			true		false
		timer_expired:		false		true
		update_timer_settings ---> set_time_text ---> timer_ended ---> update_timer_settings -- death loop
	]]
    update_timer_settings(true); -- optional inputs: set_to_default(bool), new_settings(obs_property_data/obs_userdata)
end
--[[
	F4: one-shot, so the switch after a natural media end runs on the timer thread
]]
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Makes a waiting expire-scene switch after the Timer Expired media ended naturally, from a one-shot timer so it runs on the timer thread (F4). Stops its own timer first.
	Scope: global; a timer callback added by signal_media_ended
	type: timer callback
	input type: none
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
function expire_scene_switch_callback()
    timer_remove(expire_scene_switch_callback);
    if pending_expire_scene ~= nil then switch_to_expire_scene(pending_expire_scene) end
end
--[[
	F4: true when the Timer Expire Event value is a scene name (not one of the fixed options)
]]
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Tells whether a Timer Expire Event value is a scene name rather than one of the fixed options (F4).
	Scope: global; called by property_onchange and timer_ended
	type: helper (expire event)
	input type: value: string or nil (the Timer Expire Event value)
	returns: bool
----------------------------------------------------------------------------------------------------------------------------------------
]]
function is_expire_scene(value)
    return value ~= nil and value ~= "" and
        not in_table({ "select", "Select", "TIMER END TEXT", "OVERTIME", "Source List", "Scene List", "Auto List", "invalid" }, value);
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Handles a timer that reached its end: stops it, lets pending marker colour resets and media limits run on, triggers Auto Recording "Timer Expires", stops looping marker media, and runs the Countdown expire event (switch scene, perhaps after the audio; cycle a list; show the Timer Expired Text; play the expiry audio).
	Scope: global; called by set_time_text
	type: helper (expire event)
	input type: source_name: string or nil (the timer source)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
function timer_ended(source_name)
    if disable_script then return; end;
    debug_log('timer_ended(' .. pre_dump(source_name) .. ') -- function variable names:  source_name ')

    if source_name == nil or in_table(ignore_list, source_name) then
        return
    end
    --[[
		stop the timer
	]]
    activate(false); -- This will remove the callback.
    pause_carry_ns = 0; -- B-015: an expired run carries nothing over into a restart
    --[[
		B-012 (decision 2026-10-09): a marker colour reset that was still pending
		completes after the expiry (activate(false) suspended it like a pause).
		Overtime, which sets its own colour, doesn't come through here (B-013).
	]]
    for _, ref in ipairs({ "marker_a", "marker_b" }) do
        local left = media["colour_left_" .. ref];
        if left ~= nil and left > 0 then reset_marker_text_colour_start_timer(left, ref) end
        media["colour_left_" .. ref] = nil;
    end
    rearm_media_limits(); -- B-068: marker audio still playing at expiry keeps its duration limit (B-011: it may finish)
    --[[
		If user wants recording to start when timer ended, now is a good timer to initiate recording
		NOTE: Recording will only be started, if it is not already recording
	]]
    record(2, 100);
    --[[
		Force media playback to end, if the media is looping
	]]
    stop_looping_media("marker_a");
    stop_looping_media("marker_b");
    --[[
		Timer expired and a scene change is requested.
	]]
    if timer_mode == 2 and is_expire_scene(timer_expire_event) then -- B-006: the stored "select" / "invalid" are no scene
        --[[
			F4: "Play Timer Expired Audio first, then switch": play the audio now and switch
			when it is done (End Audio Duration, or the media ends). Otherwise switch now.
		]]
        if expire_audio_first and not in_table(ignore_list, media["source_name_audio_marker_end"]) then
            pending_expire_scene = timer_expire_event;
            play_timer_end_audio();
        else
            switch_to_expire_scene(timer_expire_event);
        end
        --[[
			The timer expired and the timer will not restart.
		]]
        timer_expired = true;
        timer_active = false;
    end

    if timer_mode == 2 and in_table({ "Scene List", "Source List", "Auto List" }, timer_expire_event) then
        -- assign source_type here
        local source_type

        if timer_expire_event == "Scene List" then
            source_type = "scene"
        elseif timer_expire_event == "Source List" then
            source_type = "source"
        elseif timer_expire_event == "Auto List" then
            source_type = "auto"
        else
            -- Handle unexpected case, if needed
            source_type = "unknown"
        end

        timer_expire_event_cycle_source_list(source_type);
    end

    if timer_mode == 2 and timer_expire_event == "TIMER END TEXT" then
        local text = stop_text;
        set_text(source_name, text);
    end
    --[[
			for now, only limit the timer end media playback
			for these settings:
		]]
    if timer_mode == 2 and in_table({ "TIMER END TEXT", "Select", "select", "invalid" }, timer_expire_event) then
        play_timer_end_audio(); -- B-006 (decision 2026-10-09): "Select" = no expire action, but the end audio plays
    end;
    --[[
		TODO> We want to update the timer start button description at this point.
	]]
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Builds the script's settings panel: every property in display order, with their lists, tooltips, buttons, groups and modified callbacks; the order here is the order in the panel.
	Scope: global; called by OBS when the panel is shown or rebuilt
	type: OBS entry point
	input type: none
	returns: obs_properties: the panel
----------------------------------------------------------------------------------------------------------------------------------------
]]
function script_properties()
    debug_log('script_properties() -- function variable names: ')

    props = obs.obs_properties_create(); -- save original object
    ctx.propsDef = props;                -- this becomes a data object
    --[[
		F5: first item in the form, so it is easy to find with the description hidden.
		The description (title, icon, links, help text) takes a lot of space above
		the settings on small screens (rez1dev). Untick to hide it.
	]]
    local p_0 = obs.obs_properties_add_bool(ctx.propsDef, "enable_property_description", "Script Description");
    obs.obs_property_set_long_description(p_0,
        "\nShow the title, version and links above the settings.\n\nUntick to hide them and give the settings more room on small screens.\n\nOBS reads the description when the script loads: press 'Reload Scripts' (or restart OBS) to apply.\n"); -- User Tip
    --[[
		Option list: User select type of timer required.

		This property is referenced to trigger an onchange event listener.
	]]
    local p_1 = obs.obs_properties_add_list(ctx.propsDef, "timer_mode", "<b>Timer Mode</b>", obs.OBS_COMBO_TYPE_LIST,
        obs.OBS_COMBO_FORMAT_INT);
    t_type = { "Count Up", "Count Down" };                                     -- Add options to the list
    for i, v in ipairs(t_type) do obs.obs_property_list_add_int(p_1, v, i) end -- This list is auto indexed thus have an interger reference containing a string value
    --[[
		Option list: User select to access Basic or Advanced Features.
		This provides UI layout options to enhance the user experience.
		Changing this setting does not impact any function or result.

		This property is referenced to trigger an onchange event listener.
	]]
    local p_2 = obs.obs_properties_add_list(ctx.propsDef, "layout", "<font color=" .. font_highlight .. ">Layout</font>",
        obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT);
    t_type = { "Basic", "Advanced" };                                          -- Adds options to the list
    for i, v in ipairs(t_type) do obs.obs_property_list_add_int(p_2, v, i) end -- This list is auto indexed thus have an interger reference containing a string value
    --[[
		Option list: User select to access show or hide available features.
		This provides UI layout options to enhance the user experience.
		Changing this setting does not impact any function or result.

		This property is referenced to trigger an onchange event listener.
	]]
    local p_3 = obs.obs_properties_add_list(ctx.propsDef, "timer_options",
        "<font color=" .. font_highlight .. "><b>Timer Settings</b></font>", obs.OBS_COMBO_TYPE_LIST,
        obs.OBS_COMBO_FORMAT_INT);
    t_type = { "Hidden", "Expanded" };                                                          -- Add options to the list
    for i, v in ipairs(t_type) do obs.obs_property_list_add_int(p_3, v, i) end                  -- This list is auto indexed thus have an interger reference containing a string value
    obs.obs_property_set_long_description(p_3, "\nExpand or hide additional timer options.\n"); -- User Tip
    --[[
		Returns an array of reference-incremented sources.
		Release with source_list_release().
	]]
    local sources = obs.obs_enum_sources();
    --[[
		Returns table with all sources, including nested scenes.
	]]
    local all_sources = get_source_list("*");
    --[[
		Option list: User select <text-source> to be used as visual feedback indicating a time stamp.
		This provides function options that will impact on visual feedback to the user.
		Changing this setting will impact on the function or end result.
	]]
    local p_4 = obs.obs_properties_add_list(ctx.propsDef, "timer_source", "<i>Timer Source</i>", obs.OBS_COMBO_TYPE_LIST,
        obs.OBS_COMBO_FORMAT_STRING);
    obs.obs_property_list_add_string(p_4, "Select", "select");     -- Adds a default option to the list. First (top-most) list item. If selected the option is ignored.
    local list = {};                                               -- Define a table variable to be used to build lists that will be passed to the property list
    if sources ~= nil then
        for _, source in ipairs(sources) do                        -- ipairs cycles auto incrimented items
            source_id = obs.obs_source_get_unversioned_id(source); -- unversioned_id will not be affected by language settings
            if source_id == text_source_unversioned_id then        -- identify text type sources only
                local name = obs.obs_source_get_name(source);      -- Get the source name, this will be a unique identifier
                --[[
					boolean check, is the source (name) already selected for another item?
					This will help to limit conflicts to prevent using a single source for two sperate functions
				]]
                local reference = "timer_source";
                if not source_selected(name, reference) then -- boolean check
                    --[[
						add it to the (temp) table (list)
					]]
                    list[name] = name;
                else
                    -- continue to skip potential conflicts
                end
            end
        end
        obs.bfree(source); -- free memory, release source as it is no longer needed
        --[[
			 This property list will be a type of string referenced items with a string value.
			 The string reference must be unique or it will/may be overriden.
			 Being string referenced the list will be compiled chronologically, thus the list
			 names (values) may appear unordered and random. To reorganise and arrange the list
			 alphabetically we will use pairsByKeys(). This will make it easier for the user to
			 review and select the desired item from the list.
		]]
        for key, value in pairsByKeys(list) do
            --[[
				add item to property list
			]]
            obs.obs_property_list_add_string(p_4, value, value); -- add the item to the property list using a string reference with a string value
        end
    end
    --[[
		Option list: User select a reference to be used as control to switch the timer between countup and countdown.
		This provides function options that will impact operation and behaviour.
		Changing this setting will impact on the function or end result.

		This property is referenced to trigger an onchange event listener.
	]]
    local p_5 = obs.obs_properties_add_list(ctx.propsDef, "countdown_type",
        "<font color=" .. font_dimmed .. ">Count Down Type</font>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT);
    t_type = { "Specific Date & Time", "Hours, Minutes, Seconds" };             -- Add options to the list
    for i, v in ipairs(t_type) do obs.obs_property_list_add_int(p_5, v, i) end; -- This list is auto indexed thus have an interger reference containing a string value
    --[[
		 Text Field
	]]
    local p_6 = obs.obs_properties_add_text(ctx.propsDef, "day_text",
        "<font color=" .. font_dimmed .. ">Day Text Format</font>", obs.OBS_TEXT_DEFAULT);
    obs.obs_property_set_long_description(p_6,
        "\nUsed to distinguish between singular and plural days format. Use this for singular.\n"); -- User Tip
    --[[
		 Text Field
	]]
    local p_7 = obs.obs_properties_add_text(ctx.propsDef, "days_text",
        "<font color=" .. font_dimmed .. ">Days Text Format</font>", obs.OBS_TEXT_DEFAULT);
    obs.obs_property_set_long_description(p_7,
        "\nUsed to distinguish between singular and plural days format. Use this for plural.\n"); -- User Tip
    --[[
		Option list: User select month reference to be used as control to set a timer for a future date.
		This provides function options that will impact on function and operation of the timer.
		Changing this setting will impact on the function or end result.

		This property is referenced to trigger an onchange event listener.
	]]
    local p_8 = obs.obs_properties_add_list(ctx.propsDef, "month", "<font color=" .. font_dimmed .. ">Month</font>",
        obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT);
    t_type = { "Select", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October",
        "November", "December" };                                               -- Add options to the list
    for i, v in ipairs(t_type) do obs.obs_property_list_add_int(p_8, v, i) end; -- This list is auto indexed thus have an interger reference containing a string value
    --[[
		 Inerger Field

		This property is referenced to trigger an onchange event listener.
	]]
    local p_9 = obs.obs_properties_add_int(ctx.propsDef, "year", "<font color=" .. font_dimmed .. ">Year</font>", 2022,
        212021221, 1);
    --[[
		 Inerger Field
	]]
    local p_10 = obs.obs_properties_add_int(ctx.propsDef, "day", "<font color=" .. font_dimmed .. ">Day</font>", 1, 31, 1);
    --[[
		 Inerger Field
	]]
    local p_11 = obs.obs_properties_add_int(ctx.propsDef, "hours", "<font color=" .. font_dimmed .. ">Hours</font>", 0,
        23, 1);
    obs.obs_property_int_set_suffix(p_11, " Hours");
    --[[
		 Inerger Field
	]]
    local p_12 = obs.obs_properties_add_int(ctx.propsDef, "minutes", "<font color=" .. font_dimmed .. ">Minutes</font>",
        0, 59, 1);
    obs.obs_property_int_set_suffix(p_12, " Minutes");
    --[[
		 Inerger Field
	]]
    local p_13 = obs.obs_properties_add_int(ctx.propsDef, "seconds", "<font color=" .. font_dimmed .. ">Seconds</font>",
        0, 59, 1);
    obs.obs_property_int_set_suffix(p_13, " Seconds");
    --[[
		Option list: User select a reference to be used as control format the timer timestamp.
		This provides function options that will impact on visual feedback and does not impact any function and operation of the timer.
		Changing this setting will impact on visual feedback and not function.

		This property is referenced to trigger an onchange event listener.
	]]
    local p_14 = obs.obs_properties_add_list(ctx.propsDef, "timer_format", "Timer Format", obs.OBS_COMBO_TYPE_LIST,
        obs.OBS_COMBO_FORMAT_INT);
    t_type = { "Display full format", "No leading zeros", "No leading zeros, no split seconds", "No split seconds",
        "Custom Time Format" };                                                  -- Add options to the list
    for i, v in ipairs(t_type) do obs.obs_property_list_add_int(p_14, v, i) end; -- This list is auto indexed thus have an interger reference containing a string value
    --[[
		 Text Field

		This property is referenced to trigger an onchange event listener.
	]]
    local p_15 = obs.obs_properties_add_text(ctx.propsDef, "custom_time_format",
        "<font color=" .. font_dimmed .. ">Time Format</font>", obs.OBS_TEXT_DEFAULT);
    obs.obs_property_set_long_description(p_15,
        "\n Timestamp is represented by $D = day, $H = hour, $M = minute, $S = second, $F = split second.\n" ..
        " Default is \"$T$D:$H:$M:$S,$F\"\n\n" ..
        " To change the hour or minute unit, write the placeholder as {$H999} or {$M999}, where the number is the unit.\n" ..
        " {$M200}:$S counts minutes up to 199:59. {$H100}:$M:$S counts hours up to 99.\n" ..
        " Units of 100 or more are zero-padded to a fixed width.\n" ..
        " To show split seconds as frames, write {$F60} (60 fps) or {$F} (OBS output frame rate) instead of $F.\n" ..
        " The older form, {M90} or {H100M200} anywhere in the format, still works.\n\n" ..
        " To trim leading zeros, include $T = truncate leading zeros. This will ONLY affect a format matching '$D:$H:$M:$S,$F' (00:00:00:00,00)\n");                                                                                                                                                                       -- User Tip
    local p_15_r = obs.obs_properties_add_bool(ctx.propsDef, "round_up_countdown", "Round up displayed countdown");                                                                                                                                                                                                        -- F8
    obs.obs_property_set_long_description(p_15_r,
        "\nCount Down only, and only when the Time Format has no seconds ($S).\n\nOn: the display rounds up to the smallest unit shown, so '$H:$M' reads 00:01 until the timer reaches zero.\nOff: the display rounds down, so it reads 00:00 for the last 59 seconds.\n\nMarkers and the timer end are not affected.\n"); -- User Tip
    --[[
		Option list: User select to show or hide available features.
		This provides UI layout options to enhance the user experience.
		Changing this setting does not impact any function or result.

		This property is referenced to trigger an onchange event listener.
	]]
    local p_65 = obs.obs_properties_add_list(ctx.propsDef, "timer_activation",
        "<font color=" .. font_dimmed .. ">Timer Activation</font>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT);
    t_type = { "Manually", "Timer Source Visible", "Timer Scene Active", "Specific Scene Active",
        "Specific Source Active", "Specific Media Active", "Recording Started", "Streaming Started" }; -- Add options to the list
    for i, v in ipairs(t_type) do obs.obs_property_list_add_int(p_65, v, i) end;                       -- This list is auto indexed thus have an interger reference containing a string value
    obs.obs_property_set_long_description(p_65, "\nConfigure how the timer is activated.\n");          -- User Tip
    --[[
		Option list: User select <option> to be used.
	]]
    local p_65_a = obs.obs_properties_add_list(ctx.propsDef, "timer_activation_source", "<i>Activation Source</i>",
        obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING);
    obs.obs_property_list_add_string(p_65_a, "Select", "select");                                -- Adds a default option to the list. First (top-most) list item. If selected the option is ignored.
    obs.obs_property_set_long_description(p_65_a, -- B-047: was p_65_b (declared below: nil here)
        "\nSelect a trigger source that activates the timer upon its visibility or display.\n"); -- User Tip
    --[[
		Option list: User select to show or hide available features.
		This provides UI layout options to enhance the user experience.
		Changing this setting does not impact any function or result.

		This property is referenced to trigger an onchange event listener.
	]]
    local p_65_b = obs.obs_properties_add_list(ctx.propsDef, "timer_reset",
        "<font color=" .. font_dimmed .. ">Timer Reset</font>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT);
    t_type = { "Manual", "Auto" };                                                                        -- Add options to the list
    for i, v in ipairs(t_type) do obs.obs_property_list_add_int(p_65_b, v, i) end;                        -- This list is auto indexed thus have an interger reference containing a string value
    obs.obs_property_set_long_description(p_65_b,
        "\nChoose how the timer resets: manually by you, or automatically based on specific actions.\n"); -- User Tip

    --[[
		 Text Field

		This property is referenced to trigger an onchange event listener.
	]]
    local p_16 = obs.obs_properties_add_text(ctx.propsDef, "toggle_mili_trigger",
        "<font color=" .. font_dimmed .. ">Toggle Milliseconds</font>", obs.OBS_TEXT_DEFAULT);
    obs.obs_property_set_long_description(p_16,
        "\nUse format 00:00:00 ( hours:minutes:seconds ) \nSetting to determine when to show Milliseconds\n"); -- User Tip
    --[[
		Option list: User select <text-source> to be used as visual feedback indicating a snip of the time stamp.
		This provides function options that will impact on visual feedback to the user.
		Changing this setting will not impact on the function or end result.
	]]
    local p_18 = obs.obs_properties_add_list(ctx.propsDef, "split_source", "<i>Split Source</i>", obs
        .OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING);
    obs.obs_property_list_add_string(p_18, "Select", "select"); -- Adds a default option to the list. First (top-most) list item. If selected the option is ignored.
    list = {}                                                   -- Reset / clear a defined table variable to be used to build lists that will be passed to the property list
    if sources ~= nil then
        for _, source in ipairs(sources) do
            source_id = obs.obs_source_get_unversioned_id(source); -- unversioned_id will not be affected by language settings
            if source_id == text_source_unversioned_id then        -- identify text type sources only
                local name = obs.obs_source_get_name(source);
                local reference = "split_source";
                if not source_selected(name, reference) then
                    --[[
						add it to list so that it can be reordered
					]]
                    list[name] = name;
                else
                    --continue
                end
            end
        end
        obs.bfree(source); -- free memory, release source as it is no longer needed
        --[[
			 This property list will be a type of string referenced items with a string value.
			 The string reference must be unique or it will/may be overriden.
			 Being string referenced the list will be compiled chronologically, thus the list
			 names (values) may appear unordered and random. To reorganise and arrange the list
			 alphabetically we will use pairsByKeys(). This will make it easier for the user to
			 review and select the desired item from the list.
		]]
        for key, value in pairsByKeys(list) do
            --[[
				add item to property list
			]]
            obs.obs_property_list_add_string(p_18, value, value);
        end
        if next(list) == nil then add_no_free_source_hint(p_18) end -- B5
    end
    obs.obs_property_set_long_description(p_18,
        "\nText source that receives the split times.\n\nIt must be a different Text source from the Timer Source (and the other text roles), so it is not listed if it is already used.\n\nAdded a Text source while this panel is open? Press 'Refresh sources'.\n"); -- User Tip
    local p_18_r = obs.obs_properties_add_button(ctx.propsDef, "split_source_refresh", "Refresh sources",
        split_source_refresh_clicked);                                                                                                                                                                                                                                  -- B5

    local p_19 = obs.obs_properties_add_list(ctx.propsDef, "split_type", "Split Type", obs.OBS_COMBO_TYPE_LIST,
        obs.OBS_COMBO_FORMAT_INT);
    t_type = { "Interval", "Mark", "Mark Interval", "Interval Mark" };                      -- Add options to the list
    for i, v in ipairs(t_type) do obs.obs_property_list_add_int(p_19, v, i) end;            -- This list is auto indexed thus have an interger reference containing a string value
    obs.obs_property_set_long_description(p_19,
        "\nInterval = Time between current and previous split.\n\nMark = Time of split\n"); -- User Tip
    --[[
		Option list: User select to show or hide available features.
		This provides UI layout options to enhance the user experience.
		Changing this setting does not impact any function or result.

		This property is referenced to trigger an onchange event listener.
	]]
    local p_20 = obs.obs_properties_add_list(ctx.propsDef, "trigger_options",
        "<font color=" .. font_highlight .. "><b>Marker Settings</b></font>", obs.OBS_COMBO_TYPE_LIST,
        obs.OBS_COMBO_FORMAT_INT);
    t_type = { "Hidden", "Expanded" };                                                                              -- Add options to the list
    for i, v in ipairs(t_type) do obs.obs_property_list_add_int(p_20, v, i) end;                                    -- This list is auto indexed thus have an interger reference containing a string value
    obs.obs_property_set_long_description(p_20, "\nExpand or hide additional options triggered by time stamps.\n"); -- User Tip

    local p_21_n = obs.obs_properties_add_text(ctx.propsDef, "text_marker_tip",
        "<font color=" .. font_dimmed .. ">Tip</font>", obs.OBS_TEXT_DEFAULT);
    obs.obs_property_set_long_description(p_21_n, "\nUse format 00:00:00 ( hours:minutes:seconds )\n"); -- User Tip
    obs.obs_property_set_enabled(p_21_n, false);
    --[[
		Editable Option list: User adds a text time stamp that will trigger time Marker functions.
		This provides function options to change feature behaviour.
		Changing this setting will impact on feature behaviour.
	]]
    local p_21 = obs.obs_properties_add_editable_list(ctx.propsDef, "text_arr_marker_a", "Marker A Time",
        obs.OBS_EDITABLE_LIST_TYPE_STRINGS, nil, nil);
    obs.obs_property_set_long_description(p_21, "\nExpand or hide additional options triggered by time stamps.\n"); -- User Tip
    obs.obs_property_set_long_description(p_21, "\nUse format 00:00:00 ( hours:minutes:seconds )\n");               -- User Tip
    --[[
		Editable Option list: User adds a text time stamp that will trigger time Marker functions.
		This provides function options to change feature behaviour.
		Changing this setting will impact on feature behaviour.
	]]
    local p_22 = obs.obs_properties_add_editable_list(ctx.propsDef, "text_arr_marker_b", "Marker B Time",
        obs.OBS_EDITABLE_LIST_TYPE_STRINGS, nil, nil);
    --[[
		F9: pause the timer when a marker time is reached
	]]
    local p_22_pa = obs.obs_properties_add_bool(ctx.propsDef, "pause_marker_a", "Pause timer at Marker A");
    obs.obs_property_set_long_description(p_22_pa,
        "\nPause the timer when it reaches a Marker A time. Press Start to continue.\n\nExample (football): Marker A = 00:45:00 pauses at half time.\n\nMarker A audio, colour and note still play.\n"); -- User Tip
    local p_22_pb = obs.obs_properties_add_bool(ctx.propsDef, "pause_marker_b", "Pause timer at Marker B");
    obs.obs_property_set_long_description(p_22_pb,
        "\nPause the timer when it reaches a Marker B time. Press Start to continue.\n\nExample (football): Marker B = 01:30:00 pauses at full time.\n\nMarker B audio, colour and note still play.\n"); -- User Tip
    --*props, *name, *description, min, max, step
    obs.obs_properties_add_int_slider(ctx.propsDef, "reset_text_marker_a", "Reset Marker A Text", 0, 10800, 1);
    obs.obs_properties_add_int_slider(ctx.propsDef, "reset_text_marker_b", "Reset Marker B Text", 0, 10800, 1);
    --[[
		Option list: User select <media-source> to be used as audio visual at a defined time.
		This provides function options that will impact on audio visual feedback to the user.
		Changing this setting will impact on a function or end result.
	]]
    local p_23 = obs.obs_properties_add_list(ctx.propsDef, "audio_marker_a",
        "<font color=" .. font_dimmed .. ">Marker A Audio</font>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING);
    obs.obs_property_set_long_description(p_23, "\nSelect available media source to activate on defined time stamp.\n"); -- User Tip
    obs.obs_property_list_add_string(p_23, "None", "none");                                                              -- Add options to the list
    obs.obs_property_list_add_string(p_23, "Allow Multiple Selections", "list");                                         -- Add options to the list
    if sources ~= nil then
        for _, source in ipairs(sources) do
            source_id = obs.obs_source_get_unversioned_id(source); -- unversioned_id will not be affected by language settings
            if source_id == "ffmpeg_source" then                   -- identify media type sources only
                local name = obs.obs_source_get_name(source);
                obs.obs_property_list_add_string(p_23, name, name);
            end
        end
        obs.bfree(source); -- free memory, release source as it is no longer needed
    end
    --[[
	]]

    local p_23a = obs.obs_properties_add_editable_list(ctx.propsDef, "audio_marker_a_arr", "Marker A Audio List",
        obs.OBS_EDITABLE_LIST_TYPE_STRINGS, nil, nil);
    --[[
		Option list: User select <media-source> to be used as audio visual at a defined time.
		This provides function options that will impact on audio visual feedback to the user.
		Changing this setting will impact on a function or end result.
	]]
    local p_24 = obs.obs_properties_add_list(ctx.propsDef, "audio_marker_b",
        "<font color=" .. font_dimmed .. ">Marker B Audio</font>", obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING);
    obs.obs_property_set_long_description(p_24, "\nSelect available media source to activate on defined time stamp.\n"); -- User Tip
    obs.obs_property_list_add_string(p_24, "None", "none");                                                              -- Add options to the list
    obs.obs_property_list_add_string(p_24, "Allow Multiple Selections", "list");                                         -- Add options to the list
    if sources ~= nil then
        for _, source in ipairs(sources) do
            source_id = obs.obs_source_get_unversioned_id(source); -- unversioned_id will not be affected by language settings
            if source_id == "ffmpeg_source" then                   -- identify media type sources only
                local name = obs.obs_source_get_name(source);
                obs.obs_property_list_add_string(p_24, name, name);
            end
        end
        obs.bfree(source); -- free memory, release source as it is no longer needed
    end
    --[[
	]]

    local p_24a = obs.obs_properties_add_editable_list(ctx.propsDef, "audio_marker_b_arr", "Marker B Audio List",
        obs.OBS_EDITABLE_LIST_TYPE_STRINGS, nil, nil);
    --[[
		Option list: User select <media-source> to be used as audio visual at a defined time.
		This provides function options that will impact on audio visual feedback to the user.
		Changing this setting will impact on a function or end result.
	]]
    local p_25 = obs.obs_properties_add_list(ctx.propsDef, "audio_marker_end",
        "<font color=" .. font_dimmed .. ">Timer Expired Audio</font>", obs.OBS_COMBO_TYPE_LIST,
        obs.OBS_COMBO_FORMAT_STRING)
    obs.obs_property_set_long_description(p_25, "\nSelect available media source to activate when the timer expired.\n") -- User Tip
    obs.obs_property_list_add_string(p_25, "None", "none")                                                               -- Add options to the list
    if sources ~= nil then
        for _, source in ipairs(sources) do
            source_id = obs.obs_source_get_unversioned_id(source) -- unversioned_id will not be affected by language settings
            if source_id == "ffmpeg_source" then                  -- identify media type sources only
                local name = obs.obs_source_get_name(source)
                obs.obs_property_list_add_string(p_25, name, name)
            end
        end
        obs.bfree(source) -- free memory, release source as it is no longer needed
    end
    --[[
		Option list: User select a reference to be used as control to enable a time limit for media playback.
		This provides function options that will impact on audio visual feedback and does impact a function and operation of the timer.
		Changing this setting will impact on audio visual feedback and function.

		This property is referenced to trigger an onchange event listener.
	]]
    local p_26 = obs.obs_properties_add_list(ctx.propsDef, "media_playback_limit", "<i>Media Playback Limit</i>",
        obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT);
    t_type = { "Disabled", "Enabled" };                                                              -- Add options to the list
    for i, v in ipairs(t_type) do obs.obs_property_list_add_int(p_26, v, i) end;                     -- This list is auto indexed thus have an interger reference containing a string value
    obs.obs_property_set_long_description(p_26, "\nSet a maximum time limit for media playback.\n"); -- User Tip
    --*props, *name, *description, min, max, step
    obs.obs_properties_add_int_slider(ctx.propsDef, "duration_marker_a", "Marker A Duration", 0, 10800, 1);
    obs.obs_properties_add_int_slider(ctx.propsDef, "duration_marker_b", "Marker B Duration", 0, 10800, 1);

    obs.obs_properties_add_int_slider(ctx.propsDef, "duration_marker_end", "End Audio Duration", 0, 10800, 1);
    obs.obs_properties_add_color(ctx.propsDef, "color_normal", "Normal Color");
    obs.obs_properties_add_color(ctx.propsDef, "color_marker_a", "Marker A Color");
    obs.obs_properties_add_color(ctx.propsDef, "color_marker_b", "Marker B Color");
    --[[
		Option list: User select a reference to be used as control to enable text notice for the two time triggers.
		This provides UI layout options to expand feature options.
		Changing this setting will impact on UI and feature options.

		This property is referenced to trigger an onchange event listener.
	]]
    local p_27 = obs.obs_properties_add_list(ctx.propsDef, "enable_marker_notes", "<i>Marker Notes</i>",
        obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT);
    t_type = { "Disabled", "Enabled" };                                                              -- Add options to the list
    for i, v in ipairs(t_type) do obs.obs_property_list_add_int(p_27, v, i) end;                     -- This list is auto indexed thus have an interger reference containing a string value
    obs.obs_property_set_long_description(p_27,
        "\nAllows a note to be displayed when the timer match Marker A and Marker B timestamps.\n"); -- User Tip
    --[[
		Option list: User select <text-source> to be used as visual feedback indicating a message at a determined time of the timer.
		This provides function options that will impact on visual feedback to the user.
		Changing this setting will not impact on the function or end result.
	]]
    local p_28 = obs.obs_properties_add_list(ctx.propsDef, "note_source_marker_a", "<i>Marker A Note Source</i>",
        obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING);
    obs.obs_property_list_add_string(p_28, "Select", "select"); -- Adds a default option to the list. First (top-most) list item. If selected the option is ignored.
    list = {}                                                   -- Reset / clear a defined table variable to be used to build lists that will be passed to the property list
    if sources ~= nil then
        for _, source in ipairs(sources) do
            source_id = obs.obs_source_get_unversioned_id(source); -- unversioned_id will not be affected by language settings
            if source_id == text_source_unversioned_id then        -- identify text type sources only
                local name = obs.obs_source_get_name(source);
                local reference = "note_source_marker_a";
                if not source_selected(name, reference) then
                    --[[
						add it to list so that it can be reordered
					]]
                    list[name] = name;
                else
                    --continue
                end
            end
        end

        if tableHasValue(all_sources) then
            for _, sub in pairs(all_sources) do
                local source_id = sub["id"];
                local source_nested = sub["nested"];
                local name = sub["source_name"]
                if in_table({ "group", "scene" }, source_id) and source_nested then -- identify text type sources only
                    list[name] = name .. " [Group]";
                end;
            end;
        end;

        obs.bfree(source); -- free memory, release source as it is no longer needed
        --[[
			 This property list will be a type of string referenced items with a string value.
			 The string reference must be unique or it will/may be overriden.
			 Being string referenced the list will be compiled chronologically, thus the list
			 names (values) may appear unordered and random. To reorganise and arrange the list
			 alphabetically we will use pairsByKeys(). This will make it easier for the user to
			 review and select the desired item from the list.
		]]
        for key, value in pairsByKeys(list) do
            --[[
				add item to property list
			]]
            obs.obs_property_list_add_string(p_28, value, value);
        end
    end
    --[[
		Option list: User select <text-source> to be used as visual feedback indicating a message at a determined time of the timer.
		This provides function options that will impact on visual feedback to the user.
		Changing this setting will not impact on the function or end result.
	]]
    local p_29 = obs.obs_properties_add_list(ctx.propsDef, "note_source_marker_b", "<i>Marker B Note Source</i>",
        obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING);
    obs.obs_property_list_add_string(p_29, "Select", "select"); -- Adds a default option to the list. First (top-most) list item. If selected the option is ignored.
    list = {};                                                  -- Reset / clear a defined table variable to be used to build lists that will be passed to the property list
    if sources ~= nil then
        for _, source in ipairs(sources) do
            source_id = obs.obs_source_get_unversioned_id(source); -- unversioned_id will not be affected by language settings
            if source_id == text_source_unversioned_id then        -- identify text type sources only
                local name = obs.obs_source_get_name(source);
                local reference = "note_source_marker_b";
                if not source_selected(name, reference) then
                    --[[
						add it to list so that it can be reordered
					]]
                    list[name] = name;
                else
                    --continue
                end;
            end;
        end;

        if tableHasValue(all_sources) then
            for _, sub in pairs(all_sources) do
                local source_id = sub["id"];
                local source_nested = sub["nested"];
                local name = sub["source_name"]
                if in_table({ "group", "scene" }, source_id) and source_nested then -- identify text type sources only
                    list[name] = name .. " [Group]";
                end;
            end;
        end;

        obs.bfree(source); -- free memory, release source as it is no longer needed
        --[[
			 This property list will be a type of string referenced items with a string value.
			 The string reference must be unique or it will/may be overriden.
			 Being string referenced the list will be compiled chronologically, thus the list
			 names (values) may appear unordered and random. To reorganise and arrange the list
			 alphabetically we will use pairsByKeys(). This will make it easier for the user to
			 review and select the desired item from the list.
		]]
        for key, value in pairsByKeys(list) do
            --[[
				add item to property list
			]]
            obs.obs_property_list_add_string(p_29, value, value); -- Add options to the list
        end
    end
    --[[
		 Text Field
	]]
    local p_30 = obs.obs_properties_add_text(ctx.propsDef, "note_marker_a",
        "<font color=" .. font_dimmed .. ">Marker A Note</font>", obs.OBS_TEXT_DEFAULT);
    obs.obs_property_set_long_description(p_30, "\nDisplay a note when Marker A is Activated.\n"); -- User Tip
    --[[
		 Text Field
	]]
    local p_31 = obs.obs_properties_add_text(ctx.propsDef, "note_marker_b",
        "<font color=" .. font_dimmed .. ">Marker B Note</font>", obs.OBS_TEXT_DEFAULT);
    obs.obs_property_set_long_description(p_31, "\nDisplay a note when Marker B is Activated.\n"); -- User Tip

    obs.obs_properties_add_int_slider(ctx.propsDef, "hide_note_marker_a", "Hide Marker A Note", 0, 10800, 1);
    obs.obs_properties_add_int_slider(ctx.propsDef, "hide_note_marker_b", "Hide Marker B Note", 0, 10800, 1);
    --[[
		Option list: User select a reference to be used as control to enable an auto start recording feature.
		This provides function options to change a function behaviour.
		Changing this setting will impact on features and operation.

		This property is referenced to trigger an onchange event listener.
	]]
    local p_32 = obs.obs_properties_add_list(ctx.propsDef, "start_recording", "Auto Recording", obs.OBS_COMBO_TYPE_LIST,
        obs.OBS_COMBO_FORMAT_INT);
    obs.obs_property_set_long_description(p_32, "\nEnable recording options\n");                                -- User Tip
    t_type = { "Disabled", "Timer Expires", "Marker A Time", "Marker B Time", "Timer Visible", "Timer Start" }; -- Add options to the list
    for i, v in ipairs(t_type) do obs.obs_property_list_add_int(p_32, v, i) end;                                -- This list is auto indexed thus have an interger reference containing a string value
    --[[
		 Text Field
	]]
    local p_34 = obs.obs_properties_add_text(ctx.propsDef, "text_prefix", "<font color=#fefceb>Timer Prefix</font>",
        obs.OBS_TEXT_DEFAULT);
    obs.obs_property_set_long_description(p_34, "\n Define text placed before the Timer\n Accepts Format 'String{param1,param2}'\n param1 is reference to marker 1 or 2, or accepts timestamp.\n param2 is numeric for display time in seconds.\n Example: string{00:00:05,3} or string{1,3}\n"); -- User Tip
    --[[
		 Text Field
	]]
    local p_35 = obs.obs_properties_add_text(ctx.propsDef, "text_suffix", "<font color=#fefceb>Timer Suffix</font>",
        obs.OBS_TEXT_DEFAULT);
    obs.obs_property_set_long_description(p_35, "\n Define text placed after the Timer\n Accepts Format 'String{param1,param2}'\n param1 is reference to marker 1 or 2, or accepts timestamp.\n param2 is numeric for display time in seconds.\n Example: string{00:00:05,3} or string{1,3}\n"); -- User Tip
    --[["
		Option list: User select <text-source> to be used as visual feedback indicating a source name that is targeted.
		This provides function options that will impact on visual feedback to the user.
		Changing this setting will impact on the function or end result.
	]]
    local p_36 = obs.obs_properties_add_list(ctx.propsDef, "active_source", "<i>Active Source</i>",
        obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING);
    obs.obs_property_set_long_description(p_36,
        "\nSelect a text source, that will be used to show the name for the current active Source or Scene\n"); -- User Tip
    obs.obs_property_list_add_string(p_36, "Select", "select");                                                 -- Adds a default option to the list. First (top-most) list item. If selected the option is ignored.
    list = {}                                                                                                   -- Reset / clear a defined table variable to be used to build lists that will be passed to the property list
    if sources ~= nil then
        for _, source in ipairs(sources) do
            source_id = obs.obs_source_get_unversioned_id(source); -- unversioned_id will not be affected by language settings
            if source_id == text_source_unversioned_id then        -- identify text type sources only
                local name = obs.obs_source_get_name(source);
                local reference = "active_source";
                if not source_selected(name, reference) then
                    --[[
						add it to list so that it can be reordered
					]]
                    list[name] = name;
                else
                    --continue
                end;
            end;
        end;
        obs.bfree(source); -- free memory, release source as it is no longer needed
        --[[
			 This property list will be a type of string referenced items with a string value.
			 The string reference must be unique or it will/may be overriden.
			 Being string referenced the list will be compiled chronologically, thus the list
			 names (values) may appear unordered and random. To reorganise and arrange the list
			 alphabetically we will use pairsByKeys(). This will make it easier for the user to
			 review and select the desired item from the list.
		]]
        for key, value in pairsByKeys(list) do
            --[[
				add item to property list
			]]
            obs.obs_property_list_add_string(p_36, value, value); -- Add options to the list
        end;
    end;
    --[[
		Option list: User select a reference to be used as control to enable an action que task once the timer expires.
		This provides function options to change a function behaviour.
		Changing this setting will impact on features and operation.

		This property is referenced to trigger an onchange event listener.
	]]
    local p_37 = obs.obs_properties_add_list(ctx.propsDef, "timer_expire_event", "<i>Timer Expire Event</i>",
        obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING);
    obs.obs_property_set_long_description(p_37, "\nDefine what happens after the timer ends\n"); -- User Tip
    obs.obs_property_list_add_string(p_37, "Select", "select");                               -- Adds a default options
    obs.obs_property_list_add_string(p_37, "TIMER END TEXT", "TIMER END TEXT");               -- Adds a default options
    obs.obs_property_list_add_string(p_37, "Continue counting (overtime)", "OVERTIME");       -- F2
    obs.obs_property_list_add_string(p_37, "--[ Select Lists ]--", "invalid");                -- Adds a default option to the list. First (top-most) list item. If selected the option is ignored.
    t_type = { "Source List", "Scene List", "Auto List" };                                    -- Add options to the list

    for i, v in ipairs(t_type) do
        obs.obs_property_list_add_string(p_37, v, v); -- Add options to the list
    end;
    --[[
		Adding a scene to become active once the timer expires is a feature included
		This will collect available scene names and list them for the user to choose from.
		The scene names will be added into the existing option list.
	]]
    local scenes = obs.obs_frontend_get_scene_names();
    if scenes ~= nil then
        obs.obs_property_list_add_string(p_37, "--[ Select Scene ]--", "invalid");  -- Adds a default option to the list. First (top-most) list item. If selected the option is ignored.
        for i, scene in ipairs(scenes) do
            obs.obs_property_list_add_string(p_37, scene, scene);                   -- Add options to the list
        end;
        obs.bfree(scene);                                                           -- free memory, release source as it is no longer needed
        obs.obs_property_list_add_string(p_37, "--[ End of Scenes ]--", "invalid"); -- Adds a default option to the list. First (top-most) list item. If selected the option is ignored.
    end;
    local p_37_a = obs.obs_properties_add_bool(ctx.propsDef, "expire_audio_first",
        "Play Timer Expired Audio first, then switch"); -- F4
    obs.obs_property_set_long_description(p_37_a,
        "\nWhen a scene is selected as Timer Expire Event: play the Timer Expired Audio first, then switch to the scene.\n\nThe switch happens when the audio ends, or after End Audio Duration if Media Playback Limit is enabled.\n\nFor looping audio, set an End Audio Duration, otherwise the switch waits for an end that never comes.\n"); -- User Tip
    local p_37_o = obs.obs_properties_add_bool(ctx.propsDef, "overtime_style", "Overtime: show '+' and Marker B colour"); -- F2
    obs.obs_property_set_long_description(p_37_o,
        "\nWith 'Continue counting (overtime)': when the count down reaches zero it keeps running and counts up.\n\nTicked: overtime shows a '+' in front of the time and uses the Marker B colour.\n\nReset ends overtime.\n"); -- User Tip

    --[[
		Option list: User select <text-source> to be used as visual feedback indicating a source name that is targeted.
		This provides function options that will impact on visual feedback to the user.
		Changing this setting will impact on the function or end result.
	]]
    local p_33 = obs.obs_properties_add_list(ctx.propsDef, "cycle_source_children", "<i>Auto List</i>",
        obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING);
    obs.obs_property_set_long_description(p_33,
        "\nSelect a source, that have items (children) to be used in cycle list.\n"); -- User Tip
    obs.obs_property_list_add_string(p_33, "Select", "select");                       -- Adds a default option to the list. First (top-most) list item. If selected the option is ignored.
    list = {}                                                                         -- Reset / clear a defined table variable to be used to build lists that will be passed to the property list
    if tableHasValue(all_sources) then
        for _, sub in pairs(all_sources) do
            local source_id = sub["id"];
            local source_nested = sub["nested"];
            local name = sub["source_name"]

            if in_table({ "group", "scene" }, source_id) and source_nested then -- identify text type sources only
                list[name] = name;
            end;
        end;
        obs.bfree(source); -- free memory, release source as it is no longer needed
        --[[
			 This property list will be a type of string referenced items with a string value.
			 The string reference must be unique or it will/may be overriden.
			 Being string referenced the list will be compiled chronologically, thus the list
			 names (values) may appear unordered and random. To reorganise and arrange the list
			 alphabetically we will use pairsByKeys(). This will make it easier for the user to
			 review and select the desired item from the list.
		]]
        for key, value in pairsByKeys(list) do
            --[[
				add item to property list
			]]
            obs.obs_property_list_add_string(p_33, value, value); -- Add options to the list
        end;
    end;
    --[[
		 Text Field
	]]
    local p_38 = obs.obs_properties_add_text(ctx.propsDef, "stop_text", "<font color=#fef1eb>Timer Expired Text</font>",
        obs.OBS_TEXT_DEFAULT);
    obs.obs_property_set_long_description(p_38, "\nDefine text displayed when timer ended\n"); -- User Tip
    --[[
		Editable Option list: User adds a text name as an entry used as a reference to be used as inditification of a source.
		This provides function options to change feature behaviour.
		Changing this setting will impact on feature options and behaviour.
	]]
    local p_39 = obs.obs_properties_add_editable_list(ctx.propsDef, "cycle_list", "Cycle List",
        obs.OBS_EDITABLE_LIST_TYPE_STRINGS, nil, nil);
    --[[
		Option list: User select a reference to be used as control to determine a cycling direction.
		This provides function options to change feature behaviour.
		Changing this setting will impact on feature options.
	]]
    local p_40 = obs.obs_properties_add_list(ctx.propsDef, "cycle_direction", "<i>Cycle Direction</i>",
        obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_INT);
    t_type = { "Ascending", "Descending" };                                                     -- Add options to the list
    for i, v in ipairs(t_type) do obs.obs_property_list_add_int(p_40, v, i) end;                -- This list is auto indexed thus have an interger reference containing a string value
    obs.obs_property_set_long_description(p_40, "\nSelect the rotation direction of lists.\n"); -- User Tip
    --[[
		Option list: User select to show or hide available features.
		This provides UI layout options to enhance the user experience.
		Changing this setting does not impact any function or result.

		This property is referenced to trigger an onchange event listener.
	]]
    local p_ab = obs.obs_properties_add_list(ctx.propsDef, "timer_manipulation",
        "<font color=" .. font_highlight .. "><b>Timer Manipulation</b></font>", obs.OBS_COMBO_TYPE_LIST,
        obs.OBS_COMBO_FORMAT_INT);
    t_type = { "Hidden", "Expanded", "Disabled" };                                                                                                                                                                                                                                                                                -- Add options to the list
    for i, v in ipairs(t_type) do obs.obs_property_list_add_int(p_ab, v, i) end;                                                                                                                                                                                                                                                  -- This list is auto indexed thus have an interger reference containing a string value
    obs.obs_property_set_long_description(p_ab,
        "\nAdd or subtract time with hotkeys (OBS Settings > Hotkeys: 'Add Seconds Set 1-3', 'Subtract Seconds Set 1-3').\n\nSet 1, 2 and 3 are three preset step sizes, each with its own hotkey.\n\nHidden: hotkeys work, options collapsed.\nExpanded: show the step sizes and limits.\nDisabled: the hotkeys do nothing.\n"); -- User Tip
    --[[
		Wrap and group properties together.
		Thise group provides options to the user to define a custom time value used as a start point for a stopwatch to continue from
	]]
    local group_props_2 = obs.obs_properties_create();
    obs.obs_properties_add_group(ctx.propsDef, "_group_2", "Add Seconds to time (Initiate with Hotkey)",
        obs.OBS_GROUP_NORMAL, group_props_2);
    -- obs_properties_t *props, const char *name, const char *description, int min, int max, int step
    local p_a1 = obs.obs_properties_add_int(group_props_2, "sec_add_1", "Set 1", 1, 259200, 1); -- F1: 1-second steps (was min 5/15/30, step 15)
    obs.obs_property_int_set_suffix(p_a1, " Seconds added to time per call");
    local p_a2 = obs.obs_properties_add_int(group_props_2, "sec_add_2", "Set 2", 1, 259200, 1); -- F1: 1-second steps (was min 5/15/30, step 15)
    obs.obs_property_int_set_suffix(p_a2, " Seconds added to time per call");
    local p_a3 = obs.obs_properties_add_int(group_props_2, "sec_add_3", "Set 3", 1, 259200, 1); -- F1: 1-second steps (was min 5/15/30, step 15)
    obs.obs_property_int_set_suffix(p_a3, " Seconds added to time per call");
    local p_a4 = obs.obs_properties_add_int(group_props_2, "sec_add_limit", "Limit", 0, 1000, 1);
    obs.obs_property_int_set_suffix(p_a4, "     Zero allow infinite calls");
    local p_a5 = obs.obs_properties_add_int(group_props_2, "sec_add_limit_used", "Used", 0, 1000, 1);
    obs.obs_property_int_set_suffix(p_a5, "     Refresh to update form");
    obs.obs_property_set_long_description(p_a5, "\nClick the refresh button to update and show the used limits.\n"); -- User Tip
    local p_a6 = obs.obs_properties_add_list(group_props_2, "add_limit_note_source", "<i>Limit Note</i>",
        obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING);
    obs.obs_property_set_long_description(p_a6,
        "\nSelect a text source, that will be used to show a message when the limit was reached.\n"); -- User Tip
    obs.obs_property_list_add_string(p_a6, "Select", "select")                                        -- Adds a default option to the list. First (top-most) list item. If selected the option is ignored.
    list = {}                                                                                         -- Reset / clear a defined table variable to be used to build lists that will be passed to the property list
    if sources ~= nil then
        for _, source in ipairs(sources) do
            source_id = obs.obs_source_get_unversioned_id(source); -- unversioned_id will not be affected by language settings
            if source_id == text_source_unversioned_id then        -- identify text type sources only
                local name = obs.obs_source_get_name(source);
                local reference = "add_limit_note_source";
                if not source_selected(name, reference) then
                    --[[
						add it to list so that it can be reordered
					]]
                    list[name] = name;
                else
                    --continue
                end;
            end;
        end;
        obs.bfree(source); -- free memory, release source as it is no longer needed
        --[[
			 This property list will be a type of string referenced items with a string value.
			 The string reference must be unique or it will/may be overriden.
			 Being string referenced the list will be compiled chronologically, thus the list
			 names (values) may appear unordered and random. To reorganise and arrange the list
			 alphabetically we will use pairsByKeys(). This will make it easier for the user to
			 review and select the desired item from the list.
		]]
        for key, value in pairsByKeys(list) do
            --[[
				add item to property list
			]]
            obs.obs_property_list_add_string(p_a6, value, value); -- B-049: the Limit Note list (p_a5 is the "Used" int)
        end;
    end;
    local p_b7 = obs.obs_properties_add_int(group_props_2, "add_limit_note_source_visible", "Note visible", 0, 36000, 1);
    obs.obs_property_int_set_suffix(p_b7, "     milliseconds visible, 0 is infinite");
    local p_a8 = obs.obs_properties_add_button(group_props_2, "sec_add_refresh", "Refresh to update form",
        refresh_properties);
    --[[
		Wrap and group properties together.
		Thise group provides options to the user to define a custom time value used as a start point for a stopwatch to continue from
	]]
    local group_props_3 = obs.obs_properties_create();
    obs.obs_properties_add_group(ctx.propsDef, "_group_3", "Subtract Seconds from time (Initiate with Hotkey)",
        obs.OBS_GROUP_NORMAL, group_props_3);
    -- obs_properties_t *props, const char *name, const char *description, int min, int max, int step
    local p_b1 = obs.obs_properties_add_int(group_props_3, "sec_sub_1", "Set 1", 1, 259200, 1); -- F1: 1-second steps (was min 5/15/30, step 15)
    obs.obs_property_int_set_suffix(p_b1, " Seconds subtracted from time per call");
    local p_b2 = obs.obs_properties_add_int(group_props_3, "sec_sub_2", "Set 2", 1, 259200, 1); -- F1: 1-second steps (was min 5/15/30, step 15)
    obs.obs_property_int_set_suffix(p_b2, " Seconds subtracted from time per call");
    local p_b3 = obs.obs_properties_add_int(group_props_3, "sec_sub_3", "Set 3", 1, 259200, 1); -- F1: 1-second steps (was min 5/15/30, step 15)
    obs.obs_property_int_set_suffix(p_b3, " Seconds subtracted from time per call");
    local p_b4 = obs.obs_properties_add_int(group_props_3, "sec_sub_limit", "Limit", 0, 1000, 1);
    obs.obs_property_int_set_suffix(p_b4, "     Zero allow infinite calls");
    local p_b5 = obs.obs_properties_add_int(group_props_3, "sec_sub_limit_used", "Used", 0, 1000, 1);
    obs.obs_property_int_set_suffix(p_b5, "     Refresh to update form");
    obs.obs_property_set_long_description(p_b5, "\nClick the refresh button to update and show the used limits.\n"); -- User Tip
    local p_b6 = obs.obs_properties_add_list(group_props_3, "sub_limit_note_source", "<i>Limit Note</i>",
        obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING);
    obs.obs_property_set_long_description(p_b6,
        "\nSelect a text source, that will be used to show a message when the limit was reached.\n"); -- User Tip
    obs.obs_property_list_add_string(p_b6, "Select", "select")                                        -- Adds a default option to the list. First (top-most) list item. If selected the option is ignored.
    list = {}                                                                                         -- Reset / clear a defined table variable to be used to build lists that will be passed to the property list
    if sources ~= nil then
        for _, source in ipairs(sources) do
            source_id = obs.obs_source_get_unversioned_id(source); -- unversioned_id will not be affected by language settings
            if source_id == text_source_unversioned_id then        -- identify text type sources only
                local name = obs.obs_source_get_name(source);
                local reference = "sub_limit_note_source";
                if not source_selected(name, reference) then
                    --[[
						add it to list so that it can be reordered
					]]
                    list[name] = name;
                else
                    --continue
                end;
            end;
        end;
        obs.bfree(source); -- free memory, release source as it is no longer needed
        --[[
			 This property list will be a type of string referenced items with a string value.
			 The string reference must be unique or it will/may be overriden.
			 Being string referenced the list will be compiled chronologically, thus the list
			 names (values) may appear unordered and random. To reorganise and arrange the list
			 alphabetically we will use pairsByKeys(). This will make it easier for the user to
			 review and select the desired item from the list.
		]]
        for key, value in pairsByKeys(list) do
            --[[
				add item to property list
			]]
            obs.obs_property_list_add_string(p_b6, value, value); -- B-049: the Limit Note list (p_b5 is the "Used" int)
        end;
    end;
    local p_b7 = obs.obs_properties_add_int(group_props_3, "sub_limit_note_source_visible", "Note visible", 0, 36000, 1);
    obs.obs_property_int_set_suffix(p_b7, "     milliseconds visible, 0 is infinite");

    local p_b8 = obs.obs_properties_add_button(group_props_3, "sec_sub_refresh", "Refresh to update form",
        refresh_properties);
    --[[
		Wrap and group properties together.
		Thise group provides options to the user to define a custom time value used as a start point for a stopwatch to continue from
	]]
    local group_props_1 = obs.obs_properties_create();
    obs.obs_properties_add_group(ctx.propsDef, "_group_1", "Manually set timer", obs.OBS_GROUP_NORMAL, group_props_1); -- Count Up
    --[[
		 Inerger Field
	]]
    local p_gp_1 = obs.obs_properties_add_int(group_props_1, "sw_days_saved", "DD", 0, 7300, 1);
    local p_gp_2 = obs.obs_properties_add_int(group_props_1, "sw_hours_saved", "HH", 0, 23, 1);
    local p_gp_3 = obs.obs_properties_add_int(group_props_1, "sw_minutes_saved", "MM", 0, 59, 1);
    local p_gp_4 = obs.obs_properties_add_int(group_props_1, "sw_seconds_saved", "SS", 0, 59, 1);
    local p_gp_5 = obs.obs_properties_add_int(group_props_1, "sw_milliseconds_saved", "FF", 0, 99, 1);
    local p_gp_6 = obs.obs_properties_add_bool(group_props_1, "load_saved_time",
        "Autoload last time stamp when OBS starts");
    obs.obs_property_set_long_description(p_gp_6,
        "\nCount Up only. When OBS starts, continue from the time the timer last showed.\n\nThe time is saved every 30 seconds while the timer runs, and whenever it is paused or stopped, so it also survives a crash (up to 30 seconds may be lost).\n"); -- User Tip (B6)
    local p_gp_7 = obs.obs_properties_add_button(group_props_1, "sw_button", "Set", sw_saved_button_clicked);
    obs.obs_property_set_long_description(p_gp_7,
        "\nApply the time above to the timer.\n\nYou can also bind a 'Set' hotkey in OBS Settings > Hotkeys.\n"); -- User Tip
    --[[
		Hidden Value
		We save last count in the properties for when OBS shuts down and starts again
	]]
    local p_47 = obs.obs_properties_add_float(group_props_1, "sw_current_seconds", "Saved Seconds", 0, 3600000000, 0.1);
    obs.obs_property_set_visible(p_47, set_visible_properties);
    --[[
		Property Button: User interaction that will start, pause or stop a timer.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]
    obs.obs_properties_add_button(ctx.propsDef, "start_button", "Start", start_button_clicked);
    --[[
		Property Button: User interaction that will start, pause or stop a timer.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]
    local p_48 = obs.obs_properties_add_button(ctx.propsDef, "pause_button", "Start", pause_button_clicked);
    --[[
		Property Button: User interaction that will mark a timer timestamp.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]
    obs.obs_properties_add_button(ctx.propsDef, "split_button", "Split Time", split_button_clicked);
    --[[
		Property Button: User interaction that will start, pause or stop a timer.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.

		This property is referenced to trigger an onchange event listener.
	]]
    local p_49 = obs.obs_properties_add_button(ctx.propsDef, "mili_button", mili_button_label(), mili_button_clicked);
    --[[
		Property Button: User interaction that will reset a timer.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]
    local p_50 = obs.obs_properties_add_button(ctx.propsDef, "direction_button", "Count Up/Down",
        direction_button_clicked);
    --[[
		Property Button: User interaction that will reset a timer.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]
    local p_51 = obs.obs_properties_add_button(ctx.propsDef, "reset_button", "Reset Count Up Timer", reset_button_clicked);
    --[[
		Property Checkbox: User interaction that enable setting a custom stopwatch start timestamp.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.

		This property is referenced to trigger an onchange event listener.
	]]
    local p_62 = obs.obs_properties_add_bool(ctx.propsDef, "split_startpause", "Split Start Pause Button");                                                                                                                                                                            -- count up only
    obs.obs_property_set_long_description(p_62,
        "\nOff: one Start/Pause button. The 'Start' and 'Pause' hotkeys both toggle start/pause.\n\nOn: separate Start and Pause buttons. The 'Start' hotkey only starts and the 'Pause' hotkey only pauses.\n\nThe change applies straight away; you do not need to restart OBS.\n"); -- User Tip (B8)
    --[[
		Property Checkbox: User interaction that enable setting a custom stopwatch start timestamp.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.

		This property is referenced to trigger an onchange event listener.
	]]
    local p_52 = obs.obs_properties_add_bool(ctx.propsDef, "set_stopwatch", "Adjust timer manually");                                                                           -- count up only
    obs.obs_property_set_long_description(p_52,
        "\nShow 'Manually set timer' to start the stopwatch from a chosen time.\n\nThe 'Set' hotkey (OBS Settings > Hotkeys) applies that time without opening this panel.\n"); -- User Tip
    --[[
		Property Checkbox: User interaction that toggle active source visibility.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]
    obs.obs_properties_add_bool(ctx.propsDef, "active_source_force_visible", "Active Source Force Visibility");
    --[[
		Property Checkbox: User interaction that will disable the plugin.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]
    local p_55 = obs.obs_properties_add_bool(ctx.propsDef, "enable_direction_toggle", "Enable Timer Direction Toggle");
    --[[
		Property Checkbox: User interaction that will disable the plugin.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]
    obs.obs_properties_add_bool(ctx.propsDef, "prevent_negative_time", "Prevent Negative Time Value");
    --[[
		Property Checkbox: User interaction that will enable backup options.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.

		This property is referenced to trigger an onchange event listener.
	]]
    local p_56 = obs.obs_properties_add_bool(ctx.propsDef, "backup_mode", "Backup Mode");
    --[[
		Property Checkbox: User interaction that will enable backup options.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.

		This property is referenced to trigger an onchange event listener.
	]]
    obs.obs_properties_add_bool(ctx.propsDef, "debug_enabled", "Enable debug logging");
    --[[
		Property Directory Path: User interaction that select a directory path.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.

		This property is referenced to trigger an onchange event listener.
	]]
    local p_57 = obs.obs_properties_add_path(ctx.propsDef, "backup_folder", "Backup Folder", obs.OBS_PATH_DIRECTORY, nil,
        nil);
    --[[
		Property list: User interaction that will execute an import feature.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.

		This property is referenced to trigger an onchange event listener.
	]]
    local p_58 = obs.obs_properties_add_list(ctx.propsDef, "import_list", "<i>Load Settings</i>", obs
        .OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING);
    obs.obs_property_list_add_string(p_58, "No Files Found", "none");                       -- Adds a default option to the list. First (top-most) list item. If selected the option is ignored.
    obs.obs_property_set_long_description(p_58, "\nSelect the Settings file to import.\n"); -- User Tip
    -- This can ony be populated if backup_folder is defined
    local filenames = get_filenames(backup_folder, ".json");                                -- list all files of type
    if table.getn(filenames) > 0 then
        for i, v in pairs(filenames) do
            obs.obs_property_list_add_string(p_58, v, v); -- Add options to the list
        end;
    end;
    obs.obs_properties_add_bool(ctx.propsDef, "backup_split_time", "Export Split Time");
    --[[
	   Property Directory Path: User interaction that select a directory path.
	   This provides function interaction to change feature behaviour.
	   Interacting with this property will impact on feature options and behaviour.

	   This property is referenced to trigger an onchange event listener.
   ]]
    --[[
		Property Button: User interaction that will import available property settings from a json file
		and apply them to the properties.
		This provides function interaction to change feature behaviour.
		Interacting with this property will complete a feature task.

		This property is referenced to trigger an onchange event listener.
	]]
    obs.obs_properties_add_button(ctx.propsDef, "import_button", "Import Settings", import_button_clicked);
    --[[
		Property Button: User interaction that will export all property settings to a json file.
		This provides function interaction to change feature behaviour.
		Interacting with this property will complete a feature task.
	]]
    local p_60 = obs.obs_properties_add_button(ctx.propsDef, "export_button", "Export Settings", export_button_clicked);
    --[[
		SCRIPT READY
		MUST BE HIDDEN
	]]
    local p_61 = obs.obs_properties_add_bool(ctx.propsDef, "script_ready", "Script Ready");
    obs.obs_property_set_visible(p_61, set_visible_properties);
    --[[
		Property Checkbox: User interaction that will disable the plugin.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]
    obs.obs_properties_add_bool(ctx.propsDef, "disable_script", "Disable Script");
    --[[
		Property Checkbox: User interaction that will disable the plugin.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]
    local p_63 = obs.obs_properties_add_bool(ctx.propsDef, "select_features", "Disable Features");
    --[[
		Wrap and group properties together.
		Thise group provides options to the user to define a custom time value used as a start point for a stopwatch to continue from
	]]
    local group_props_4 = obs.obs_properties_create();
    local p_64 = obs.obs_properties_add_group(ctx.propsDef, "_group_4",
        "Disable or Enable Plugin Features - Check [x] = enabled", obs.OBS_GROUP_NORMAL, group_props_4);
    --[[
		Property Checkbox: User interaction that will disable the plugin.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]
    local p_64_0 = obs.obs_properties_add_bool(group_props_4, "enable_property_toggle_mili_trigger",
        "Split Seconds Toggle");
    --[[
		Property Checkbox: User interaction that will disable the plugin.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]
    local p_64_1 = obs.obs_properties_add_bool(group_props_4, "enable_property_split_source", "Timer Time Split/Lap");
    --[[
		Property Checkbox: User interaction that will disable the plugin.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]
    local p_64_2 = obs.obs_properties_add_bool(group_props_4, "enable_property_trigger_options", "Marker Settings");
    --[[
		Property Checkbox: User interaction that will disable the plugin.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]
    local p_64_3 = obs.obs_properties_add_bool(group_props_4, "enable_property_color_normal", "Text Colour [Normal]");
    --[[
		Property Checkbox: User interaction that will disable the plugin.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]
    local p_64_4 = obs.obs_properties_add_bool(group_props_4, "enable_property_color_marker_a", "Text Colour [Marker A]");
    --[[
		Property Checkbox: User interaction that will disable the plugin.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]
    local p_64_5 = obs.obs_properties_add_bool(group_props_4, "enable_property_color_marker_b", "Text Colour [Marker B]");
    --[[
		Property Checkbox: User interaction that will disable the plugin.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]
    local p_64_6 = obs.obs_properties_add_bool(group_props_4, "enable_property_start_recording", "Recording");
    --[[
		Property Checkbox: User interaction that will disable the plugin.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]
    local p_64_7 = obs.obs_properties_add_bool(group_props_4, "enable_property_text_prefix", "Timer Text Prefix");
    --[[
		Property Checkbox: User interaction that will disable the plugin.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]
    local p_64_8 = obs.obs_properties_add_bool(group_props_4, "enable_property_text_suffix", "Timer Text Suffix");
    --[[
		Property Checkbox: User interaction that will disable the plugin.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]
    local p_64_9 = obs.obs_properties_add_bool(group_props_4, "enable_property_timer_activation", "Timer Activation");
    --[[
		Property Checkbox: User interaction that will disable the plugin.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]
    local p_64_10 = obs.obs_properties_add_bool(group_props_4, "enable_property_timer_manipulation", "Timer Manipulation");
    --[[
		Property Checkbox: User interaction that will disable the plugin.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]
    local p_64_11 = obs.obs_properties_add_bool(group_props_4, "enable_property_debug", "Debugging");
    --[[
		Property Checkbox: User interaction that will disable the plugin.
		This provides function interaction to change feature behaviour.
		Interacting with this property will impact on feature options and behaviour.
	]]
    local p_64_12 = obs.obs_properties_add_bool(group_props_4, "enable_property_backup", "Backup");
    --[[
		6.1 option: the source types that take part when a Group is a Marker A/B Note Source.
	]]
    local group_props_4_ng = obs.obs_properties_create();
    obs.obs_properties_add_group(group_props_4, "_group_4_note_types", "Marker note groups: include these source types",
        obs.OBS_GROUP_NORMAL, group_props_4_ng);
    for _, t in ipairs({ { "text", "Text" }, { "image", "Image (also Image Slide Show)" }, { "browser", "Browser (web page)" },
        { "color", "Colour" }, { "media", "Media (also VLC Video Source)" } }) do
        local p_ng = obs.obs_properties_add_bool(group_props_4_ng, "note_group_type_" .. t[1], t[2]);
        obs.obs_property_set_long_description(p_ng, "\nApplies when a Group is the Marker A or B Note Source. The group's items of the ticked types are shown and hidden in turn, one per marker; other types are skipped. No note text or colour is written to group items, of any type. Reset hides every item in the group, whatever its type.\n"); -- User Tip
    end


    obs.source_list_release(sources); -- free memory, release sources as it is no longer needed
    --[[
		Callback definitions used to check for user interaction or property changes.
		Event Listener
		Each entry provides a callback to a referenced proeprty along with a target callback handler


	    timer_source, split_source, active_source, note_source_marker_a, note_source_marker_b, sub_limit_note_source, add_limit_note_source

	]]                                                                     --
    obs.obs_property_set_modified_callback(p_ab, property_onchange);    -- timer_manipulation
    obs.obs_property_set_modified_callback(p_a4, property_onchange);    -- sec_add_limit
    obs.obs_property_set_modified_callback(p_b4, property_onchange);    -- sec_sub_limit
    obs.obs_property_set_modified_callback(p_a6, property_onchange);    -- add_limit_note_source
    obs.obs_property_set_modified_callback(p_b6, property_onchange);    -- sub_limit_note_source
    obs.obs_property_set_modified_callback(p_1, property_onchange);     -- timer_mode
    obs.obs_property_set_modified_callback(p_2, property_onchange);     -- layout
    obs.obs_property_set_modified_callback(p_3, property_onchange);     -- timer_options
    obs.obs_property_set_modified_callback(p_4, property_onchange);     -- timer_source
    obs.obs_property_set_modified_callback(p_5, property_onchange);     -- countdown_type
    obs.obs_property_set_modified_callback(p_8, property_onchange);     -- month
    obs.obs_property_set_modified_callback(p_9, property_onchange);     -- year
    obs.obs_property_set_modified_callback(p_11, property_onchange);    -- hours
    obs.obs_property_set_modified_callback(p_12, property_onchange);    -- minutes
    obs.obs_property_set_modified_callback(p_13, property_onchange);    -- seconds
    obs.obs_property_set_modified_callback(p_14, property_onchange);    -- timer_format
    obs.obs_property_set_modified_callback(p_15, property_onchange);    -- custom_time_format
    obs.obs_property_set_modified_callback(p_16, property_onchange);    -- toggle_mili_trigger
    obs.obs_property_set_modified_callback(p_18, property_onchange);    -- split_source
    obs.obs_property_set_modified_callback(p_20, property_onchange);    -- text_arr_marker_a
    obs.obs_property_set_modified_callback(p_21, property_onchange);    -- text_arr_marker_b
    obs.obs_property_set_modified_callback(p_22, property_onchange);    -- trigger_options
    obs.obs_property_set_modified_callback(p_23, property_onchange);    -- audio_marker_a
    obs.obs_property_set_modified_callback(p_24, property_onchange);    -- audio_marker_b
    obs.obs_property_set_modified_callback(p_26, property_onchange);    -- media_playback_limit
    obs.obs_property_set_modified_callback(p_27, property_onchange);    -- enable_marker_notes
    obs.obs_property_set_modified_callback(p_28, property_onchange);    -- note_source_marker_a
    obs.obs_property_set_modified_callback(p_29, property_onchange);    -- note_source_marker_b
    obs.obs_property_set_modified_callback(p_32, property_onchange);    -- start_recording
    obs.obs_property_set_modified_callback(p_33, property_onchange);    -- cycle_source_children
    obs.obs_property_set_modified_callback(p_36, property_onchange);    -- active_source
    obs.obs_property_set_modified_callback(p_37, property_onchange);    -- timer_expire_event
    obs.obs_property_set_modified_callback(p_37_a, property_onchange);  -- expire_audio_first (F4)
    obs.obs_property_set_modified_callback(p_52, property_onchange);    -- set_stopwatch
    obs.obs_property_set_modified_callback(p_gp_6, property_onchange);  -- load_saved_time
    obs.obs_property_set_modified_callback(p_55, property_onchange);    -- enable_direction_toggle
    obs.obs_property_set_modified_callback(p_56, property_onchange);    -- backup_mode
    obs.obs_property_set_modified_callback(p_57, property_onchange);    -- backup_folder
    obs.obs_property_set_modified_callback(p_58, property_onchange);    -- import_list
    -- B-045: no modified callback on the import button: obs_properties_apply_settings runs every
    -- modified callback, so the import ran on each panel rebuild; it runs on the click instead
    obs.obs_property_set_modified_callback(p_62, property_onchange);    -- split_startpause
    obs.obs_property_set_modified_callback(p_63, property_onchange);    -- select_features
    obs.obs_property_set_modified_callback(p_64_0, property_onchange);  -- select_features
    obs.obs_property_set_modified_callback(p_64_1, property_onchange);  -- select_features
    obs.obs_property_set_modified_callback(p_64_2, property_onchange);  -- select_features
    obs.obs_property_set_modified_callback(p_64_3, property_onchange);  -- select_features
    obs.obs_property_set_modified_callback(p_64_4, property_onchange);  -- select_features
    obs.obs_property_set_modified_callback(p_64_5, property_onchange);  -- select_features
    obs.obs_property_set_modified_callback(p_64_6, property_onchange);  -- select_features
    obs.obs_property_set_modified_callback(p_64_7, property_onchange);  -- select_features
    obs.obs_property_set_modified_callback(p_64_8, property_onchange);  -- select_features
    obs.obs_property_set_modified_callback(p_64_9, property_onchange);  -- select_features
    obs.obs_property_set_modified_callback(p_64_10, property_onchange); -- select_features
    obs.obs_property_set_modified_callback(p_64_11, property_onchange); -- select_features
    obs.obs_property_set_modified_callback(p_64_12, property_onchange); -- select_features
    obs.obs_property_set_modified_callback(p_65, property_onchange);    -- timer_activation
    obs.obs_property_set_modified_callback(p_65_a, property_onchange);  -- timer_activation_source
    obs.obs_property_set_modified_callback(p_65_b, property_onchange);  -- timer_reset
    -- Calls the callback once to set-up current visibility
    obs.obs_properties_apply_settings(ctx.propsDef, ctx.propsSet);

    return ctx.propsDef;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Records which text source each source setting currently uses (timer, split, active, the marker notes and the limit notes), so the panel lists can leave out sources already taken.
	Scope: global; called by load_settings_globals
	type: helper (panel)
	input type: none
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
function update_source_list()
    if disable_script then return; end;
    debug_log('update_source_list() -- function variable names: ')
    selected_source_list["timer_source"] = timer_source;
    selected_source_list["split_source"] = split_source;
    selected_source_list["active_source"] = active_source;
    selected_source_list["note_source_marker_a"] = note_source_marker_a;
    selected_source_list["note_source_marker_b"] = note_source_marker_b;
    selected_source_list["sub_limit_note_source"] = sub_limit_note_source;
    selected_source_list["add_limit_note_source"] = add_limit_note_source;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Tells whether a source is already used by another source setting, so it can be left out of this setting's list. "Select" and the setting's own choice count as not taken.
	Scope: global; called by property_onchange, script_properties and fill_split_source_list
	type: helper (panel)
	input type: input_value: string (source name); reference: string (the setting whose list is being built)
	returns: bool; none while the script is disabled
----------------------------------------------------------------------------------------------------------------------------------------
]]
function source_selected(input_value, reference)
    if disable_script then return; end;
    debug_log('source_selected(' ..
        pre_dump(input_value) .. ", " .. pre_dump(reference) .. ') -- function variable names:  input_value, reference ')
    if in_table({ 'Select', 'select' }, input_value) or selected_source_list[reference] == input_value then return false end; -- was { 'Select, select' }: one string (B5)
    return in_table(selected_source_list, input_value);
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Adds a disabled entry to a source list saying there is no free text source and how to add one (B5).
	Scope: global; called by property_onchange, script_properties and fill_split_source_list
	type: helper (panel)
	input type: prop: obs_property (the list)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
function add_no_free_source_hint(prop)
    obs.obs_property_list_add_string(prop, "No free Text source: add another Text source, then Refresh", "no_free_source");
    obs.obs_property_list_item_disable(prop, obs.obs_property_list_item_count(prop) - 1, true);
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Rebuilds the split source list from the current OBS text sources not used by another setting, in name order, or the "no free source" hint if there are none (B5).
	Scope: global; called by split_source_refresh_clicked
	type: helper (panel)
	input type: prop: obs_property (the split source list)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
function fill_split_source_list(prop)
    obs.obs_property_list_clear(prop);
    obs.obs_property_list_add_string(prop, "Select", "select");
    local names = {};
    local sources = obs.obs_enum_sources();
    if sources ~= nil then
        for _, source in ipairs(sources) do
            if obs.obs_source_get_unversioned_id(source) == text_source_unversioned_id then
                local name = obs.obs_source_get_name(source);
                if not source_selected(name, "split_source") then
                    names[name] = name;
                end
            end
        end
    end
    obs.source_list_release(sources);
    local found = false;
    for key, value in pairsByKeys(names) do
        obs.obs_property_list_add_string(prop, value, key);
        found = true;
    end
    if not found then add_no_free_source_hint(prop) end
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: "Refresh sources" button next to Split Source: rebuilds the split source list (B5).
	Scope: global; registered by script_properties as the button "split_source_refresh"
	type: button callback
	input type: props: obs_properties (the panel); p: obs_property (not used)
	returns: bool: true (refresh the panel)
----------------------------------------------------------------------------------------------------------------------------------------
]]
function split_source_refresh_clicked(props, p)
    fill_split_source_list(obs.obs_properties_get(props, "split_source"));
    return true;
end
--[[
	B-037 (decision 2026-10-09): only a change to a timing setting resets the
	timer. Timing settings: mode, countdown type, target date, and time or start
	duration. Anything else (prefix, colours, sources, notes, ...) redraws only.
]]
local last_timing_signature = nil;
local last_mili_trigger = nil;
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Combines the timing settings (mode, countdown type, target date, time) into one string, so script_update can tell whether a timing setting changed (B-037).
	Scope: local; called by script_update
	type: helper (settings)
	input type: settings: obs_data (the script's settings)
	returns: string
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function timing_signature(settings)
    local parts = {};
    for _, key in ipairs({ "timer_mode", "countdown_type", "year", "month", "day", "hours", "minutes", "seconds" }) do
        parts[#parts + 1] = tostring(obs.obs_data_get_int(settings, key));
    end
    return table.concat(parts, ":");
end
--[[
	B-076 / B-077: reset() hid the marker / end audio and the limit notes, and set up
	a Marker Audio list; a settings change no longer resets (B-037). So when the user
	chooses another source or list for one of them, hide what is now chosen (a shown
	media source would play), except audio playing right now, and start a new list at
	its first entry. Keyed on the user's choice (the setting and the list's entries),
	not on the list's current entry, which moves on after every marker.
	sync_only: after a reset, which did all this, only record the choices.
]]
local media_choices = {};
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Tells whether a source is the marker or end audio playing right now.
	Scope: local; called by hide_new_media_choices
	type: helper (media)
	input type: name: string (source name)
	returns: bool
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function audio_playing_now(name)
    return name == media["playing_audio_marker_a"] or name == media["playing_audio_marker_b"] or
        name == media["playing_audio_marker_end"]
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Reads a media or limit-note setting: a single source, or "list" with its entries.
	Scope: local; called by hide_new_media_choices
	type: helper (media)
	input type: key: string (the setting name)
	returns: string, table: a key for the choice ("list:" plus the entries, or the source name) and the source names
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function media_choice(key)
    local value = obs.obs_data_get_string(ctx.propsSet, key);
    if value ~= "list" then return value, { value } end
    local names = obs_data_array_to_table(ctx.propsSet, key .. "_arr") or {};
    return "list:" .. table.concat(names, "|"), names
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: When the user picks another source or list for the marker audio, end audio or limit notes, hides what is now chosen (except audio playing now) and starts a changed Marker Audio list at its first entry (B-076, B-077). With sync_only, after a reset, it only records the choices.
	Scope: local; called by script_update
	type: helper (media)
	input type: sync_only: bool or nil (true: only record the choices)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
local function hide_new_media_choices(sync_only)
    if ctx.propsSet == nil then return end
    for _, key in ipairs({ "audio_marker_a", "audio_marker_b", "audio_marker_end", "add_limit_note_source", "sub_limit_note_source" }) do
        local choice, names = media_choice(key);
        if choice ~= media_choices[key] then
            local first = (media_choices[key] == nil);
            media_choices[key] = choice;
            if not sync_only then
                for _, name in ipairs(names) do
                    -- list entries: media sources only, as reset_audio_source_visibility (REV6 re-review)
                    local media_entry = (choice:sub(1, 5) ~= "list:") or is_valid_type_source(name, "ffmpeg_source");
                    if media_entry and not audio_playing_now(name) then set_visible(name, false) end
                end
                local ref = key:match("^audio_(marker_[ab])$");
                if ref and not first and choice:sub(1, 5) == "list:" then -- B-077: as update_media_names(true) in a reset
                    media["cycle_index_" .. ref] = 1;
                    media["last_orientation_" .. ref] = count_orientation;
                    assign_audio_source_name(key .. "_arr", ref);
                end
            end
        end
    end
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Applies changed settings: loads them into the globals, stops the timer when the script is disabled, reads the custom units and frame rate, and resets the hundredths state when the timing or trigger changed. Only a timing change stops the secondary timers and resets the timer (B-037); other changes keep the time and redraw, updating the markers, prefix and suffix, media choices and activation signals.
	Scope: global; called by OBS when settings change and after load, and by import_button_clicked
	type: OBS entry point
	input type: settings: obs_data (the script's settings)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
function script_update(settings)
    debug_log('script_update(' .. pre_dump(settings) .. ') -- function variable names:  settings ')
    ctx.propsSet = settings; -- Keep track of current settings
    --[[
		Once OBS has loaded, the script is ready. Set it before
		load_settings_globals() so this update's reset() is not skipped.
		(idea from PR #18, brohirrim)
	]]
    if frontend_ready() then
        obs.obs_data_set_bool(settings, "script_ready", true);
    end
    --[[
		Update a gloabl in case something changed.
	]]
    count_required_sources();
    --[[
		Get the correct frequency for splitseconds when the script loads.
	]]
    assign_default_frequency();
    --[[
		load any property values available to globals
	]]
    load_settings_globals(settings); -- load all property settings to globals
    if disable_script and timer_active then
        activate(false); -- B-042 (decision 2026-10-09): Disable Script pauses a running timer and keeps the time
        rearm_media_limits(); -- B-068 (review): the marker audio isn't paused, so its limit keeps running
    end
    --[[
		B-024: the units must be known before reset() and update_timer_settings()
		redraw the timer, or a stopped timer is shown with the previous units.
	]]
    hour_unit = get_unit_allocation(custom_time_format, 'H');
    minute_unit = get_unit_allocation(custom_time_format, 'M');
    frame_unit = get_frame_unit(custom_time_format); -- F3: nil = hundredths, else frames per second
    if frame_unit == 0 then frame_unit = output_fps() end
    local signature = timing_signature(settings);
    local timing_changed = (signature ~= last_timing_signature);
    last_timing_signature = signature;
    if timing_changed or toggle_mili_trigger ~= last_mili_trigger then
        reset_mili();                -- ensure mili hide/show settings are updated
    end
    last_mili_trigger = toggle_mili_trigger;
    if not timing_changed then
        --[[
			B-037: keep the time and state, but apply the edit: marker times may have
			changed, and a new timer source must be written even if the text is the same.
		]]
        update_time_markers(roundSeconds());
        prepare_text_prefix_suffix(); -- B-075: a new prefix / suffix (reset() prepared it before B-037)
        hide_new_media_choices();     -- B-076
        last_text = tostring(obs.os_gettime_ns()); -- force the redraw, as reset() does
        set_time_text(timer_source); -- redraw with the new display settings
        timer_activation_signals();
        return;
    end
    remove_all_timers();             -- a timing change starts over
    reset(true);
    hide_new_media_choices(true);    -- B-076: reset() did the work; only record the choices
    --[[
		If setting changed, update timer
	]]
    update_timer_settings(false); -- optional inputs: set_to_default(bool), new_settings(obs_property_data/obs_userdata)
    --[[
	 		Make sure the trigger is as accurate as possible depending
			if the timer is counting up or down.
	]]
    timer_activation_signals()
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Sets the default value of every setting, and the starting tick length.
	Scope: global; called by OBS
	type: OBS entry point
	input type: settings: obs_data (the script's settings)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
function script_defaults(settings)
    debug_log('script_defaults(' .. pre_dump(settings) .. ') -- function variable names:  settings ')
    --[[
		Get the correct frequency for splitseconds when the script loads.
	]]
    assign_default_frequency();
    --[[
		Set property value by provided property reference.

		Set property INTEGER TYPES.
	]]
    obs.obs_data_set_default_int(settings, "sec_add_limit", 0);
    obs.obs_data_set_default_int(settings, "sec_add_limit_used", 0);
    obs.obs_data_set_default_int(settings, "sec_sub_limit", 0);
    obs.obs_data_set_default_int(settings, "sec_sub_limit_used", 0);
    obs.obs_data_set_default_int(settings, "hours", 0);
    obs.obs_data_set_default_int(settings, "layout", 1);
    obs.obs_data_set_default_int(settings, "minutes", 0);
    obs.obs_data_set_default_int(settings, "seconds", 0);
    obs.obs_data_set_default_int(settings, "sec_add_1", 5);
    obs.obs_data_set_default_int(settings, "sec_add_2", 15);
    obs.obs_data_set_default_int(settings, "sec_add_3", 30);
    obs.obs_data_set_default_int(settings, "sec_sub_1", 5);
    obs.obs_data_set_default_int(settings, "sec_sub_2", 15);
    obs.obs_data_set_default_int(settings, "sec_sub_3", 30);
    obs.obs_data_set_default_int(settings, "split_type", 2);
    obs.obs_data_set_default_int(settings, "timer_mode", 1);
    obs.obs_data_set_default_int(settings, "timer_format", 1);
    obs.obs_data_set_default_int(settings, "timer_activation", 1);
    obs.obs_data_set_default_int(settings, "timer_reset", 1);
    obs.obs_data_set_default_int(settings, "timer_options", 1);
    obs.obs_data_set_default_int(settings, "countdown_type", 2);
    obs.obs_data_set_default_int(settings, "sw_days_saved", 0);
    obs.obs_data_set_default_int(settings, "sw_hours_saved", 0);
    obs.obs_data_set_default_int(settings, "sw_minutes_saved", 0);
    obs.obs_data_set_default_int(settings, "sw_seconds_saved", 0);
    obs.obs_data_set_default_int(settings, "sw_milliseconds_saved", 0);
    obs.obs_data_set_default_int(settings, "cycle_direction", 1);
    obs.obs_data_set_default_int(settings, "start_recording", 1);
    obs.obs_data_set_default_int(settings, "reset_text_marker_a", 3);
    obs.obs_data_set_default_int(settings, "reset_text_marker_b", 3);
    obs.obs_data_set_default_int(settings, "hide_note_marker_a", 3);
    obs.obs_data_set_default_int(settings, "hide_note_marker_b", 3);
    obs.obs_data_set_default_string(settings, "text_marker_tip", "Use format 00:00:00 ( hours:minutes:seconds )");
    obs.obs_data_set_default_int(settings, "duration_marker_a", 5);
    obs.obs_data_set_default_bool(settings, "pause_marker_a", false); -- F9
    obs.obs_data_set_default_bool(settings, "pause_marker_b", false); -- F9
    obs.obs_data_set_default_int(settings, "duration_marker_b", 5);
    obs.obs_data_set_default_int(settings, "timer_manipulation", 1); -- "Hidden": hotkeys work out of the box (B2)
    obs.obs_data_set_default_int(settings, "duration_marker_end", 5);
    obs.obs_data_set_default_int(settings, "enable_marker_notes", 1);
    obs.obs_data_set_default_int(settings, "media_playback_limit", 1);
    obs.obs_data_set_default_int(settings, "year", os.date("%Y", os.time()));
    obs.obs_data_set_default_int(settings, "add_limit_note_source_visible", 0)
    obs.obs_data_set_default_int(settings, "sub_limit_note_source_visible", 0)
    obs.obs_data_set_default_int(settings, "color_normal", media["color_normal"]);
    obs.obs_data_set_default_int(settings, "color_marker_a", media["color_marker_a"]);
    obs.obs_data_set_default_int(settings, "color_marker_b", media["color_marker_b"]);
    --[[
		Set property STRING TYPES.
	]]
    obs.obs_data_set_default_string(settings, "stop_text", "");
    obs.obs_data_set_default_string(settings, "text_prefix", "");
    obs.obs_data_set_default_string(settings, "text_suffix", "");
    obs.obs_data_set_default_string(settings, "note_marker_a", "");
    obs.obs_data_set_default_string(settings, "note_marker_b", "");
    -- upgraded obs.obs_data_set_default_string( settings, "text_marker_a", "" );
    -- upgraded obs.obs_data_set_default_string( settings, "text_marker_b", "" );
    obs.obs_data_set_default_string(settings, "timer_expire_event", "select");
    obs.obs_data_set_default_bool(settings, "overtime_style", true); -- F2
    obs.obs_data_set_default_bool(settings, "expire_audio_first", false); -- F4
    obs.obs_data_set_default_string(settings, "cycle_source_children", "select");
    obs.obs_data_set_default_string(settings, "day_text", "# Day \n");
    obs.obs_data_set_default_string(settings, "audio_marker_a", "none"); -- B-048: the list value
    obs.obs_data_set_default_string(settings, "audio_marker_b", "none"); -- B-048: the list value
    obs.obs_data_set_default_string(settings, "audio_marker_end", "none"); -- B-048: the list value
    obs.obs_data_set_default_string(settings, "days_text", "# Days \n");
    obs.obs_data_set_default_string(settings, "split_source", "select");
    obs.obs_data_set_default_string(settings, "timer_source", "select");
    obs.obs_data_set_default_string(settings, "active_source", "select");
    obs.obs_data_set_default_string(settings, "toggle_mili_trigger", "");
    obs.obs_data_set_default_string(settings, "sub_limit_note_source", "select");
    obs.obs_data_set_default_string(settings, "add_limit_note_source", "select");
    obs.obs_data_set_default_string(settings, "note_source_marker_a", "select");
    obs.obs_data_set_default_string(settings, "note_source_marker_b", "select");
    obs.obs_data_set_default_string(settings, "custom_time_format", "$T$D:$H:$M:$S,$F");
    obs.obs_data_set_default_bool(settings, "round_up_countdown", true); -- F8
    --[[
		Set property BOOL TYPES.
	]]
    obs.obs_data_set_default_bool(settings, "backup_mode", false);
    obs.obs_data_set_default_bool(settings, "backup_split_time", false);
    obs.obs_data_set_default_bool(settings, "set_stopwatch", false);
    obs.obs_data_set_default_bool(settings, "disable_script", false);
    obs.obs_data_set_default_bool(settings, "debug_enabled", false);
    obs.obs_data_set_default_bool(settings, "load_saved_time", false);
    obs.obs_data_set_default_bool(settings, "backup_split_time", false);
    obs.obs_data_set_default_bool(settings, "enable_direction_toggle", false);
    obs.obs_data_set_default_bool(settings, "prevent_negative_time", false);
    obs.obs_data_set_default_bool(settings, "active_source_force_visible", false);
    obs.obs_data_set_default_bool(settings, "split_startpause", false);

    obs.obs_data_set_default_bool(settings, "select_features", false);
    obs.obs_data_set_default_bool(settings, "enable_property_toggle_mili_trigger", true);
    obs.obs_data_set_default_bool(settings, "enable_property_color_normal", true);
    obs.obs_data_set_default_bool(settings, "enable_property_color_marker_a", true);
    obs.obs_data_set_default_bool(settings, "enable_property_color_marker_b", true);
    obs.obs_data_set_default_bool(settings, "enable_property_split_source", true);
    obs.obs_data_set_default_bool(settings, "enable_property_trigger_options", true);
    obs.obs_data_set_default_bool(settings, "enable_property_start_recording", true);
    obs.obs_data_set_default_bool(settings, "enable_property_text_prefix", true);
    obs.obs_data_set_default_bool(settings, "enable_property_text_suffix", true);
    obs.obs_data_set_default_bool(settings, "enable_property_timer_activation", true);
    obs.obs_data_set_default_bool(settings, "enable_property_timer_manipulation", true);
    obs.obs_data_set_default_bool(settings, "enable_property_debug", true);
    obs.obs_data_set_default_bool(settings, "enable_property_backup", true);
    obs.obs_data_set_default_bool(settings, "note_group_type_text", true);   -- 6.1 option: Text only, as before
    obs.obs_data_set_default_bool(settings, "note_group_type_image", false);
    obs.obs_data_set_default_bool(settings, "note_group_type_browser", false);
    obs.obs_data_set_default_bool(settings, "note_group_type_color", false);
    obs.obs_data_set_default_bool(settings, "note_group_type_media", false);
    obs.obs_data_set_default_bool(settings, "enable_property_description", true); -- F5: shown by default; the checkbox at the top of the form hides it

    debug_log('loaded get default script_ready (' .. pre_dump(true) .. ') ')
    -- Keep track of current settings
    ctx.propsSet = settings;
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Saves the hotkey bindings into the settings, records a marker colour showing at save time so the next start can restore the normal colour (B-074), and, with "Autoload last time stamp when OBS starts", stores the current time.
	Scope: global; called by OBS when it saves (also at exit)
	type: OBS entry point
	input type: settings: obs_data (the script's settings)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
function script_save(settings)
    debug_log('script_save(' .. pre_dump(settings) .. ') -- function variable names:  settings ')
    -- B-074: a marker colour shows now; if this is the exit save, restore the normal colour at the next start
    local colour_pending = script_colour_showing and media["color_normal"] ~= nil;
    obs.obs_data_set_bool(settings, "sw_colour_restore_pending", colour_pending);
    if colour_pending then
        obs.obs_data_set_int(settings, "sw_colour_restore_normal", media["color_normal"]);
    end
    --[[
		script save

		Reset (Timer)
	]]
    local hotkey_save_array_reset = obs.obs_hotkey_save(hotkey_id_reset);
    obs.obs_data_set_array(settings, "reset_hotkey", hotkey_save_array_reset);
    obs.obs_data_array_release(hotkey_save_array_reset);
    --[[
		script save

		Set (Timer)
	]]
    local hotkey_save_array_set = obs.obs_hotkey_save(hotkey_id_set);
    obs.obs_data_set_array(settings, "set_hotkey", hotkey_save_array_set);
    obs.obs_data_array_release(hotkey_save_array_set);
    --[[
		script save

		Start Timer
	]]
    local hotkey_save_array_start = obs.obs_hotkey_save(hotkey_id_start);
    obs.obs_data_set_array(settings, "start_hotkey", hotkey_save_array_start);
    obs.obs_data_array_release(hotkey_save_array_start);
    --[[
		script save

		Pause (Start/Pause Timer)
	]]
    local hotkey_save_array_pause = obs.obs_hotkey_save(hotkey_id_pause);
    obs.obs_data_set_array(settings, "pause_hotkey", hotkey_save_array_pause);
    obs.obs_data_array_release(hotkey_save_array_pause);
    --[[
		script save

		Split (available for stopwatch only)
	]]
    local hotkey_save_array_split = obs.obs_hotkey_save(hotkey_id_split);
    obs.obs_data_set_array(settings, "split_hotkey", hotkey_save_array_split);
    obs.obs_data_array_release(hotkey_save_array_split);
    --[[
		script is loading. register and assign hotkeys

		script save
	]]
    local hotkey_save_array_mili = obs.obs_hotkey_save(hotkey_id_mili);
    obs.obs_data_set_array(settings, "mili_hotkey", hotkey_save_array_mili);
    obs.obs_data_array_release(hotkey_save_array_mili);
    --[[
	]]
    local hotkey_save_array_direction = obs.obs_hotkey_save(hotkey_id_direction);
    obs.obs_data_set_array(settings, "direction_hotkey", hotkey_save_array_direction);
    obs.obs_data_array_release(hotkey_save_array_direction);
    --[[

	]]
    local hotkey_save_array_sec_add_1 = obs.obs_hotkey_save(hotkey_id_sec_add_1);
    obs.obs_data_set_array(settings, "sec_add_1_hotkey", hotkey_save_array_sec_add_1);
    obs.obs_data_array_release(hotkey_save_array_sec_add_1);
    --[[

	]]
    local hotkey_save_array_sec_add_2 = obs.obs_hotkey_save(hotkey_id_sec_add_2);
    obs.obs_data_set_array(settings, "sec_add_2_hotkey", hotkey_save_array_sec_add_2);
    obs.obs_data_array_release(hotkey_save_array_sec_add_2);
    --[[

	]]
    local hotkey_save_array_sec_add_3 = obs.obs_hotkey_save(hotkey_id_sec_add_3);
    obs.obs_data_set_array(settings, "sec_add_3_hotkey", hotkey_save_array_sec_add_3);
    obs.obs_data_array_release(hotkey_save_array_sec_add_3);
    --[[

	]]
    local hotkey_save_array_sec_sub_1 = obs.obs_hotkey_save(hotkey_id_sec_sub_1);
    obs.obs_data_set_array(settings, "sec_sub_1_hotkey", hotkey_save_array_sec_sub_1);
    obs.obs_data_array_release(hotkey_save_array_sec_sub_1);
    --[[

	]]
    local hotkey_save_array_sec_sub_2 = obs.obs_hotkey_save(hotkey_id_sec_sub_2);
    obs.obs_data_set_array(settings, "sec_sub_2_hotkey", hotkey_save_array_sec_sub_2);
    obs.obs_data_array_release(hotkey_save_array_sec_sub_2);
    --[[

	]]
    local hotkey_save_array_sec_sub_3 = obs.obs_hotkey_save(hotkey_id_sec_sub_3);
    obs.obs_data_set_array(settings, "sec_sub_3_hotkey", hotkey_save_array_sec_sub_3);
    obs.obs_data_array_release(hotkey_save_array_sec_sub_3);
    --[[
		It is really important that this the last item in this routine
	]]
    --obs.obs_properties_set_flags( ctx.propsDef, obs.obs_properties_get_flags( ctx.propsDef ) or obs.OBS_PROPERTIES_DEFER_UPDATE)
    if load_saved_time then
        obs.obs_data_set_double(ctx.propsSet, "sw_current_seconds", current_seconds);
        obslua.obs_data_apply(settings, ctx.propsSet);
    end
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Registers the script's hotkeys (Reset, Set, Start, Pause, Split Time, Milliseconds Toggle, Change Timer Direction, Add and Subtract Seconds Sets 1-3), named after the script file, and loads their saved bindings.
	Scope: global; called by script_load
	type: helper (hotkeys)
	input type: settings: obs_data (the script's settings); load_globals: bool (not used)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
function assign_hotkeys(settings, load_globals)
    debug_log('assign_hotkeys(' .. pre_dump(settings) .. ') -- function variable names:  settings ')
    --if load_globals then load_settings_globals( settings ) end
    local hotkey_name = "";

    --[[

		%s: This is a special sequence which matches all whitespace characters.
		%c: This is a special sequence which matches all control characters (\n, \t, \r, ...).
		%p: This is a special sequence which matches all punctuation characters (!, ?, &, ...).
		%w: This is a special sequence which matches all alphanumeric characters (A-Z, a-z, 0-9).
		see also: 	https://riptutorial.com/lua/example/20315/lua-pattern-matching
	]]
    --[[
		script is loading. register and assign hotkeys

		Reset (Timer)
	]]
    hotkey_name = "timer_reset_" .. filename():lower():gsub("[%W%p%c%s]", "");
    hotkey_id_reset = obs.obs_hotkey_register_frontend(hotkey_name, "Reset " .. filename(), hotkey_send_reset);
    local hotkey_save_array_reset = obs.obs_data_get_array(settings, "reset_hotkey");
    obs.obs_hotkey_load(hotkey_id_reset, hotkey_save_array_reset);
    obs.obs_data_array_release(hotkey_save_array_reset);
    --[[
		script is loading. register and assign hotkeys

		Set (Timer)
	]]
    hotkey_name = "timer_set_" .. filename():lower():gsub("[%W%p%c%s]", "");
    hotkey_id_set = obs.obs_hotkey_register_frontend(hotkey_name, "Set " .. filename(), hotkey_send_set);
    local hotkey_save_array_set = obs.obs_data_get_array(settings, "set_hotkey");
    obs.obs_hotkey_load(hotkey_id_set, hotkey_save_array_set);
    obs.obs_data_array_release(hotkey_save_array_set);
    --[[
		script is loading. register and assign hotkeys

		Pause (Start/Pause Timer)
	]]
    hotkey_name = "timer_start_" .. filename():lower():gsub("[%W%p%c%s]", "");
    hotkey_id_start = obs.obs_hotkey_register_frontend(hotkey_name, "Start (Start/Pause if not split) " .. filename(),
        hotkey_send_start); -- B8: in non-split mode this hotkey also toggles
    local hotkey_save_array_start = obs.obs_data_get_array(settings, "start_hotkey");
    obs.obs_hotkey_load(hotkey_id_start, hotkey_save_array_start);
    obs.obs_data_array_release(hotkey_save_array_start);
    --[[
		script is loading. register and assign hotkeys

		Pause (Start/Pause Timer)
	]]
    --[[
		B8: hotkey names are fixed at load time, and the label used to depend on
		split_startpause, so it was wrong until OBS restarted. Use one label that
		describes both modes. hotkey_name (the binding ID) is unchanged, so existing
		bindings are kept.
	]]
    hotkey_name = "timer_pause_" .. filename():lower():gsub("[%W%p%c%s]", "");
    hotkey_id_pause = obs.obs_hotkey_register_frontend(hotkey_name, "Pause (Start/Pause if not split) " .. filename(),
        hotkey_send_pause);
    local hotkey_save_array_pause = obs.obs_data_get_array(settings, "pause_hotkey");
    obs.obs_hotkey_load(hotkey_id_pause, hotkey_save_array_pause);
    obs.obs_data_array_release(hotkey_save_array_pause);
    --[[
		script is loading. register and assign hotkeys

		Split (available for stopwatch only)
	]]
    hotkey_name = "timer_split_" .. filename():lower():gsub("[%W%p%c%s]", "");
    hotkey_id_split = obs.obs_hotkey_register_frontend(hotkey_name, "Split Time " .. filename(), hotkey_send_split);
    local hotkey_save_array_split = obs.obs_data_get_array(settings, "split_hotkey");
    obs.obs_hotkey_load(hotkey_id_split, hotkey_save_array_split);
    obs.obs_data_array_release(hotkey_save_array_split);
    --[[
		script is loading. register and assign hotkeys

		Milliseconds (Show/Hide Timer Milliseconds if in Timer format)
	]]
    hotkey_name = "timer_mili_" .. filename():lower():gsub("[%W%p%c%s]", "");
    hotkey_id_mili = obs.obs_hotkey_register_frontend(hotkey_name, "Milliseconds Toggle " .. filename(), hotkey_send_mili);
    local hotkey_save_array_mili = obs.obs_data_get_array(settings, "mili_hotkey");
    obs.obs_hotkey_load(hotkey_id_mili, hotkey_save_array_mili);
    obs.obs_data_array_release(hotkey_save_array_mili);
    --[[
		script is loading. register and assign hotkeys

		Change Timer Count Direction (Show/Hide Timer Milliseconds if in Timer format)
	]]
    hotkey_name = "direction_change_" .. filename():lower():gsub("[%W%p%c%s]", "");
    hotkey_id_direction = obs.obs_hotkey_register_frontend(hotkey_name, "Change Timer Direction " .. filename(),
        hotkey_send_direction);
    local hotkey_save_array_direction = obs.obs_data_get_array(settings, "direction_hotkey");
    obs.obs_hotkey_load(hotkey_id_direction, hotkey_save_array_direction);
    obs.obs_data_array_release(hotkey_save_array_direction);
    --[[
		script is loading. register and assign hotkeys

		Add Seconds to Timer
	]]
    hotkey_name = "sec_add_1_" .. filename():lower():gsub("[%W%p%c%s]", "");
    hotkey_id_sec_add_1 = obs.obs_hotkey_register_frontend(hotkey_name, "Add Seconds Set 1 " .. filename(),
        hotkey_send_sec_add_1);
    local hotkey_save_array_sec_add_1 = obs.obs_data_get_array(settings, "sec_add_1_hotkey");
    obs.obs_hotkey_load(hotkey_id_sec_add_1, hotkey_save_array_sec_add_1);
    obs.obs_data_array_release(hotkey_save_array_sec_add_1);
    --[[
		script is loading. register and assign hotkeys

		Add Seconds to Timer
	]]
    hotkey_name = "sec_add_2_" .. filename():lower():gsub("[%W%p%c%s]", "");
    hotkey_id_sec_add_2 = obs.obs_hotkey_register_frontend(hotkey_name, "Add Seconds Set 2 " .. filename(),
        hotkey_send_sec_add_2);
    local hotkey_save_array_sec_add_2 = obs.obs_data_get_array(settings, "sec_add_2_hotkey");
    obs.obs_hotkey_load(hotkey_id_sec_add_2, hotkey_save_array_sec_add_2);
    obs.obs_data_array_release(hotkey_save_array_sec_add_2);
    --[[
		script is loading. register and assign hotkeys

		Add Seconds to Timer
	]]
    hotkey_name = "sec_add_3_" .. filename():lower():gsub("[%W%p%c%s]", "");
    hotkey_id_sec_add_3 = obs.obs_hotkey_register_frontend(hotkey_name, "Add Seconds Set 3 " .. filename(),
        hotkey_send_sec_add_3);
    local hotkey_save_array_sec_add_3 = obs.obs_data_get_array(settings, "sec_add_3_hotkey");
    obs.obs_hotkey_load(hotkey_id_sec_add_3, hotkey_save_array_sec_add_3);
    obs.obs_data_array_release(hotkey_save_array_sec_add_3);
    --[[
		script is loading. register and assign hotkeys

		Add Seconds to Timer
	]]
    hotkey_name = "sec_sub_1_" .. filename():lower():gsub("[%W%p%c%s]", "");
    hotkey_id_sec_sub_1 = obs.obs_hotkey_register_frontend(hotkey_name, "Subtract Seconds Set 1 " .. filename(),
        hotkey_send_sec_sub_1);
    local hotkey_save_array_sec_sub_1 = obs.obs_data_get_array(settings, "sec_sub_1_hotkey");
    obs.obs_hotkey_load(hotkey_id_sec_sub_1, hotkey_save_array_sec_sub_1);
    obs.obs_data_array_release(hotkey_save_array_sec_sub_1);
    --[[
		script is loading. register and assign hotkeys

		Add Seconds to Timer
	]]
    hotkey_name = "sec_sub_2_" .. filename():lower():gsub("[%W%p%c%s]", "");
    hotkey_id_sec_sub_2 = obs.obs_hotkey_register_frontend(hotkey_name, "Subtract Seconds Set 2 " .. filename(),
        hotkey_send_sec_sub_2);
    local hotkey_save_array_sec_sub_2 = obs.obs_data_get_array(settings, "sec_sub_2_hotkey");
    obs.obs_hotkey_load(hotkey_id_sec_sub_2, hotkey_save_array_sec_sub_2);
    obs.obs_data_array_release(hotkey_save_array_sec_sub_2);
    --[[
		script is loading. register and assign hotkeys

		Add Seconds to Timer
	]]
    hotkey_name = "sec_sub_3_" .. filename():lower():gsub("[%W%p%c%s]", "");
    hotkey_id_sec_sub_3 = obs.obs_hotkey_register_frontend(hotkey_name, "Subtract Seconds Set 3 " .. filename(),
        hotkey_send_sec_sub_3);
    local hotkey_save_array_sec_sub_3 = obs.obs_data_get_array(settings, "sec_sub_3_hotkey");
    obs.obs_hotkey_load(hotkey_id_sec_sub_3, hotkey_save_array_sec_sub_3);
    obs.obs_data_array_release(hotkey_save_array_sec_sub_3);
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Starts the script: marks it ready if OBS has loaded, schedules init when OBS is already running, sets the tick length, connects the global source load and activate signals and the frontend event callback, and registers the hotkeys.
	Scope: global; called by OBS when the script loads
	type: OBS entry point
	input type: settings: obs_data (the script's settings)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
function script_load(settings)
    debug_log('script_load(' .. pre_dump(settings) .. ') -- function variable names:  settings ')
    local status = count_required_sources()
    debug_log('script_load sources ready (' .. pre_dump(status) .. ') ')
    local obs_loaded = frontend_ready()                          -- script added while OBS is already running
    status = (status ~= 0) or obs_loaded
    obs.obs_data_set_bool(ctx.propsSet, "script_ready", status); -- set to signal ready state.
    if obs_loaded then
        obs.timer_add(deferred_init_callback, 100);              -- FINISHED_LOADING will not fire, so init here
    end
    debug_log('script_load set script_ready (' .. pre_dump(status) .. ') ')
    --[[
		Get the correct frequency for splitseconds when the script loads.
	]]
    assign_default_frequency();
    local sh = obs.obs_get_signal_handler();
    --[[
		attach event listener callback [loaded]
		for when a source is done loading.
	]]
    obs.signal_handler_connect(sh, "source_load", loaded);                   -- monitor for source load completed
    obs.signal_handler_connect(sh, "source_deactivate", source_deactivated); -- monitor source deactivates signal_handler_disconnect
    obs.signal_handler_connect(sh, "source_activate", source_activated);     -- monitor source activates
    --[[
		Adds a callback that will be called when a frontend event occurs.
		See obs_frontend_event on what sort of events can be triggered.
	]]
    obs.obs_frontend_add_event_callback(on_event)

    --[[
		Define Hotkeys
	]]
    assign_hotkeys(settings, true)
    --[[
		If the user is not loading saved time, clear it
	]]
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Cleans up when the script unloads: writes the debug buffer, puts the normal colour back if a marker colour shows (B-074), drops the panel references, and releases the weak source references of the signal connections.
	Scope: global; called by OBS when the script unloads
	type: OBS entry point
	input type: none
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
function script_unload()
    flush_debug_file(); -- B-057: the lines buffered since the last write
    --[[
		B-074: Reload Scripts or removing the script while a marker colour shows: put the
		normal colour back, so later saves keep it. (At OBS exit the sources are already
		saved and released here: see restore_saved_normal_colour.)
	]]
    if script_colour_showing and media["color_normal"] ~= nil then
        set_timer_text_color(media["color_normal"]);
        if ctx.propsSet ~= nil then obs.obs_data_set_bool(ctx.propsSet, "sw_colour_restore_pending", false) end
    end
    ctx.propsDef = nil;
    props = nil;
    -- B-034: release the weak source references (OBS removes the script's signal callbacks itself)
    for name, handlers in pairs(connectedHandlers) do
        if handlers.weak then obs.obs_weak_source_release(handlers.weak) end
        connectedHandlers[name] = nil;
    end
end
--[[
----------------------------------------------------------------------------------------------------------------------------------------
	Description: Handles OBS frontend events: runs init when loading finishes or the scene collection changes; for Timer Activation "Specific Scene Active", "Recording Started" or "Streaming Started", starts (resetting first with Auto reset), pauses or resumes the timer on scene changes, recording and streaming events. Scene switches made by the script itself are ignored (B-065).
	Scope: global; added by script_load (and re-added by the scene switch helpers) as the frontend event callback
	type: frontend event callback
	input type: event: number (an OBS_FRONTEND_EVENT_* value)
	returns: none
----------------------------------------------------------------------------------------------------------------------------------------
]]
function on_event(event)
    debug_log('on_event( ' .. pre_dump(event) .. ' ) -- function variable names: event')
    if event == obs.OBS_FRONTEND_EVENT_FINISHED_LOADING then
        debug_log('Event: Finished Loading')
        init();                                     -- redundancy
        loading_finished = true;                    -- B-035: later source_load signals don't re-run init()
        if not load_saved_time then
            update_prop_settings_current_seconds(0) -- update current time to last time in properties
        end
    elseif event == obs.OBS_FRONTEND_EVENT_SCENE_COLLECTION_CHANGED then
        init();                                     -- B-035: a new collection's sources are loaded
        loading_finished = true;                    -- B-035 (review): no FINISHED_LOADING comes after a switch
    elseif event == obs.OBS_FRONTEND_EVENT_SCENE_LIST_CHANGED then
        debug_log('Event: Scene List Changed')
    elseif event == obs.OBS_FRONTEND_EVENT_SCENE_CHANGED then
        debug_log('Event: Scene Changed')
        local current_scene_name = frontend_get_current_scene()
        if is_self_switch(current_scene_name) then return end -- B-065: the script's own switch
        if timer_activation == 4 then
            if timer_activation_source == current_scene_name then
                debug_log('Activate Timer: Scene Changed')
                if timer_reset == 2 and not disable_script then reset(true) end -- B-043: disabled keeps the time
                start(true)
            else
                debug_log('De-activate Timer: Scene Changed')
                pause(true)
            end
        end
    elseif event == obs.OBS_FRONTEND_EVENT_RECORDING_STARTED then
        debug_log('Event: Recording Started')
        if timer_activation == 7 then
            if timer_reset == 2 and not disable_script then reset(true) end -- B-043: disabled keeps the time
            start(true)
        end
    elseif event == obs.OBS_FRONTEND_EVENT_RECORDING_PAUSED then
        debug_log('Event: Recording Paused')
        if timer_activation == 7 then
            pause(true)
        end
    elseif event == obs.OBS_FRONTEND_EVENT_RECORDING_UNPAUSED then
        debug_log('Event: Recording Unpaused')
        if timer_activation == 7 then
            start(true)
        end
    elseif event == obs.OBS_FRONTEND_EVENT_RECORDING_STOPPED then
        debug_log('Event: Recording Stopped')
        if timer_activation == 7 then
            pause(true)
        end
    elseif event == obs.OBS_FRONTEND_EVENT_STREAMING_STARTED then
        debug_log('Event: Streaming Started')
        if timer_activation == 8 then
            if timer_reset == 2 and not disable_script then reset(true) end -- B-043: disabled keeps the time
            start(true)
        end
    elseif event == obs.OBS_FRONTEND_EVENT_STREAMING_STOPPED then
        debug_log('Event: Streaming Stopped')
        if timer_activation == 8 then
            pause(true)
        end
    elseif event == obs.OBS_FRONTEND_EVENT_EXIT then
    elseif event == obs.OBS_FRONTEND_EVENT_SCRIPTING_SHUTDOWN then
    elseif event == obs.OBS_FRONTEND_EVENT_SCENE_COLLECTION_CLEANUP then
    end
end