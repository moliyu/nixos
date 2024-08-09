{ inputs, config, pkgs, ... }:
{
  imports = [
    inputs.hyprland.homeManagerModules.default
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
  };
}
