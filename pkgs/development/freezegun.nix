{pkgs ? import <nixpkgs> {}}:

pkgs.python3Packages.buildPythonPackage {
    pname = "freezegun";
    name = "freezegun";
    version = "0.3.15";
    src = pkgs.fetchPypi {
        pname = "freezegun";
        version = "0.3.15";
        sha256 = "sha256-4gYvLH+VzCdqg0wi8aFxeUZxdrYkzG+TbovDvlU1rRs=";
    };
    doCheck = false;
}
