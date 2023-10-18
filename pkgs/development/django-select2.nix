{pkgs ? import <nixpkgs> {}, lib ? pkgs.lib}:

pkgs.python3Packages.buildPythonPackage rec {
	pname = "django-select2";
	version = "7.11.1";
	
	src = pkgs.fetchPypi {
		inherit pname version;
		sha256 = "sha256-bFZ0nKXdEb6aeKCGEIaXMXDGBazicSbBCfPXIs6jwy4=";
	};
	doCheck = false;
	propagatedBuildInputs = with pkgs.python3Packages; [
		sphinx
		pytest-runner
		setuptools_scm
		django
		django-appconf
		pytest
		selenium
	];
	checkInputs = with pkgs.python3Packages; [
		sphinx
		pytest-runner	
		setuptools_scm
		setuptools
		django
		django-appconf
		pytest
		selenium
	];
}

