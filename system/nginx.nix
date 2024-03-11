{config, pkgs, ...}:
{
    services.nginx = {
        enable = true;
        virtualHosts = {
            # Fikien
            "${config.fklub.domain}" = {
                listen = [{ addr = "localhost"; } { addr = "*"; }];
            };
            # Stregsystemet
            "stregsystem.${config.fklub.domain}" = {
                listen = [{ addr = "localhost"; } { addr = "*"; }];
                locations."/" = {
                    proxyPass = "http://localhost:${builtins.toString config.services.stregsystemet.port}/";
                };
            };
            # it will only run on localhost, its for debugging. Listens on "*" to
            # be accessible outside of VM
            "routing.localhost" = {
                listen = [{ addr = "localhost"; } { addr = "*"; }];
                locations."/".index = "${pkgs.writeText "index.html" ''
                    <div style="text-align: center;">
                        <h3>F-Klubben | Routing</h3>
                        <a href="http://${config.fklub.domain}/">Fikien</a><br>
                        <a href="http://stregsystem.${config.fklub.domain}/">Stregsystemet</a>
                    </div>
                ''}";
                root = "/.";
            };
        };
    };
}
