# template for hosts
{...}: {
  imports = [
    ../common
    ./hardware-config.nix
  ];

  config = {
    networking.hostName = "brutus";
    time.timeZone = "America/Vancouver";
    age.identityPaths = ["/home/colin/.ssh/id_ed25519"];

    # Custom modules
    custom = {
      emacs.enable = true;
      fonts.enable = true;
      media.kodi.enable = true;
      sddm.enable = true;
      userspace.bluetooth.enable = true;
      wifi.enable = true;
      wm.enable = true;
    };
  };
}
