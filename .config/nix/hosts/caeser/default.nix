# template for hosts
{...}: {
  imports = [
    ../common
    ./hardware-config.nix
  ];

  config = {
    networking.hostName = "caeser";
    time.timeZone = "America/Vancouver";

    # Custom modules
    custom = {
      userspace.bluetooth.enable = true;
      emacs.enable = true;
      games.enable = true;
      games.craft.enable = true;
      sddm.enable = true;
      wifi.enable = true;
      wm.enable = true;
    };
  };
}
