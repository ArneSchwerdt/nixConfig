{ pkgs, ... }:
{
	home-manager.users.arne = {
		programs.chromium.enable = true;
		home.packages = with pkgs; [
			chromium keepassxc
		];
	};
}
