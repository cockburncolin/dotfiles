{pkgs, ...}: {
  ob-racket = pkgs.callPackage ./emacs/ob-racket {};
  get-aacs-keys = pkgs.callPackage ./scripts/get-aacs-keys {};
  dm-fonts = pkgs.callPackage ./fonts/dm-fonts {};
  kubero-cli = pkgs.callPackage ./server/kubero-cli {};
  grub-dracula = pkgs.callPackage ./themes/grub/grub-dracula {};
  sddm-dracula = pkgs.libsForQt5.callPackage ./themes/sddm-dracula {};
}
