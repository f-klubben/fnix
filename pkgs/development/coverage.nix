{pkgs ? import <nixpkgs> {}}: 
pkgs.python3Packages.buildPythonPackage {
    pname = "coverage";
    name = "coverage";
    version = "4.1";
    src = pkgs.fetchPypi {
        pname = "coverage";
        version = "4.1";
        sha256 = "sha256-QWMrXiwOxRDkwPHw8CpwJHfR+DdpOWQ5BVNTkhfJKwc=";
    };
    doCheck = false;
}
