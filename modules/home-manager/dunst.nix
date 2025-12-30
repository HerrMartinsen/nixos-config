{ pkgs, ... }:

{
  services.dunst = {
    enable = true;

    settings = {
      global = {
        follow = "mouse";
        indicate_hidden = "yes";

        offset = "10x10";

        notification_height = 0;
        separator_height = 2;

        padding = 8;
        horizontal_padding = 8;
        frame_width = 2;

        text_icon_padding = 0;
        line_height = 0;

        sort = "yes";
        idle_threshold = 120;
        markup = "full";
        alignment = "left";
        vertical_alignment = "center";
        show_age_threshold = 60;
        word_wrap = "yes";
        stack_duplicates = true;
        hide_duplicate_count = false;

        show_indicators = "yes";

        min_icon_size = 0;
        max_icon_size = 64;

        icon_path =
          let
            papirus = "${pkgs.papirus-icon-theme}/share/icons/Papirus-Dark/16x16";
          in
          "${papirus}/status/:"
          + "${papirus}/devices/:"
          + "${papirus}/actions/:"
          + "${papirus}/animations/:"
          + "${papirus}/apps/:"
          + "${papirus}/categories/:"
          + "${papirus}/emblems/:"
          + "${papirus}/emotes/:"
          + "${papirus}/devices/mimetypes:"
          + "${papirus}/panel/:"
          + "${papirus}/places/";

        dmenu = "/usr/bin/rofi -dmenu -p dunst:";
        browser = "/usr/bin/firefox --new-tab";

        title = "Dunst";
        class = "Dunst";

        corner_radius = 10;
        timeout = 5;

      };
    };
  };
}
