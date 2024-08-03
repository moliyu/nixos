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
    clash-verge-rev
    gcc
    rofi
    alacritty
    polybar
    fira-code-nerdfont
    picom
    feh
    python3
    lazygit
  ];

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
  
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

  xdg.configFile."rofi".source = ./rofi;
  xdg.configFile."i3".source = ./i3;
  xdg.configFile."polybar".source = ./polybar;
  xdg.configFile."alacritty".source = ./alacritty;
  xdg.configFile."pictures".source = ./pictures;
  xdg.configFile."dunst".source = ./dunst;
}
