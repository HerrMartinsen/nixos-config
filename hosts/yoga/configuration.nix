{
  pkgs,
  inputs,
  ...
}:

{
  imports = [ ./hardware-configuration.nix ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    # kernelParams = [ "resume_offset=12550144" ];
    # resumeDevice = "/dev/disk/by-uuid/6db45830-dbd2-4599-8965-c6d8b6c71bba";
    plymouth.enable = true;
    kernelPackages = pkgs.linuxKernel.packages.linux_6_18;
  };

  networking.networkmanager.plugins = [ pkgs.networkmanager-fortisslvpn ];
  # networking.firewall.enable = false; for screen casting
  powerManagement.enable = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nix.settings = {
    substituters = [
      "https://cache.nixos.org/"
      "https://nix-community.cachix.org"
      "https://ros.cachix.org"
      "https://noctalia.cachix.org"
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "ros.cachix.org-1:dSyZxI8geDCJrwgvCOHDoAfOm5sV1wCPjBkKL+38Rvo="
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
    ];
  };

  users.users.martin = {
    isNormalUser = true;
    description = "Martin";
    extraGroups = [
      "networkmanager"
      "wheel"
      "input"
    ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "martin" = {
        imports = [
          ./home.nix
          inputs.noctalia.homeModules.default
        ];
      };
    };
    backupFileExtension = "backup";
  };

  nixpkgs.config.allowUnfree = true;

  environment.variables = {
    NIXOS_OZONE_WL = "1";
    EDITOR = "hx";
  };

  environment.systemPackages = with pkgs; [
    htop
    btop
    unzip
    wget
    wireguard-tools
    # kitty
    # rofi
    # pavucontrol
    # waybar
    # libnotify
    # hyprpaper
    kdePackages.dolphin
    nautilus
    # brightnessctl
    # networkmanagerapplet
    #desktop portal for now
    # xdg-desktop-portal-gtk
    #for gui with elevated privlages
    # hyprpolkitagent
    #clipboard
    # wl-clipboard

    # hyprpicker
    # hyprlock
    # hypridle
    # wlogout
    # grimblast
    karere
    spotify-player

    yazi

    zulip
    feh
    gimp3
    playerctl
    magic-wormhole-rs
    obsidian

    # ntfs3g
    # udiskie
    openfortivpn

    helix

    # zotero
    blender
    atril

    xauth
    signal-desktop

    bat

    # dbeaver-bin
    # basex

    comma

    remmina

    qt6Packages.qtstyleplugin-kvantum
    adwaita-icon-theme

    claude-code
    inputs.claude-desktop-nix.packages.x86_64-linux.default
    microfetch
  ];

  services = {
    avahi.enable = true;
    blueman.enable = true;
    gnome.gnome-keyring.enable = true;
    locate.enable = true;
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    onedrive.enable = true;
    udisks2.enable = true;

  };
  security = {
    polkit.enable = true;
    rtkit.enable = true;
  };
  programs = {
    atuin = {
      enable = true;
      settings.auto_sync = false;
    };
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
    nix-index.enable = true;
    bash = {
      interactiveShellInit = ''
        source ${pkgs.nix-index}/etc/profile.d/command-not-found.sh
        microfetch
      '';
    };
    firefox.enable = true;
    thunderbird.enable = true;
    git.enable = true;
    steam.enable = true;
    nh = {
      enable = true;
      clean = {
        enable = true;
        extraArgs = "--keep-since 2d --keep 3";
      };
      flake = "/home/martin/nixos-config"; # sets NH_OS_FLAKE variable for you
    };
    noctalia-greeter = {
      enable = true;
      package = inputs.noctalia-greeter.packages.${pkgs.stdenv.hostPlatform.system}.default;
    };
    seahorse.enable = true;
    spicetify =
      let
        spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
      in
      {
        enable = true;
        theme = spicePkgs.themes.catppuccin;
        colorScheme = "mocha";
        spotifyLaunchFlags = "--enable-features=UseOzonePlatform --ozone-platform=wayland";
        enabledExtensions = with spicePkgs.extensions; [
          catJamSynced
        ];
      };
    ssh = {
      extraConfig = "
        Host github.com
          HostName github.com
          User git
          IdentityFile ~/.ssh/id_ed25519_yoga_nixos
          IdentitiesOnly yes
        
        Host gitlab.oth-regensburg.de
          HostName gitlab.oth-regensburg.de
          User git
          IdentityFile ~/.ssh/id_ed25519_yoga_nixos
          IdentitiesOnly yes
        
        Host gralab-05
          HostName gralab-05.oth-regensburg.de
          IdentityFile ~/.ssh/id_ed25519_yoga_nixos
          ForwardX11 yes
          XAuthLocation /run/current-system/sw/bin/xauth
        
        Host im-kigs
          HostName im-kigs.oth-regensburg.de
          IdentityFile ~/.ssh/id_ed25519_yoga_nixos
    ";
    };
    starship.enable = true;
  };

  hardware.bluetooth.enable = true;
  hardware.graphics.enable = true;

  # swapDevices = [
  #   {
  #     device = "/var/lib/swapfile";
  #     size = 16 * 1024;
  #   }
  # ];

  system.stateVersion = "25.05";

  my.modules = {
    profile = "yoga";
    ssh.profile = "desktop";
    office.enable = false;
  };
  my.overlays.spotify-wayland.enable = false;

}
