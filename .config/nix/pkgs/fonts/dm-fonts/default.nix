{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
}:
stdenvNoCC.mkDerivation {
  pname = "dm-fonts";
  version = "v5.003";

  src = fetchFromGitHub {
    owner = "googlefonts";
    repo = "dm-fonts";
    rev = "4412393b7d2de9fe7a92064c2dce9b5af5d7fd26";
    hash = "sha256-Zh5YBQaMKSnOHLK9XNj5+ExQY0357GTsbYOvi1Q87+0=";
  };

  installPhase = ''
    runHook preInstall

    install -m644 --target $out/share/fonts/truetype -D ./Sans/Exports/*.ttf
    install -m644 --target $out/share/fonts/truetype -D ./Serif/Exports/*.ttf

    runHook postInstall
  '';

  meta = {
    description = "DM Suite of fonts, both Sans and Serif";
    homepage = "https://github.com/googlefonts/dm-fonts";
    license = lib.licenses.ofl;
  };
}
