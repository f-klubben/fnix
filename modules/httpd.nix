{pkgs, ...}: let
    domain = "fklub.dk";

in {
    services.httpd = {
        enable = true;
        virtualHosts = {
            localhost = {
                listen = [
                    {
                        port = 80;
                        ip = "*";
                    }
                ];
                locations."/" = {
                    proxyPass = "http://localhost:8000/";
                };
            };
            #localhost = {
            #    listen = [
            #        {
            #            port = 80;
            #            ip = "*";
            #        }
            #    ];
            #    locations."/" = {
            #        proxyPass = "http://localhost:8081/";
            #    };
            #};
            
        };
    };
}
