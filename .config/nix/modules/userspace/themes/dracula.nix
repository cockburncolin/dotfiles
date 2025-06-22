{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.custom.themes.dracula;
in {
  options.custom.themes.dracula.enable = lib.mkEnableOption "Install Dracula theme items";

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      dracula-icon-theme
      dracula-qt5-theme
      dracula-theme
    ];
  };
}
