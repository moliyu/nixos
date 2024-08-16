# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules
    ];

  # Bootloader.
  # boot.loader.systemd-boot.enable = false;
  # boot.loader.efi.canTouchEfiVariables = true;
  # boot.loader.grub.enable = true;
  # boot.loader.grub.device = "nodev";
  # boot.loader.systemd-boot.configurationLimit = 10;
  boot.loader = {
      efi = {
          canTouchEfiVariables = true;
      };
      grub = {
          enable = true;
          efiSupport = true;
          # efiInstallAsRemovable = true;
          device = "nodev";
      };
  };

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  virtualisation.vmware.guest.enable = true;

  # Enable networking
  networking.networkmanager.enable = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Set your time zone.
  time.timeZone = "Asia/Shanghai";

  # Select internationalisation properties.
  i18n.defaultLocale = "zh_CN.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "zh_CN.UTF-8";
    LC_IDENTIFICATION = "zh_CN.UTF-8";
    LC_MEASUREMENT = "zh_CN.UTF-8";
    LC_MONETARY = "zh_CN.UTF-8";
    LC_NAME = "zh_CN.UTF-8";
    LC_NUMERIC = "zh_CN.UTF-8";
    LC_PAPER = "zh_CN.UTF-8";
    LC_TELEPHONE = "zh_CN.UTF-8";
    LC_TIME = "zh_CN.UTF-8";
  };

  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-chinese-addons
    ];
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm = {
    enable = true;
    theme = "catppuccin-mocha";
    package = pkgs.kdePackages.sddm;
    wayland.enable = true;
    settings= {
      General = {
        InputMethod = "";
      };
    };
  };
  # services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver = {
    xkb = {
      layout = "cn";
      variant = "";
    };
    # windowManager.i3 = {
    #   enable = true;
    #   extraPackages = with pkgs; [
    #     dmenu #application launcher most people use
    #     i3status # gives you the default i3 status bar
    #     i3lock-color #default i3 screen locker
    #     i3blocks #if you are planning on using i3blocks over i3status
    #     xautolock
    #     polybarFull
    #     picom
    #     feh
    #     light
    #  ];
    # };
  };

  # programs.hyprland = {
  #   enable = true;
  #   xwayland.enable = true;
  # };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware = {
    pulseaudio = {
      enable = true;
      package = pkgs.pulseaudioFull;
    };
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };

  # security.rtkit.enable = true;
  # services.pipewire = {
  #   enable = true;
  #   alsa.enable = true;
  #   alsa.support32Bit = true;
  #   pulse.enable = true;
  #   # If you want to use JACK applications, uncomment this
  #   #jack.enable = true;
  #
  #   # use the example session manager (no others are packaged yet so this is enabled by default,
  #   # no need to redefine it in your config for now)
  #   #media-session.enable = true;
  # };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.doudou = {
    isNormalUser = true;
    description = "doudou";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  users.defaultUserShell = pkgs.zsh;


  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    ohMyZsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "git"
      ];
    };
  };

  programs = {
    nix-ld = {
      enable = true;
      package = pkgs.nix-ld-rs;
      libraries = with pkgs; [
        # pkgs.libGL, any other libraries your code may need...
        # See nix-alien and nix-autobahn for help finding which 
        # libraries you need to install... not sure the best way
        # to use these to find required libraries for Python packages
      ];
    };
};

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
    networkmanagerapplet
    networkmanager_dmenu
    psmisc
    catppuccin-sddm
    kdePackages.oxygen-icons
    wineWowPackages.stagingFull
    wineWowPackages.fonts
    i3ipc-glib
    xorg.xwininfo
    xdotool
    wmctrl
    # (python312.withPackages (ps: with ps; [
    #   pip
    #   i3ipc
    # ]))
    kitty
    wofi
    hyprlandPlugins.hyprexpo
    wlogout
    papirus-icon-theme
    wl-clipboard
    cliphist
    rofi-wayland
    playerctl
    pamixer
    waybar
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    wqy_microhei
    font-awesome
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "JetBrainsMono" ]; })
  ];

  services.openssh.enable = true;

  services.blueman.enable = true;

  services.v2raya.enable = true;

  services.hypridle.enable = true;

  system.stateVersion = "24.05";

}
