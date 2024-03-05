{pkgs, ...}: 
let
    stregsystemet = pkgs.callPackage ../pkgs/stregsystemet {};

in {
    systemd.services.stregsystemet = {
        enable = true;
        serviceConfig = {
            ExecStart = "${stregsystemet}/bin/stregsystemet testserver ${stregsystemet}/share/stregsystemet/stregsystem/fixtures/testdata.json";
        };
        wantedBy = [ "default.target" ];
    };
}
