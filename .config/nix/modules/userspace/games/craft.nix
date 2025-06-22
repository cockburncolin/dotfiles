{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.custom.games.craft;
in {
  options.custom.games.craft.enable = lib.mkEnableOption "Install Minecraft launcher";

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      prismlauncher
      jdk
    ];
  };
}
