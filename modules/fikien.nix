let 
    portmap = import ./portmap.nix {};
in {
    services.dokuwiki.sites."${portmap.domain}" = {
        enable = true;
        settings = {
            title = "test wiki";
            useacl = true;
        };
    };
}
