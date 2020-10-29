{ config, pkgs, lib, ... }:
{

  programs.sway = {
    enable = true;
    extraPackages = with pkgs; [
      kitty
      swaylock
      swayidle
      xwayland
      wofi
			waybar
		];
  };

	home-manager.users.arne = {
		xdg.configFile = {
			"sway/config".source = ./sway/config;
			"sway/wallpapers".source = ./sway/wallpapers;
			"waybar/config".source = ./waybar/config;
			"waybar/style.css".source = ./waybar/style.css;
			"kitty/kitty.conf".source = ./kitty/kitty.conf;
			"wofi/style.css".source = ./wofi/style.css;
		};
	};

  environment = {
    loginShellInit = ''
      [[ "$(tty)" == /dev/tty1 ]] && sway
    '';
  };

  nixpkgs.config.pulseaudio = true;
}
