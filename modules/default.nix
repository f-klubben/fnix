{lib, ...}: {
    imports = [
        ./stregsystemet.nix
    ];

    options = {
        fklub.domain = lib.mkOption {
            type = lib.types.str;
            default = "localhost";
        };
    };
}
