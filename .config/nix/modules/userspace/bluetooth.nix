{config, lib, pkgs, ...}:
let
  cfg = config.custom.userspace.bluetooth;
in
  {
    options.custom.userspace.bluetooth.enable = lib.mkEnableOption "Enable bluetooth";

    config = lib.mkIf cfg.enable {
      hardware. bluetooth = {
	enable = true;
	powerOnBoot = true;
      };

      # GUI for managing devices
      services.blueman.enable = true;
    };
  }
