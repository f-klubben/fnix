{ pkgs, ... }:

{

    imports = [
        ./programs.nix
        ./users.nix
        ./nginx.nix
        ./fikien.nix
        ./mailserver.nix

        ../modules
    ];

    networking.hostName = "fklub";
    networking.networkmanager.enable = true; # Manages network access
    networking.firewall.allowedTCPPorts = [ 
        22  #ssh
        80  #http
        25  #smtp
        143 #imap
        443 #https
        587 #submission
        
    ];

    services.sshd.enable = true;

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

    virtualisation.vmVariant.virtualisation.forwardPorts = [
        { from = "host"; host.port = 2222; guest.port = 22;  }
        { from = "host"; host.port = 80; guest.port = 80;  }
        { from = "host"; host.port = 25;   guest.port = 25;  }
        { from = "host"; host.port = 143;  guest.port = 143; }
    ];

    # #FRITFIT (custom shiz)
    services.stregsystemet.enable = true;
}
