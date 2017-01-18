# Created by Kate Kligman
# A script to spell out the contents of the clipboard in Voice Over.
# If the clipboard is empty, the word "empty" will be recited.

try
    set r to «class ktxt» of ((the clipboard as text) as record)
    set exp to {}
    repeat with x in the characters of r
        if contents of x = " " then
            set the end of exp to " space "
        else
            set the end of exp to x as text
        end if
        set the end of exp to ", " as text
    end repeat
    set exp to exp as text
on error
    set exp to "empty"
end try

tell application "VoiceOver"
    output (exp as text)
end tell
