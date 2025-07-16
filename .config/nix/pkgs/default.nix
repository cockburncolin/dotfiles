pkgs: let
  qt5 = pkgs.libsForQt5;
in
{
  dm-fonts = pkgs.callPackage ./fonts/dm-fonts {};
  kubero-cli = pkgs.callPackage ./server/kubero-cli {};
  grub-dracula = pkgs.callPackage ./themes/grub-dracula {};
  sddm-dracula = qt5.callPackage ./themes/sddm-dracula {};
}
