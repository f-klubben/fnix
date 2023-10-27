{
	imports = [
		./hardware-configuration.nix
		./setup
		./services
		./users
	];

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;
}
