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
					Type = "oneshot";
					WorkingDirectory = "%h";
					ExecStart = "/sbin/rclone -L --include Passwörter.kdbx copy pCloud remote:";
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
