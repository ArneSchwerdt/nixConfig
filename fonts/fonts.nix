{ pkgs, ... }:
let nerdfont = pkgs.callPackage ./nerdfont{ fonts = [ "FiraCode" ]; }; in
{
  fonts.fonts = with pkgs; [
    fira-code
    fira-code-symbols
    font-awesome
  ] ++ [ nerdfont ];
}
