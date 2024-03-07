{pkgs, ...}: 
let
    stregsystemet = pkgs.callPackage ../pkgs/stregsystemet {};
    portmap = import ./portmap.nix {};
in {
    systemd.services.stregsystemet = {
        enable = true;
        serviceConfig = {
            ExecStart = "${stregsystemet}/bin/stregsystemet testserver ${stregsystemet}/share/stregsystemet/stregsystem/fixtures/testdata.json --addrport ${portmap.domain}:${portmap.ports.stregsystemet}";
        };
        wantedBy = [ "default.target" ];
    };
}
