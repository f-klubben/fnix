{pkgs ? import <nixpkgs> {}}:

pkgs.python3Packages.buildPythonPackage {
    pname = "freezegun";
    version = "0.3.15";
    src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/17/5d/1b9d6d3c7995fff473f35861d674e0113a5f0bd5a72fe0199c3f254665c7/freezegun-0.3.15-py2.py3-none-any.whl";
        sha256 = "1cl9xzg793d272f9dvxlgjf17nczfzbdgsxzfvhs6z3wbfh5giw2";
    };
    format = "wheel";
    doCheck = false;
    buildInputs = [];
    checkInputs = [];
    nativeBuildInputs = [];
    propagatedBuildInputs = [
      (pkgs.callPackage ./python-dateutil.nix {})
      (pkgs.callPackage ./six.nix {})
    ];
}
