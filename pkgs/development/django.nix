{pkgs ? import <nixpkgs> {},...}:
pkgs.python3Packages.buildPythonPackage {
    pname = "Django";
    name = "Django";
    version = "2.2.28";
    format = "pyproject";
    src = pkgs.fetchPypi {
        pname = "Django";
        version = "2.2.28";
        sha256 = "sha256-AgC2V6+/G8CAA4Rd3aBTx2QbmySVHlKs1R9qvaM6dBM=";
    };
    propagatedBuildInputs = [pkgs.python3Packages.setuptools];
}
