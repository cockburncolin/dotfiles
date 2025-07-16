{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.custom.media.bluray;
in {
  options = {
    custom.media.bluray.enable = lib.mkEnableOption "Install software for Bluray disks";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      handbrake
      libaacs
      makemkv
    ];
  };
}
