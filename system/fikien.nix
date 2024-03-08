{config, ...}: let 
in {
    services.dokuwiki.sites."${config.fklub.domain}" = {
        enable = true;
        settings = {
            title = "test wiki";
            useacl = true;
        };
    };
}
