{ ... }:

{
  programs.kitty = {
    enable = true;

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 12;
    };
    extraConfig = ''
      bold_font auto
      italic_font auto
      bold_italic_font auto
      background_opacity 0.6
      window_padding_width 8
      confirm_os_window_close 0
      enable_image_protocol yes
      enable_audio_bell no
      tab_bar_style powerline
      tab_bar_edge top

      map ctrl+shift+t launch --cwd=current --type=tab
    '';
  };
}
