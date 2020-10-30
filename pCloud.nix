{ pkgs, config, ... }:
{
	home-manager.users.arne = {
		home.packages = [ pkgs.rclone ];
		systemd.user.services = {
			"pCloud" = {
				Unit = {
					Description = "Sync personal data to pCloud";
				};
				Service = {
					Type = "simple";
					WorkingDirectory = "%h";
					ExecStart = "${pkgs.rclone}/bin/rclone -L --include Passwörter.kdbx copy pCloud pCloud:";
					Restart = "no";
				};
				Install = {
					WantedBy = ["multi-user.target"];
				};
			};
		};
		systemd.user.timers = {
			"pCloud" = {
				Unit = {
					Description = "pCloud sync timer";
				};
				Timer = {
					OnBootSec = "5min";
					OnUnitActiveSec = "30min";
				};
				Install = {
					WantedBy = ["timers.target"];
				};
			};
		};
	};
}
