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
      emacs.enable = true;
      games.enable = true;
      wifi.enable = true;
      wm.enable = true;
    };
  };
}
