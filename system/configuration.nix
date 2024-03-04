{ pkgs, ... }:

{
    imports = [
        ./programs.nix
        ./users.nix
    ];

    networking.hostName = "fklub";
    networking.networkmanager.enable = true; # Manages network access

    time.timeZone = "Europe/Copenhagen";

    i18n.defaultLocale = "en_DK.UTF-8";

    # In case we need to access the terminal directly
    console.keyMap = "dk-latin1";

    # This determines the NixOS release from which certain default settings are
    # taken, like file locations and database versions. Things may break if this
    # is changed without manual intervention. As such, it is perfectly fine and
    # recommended to leave this value at the release version of when this system
    # was first set up. See:
    # https://search.nixos.org/options?show=system.stateVersion
    system.stateVersion = "23.11"; # Read comment before changing!
}
