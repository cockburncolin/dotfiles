{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.custom.utils.packetTracer;
in {
  options = {
    custom.utils.packetTracer.enable = lib.mkEnableOption "Enable Cisco Packettracer";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      (ciscoPacketTracer8.override {
        packetTracerSource = ../../../pkgs/binaries/packet-tracer/Packet_Tracer822_amd64_signed.deb;
      })
    ];
  };
}
