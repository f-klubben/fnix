{
	pkgs ? import <nixpkgs> {},
	fetchFromGitHub ? pkgs.fetchFromGitHub,
	lib ? pkgs.lib
}:
with lib;
let 
	django-select2 = pkgs: pkgs.callPackage ./development/django-select2.nix {};
	env = (pkgs.python3.withPackages (pythonPackages: with pythonPackages; [
		(django-select2 pkgs)
		django
		pillow
		coverage
		pytz
		regex
		freezegun
		django-debug-toolbar
		requests
		qrcode
	]));
in
pkgs.stdenv.mkDerivation rec {
	pname = "stregsystemet";
	version = "2.4.5";
	
	src = pkgs.fetchFromGitHub {
		owner = "f-klubben";
		repo = "stregsystemet";
		rev = "v${version}";
		sha256 = "sha256-CpwUOEPNBzxUrcBqwKxQK1oWMAA1N3G0PpRJ/iZGmOc=";
	};
	
	installPhase = ''
		mkdir -p $out/bin
		mkdir -p $out/usr/share/stregsystemet
		cat > local.cfg << EOF
[general]

[debug]

[database]

[hostnames]
EOF
		sed -i '1 i #!${env.interpreter}' manage.py

		cp ./* $out/usr/share/stregsystemet -r
		ln -s $out/usr/share/stregsystemet/manage.py $out/bin/stregsystemet
		#mkdir -p /opt/stregsystemet
		#touch /opt/stregsystemet/data.json
		#touch /opt/stregsystemet/db.sqlite3
	'';
}
