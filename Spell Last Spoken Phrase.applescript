# Created by Kate Kligman
# A script to spell out the contents of the last phrase spoken by Voice Over.
# If nothing, the word "empty" will be recited.

tell application "VoiceOver"
    tell the last phrase
        set readme to the content
    end tell
end tell

try
    set r to «class ktxt» of ((readme as text) as record)
    set exp to {}
    repeat with x in the characters of r
        if contents of x = " " then
            set the end of exp to " space "
        else if contents of x = "\"" then
            set the end of exp to " double quote "
        else if contents of x = "\\" then
            set the end of exp to " back slash "
        else
            set the end of exp to x as text
        end if
        set the end of exp to ", " as text
    end repeat
    set exp to exp as text
on error
    set exp to "empty"
end try

copy exp to stdout

tell application "VoiceOver"
    output (exp as text)
end tell
