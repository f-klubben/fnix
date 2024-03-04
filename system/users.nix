{ ... }:

let
    users = {};
    userDefaults = {};
in {
    users.users.tobias = {
        isNormalUser = true;
        description = "Tobias";
        extraGroups = [ "wheel" ];
        initialPassword = "password";
    };
    
    users.users.mast3r = {
        isNormalUser = true;
        description = "Thomas";
        extraGroups = [ "wheel" ];
        initialPassword = "password";
    };
}
