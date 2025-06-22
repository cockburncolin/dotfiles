{
  config,
  lib,
  ...
}: {
  imports = [
    ./dracula.nix
    ./qt.nix
  ];

  config = {
    custom.themes.dracula.enable = lib.mkDefault true;
  };
}
