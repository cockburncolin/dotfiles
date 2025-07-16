{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.custom.tailscale;
in {
  options.custom.tailscale = {
    enable = lib.mkEnableOption "Enable tailscale VPN";
    # mode for endpoint routing
    routingMode = lib.mkOption {
      default = "client";
      description = "Can be either client, server or both for using exit nodes";
    };
  };

  config = lib.mkIf cfg.enable {
    services.tailscale = {
      enable = true;
      useRoutingFeatures = cfg.routingMode;
    };
  };
}
