{ config, pkgs, ... }:
let
	home-manager = builtins.fetchGit {
		url = "https://github.com/nix-community/home-manager.git";
		rev = "abaebf3b346c4bef500c5bd2fdebbed109261a0c"; 
		ref = "release-20.09";
	};
in
{
		imports = [
			(import "${home-manager}/nixos")
		];
}
