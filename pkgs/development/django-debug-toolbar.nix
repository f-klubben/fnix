{pkgs ? import <nixpkgs> {}, ...}:

pkgs.python3Packages.buildPythonPackage {
    pname = "django-debug-toolbar";
    name = "django-debug-toolbar";
    version = "1.11.1";
    src = pkgs.fetchPypi {
        pname = "django-debug-toolbar";
        version = "1.11.1";
        sha256 = "sha256-EPXvWcl/rTS4A7AuWFC2QiCC4uRFRMLsA/607u4PkVg=";
    };
    doCheck = false;
}
