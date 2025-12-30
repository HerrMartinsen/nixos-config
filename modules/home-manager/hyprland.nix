{ ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    settings = {
      "$mainMod" = "SUPER";
      "$terminal" = "kitty";
      "$fileManager" = "dolphin";
      "$browser" = "firefox";
      "$editor" = "hx";
      "$ide" = "code";
      "$menu" = "rofi -show drun -show-icons";
      "$colorPicker" = "hyprpicker";
      "$rofi-todo" = "/home/martin/rofi-todo/rofi-todo.sh";

      ecosystem = {
        no_update_news = true;
      };

      monitor = [
        "eDP-1,preferred,0x0,1"
        #FS Left
        "desc:Philips Consumer Electronics Company PHL 240B9 AU12220000850, preferred, -960x-1200,1"
        "desc:Philips Consumer Electronics Company PHL 240B9 AU12220000842, preferred, 960x-1200, 1"
        #FS Right
        "desc:Philips Consumer Electronics Company PHL 240B9 AU12220000844, preferred, -960x-1200,1"
        "desc:Philips Consumer Electronics Company PHL 240B9 AU12220000852, preferred, 960x-1200, 1"
      ];

      general = {
        # layout = master;
        "col.active_border" = "$accent";
        "col.inactive_border" = "$base";
      };

      decoration = {
        rounding = 10;

        blur = {
          enabled = true;
          xray = true;
          new_optimizations = true;
          size = 6;
          passes = 3;
          ignore_opacity = true;
          noise = 1.0e-2;
          contrast = 1;
        };

        shadow = {
          enabled = true;
          range = 4;
          render_power = 4;
          color = "$accent";
          color_inactive = "$base";
        };

        inactive_opacity = 0.9;
        active_opacity = 0.95;
      };

      input = {
        kb_layout = "de";
        kb_variant = "nodeadkeys";
        follow_mouse = 1;
        sensitivity = 0.2;
        touchpad = {
          natural_scroll = true;
        };

      };

      gestures = {
        workspace_swipe_forever = true;
      };

      gesture = [
        "3, horizontal, workspace"
      ];

      bind = [
        "$mainMod, ESCAPE, exec, wlogout"
        ", Print, exec, grimblast --freeze --notify copysave screen"

        "$mainMod, TAB, exec, rofi -show window"
        "$mainMod, Q, exec, $terminal"
        "$mainMod, W, togglefloating,"
        "$mainMod CTRL, W, fullscreen,"
        "$mainMod, E, exec, $terminal $editor"
        "$mainMod, R, exec, $menu"
        "$mainMod, T, exec, $rofi-todo"
        "$mainMod, Z, exec, grimblast --freeze --notify copysave active"
        "$mainMod ALT, Z, exec, grimblast --freeze --notify copysave area"
        "$mainMod, I, exec, $ide"
        "$mainMod CTRL, P, pseudo, # dwindle"
        "$mainMod, P, exec, $colorPicker | wl-copy"

        "$mainMod, F, exec, $fileManager"
        "$mainMod, J, togglesplit, # dwindle"
        "$mainMod, L, exec, hyprlock"

        "$mainMod, C, killactive,"
        "$mainMod, V, exec, cliphist list | rofi -dmenu -display-columns 2 | cliphist decode | wl-copy"
        "$mainMod, B, exec, $browser"
        "$mainMod, M, exit,"

        # Move focus with mainMod + arrow keys
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        # Example special workspace (scratchpad)
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"

        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
      ];
      bindm = [
        # Move/resize windows with mainMod + LMB/RMB and dragging
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
      bindel = [
        # Laptop multimedia keys for volume and LCD brightness
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
      ];
      bindl = [
        # Requires playerctl
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
      ];

      windowrule = [
        # Ignore maximize requests from apps. You'll probably like this.
        "suppressevent maximize, class:.*"

        # Fix some dragging issues with XWayland
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      ];

      exec-once = [
        "systemctl --user start hyprpolkitagent"
        "dunst"
        "waybar"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        "hypridle"
        "nm-applet --indicator"
        "blueman-applet"
        "udiskie"
      ];
      env = [
        # QT
        "QT_QPA_PLATFORM,wayland;xcb"
        "QT_QPA_PLATFORMTHEME,qt6ct"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "QT_STYLE_OVERRIDE,kvantum"

        # Toolkit Backend Variables
        "GDK_BACKEND,wayland,x11,*"
        "SDL_VIDEODRIVER,wayland"
        "CLUTTER_BACKEND,wayland"

        # XDG Specifications
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "XDG_SCREENSHOTS_DIR,/home/martin/screenshots"
      ];
    };
  };
}
