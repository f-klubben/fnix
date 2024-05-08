{pkgs, lib, config, ...}: {
    options = {
        fklub.matrix.port = lib.mkOption {
            type = lib.types.int;
            default = 6167;
        };
        fklub.matrix.enable = lib.mkOption {
            type = lib.types.bool;
            default = false;
        };
    };

    config.services.matrix-conduit = {
        enable = config.fklub.matrix.enable;
        settings.global.port = config.fklub.matrix.port;
        settings.global.server_name = config.fklub.domain;
        settings.global.database_backend = "rocksdb";
        settings.global.allow_registration = true;
    };
}