{lib, ...}: {
    imports = [
        ./stregsystemet.nix
    ];

    options = {
        domain = lib.mkOption {
            type = lib.types.str;
            default = "localhost";
        };
    };
}
