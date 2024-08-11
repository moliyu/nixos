{ config, inputs, pkgs, ... }:

{
  imports = [
    ./nvim
    # ./hyprland.nix
  ];
  home.username = "doudou";
  home.homeDirectory = "/home/doudou";
  home.packages = with pkgs;[
    neofetch
    vscode
    fnm
    # clash-verge-rev
    gcc
    # rofi
    alacritty
    fira-code-nerdfont
    lazygit
    microsoft-edge
    (python312.withPackages (p: with p; [
      pip
      i3ipc
    ]))
    catppuccin-kvantum
    qt6Packages.qtstyleplugin-kvantum
    dconf-editor
    gsettings-qt
  ];

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName  = "moliyu";
    userEmail = "951028382@qq.com";
    extraConfig = {
      credential.helper = "store";
    };
  };
  
  programs.neovim = {
    enable = true;
  };

  # programs.neovim.plugins = [
  #   pkgs.vimPlugins.nvim-treesitter
  # ];

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initExtra = ''
      eval "$(fnm env --use-on-cd)"
    '';
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "git"
      ];
    };
  };

  qt = {
    enable = true;
    platformTheme = "qtct";
  };
  
  gtk = {
    enable = true;
    font = {
      name = "Firacode Nerd Font Mono";
      size = 11;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "mocha";
        accent = "lavender";
      };
    };
    theme = {
      name = "Dracula";
      package = pkgs.dracula-theme;
    };
    cursorTheme = {
      name = "Nordzy-cursors";
      package = pkgs.nordzy-cursor-theme;
      size = 22;
    };
  };

  

  xdg.configFile."rofi".source = ./rofi;
  xdg.configFile."i3".source = ./i3;
  xdg.configFile."polybar".source = ./polybar;
  xdg.configFile."alacritty".source = ./alacritty;
  xdg.configFile."pictures".source = ./pictures;
  xdg.configFile."dunst".source = ./dunst;
  xdg.dataFile."fcitx5/themes".source = ./fcitx-theme;
  xdg.configFile."hypr".source = ./hypr;
  xdg.configFile."waybar".source = ./waybar;
  xdg.configFile."ags".source = ./ags;
  xdg.configFile."wofi".source = ./wofi;
}
