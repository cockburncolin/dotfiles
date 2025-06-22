{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.custom.themes.qt;
in {
  options.custom.themes.qt.enable = lib.mkEnableOption "Enable QT platform";

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      libsForQt5.qtstyleplugin-kvantum
      libsForQt5.qt5ct
    ];
    nixpkgs.config.qt5 = {
      enable = true;
      platformTheme = "qt5ct";
      style = {
        package = pkgs.dracula-qt5-theme;
        name = "Dracula Theme";
      };
    };
  };
}
