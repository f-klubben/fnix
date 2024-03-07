{pkgs, ...}: let
    portmap = import ./portmap.nix {};

    defaultListen = [{ port = 80; addr = "${portmap.domain}"; }];

in {
    services.nginx = {
        enable = true;
        virtualHosts = {
            # Fikien
            "${portmap.domain}" = {
                listen = defaultListen;
            };
            # Stregsystemet
            "stregsystem.${portmap.domain}" = {
                listen = defaultListen;

                locations."/" = {
                    proxyPass = "http://localhost:${portmap.ports.stregsystemet}/";
                };
            };
            # it will only run on localhost, its for debugging
            "routing.localhost" = {
                listen = [{ port = 80; addr = "localhost"; }];
                locations."/".index = "${pkgs.writeText "index.html" ''
                    <div style="text-align: center;">
                        <h3>F-Klubben | Routing</h3>
                        <a href="http://${portmap.domain}/">Fikien</a><br>
                        <a href="http://stregsystem.${portmap.domain}/">Stregsystemet</a>
                    </div>
                ''}";
                root = "/.";
            };
        };
    };
}
