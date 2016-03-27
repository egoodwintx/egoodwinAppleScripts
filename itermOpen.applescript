(* Applescript to open iTerm session from Finder in current working directory
 via right mouse click
 shamelessly stolen from http://peterdowns.com/posts/open-iterm-finder-service.html
 and https://gist.github.com/lsloan/1265327 *)
on run {input, parameters}
  tell application "Finder"
    set dir_path to quoted form of (POSIX path of (input as alias))
  end tell
  CD_to(dir_path)
end run

on CD_to(theDir)
  tell application "iTerm"
    activate

    try
      set t to the last terminal
    on error
      set t to (make new terminal)
    end try

    tell t
      launch session "Default Session"
      tell the last session
        write text "cd " & theDir & ";clear;"
      end tell
    end tell
  end tell
end CD_to
