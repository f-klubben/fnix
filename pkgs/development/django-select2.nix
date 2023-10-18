{
	pkgs ? import <nixpkgs> { system = builtins.currentSystem;},
	lib ? pkgs.lib,
	python3Packages ? pkgs.python3Packages,
	fetchFromGitHub ? pkgs.fetchFromGitHub,
}:

python3Packages.buildPythonPackage rec {
	pname = "django-select2";
	version = "8.1.2";
	
	src = fetchFromGitHub {
		owner = "codingjoe";
		repo = "django-select2";
		rev = "${version}";
		sha256 = "sha256-0/W4TRkY10vMfSReOu/cZsDb5F0NeA+pxVw6z5YfdB0=";
	};
}

