{
  config,
  pkgs,
  osConfig,
  ...
}:

{

  imports = [
    ../../modules/home-manager/hyprland.nix
    ../../modules/home-manager/catppuccin.nix
    #../../modules/home-manager/firefox.nix
    ../../modules/home-manager/helix.nix
    ../../modules/home-manager/kitty.nix
    ../../modules/home-manager/dunst.nix
    ../../modules/home-manager/waybar.nix
  ];

  home.username = "martin";
  home.homeDirectory = "/home/martin";
  home.stateVersion = "25.05";
  home.packages = [

  ];

  programs.vim = {
    enable = true;
    extraConfig = ''
      set tabstop=2
      set shiftwidth=2
      set expandtab
      set number
      set clipboard=unnamedplus
      set mouse=a
    '';
  };

  nixpkgs = {
    overlays = osConfig.nixpkgs.overlays;
    config.allowUnfree = true;
  };
  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/martin/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
