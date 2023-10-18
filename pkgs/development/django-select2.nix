{pkgs ? import <nixpkgs> {}, lib ? pkgs.lib}:

pkgs.python3Packages.buildPythonPackage rec {
	pname = "django-select2";
	version = "8.1.2";
	
	src = pkgs.fetchFromGitHub {
		owner = "codingjoe";
		repo = "django-select2";
		rev = "${version}";
		sha256 = "sha256-0/W4TRkY10vMfSReOu/cZsDb5F0NeA+pxVw6z5YfdB0=";
	};
	checkInputs = with pkgs.python3Packages; [
		sphinx
		pytest-runner	
		setuptools_scm
		setuptools
	];
}

