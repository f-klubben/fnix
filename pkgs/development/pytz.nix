{pkgs ? import <nixpkgs> {}, ...}:

pkgs.python3Packages.buildPythonPackage {
    pname = "pytz";
    name = "pytz";
    version = "2021.3";
    src = pkgs.fetchPypi {
        pname = "pytz";
        version = "2021.3";
        sha256 = "sha256-rK0tiyChrwfU5MnS6ShcXtkQQ1QGLydfP82I3O9PEyY=";
    };
    doCheck = false;
}
