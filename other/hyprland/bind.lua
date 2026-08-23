-- hl.bind("SUPER + Q", hl.dsp.exec_cmd("kitty"), { description = "Open my favourite terminal" })

hl.bind("Print", hl.dsp.exec_cmd("grimblast --freeze --notify copysave screen"), { description = "Screenshot" })
-- hl.bind(mainMod .. " + TAB", hl.dsp.exec_cmd("rofi -show window"),{description=""})
hl.bind(mainMod .. " + ESCAPE", hl.dsp.exec_cmd("noctalia msg panel-toggle session"), { description = "Session menu" })
hl.bind(mainMod .. " + TAB", hl.dsp.exec_cmd("noctalia msg window-switcher"), { description = "Window switcher" })
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal), { description = "Open Terminal: " .. terminal })
hl.bind(mainMod .. " + W", hl.dsp.window.float({ action = "toggle" }), { description = "Toggle window float" })
hl.bind(mainMod .. " + CTRL + W", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }), {
  description =
  "Toggle Fullscreen"
})
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(terminal .. " " .. editor), { description = "Open Editor: " .. editor })
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(launcher), { description = "Open Launcher" })
-- hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("$rofi-todo"),{description=""})
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd("grimblast --freeze --notify copysave active"), { description = "Screenshot" })
hl.bind(mainMod .. " + ALT + Z", hl.dsp.exec_cmd("grimblast --freeze --notify copysave area"),
  { description = "Screenshot area" })
hl.bind(mainMod .. " + I", hl.dsp.exec_cmd(ide), { description = "Open IDE: " .. ide })
hl.bind(mainMod .. " + CTRL + P", hl.dsp.window.pseudo(), { description = "Toggle window pseudo" })
hl.bind(mainMod .. " + ALT + P", hl.dsp.exec_cmd(colorPicker .. " | wl-copy"),
  { description = "Open colorPicker: " .. colorPicker })
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd(terminal .. " " .. monitor_config), { description = "Open Monitor Config" })
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(fileManager), { description = "Open file manager: " .. fileManager })
hl.bind(mainMod .. " + C", hl.dsp.window.close(), { description = "Close Window" })
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("noctalia msg panel-toggle clipboard"),
  { description = "Open Clipboard history" })
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser), { description = "Open browser: " .. browser })
hl.bind(mainMod .. " + CTRL + M", hl.dsp.exit(), { description = "Exit Hyprland" })
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }), { description = "Move focus left" })
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }), { description = "Move focus right" })
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }), { description = "Move focus up" })
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }), { description = "Move focus down" })
hl.bind(mainMod .. " + 1", hl.dsp.focus({ workspace = 1 }), { description = "Switch to workspace 1" })
hl.bind(mainMod .. " + 2", hl.dsp.focus({ workspace = 2 }), { description = "Switch to workspace 2" })
hl.bind(mainMod .. " + 3", hl.dsp.focus({ workspace = 3 }), { description = "Switch to workspace 3" })
hl.bind(mainMod .. " + 4", hl.dsp.focus({ workspace = 4 }), { description = "Switch to workspace 4" })
hl.bind(mainMod .. " + 5", hl.dsp.focus({ workspace = 5 }), { description = "Switch to workspace 5" })
hl.bind(mainMod .. " + 6", hl.dsp.focus({ workspace = 6 }), { description = "Switch to workspace 6" })
hl.bind(mainMod .. " + 7", hl.dsp.focus({ workspace = 7 }), { description = "Switch to workspace 7" })
hl.bind(mainMod .. " + 8", hl.dsp.focus({ workspace = 8 }), { description = "Switch to workspace 8" })
hl.bind(mainMod .. " + 9", hl.dsp.focus({ workspace = 9 }), { description = "Switch to workspace 9" })
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = 10 }), { description = "Switch to workspace 10" })
hl.bind(mainMod .. " + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }), { description = "Move window to workspace 1" })
hl.bind(mainMod .. " + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }), { description = "Move window to workspace 2" })
hl.bind(mainMod .. " + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }), { description = "Move window to workspace 3" })
hl.bind(mainMod .. " + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }), { description = "Move window to workspace 4" })
hl.bind(mainMod .. " + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }), { description = "Move window to workspace 5" })
hl.bind(mainMod .. " + SHIFT + 6", hl.dsp.window.move({ workspace = 6 }), { description = "Move window to workspace 6" })
hl.bind(mainMod .. " + SHIFT + 7", hl.dsp.window.move({ workspace = 7 }), { description = "Move window to workspace 7" })
hl.bind(mainMod .. " + SHIFT + 8", hl.dsp.window.move({ workspace = 8 }), { description = "Move window to workspace 8" })
hl.bind(mainMod .. " + SHIFT + 9", hl.dsp.window.move({ workspace = 9 }), { description = "Move window to workspace 9" })
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }),
  { description = "Move window to workspace 10" })
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"), {description="Open scratch pad"})
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }), {description="Move window to scratch pad"})
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("pgrep -x spotify || spotify; hyprctl dispatch togglespecialworkspace music"), {description="Open Spotify"})
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.window.move({ workspace = "special:music" }), {description="Move window to music workspace"})
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
  { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
  { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
  { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(mainMod .. " + SHIFT + mouse:272", hl.dsp.window.resize())
