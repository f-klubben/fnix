{pkgs ? import <nixpkgs> {}, lib ? pkgs.lib}:

pkgs.python3Packages.buildPythonPackage rec {
	pname = "django_select2";
	version = "8.1.2";
	format = "pyproject";	

	src = pkgs.fetchPypi {
		inherit pname version;
		sha256 = "sha256-9EaF7hw5CQqt4B4+vCVnAvBWIPPHijwmhECtmmYHCHY=";
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
		flit-scm
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

