{pkgs ? import <nixpkgs> {}, lib ? pkgs.lib}:

pkgs.python3Packages.buildPythonPackage rec {
	pname = "django-select2";
    name = "django-select2";
    version = "5.11.1";
	format = "pyproject";	

	src = pkgs.fetchPypi {
        pname="Django-Select2"; 
        version="5.11.1"; 
        sha256="sha256-Srw862EZFa/ggKC5jmIG05iN0d3pN+OtXpzxGXk66xk=";
    };
	doCheck = false;
	propagatedBuildInputs = with pkgs.python3Packages; [
		sphinx
		pytest-runner
		setuptools_scm
		django-appconf
		pytest
		selenium
		flit-scm
	];
}

