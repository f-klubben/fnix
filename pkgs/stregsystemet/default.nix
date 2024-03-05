{pkgs ? import <nixpkgs> {}}:
let
    env = pkgs.python3.withPackages (py: with py; [
        pillow
        (pkgs.callPackage ./dependencies/django.nix {})
        (pkgs.callPackage ./dependencies/django-select2.nix {})
        (pkgs.callPackage ./dependencies/coverage.nix {})
        (pkgs.callPackage ./dependencies/pytz.nix {})
        (pkgs.callPackage ./dependencies/regex.nix {})
        (pkgs.callPackage ./dependencies/freezegun.nix {})
        (pkgs.callPackage ./dependencies/django-debug-toolbar.nix {})
        (pkgs.callPackage ./dependencies/requests.nix {})
        (pkgs.callPackage ./dependencies/qrcode.nix {})
    ]);

in pkgs.stdenv.mkDerivation {
	pname = "stregsystemet";
    name = "stregsystemet";
	
	src = pkgs.fetchFromGitHub {
		owner = "f-klubben";
		repo = "stregsystemet";
		rev = "af0efd806ae743b0e8a9639376c4a31b81d61cd2";
		sha256 = "sha256-0IwvGMyVd91h7bECTEqL2XydVewJZC+soctLnzTFASo=";
	};
	
	installPhase = ''
		mkdir -p $out/bin
		mkdir -p $out/share/stregsystemet

        cp local.cfg.skel local.cfg
        echo "${env.interpreter} $out/share/stregsystemet/manage.py \$@" > $out/bin/stregsystemet
        sed -i '1 i #!${pkgs.bash}/bin/bash' $out/bin/stregsystemet
        chmod +x $out/bin/stregsystemet

        sed -i '1d' manage.py

		cp ./* $out/share/stregsystemet -r
	'';
}
