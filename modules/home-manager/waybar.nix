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
          "pulseaudio"
          "pulseaudio#microphone"
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

      window#waybar {
        background: rgba(21, 18, 27, 0);
          color: @text;
      }

      #workspaces button,
      #taskbar button{
          padding: 5px;
          color: @overlay2;
          margin-right: 5px;
      }

      #workspaces button.active,
      #taskbar button.active{
          color: @accent;
      }

      #workspaces button.focused,
      #taskbar button.focused{
          color: @subtext0;
          background: @accent;
          border-radius: 10px;
      }

      #workspaces button.urgent,
      #taskbar button.urgent
      {
          color: @crust;
          background: @green;
          border-radius: 10px;
      }

      #workspaces button:hover,
      #taskbar button:hover
      {
          background: @text;
          color: @crust; 
          border-radius: 10px;
      }

      #window,
      #clock,
      #inhibitor,
      #battery,
      #pulseaudio,
      #network,
      #cpu,
      #memory,
      #workspaces,
      #tray,
      #backlight,
      #taskbar{
          background: @base;
          padding: 0px 10px;
          margin: 3px 0px;
          margin-top: 5px;
          /* border: 1px solid #181825; */
      }

      #backlight {
          border-radius: 10px 0px 0px 10px;
      }

      #tray {
          border-radius: 10px;
          margin-right: 10px;
      }

      #workspaces {
          background: @base;
          border-radius: 10px;
          margin-left: 10px;
          padding-right: 0px;
          padding-left: 5px;
      }

      #cpu {
          border-radius: 0px 10px 10px 0px;
          margin-right: 10px;
      }

      #memory {
          border-radius: 10px 0px 0px 10px;
      }

      #window {
          border-radius: 10px;
          margin-left: 60px;
          margin-right: 60px;
      }

      #taskbar {
          background: @base;
          border-radius: 10px;
          margin-left: 10px;
          padding-right: 0px;
          padding-left: 5px;

      } 
      #clock {
          color: @subtext0;
          border-radius: 10px 0px 0px 10px;
          margin-left: 5px;
          border-right: 0px;
      }
      #inhibitor {
          color: @subtext0;
          border-radius: 0px 10px 10px 0px;
      }

      #network {
          color:  @subtext0;
          border-radius: 10px 0px 0px 10px;

      }

      #pulseaudio {
          color: @subtext0;
          border-left: 0px;
          border-right: 0px;
      }

      #pulseaudio.microphone {
          color: @subtext0;
          border-radius: 0px 10px 10px 0px;
          border-left: 0px;
          border-right: 0px;
          margin-right: 5px;
      }

      #battery {
          color: @subtext0;
          border-radius: 0px 10px 10px 0px;
          margin-right: 10px;
      }

    '';
  };
}
