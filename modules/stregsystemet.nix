{config, pkgs, lib, ...}: 
let
    stregsystemet = pkgs.callPackage ../pkgs/stregsystemet {};

    cfg = config.services.stregsystemet;

in {
    options = {
        services.stregsystemet.port = lib.mkOption {
            type = lib.types.int;
            default = 8080;
        };
        services.stregsystemet.command = lib.mkOption {
            type = lib.types.str;
            default = "testserver";
        };
        services.stregsystemet.args = lib.mkOption {
            type = lib.types.listOf lib.types.str;
            default = [ "${stregsystemet}/share/stregsystemet/stregsystem/fixtures/testdata.json" ];
        };
        services.stregsystemet.enable = lib.mkOption {
            type = lib.types.bool;
            default = false;
        };
    };
    config = {
        systemd.services.stregsystemet = {
            enable = cfg.enable;
            serviceConfig = {
                ExecStart = "${stregsystemet}/bin/stregsystemet ${cfg.command} ${lib.concatStringsSep " " cfg.args} --addrport ${config.domain}:${builtins.toString cfg.port}";
            };
            wantedBy = [ "default.target" ];
        };
    };
}
