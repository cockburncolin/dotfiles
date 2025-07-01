{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.custom.media.kodi;
in {
  options = {
    custom.media.kodi = {
      enable = lib.mkEnableOption "Enable Kodi Media player";
      desktop = lib.mkEnableOption "Create Kodi desktop entry and auto launch";
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      (pkgs.kodi-wayland.withPackages (kodiPkgs:
        with kodiPkgs; [
          jellyfin
	  youtube
        ]))
    ];
  };
}
