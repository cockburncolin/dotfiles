{pkgs, ...}: {
  grub-dracula = pkgs.callPackage ./grub-dracula {};
  sddm-dracula = pkgs.callPackage ./sddm-dracula {};
}
