{config, ...}: let 
in {
    services.dokuwiki.sites."${config.domain}" = {
        enable = true;
        settings = {
            title = "test wiki";
            useacl = true;
        };
    };
}
