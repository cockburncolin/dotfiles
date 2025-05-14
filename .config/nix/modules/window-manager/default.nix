{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.custom.wm;
in {
  options.custom.wm = {
    enable = lib.mkEnableOption "Enable GUI";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      tmux
      hyprpaper
      eww
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
          Type = "simple";
          ExecStart = "${pkgs.hyprpaper}/bin/hyprpaper";
        };
      };
    };
  };
}
