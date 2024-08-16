{ config, pkgs, ... }:
{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment.systemPackages = with pkgs; [
    kdePackages.qtwayland
    kdePackages.gwenview
    nautilus
    kdePackages.dolphin
    hyprpaper
    socat
    xdotool
    dunst
    toastify
    hyprshot
    lutris
  ]; 


  xdg = {
   portal = {
      xdgOpenUsePortal = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-hyprland
        pkgs.xdg-desktop-portal-gtk
      ];
   };
 };
}
