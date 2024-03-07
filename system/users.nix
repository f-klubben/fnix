{ ... }:

let
    users = {};
    userDefaults = {};
in {
    users.motd = builtins.readFile ../files/motd.txt;

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
        hashedPassword = "$6$rounds=2000000$htFKKf65jcKCw09Z$JNmYnL5lIBZP6dvqYXUmj0vzzaiRteXOwlJzkcYcRCYdT5Zt8TVJWvtT4w4Q8suBneVOLEjxsMIf0yEY4BDrz1";
    };
}
