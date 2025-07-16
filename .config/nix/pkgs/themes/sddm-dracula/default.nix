{
  stdenvNoCC,
  lib,
  qtbase,
  qtsvg,
  qtquickcontrols2,
  qtgraphicaleffects,
  fetchFromGitHub,
}:
stdenvNoCC.mkDerivation {
  name = "sddm-dracula";

  src = fetchFromGitHub {
    owner = "denismhz";
    repo = "sddm-sugar-dracula";
    rev = "300e6b4faca811af9671942e77180f24dba33345";
    sha256 = "087nal7gw3170ayigbg5j5z0cadph8nwkdaip20mi0xcv71c811r";
  };

  propagatedBuildInputs = [
    qtsvg
    qtquickcontrols2
    qtgraphicaleffects
  ];

  dontWrapQtApps = true;

  installPhase = let
    basePath = "$out/share/sddm/themes/sddm-dracula";
  in ''
    mkdir -p ${basePath}
    cp -R $src/* ${basePath}
  '';
}
