{ pkgs, ... }:
#let rclone = pkgs.callPackages ./rclone.nix{};
#in
{
  imports = [ ./vim.nix ];
	home-manager.users.arne = {
    home.packages = with pkgs; [
      exa ranger unzip wget
    ];
		xdg.configFile = {
			"ranger/rc.conf".source = ./ranger/rc.conf;
      "ranger/rifle.conf".source = ./ranger/rifle.conf;
		};
		programs.git = {
			enable = true;
			userName  = "Arne Schwerdt";
			userEmail = "arneschwerdt@gmail.com";
		};
	};
}
