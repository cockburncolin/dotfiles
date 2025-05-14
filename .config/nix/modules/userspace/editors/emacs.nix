{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.custom.emacs;
in {
  options = {
    custom.emacs.enable = lib.mkEnableOption "Enable emacs";
  };

  config = lib.mkIf cfg.enable {
    services.emacs = {
      enable = true;
      install = true;
      defaultEditor = true;
      package = pkgs.emacsWithPackagesFromUsePackage {
        config = /home/colin/.config/emacs/config.org;
        package = pkgs.emacs-gtk;
        alwaysEnsure = true;
        alwaysTangle = true;
        extraEmacsPackages = epkgs:
          with epkgs; [
            pkgs.ob-racket
            tree-sitter
            tree-sitter-langs
            treesit-grammars.with-all-grammars
            use-package
            vterm
          ];
      };
    };
  };
}
