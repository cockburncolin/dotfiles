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
      fonts.enable = true;
      games.craft.enable = true;
      games.enable = true;
      utils = {
        packetTracer.enable = true;
      };
      media = {
        kodi.enable = false;
        bluray.enable = true;
      };
      sddm.enable = true;
      userspace.bluetooth.enable = true;
      wifi.enable = true;
      wm.enable = true;
    };
  };
}
