{ ... }:

{
  programs.waybar = {
    enable = true;
    settings = [
      {
        layer = "top";
        position = "top";
        mode = "dock";
        exclusive = true;
        passthrough = false;
        gtk-layer-shell = true;
        height = 0;

        modules-left = [
          "hyprland/workspaces"
          "wlr/taskbar"
        ];
        modules-center = [
          "clock"
          "inhibitor"
        ];
        modules-right = [
          "memory"
          "cpu"
          "network"
          "battery"
          "backlight"
          # "bluetooth"
          # "bluetooth"
          "pulseaudio"
          "pulseaudio#microphone"
          "custom/notification"
          "custom/notification"
          "tray"
        ];

        "hyprland/window" = {
          format = " {}";
          separate-outputs = true;
        };

        "hyprland/workspaces" = {
          disable-scroll = true;
          on-click = "activate";
          format = "{icon}";
        };

        "wlr/taskbar" = {
          on-click = "activate";
          on-click-middle = "close";
          on-click-left = "fullscreen";
        };

        tray = {
          icon-size = 13;
          spacing = 10;
        };

        clock = {
          format = "{:%d.%m.%Y   %H:%M}";
          interval = 1;
          rotate = 0;
          tooltip-format = "<tt>{calendar}</tt>";
          calendar = {
            mode = "month";
            mode-mon-col = 3;
            on-scroll = 1;
            on-click-right = "mode";
            format = {
              months = "<span color='#a6adc8'><b>{}</b></span>";
              weekdays = "<span color='#a6adc8'><b>{}</b></span>";
              today = "<span color='#a6adc8'><b>{}</b></span>";
              days = "<span color='#555869'><b>{}</b></span>";
            };
          };
        };

        backlight = {
          device = "intel_backlight";
          format = "{icon} {percent}%";
          format-icons = [
            "󰃞"
            "󰃟"
            "󰃠"
          ];
          on-scroll-up = "brightnessctl set 1%+";
          on-scroll-down = "brightnessctl set 1%-";
          min-length = 6;
        };

        battery = {
          states = {
            good = 95;
            warning = 30;
            critical = 20;
          };
          format = "{icon} {capacity}%";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          format-alt = "{time} {icon}";
          format-icons = [
            "󰂃"
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
        };

        "bluetooth" = {
          "format" = " {status}";
          "format-connected" = " {device_alias}";
          "format-connected-battery" = " {device_alias} {device_battery_percentage}%";
          # "format-device-preference": [ "device1", "device2" ], // preference list deciding the displayed device
          "tooltip-format" = ''
            {controller_alias}	{controller_address}

            {num_connections} connected'';
          "tooltip-format-connected" = ''
            {controller_alias}	{controller_address}

            {num_connections} connected

            {device_enumerate}'';
          "tooltip-format-enumerate-connected" = "{device_alias}	{device_address}";
          "tooltip-format-enumerate-connected-battery" =
            "{device_alias}	{device_address}	{device_battery_percentage}%";
        };

        pulseaudio = {
          format = "{icon}  {volume}%";
          tooltip = false;
          format-muted = " ";
          on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          on-scroll-up = "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 1%-";
          on-scroll-down = "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 1%+";
          scroll-step = 5;
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [
              ""
              ""
              ""
              ""
            ];
          };
        };

        "pulseaudio#microphone" = {
          format = "{format_source}";
          format-source = "";
          format-source-muted = " ";
          on-click = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
          scroll-step = 5;
          min-lenght = 5;
        };

        memory = {
          states = {
            c = 90; # critical
            h = 60; # high
            m = 30; # medium
          };
          interval = 10;
          format = "󰾆 {used}GB";
          format-m = "󰾅 {used}GB";
          format-h = "󰓅 {used}GB";
          format-c = " {used}GB";
          format-alt = "󰾆 {percentage}%";
          max-length = 10;
          tooltip = true;
          tooltip-format = "󰾆 {percentage}%\n {used:.1f}GB/{total:.1f}GB";
        };

        cpu = {
          interval = 10;
          format = "󰍛 {usage}%";
          format-alt = "{icon0}{icon1}{icon2}{icon3}";
          format-icons = [
            "▁"
            "▂"
            "▃"
            "▄"
            "▅"
            "▆"
            "▇"
            "█"
          ];
        };

        network = {
          tooltip = true;
          format-wifi = "  {essid}";
          format-ethernet = "󰈀 ";
          tooltip-format = "Network= <big><b>{essid}</b></big>\nSignal strength= <b>{signaldBm}dBm ({signalStrength}%)</b>\nFrequency= <b>{frequency}MHz</b>\nInterface= <b>{ifname}</b>\nIP= <b>{ipaddr}/{cidr}</b>\nGateway= <b>{gwaddr}</b>\nNetmask= <b>{netmask}</b>";
          format-linked = "󰈀 {ifname} (No IP)";
          format-disconnected = "󰖪 ";
          tooltip-format-disconnected = "Disconnected";
          format-alt = "<span foreground='#99ffdd'> {bandwidthDownBytes}</span> <span foreground='#ffcc66'> {bandwidthUpBytes}</span>";
          interval = 2;
        };

        inhibitor = {
          what = "idle";
          format = "{icon}";
          format-icons = {
            activated = "🌝";
            deactivated = "🌚";
          };
        };
        "custom/notification" = {
          "tooltip" = true;
          "format" = "<span size='16pt'>{icon}</span>";
          "format-icons" = {
            "notification" = "󱅫";
            "none" = "󰂜";
            "dnd-notification" = "󰂠";
            "dnd-none" = "󰪓";
            "inhibited-notification" = "󰂛";
            "inhibited-none" = "󰪑";
            "dnd-inhibited-notification" = "󰂛";
            "dnd-inhibited-none" = "󰪑";
          };
          "return-type" = "json";
          "exec-if" = "which swaync-client";
          "exec" = "swaync-client -swb";
          "on-click" = "swaync-client -t -sw";
          "on-click-right" = "swaync-client -d -sw";
          "escape" = true;
        };
      }

    ];
    style = ''
      * {
          border: none;
          border-radius: 0;
          font-family: JetBrainsMono Nerd Font, monospace;
          font-weight: bold;
          font-size: 14px;
          min-height: 0;
      }

      /* Island Left */
      #clock,
      #memory,
      #network,
      #backlight {
        background: @base;
        color: @subtext0;
        border: 0px;
        border-radius: 10px 0px 0px 10px;
        margin: 5px 0px 5px 5px;
        padding: 0px 5px 0px 10px;
      }
      #clock:hover,
      #memory:hover,
      #network:hover,
      #backlight:hover {
        background: @mauve;
        color: @crust;
        border: 0px;
        border-radius: 10px 0px 0px 10px;
        margin: 5px 0px 5px 5px;
        padding: 0px 5px 0px 10px;
      }

      /* Island Middle */
      #pulseaudio {
        background: @base;
        color: @subtext0;
        border: 0px;
        border-radius: 0px;
        margin: 5px 0px 5px 0px;
        padding: 0px 5px;
      }
      #pulseaudio:hover {
        background: @mauve;
        color: @crust;
        border: 0px;
        border-radius: 0px;
        margin: 5px 0px 5px 0px;
        padding: 0px 5px;
      }

      /* Island Right */
      #inhibitor,
      #cpu,
      #battery,
      #pulseaudio.microphone {
        background: @base;
        color: @subtext0;
        border: 0px;
        border-radius: 0px 10px 10px 0px;
        margin: 5px 5px 5px 0px;
        padding: 0px 10px 0px 5px;
      }
      #inhibitor:hover,
      #cpu:hover,
      #battery:hover,
      #pulseaudio.microphone:hover {
        background: @mauve;
        color: @crust;
        border: 0px;
        border-radius: 0px 10px 10px 0px;
        margin: 5px 5px 5px 0px;
        padding: 0px 10px 0px 5px;
      }

      /* Island Solo */
      #workspaces,
      #taskbar,
      #custom-notification,
      #tray{
        background: @base;
        color: @subtext0;
        border: 0px;
        border-radius: 10px;
        margin: 5px 5px 5px 5px;
        padding: 0px 5px;
      }
      #custom-notification:hover,
      #tray:hover{
        background: @mauve;
        color: @crust;
        border: 0px;
        border-radius: 10px;
        margin: 5px 5px 5px 5px;
        padding: 0px 5px;
      }

      .modules-left,
      .modules-right {
        margin: 0 5px;
      }

      #custom-notification,
      #custom-notification:hover{
        padding-left: 5px;
        padding-right: 8px;
      }

      window#waybar {
        background: transparent;
        color: @text;
      }

      #workspaces,
      #taskbar {
        padding: 0px;
      }

      #tray menu{
        background: @base;
        color: @subtext0;
      }

      #workspaces button,
      #taskbar button,
      #tray button{
        padding: 5px;
        color: @subtext0;
      }

      #workspaces button.active,
      #taskbar button.active{
          background: @surface0;
          color: @subtext0; 
          border-radius: 10px;
          transition: none;
          animation: none;
      }

      #workspaces button.focused,
      #taskbar button.focused{
          color: @subtext0;
          background: @surface0;
          border-radius: 10px;
      }

      #workspaces button.urgent,
      #taskbar button.urgent
      {
          color: @crust;
          background: @mauve;
          border-radius: 10px;
      }

      #workspaces button:hover,
      #taskbar button:hover{
          background: @mauve;
          color: @crust; 
          border-radius: 10px;
          transition: none;
          animation: none;
      }

    '';
  };
}
