pkgs: let
  emacsPkgs = import ./emacs {inherit pkgs;};
  fontPkgs = import ./fonts {inherit pkgs;};
  scriptPkgs = import ./scripts {inherit pkgs;};
  serverPkgs = import ./server {inherit pkgs;};
  themePkgs = import ./themes {inherit pkgs;};
in
  emacsPkgs // fontPkgs // scriptPkgs // serverPkgs // themePkgs
