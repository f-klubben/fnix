{config, pkgs, ...}:
{
    services.nginx = {
        enable = true;
        virtualHosts = {
            # Fikien
            "${config.domain}" = {
                listen = [{ addr = "localhost"; } { addr = "*"; }];
            };
            # Stregsystemet
            "stregsystem.${config.domain}" = {
                listen = [{ addr = "localhost"; } { addr = "*"; }];
                locations."/" = {
                    proxyPass = "http://localhost:${builtins.toString config.services.stregsystemet.port}/";
                };
            };
            # it will only run on localhost, its for debugging
            "routing.localhost" = {
                listen = [{ addr = "localhost"; }];
                locations."/".index = "${pkgs.writeText "index.html" ''
                    <div style="text-align: center;">
                        <h3>F-Klubben | Routing</h3>
                        <a href="http://${config.domain}/">Fikien</a><br>
                        <a href="http://stregsystem.${config.domain}/">Stregsystemet</a>
                    </div>
                ''}";
                root = "/.";
            };
        };
    };
}
