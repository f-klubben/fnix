{pkgs ? import <nixpkgs> {}}:

pkgs.python3Packages.buildPythonPackage {
    pname = "Pillow";
    version = "8.3.2";
    src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/90/d4/a7c9b6c5d176654aa3dbccbfd0be4fd3a263355dc24122a5f1937bdc2689/Pillow-8.3.2.tar.gz";
        sha256 = "1361y215ydmdh4il1vay5831aqivmpwgzjqrphqjdiq0ipnz7qyx";
    };
    format = "setuptools";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [];
}
