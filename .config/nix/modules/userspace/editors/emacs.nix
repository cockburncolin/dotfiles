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
      package = pkgs.emacsWithPackagesFromUsePackage {
        # Emacs package from overlay
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

    # Additional packages to install
    environment.systemPackages = with pkgs; [
      hunspell # spell check + dictionaries
      hunspellDicts.en_CA
      hunspellDicts.en_US
      ghostscript # for pdfs in docview-mode
      (pkgs.texlive.combine {
        inherit
          (pkgs.texlive)
          scheme-basic
          dvisvgm
          dvipng
          wrapfig
          amsmath
          ulem
          hyperref
          capt-of
          moderncv
          ;
      })
    ];
  };
}
