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
    kernelParams = [ "resume_offset=12550144" ];
    resumeDevice = "/dev/disk/by-uuid/6db45830-dbd2-4599-8965-c6d8b6c71bba";
    plymouth.enable = true;
  };

  networking.networkmanager.plugins = [ pkgs.networkmanager-fortisslvpn ];
  powerManagement.enable = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  users.users.martin = {
    isNormalUser = true;
    description = "Martin";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "mauve";
    cache.enable = true;
    sddm.enable = true;
    grub.enable = true;
    tty.enable = true;
    plymouth.enable = true;
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "martin" = {
        imports = [
          ./home.nix
          inputs.catppuccin.homeModules.catppuccin
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
    vscode-fhs
    #clipboard
    # wl-clipboard

    # hyprpicker
    # hyprlock
    # hypridle
    # wlogout
    # grimblast

    (import ../../modules/nixos/spotify.nix { inherit pkgs; })

    wasistlos

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

    zotero
    blender
    atril

    xauth
    signal-desktop

    bat

    dbeaver-bin
  ];

  services = {
    # gnome.gnome-keyring.enable = true;
    blueman.enable = true;
    locate.enable = true;
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    logind.settings.Login = {
      HandlePowerKey = "hibernate";
      HandleLidSwitch = "suspend-then-hibernate";
    };
    onedrive.enable = true;
    udisks2.enable = true;

  };
  security = {
    polkit.enable = true;
    rtkit.enable = true;
  };
  programs = {
    direnv.enable = true;
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
  };

  hardware.bluetooth.enable = true;
  hardware.graphics.enable = true;

  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 16 * 1024;
    }
  ];

  system.stateVersion = "25.05";

  my.modules = {
    profile = "yoga";
    ssh.profile = "desktop";
  };

}
