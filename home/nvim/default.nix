{ config, lib, pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
      # Telescope
      ripgrep
    ];
  };

  xdg.configFile."nvim/lua".source = ./lua;
  xdg.configFile."nvim/init.lua".text = ''
    require("config.lazy")
  '';
}
