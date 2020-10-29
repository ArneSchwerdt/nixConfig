{ pkgs ? import <nixpkgs> {} }:
pkgs.stdenv.mkDerivation {
  name = "rclone";
  src = pkgs.fetchzip {
    url = "https://github.com/rclone/rclone/releases/download/v1.53.1/rclone-v1.53.1-linux-amd64.zip";
    sha256 = "11qx9x8gbicm1fvsq0bfbsczpmj4cb0ipbfkz7ky8qiis540pyhf";
  };
  phases = ["installPhase" "patchPhase"];
  installPhase = ''
    mkdir -p $out/bin
    cp $src/rclone $out/bin/rclone
    chmod +x $out/bin/rclone
  '';
}
