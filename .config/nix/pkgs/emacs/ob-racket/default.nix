{
  lib,
  fetchFromGitHub,
  stdenv,
  racket,
  emacs,
}:
stdenv.mkDerivation rec {
  pname = "emacs-ob-racket";
  version = "1.3.0";

  src = fetchFromGitHub {
    owner = "hasu";
    repo = "${pname}";
    rev = "c7b7eee58fcde2ad515b72288742e555e7ec7915";
    hash = "sha256-yv+PP1JyEvMxEToNbgDbgWih/GHdauwfYLzPaEPsEC8=";
  };

  buildInputs = [racket emacs];

  buildPhase = ''
    ${racket}/bin/raco make ob-racket-runtime.rkt
  '';

  installPhase = let
    outDir = "$out/share/emacs/site-lisp/${pname}-${version}";
  in ''
    mkdir -p ${outDir}
    cp -r $src/*.el ${outDir}
    cp -r $src/*.rkt ${outDir}
  '';

  meta = with lib; {
    description = "Emacs Org-Mode Babel code block Racket support";
    license = licenses.gpl3;
    platforms = platforms.all;
    homepage = "https://github.com/hasu/emacs-ob-racket";
  };
}
