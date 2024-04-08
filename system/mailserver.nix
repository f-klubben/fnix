{config, ...}: {
    imports = [(builtins.fetchTarball {
        url = "https://gitlab.com/simple-nixos-mailserver/nixos-mailserver/-/archive/nixos-23.05/nixos-mailserver-nixos-23.05.tar.gz";
        sha256 = "sha256:1ngil2shzkf61qxiqw11awyl81cr7ks2kv3r3k243zz7v2xakm5c";
    })];
    
    mailserver = {
        enable = true;
        fqdn = "mail.${config.fklub.domain}";
        domains = [config.fklub.domain];
        loginAccounts."fit@${config.fklub.domain}" = {
            hashedPasswordFile = ../files/passwd/fit.pw;
            aliases = ["postmaster@${config.fklub.domain}"];
        };

        certificateScheme = "acme-nginx";
    };
    security.acme = {
        acceptTerms = true;
        defaults.email = "security@${config.fklub.domain}";
    };
}
