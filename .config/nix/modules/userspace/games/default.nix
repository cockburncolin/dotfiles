{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.custom.games;
in {
  imports = [
    ./craft.nix
  ];

  options.custom.games = {
    enable = lib.mkEnableOption "Install game launchers";
  };

  config = lib.mkIf cfg.enable {
    programs = {
      steam = {
        enable = true;
        gamescopeSession.enable = true;
        protontricks.enable = true;
        extraCompatPackages = with pkgs; [
          proton-ge-bin
        ];
      };
    };
  };
}
