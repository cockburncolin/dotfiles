{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.custom.eww;
in {
  options.custom.eww = {
    enable = lib.mkEnableOption "Enable EWW widgets";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [pkgs.eww];

    systemd.user.services = {
      eww-bar = {
        enable = true;
        description = "open eww top-bar";
        after = ["graphical-session.target"];
        wantedBy = ["graphical-session.target"];
        serviceConfig = {
          Type = "exec";
          ExecStart = "${pkgs.eww}/bin/eww open top-bar";
          ExecStop = "${pkgs.eww}/bin/eww close top-bar";
          RemainAfterExit = "yes";
        };
      };
    };
  };
}
