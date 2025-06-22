{
  fileSystems = {
    "/mnt/nfs" = {
      device = "192.168.1.10:/volume2/Media";
      fsType = "nfs";
      options = [
        "x-systemd.automount"
        "noauto"
        "x-systemd.ide-timeout=600"
      ];
    };

    "/mnt/ereader" = {
      device = "/dev/disk/by-uuid/63F3-BC98";
      fsType = "vfat";
      options = [
        "noauto"
        "uid=colin"
        "gid=users"
      ];
    };

    "/mnt/usb-mass-storage" = {
      device = "/dev/disk/by-uuid/87BB-07CE";
      fsType = "vfat";
      options = [
        "noauto"
        "uid=colin"
        "gid=users"
      ];
    };
  };

  # optional, but ensures rpc-statsd is running for on demand mounting
  boot.supportedFilesystems = ["nfs"];
}
