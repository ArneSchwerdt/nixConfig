{ stdenv, fetchFromGitHub, ... }:
  stdenv.mkDerivation rec {
    pname = "zsh-geometry-theme";
    version = "2.2.0";

    src = fetchFromGitHub {
      owner = "geometry-zsh";
      repo = "geometry";
      rev = "v${version}";
      sha256 = "0sy5v3id31k4njr5pamh4hx238x0pcpgi0yh90jpbci690i8vdab";
    };

    installPhase = ''
      mkdir -p $out/share/geometry-theme
      cp -R ./* $out/share/geometry-theme
    '';
  }
