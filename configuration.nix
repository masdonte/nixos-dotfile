# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, home-manager, ... }:

{
	imports =
		[ # Include the results of the hardware scan.
		./hardware-configuration.nix

		];

	nix.settings.experimental-features = [ "nix-command" "flakes"];

	nixpkgs.config.allowUnfree = true;

	home-manager = {
		extraSpecialArgs = {inherit inputs;};
		users = {
			"reda" = import ./home-manager/home.nix;
		};
	};


	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	networking.hostName = "nixos"; # Define your hostname.
		networking.networkmanager.enable = true;


	time.timeZone = "Europe/Paris";


	i18n.defaultLocale = "fr_FR.UTF-8";
	console = {
		font = "Lat2-Terminus16";
		keyMap = "fr";
	};


	programs.hyprland = {
		enable = true;
		xwayland.enable = true;
		withUWSM = true;
	};

	services.printing.enable = true;

# Enable sound.
# hardware.pulseaudio.enable = true;
# OR
	services.pipewire = {
		enable = true;
		pulse.enable = true;
	};

  users = {
    defaultUserShell = "/etc/profiles/per-user/reda/bin/zsh";
    users.reda = {
      isNormalUser = true;
      createHome = true;
      home = "/home/reda";
      extraGroups = [ "wheel" "users" "audio" "video" "adbusers" ];
    };
  };




# Some programs need SUID wrappers, can be configured further or are
# started in user sessions.
# programs.mtr.enable = true;
# programs.gnupg.agent = {
#   enable = true;
#   enableSSHSupport = true;
# };

# List services that you want to enable:

# Enable the OpenSSH daemon.
	services.openssh.enable = true;

# Open ports in the firewall.
# networking.firewall.allowedTCPPorts = [ ... ];
# networking.firewall.allowedUDPPorts = [ ... ];
# Or disable the firewall altogether.
	networking.firewall.enable = false;

# Copy the NixOS configuration file and link it from the resulting system
# (/run/current-system/configuration.nix). This is useful in case you
# accidentally delete configuration.nix.
# system.copySystemConfiguration = true;

# This option defines the first version of NixOS you have installed on this particular machine,
# and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
#
# Most users should NEVER change this value after the initial install, for any reason,
# even if you've upgraded your system to a new NixOS release.
#
# This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
# so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
# to actually do that.
#
# This value being lower than the current NixOS release does NOT mean your system is
# out of date, out of support, or vulnerable.
#
# Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
# and migrated your data accordingly.
#
# For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
	system.stateVersion = "24.11"; # Did you read the comment?

}

