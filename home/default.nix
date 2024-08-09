{ config, pkgs, ... }:

{
  imports = [
    ./nvim
  ];
  home.username = "doudou";
  home.homeDirectory = "/home/doudou";
  home.packages = with pkgs;[
    neofetch
    vscode
    fnm
    # clash-verge-rev
    gcc
    rofi
    alacritty
    fira-code-nerdfont
    lazygit
    microsoft-edge
    (python312.withPackages (p: [
      p.material-color-utilities
      p.pywayland
      pip
      i3ipc
    ]))
  ];

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;

  programs.ags = {
    enable = true;
    configDir = null; # if ags dir is managed by home-manager, it'll end up being read-only. not too cool.
    # configDir = ./.config/ags;

    extraPackages = with pkgs; [
      gtksourceview
      gtksourceview4
      ollama
      python312Packages.material-color-utilities
      python312Packages.pywayland
      pywal
      sassc
      webkitgtk
      webp-pixbuf-loader
      ydotool
    ];
  };
  
  programs.git = {
    enable = true;
    userName  = "zeyu";
    userEmail = "123@qq.com";
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

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  xdg.configFile."rofi".source = ./rofi;
  xdg.configFile."i3".source = ./i3;
  xdg.configFile."polybar".source = ./polybar;
  xdg.configFile."alacritty".source = ./alacritty;
  xdg.configFile."pictures".source = ./pictures;
  xdg.configFile."dunst".source = ./dunst;
  xdg.dataFile."fcitx5/themes".source = ./fcitx-theme;
  xdg.configFile."hypr".source = ./hypr;
}
