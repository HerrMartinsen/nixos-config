{ pkgs, ... }:

{
  # Cursor: hyprcursor theme for Hyprland/native Wayland apps,
  # matching XCursor theme for GTK/Xwayland (sizes set in other/hyprland/env.lua)
  home.packages = [ pkgs.rose-pine-hyprcursor ];
  home.pointerCursor = {
    enable = true;
    package = pkgs.rose-pine-cursor;
    name = "BreezeX-RosePine-Linux";
    size = 32;
    gtk.enable = true;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";
    systemd.enable = false;
    extraConfig = ''
      require("test")

      hl.config({
        decoration = {
          blur = {
            contrast = 1,
            enabled = true,
            ignore_opacity = true,
            new_optimizations = true,
            noise = 0.010000,
            passes = 3,
            size = 6,
            xray = true,
          },
          shadow = {
            enabled = true,
            range = 4,
            render_power = 4,
          },
          active_opacity = 0.950000,
          inactive_opacity = 0.900000,
          rounding = 10,
        },
        ecosystem = {
          no_update_news = true,
        },
        general = {
          resize_on_border = true,
          extend_border_grab_area = 20,
          hover_icon_on_border = true,
        },
        gestures = {
          workspace_swipe_forever = true,
        },
        input = {
          touchpad = {
          drag_lock = 1,
          natural_scroll = true,
        },
        follow_mouse = 1,
        kb_layout = "de",
        kb_variant = "nodeadkeys",
        sensitivity = 0.400000,
        },
      })
    '';
    extraLuaFiles = {
      "a_variables".content = ../../other/hyprland/variables.lua;
      "bind".content = ../../other/hyprland/bind.lua;
      "env".content = ../../other/hyprland/env.lua;
      "monitor".content = ../../other/hyprland/monitor.lua;
      "windowrule".content = ../../other/hyprland/windowrule.lua;
      "exec-once".content = ../../other/hyprland/exec-once.lua;
      "gestures".content = ../../other/hyprland/gestures.lua;
    };
  };
}
