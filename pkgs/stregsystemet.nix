{
	pkgs ? import <nixpkgs> {},
	fetchFromGitHub ? pkgs.fetchFromGitHub
}:
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
	version = "v2.4.4";
	
	src = pkgs.fetchgit {
		url = "https://github.com/f-klubben/stregsystemet";
		sha256 = "sha256-4RQGGZBkDL/X4bX6WZuRDM//am0iSdMrptFFr8kQ0ak=";
	};
	
	installPhase = ''
		mkdir -p $out/bin
		mkdir -p $out/usr/share/stregsystemet
		sed -i '27,28d;31,36d;39,44d;47,48d;51,55d' treo/settings.py
		
		sed -i '35 i HANDLERS = ["console"]' treo/settings.py
		sed -i '35 i LEVEL = DEBUG' treo/settings.py
		sed -i '35 i FILE = /tmp/stregsystem.log' treo/settings.py
		sed -i '32 i ENGINE = django.db.backends.sqlite3' treo/settings.py
		sed -i '32 i HOST =' treo/settings.py
		sed -i '32 i PORT =' treo/settings.py
		sed -i '32 i NAME = db.sqlite3' treo/settings.py
		sed -i '32 i USER =' treo/settings.py
		sed -i '32 i PASSWORD =' treo/settings.py
		sed -i '29 i debug = True' treo/settings.py
		sed -i '29 i CSRF_COOKIE_SECURE = False' treo/settings.py
		sed -i '29 i CSRF_COOKIE_HTTPONLY = False' treo/settings.py
		sed -i '29 i SESSION_COOKIT_SECURE = False' treo/settings.py
		sed -i '29 i SECURE_BROWSER_XSS_FILTER = False' treo/settings.py
		sed -i '29 i SECURE_CONTENT_TYPE_NOSNIFF = False' treo/settings.py
		sed -i '27 i SECRET_KEY=_SECRET_' treo/settings.py
		sed -i '27 i X_FRAME_OPTIONS = SAMEORIGIN' treo/settings.py

		mv ./* $out/usr/share/stregsystemet
		echo "#!/bin/bash
		${env.interpreter} $out/usr/share/stregsystemet/manage.py" > $out/bin/stregsystemet
		chmod +x $out/bin/stregsystemet
	'';
}
