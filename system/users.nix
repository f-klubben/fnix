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
}
