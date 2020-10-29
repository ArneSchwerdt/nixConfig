{ pkgs, ... }:
let geometry = pkgs.callPackage ./geometry.nix{}; in
{
	imports = [ ./tools.nix ];
	home-manager.users.arne = {
		programs.zsh.enable = true;
		home.packages =  [
			pkgs.zsh-history-substring-search
			pkgs.zsh-syntax-highlighting
			geometry
		];

		programs.zsh.history.size = 10000;
		programs.zsh.enableCompletion = true;
		programs.zsh.shellAliases = {
			sv="sudo -E nvim";
			vi="nvim";
			vim="nvim";
			c="clear";
			rmf="rm -rf";
			srmf="sudo rmf";
			mkdir="mkdir -p";

			rebuild="sudo nixos-rebuild switch -I nixos-config=/home/arne/nix-config/configuration.nix";
			rebuildtest="sudo nixos-rebuild test -I nixos-config=/home/arne/nix-config/configuration.nix";
			upgrade="rebuild --upgrade";
			zshc="vim ~/nix-config/shell/zsh.nix && rebuild";
			swayc="vim ~/";
			kittyc="vim ~/.config/kitty/kitty.conf";
			vimc="nvim ~/.config/nvim/init.vim";
			waybarc="sv /etc/xdg/waybar/config";
			waybars="sv /etc/xdg/waybar/style";
			sshc="vim ~/.ssh/config";

			ls="exa --icons";
			ll="exa --icons -l";
			la="exa --icons -a";
			tree="exa --icons -T";

			screload="systemctl daemon-reload";
			scstatus="systemctl status";
			scstart="sudo systemctl start";
			scstop="sudo systemctl stop";
			scautostart="sudo systemctl enable";
			scnoautostart="sudo systemctl disable";
			scureload="systemctl --user daemon-reload";
			scustatus="systemctl --user status";
			scustart="systemctl --user start";
			scustop="systemctl --user stop";
			scuautostart="systemctl --user enable";
			scunoautostart="systemctl --user disable";
			jc="journalctl";
			jcunit="journalctl -u";
			jcu="journalctl --user";
			jcuunit="journalctl --user -u";
			suspend="systemctl suspend";

			sc="sc-im";

			uglist="sudo usbguard list-devices";
			ugallow="sudo usbguard allow-device";
			ugblock="sudo usbguard block-device";

			gs="git status --short";
			ga="git add";
			gc="git commit";

			windows="sudo efibootmgr -n 7 && reboot";
		};

		programs.zsh.initExtra = ''
			zstyle ':completion:*' completer _complete _correct _approximate
			unsetopt correct_all
			setopt auto_cd

			alias -s {zip,ZIP,rar,RAR,rpm}="7z l"
			alias uz='(){ 7z -o./$1:t:r e $1 > /dev/null }'

			# Plugins
			## Edit command in vim
			export VISUAL=vim
			autoload -z edit-command-line
			zle -N edit-command-line
			bindkey ^E edit-command-line

			## History substring plugin
			source ${pkgs.zsh-syntax-highlighting}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

			## Substring search
			source ${pkgs.zsh-history-substring-search}/share/zsh-history-substring-search/zsh-history-substring-search.zsh
			bindkey '^[[A' history-substring-search-up
			bindkey '^[[B' history-substring-search-down
			bindkey "$terminfo[kcuu1]" history-substring-search-up
			bindkey "$terminfo[kcud1]" history-substring-search-down
			## Geometry theme
			source ${geometry}/share/geometry-theme/geometry.zsh
		'';
	};
}
