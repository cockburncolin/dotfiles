{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.custom.wm;
in {
  imports = [./eww.nix];

  options.custom.wm = {
    enable = lib.mkEnableOption "Enable GUI";
  };

  config = lib.mkIf cfg.enable {
    custom.eww.enable = lib.mkDefault true;
    environment.systemPackages = with pkgs; [
      tmux
      hyprpaper
      hyprshade
      mako # notification system developed by swaywm maintainer
      sddm-dracula
      wl-clipboard
      wofi
    ];

    services.xserver.enable = true;

    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
      withUWSM = true;
    };

    # Enable the gnome-keyring secrets vault.
    # Will be exposed through DBus to programs willing to store secrets.
    services.gnome.gnome-keyring.enable = true;

    # user services
    systemd.user.services = {
      hyprpaper = {
        enable = true;
        description = "hyprpaper is a fast, IPC-controlled wallpaper utility for Hyprland";
        after = ["graphical-session.target"];
        wantedBy = ["graphical-session.target"];
        serviceConfig = {
          Type = "exec";
          ExecStart = "${pkgs.hyprpaper}/bin/hyprpaper";
          RemainAfterExit = "yes";
        };
      };
      
      hyprshade = {
        enable = true;
        description = "Hyprland shader configuration tool";
        after = ["graphical-session.target"];
        wantedBy = ["graphical-session.target"];
        serviceConfig = {
          Type = "exec";
          ExecStart = "${pkgs.hyprshade}/bin/hyprshade auto";
          RemainAfterExit = "yes";
        };
      };
    };
  };
}
