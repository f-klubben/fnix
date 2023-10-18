{
	pkgs ? import <nixpkgs> {}
}:
let env = (pkgs.python3.withPackages (pythonPackages: with pythonPackages; [
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
	version = "v2.4.4";
	
	src = pkgs.fetchgit {
		url = "https://github.com/f-klubben/stregsystemet";
		sha256 = "sha256-4RQGGZBkDL/X4bX6WZuRDM//am0iSdMrptFFr8kQ0ak=";
	};
	
	installPhase = ''
		mkdir -p $out/bin
		mkdir -p $out/usr/share/stregsystemet
		sed -i '47 i 1=192.168.122.92' treo/settings.py
		mv ./* $out/usr/share/stregsystemet
		echo "${env.interpreter} $out/usr/share/stregsystemet/manage.py" > $out/bin/stregsystemet
		chmod +x $out/bin/stregsystemet
	'';
}
