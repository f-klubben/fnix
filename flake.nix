{
    description = "NixOS setup for F-Klubben";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    };

    outputs = { self, nixpkgs }: let
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
    in {
        nixosConfigurations.fklub-test = nixpkgs.lib.nixosSystem {
            inherit system;
            modules = [
                ./system/configuration.nix
                {
                    fklub.domain = "localhost";
                }
            ];
        };
        nixosConfigurations.fklub-prod = nixpkgs.lib.nixosSystem {
            inherit system;
            modules = [
                ./system/configuration.nix
                {
                    fklub.domain = "fklub.dk";
                }
            ];
        };

        packages."${system}".stregsystemet = pkgs.callPackage ./pkgs/stregsystemet {};
    };
}
