{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
}:

stdenvNoCC.mkDerivation rec {
  pname = "posy-cursors-scalable";
  version = "1.3";

  src = fetchFromGitHub {
    owner = "Morxemplum";
    repo = "posys-cursor-scalable";
    tag = version;
    hash = "sha256-tbNMFTam2msn3z+COLr/CWXEVIuLR/6o/uaNF3kzs38=";
  };

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/icons
    cp -r plasma_themes/posys_* $out/share/icons
    runHook postInstall
  '';

  meta = {
    description = "Posy's Improved Cursors for Hyprcursor";
    homepage = "https://github.com/Morxemplum/posys-cursor-scalable";
    platforms = lib.platforms.unix;
    license = lib.licenses.cc-by-nc-40;
  };
}
