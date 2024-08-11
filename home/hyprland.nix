{config, inputs, pkgs, ...}:
{
  imports = [
     inputs.hyprland.homeManagerModules.default
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.variables = ["--all"];
  };

  programs.waybar.enable = true;
}
