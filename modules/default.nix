{lib, ...}: {
    imports = [
        ./stregsystemet.nix
        ./nginx.nix
        ./fikien.nix
    ];

    options = {
        fklub.domain = lib.mkOption {
            type = lib.types.str;
            default = "localhost";
        };
    };
}
