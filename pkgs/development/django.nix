{pkgs ? import <nixpkgs> {},...}:
pkgs.python3Packages.buildPythonPackage {
    pname = "Django";
    version = "2.2.28";
    src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/43/69/eaac9a827335898d626066989865974fa48bfc23efd1b34628d64543b2d9/Django-2.2.28-py3-none-any.whl";
        sha256 = "0ibai90rcrjrgng5c8aw9nqa04qwbvs7kahmp91fndhkgk82jm1n";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [
        (pkgs.callPackage ./pytz.nix {})
        (pkgs.callPackage ./sqlparse.nix {})
    ];
}
