{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.custom.sddm;
in {
  # module options
  options.custom.sddm = {
    enable = lib.mkEnableOption "Enable SDDM display manager";
  };

  config = lib.mkIf cfg.enable {
    services.displayManager.sddm = {
      enable = true;
      package = lib.mkForce pkgs.libsForQt5.sddm;
      autoNumlock = true;
      wayland.enable = true;
      theme = "${pkgs.sddm-dracula}/share/sddm/themes/sddm-dracula";
      extraPackages = with pkgs; [
        libsForQt5.qtgraphicaleffects
        libsForQt5.qtquickcontrols2
        libsForQt5.qtsvg
      ];
    };
  };
}
