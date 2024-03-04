{pkgs ? import <nixpkgs> {}, ...}:

pkgs.python3Packages.buildPythonPackage {
    pname = "requests";
    name = "requests";
    version = "2.24.0";
    src = pkgs.fetchPypi {
        pname = "requests";
        version = "2.24.0";
        sha256 = "sha256-s1WaEx23LDPulpSAhA//S7bdER3n3SfI7h+CD08AIxs=";
    };
    doCheck = false;
}
