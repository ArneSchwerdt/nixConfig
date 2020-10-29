{ lib, ... }:
{
  networking.hostName = "apcDesktop"; # Define your hostname.
  networking.nameservers = [ "9.9.9.9" ];
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.wireless.networks = {
		${builtins.readFile ./ssid} = {
			psk = builtins.readFile ./pw;
		};
#		"Albert-WG" = {
#			psk = "Albert-WGh1917Zi";
#		};
  };

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp5s0.useDHCP = true;
  networking.interfaces.wlp0s18f2u3.useDHCP = true;
}
