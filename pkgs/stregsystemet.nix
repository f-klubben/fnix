{pkgs ? import <nixpkgs> { }}:
let
    env = pkgs.python3.withPackages (py: with py; [
        pillow
        (pkgs.callPackage ./development/django.nix {})
        (pkgs.callPackage ./development/django-select2.nix {})
        (pkgs.callPackage ./development/coverage.nix {})
        (pkgs.callPackage ./development/pytz.nix {})
        (pkgs.callPackage ./development/regex.nix {})
        (pkgs.callPackage ./development/freezegun.nix {})
        (pkgs.callPackage ./development/django-debug-toolbar.nix {})
        (pkgs.callPackage ./development/requests.nix {})
        (pkgs.callPackage ./development/qrcode.nix {})
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
